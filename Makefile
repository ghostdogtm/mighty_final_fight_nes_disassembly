# Build and verify the disassembly (needs ca65/ld65 and Python 3 in PATH)
ROM = Mighty Final Fight (U) [!].nes

.PHONY: all gen check test clean

all: mff.nes

mff.nes: $(wildcard src/*.asm src/*.inc) config.cfg
	ca65 -g src/main.asm -o src/main.o
	ld65 -C config.cfg -Ln mff_labels.txt -m mff.map -o mff.nes src/main.o

# regenerate src/ from the ROM, CDL and tools/labels/*.txt
gen:
	python tools/disasm.py --build

# byte-for-byte comparison with the original ROM
check: mff.nes
	cmp mff.nes "$(ROM)" && echo IDENTICAL

test: check
	python tools/lint_labels.py
	python tools/reloc_test.py
	python tools/selftest.py

clean:
	rm -f mff.nes mff.map mff_labels.txt src/main.o
