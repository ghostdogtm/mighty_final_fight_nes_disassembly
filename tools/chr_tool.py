#!/usr/bin/env python3
"""CHR ROM <-> files.

  python tools/chr_tool.py split   [--rom ROM] [--out DIR]   ROM CHR -> src/chr/chr_XX.chr (1KB each),
                                                              src/chr.asm, gfx/sheet_XX.png
  python tools/chr_tool.py png2chr [--out DIR]               gfx/sheet_XX.png -> src/chr/chr_XX.chr

chr_XX.chr: XX = number of the 1KB CHR bank (the value written to MMC3 R2-R5 / 2KB banks R0-R1 use 2 per step).
sheet_NN.png: 8KB = 8 consecutive 1KB banks (NN*8 .. NN*8+7), 16 tiles per row, 32 rows -> 128x256 px,
2-bit indexed PNG (index 0..3 = tile colour 0..3, drawn in grey). Edit in any editor that keeps the palette indices.
"""
import argparse
import os
import struct
import sys
import zlib

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
GREY = [(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)]
SHEET_W, SHEET_H = 128, 256


def tile_pixels(t16):
    rows = []
    for y in range(8):
        p0, p1 = t16[y], t16[y + 8]
        rows.append([((p0 >> (7 - x)) & 1) | (((p1 >> (7 - x)) & 1) << 1) for x in range(8)])
    return rows


def sheet_to_pixels(data8k):
    px = [[0] * SHEET_W for _ in range(SHEET_H)]
    for t in range(512):
        tx, ty = (t % 16) * 8, (t // 16) * 8
        for y, row in enumerate(tile_pixels(data8k[t * 16:t * 16 + 16])):
            px[ty + y][tx:tx + 8] = row
    return px


def pixels_to_sheet(px):
    out = bytearray()
    for t in range(512):
        tx, ty = (t % 16) * 8, (t // 16) * 8
        p0, p1 = bytearray(8), bytearray(8)
        for y in range(8):
            for x in range(8):
                v = px[ty + y][tx + x] & 3
                p0[y] |= (v & 1) << (7 - x)
                p1[y] |= (v >> 1) << (7 - x)
        out += p0 + p1
    return bytes(out)


def _chunk(tag, data):
    c = struct.pack('>I', len(data)) + tag + data
    return c + struct.pack('>I', zlib.crc32(tag + data) & 0xFFFFFFFF)


def write_png(path, px):
    w, h = len(px[0]), len(px)
    raw = bytearray()
    for row in px:
        raw.append(0)
        for x in range(0, w, 4):
            raw.append((row[x] << 6) | (row[x + 1] << 4) | (row[x + 2] << 2) | row[x + 3])
    pal = b''.join(bytes(c) for c in GREY)
    with open(path, 'wb') as f:
        f.write(b'\x89PNG\r\n\x1a\n' + _chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 2, 3, 0, 0, 0))
                + _chunk(b'PLTE', pal) + _chunk(b'IDAT', zlib.compress(bytes(raw), 9)) + _chunk(b'IEND', b''))


