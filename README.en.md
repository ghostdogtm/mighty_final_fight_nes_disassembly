# Mighty Final Fight (U) — ca65 disassembly

[Українська версія](README.md)

A disassembly of **Mighty Final Fight** (NES, USA, MMC3, 128 KB PRG + 128 KB CHR) for the ca65/ld65 assembler,
plus the Python scripts that generate it from the ROM and an FCEUX CDL file. The result rebuilds
**byte-for-byte** into the original ROM.

> The ROM, the CDL and the game graphics are **not** part of this repository. You need your own ROM;
> the graphics (CHR) are extracted from it by a script.

## Setup and build

Requirements: [cc65](https://cc65.github.io/) (`ca65` and `ld65` in `PATH`) and Python 3.8+ (standard library only).

1. Put your ROM in the repository root, named `Mighty Final Fight (U) [!].nes`.
   Expected checksums (iNES file with header, 262160 bytes):
   - CRC32 `15EB0BEE`
   - SHA-1 `1bb410bc457694fe3109791b6be8f75bf157b8c8`
2. Extract the graphics from the ROM (creates `src/chr/chr_XX.chr` and PNG sheets in `gfx/`):
   ```
   python tools/chr_tool.py split
   ```
3. Build:
   ```
   assemble.bat        # ca65 + ld65 -> mff.nes, mff.map, mff_labels.txt
   compare.bat         # fc /b mff.nes against the original (must match completely)
   ```
   (or manually: `ca65 -g src/main.asm -o src/main.o` and
   `ld65 -C config.cfg -Ln mff_labels.txt -m mff.map -o mff.nes src/main.o`)

### Editing graphics
`gfx/sheet_NN.png` are sheets of 8 KB of CHR each (1 KB banks NN\*8 … NN\*8+7), 16 tiles per row, 2-bit indexed PNG.
After editing in any editor that preserves palette indices:
```
python tools/chr_tool.py png2chr    # gfx/sheet_XX.png -> src/chr/chr_XX.chr
```

## Regenerating the assembly from a CDL
Requires the ROM and your own FCEUX CDL (`Mighty Final Fight (U) [!].cdl`, same directory):
```
python tools/disasm.py --build      # generate src/, build mff.nes and compare with the original
```
Options: `--out DIR` (write to another directory), `--no-trace` (skip static code tracing), `--no-chr`,
`--rom`, `--cdl`.

**Warning:** `disasm.py` overwrites `src/`. Once you start editing `src/*.asm` by hand, do not run it in the same
directory (generate with `--out` and diff instead). As long as the asm is not hand-edited, keep label and RAM names
in `tools/labels/*.txt` and regenerate.

## Layout
| Path | Contents |
|---|---|
| `src/bank_00..0F.asm` | 16 PRG banks of 8 KB. 00–0D are switchable ($8000 for even, $A000 for odd), 0E=$C000, 0F=$E000 (fixed) |
| `src/defines.inc`, `src/ram.inc` | PPU/APU/MMC3 registers and RAM labels (`ram.inc` is generated from `tools/labels/ram.txt` plus auto names `ram_XXXX`, `ptr_XX`) |
| `src/chr.asm` | `.incbin` lines for the 1 KB CHR files |
| `src/chr/chr_XX.chr`, `gfx/` | **not in the repository**, created by `chr_tool.py split` (XX = MMC3 1 KB bank number) |
| `header.bin`, `config.cfg` | iNES header; ld65 config (one MEMORY area per bank) |
| `mff.mlb` | labels for Mesen (Debugger → Labels → Import) |
| `docs/coverage.txt` | coverage: code/data/unknown per bank, traced code, largest unknown regions |
| `tools/disasm.py`, `opcodes.py` | asm generator from ROM + CDL |
| `tools/reloc_test.py` | relocation test: rebuilds with all switchable banks moved by $100; only address bytes may change |
| `tools/chr_tool.py` | CHR ↔ 1 KB `.chr` ↔ PNG |
| `tools/labels/ram.txt` | RAM names: `ADDR NAME [SIZE] ; comment` |
| `tools/labels/rom.txt` | ROM labels `BB:ADDR name`, forced ranges `code\|data\|words BB:ADDR-ADDR`, `note BB:ADDR text` |

## Line format
`LDA ram_0061   ;C - - - - - 0x01E010 0F:E000: A5 61` — CDL flags (`C` code, `D` data, CPU bank number for data,
`J` indirect jump target, `I` indirect data, `A` PCM), offset in the `.nes` file, bank (8 KB):address, bytes.
A lowercase `c` means the code was found by tracing (the emulator never saw it; check it by hand — the list is in
`docs/coverage.txt`). `W` marks a word of a pointer table (`.word`). `- - - - - -` marks bytes the CDL never touched.

## What the generator does
1. Classifies code/data from the CDL. Instructions straddling a bank boundary ($9FFF→$A000, $DFFF→$E000) and
   branches into the neighbouring bank stay `.byte` with the decoded form in a comment (ca65 cannot branch
   between segments).
2. Traces extra code from branches/`JSR`/`JMP`/fall-throughs into unknown bytes (a path is rejected on an invalid
   opcode, `BRK`, or running into data).
3. Finds pointer tables (including the "RTS trick", `.word label-1`): the anchor is a word pointing to code with the
   `J` flag, then the table is extended in both directions. Table targets are traced too.
4. Names labels `sub_/loc_/ofs_/tbl_/dat_BB_AAAA`. The bank behind an `$8000–$BFFF` address is determined by (a) a single
   CDL candidate, (b) banks that are always mapped as a pair (00/01, 04/05, 08/09, 0C/0D), (c) linear tracking of the values
   stored to `prgBank8000/prgBankA000` ($F4/$F5) in the fixed banks. These operands carry `bank=NN` in the comment.
5. Split address tables (low and high bytes separately, `LDA lo,Y` / `LDA hi,Y`) are emitted as `.lobytes`/`.hibytes`;
   `LDA #lo / STA zp / LDA #hi / STA zp+1` pairs become `#<label` / `#>label`.
6. Unknown runs of 16+ bytes that decode cleanly and end in `RTS/RTI/JMP` are adopted as unreached code (`c`).
7. Runs of identical bytes (8+) are collapsed into `.res N, $xx`.

## Known limitations
- About 24 KB of PRG (≈19 %) was never seen by the CDL and tracing did not turn it into code — it is mostly data the
  game did not read during play. It stays as `.byte` (largest regions in `docs/coverage.txt`).
- Operands in `$8000–$BFFF` whose bank depends on the stage or animation set (`stageBankTable`) cannot be resolved statically; they are named with `rawsym AAAA name` in `rom.txt` (`stagePalettes_s0`, `animPtrLo`, …). One stays raw (listed in `docs/coverage.txt`).
- `rom.txt` directives: `comment BB:AAAA text` appends a comment to a line; `bewords BB:LO-HI` emits big-endian address pairs (hi, lo) as `>label,<label`; `text BB:LO-HI` emits strings per line with the decoded text (tile = ASCII−$31 for A-Z, `$00` space, `$FE` newline, `$FF` end); `table BB:LO-HI N header` emits a range N bytes per row with a comment; `bank BB:AAAA TT` states the bank behind a raw `$8000–$BFFF` operand of the instruction at BB:AAAA.
