@echo off
del mff.nes mff.map mff_labels.txt 2>nul
ca65 -g src/main.asm -o src/main.o
if errorlevel 1 exit /b 1
ld65 -C config.cfg -Ln mff_labels.txt -m mff.map -o mff.nes src/main.o