def read_png(path):
    d = open(path, 'rb').read()
    if d[:8] != b'\x89PNG\r\n\x1a\n':
        sys.exit('%s: not a PNG' % path)
    pos, idat, pal = 8, b'', None
    while pos < len(d):
        n, tag = struct.unpack('>I4s', d[pos:pos + 8])
        body = d[pos + 8:pos + 8 + n]
        pos += 12 + n
        if tag == b'IHDR':
            w, h, depth, ctype, _, _, interlace = struct.unpack('>IIBBBBB', body)
        elif tag == b'PLTE':
            pal = body
        elif tag == b'IDAT':
            idat += body
    if interlace or ctype not in (0, 3) or depth not in (1, 2, 4, 8):
        sys.exit('%s: need non-interlaced indexed/grey PNG (type %d depth %d)' % (path, ctype, depth))
    raw = zlib.decompress(idat)
    stride = (w * depth + 7) // 8
    prev = bytearray(stride)
    px, p = [], 0
    for _ in range(h):
        ft = raw[p]
        line = bytearray(raw[p + 1:p + 1 + stride])
        p += 1 + stride
        for i in range(stride):
            a = line[i - 1] if i else 0          # bpp = 1 byte granularity for depth <= 8
            b, c = prev[i], prev[i - 1] if i else 0
            if ft == 1:
                line[i] = (line[i] + a) & 255
            elif ft == 2:
                line[i] = (line[i] + b) & 255
            elif ft == 3:
                line[i] = (line[i] + (a + b) // 2) & 255
            elif ft == 4:
                pa, pb, pc = abs(b - c), abs(a - c), abs(a + b - 2 * c)
                pr = a if pa <= pb and pa <= pc else b if pb <= pc else c
                line[i] = (line[i] + pr) & 255
        prev = line
        row = []
        for x in range(w):
            bit = x * depth
            row.append((line[bit // 8] >> (8 - depth - (bit % 8))) & ((1 << depth) - 1))
        px.append(row)
    if ctype == 0:                                # grey: quantise to 4 levels
        top = (1 << depth) - 1
        px = [[min(3, v * 4 // (top + 1)) for v in r] for r in px]
    else:                                         # palette: keep indices, but warn if palette was reordered
        if pal and [tuple(pal[i * 3:i * 3 + 3]) for i in range(min(4, len(pal) // 3))] != GREY[:min(4, len(pal) // 3)]:
            print('  note: %s palette differs from the exported one, using indices 0-3 as colours' % path)
    if (w, h) != (SHEET_W, SHEET_H):
        sys.exit('%s: expected %dx%d, got %dx%d' % (path, SHEET_W, SHEET_H, w, h))
    return px


def split(rom_path, out):
    d = open(rom_path, 'rb').read()
    chr_ = d[16 + d[4] * 0x4000:16 + d[4] * 0x4000 + d[5] * 0x2000]
    cdir, gdir = os.path.join(out, 'src', 'chr'), os.path.join(out, 'gfx')
    os.makedirs(cdir, exist_ok=True)
    os.makedirs(gdir, exist_ok=True)
    nk = len(chr_) // 0x400
    asm = ['; CHR ROM, %d x 1KB banks (chr_XX = MMC3 1KB bank number)' % nk, '.segment "CHR_ROM"', '']
    for k in range(nk):
        open(os.path.join(cdir, 'chr_%02X.chr' % k), 'wb').write(chr_[k * 0x400:(k + 1) * 0x400])
        if k % 8 == 0:
            asm.append(';%02X' % k)
        asm.append('\t.incbin "chr/chr_%02X.chr"' % k)
    with open(os.path.join(out, 'src', 'chr.asm'), 'w', newline='\n') as f:
        f.write('\n'.join(asm) + '\n')
    for s in range(len(chr_) // 0x2000):
        write_png(os.path.join(gdir, 'sheet_%02X.png' % s), sheet_to_pixels(chr_[s * 0x2000:(s + 1) * 0x2000]))
    print('chr: %d banks of 1KB, %d PNG sheets' % (nk, len(chr_) // 0x2000))


def png2chr(out):
    gdir, cdir = os.path.join(out, 'gfx'), os.path.join(out, 'src', 'chr')
    for s in range(16):
        p = os.path.join(gdir, 'sheet_%02X.png' % s)
        if not os.path.exists(p):
            continue
        data = pixels_to_sheet(read_png(p))
        for j in range(8):
            open(os.path.join(cdir, 'chr_%02X.chr' % (s * 8 + j)), 'wb').write(data[j * 0x400:(j + 1) * 0x400])
        print('imported', p)


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('cmd', choices=['split', 'png2chr'])
    ap.add_argument('--rom', default=os.path.join(ROOT, 'Mighty Final Fight (U) [!].nes'))
    ap.add_argument('--out', default=ROOT)
    a = ap.parse_args()
    split(a.rom, a.out) if a.cmd == 'split' else png2chr(a.out)
