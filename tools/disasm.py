#!/usr/bin/env python3
"""Mighty Final Fight (U) - CDL driven disassembler producing ca65 sources.

  python tools/disasm.py [--rom ROM] [--cdl CDL] [--out DIR] [--build]

Inputs : ROM (.nes), CDL (FCEUX), tools/labels/ram.txt, tools/labels/rom.txt
Outputs: src/bank_XX.asm, src/main.asm, src/defines.inc, src/ram.inc, src/chr.asm,
         config.cfg, assemble.bat, compare.bat, header.bin, docs/coverage.txt, mff.mlb
CHR is handled by tools/chr_tool.py (run automatically unless --no-chr).
"""
import argparse
import os
import re
import subprocess
import sys
from collections import defaultdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from opcodes import OPS, BRANCHES, STORES  # noqa: E402

BANK_SIZE = 0x2000
NBANKS = 16
FILL_MIN = 8            # identical-byte runs of at least this length become .res
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

MMC3_REGS = {0x8000: 'MMC3_BANK_SELECT', 0x8001: 'MMC3_BANK_DATA', 0xA000: 'MMC3_MIRRORING',
             0xA001: 'MMC3_PRG_RAM', 0xC000: 'MMC3_IRQ_LATCH', 0xC001: 'MMC3_IRQ_RELOAD',
             0xE000: 'MMC3_IRQ_DISABLE', 0xE001: 'MMC3_IRQ_ENABLE'}
HW_REGS = {0x2000: 'PPUCTRL', 0x2001: 'PPUMASK', 0x2002: 'PPUSTATUS', 0x2003: 'OAMADDR',
           0x2004: 'OAMDATA', 0x2005: 'PPUSCROLL', 0x2006: 'PPUADDR', 0x2007: 'PPUDATA',
           0x4000: 'SQ1_VOL', 0x4001: 'SQ1_SWEEP', 0x4002: 'SQ1_LO', 0x4003: 'SQ1_HI',
           0x4004: 'SQ2_VOL', 0x4005: 'SQ2_SWEEP', 0x4006: 'SQ2_LO', 0x4007: 'SQ2_HI',
           0x4008: 'TRI_LINEAR', 0x400A: 'TRI_LO', 0x400B: 'TRI_HI',
           0x400C: 'NOISE_VOL', 0x400E: 'NOISE_LO', 0x400F: 'NOISE_HI',
           0x4010: 'DMC_FREQ', 0x4011: 'DMC_RAW', 0x4012: 'DMC_START', 0x4013: 'DMC_LEN',
           0x4014: 'OAMDMA', 0x4015: 'SNDCHN', 0x4016: 'JOY1', 0x4017: 'JOY2'}
RESERVED = {o[0].lower() for o in OPS.values()} | {'a', 'x', 'y', 's', 'z'}


def base_of(b):
    return 0xC000 if b == 14 else 0xE000 if b == 15 else (0x8000 if b % 2 == 0 else 0xA000)


# ----------------------------------------------------------------------------- label files
def parse_addr(s):
    return int(s.replace('$', '').replace('0x', ''), 16)


def load_ram_labels(path):
    names = {}                      # addr -> (name, size, comment)
    if not os.path.exists(path):
        return names
    for ln, line in enumerate(open(path, encoding='utf-8'), 1):
        code, _, comment = line.partition(';')
        parts = code.split()
        if not parts:
            continue
        addr, name = parse_addr(parts[0]), parts[1]
        size = int(parts[2], 0) if len(parts) > 2 else 1
        if name.lower() in RESERVED or not re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', name):
            sys.exit('%s:%d bad RAM name %r' % (path, ln, name))
        names[addr] = (name, size, comment.strip())
    return names


def load_rom_labels(path):
    """lines:  BB:AAAA name ; comment   |   code|data|words BB:AAAA-AAAA"""
    labels, force, notes = {}, [], {}   # (b, idx) -> (name, comment); force: (kind, b, lo, hi); notes: (b, idx) -> text
    if not os.path.exists(path):
        return labels, force, notes
    for ln, line in enumerate(open(path, encoding='utf-8'), 1):
        code, _, comment = line.partition(';')
        parts = code.split()
        if not parts:
            continue
        try:
            if parts[0] == 'comment':
                bs, a = parts[1].split(':')
                notes[(int(bs, 16), parse_addr(a) - base_of(int(bs, 16)), 'c')] = comment.strip()
            elif parts[0] == 'note':
                bs, a = parts[1].split(':')
                notes[(int(bs, 16), parse_addr(a) - base_of(int(bs, 16)))] = comment.strip()
            elif parts[0] in ('code', 'data', 'words'):
                bs, rng = parts[1].split(':')
                lo, _, hi = rng.partition('-')
                b = int(bs, 16)
                force.append((parts[0], b, parse_addr(lo) - base_of(b), parse_addr(hi or lo) - base_of(b)))
            else:
                bs, a = parts[0].split(':')
                b = int(bs, 16)
                labels[(b, parse_addr(a) - base_of(b))] = (parts[1], comment.strip())
        except Exception as e:  # noqa
            sys.exit('%s:%d cannot parse %r (%s)' % (path, ln, line.strip(), e))
    return labels, force, notes


