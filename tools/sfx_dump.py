"""Dump sound effects of Mighty Final Fight using the record layout from docs/sound_format.md.

usage: python tools/sfx_dump.py [rom.nes] [id ...]   (no ids = all effects)
Only effects whose stream lies below $C000 (banks 06/07) are decoded."""
import sys

args = sys.argv[1:]
path = args.pop(0) if args and args[0].endswith('.nes') else 'Mighty Final Fight (U) [!].nes'
rom = open(path, 'rb').read()[16:16 + 0x20000]


def rd(a):
    if a < 0xA000:
        return rom[6 * 0x2000 + a - 0x8000]
    if a < 0xC000:
        return rom[7 * 0x2000 + a - 0xA000]
    raise ValueError


CHAN = ['SQ1', 'SQ2', 'TRI', 'NOI']
ids = [int(x, 16) for x in args] or range(0xB0)
for sid in ids:
    p = (rd(0x8A43 + sid * 2) << 8) | rd(0x8A43 + sid * 2 + 1)
    if p == 0 or p >= 0xC000 or rd(p) == 0:
        continue
    print('effect %02X at %04X, header %02X (priority %d)' % (sid, p, rd(p), rd(p) & 0x7F))
    a = p + 1
    while True:
        f = rd(a); a += 1
        if f & 0x80:
            print('  end'); break
        line = []
        if f & 1:
            line.append('jump count=%d to %02X%02X' % (rd(a), rd(a + 1), rd(a + 2))); a += 3
        if f & 2:
            line.append('gate=%02X' % rd(a)); a += 1
        if f & 4:
            line.append('transpose=%02X' % rd(a)); a += 1
        delay, mask = rd(a), rd(a + 1); a += 2
        line.append('delay=%d' % delay)
        print('  record', ' '.join(line), 'mask=%X' % mask)
        for bit in range(4):
            if mask >> bit & 1:
                pm = rd(a); a += 1
                names = ['instr', 'noisevol', 'vol', 'parD', 'parC']
                ps = []
                for b in range(5):
                    if pm >> b & 1:
                        ps.append('%s=%02X' % (names[b], rd(a))); a += 1
                print('    %s %s note=%02X' % (CHAN[bit], ' '.join(ps), rd(a))); a += 1
        if f & 1:
            print('  (loops, stop dumping)'); break
