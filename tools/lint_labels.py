#!/usr/bin/env python3
"""Lint tools/labels/rom.txt and ram.txt.

Checks:
  - the same name used for two different addresses (ca65 would reject it, or worse, silently pick one)
  - one address named twice
  - addresses outside the CPU window of their bank
  - overlapping code/data/words/table/text ranges (the later one silently wins in the generator)
  - rawsym addresses that overlap each other
  - ram.txt: duplicate names / addresses

Exit status 1 if any problem is found.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RANGE_KINDS = ('code', 'data', 'words', 'bewords', 'table', 'text', 'split')


def bank_window(b):
    if b == 0x0E:
        return 0xC000, 0xDFFF
    if b == 0x0F:
        return 0xE000, 0xFFFF
    lo = 0x8000 if b % 2 == 0 else 0xA000
    return lo, lo + 0x1FFF


def banks(spec):
    return [int(x, 16) for x in spec.split(':')[0].split(',')]


def rng(spec):
    r = spec.split(':')[1]
    lo, _, hi = r.partition('-')
    return int(lo, 16), int(hi or lo, 16)


def lint_rom(path):
    errs = []
    names = {}
    addrs = {}
    ranges = []
    raw = {}
    for ln, line in enumerate(open(path, encoding='utf-8'), 1):
        parts = line.partition(';')[0].split()
        if not parts:
            continue
        w = parts[0]
        if w == 'rawsym':
            a, n = int(parts[1], 16), parts[2]
            if a in raw and raw[a][0] != n:
                errs.append('%d: rawsym $%04X named %s and %s (line %d)' % (ln, a, raw[a][0], n, raw[a][1]))
            raw[a] = (n, ln)
            continue
        if w in RANGE_KINDS and len(parts) > 1 and re.match(r'^[0-9A-F,]+:[0-9A-F]{4}', parts[1]):
            lo, hi = rng(parts[1])
            if hi < lo:
                errs.append('%d: %s range is reversed: %s' % (ln, w, parts[1]))
            for b in banks(parts[1]):
                wlo, whi = bank_window(b)
                if lo < wlo or hi > whi:
                    errs.append('%d: %s %s lies outside bank %02X window $%04X-$%04X' % (ln, w, parts[1], b, wlo, whi))
                if w in ('code', 'data', 'text', 'words', 'bewords', 'table'):
                    for (b2, lo2, hi2, w2, ln2) in ranges:
                        if b2 == b and lo <= hi2 and lo2 <= hi and (w == 'code') != (w2 == 'code'):
                            errs.append('%d: %s %s overlaps %s at line %d (code vs data)' % (ln, w, parts[1], w2, ln2))
                    ranges.append((b, lo, hi, w, ln))
            continue
        m = re.match(r'^([0-9A-F]{2}):([0-9A-F]{4})$', w)
        if m and len(parts) > 1:
            b, a, n = int(m.group(1), 16), int(m.group(2), 16), parts[1]
            wlo, whi = bank_window(b)
            if not wlo <= a <= whi:
                errs.append('%d: %s is outside bank %02X window' % (ln, w, b))
            if n in names and names[n][0] != (b, a):
                errs.append('%d: name %s used for %02X:%04X and %02X:%04X (line %d)'
                            % (ln, n, b, a, names[n][0][0], names[n][0][1], names[n][1]))
            if (b, a) in addrs and addrs[(b, a)][0] != n:
                errs.append('%d: %s named %s and %s (line %d)' % (ln, w, addrs[(b, a)][0], n, addrs[(b, a)][1]))
            names.setdefault(n, ((b, a), ln))
            addrs.setdefault((b, a), (n, ln))
    return errs


def lint_ram(path):
    errs = []
    names, addrs = {}, {}
    if not os.path.exists(path):
        return errs
    for ln, line in enumerate(open(path, encoding='utf-8'), 1):
        parts = line.partition(';')[0].split()
        if len(parts) < 2 or not re.match(r'^[0-9A-F]{4}$', parts[0]):
            continue
        a, n = int(parts[0], 16), parts[1]
        if n in names and names[n][0] != a:
            errs.append('ram %d: name %s used for $%04X and $%04X (line %d)' % (ln, n, a, names[n][0], names[n][1]))
        if a in addrs and addrs[a][0] != n:
            errs.append('ram %d: $%04X named %s and %s (line %d)' % (ln, a, addrs[a][0], n, addrs[a][1]))
        names.setdefault(n, (a, ln))
        addrs.setdefault(a, (n, ln))
    return errs


def main():
    d = os.path.join(ROOT, 'tools', 'labels')
    errs = lint_rom(os.path.join(d, 'rom.txt')) + lint_ram(os.path.join(d, 'ram.txt'))
    for e in errs:
        print(e)
    print('%d problem(s)' % len(errs))
    return 1 if errs else 0


if __name__ == '__main__':
    sys.exit(main())