# ----------------------------------------------------------------------------- main class
class Disasm:
    def __init__(self, rom_path, cdl_path, ram_path, rom_lbl_path):
        d = open(rom_path, 'rb').read()
        assert d[:4] == b'NES\x1a'
        self.header = d[:16]
        assert d[4] * 2 == NBANKS, 'expected 128KB PRG'
        prg = d[16:16 + NBANKS * BANK_SIZE]
        self.chr = d[16 + NBANKS * BANK_SIZE:16 + NBANKS * BANK_SIZE + d[5] * 0x2000]
        c = open(cdl_path, 'rb').read()
        self.rom = [prg[b * BANK_SIZE:(b + 1) * BANK_SIZE] for b in range(NBANKS)]
        self.cdl = [c[b * BANK_SIZE:(b + 1) * BANK_SIZE] for b in range(NBANKS)]
        # kind: 0 unknown, 1 instruction start, 2 instruction operand, 3 data, 4 word table
        self.kind = [bytearray(BANK_SIZE) for _ in range(NBANKS)]
        self.traced = set()
        self.anomalies = []
        self.notes = {}
        self.word_adj = {}          # (bank, idx) of a word -> 1 for RTS-trick tables (stored address = target-1)
        self.table_targets = set()
        self.ram_user = load_ram_labels(ram_path)
        self.rom_user, self.force, self.user_notes = load_rom_labels(rom_lbl_path)
        self.refs = defaultdict(set)
        self.labels = {}
        self.ram_used = defaultdict(int)
        self.ram_defined = {}

    # ------------------------------------------------------------------ decoding
    def decode(self, b, i):
        op = self.rom[b][i]
        if op not in OPS:
            return None
        mn, mode, n = OPS[op]
        if i + n > BANK_SIZE or (mode == 'rel' and self.rel_dest(b, i) is None):
            return None
        return mn, mode, n

    def operand(self, b, i, n):
        r = self.rom[b]
        return r[i + 1] if n == 2 else r[i + 1] | (r[i + 2] << 8)

    def rel_dest(self, b, i):
        """branch destination (bank, idx); may cross into the adjacent bank of the pair (12/13, 14/15 ...)"""
        v = self.rom[b][i + 1]
        t = i + 2 + (v - 256 if v & 0x80 else v)
        if 0 <= t < BANK_SIZE:
            return b, t
        if t >= BANK_SIZE and b % 2 == 0 and b + 1 < NBANKS:
            return b + 1, t - BANK_SIZE
        if t < 0 and b % 2 == 1:
            return b - 1, t + BANK_SIZE
        return None

    def resolve(self, sb, addr, guess=True):
        """CPU address seen from bank sb -> (bank, idx, guessed) or None."""
        if addr < 0x8000:
            return None
        idx = addr & 0x1FFF
        if addr >= 0xC000:
            return (14 if addr < 0xE000 else 15), idx, False
        slot = 0 if addr < 0xA000 else 1
        if sb < 14 and sb % 2 == slot:
            return sb, idx, False
        if not guess:
            return None
        cands = [b for b in range(slot, 14, 2) if self.cdl[b][idx]]
        if len(cands) == 1:
            return cands[0], idx, True
        return None

    # ------------------------------------------------------------------ classification
    def classify_cdl(self):
        for b in range(NBANKS):
            k, cdl = self.kind[b], self.cdl[b]
            i = 0
            while i < BANK_SIZE:
                f = cdl[i]
                if k[i]:
                    i += 1
                    continue
                if f & 1:
                    d = self.decode(b, i)
                    if d and all(cdl[i + j] & 1 and not k[i + j] for j in range(1, d[2])):
                        k[i] = 1
                        for j in range(1, d[2]):
                            k[i + j] = 2
                        i += d[2]
                        continue
                    if self.mark_crossing(b, i):
                        i = BANK_SIZE
                        continue
                    self.anomalies.append((b, i))
                    k[i] = 3
                elif f & 2:
                    k[i] = 3
                i += 1

    def mark_crossing(self, b, i):
        """instruction whose operand lies in the next bank ($9FFF->$A000, $DFFF->$E000): keep as bytes"""
        op = self.rom[b][i]
        nb = b + 1 if b % 2 == 0 else None
        if op not in OPS or nb is None or nb >= NBANKS:
            return False
        mn, mode, n = OPS[op]
        spill = i + n - BANK_SIZE
        if spill <= 0 or not all(self.cdl[nb][j] & 1 for j in range(spill)):
            return False
        if any(self.kind[b][j] for j in range(i, BANK_SIZE)) or any(self.kind[nb][j] for j in range(spill)):
            return False
        for j in range(i, BANK_SIZE):
            self.kind[b][j] = 3
        for j in range(spill):
            self.kind[nb][j] = 3
        raw = list(self.rom[b][i:]) + list(self.rom[nb][:spill])
        v = raw[1] if n == 2 else raw[1] | (raw[2] << 8)
        if mode == 'rel':
            arg = ' $%04X' % ((base_of(b) + i + 2 + (v - 256 if v & 0x80 else v)) & 0xFFFF)
        elif mode == 'imp':
            arg = ''
        else:
            arg = ' $%0*X' % (2 if n == 2 else 4, v)
        self.notes[(b, i)] = 'crosses into bank %02X: %s%s (%s)' % (nb, mn, arg, mode)
        self.notes[(nb, 0)] = 'operand of the instruction at %02X:%04X' % (b, base_of(b) + i)
        return True

    def apply_force(self):
        for kind, b, lo, hi in self.force:
            k = self.kind[b]
            if kind == 'code':
                i = lo
                while i <= hi:
                    d = self.decode(b, i)
                    if not d:
                        sys.exit('forced code at %02X:%04X is not valid' % (b, base_of(b) + i))
                    for j in range(d[2]):
                        k[i + j] = 1 if j == 0 else 2
                    i += d[2]
            else:
                for j in range(lo, hi + 1):
                    k[j] = 3 if kind == 'data' else 4
        for j in range(0x1FFA, 0x2000):       # interrupt vectors
            self.kind[15][j] = 4

    # ------------------------------------------------------------------ static tracing
    def successors(self, b, i, mn, mode, n):
        """-> (targets[(bank, idx)], falls_through, bad)"""
        targets, fall = [], True
        if mn in BRANCHES:
            t = self.rel_dest(b, i)
            if t is None:
                return [], False, True
            targets.append(t)
        elif mn in ('JSR', 'JMP') and mode == 'abs':
            a = self.operand(b, i, n)
            if a < 0x8000:
                return [], False, True
            r = self.resolve(b, a, guess=False)
            if r:
                targets.append((r[0], r[1]))
            if mn == 'JMP':
                fall = False
        elif mn in ('JMP', 'RTS', 'RTI'):
            fall = False
        return targets, fall, False

    def speculate(self, b0, i0):
        found, cover = {}, set()
        stack = [(b0, i0)]
        while stack:
            b, i = stack.pop()
            if (b, i) in found:
                continue
            k = self.kind[b][i]
            if k == 1:
                continue
            if k != 0 or (b, i) in cover:
                return None
            d = self.decode(b, i)
            if not d or d[0] == 'BRK':
                return None
            mn, mode, n = d
            for j in range(n):
                if self.kind[b][i + j] != 0 or (b, i + j) in cover:
                    return None
            found[(b, i)] = n
            cover.update((b, i + j) for j in range(n))
            targets, fall, bad = self.successors(b, i, mn, mode, n)
            if bad:
                return None
            if fall:
                if i + n >= BANK_SIZE:
                    return None
                stack.append((b, i + n))
            stack.extend(targets)
        return found

    def trace(self):
        rounds = 0
        while rounds < 50:
            rounds += 1
            cands = {t for t in self.table_targets if self.kind[t[0]][t[1]] == 0}
            for b in range(NBANKS):
                k = self.kind[b]
                i = 0
                while i < BANK_SIZE:
                    if k[i] != 1:
                        i += 1
                        continue
                    mn, mode, n = self.decode(b, i)
                    targets, fall, bad = self.successors(b, i, mn, mode, n)
                    if not bad:
                        cands.update(t for t in targets if self.kind[t[0]][t[1]] == 0)
                        if fall and i + n < BANK_SIZE and k[i + n] == 0:
                            cands.add((b, i + n))
                    i += n
            changed = False
            for (b, i) in sorted(cands):
                if self.kind[b][i] != 0:
                    continue
                found = self.speculate(b, i)
                if found:
                    for (fb, fi), n in found.items():
                        self.kind[fb][fi] = 1
                        for j in range(1, n):
                            self.kind[fb][fi + j] = 2
                        self.traced.add((fb, fi))
                    changed = True
            if not changed:
                break
        return rounds

    # ------------------------------------------------------------------ pointer tables
    def _target_kinds(self, b, v):
        if v < 0x8000:
            return []
        idx = v & 0x1FFF
        if v >= 0xC000:
            return [(14 if v < 0xE000 else 15, idx)]
        slot = 0 if v < 0xA000 else 1
        if b < 14 and b % 2 == slot:
            return [(b, idx)]
        return [(x, idx) for x in range(slot, 14, 2)]

    def detect_tables(self, min_abs=2, min_rts=3):
        """Find tables of code pointers in data/unknown bytes. Anchor: an aligned word whose target is a known
        instruction start with the CDL 'indirect code' flag; extend both ways while words point at plausible code."""
        found = 0
        for b in range(NBANKS):
            k, r = self.kind[b], self.rom[b]
            for adj, mn in ((0, min_abs), (1, min_rts)):
                def val(p, strict):
                    if p < 0 or p + 1 >= BANK_SIZE or k[p] not in (0, 3) or k[p + 1] not in (0, 3):
                        return False
                    v = ((r[p] | (r[p + 1] << 8)) + adj) & 0xFFFF
                    ts = self._target_kinds(b, v)
                    if strict:
                        return any(self.kind[tb][ti] == 1 and self.cdl[tb][ti] & 0x10 for tb, ti in ts)
                    return bool(ts) and any(self.kind[tb][ti] in (0, 1) for tb, ti in ts)                         and not all(self.kind[tb][ti] in (2, 3) for tb, ti in ts)
                p = 0
                while p < BANK_SIZE - 1:
                    if val(p, True):
                        lo = p
                        while val(lo - 2, False):
                            lo -= 2
                        hi = p
                        while val(hi + 2, False):
                            hi += 2
                        if (hi - lo) // 2 + 1 >= mn:
                            for q in range(lo, hi + 2, 2):
                                k[q] = k[q + 1] = 4
                                if adj:
                                    self.word_adj[(b, q)] = 1
                                v = ((r[q] | (r[q + 1] << 8)) + adj) & 0xFFFF
                                ts = self._target_kinds(b, v)
                                if len(ts) == 1 and self.kind[ts[0][0]][ts[0][1]] == 0:
                                    self.table_targets.add(ts[0])
                            found += 1
                        p = hi + 2
                        continue
                    p += 1
        return found

    # ------------------------------------------------------------------ targets / labels
    def start_of(self, b, idx):
        while idx > 0 and self.kind[b][idx] == 2:
            idx -= 1
        return idx

    def find_target(self, sb, addr):
        r = self.resolve(sb, addr)
        if not r:
            return None
        tb, ti, g = r
        s = self.start_of(tb, ti)
        return tb, s, ti - s, g

    def addref(self, sb, addr, kindname):
        t = self.find_target(sb, addr)
        if t:
            self.refs[(t[0], t[1])].add(kindname)

    def gather_refs(self):
        for b in range(NBANKS):
            k = self.kind[b]
            i = 0
            while i < BANK_SIZE:
                if k[i] == 1:
                    mn, mode, n = self.decode(b, i)
                    if mode == 'rel':
                        t = self.rel_dest(b, i)
                        if t is not None:
                            self.refs[(t[0], self.start_of(t[0], t[1]))].add('loc')
                    elif mode in ('abs', 'abx', 'aby', 'ind'):
                        a = self.operand(b, i, n)
                        if a >= 0x8000 and mn not in STORES:
                            kn = 'sub' if mn == 'JSR' else 'loc' if mn == 'JMP' and mode == 'abs' else \
                                'tbl' if mode in ('abx', 'aby') else 'dat'
                            self.addref(b, a, kn)
                    if self.cdl[b][i] & 0x10:
                        self.refs[(b, i)].add('ptr')
                    i += n
                elif k[i] == 4 and (i & 1) == 0 and i + 1 < BANK_SIZE and k[i + 1] == 4:
                    v = (self.rom[b][i] | (self.rom[b][i + 1] << 8)) + self.word_adj.get((b, i), 0)
                    self.addref(b, v & 0xFFFF, 'ptr')
                    i += 2
                else:
                    i += 1
        for key in self.rom_user:
            b, i = key
            self.refs[(b, self.start_of(b, i))].add('user')

    def build_labels(self):
        for (b, i), kinds in self.refs.items():
            if (b, i) in self.rom_user:
                continue
            is_code = self.kind[b][i] == 1
            if 'sub' in kinds:
                p = 'sub'
            elif 'loc' in kinds:
                p = 'loc'
            elif 'ptr' in kinds:
                p = 'ofs' if is_code else 'tbl'
            elif 'tbl' in kinds:
                p = 'tbl'
            else:
                p = 'dat'
            if is_code and p in ('tbl', 'dat'):
                p = 'loc'
            self.labels[(b, i)] = '%s_%02X_%04X' % (p, b, base_of(b) + i)
        for key, (name, _) in self.rom_user.items():
            self.labels[key] = name
        names = defaultdict(list)
        for key, nm in self.labels.items():
            names[nm].append(key)
        for nm, keys in names.items():
            if len(keys) > 1:
                sys.exit('duplicate label %s: %s' % (nm, keys))

    # ------------------------------------------------------------------ operand text
    def ram_expr(self, addr):
        self.ram_used[addr] += 1
        if addr in self.ram_user:
            return self.ram_user[addr][0]
        for a, (nm, size, _) in self.ram_user.items():
            if a < addr < a + size:
                return '%s+%d' % (nm, addr - a)
        return 'ram_%04X' % addr

    def label_expr(self, sb, addr):
        t = self.find_target(sb, addr)
        if t and (t[0], t[1]) in self.labels:
            return self.labels[(t[0], t[1])] + ('+%d' % t[2] if t[2] else ''), t[3]
        return None, False

    def addr_expr(self, sb, mn, mode, addr):
        if addr < 0x100:
            e = self.ram_expr(addr)
            return e if mode == 'ind' else 'a:' + e
        if addr < 0x800 or 0x6000 <= addr < 0x8000:
            return self.ram_expr(addr)
        if addr in HW_REGS:
            return HW_REGS[addr]
        if addr >= 0x8000:
            if mn in STORES:
                return MMC3_REGS.get(addr, '$%04X' % addr) if mode == 'abs' else '$%04X' % addr
            e, _ = self.label_expr(sb, addr)
            if e:
                return e
        return '$%04X' % addr

    def instr_text(self, b, i):
        mn, mode, n = self.decode(b, i)
        if mode == 'imp':
            return mn
        if mode == 'acc':
            return mn + ' A'
        v = self.operand(b, i, n)
        if mode == 'imm':
            return '%s #$%02X' % (mn, v)
        if mode == 'rel':
            tb, t = self.rel_dest(b, i)
            s = self.start_of(tb, t)
            return '%s %s%s' % (mn, self.labels[(tb, s)], '+%d' % (t - s) if t != s else '')
        if mode in ('zp', 'zpx', 'zpy', 'izx', 'izy'):
            return {'zp': '%s %s', 'zpx': '%s %s,X', 'zpy': '%s %s,Y', 'izx': '%s (%s,X)',
                    'izy': '%s (%s),Y'}[mode] % (mn, self.ram_expr(v))
        e = self.addr_expr(b, mn, mode, v)
        return {'abs': '%s %s', 'abx': '%s %s,X', 'aby': '%s %s,Y', 'ind': '%s (%s)'}[mode] % (mn, e)

    def pre_ram_scan(self):
        """auto-name zero-page pointers used with (zp),Y / (zp,X) / JMP (abs)"""
        ptrs = set()
        for b in range(NBANKS):
            i = 0
            while i < BANK_SIZE:
                if self.kind[b][i] == 1:
                    mn, mode, n = self.decode(b, i)
                    if mode in ('izx', 'izy'):
                        ptrs.add(self.rom[b][i + 1])
                    elif mode == 'ind' and self.operand(b, i, n) < 0x800:
                        ptrs.add(self.operand(b, i, n))
                    i += n
                else:
                    i += 1
        for a in sorted(ptrs):
            if a not in self.ram_user and not any(x < a < x + s[1] for x, s in self.ram_user.items()):
                self.ram_user[a] = ('ptr_%02X' % a if a < 0x100 else 'ptr_%04X' % a, 2, 'auto: indirect pointer')

    # ------------------------------------------------------------------ emitting
    @staticmethod
    def cdl_flags(f):
        if f == 0:
            return '- - - - - -'
        s = ('C ' if f & 1 else '- ') + ('D ' if f & 2 else '- ')
        s += ('4 ' if f & 0x80 else '%d ' % ((f >> 2) & 3)) if f & 2 else '- '
        return s + ('J ' if f & 0x10 else '- ') + ('I ' if f & 0x20 else '- ') + ('A' if f & 0x40 else '-')

    def emit_bank(self, b):
        if not hasattr(self, 'user_notes_at'):
            self.user_notes_at = {}
            self.user_cmts = {}
            for key, text in self.user_notes.items():
                if len(key) == 3:
                    self.user_cmts[(key[0], self.start_of(key[0], key[1]))] = text
                else:
                    self.user_notes_at[(key[0], self.start_of(key[0], key[1]))] = text
        base, k, rom, cdl = base_of(b), self.kind[b], self.rom[b], self.cdl[b]
        off0 = 0x10 + b * BANK_SIZE
        o = ['.segment "BANK_%02X"' % b,
             '; 0x%06X-0x%06X  CPU $%04X-$%04X' % (off0, off0 + BANK_SIZE - 1, base, base + BANK_SIZE - 1), '']
        i = 0
        pend = None
        while i < BANK_SIZE:
            if pend:
                o[-1] += '  ; ' + pend
            key = (b, i)
            pend = self.user_cmts.get(key)
            if key in self.user_notes_at:
                o.append('; ' + self.user_notes_at[key])
            if key in self.labels:
                if key in self.rom_user and self.rom_user[key][1]:
                    o.append('; ' + self.rom_user[key][1])
                o.append(self.labels[key] + ':')
            kd = k[i]
            if kd == 1:
                mn, mode, n = self.decode(b, i)
                f = cdl[i]
                fl = self.cdl_flags(f) if f else ('c - - - - -' if key in self.traced else '- - - - - -')
                txt = self.instr_text(b, i)
                if mode == 'rel' and self.rel_dest(b, i)[0] != b:     # ca65 can't branch between segments
                    by = ', '.join('$%02X' % x for x in rom[i:i + n])
                    txt, fl = '.byte ' + by, fl + ' ' + txt.replace(' ', ' ', 1)
                    o.append('\t%-32s;%s 0x%06X %02X:%04X: (branch to another bank, kept as bytes)'
                             % (txt, fl, off0 + i, b, base + i))
                    i += n
                    continue
                if mode in ('abs', 'abx', 'aby', 'ind') and self.operand(b, i, n) >= 0x8000 \
                        and mn not in STORES and self.label_expr(b, self.operand(b, i, n))[1]:
                    fl += ' bank?'
                by = ' '.join('%02X' % x for x in rom[i:i + n])
                o.append('\t%-32s;%s 0x%06X %02X:%04X: %s' % (txt, fl, off0 + i, b, base + i, by))
                i += n
                continue
            if kd == 4 and (b, i + 1) in self.labels:         # a label points into the middle of a word
                o.append('\t%-32s;W 0x%06X %02X:%04X:' % ('.byte $%02X' % rom[i], off0 + i, b, base + i))
                i += 1
                continue
            if kd == 4 and i + 1 < BANK_SIZE and k[i + 1] == 4:
                items, j = [], i
                while j + 1 < BANK_SIZE and k[j] == 4 and k[j + 1] == 4 and len(items) < 8 \
                        and (j == i or ((b, j) not in self.labels and (b, j + 1) not in self.labels)):
                    adj = self.word_adj.get((b, j), 0)
                    v = rom[j] | (rom[j + 1] << 8)
                    e = self.label_expr(b, (v + adj) & 0xFFFF)[0] if v + adj >= 0x8000 else None
                    items.append(e + '-1' if e and adj else e or '$%04X' % v)
                    j += 2
                o.append('\t%-32s;W 0x%06X %02X:%04X:' % ('.word ' + ', '.join(items), off0 + i, b, base + i))
                i = j
                continue
            if kd in (0, 3):                                 # run of identical bytes -> .res
                j = i + 1
                while j < BANK_SIZE and rom[j] == rom[i] and k[j] == kd and cdl[j] == cdl[i]                         and (b, j) not in self.labels and (b, j) not in self.notes                         and (b, j) not in self.user_notes_at:
                    j += 1
                if j - i >= FILL_MIN:
                    o.append('	%-32s;%s 0x%06X %02X:%04X: fill %d bytes' % (
                        '.res %d, $%02X' % (j - i, rom[i]), self.cdl_flags(cdl[i]), off0 + i, b, base + i, j - i))
                    i = j
                    continue
            j = i + 1 if kd == 4 else i                      # lone half of a word: emit as a single byte
            while kd != 4 and j < BANK_SIZE and j - i < 16 and k[j] in (0, 3) and \
                    (j == i or ((b, j) not in self.labels and (b, j) not in self.notes)) \
                    and (k[j] == 3) == (k[i] == 3):
                j += 1
            o.append('\t%-32s;%s 0x%06X %02X:%04X:%s' % ('.byte ' + ','.join('$%02X' % x for x in rom[i:j]),
                                                        self.cdl_flags(cdl[i]), off0 + i, b, base + i,
                                                        ' ' + self.notes[key] if key in self.notes else ''))
            i = j
        if pend:
            o[-1] += '  ; ' + pend
        return '\n'.join(o) + '\n'

    # ------------------------------------------------------------------ output files
    def write_all(self, out):
        src = os.path.join(out, 'src')
        os.makedirs(src, exist_ok=True)
        os.makedirs(os.path.join(out, 'docs'), exist_ok=True)

        def w(path, text, nl='\n'):
            with open(path, 'w', encoding='utf-8', newline=nl) as f:
                f.write(text)

        for b in range(NBANKS):
            w(os.path.join(src, 'bank_%02X.asm' % b), self.emit_bank(b))

        lines = ['; RAM / PRG-RAM labels. Generated by tools/disasm.py from tools/labels/ram.txt',
                 '; name = $address ; usage count in code ; comment', '']
        defined = {}
        for a in sorted(set(self.ram_used) | set(self.ram_user)):
            if a in self.ram_user:
                defined[a] = self.ram_user[a]
            elif not any(x < a < x + s[1] for x, s in self.ram_user.items()):
                defined[a] = ('ram_%04X' % a, 1, '')
        for a in sorted(defined):
            nm, size, cm = defined[a]
            use = sum(self.ram_used.get(a + j, 0) for j in range(size))
            lines.append('%-22s = $%04X ; %d%s%s' % (nm, a, use, ' (size %d)' % size if size > 1 else '',
                                                      ' ; ' + cm if cm else ''))
        w(os.path.join(src, 'ram.inc'), '\n'.join(lines) + '\n')
        self.ram_defined = defined

        d = ['; Hardware registers and constants', '',
             'KEY_A = $01', 'KEY_B = $02', 'KEY_SELECT = $04', 'KEY_START = $08',
             'KEY_UP = $10', 'KEY_DOWN = $20', 'KEY_LEFT = $40', 'KEY_RIGHT = $80', '']
        d += ['%-22s = $%04X' % (nm, a) for a, nm in sorted(HW_REGS.items())]
        d += ['', '; MMC3 registers (write-only, mapped over PRG ROM space)']
        d += ['%-22s = $%04X' % (nm, a) for a, nm in sorted(MMC3_REGS.items())]
        d += ['', '.include "ram.inc"', '']
        w(os.path.join(src, 'defines.inc'), '\n'.join(d))

        m = ['.feature force_range', '', '.include "defines.inc"', '',
             '.segment "HEADER"', '\t.incbin "../header.bin"', '']
        m += ['.include "bank_%02X.asm"' % b for b in range(NBANKS)]
        m += ['', '.include "chr.asm"', '']
        w(os.path.join(src, 'main.asm'), '\n'.join(m))
        open(os.path.join(out, 'header.bin'), 'wb').write(self.header)

        cfg = ['MEMORY {',
               '    HDR:    start = $0000, size = $10, type = ro, file = %O, fill = yes, fillval = $FF;']
        for b in range(NBANKS):
            cfg.append('    PRG_%02X: start = $%04X, size = $2000, type = ro, file = %%O, bank = $%02X, '
                       'fill = yes, fillval = $FF;' % (b, base_of(b), b))
        cfg += ['    CHR:    start = $0000, size = $%X, type = ro, file = %%O, fill = yes, fillval = $FF;'
                % len(self.chr), '}', '', 'SEGMENTS {', '    HEADER:  load = HDR, type = ro;']
        cfg += ['    BANK_%02X: load = PRG_%02X, type = ro;' % (b, b) for b in range(NBANKS)]
        cfg += ['    CHR_ROM: load = CHR, type = ro;', '}', '', 'FILES {', '    %O: format = bin;', '}', '']
        w(os.path.join(out, 'config.cfg'), '\n'.join(cfg))
        w(os.path.join(out, 'assemble.bat'),
          '@echo off\ndel mff.nes mff.map mff_labels.txt 2>nul\n'
          'ca65 -g src/main.asm -o src/main.o\nif errorlevel 1 exit /b 1\n'
          'ld65 -C config.cfg -Ln mff_labels.txt -m mff.map -o mff.nes src/main.o\n', '\r\n')
        w(os.path.join(out, 'compare.bat'),
          '@echo off\nfc /b mff.nes "Mighty Final Fight (U) [!].nes"\n', '\r\n')

        mlb = ['P:%X:%s' % (b * BANK_SIZE + i, nm) for (b, i), nm in sorted(self.labels.items())]
        mlb += ['R:%X:%s' % (a, v[0]) for a, v in sorted(defined.items()) if a < 0x800]
        w(os.path.join(out, 'mff.mlb'), '\n'.join(mlb) + '\n')
        self.write_report(os.path.join(out, 'docs', 'coverage.txt'))

    def looks_like_code(self, b, i, ln):
        end = i + ln
        if ln < 6:
            return False
        j = i
        while j < end:
            d = self.decode(b, j)
            if not d or d[0] == 'BRK' or j + d[2] > end:
                return False
            j += d[2]
        return True

    def write_report(self, path):
        o = ['Coverage report (bytes). cdl = from CDL, traced = found by static tracing', '',
             'bank  code(cdl) code(traced) data  unknown']
        tot = [0, 0, 0, 0]
        runs = []
        for b in range(NBANKS):
            k = self.kind[b]
            trb = sum(self.decode(b, i)[2] for (bb, i) in self.traced if bb == b)
            row = (sum(1 for x in k if x in (1, 2)) - trb, trb, sum(1 for x in k if x in (3, 4)),
                   sum(1 for x in k if x == 0))
            o.append('%02X    %9d %12d %6d %8d' % ((b,) + row))
            tot = [t + r for t, r in zip(tot, row)]
            i = 0
            while i < BANK_SIZE:
                if k[i] == 0:
                    j = i
                    while j < BANK_SIZE and k[j] == 0:
                        j += 1
                    runs.append((j - i, b, i))
                    i = j
                else:
                    i += 1
        o.append('all   %9d %12d %6d %8d' % tuple(tot))
        fill = codelike = other = 0
        cl_runs = []
        for ln, b, i in runs:
            seg = self.rom[b][i:i + ln]
            if len(set(seg)) == 1:
                fill += ln
            elif self.looks_like_code(b, i, ln):
                codelike += ln
                cl_runs.append((ln, b, i))
            else:
                other += ln
        o += ['', 'Unknown bytes: %d fill (one repeated byte), %d code-like, %d other (probably data)'
              % (fill, codelike, other)]
        o += ['', 'CDL anomalies (code flag but not a valid instruction): %d' % len(self.anomalies)]
        o += ['  %02X:%04X' % (b, base_of(b) + i) for b, i in self.anomalies]
        o += ['', 'Traced code (instruction starts, verify by hand):']
        o += ['  %02X:%04X  %s' % (b, base_of(b) + i, self.instr_text(b, i)) for (b, i) in sorted(self.traced)]
        o += ['', 'Code-like unknown runs (decode cleanly to the end, no BRK; review by hand):']
        o += ['  %5d  %02X:%04X' % (ln, b, base_of(b) + i) for ln, b, i in sorted(cl_runs, reverse=True)]
        o += ['', 'Unknown runs, longest first (len bank:addr):']
        o += ['  %5d  %02X:%04X' % (ln, b, base_of(b) + i) for ln, b, i in sorted(runs, reverse=True)]
        with open(path, 'w', encoding='utf-8', newline='\n') as f:
            f.write('\n'.join(o) + '\n')


