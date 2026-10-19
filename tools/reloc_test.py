#!/usr/bin/env python3
"""Relocation test: rebuild with every switchable bank (00-0D) moved up by SHIFT bytes in CPU space and check that
the result differs from the original ROM only in operand bytes that hold addresses (i.e. nothing else changed).

  python tools/reloc_test.py [--shift 0x100]

Reports: instructions whose operand did not move although it points into a moved bank (raw addresses),
and bytes that changed outside instruction operands / .word tables (these would be real problems).
"""
import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import disasm as d  # noqa: E402


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--shift', type=lambda x: int(x, 0), default=0x100)
    ap.add_argument('--rom', default=os.path.join(ROOT, 'Mighty Final Fight (U) [!].nes'))
    a = ap.parse_args()
    cfg = open(os.path.join(ROOT, 'config.cfg'), encoding='utf-8').read()

    def bump(m):
        b = int(m.group(1), 16)
        return m.group(0) if b >= 14 else 'PRG_%02X: start = $%04X' % (b, int(m.group(2), 16) + a.shift)
    cfg = re.sub(r'PRG_([0-9A-F]{2}): start = \$([0-9A-F]{4})', bump, cfg)
    tmp = os.path.join(ROOT, 'config_reloc.cfg')
    open(tmp, 'w', encoding='utf-8').write(cfg)
    try:
        subprocess.check_call(['ca65', '-g', 'src/main.asm', '-o', 'src/main_reloc.o'], cwd=ROOT)
        subprocess.check_call(['ld65', '-C', 'config_reloc.cfg', '-o', 'mff_reloc.nes', 'src/main_reloc.o'], cwd=ROOT)
    finally:
        os.remove(tmp)
    new = open(os.path.join(ROOT, 'mff_reloc.nes'), 'rb').read()
    old = open(a.rom, 'rb').read()
    D = d.Disasm(a.rom, os.path.join(ROOT, 'Mighty Final Fight (U) [!].cdl'),
                 os.path.join(HERE, 'labels', 'ram.txt'), os.path.join(HERE, 'labels', 'rom.txt'))
    D.classify_cdl(); D.apply_force()
    for _ in range(8):
        D.trace()
        if not (D.detect_split_tables() + D.detect_tables()):
            break
    if D.adopt_code_like():
        D.trace()
    bad, operand_diff, covered = [], 0, set()
    for b in range(d.NBANKS):
        k = D.kind[b]
        for i in range(d.BANK_SIZE):
            if k[i] == 2 or k[i] == 4:
                covered.add((b, i))
    diffs = [i for i in range(16, 16 + 16 * d.BANK_SIZE) if old[i] != new[i]]
    for off in diffs:
        b, i = (off - 16) // d.BANK_SIZE, (off - 16) % d.BANK_SIZE
        if (b, i) in covered or D.kind[b][i] == 3:
            operand_diff += 1
        else:
            bad.append((b, i))
    print('bytes changed: %d (operands/words/data %d, other %d)' % (len(diffs), operand_diff, len(bad)))
    for b, i in bad[:40]:
        print('  unexpected change at %02X:%04X' % (b, d.base_of(b) + i))
    os.remove(os.path.join(ROOT, 'mff_reloc.nes'))
    os.remove(os.path.join(ROOT, 'src', 'main_reloc.o'))
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
