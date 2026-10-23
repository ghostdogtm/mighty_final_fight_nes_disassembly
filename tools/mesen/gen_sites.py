#!/usr/bin/env python3
"""List every indexed ROM read (LDA/CMP/... tbl,X / tbl,Y with the operand in $8000-$FFFF) found in src/bank_*.asm
and write them as a Lua table for tools/mesen/rom_read_log.lua.

usage: python tools/mesen/gen_sites.py OUT.lua
Each site: {pc = CPU address of the instruction, off = PRG offset of the instruction, base = operand, reg = 'X'|'Y',
            label = "BB:PPPP"}"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
LINE = re.compile(r'^\t(\w{3})\s+([^;]*?),([XY])\s*;.*?0x([0-9A-F]{6}) ([0-9A-F]{2}):([0-9A-F]{4}): ([0-9A-F]{2}) ([0-9A-F]{2}) ([0-9A-F]{2})\s*$')
READS = {'LDA', 'LDX', 'LDY', 'CMP', 'CPX', 'CPY', 'ADC', 'SBC', 'AND', 'ORA', 'EOR', 'BIT'}


def main(out):
    sites = []
    for f in sorted(glob.glob(os.path.join(ROOT, 'src', 'bank_*.asm'))):
        for line in open(f, encoding='latin-1'):
            m = LINE.match(line.rstrip('\r\n'))
            if not m or m.group(1) not in READS or '(' in m.group(2):
                continue
            off, bank, pc = int(m.group(4), 16), m.group(5), int(m.group(6), 16)
            base = int(m.group(8), 16) | int(m.group(9), 16) << 8
            if base < 0x8000:
                continue
            sites.append((off - 0x10, pc, base, m.group(3), bank))
    with open(out, 'w') as o:
        o.write('return {\n')
        for off, pc, base, reg, bank in sites:
            o.write('{off=%d,pc=%d,base=%d,reg="%s",label="%s:%04X"},\n' % (off, pc, base, reg, bank, pc))
        o.write('}\n')
    print(len(sites), 'sites')


if __name__ == '__main__':
    main(sys.argv[1])