def build_check(out, rom):
    subprocess.check_call(['ca65', '-g', 'src/main.asm', '-o', 'src/main.o'], cwd=out)
    subprocess.check_call(['ld65', '-C', 'config.cfg', '-Ln', 'mff_labels.txt', '-m', 'mff.map',
                           '-o', 'mff.nes', 'src/main.o'], cwd=out)
    x, y = open(os.path.join(out, 'mff.nes'), 'rb').read(), open(rom, 'rb').read()
    if x == y:
        print('BUILD OK: identical to original (%d bytes)' % len(x))
        return 0
    n = next((i for i in range(min(len(x), len(y))) if x[i] != y[i]), min(len(x), len(y)))
    print('MISMATCH: sizes %d/%d, first diff at 0x%X (bank %02X, idx %04X)'
          % (len(x), len(y), n, (n - 16) // BANK_SIZE, (n - 16) % BANK_SIZE))
    return 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--rom', default=os.path.join(ROOT, 'Mighty Final Fight (U) [!].nes'))
    ap.add_argument('--cdl', default=os.path.join(ROOT, 'Mighty Final Fight (U) [!].cdl'))
    ap.add_argument('--out', default=ROOT)
    ap.add_argument('--no-trace', action='store_true')
    ap.add_argument('--no-chr', action='store_true')
    ap.add_argument('--build', action='store_true', help='assemble and compare with the original ROM')
    a = ap.parse_args()

    D = Disasm(a.rom, a.cdl, os.path.join(HERE, 'labels', 'ram.txt'), os.path.join(HERE, 'labels', 'rom.txt'))
    D.classify_cdl()
    D.apply_force()
    if not a.no_trace:
        for rnd in range(8):
            D.trace()
            if not D.detect_tables():
                break
        print('trace: %d instructions found, %d pointer-table targets' % (len(D.traced), len(D.table_targets)))
    D.gather_refs()
    D.build_labels()
    D.pre_ram_scan()
    D.write_all(a.out)
    print('labels: %d, CDL anomalies: %d' % (len(D.labels), len(D.anomalies)))
    if not a.no_chr:
        import chr_tool
        chr_tool.split(a.rom, a.out)
    if a.build:
        sys.exit(build_check(a.out, a.rom))


if __name__ == '__main__':
    main()
