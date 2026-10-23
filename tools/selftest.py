#!/usr/bin/env python3
"""Self-test of tools/disasm.py on a synthetic ROM (no real ROM/CDL needed; ca65/ld65 must be in PATH):

  python tools/selftest.py

Builds tools/tests/make_synth_rom.py into a temp dir, runs the generator with a small rom.txt, assembles, checks the
result is byte-identical and that the known pitfalls do not come back:
  - a word inside tile data that happens to point at J-flagged code must not become a .word table;
  - a split lo/hi table whose entries live in several banks must get raw $XXXX, not labels from random banks;
  - LDA tbl+1,Y must refer to the word (tbl+1), not split the table;
  - multi-bank table/note directives apply to every listed bank.
"""
import os
import shutil
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROM_TXT = """table 01,05,07,09,0D:AE60-AEFF 48 stage section header
note 09:AF00 ; stageScreenBase
table 01,05,07,09,0D:AF00-B6FF 8
table 09:B700-BAFF 16
table 09:BB00-BEFF 16
table 09:BF00-BFFF 16
code 03:B306-B308
code 0B:B330
"""


def main():
    tmp = tempfile.mkdtemp(prefix='mff_selftest_')
    try:
        sys.path.insert(0, os.path.join(HERE, 'tests'))
        import make_synth_rom
        rom, cdl = os.path.join(tmp, 'synth.nes'), os.path.join(tmp, 'synth.cdl')
        make_synth_rom.write(rom, cdl)
        lbl = os.path.join(tmp, 'labels')
        os.makedirs(lbl)
        open(os.path.join(lbl, 'ram.txt'), 'w').close()
        open(os.path.join(lbl, 'rom.txt'), 'w', encoding='utf-8').write(ROM_TXT)
        out = os.path.join(tmp, 'out')
        r = subprocess.run([sys.executable, os.path.join(HERE, 'disasm.py'), '--rom', rom, '--cdl', cdl, '--out', out,
                            '--labels', lbl, '--build'], capture_output=True, text=True)
        print(r.stdout[-600:])
        if r.returncode != 0:
            print(r.stderr)
            return fail('generator or build failed')
        src = {b: open(os.path.join(out, 'src', 'bank_%02X.asm' % b), encoding='utf-8').read() for b in (9, 12, 15)}
        checks = [
            ('.word' not in src[9], 'false .word table inside stage tile data (09:B873)'),
            ('tbl_09_B318' not in src[12] and 'ofs_03_B3' not in src[12] and 'ofs_0B_B3' not in src[12],
             'split table entries labelled with banks guessed per entry'),
            ('.lobytes $B300, $B303, $B306' in src[12], 'enemy-AI style split table kept with raw entries'),
            ('LDA tbl_0F_FE40+1,Y' in src[15], 'LDA tbl+1,Y should reference the word'),
            ('.word ofs_0F_FE60, ofs_0F_FE70, ofs_0F_FE80' in src[15], 'word table at 0F:FE40 intact'),
            ('.word ofs_0F_FE60-1, ofs_0F_FE70-1, ofs_0F_FE80-1' in src[15], 'RTS-trick table at 0F:FEC0'),
            ('stage section header' in src[9] and '; stageScreenBase' in src[9], 'multi-bank table/note directives'),
        ]
        bad = [msg for ok, msg in checks if not ok]
        for ok, msg in checks:
            print(('PASS ' if ok else 'FAIL ') + msg)
        return fail('%d check(s) failed' % len(bad)) if bad else 0
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


def fail(msg):
    print('SELFTEST FAILED: ' + msg)
    return 1


if __name__ == '__main__':
    sys.exit(main())
