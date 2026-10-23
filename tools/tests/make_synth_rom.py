"""Build a synthetic 128K PRG ROM + FCEUX-style CDL that exercises the disassembler (used by selftest.py):
 - RESET/NMI/IRQ in bank 0F, a JMP-indirect dispatch with a word table (J flags),
 - a split lo/hi table, an RTS-trick table,
 - bank 09 'stage' region with a J-flagged byte inside tile data (false table bait),
 - bank 0C table of $B300+3k stub addresses, stubs in bank 03 and 0B.
"""
import struct, sys
PRG = bytearray(b'\xFF' * 0x20000)
CDL = bytearray(0x20000)
C, D, J = 1, 2, 0x10

def off(b, a): return b * 0x2000 + (a & 0x1FFF)
def put(b, a, data, flags):
    o = off(b, a)
    PRG[o:o + len(data)] = data
    for i in range(len(data)): CDL[o + i] |= flags
def code(b, a, data): put(b, a, data, C)
def data(b, a, data_):
    put(b, a, data_, D)

# ---- bank 0F: RESET at FE00
code(15, 0xFE00, bytes([0x78, 0xD8, 0xA2, 0xFF, 0x9A]))          # SEI CLD LDX #$FF TXS
code(15, 0xFE05, bytes([0xA9, 0x00, 0x85, 0xF4, 0xA9, 0x01, 0x85, 0xF5]))  # LDA #0 STA $F4 ; LDA #1 STA $F5
code(15, 0xFE0D, bytes([0x20, 0x20, 0xFE]))                      # JSR $FE20
code(15, 0xFE10, bytes([0x4C, 0x10, 0xFE]))                      # JMP $FE10
# dispatcher at FE20: LDA $30 ; ASL ; TAY ; LDA tbl,Y ; STA $00 ; LDA tbl+1,Y ; STA $01 ; JMP ($0000)
code(15, 0xFE20, bytes([0xA5, 0x30, 0x0A, 0xA8, 0xB9, 0x40, 0xFE, 0x85, 0x00, 0xB9, 0x41, 0xFE, 0x85, 0x01, 0x6C, 0x00, 0x00]))
# word table FE40: -> FE60, FE70 (bank 0F code, J-flagged), FE80 (never executed, unknown)
data(15, 0xFE40, struct.pack('<HHH', 0xFE60, 0xFE70, 0xFE80))
put(15, 0xFE60, bytes([0xE6, 0x30, 0x60]), C | J)                # INC $30 ; RTS   (J on first byte)
put(15, 0xFE70, bytes([0xC6, 0x30, 0x60]), C | J)
PRG[off(15, 0xFE80):off(15, 0xFE80) + 3] = bytes([0xA9, 0x05, 0x60])  # unknown but code-like
# split lo/hi table at FEA0/FEA3 used by LDA lo,X / LDA hi,X at FE90
code(15, 0xFE90, bytes([0xBD, 0xA0, 0xFE, 0x85, 0x00, 0xBD, 0xA3, 0xFE, 0x85, 0x01, 0x6C, 0x00, 0x00]))
data(15, 0xFEA0, bytes([0x60, 0x70, 0xB0, 0xFE, 0xFE, 0xFE]))
# RTS trick: LDA hi,Y PHA LDA lo,Y PHA RTS at FEB0 ; table FEC0 words = target-1
put(15, 0xFEB0, bytes([0xB9, 0xC1, 0xFE, 0x48, 0xB9, 0xC0, 0xFE, 0x48, 0x60]), C | J)
data(15, 0xFEC0, struct.pack('<HHH', 0xFE5F, 0xFE6F, 0xFE7F))
# vectors
data(15, 0xFFFA, struct.pack('<HHH', 0xFE10, 0xFE00, 0xFE10))
# ---- bank 0C: AI table lo/hi of $B300+3k, read from code; stubs in bank 03 and 0B
code(12, 0x8000, bytes([0xB9, 0x20, 0x80, 0x85, 0x00, 0xB9, 0x48, 0x80, 0x85, 0x01, 0x6C, 0x00, 0x00]))
addrs = [0x8100 + k for k in range(32)] + [0xB300 + 3 * k for k in range(9)]
for k in range(32): put(12, 0x8100 + k, bytes([0x60]), C | J)
data(12, 0x8020, bytes(a & 0xFF for a in addrs))
data(12, 0x8048, bytes(a >> 8 for a in addrs))
SEEN = {3: (0, 1, 3, 5), 11: (2,)}
for b in (3, 11):
    for k in range(9):
        tgt = 0xB330 if k % 2 else 0xB340 + k
        if k in SEEN[b]:
            put(b, 0xB300 + 3 * k, bytes([0x4C, tgt & 0xFF, tgt >> 8]), C | J)
        else:
            PRG[off(b, 0xB300 + 3 * k):off(b, 0xB300 + 3 * k) + 3] = bytes([0x4C, 0x30, 0xB3])
    put(b, 0xB330, bytes([0x60]), C)
    for k in range(8): put(b, 0xB340 + k, bytes([0x60]), C)
# ---- bank 09: stage layout; tile data containing a word that points at J-flagged 0F:FE60 (false table bait)
for a in range(0xAF00, 0xB700, 1): PRG[off(9, a)] = 0x21
for a in range(0xB700, 0xBB00, 4): PRG[off(9, a):off(9, a) + 4] = bytes([0x44, 0x45, 0x4C, 0x4D])
PRG[off(9, 0xB873):off(9, 0xB873) + 6] = struct.pack('<HHH', 0x9821, 0x98EC, 0xFE60)
for a in range(0xAF00, 0xC000, 16): CDL[off(9, a)] |= D
CDL[off(9, 0xB318)] |= D
data(9, 0xAE60, bytes([0, 1, 2, 3, 3]))
PRG[off(9, 0xAE60) + 5:off(9, 0xAE60) + 8] = bytes([0x14, 0xA1, 0x58])
# code in bank 09 at A000 that reads a byte of the stage data (so bank 09 has code)
code(9, 0xA000, bytes([0xAD, 0x60, 0xAE, 0x60]))
# bank 00/01 + others: leave $FF
hdr = bytes([0x4E, 0x45, 0x53, 0x1A, 8, 16, 0x40, 0x08, 0, 0, 0, 0, 0, 0, 0, 0])
chr_ = bytes(0x20000)


def write(rom_path, cdl_path):
    open(rom_path, 'wb').write(hdr + bytes(PRG) + chr_)
    open(cdl_path, 'wb').write(bytes(CDL) + bytes(0x20000))


if __name__ == '__main__':
    write(sys.argv[1] if len(sys.argv) > 1 else 'synth.nes', sys.argv[2] if len(sys.argv) > 2 else 'synth.cdl')

