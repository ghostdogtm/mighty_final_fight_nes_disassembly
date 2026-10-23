.segment "BANK_0E"
; 0x01C010-0x01E00F  CPU $C000-$DFFF

NMI:
	PHP                             ;C D 2 - - - 0x01C010 0E:C000: 08
	PHA                             ;C D 2 - - - 0x01C011 0E:C001: 48
	TXA                             ;C - - - - - 0x01C012 0E:C002: 8A
	PHA                             ;C - - - - - 0x01C013 0E:C003: 48
	TYA                             ;C - - - - - 0x01C014 0E:C004: 98
	PHA                             ;C - - - - - 0x01C015 0E:C005: 48
	LDA PPUSTATUS                   ;C - - - - - 0x01C016 0E:C006: AD 02 20
	LDA bufPPUCTRL                  ;C - - - - - 0x01C019 0E:C009: A5 FF
	AND #$7F                        ;C - - - - - 0x01C01B 0E:C00B: 29 7F
	STA PPUCTRL                     ;C - - - - - 0x01C01D 0E:C00D: 8D 00 20
	LDA #$00                        ;C - - - - - 0x01C020 0E:C010: A9 00
	STA PPUMASK                     ;C - - - - - 0x01C022 0E:C012: 8D 01 20
	LDA renderOffCount              ;C - - - - - 0x01C025 0E:C015: A5 EE
	ORA nmiSkipFlag                 ;C - - - - - 0x01C027 0E:C017: 05 9A
	BEQ loc_0E_C01E                 ;C - - - - - 0x01C029 0E:C019: F0 03
	JMP loc_0E_C09D                 ;C - - - - - 0x01C02B 0E:C01B: 4C 9D C0
loc_0E_C01E:
	LDA vramQueueFlag               ;C - - - - - 0x01C02E 0E:C01E: A5 64
	BEQ loc_0E_C029                 ;C - - - - - 0x01C030 0E:C020: F0 07
	LDX #$00                        ;C - - - - - 0x01C032 0E:C022: A2 00
	STX vramQueueFlag               ;C - - - - - 0x01C034 0E:C024: 86 64
	JSR FlushVramQueue              ;C - - - - - 0x01C036 0E:C026: 20 22 C2
loc_0E_C029:
	LDA scrollX                     ;C - - - - - 0x01C039 0E:C029: A5 FC
	STA irqScrollX                  ;C - - - - - 0x01C03B 0E:C02B: 85 7D
	LDA nametableSelect             ;C - - - - - 0x01C03D 0E:C02D: A5 FD
	STA irqNametable                ;C - - - - - 0x01C03F 0E:C02F: 85 7E
	LDA ram_00F8                    ;C - - - - - 0x01C041 0E:C031: A5 F8
	STA irqScrollY                  ;C - - - - - 0x01C043 0E:C033: 85 7C
	LDA #$00                        ;C - - - - - 0x01C045 0E:C035: A9 00
	STA OAMADDR                     ;C - - - - - 0x01C047 0E:C037: 8D 03 20
	LDA #$02                        ;C - - - - - 0x01C04A 0E:C03A: A9 02
	STA OAMDMA                      ;C - - - - - 0x01C04C 0E:C03C: 8D 14 40
	LDA vramUpdateFlag0             ;C - - - - - 0x01C04F 0E:C03F: A5 19
	BEQ loc_0E_C046                 ;C - - - - - 0x01C051 0E:C041: F0 03
	JSR FlushVramBuffer             ;C - - - - - 0x01C053 0E:C043: 20 FD C1
loc_0E_C046:
	LDA vramUpdateFlag1             ;C - - - - - 0x01C056 0E:C046: A5 1A
	BEQ loc_0E_C061                 ;C - - - - - 0x01C058 0E:C048: F0 17
	LDA bufPPUCTRL                  ;C - - - - - 0x01C05A 0E:C04A: A5 FF
	AND #$7F                        ;C - - - - - 0x01C05C 0E:C04C: 29 7F
	ORA #$04                        ;C - - - - - 0x01C05E 0E:C04E: 09 04
	STA PPUCTRL                     ;C - - - - - 0x01C060 0E:C050: 8D 00 20
	LDX #$00                        ;C - - - - - 0x01C063 0E:C053: A2 00
	STX vramUpdateFlag1             ;C - - - - - 0x01C065 0E:C055: 86 1A
	JSR FlushVramBufferNoClear      ;C - - - - - 0x01C067 0E:C057: 20 01 C2
	LDA bufPPUCTRL                  ;C - - - - - 0x01C06A 0E:C05A: A5 FF
	AND #$7F                        ;C - - - - - 0x01C06C 0E:C05C: 29 7F
	STA PPUCTRL                     ;C - - - - - 0x01C06E 0E:C05E: 8D 00 20
loc_0E_C061:
	LDA palUpdateFlag               ;C - - - - - 0x01C071 0E:C061: A5 18
	BEQ loc_0E_C08E                 ;C - - - - - 0x01C073 0E:C063: F0 29
	LDX #$00                        ;C - - - - - 0x01C075 0E:C065: A2 00
	STX palUpdateFlag               ;C - - - - - 0x01C077 0E:C067: 86 18
	LDA PPUSTATUS                   ;C - - - - - 0x01C079 0E:C069: AD 02 20
	LDA #$3F                        ;C - - - - - 0x01C07C 0E:C06C: A9 3F
	STA PPUADDR                     ;C - - - - - 0x01C07E 0E:C06E: 8D 06 20
	STX PPUADDR                     ;C - - - - - 0x01C081 0E:C071: 8E 06 20
	LDY #$20                        ;C - - - - - 0x01C084 0E:C074: A0 20
loc_0E_C076:
	LDA palBuffer,X                 ;C - - - - - 0x01C086 0E:C076: BD 00 06
	STA PPUDATA                     ;C - - - - - 0x01C089 0E:C079: 8D 07 20
	INX                             ;C - - - - - 0x01C08C 0E:C07C: E8
	DEY                             ;C - - - - - 0x01C08D 0E:C07D: 88
	BNE loc_0E_C076                 ;C - - - - - 0x01C08E 0E:C07E: D0 F6
	LDA #$3F                        ;C - - - - - 0x01C090 0E:C080: A9 3F
	STA PPUADDR                     ;C - - - - - 0x01C092 0E:C082: 8D 06 20
	STY PPUADDR                     ;C - - - - - 0x01C095 0E:C085: 8C 06 20
	STY PPUADDR                     ;C - - - - - 0x01C098 0E:C088: 8C 06 20
	STY PPUADDR                     ;C - - - - - 0x01C09B 0E:C08B: 8C 06 20
loc_0E_C08E:
	LDX #$02                        ;C - - - - - 0x01C09E 0E:C08E: A2 02
loc_0E_C090:
	STX MMC3_BANK_SELECT            ;C - - - - - 0x01C0A0 0E:C090: 8E 00 80
	LDA chrBankShadow,X             ;C - - - - - 0x01C0A3 0E:C093: B5 E8
	STA MMC3_BANK_DATA              ;C - - - - - 0x01C0A5 0E:C095: 8D 01 80
	INX                             ;C - - - - - 0x01C0A8 0E:C098: E8
	CPX #$06                        ;C - - - - - 0x01C0A9 0E:C099: E0 06
	BNE loc_0E_C090                 ;C - - - - - 0x01C0AB 0E:C09B: D0 F3
loc_0E_C09D:
	LDA PPUSTATUS                   ;C - - - - - 0x01C0AD 0E:C09D: AD 02 20
	LDA #$00                        ;C - - - - - 0x01C0B0 0E:C0A0: A9 00
	STA PPUSCROLL                   ;C - - - - - 0x01C0B2 0E:C0A2: 8D 05 20
	LDA scrollY                     ;C - - - - - 0x01C0B5 0E:C0A5: A5 FA
	STA PPUSCROLL                   ;C - - - - - 0x01C0B7 0E:C0A7: 8D 05 20
	LDA ppuMaskBuf                  ;C - - - - - 0x01C0BA 0E:C0AA: A5 FE
	STA PPUMASK                     ;C - - - - - 0x01C0BC 0E:C0AC: 8D 01 20
	LDA nametableSelect             ;C - - - - - 0x01C0BF 0E:C0AF: A5 FD
	AND #$01                        ;C - - - - - 0x01C0C1 0E:C0B1: 29 01
	ORA bufPPUCTRL                  ;C - - - - - 0x01C0C3 0E:C0B3: 05 FF
	STA PPUCTRL                     ;C - - - - - 0x01C0C5 0E:C0B5: 8D 00 20
	LDX #$01                        ;C - - - - - 0x01C0C8 0E:C0B8: A2 01
loc_0E_C0BA:
	STX MMC3_BANK_SELECT            ;C - - - - - 0x01C0CA 0E:C0BA: 8E 00 80
	LDA chrBankShadow,X             ;C - - - - - 0x01C0CD 0E:C0BD: B5 E8
	STA MMC3_BANK_DATA              ;C - - - - - 0x01C0CF 0E:C0BF: 8D 01 80
	DEX                             ;C - - - - - 0x01C0D2 0E:C0C2: CA
	BPL loc_0E_C0BA                 ;C - - - - - 0x01C0D3 0E:C0C3: 10 F5
	LDA mmc3SelectShadow            ;C - - - - - 0x01C0D5 0E:C0C5: A5 F0
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01C0D7 0E:C0C7: 8D 00 80
	LDA #$21                        ;C - - - - - 0x01C0DA 0E:C0CA: A9 21
	STA MMC3_IRQ_LATCH              ;C - - - - - 0x01C0DC 0E:C0CC: 8D 00 C0
	STA MMC3_IRQ_RELOAD             ;C - - - - - 0x01C0DF 0E:C0CF: 8D 01 C0
	LDA #<IrqSplit1                 ;C - - - - - 0x01C0E2 0E:C0D2: A9 4A
	STA irqVector                   ;C - - - - - 0x01C0E4 0E:C0D4: 85 9C
	LDA #>IrqSplit1                 ;C - - - - - 0x01C0E6 0E:C0D6: A9 C1
	STA irqVector+1                 ;C - - - - - 0x01C0E8 0E:C0D8: 85 9D
	LDX irqEnableIdx                ;C - - - - - 0x01C0EA 0E:C0DA: A6 9B
	STA $E000,X                     ;C - - - - - 0x01C0EC 0E:C0DC: 9D 00 E0  ; write to $E000+X (MMC3 IRQ disable/enable, X = ram_009B)
	INC frameCounter                ;C - - - - - 0x01C0EF 0E:C0DF: E6 92
	LDX #$FF                        ;C - - - - - 0x01C0F1 0E:C0E1: A2 FF
	STX nmiTickFlag                 ;C - - - - - 0x01C0F3 0E:C0E3: 86 90
	INX                             ;C - - - - - 0x01C0F5 0E:C0E5: E8
	LDY #$04                        ;C - - - - - 0x01C0F6 0E:C0E6: A0 04
loc_0E_C0E8:
	LDA taskTable,X                 ;C - - - - - 0x01C0F8 0E:C0E8: B5 80
	CMP #$01                        ;C - - - - - 0x01C0FA 0E:C0EA: C9 01
	BNE loc_0E_C0F6                 ;C - - - - - 0x01C0FC 0E:C0EC: D0 08
	DEC taskTable+1,X               ;C - - - - - 0x01C0FE 0E:C0EE: D6 81
	BNE loc_0E_C0F6                 ;C - - - - - 0x01C100 0E:C0F0: D0 04
	LDA #$04                        ;C - - - - - 0x01C102 0E:C0F2: A9 04
	STA taskTable,X                 ;C - - - - - 0x01C104 0E:C0F4: 95 80
loc_0E_C0F6:
	INX                             ;C - - - - - 0x01C106 0E:C0F6: E8
	INX                             ;C - - - - - 0x01C107 0E:C0F7: E8
	INX                             ;C - - - - - 0x01C108 0E:C0F8: E8
	INX                             ;C - - - - - 0x01C109 0E:C0F9: E8
	DEY                             ;C - - - - - 0x01C10A 0E:C0FA: 88
	BNE loc_0E_C0E8                 ;C - - - - - 0x01C10B 0E:C0FB: D0 EB
	TSX                             ;C - - - - - 0x01C10D 0E:C0FD: BA
	LDA palAnimStep+3,X             ;C - - - - - 0x01C10E 0E:C0FE: BD 07 01
	STA ram_00A1                    ;C - - - - - 0x01C111 0E:C101: 85 A1
	LDA palAnimStep+2,X             ;C - - - - - 0x01C113 0E:C103: BD 06 01
	STA ram_00A0                    ;C - - - - - 0x01C116 0E:C106: 85 A0
	LDA #$C1                        ;C - - - - - 0x01C118 0E:C108: A9 C1
	STA palAnimStep+3,X             ;C - - - - - 0x01C11A 0E:C10A: 9D 07 01
	LDA #$19                        ;C - - - - - 0x01C11D 0E:C10D: A9 19
	STA palAnimStep+2,X             ;C - - - - - 0x01C11F 0E:C10F: 9D 06 01
	PLA                             ;C - - - - - 0x01C122 0E:C112: 68
	TAY                             ;C - - - - - 0x01C123 0E:C113: A8
	PLA                             ;C - - - - - 0x01C124 0E:C114: 68
	TAX                             ;C - - - - - 0x01C125 0E:C115: AA
	PLA                             ;C - - - - - 0x01C126 0E:C116: 68
	PLP                             ;C - - - - - 0x01C127 0E:C117: 28
	RTI                             ;C - - - - - 0x01C128 0E:C118: 40
	PHP                             ;C - - - - - 0x01C129 0E:C119: 08
	PHP                             ;C - - - - - 0x01C12A 0E:C11A: 08
	PHP                             ;C - - - - - 0x01C12B 0E:C11B: 08
	PHA                             ;C - - - - - 0x01C12C 0E:C11C: 48
	TXA                             ;C - - - - - 0x01C12D 0E:C11D: 8A
	PHA                             ;C - - - - - 0x01C12E 0E:C11E: 48
	TYA                             ;C - - - - - 0x01C12F 0E:C11F: 98
	PHA                             ;C - - - - - 0x01C130 0E:C120: 48
	TSX                             ;C - - - - - 0x01C131 0E:C121: BA
	SEC                             ;C - - - - - 0x01C132 0E:C122: 38
	LDA ram_00A0                    ;C - - - - - 0x01C133 0E:C123: A5 A0
	SBC #$01                        ;C - - - - - 0x01C135 0E:C125: E9 01
	STA palAnimStep+1,X             ;C - - - - - 0x01C137 0E:C127: 9D 05 01
	LDA ram_00A1                    ;C - - - - - 0x01C13A 0E:C12A: A5 A1
	SBC #$00                        ;C - - - - - 0x01C13C 0E:C12C: E9 00
	STA palAnimStep+2,X             ;C - - - - - 0x01C13E 0E:C12E: 9D 06 01
	JSR SoundUpdate                 ;C - - - - - 0x01C141 0E:C131: 20 72 FF
	PLA                             ;C - - - - - 0x01C144 0E:C134: 68
	TAY                             ;C - - - - - 0x01C145 0E:C135: A8
	PLA                             ;C - - - - - 0x01C146 0E:C136: 68
	TAX                             ;C - - - - - 0x01C147 0E:C137: AA
	PLA                             ;C - - - - - 0x01C148 0E:C138: 68
	PLP                             ;C - - - - - 0x01C149 0E:C139: 28
	RTS                             ;C - - - - - 0x01C14A 0E:C13A: 60
IRQ:
	PHP                             ;C - - - - - 0x01C14B 0E:C13B: 08
	PHA                             ;C - - - - - 0x01C14C 0E:C13C: 48
	TXA                             ;C - - - - - 0x01C14D 0E:C13D: 8A
	PHA                             ;C - - - - - 0x01C14E 0E:C13E: 48
	TYA                             ;C - - - - - 0x01C14F 0E:C13F: 98
	PHA                             ;C - - - - - 0x01C150 0E:C140: 48
	STA MMC3_IRQ_DISABLE            ;C - - - - - 0x01C151 0E:C141: 8D 00 E0
	STA MMC3_IRQ_ENABLE             ;C - - - - - 0x01C154 0E:C144: 8D 01 E0
	JMP (irqVector)                 ;C - - - - - 0x01C157 0E:C147: 6C 9C 00
IrqSplit1:
	LDA stage                       ;C - - J - - 0x01C15A 0E:C14A: A5 61
	CMP #$01                        ;C - - - - - 0x01C15C 0E:C14C: C9 01
	BNE loc_0E_C177                 ;C - - - - - 0x01C15E 0E:C14E: D0 27
	LDA stageSection                ;C - - - - - 0x01C160 0E:C150: A5 60
	CMP #$01                        ;C - - - - - 0x01C162 0E:C152: C9 01
	BEQ loc_0E_C15A                 ;C - - - - - 0x01C164 0E:C154: F0 04
	CMP #$02                        ;C - - - - - 0x01C166 0E:C156: C9 02
	BNE loc_0E_C177                 ;C - - - - - 0x01C168 0E:C158: D0 1D
loc_0E_C15A:
	LDA PPUSTATUS                   ;C - - - - - 0x01C16A 0E:C15A: AD 02 20
	LDA #$00                        ;C - - - - - 0x01C16D 0E:C15D: A9 00
	STA PPUSCROLL                   ;C - - - - - 0x01C16F 0E:C15F: 8D 05 20
	LDA #$22                        ;C - - - - - 0x01C172 0E:C162: A9 22
	STA PPUSCROLL                   ;C - - - - - 0x01C174 0E:C164: 8D 05 20
	LDA #$4A                        ;C - - - - - 0x01C177 0E:C167: A9 4A
	STA MMC3_IRQ_LATCH              ;C - - - - - 0x01C179 0E:C169: 8D 00 C0
	LDA #<IrqSplit2                 ;C - - - - - 0x01C17C 0E:C16C: A9 94
	STA irqVector                   ;C - - - - - 0x01C17E 0E:C16E: 85 9C
	LDA #>IrqSplit2                 ;C - - - - - 0x01C180 0E:C170: A9 C1
	STA irqVector+1                 ;C - - - - - 0x01C182 0E:C172: 85 9D
	JMP loc_0E_C1D8                 ;C - - - - - 0x01C184 0E:C174: 4C D8 C1
loc_0E_C177:
	LDA PPUSTATUS                   ;C - - - - - 0x01C187 0E:C177: AD 02 20
	LDA irqScrollX                  ;C - - - - - 0x01C18A 0E:C17A: A5 7D
	STA PPUSCROLL                   ;C - - - - - 0x01C18C 0E:C17C: 8D 05 20
	LDA #$22                        ;C - - - - - 0x01C18F 0E:C17F: A9 22
	STA PPUSCROLL                   ;C - - - - - 0x01C191 0E:C181: 8D 05 20
	LDA #$A1                        ;C - - - - - 0x01C194 0E:C184: A9 A1
	STA MMC3_IRQ_LATCH              ;C - - - - - 0x01C196 0E:C186: 8D 00 C0
	LDA #<IrqSplit3                 ;C - - - - - 0x01C199 0E:C189: A9 B1
	STA irqVector                   ;C - - - - - 0x01C19B 0E:C18B: 85 9C
	LDA #>IrqSplit3                 ;C - - - - - 0x01C19D 0E:C18D: A9 C1
	STA irqVector+1                 ;C - - - - - 0x01C19F 0E:C18F: 85 9D
	JMP loc_0E_C1D8                 ;C - - - - - 0x01C1A1 0E:C191: 4C D8 C1
IrqSplit2:
	LDA PPUSTATUS                   ;C - - J - - 0x01C1A4 0E:C194: AD 02 20
	LDA irqScrollX                  ;C - - - - - 0x01C1A7 0E:C197: A5 7D
	STA PPUSCROLL                   ;C - - - - - 0x01C1A9 0E:C199: 8D 05 20
	LDA #$22                        ;C - - - - - 0x01C1AC 0E:C19C: A9 22
	STA PPUSCROLL                   ;C - - - - - 0x01C1AE 0E:C19E: 8D 05 20
	LDA #$57                        ;C - - - - - 0x01C1B1 0E:C1A1: A9 57
	STA MMC3_IRQ_LATCH              ;C - - - - - 0x01C1B3 0E:C1A3: 8D 00 C0
	LDA #<IrqSplit3                 ;C - - - - - 0x01C1B6 0E:C1A6: A9 B1
	STA irqVector                   ;C - - - - - 0x01C1B8 0E:C1A8: 85 9C
	LDA #>IrqSplit3                 ;C - - - - - 0x01C1BA 0E:C1AA: A9 C1
	STA irqVector+1                 ;C - - - - - 0x01C1BC 0E:C1AC: 85 9D
	JMP loc_0E_C1D8                 ;C - - - - - 0x01C1BE 0E:C1AE: 4C D8 C1
IrqSplit3:
	LDA PPUSTATUS                   ;C - - J - - 0x01C1C1 0E:C1B1: AD 02 20
	LDA #$00                        ;C - - - - - 0x01C1C4 0E:C1B4: A9 00
	STA PPUSCROLL                   ;C - - - - - 0x01C1C6 0E:C1B6: 8D 05 20
	STA PPUSCROLL                   ;C - - - - - 0x01C1C9 0E:C1B9: 8D 05 20
	LDA #$00                        ;C - - - - - 0x01C1CC 0E:C1BC: A9 00
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01C1CE 0E:C1BE: 8D 00 80
	LDA #$78                        ;C - - - - - 0x01C1D1 0E:C1C1: A9 78
	STA MMC3_BANK_DATA              ;C - - - - - 0x01C1D3 0E:C1C3: 8D 01 80
	LDA #$01                        ;C - - - - - 0x01C1D6 0E:C1C6: A9 01
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01C1D8 0E:C1C8: 8D 00 80
	LDA #$7A                        ;C - - - - - 0x01C1DB 0E:C1CB: A9 7A
	STA MMC3_BANK_DATA              ;C - - - - - 0x01C1DD 0E:C1CD: 8D 01 80
	LDA mmc3SelectShadow            ;C - - - - - 0x01C1E0 0E:C1D0: A5 F0
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01C1E2 0E:C1D2: 8D 00 80
	STA MMC3_IRQ_DISABLE            ;C - - - - - 0x01C1E5 0E:C1D5: 8D 00 E0
loc_0E_C1D8:
	PLA                             ;C - - - - - 0x01C1E8 0E:C1D8: 68
	TAY                             ;C - - - - - 0x01C1E9 0E:C1D9: A8
	PLA                             ;C - - - - - 0x01C1EA 0E:C1DA: 68
	TAX                             ;C - - - - - 0x01C1EB 0E:C1DB: AA
	PLA                             ;C - - - - - 0x01C1EC 0E:C1DC: 68
	PLP                             ;C - - - - - 0x01C1ED 0E:C1DD: 28
	RTI                             ;C - - - - - 0x01C1EE 0E:C1DE: 40
; prgBankA000 = stageBankTable[stageData] unless $13, then SetPrgBanks
RefreshStageBank:
	TXA                             ;C - - - - - 0x01C1EF 0E:C1DF: 8A
	PHA                             ;C - - - - - 0x01C1F0 0E:C1E0: 48
	TYA                             ;C - - - - - 0x01C1F1 0E:C1E1: 98
	PHA                             ;C - - - - - 0x01C1F2 0E:C1E2: 48
	LDA prgBankA000                 ;C - - - - - 0x01C1F3 0E:C1E3: A5 F5
	CMP #$13                        ;C - - - - - 0x01C1F5 0E:C1E5: C9 13
	BEQ loc_0E_C1F3                 ;C - - - - - 0x01C1F7 0E:C1E7: F0 0A
	LDY stageData                   ;C - - - - - 0x01C1F9 0E:C1E9: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01C1FB 0E:C1EB: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01C1FE 0E:C1EE: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C200 0E:C1F0: 20 4D FF
loc_0E_C1F3:
	PLA                             ;C - - - - - 0x01C203 0E:C1F3: 68
	TAY                             ;C - - - - - 0x01C204 0E:C1F4: A8
	PLA                             ;C - - - - - 0x01C205 0E:C1F5: 68
	TAX                             ;C - - - - - 0x01C206 0E:C1F6: AA
	RTS                             ;C - - - - - 0x01C207 0E:C1F7: 60
; stageData -> PRG bank used in the $A000 window ($01,$05,$07,$09,$0D)
stageBankTable:
	.byte $01,$05,$07,$09,$0D       ;- D 2 - - - 0x01C208 0E:C1F8:
; clears vramUpdateFlag0 then falls into FlushVramBufferNoClear
FlushVramBuffer:
	LDX #$00                        ;C - - - - - 0x01C20D 0E:C1FD: A2 00
	STX vramUpdateFlag0             ;C - - - - - 0x01C20F 0E:C1FF: 86 19
; writes records [hi(bit7=end), lo, len-1, data] from vramQueue to PPU
FlushVramBufferNoClear:
	LDA vramQueue,X                 ;C - - - - - 0x01C211 0E:C201: BD 80 07
	BMI loc_0E_C221                 ;C - - - - - 0x01C214 0E:C204: 30 1B
	STA PPUADDR                     ;C - - - - - 0x01C216 0E:C206: 8D 06 20
	LDA vramQueue+1,X               ;C - - - - - 0x01C219 0E:C209: BD 81 07
	STA PPUADDR                     ;C - - - - - 0x01C21C 0E:C20C: 8D 06 20
	LDY vramQueue+2,X               ;C - - - - - 0x01C21F 0E:C20F: BC 82 07
loc_0E_C212:
	LDA vramQueue+3,X               ;C - - - - - 0x01C222 0E:C212: BD 83 07
	STA PPUDATA                     ;C - - - - - 0x01C225 0E:C215: 8D 07 20
	INX                             ;C - - - - - 0x01C228 0E:C218: E8
	DEY                             ;C - - - - - 0x01C229 0E:C219: 88
	BPL loc_0E_C212                 ;C - - - - - 0x01C22A 0E:C21A: 10 F6
	INX                             ;C - - - - - 0x01C22C 0E:C21C: E8
	INX                             ;C - - - - - 0x01C22D 0E:C21D: E8
	INX                             ;C - - - - - 0x01C22E 0E:C21E: E8
	BNE FlushVramBufferNoClear      ;C - - - - - 0x01C22F 0E:C21F: D0 E0
loc_0E_C221:
	RTS                             ;C - - - - - 0x01C231 0E:C221: 60
; writes records [len, hi, lo, data] from vramQueue up to vramQueueEnd
FlushVramQueue:
	LDA PPUSTATUS                   ;C - - - - - 0x01C232 0E:C222: AD 02 20
loc_0E_C225:
	LDA bufPPUCTRL                  ;C - - - - - 0x01C235 0E:C225: A5 FF
	AND #$FE                        ;C - - - - - 0x01C237 0E:C227: 29 FE
	STA PPUCTRL                     ;C - - - - - 0x01C239 0E:C229: 8D 00 20
	LDY vramQueue,X                 ;C - - - - - 0x01C23C 0E:C22C: BC 80 07
	INX                             ;C - - - - - 0x01C23F 0E:C22F: E8
	LDA vramQueue,X                 ;C - - - - - 0x01C240 0E:C230: BD 80 07
	STA PPUADDR                     ;C - - - - - 0x01C243 0E:C233: 8D 06 20
	INX                             ;C - - - - - 0x01C246 0E:C236: E8
	LDA vramQueue,X                 ;C - - - - - 0x01C247 0E:C237: BD 80 07
	STA PPUADDR                     ;C - - - - - 0x01C24A 0E:C23A: 8D 06 20
	INX                             ;C - - - - - 0x01C24D 0E:C23D: E8
loc_0E_C23E:
	LDA vramQueue,X                 ;C - - - - - 0x01C24E 0E:C23E: BD 80 07
	STA PPUDATA                     ;C - - - - - 0x01C251 0E:C241: 8D 07 20
	INX                             ;C - - - - - 0x01C254 0E:C244: E8
	DEY                             ;C - - - - - 0x01C255 0E:C245: 88
	BNE loc_0E_C23E                 ;C - - - - - 0x01C256 0E:C246: D0 F6
	CPX vramQueueEnd                ;C - - - - - 0x01C258 0E:C248: E4 65
	BNE loc_0E_C225                 ;C - - - - - 0x01C25A 0E:C24A: D0 D9
	LDA #$00                        ;C - - - - - 0x01C25C 0E:C24C: A9 00
	STA vramQueueEnd                ;C - - - - - 0x01C25E 0E:C24E: 85 65
	RTS                             ;C - - - - - 0x01C260 0E:C250: 60
; bufPPUCTRL &= $11 ; PPUCTRL = bufPPUCTRL (not called by anything the CDL saw)
DisableNMI:
	LDA bufPPUCTRL                  ;- - - - - - 0x01C261 0E:C251: A5 FF
	AND #$11                        ;- - - - - - 0x01C263 0E:C253: 29 11
	STA bufPPUCTRL                  ;- - - - - - 0x01C265 0E:C255: 85 FF
	STA PPUCTRL                     ;- - - - - - 0x01C267 0E:C257: 8D 00 20
	RTS                             ;- - - - - - 0x01C26A 0E:C25A: 60
; bufPPUCTRL |= $80 ; PPUCTRL = bufPPUCTRL
EnableNMI:
	LDA bufPPUCTRL                  ;- - - - - - 0x01C26B 0E:C25B: A5 FF
	ORA #$80                        ;- - - - - - 0x01C26D 0E:C25D: 09 80
	STA bufPPUCTRL                  ;- - - - - - 0x01C26F 0E:C25F: 85 FF
	STA PPUCTRL                     ;- - - - - - 0x01C271 0E:C261: 8D 00 20
	RTS                             ;- - - - - - 0x01C274 0E:C264: 60
; renderOffCount++ ; PPUMASK = 0
ScreenOff:
	INC renderOffCount              ;C - - - - - 0x01C275 0E:C265: E6 EE
	LDA #$00                        ;C - - - - - 0x01C277 0E:C267: A9 00
	STA ppuMaskBuf                  ;C - - - - - 0x01C279 0E:C269: 85 FE
	STA PPUMASK                     ;C - - - - - 0x01C27B 0E:C26B: 8D 01 20
	RTS                             ;C - - - - - 0x01C27E 0E:C26E: 60
; renderOffCount-- ; PPUMASK = $18
ScreenOn:
	DEC renderOffCount              ;C - - - - - 0x01C27F 0E:C26F: C6 EE
	LDA #$18                        ;C - - - - - 0x01C281 0E:C271: A9 18
	STA ppuMaskBuf                  ;C - - - - - 0x01C283 0E:C273: 85 FE
	STA PPUMASK                     ;C - - - - - 0x01C285 0E:C275: 8D 01 20
	RTS                             ;C - - - - - 0x01C288 0E:C278: 60
; reads both pads (+ expansion bits) into padPressed/padHeld
ReadPads:
	LDX #$01                        ;C - - - - - 0x01C289 0E:C279: A2 01
	STX JOY1                        ;C - - - - - 0x01C28B 0E:C27B: 8E 16 40
	DEX                             ;C - - - - - 0x01C28E 0E:C27E: CA
	STX JOY1                        ;C - - - - - 0x01C28F 0E:C27F: 8E 16 40
	LDX #$08                        ;C - - - - - 0x01C292 0E:C282: A2 08
loc_0E_C284:
	LDA JOY1                        ;C - - - - - 0x01C294 0E:C284: AD 16 40
	LSR A                           ;C - - - - - 0x01C297 0E:C287: 4A
	ROL padPressed                  ;C - - - - - 0x01C298 0E:C288: 26 14
	LSR A                           ;C - - - - - 0x01C29A 0E:C28A: 4A
	ROL ptr_00                      ;C - - - - - 0x01C29B 0E:C28B: 26 00
	LDA JOY2                        ;C - - - - - 0x01C29D 0E:C28D: AD 17 40
	LSR A                           ;C - - - - - 0x01C2A0 0E:C290: 4A
	ROL padPressed+1                ;C - - - - - 0x01C2A1 0E:C291: 26 15
	LSR A                           ;C - - - - - 0x01C2A3 0E:C293: 4A
	ROL ptr_00+1                    ;C - - - - - 0x01C2A4 0E:C294: 26 01
	DEX                             ;C - - - - - 0x01C2A6 0E:C296: CA
	BNE loc_0E_C284                 ;C - - - - - 0x01C2A7 0E:C297: D0 EB
	LDA ptr_00                      ;C - - - - - 0x01C2A9 0E:C299: A5 00
	ORA padPressed                  ;C - - - - - 0x01C2AB 0E:C29B: 05 14
	STA padPressed                  ;C - - - - - 0x01C2AD 0E:C29D: 85 14
	LDA ptr_00+1                    ;C - - - - - 0x01C2AF 0E:C29F: A5 01
	ORA padPressed+1                ;C - - - - - 0x01C2B1 0E:C2A1: 05 15
	STA padPressed+1                ;C - - - - - 0x01C2B3 0E:C2A3: 85 15
	LDX #$01                        ;C - - - - - 0x01C2B5 0E:C2A5: A2 01
loc_0E_C2A7:
	LDA padPressed,X                ;C - - - - - 0x01C2B7 0E:C2A7: B5 14
	TAY                             ;C - - - - - 0x01C2B9 0E:C2A9: A8
	EOR padHeld,X                   ;C - - - - - 0x01C2BA 0E:C2AA: 55 16
	AND padPressed,X                ;C - - - - - 0x01C2BC 0E:C2AC: 35 14
	STA padPressed,X                ;C - - - - - 0x01C2BE 0E:C2AE: 95 14
	STY padHeld,X                   ;C - - - - - 0x01C2C0 0E:C2B0: 94 16
	DEX                             ;C - - - - - 0x01C2C2 0E:C2B2: CA
	BPL loc_0E_C2A7                 ;C - - - - - 0x01C2C3 0E:C2B3: 10 F2
	LDX #$03                        ;C - - - - - 0x01C2C5 0E:C2B5: A2 03
loc_0E_C2B7:
	LDA padPressed,X                ;C - - - - - 0x01C2C7 0E:C2B7: B5 14
	AND #$0C                        ;C - - - - - 0x01C2C9 0E:C2B9: 29 0C
	CMP #$0C                        ;C - - - - - 0x01C2CB 0E:C2BB: C9 0C
	BEQ loc_0E_C2C7                 ;C - - - - - 0x01C2CD 0E:C2BD: F0 08
	LDA padPressed,X                ;C - - - - - 0x01C2CF 0E:C2BF: B5 14
	AND #$03                        ;C - - - - - 0x01C2D1 0E:C2C1: 29 03
	CMP #$03                        ;C - - - - - 0x01C2D3 0E:C2C3: C9 03
	BNE loc_0E_C2CD                 ;C - - - - - 0x01C2D5 0E:C2C5: D0 06
loc_0E_C2C7:
	LDA padPressed,X                ;c - - - - - 0x01C2D7 0E:C2C7: B5 14
	AND #$F0                        ;c - - - - - 0x01C2D9 0E:C2C9: 29 F0
	STA padPressed,X                ;c - - - - - 0x01C2DB 0E:C2CB: 95 14
loc_0E_C2CD:
	DEX                             ;C - - - - - 0x01C2DD 0E:C2CD: CA
	BPL loc_0E_C2B7                 ;C - - - - - 0x01C2DE 0E:C2CE: 10 E7
	RTS                             ;C - - - - - 0x01C2E0 0E:C2D0: 60
; A=PPU high address, X=tile, Y=attribute fill value
FillNametable:
	STA ptr_00                      ;C - - - - - 0x01C2E1 0E:C2D1: 85 00
	STX ptr_00+1                    ;C - - - - - 0x01C2E3 0E:C2D3: 86 01
	STY ptr_02                      ;C - - - - - 0x01C2E5 0E:C2D5: 84 02
	LDA PPUSTATUS                   ;C - - - - - 0x01C2E7 0E:C2D7: AD 02 20
	LDA bufPPUCTRL                  ;C - - - - - 0x01C2EA 0E:C2DA: A5 FF
	AND #$FE                        ;C - - - - - 0x01C2EC 0E:C2DC: 29 FE
	STA PPUCTRL                     ;C - - - - - 0x01C2EE 0E:C2DE: 8D 00 20
	LDA ptr_00                      ;C - - - - - 0x01C2F1 0E:C2E1: A5 00
	STA PPUADDR                     ;C - - - - - 0x01C2F3 0E:C2E3: 8D 06 20
	LDY #$00                        ;C - - - - - 0x01C2F6 0E:C2E6: A0 00
	STY PPUADDR                     ;C - - - - - 0x01C2F8 0E:C2E8: 8C 06 20
	LDX #$04                        ;C - - - - - 0x01C2FB 0E:C2EB: A2 04
	CMP #$20                        ;C - - - - - 0x01C2FD 0E:C2ED: C9 20
	BCS loc_0E_C2F3                 ;C - - - - - 0x01C2FF 0E:C2EF: B0 02
	LDX ptr_02                      ;c - - - - - 0x01C301 0E:C2F1: A6 02
loc_0E_C2F3:
	LDY #$00                        ;C - - - - - 0x01C303 0E:C2F3: A0 00
	LDA ptr_00+1                    ;C - - - - - 0x01C305 0E:C2F5: A5 01
loc_0E_C2F7:
	STA PPUDATA                     ;C - - - - - 0x01C307 0E:C2F7: 8D 07 20
	DEY                             ;C - - - - - 0x01C30A 0E:C2FA: 88
	BNE loc_0E_C2F7                 ;C - - - - - 0x01C30B 0E:C2FB: D0 FA
	DEX                             ;C - - - - - 0x01C30D 0E:C2FD: CA
	BNE loc_0E_C2F7                 ;C - - - - - 0x01C30E 0E:C2FE: D0 F7
	LDY ptr_02                      ;C - - - - - 0x01C310 0E:C300: A4 02
	LDA ptr_00                      ;C - - - - - 0x01C312 0E:C302: A5 00
	CMP #$20                        ;C - - - - - 0x01C314 0E:C304: C9 20
	BCC loc_0E_C31A                 ;C - - - - - 0x01C316 0E:C306: 90 12
	ADC #$02                        ;C - - - - - 0x01C318 0E:C308: 69 02
	STA PPUADDR                     ;C - - - - - 0x01C31A 0E:C30A: 8D 06 20
	LDA #$C0                        ;C - - - - - 0x01C31D 0E:C30D: A9 C0
	STA PPUADDR                     ;C - - - - - 0x01C31F 0E:C30F: 8D 06 20
	LDX #$40                        ;C - - - - - 0x01C322 0E:C312: A2 40
loc_0E_C314:
	STY PPUDATA                     ;C - - - - - 0x01C324 0E:C314: 8C 07 20
	DEX                             ;C - - - - - 0x01C327 0E:C317: CA
	BNE loc_0E_C314                 ;C - - - - - 0x01C328 0E:C318: D0 FA
loc_0E_C31A:
	LDX ptr_00+1                    ;C - - - - - 0x01C32A 0E:C31A: A6 01
	RTS                             ;C - - - - - 0x01C32C 0E:C31C: 60
; fills oamBuffer Y positions with $F8 from index ram_0097
HideSprites:
	LDX oamHideStart                ;C - - - - - 0x01C32D 0E:C31D: A6 97
	CPX #$04                        ;C - - - - - 0x01C32F 0E:C31F: E0 04
	BNE loc_0E_C328                 ;C - - - - - 0x01C331 0E:C321: D0 05
	LDA #$F8                        ;C - - - - - 0x01C333 0E:C323: A9 F8
	STA oamBuffer                   ;C - - - - - 0x01C335 0E:C325: 8D 00 02
loc_0E_C328:
	LDA #$F8                        ;C - - - - - 0x01C338 0E:C328: A9 F8
loc_0E_C32A:
	STA oamBuffer,X                 ;C - - - - - 0x01C33A 0E:C32A: 9D 00 02
	INX                             ;C - - - - - 0x01C33D 0E:C32D: E8
	INX                             ;C - - - - - 0x01C33E 0E:C32E: E8
	INX                             ;C - - - - - 0x01C33F 0E:C32F: E8
	INX                             ;C - - - - - 0x01C340 0E:C330: E8
	BNE loc_0E_C32A                 ;C - - - - - 0x01C341 0E:C331: D0 F7
	RTS                             ;C - - - - - 0x01C343 0E:C333: 60
ClearObjects:
	LDX #$0F                        ;C - - - - - 0x01C344 0E:C334: A2 0F
loc_0E_C336:
	LDA #$00                        ;C - - - - - 0x01C346 0E:C336: A9 00
	STA objActive,X                 ;C - - - - - 0x01C348 0E:C338: 9D 00 03
	STA objState,X                  ;C - - - - - 0x01C34B 0E:C33B: 9D 10 03
	STA objFlags,X                  ;C - - - - - 0x01C34E 0E:C33E: 9D 60 05
	STA objMoveMode,X               ;C - - - - - 0x01C351 0E:C341: 9D 70 04
	STA objStunTimer,X              ;C - - - - - 0x01C354 0E:C344: 9D B0 04
	STA objKind,X                   ;C - - - - - 0x01C357 0E:C347: 9D 20 03
	STA objId,X                     ;C - - - - - 0x01C35A 0E:C34A: 9D 30 03
	STA objAtkBox,X                 ;C - - - - - 0x01C35D 0E:C34D: 9D 40 04
	STA objAtkDamage,X              ;C - - - - - 0x01C360 0E:C350: 9D 50 04
	STA objLife,X                   ;C - - - - - 0x01C363 0E:C353: 9D 90 04
	STA objHudLife,X                ;C - - - - - 0x01C366 0E:C356: 9D A0 04
	LDA #$FF                        ;C - - - - - 0x01C369 0E:C359: A9 FF
	STA objSpawnIndex,X             ;C - - - - - 0x01C36B 0E:C35B: 9D 80 04
	DEX                             ;C - - - - - 0x01C36E 0E:C35E: CA
	BPL loc_0E_C336                 ;C - - - - - 0x01C36F 0E:C35F: 10 D5
	RTS                             ;C - - - - - 0x01C371 0E:C361: 60
FadeOutPaletteFast:
	JSR HideSprites                 ;C - - - - - 0x01C372 0E:C362: 20 1D C3
	JSR WaitFrame                   ;C - - - - - 0x01C375 0E:C365: 20 31 FF
	LDA #$30                        ;C - - - - - 0x01C378 0E:C368: A9 30
	LDX #$F0                        ;C - - - - - 0x01C37A 0E:C36A: A2 F0
	BNE loc_0E_C371                 ;C - - - - - 0x01C37C 0E:C36C: D0 03
FadeOutPalette:
	LDA #$10                        ;C - - - - - 0x01C37E 0E:C36E: A9 10
	TAX                             ;C - - - - - 0x01C380 0E:C370: AA
loc_0E_C371:
	STA ptr_0E+1                    ;C - - - - - 0x01C381 0E:C371: 85 0F
	STX ptr_0C+1                    ;C - - - - - 0x01C383 0E:C373: 86 0D
	LDY #$04                        ;C - - - - - 0x01C385 0E:C375: A0 04
	STY ptr_0E                      ;C - - - - - 0x01C387 0E:C377: 84 0E
loc_0E_C379:
	LDY #$1F                        ;C - - - - - 0x01C389 0E:C379: A0 1F
loc_0E_C37B:
	LDA palBase,Y                   ;C - - - - - 0x01C38B 0E:C37B: B9 20 06
	STA palBuffer,Y                 ;C - - - - - 0x01C38E 0E:C37E: 99 00 06
	DEY                             ;C - - - - - 0x01C391 0E:C381: 88
	BPL loc_0E_C37B                 ;C - - - - - 0x01C392 0E:C382: 10 F7
	LDY #$1F                        ;C - - - - - 0x01C394 0E:C384: A0 1F
loc_0E_C386:
	LDA palBuffer,Y                 ;C - - - - - 0x01C396 0E:C386: B9 00 06
	SEC                             ;C - - - - - 0x01C399 0E:C389: 38
	SBC ptr_0E+1                    ;C - - - - - 0x01C39A 0E:C38A: E5 0F
	BPL loc_0E_C390                 ;C - - - - - 0x01C39C 0E:C38C: 10 02
	LDA #$0F                        ;C - - - - - 0x01C39E 0E:C38E: A9 0F
loc_0E_C390:
	STA palBuffer,Y                 ;C - - - - - 0x01C3A0 0E:C390: 99 00 06
	DEY                             ;C - - - - - 0x01C3A3 0E:C393: 88
	BPL loc_0E_C386                 ;C - - - - - 0x01C3A4 0E:C394: 10 F0
	STY palUpdateFlag               ;C - - - - - 0x01C3A6 0E:C396: 84 18
	LDA ptr_0E                      ;C - - - - - 0x01C3A8 0E:C398: A5 0E
loc_0E_C39A:
	PHA                             ;C - - - - - 0x01C3AA 0E:C39A: 48
	JSR WaitFrame                   ;C - - - - - 0x01C3AB 0E:C39B: 20 31 FF
	PLA                             ;C - - - - - 0x01C3AE 0E:C39E: 68
	SEC                             ;C - - - - - 0x01C3AF 0E:C39F: 38
	SBC #$01                        ;C - - - - - 0x01C3B0 0E:C3A0: E9 01
	BNE loc_0E_C39A                 ;C - - - - - 0x01C3B2 0E:C3A2: D0 F6
	LDA ptr_0E+1                    ;C - - - - - 0x01C3B4 0E:C3A4: A5 0F
	CLC                             ;C - - - - - 0x01C3B6 0E:C3A6: 18
	ADC ptr_0C+1                    ;C - - - - - 0x01C3B7 0E:C3A7: 65 0D
	STA ptr_0E+1                    ;C - - - - - 0x01C3B9 0E:C3A9: 85 0F
	CMP #$50                        ;C - - - - - 0x01C3BB 0E:C3AB: C9 50
	BEQ loc_0E_C3B3                 ;C - - - - - 0x01C3BD 0E:C3AD: F0 04
	LDA ptr_0E+1                    ;C - - - - - 0x01C3BF 0E:C3AF: A5 0F
	BPL loc_0E_C379                 ;C - - - - - 0x01C3C1 0E:C3B1: 10 C6
loc_0E_C3B3:
	RTS                             ;C - - - - - 0x01C3C3 0E:C3B3: 60
UpdateRandom:
	LDX #$00                        ;C - - - - - 0x01C3C4 0E:C3B4: A2 00
	LDY #$04                        ;C - - - - - 0x01C3C6 0E:C3B6: A0 04
	LDA rngState0,X                 ;C - - - - - 0x01C3C8 0E:C3B8: B5 E4
	AND #$02                        ;C - - - - - 0x01C3CA 0E:C3BA: 29 02
	STA ptr_00                      ;C - - - - - 0x01C3CC 0E:C3BC: 85 00
	LDA rngState1,X                 ;C - - - - - 0x01C3CE 0E:C3BE: B5 E5
	AND #$02                        ;C - - - - - 0x01C3D0 0E:C3C0: 29 02
	EOR ptr_00                      ;C - - - - - 0x01C3D2 0E:C3C2: 45 00
	CLC                             ;C - - - - - 0x01C3D4 0E:C3C4: 18
	BEQ loc_0E_C3C8                 ;C - - - - - 0x01C3D5 0E:C3C5: F0 01
	SEC                             ;C - - - - - 0x01C3D7 0E:C3C7: 38
loc_0E_C3C8:
	ROR rngState0,X                 ;C - - - - - 0x01C3D8 0E:C3C8: 76 E4
	INX                             ;C - - - - - 0x01C3DA 0E:C3CA: E8
	DEY                             ;C - - - - - 0x01C3DB 0E:C3CB: 88
	BNE loc_0E_C3C8                 ;C - - - - - 0x01C3DC 0E:C3CC: D0 FA
	LDA drawOrderToggle             ;C - - - - - 0x01C3DE 0E:C3CE: A5 95
	EOR rngState0                   ;C - - - - - 0x01C3E0 0E:C3D0: 45 E4
	STA rngState1                   ;C - - - - - 0x01C3E2 0E:C3D2: 85 E5
	LDA rngState0                   ;C - - - - - 0x01C3E4 0E:C3D4: A5 E4
	SBC rngState1                   ;C - - - - - 0x01C3E6 0E:C3D6: E5 E5
	ADC frameCounter                ;C - - - - - 0x01C3E8 0E:C3D8: 65 92
	STA rngState0                   ;C - - - - - 0x01C3EA 0E:C3DA: 85 E4
	RTS                             ;C - - - - - 0x01C3EC 0E:C3DC: 60
; stage setup: CHR banks, sprite palette of the character (tbl_0E_C53E/C546/C54E) and 16-colour palette from the stage bank
LoadSectionGfx:
	LDY stageData                   ;C - - - - - 0x01C3ED 0E:C3DD: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01C3EF 0E:C3DF: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01C3F2 0E:C3E2: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C3F4 0E:C3E4: 20 4D FF
	LDA stageSection                ;C - - - - - 0x01C3F7 0E:C3E7: A5 60
	BEQ loc_0E_C3F3                 ;C - - - - - 0x01C3F9 0E:C3E9: F0 08
	CMP #$01                        ;C - - - - - 0x01C3FB 0E:C3EB: C9 01
	BEQ loc_0E_C3FF                 ;C - - - - - 0x01C3FD 0E:C3ED: F0 10
	CMP #$02                        ;C - - - - - 0x01C3FF 0E:C3EF: C9 02
	BEQ loc_0E_C40B                 ;C - - - - - 0x01C401 0E:C3F1: F0 18
loc_0E_C3F3:
	LDA stageChr0_s0                ;C - - - - - 0x01C403 0E:C3F3: AD 78 AE
	STA chrBankShadow               ;C - - - - - 0x01C406 0E:C3F6: 85 E8
	LDA stageChr1_s0                ;C - - - - - 0x01C408 0E:C3F8: AD 79 AE
	STA chrBankShadow+1             ;C - - - - - 0x01C40B 0E:C3FB: 85 E9
	BNE loc_0E_C417                 ;C - - - - - 0x01C40D 0E:C3FD: D0 18
loc_0E_C3FF:
	LDA stageChr0_s1                ;C - - - - - 0x01C40F 0E:C3FF: AD A8 AE
	STA chrBankShadow               ;C - - - - - 0x01C412 0E:C402: 85 E8
	LDA stageChr1_s1                ;C - - - - - 0x01C414 0E:C404: AD A9 AE
	STA chrBankShadow+1             ;C - - - - - 0x01C417 0E:C407: 85 E9
	BNE loc_0E_C417                 ;C - - - - - 0x01C419 0E:C409: D0 0C
loc_0E_C40B:
	LDA stageChr0_s2                ;C - - - - - 0x01C41B 0E:C40B: AD D8 AE
	STA chrBankShadow               ;C - - - - - 0x01C41E 0E:C40E: 85 E8
	LDA stageChr1_s2                ;C - - - - - 0x01C420 0E:C410: AD D9 AE
	STA chrBankShadow+1             ;C - - - - - 0x01C423 0E:C413: 85 E9
	BNE loc_0E_C417                 ;C - - - - - 0x01C425 0E:C415: D0 00
loc_0E_C417:
	LDX #$07                        ;C - - - - - 0x01C427 0E:C417: A2 07
	LDA playerId                    ;C - - - - - 0x01C429 0E:C419: A5 34
	BEQ loc_0E_C425                 ;C - - - - - 0x01C42B 0E:C41B: F0 08
	CMP #$01                        ;C - - - - - 0x01C42D 0E:C41D: C9 01
	BEQ loc_0E_C434                 ;C - - - - - 0x01C42F 0E:C41F: F0 13
	CMP #$02                        ;C - - - - - 0x01C431 0E:C421: C9 02
	BEQ loc_0E_C443                 ;C - - - - - 0x01C433 0E:C423: F0 1E
loc_0E_C425:
	LDA spritePalCody,X             ;C - - - - - 0x01C435 0E:C425: BD 3E C5
	STA palBuffer+16,X              ;C - - - - - 0x01C438 0E:C428: 9D 10 06
	STA palBase+16,X                ;C - - - - - 0x01C43B 0E:C42B: 9D 30 06
	DEX                             ;C - - - - - 0x01C43E 0E:C42E: CA
	BPL loc_0E_C425                 ;C - - - - - 0x01C43F 0E:C42F: 10 F4
	JMP loc_0E_C44F                 ;C - - - - - 0x01C441 0E:C431: 4C 4F C4
loc_0E_C434:
	LDA spritePalGuy,X              ;C - - - - - 0x01C444 0E:C434: BD 46 C5
	STA palBuffer+16,X              ;C - - - - - 0x01C447 0E:C437: 9D 10 06
	STA palBase+16,X                ;C - - - - - 0x01C44A 0E:C43A: 9D 30 06
	DEX                             ;C - - - - - 0x01C44D 0E:C43D: CA
	BPL loc_0E_C434                 ;C - - - - - 0x01C44E 0E:C43E: 10 F4
	JMP loc_0E_C44F                 ;C - - - - - 0x01C450 0E:C440: 4C 4F C4
loc_0E_C443:
	LDA spritePalHaggar,X           ;C - - - - - 0x01C453 0E:C443: BD 4E C5
	STA palBuffer+16,X              ;C - - - - - 0x01C456 0E:C446: 9D 10 06
	STA palBase+16,X                ;C - - - - - 0x01C459 0E:C449: 9D 30 06
	DEX                             ;C - - - - - 0x01C45C 0E:C44C: CA
	BPL loc_0E_C443                 ;C - - - - - 0x01C45D 0E:C44D: 10 F4
loc_0E_C44F:
	LDA paletteSetIdx               ;C - - - - - 0x01C45F 0E:C44F: A5 2B
	ASL A                           ;C - - - - - 0x01C461 0E:C451: 0A
	TAX                             ;C - - - - - 0x01C462 0E:C452: AA
	LDA stageSection                ;C - - - - - 0x01C463 0E:C453: A5 60
	BEQ loc_0E_C45F                 ;C - - - - - 0x01C465 0E:C455: F0 08
	CMP #$01                        ;C - - - - - 0x01C467 0E:C457: C9 01
	BEQ loc_0E_C469                 ;C - - - - - 0x01C469 0E:C459: F0 0E
	CMP #$02                        ;C - - - - - 0x01C46B 0E:C45B: C9 02
	BEQ loc_0E_C473                 ;C - - - - - 0x01C46D 0E:C45D: F0 14
loc_0E_C45F:
	LDA stagePalIdx_s0,X            ;C - - - - - 0x01C46F 0E:C45F: BD 70 AE
	PHA                             ;C - - - - - 0x01C472 0E:C462: 48
	LDA stagePalIdx1_s0,X           ;C - - - - - 0x01C473 0E:C463: BD 71 AE
	JMP loc_0E_C47D                 ;C - - - - - 0x01C476 0E:C466: 4C 7D C4
loc_0E_C469:
	LDA stagePalIdx_s1,X            ;C - - - - - 0x01C479 0E:C469: BD A0 AE
	PHA                             ;C - - - - - 0x01C47C 0E:C46C: 48
	LDA stagePalIdx1_s1,X           ;C - - - - - 0x01C47D 0E:C46D: BD A1 AE
	JMP loc_0E_C47D                 ;C - - - - - 0x01C480 0E:C470: 4C 7D C4
loc_0E_C473:
	LDA stagePalIdx_s2,X            ;C - - - - - 0x01C483 0E:C473: BD D0 AE
	PHA                             ;C - - - - - 0x01C486 0E:C476: 48
	LDA stagePalIdx1_s2,X           ;C - - - - - 0x01C487 0E:C477: BD D1 AE
	JMP loc_0E_C47D                 ;C - - - - - 0x01C48A 0E:C47A: 4C 7D C4
loc_0E_C47D:
	ASL A                           ;C - - - - - 0x01C48D 0E:C47D: 0A
	ASL A                           ;C - - - - - 0x01C48E 0E:C47E: 0A
	STA ptr_00                      ;C - - - - - 0x01C48F 0E:C47F: 85 00
	ASL A                           ;C - - - - - 0x01C491 0E:C481: 0A
	ASL A                           ;C - - - - - 0x01C492 0E:C482: 0A
	ADC ptr_00                      ;C - - - - - 0x01C493 0E:C483: 65 00
	TAY                             ;C - - - - - 0x01C495 0E:C485: A8
	LDX #$00                        ;C - - - - - 0x01C496 0E:C486: A2 00
	LDA stageSection                ;C - - - - - 0x01C498 0E:C488: A5 60
	BEQ loc_0E_C494                 ;C - - - - - 0x01C49A 0E:C48A: F0 08
	CMP #$01                        ;C - - - - - 0x01C49C 0E:C48C: C9 01
	BEQ loc_0E_C4C5                 ;C - - - - - 0x01C49E 0E:C48E: F0 35
	CMP #$02                        ;C - - - - - 0x01C4A0 0E:C490: C9 02
	BEQ loc_0E_C4F6                 ;C - - - - - 0x01C4A2 0E:C492: F0 62
loc_0E_C494:
	LDA stagePalettes_s0,Y          ;C - - - - - 0x01C4A4 0E:C494: B9 7C AE
	STA palBuffer,X                 ;C - - - - - 0x01C4A7 0E:C497: 9D 00 06
	STA palBase,X                   ;C - - - - - 0x01C4AA 0E:C49A: 9D 20 06
	INY                             ;C - - - - - 0x01C4AD 0E:C49D: C8
	INX                             ;C - - - - - 0x01C4AE 0E:C49E: E8
	CPX #$10                        ;C - - - - - 0x01C4AF 0E:C49F: E0 10
	BNE loc_0E_C494                 ;C - - - - - 0x01C4B1 0E:C4A1: D0 F1
	LDX #$00                        ;C - - - - - 0x01C4B3 0E:C4A3: A2 00
loc_0E_C4A5:
	LDA stagePalettes_s0,Y          ;C - - - - - 0x01C4B5 0E:C4A5: B9 7C AE
	PHA                             ;C - - - - - 0x01C4B8 0E:C4A8: 48
	AND #$80                        ;C - - - - - 0x01C4B9 0E:C4A9: 29 80
	STA palAnimActive,X             ;C - - - - - 0x01C4BB 0E:C4AB: 9D 00 01
	PLA                             ;C - - - - - 0x01C4BE 0E:C4AE: 68
	AND #$7F                        ;C - - - - - 0x01C4BF 0E:C4AF: 29 7F
	STA palAnimType,X               ;C - - - - - 0x01C4C1 0E:C4B1: 9D 08 01
	LDA #$00                        ;C - - - - - 0x01C4C4 0E:C4B4: A9 00
	STA palAnimStep,X               ;C - - - - - 0x01C4C6 0E:C4B6: 9D 04 01
	STA palAnimTimer,X              ;C - - - - - 0x01C4C9 0E:C4B9: 9D 0C 01
	INY                             ;C - - - - - 0x01C4CC 0E:C4BC: C8
	INX                             ;C - - - - - 0x01C4CD 0E:C4BD: E8
	CPX #$04                        ;C - - - - - 0x01C4CE 0E:C4BE: E0 04
	BNE loc_0E_C4A5                 ;C - - - - - 0x01C4D0 0E:C4C0: D0 E3
	JMP loc_0E_C527                 ;C - - - - - 0x01C4D2 0E:C4C2: 4C 27 C5
loc_0E_C4C5:
	LDA stagePalettes_s1,Y          ;C - - - - - 0x01C4D5 0E:C4C5: B9 AC AE
	STA palBuffer,X                 ;C - - - - - 0x01C4D8 0E:C4C8: 9D 00 06
	STA palBase,X                   ;C - - - - - 0x01C4DB 0E:C4CB: 9D 20 06
	INY                             ;C - - - - - 0x01C4DE 0E:C4CE: C8
	INX                             ;C - - - - - 0x01C4DF 0E:C4CF: E8
	CPX #$10                        ;C - - - - - 0x01C4E0 0E:C4D0: E0 10
	BNE loc_0E_C4C5                 ;C - - - - - 0x01C4E2 0E:C4D2: D0 F1
	LDX #$00                        ;C - - - - - 0x01C4E4 0E:C4D4: A2 00
loc_0E_C4D6:
	LDA stagePalettes_s1,Y          ;C - - - - - 0x01C4E6 0E:C4D6: B9 AC AE
	PHA                             ;C - - - - - 0x01C4E9 0E:C4D9: 48
	AND #$80                        ;C - - - - - 0x01C4EA 0E:C4DA: 29 80
	STA palAnimActive,X             ;C - - - - - 0x01C4EC 0E:C4DC: 9D 00 01
	PLA                             ;C - - - - - 0x01C4EF 0E:C4DF: 68
	AND #$7F                        ;C - - - - - 0x01C4F0 0E:C4E0: 29 7F
	STA palAnimType,X               ;C - - - - - 0x01C4F2 0E:C4E2: 9D 08 01
	LDA #$00                        ;C - - - - - 0x01C4F5 0E:C4E5: A9 00
	STA palAnimStep,X               ;C - - - - - 0x01C4F7 0E:C4E7: 9D 04 01
	STA palAnimTimer,X              ;C - - - - - 0x01C4FA 0E:C4EA: 9D 0C 01
	INY                             ;C - - - - - 0x01C4FD 0E:C4ED: C8
	INX                             ;C - - - - - 0x01C4FE 0E:C4EE: E8
	CPX #$04                        ;C - - - - - 0x01C4FF 0E:C4EF: E0 04
	BNE loc_0E_C4D6                 ;C - - - - - 0x01C501 0E:C4F1: D0 E3
	JMP loc_0E_C527                 ;C - - - - - 0x01C503 0E:C4F3: 4C 27 C5
loc_0E_C4F6:
	LDA stagePalettes_s2,Y          ;C - - - - - 0x01C506 0E:C4F6: B9 DC AE
	STA palBuffer,X                 ;C - - - - - 0x01C509 0E:C4F9: 9D 00 06
	STA palBase,X                   ;C - - - - - 0x01C50C 0E:C4FC: 9D 20 06
	INY                             ;C - - - - - 0x01C50F 0E:C4FF: C8
	INX                             ;C - - - - - 0x01C510 0E:C500: E8
	CPX #$10                        ;C - - - - - 0x01C511 0E:C501: E0 10
	BNE loc_0E_C4F6                 ;C - - - - - 0x01C513 0E:C503: D0 F1
	LDX #$00                        ;C - - - - - 0x01C515 0E:C505: A2 00
loc_0E_C507:
	LDA stagePalettes_s2,Y          ;C - - - - - 0x01C517 0E:C507: B9 DC AE
	PHA                             ;C - - - - - 0x01C51A 0E:C50A: 48
	AND #$80                        ;C - - - - - 0x01C51B 0E:C50B: 29 80
	STA palAnimActive,X             ;C - - - - - 0x01C51D 0E:C50D: 9D 00 01
	PLA                             ;C - - - - - 0x01C520 0E:C510: 68
	AND #$7F                        ;C - - - - - 0x01C521 0E:C511: 29 7F
	STA palAnimType,X               ;C - - - - - 0x01C523 0E:C513: 9D 08 01
	LDA #$00                        ;C - - - - - 0x01C526 0E:C516: A9 00
	STA palAnimStep,X               ;C - - - - - 0x01C528 0E:C518: 9D 04 01
	STA palAnimTimer,X              ;C - - - - - 0x01C52B 0E:C51B: 9D 0C 01
	INY                             ;C - - - - - 0x01C52E 0E:C51E: C8
	INX                             ;C - - - - - 0x01C52F 0E:C51F: E8
	CPX #$04                        ;C - - - - - 0x01C530 0E:C520: E0 04
	BNE loc_0E_C507                 ;C - - - - - 0x01C532 0E:C522: D0 E3
	JMP loc_0E_C527                 ;C - - - - - 0x01C534 0E:C524: 4C 27 C5
loc_0E_C527:
	LDA palBuffer                   ;C - - - - - 0x01C537 0E:C527: AD 00 06
	STA palBuffer+16                ;C - - - - - 0x01C53A 0E:C52A: 8D 10 06
	STA palBase+16                  ;C - - - - - 0x01C53D 0E:C52D: 8D 30 06
	LDA #$09                        ;C - - - - - 0x01C540 0E:C530: A9 09
	STA prgBankA000                 ;C - - - - - 0x01C542 0E:C532: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C544 0E:C534: 20 4D FF
	PLA                             ;C - - - - - 0x01C547 0E:C537: 68
	JSR SetSectionChr               ;C - - - - - bank=09 0x01C548 0E:C538: 20 00 A0
	JMP loc_0F_FF4C                 ;C - - - - - 0x01C54B 0E:C53B: 4C 4C FF
spritePalCody:
	.byte $0F,$0F,$36,$26,$0F,$0F,$30,$21;- D 2 - - - 0x01C54E 0E:C53E:
spritePalGuy:
	.byte $0F,$0F,$36,$26,$0F,$0F,$36,$15;- D 2 - - - 0x01C556 0E:C546:
spritePalHaggar:
	.byte $0F,$0F,$36,$26,$0F,$0F,$30,$19;- D 2 - - - 0x01C55E 0E:C54E:
ofs_0E_C556:
	LDX #$BF                        ;C - - J - - 0x01C566 0E:C556: A2 BF
	TXS                             ;C - - - - - 0x01C568 0E:C558: 9A
	LDA bufPPUCTRL                  ;C - - - - - 0x01C569 0E:C559: A5 FF
	STA PPUCTRL                     ;C - - - - - 0x01C56B 0E:C55B: 8D 00 20
	LDA #$F0                        ;C - - - - - 0x01C56E 0E:C55E: A9 F0
	JSR QueueSoundSaved             ;C - - - - - 0x01C570 0E:C560: 20 4A F3
	JSR WaitFrame                   ;C - - - - - 0x01C573 0E:C563: 20 31 FF
	LDA #$88                        ;C - - - - - 0x01C576 0E:C566: A9 88
	STA rngState0                   ;C - - - - - 0x01C578 0E:C568: 85 E4
	JSR FadeAndClearScreen          ;C - - - - - 0x01C57A 0E:C56A: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01C57D 0E:C56D: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C57F 0E:C56F: 86 F4
	INX                             ;C - - - - - 0x01C581 0E:C571: E8
	STX prgBankA000                 ;C - - - - - 0x01C582 0E:C572: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C584 0E:C574: 20 4D FF
	LDX #$04                        ;C - - - - - 0x01C587 0E:C577: A2 04
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C589 0E:C579: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01C58C 0E:C57C: 20 6F C2
	JSR ScreenInit89C0              ;C - - - - - bank=04 0x01C58F 0E:C57F: 20 C0 89
	LDX #$B4                        ;C - - - - - 0x01C592 0E:C582: A2 B4
	JSR WaitFrames                  ;C - - - - - 0x01C594 0E:C584: 20 2A FF
	JSR FadeAndClearScreen          ;C - - - - - 0x01C597 0E:C587: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01C59A 0E:C58A: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C59C 0E:C58C: 86 F4
	INX                             ;C - - - - - 0x01C59E 0E:C58E: E8
	STX prgBankA000                 ;C - - - - - 0x01C59F 0E:C58F: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C5A1 0E:C591: 20 4D FF
	LDX #$00                        ;C - - - - - 0x01C5A4 0E:C594: A2 00
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C5A6 0E:C596: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01C5A9 0E:C599: 20 6F C2
	JSR ScreenInit8900              ;C - - - - - bank=04 0x01C5AC 0E:C59C: 20 00 89
	LDA #$B4                        ;C - - - - - 0x01C5AF 0E:C59F: A9 B4
	STA actionTimer                 ;C - - - - - 0x01C5B1 0E:C5A1: 85 37
loc_0E_C5A3:
	JSR WaitFrame                   ;C - - - - - 0x01C5B3 0E:C5A3: 20 31 FF
	LDA padPressed                  ;C - - - - - 0x01C5B6 0E:C5A6: A5 14
	BNE loc_0E_C5B3                 ;C - - - - - 0x01C5B8 0E:C5A8: D0 09
	LDA actionTimer                 ;C - - - - - 0x01C5BA 0E:C5AA: A5 37
	BEQ loc_0E_C5B3                 ;C - - - - - 0x01C5BC 0E:C5AC: F0 05
	DEC actionTimer                 ;C - - - - - 0x01C5BE 0E:C5AE: C6 37
	JMP loc_0E_C5A3                 ;C - - - - - 0x01C5C0 0E:C5B0: 4C A3 C5
loc_0E_C5B3:
	LDX #$0F                        ;C - - - - - 0x01C5C3 0E:C5B3: A2 0F
	LDA dat_0F_FFF8                 ;C - - - - - 0x01C5C5 0E:C5B5: AD F8 FF
	CMP #$08                        ;C - - - - - 0x01C5C8 0E:C5B8: C9 08
	BNE loc_0E_C5CA                 ;C - - - - - 0x01C5CA 0E:C5BA: D0 0E
loc_0E_C5BC:
	LDA romSignature,X              ;C - - - - - 0x01C5CC 0E:C5BC: BD E0 FF
	CMP romSignatureTbl,X           ;C - - - - - 0x01C5CF 0E:C5BF: DD DD C8
	BNE loc_0E_C5CA                 ;C - - - - - 0x01C5D2 0E:C5C2: D0 06
	DEX                             ;C - - - - - 0x01C5D4 0E:C5C4: CA
	BPL loc_0E_C5BC                 ;C - - - - - 0x01C5D5 0E:C5C5: 10 F5
	JMP loc_0E_C5CE                 ;C - - - - - 0x01C5D7 0E:C5C7: 4C CE C5
loc_0E_C5CA:
	LDA #$00                        ;c - - - - - 0x01C5DA 0E:C5CA: A9 00
	BEQ loc_0E_C5CA                 ;c - - - - - 0x01C5DC 0E:C5CC: F0 FC
loc_0E_C5CE:
	JSR PrepareScreenDraw           ;C - - - - - 0x01C5DE 0E:C5CE: 20 88 C8
	LDA #$00                        ;C - - - - - 0x01C5E1 0E:C5D1: A9 00
	STA textScriptIdx               ;C - - - - - 0x01C5E3 0E:C5D3: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01C5E5 0E:C5D5: 20 00 9A  ; call into the switchable $8000 bank (bank depends on stage)
	LDA padHeld                     ;C D 2 - I - 0x01C5E8 0E:C5D8: A5 16
	BNE loc_0E_C657                 ;C - - - - - 0x01C5EA 0E:C5DA: D0 7B
	LDA #$07                        ;C - - - - - 0x01C5EC 0E:C5DC: A9 07
	JSR QueueSoundSaved             ;C - - - - - 0x01C5EE 0E:C5DE: 20 4A F3
	JSR FadeAndClearScreen          ;C - - - - - 0x01C5F1 0E:C5E1: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01C5F4 0E:C5E4: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C5F6 0E:C5E6: 86 F4
	INX                             ;C - - - - - 0x01C5F8 0E:C5E8: E8
	STX prgBankA000                 ;C - - - - - 0x01C5F9 0E:C5E9: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C5FB 0E:C5EB: 20 4D FF
	LDX #$06                        ;C - - - - - 0x01C5FE 0E:C5EE: A2 06
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C600 0E:C5F0: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01C603 0E:C5F3: 20 6F C2
	JSR ScreenInit8B40              ;C - - - - - bank=04 0x01C606 0E:C5F6: 20 40 8B
	LDX #$00                        ;C - - - - - 0x01C609 0E:C5F9: A2 00
	STX prgBank8000                 ;C - - - - - 0x01C60B 0E:C5FB: 86 F4
	INX                             ;C - - - - - 0x01C60D 0E:C5FD: E8
	STX prgBankA000                 ;C - - - - - 0x01C60E 0E:C5FE: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C610 0E:C600: 20 4D FF
	LDA #$01                        ;C - - - - - 0x01C613 0E:C603: A9 01
	STA textScriptIdx               ;C - - - - - 0x01C615 0E:C605: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01C617 0E:C607: 20 00 9A
	LDA padHeld                     ;C - - - - - 0x01C61A 0E:C60A: A5 16
	BNE loc_0E_C657                 ;C - - - - - 0x01C61C 0E:C60C: D0 49
	JSR PrepareScreenDraw           ;C - - - - - 0x01C61E 0E:C60E: 20 88 C8
	LDA #$02                        ;C - - - - - 0x01C621 0E:C611: A9 02
	STA textScriptIdx               ;C - - - - - 0x01C623 0E:C613: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01C625 0E:C615: 20 00 9A
	LDA padHeld                     ;C - - - - - 0x01C628 0E:C618: A5 16
	BNE loc_0E_C657                 ;C - - - - - 0x01C62A 0E:C61A: D0 3B
	JSR FadeAndClearScreen          ;C - - - - - 0x01C62C 0E:C61C: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01C62F 0E:C61F: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C631 0E:C621: 86 F4
	INX                             ;C - - - - - 0x01C633 0E:C623: E8
	STX prgBankA000                 ;C - - - - - 0x01C634 0E:C624: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C636 0E:C626: 20 4D FF
	LDX #$07                        ;C - - - - - 0x01C639 0E:C629: A2 07
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C63B 0E:C62B: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01C63E 0E:C62E: 20 6F C2
	JSR ScreenInit8AC0              ;C - - - - - bank=04 0x01C641 0E:C631: 20 C0 8A
	LDX #$00                        ;C - - - - - 0x01C644 0E:C634: A2 00
	STX prgBank8000                 ;C - - - - - 0x01C646 0E:C636: 86 F4
	INX                             ;C - - - - - 0x01C648 0E:C638: E8
	STX prgBankA000                 ;C - - - - - 0x01C649 0E:C639: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C64B 0E:C63B: 20 4D FF
	LDA #$03                        ;C - - - - - 0x01C64E 0E:C63E: A9 03
	STA textScriptIdx               ;C - - - - - 0x01C650 0E:C640: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01C652 0E:C642: 20 00 9A
	LDA padHeld                     ;C - - - - - 0x01C655 0E:C645: A5 16
	BNE loc_0E_C657                 ;C - - - - - 0x01C657 0E:C647: D0 0E
	JSR PrepareScreenDraw           ;C - - - - - 0x01C659 0E:C649: 20 88 C8
	LDA #$04                        ;C - - - - - 0x01C65C 0E:C64C: A9 04
	STA textScriptIdx               ;C - - - - - 0x01C65E 0E:C64E: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01C660 0E:C650: 20 00 9A
	LDA padHeld                     ;C - - - - - 0x01C663 0E:C653: A5 16
	BNE loc_0E_C657                 ;C - - - - - 0x01C665 0E:C655: D0 00
loc_0E_C657:
	LDA #$0C                        ;C - - - - - 0x01C667 0E:C657: A9 0C
	JSR QueueSoundSaved             ;C - - - - - 0x01C669 0E:C659: 20 4A F3
	JSR FadeAndClearScreen          ;C - - - - - 0x01C66C 0E:C65C: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01C66F 0E:C65F: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C671 0E:C661: 86 F4
	INX                             ;C - - - - - 0x01C673 0E:C663: E8
	STX prgBankA000                 ;C - - - - - 0x01C674 0E:C664: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C676 0E:C666: 20 4D FF
	LDX #$01                        ;C - - - - - 0x01C679 0E:C669: A2 01
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C67B 0E:C66B: 20 00 80
	JSR ScreenInit8940              ;C - - - - - bank=04 0x01C67E 0E:C66E: 20 40 89
	JSR ScreenOn                    ;C - - - - - 0x01C681 0E:C671: 20 6F C2
	LDA #$FF                        ;C - - - - - 0x01C684 0E:C674: A9 FF
	STA objStep                     ;C - - - - - 0x01C686 0E:C676: 8D 00 05
	STA objParamA                   ;C - - - - - 0x01C689 0E:C679: 8D 10 05
	LDA #$8B                        ;C - - - - - 0x01C68C 0E:C67C: A9 8B
	STA objParamB                   ;C - - - - - 0x01C68E 0E:C67E: 8D 20 05
loc_0E_C681:
	LDA #$04                        ;C - - - - - 0x01C691 0E:C681: A9 04
	STA oamHideStart                ;C - - - - - 0x01C693 0E:C683: 85 97
	JSR HideSprites                 ;C - - - - - 0x01C695 0E:C685: 20 1D C3
	JSR DrawObjects                 ;C - - - - - 0x01C698 0E:C688: 20 BC E9
	JSR WaitFrame                   ;C - - - - - 0x01C69B 0E:C68B: 20 31 FF
	LDA objStep                     ;C - - - - - 0x01C69E 0E:C68E: AD 00 05
	BNE loc_0E_C6A7                 ;C - - - - - 0x01C6A1 0E:C691: D0 14
	LDA objParamA                   ;C - - - - - 0x01C6A3 0E:C693: AD 10 05
	BNE loc_0E_C6C9                 ;C - - - - - 0x01C6A6 0E:C696: D0 31
	LDA objParamB                   ;C - - - - - 0x01C6A8 0E:C698: AD 20 05
	BNE loc_0E_C6CF                 ;C - - - - - 0x01C6AB 0E:C69B: D0 32
	LDA #$00                        ;C - - - - - 0x01C6AD 0E:C69D: A9 00
	STA renderOffCount              ;C - - - - - 0x01C6AF 0E:C69F: 85 EE
	JSR FadeOutPalette              ;C - - - - - 0x01C6B1 0E:C6A1: 20 6E C3
	JMP RESET                       ;C - - - - - 0x01C6B4 0E:C6A4: 4C 00 FE
loc_0E_C6A7:
	DEC objStep                     ;C - - - - - 0x01C6B7 0E:C6A7: CE 00 05
	LDA objStep                     ;C - - - - - 0x01C6BA 0E:C6AA: AD 00 05
	CMP #$F0                        ;C - - - - - 0x01C6BD 0E:C6AD: C9 F0
	BNE loc_0E_C6C6                 ;C - - - - - 0x01C6BF 0E:C6AF: D0 15
	LDA #$32                        ;C - - - - - 0x01C6C1 0E:C6B1: A9 32
	JSR QueueSound                  ;C - - - - - 0x01C6C3 0E:C6B3: 20 4C F3
	LDA #$12                        ;C - - - - - 0x01C6C6 0E:C6B6: A9 12
	STA palBuffer+3                 ;C - - - - - 0x01C6C8 0E:C6B8: 8D 03 06
	STA palBuffer+7                 ;C - - - - - 0x01C6CB 0E:C6BB: 8D 07 06
	STA palBuffer+15                ;C - - - - - 0x01C6CE 0E:C6BE: 8D 0F 06
	STA palBuffer+31                ;C - - - - - 0x01C6D1 0E:C6C1: 8D 1F 06
	STA palUpdateFlag               ;C - - - - - 0x01C6D4 0E:C6C4: 85 18
loc_0E_C6C6:
	JMP loc_0E_C6D2                 ;C - - - - - 0x01C6D6 0E:C6C6: 4C D2 C6
loc_0E_C6C9:
	DEC objParamA                   ;C - - - - - 0x01C6D9 0E:C6C9: CE 10 05
	JMP loc_0E_C6D2                 ;C - - - - - 0x01C6DC 0E:C6CC: 4C D2 C6
loc_0E_C6CF:
	DEC objParamB                   ;C - - - - - 0x01C6DF 0E:C6CF: CE 20 05
loc_0E_C6D2:
	LDA padPressed                  ;C - - - - - 0x01C6E2 0E:C6D2: A5 14
	AND #$10                        ;C - - - - - 0x01C6E4 0E:C6D4: 29 10
	BEQ loc_0E_C681                 ;C - - - - - 0x01C6E6 0E:C6D6: F0 A9
	LDA #$30                        ;C - - - - - 0x01C6E8 0E:C6D8: A9 30
	JSR QueueSound                  ;C - - - - - 0x01C6EA 0E:C6DA: 20 4C F3
	JSR FadeAndClearScreen          ;C - - - - - 0x01C6ED 0E:C6DD: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01C6F0 0E:C6E0: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C6F2 0E:C6E2: 86 F4
	INX                             ;C - - - - - 0x01C6F4 0E:C6E4: E8
	STX prgBankA000                 ;C - - - - - 0x01C6F5 0E:C6E5: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C6F7 0E:C6E7: 20 4D FF
	LDX #$02                        ;C - - - - - 0x01C6FA 0E:C6EA: A2 02
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C6FC 0E:C6EC: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01C6FF 0E:C6EF: 20 6F C2
	LDA #$00                        ;C - - - - - 0x01C702 0E:C6F2: A9 00
	STA playerId                    ;C - - - - - 0x01C704 0E:C6F4: 85 34
	STA ram_00BD                    ;C - - - - - 0x01C706 0E:C6F6: 85 BD
	JSR ScreenInit9100              ;C - - - - - bank=04 0x01C708 0E:C6F8: 20 00 91
	JSR FadeAndClearScreen          ;C - - - - - 0x01C70B 0E:C6FB: 20 5C C8
	JSR ClearObjects                ;C - - - - - 0x01C70E 0E:C6FE: 20 34 C3
	LDX #$04                        ;C - - - - - 0x01C711 0E:C701: A2 04
ofs_0E_C703:
	STX prgBank8000                 ;C - - - - - 0x01C713 0E:C703: 86 F4
	INX                             ;C - - - - - 0x01C715 0E:C705: E8
	STX prgBankA000                 ;C - - - - - 0x01C716 0E:C706: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C718 0E:C708: 20 4D FF
	LDX #$08                        ;C - - - - - 0x01C71B 0E:C70B: A2 08
	JSR QueueVramScript             ;C - - - - - bank=04 0x01C71D 0E:C70D: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01C720 0E:C710: 20 6F C2
	JSR ScreenInit8D00              ;C - - - - - bank=04 0x01C723 0E:C713: 20 00 8D
	LDX #$2D                        ;C - - - - - 0x01C726 0E:C716: A2 2D
	JSR WaitFrames                  ;C - - - - - 0x01C728 0E:C718: 20 2A FF
	JSR FadeAndClearScreen          ;C - - - - - 0x01C72B 0E:C71B: 20 5C C8
	JSR ScreenOn                    ;C - - - - - 0x01C72E 0E:C71E: 20 6F C2
	CLI                             ;C - - - - - 0x01C731 0E:C721: 58
	LDA #$01                        ;C - - - - - 0x01C732 0E:C722: A9 01
	STA irqEnableIdx                ;C - - - - - 0x01C734 0E:C724: 85 9B
	LDA #$00                        ;C - - - - - 0x01C736 0E:C726: A9 00
	STA nametableSelect             ;C - - - - - 0x01C738 0E:C728: 85 FD
	STA ram_00FB                    ;C - - - - - 0x01C73A 0E:C72A: 85 FB
	STA scrollX                     ;C - - - - - 0x01C73C 0E:C72C: 85 FC
	STA scrollY                     ;C - - - - - 0x01C73E 0E:C72E: 85 FA
	STA scrollXPage                 ;C - - - - - 0x01C740 0E:C730: 85 F9
	STA ram_0025                    ;C - - - - - 0x01C742 0E:C732: 85 25
	STA objXPage                    ;C - - - - - 0x01C744 0E:C734: 8D 80 03
	STA objYPage                    ;C - - - - - 0x01C747 0E:C737: 8D E0 03
	STA totalEnemies                ;C - - - - - 0x01C74A 0E:C73A: 85 9E
	STA spawnLeftIdx                ;C - - - - - 0x01C74C 0E:C73C: 85 9F
	STA ram_005A                    ;C - - - - - 0x01C74E 0E:C73E: 85 5A
	STA ram_0033                    ;C - - - - - 0x01C750 0E:C740: 85 33
	STA renderOffCount              ;C - - - - - 0x01C752 0E:C742: 85 EE
	JSR ClearObjects                ;C - - - - - 0x01C754 0E:C744: 20 34 C3
	LDA #$01                        ;C - - - - - 0x01C757 0E:C747: A9 01
	STA MMC3_MIRRORING              ;C - - - - - 0x01C759 0E:C749: 8D 00 A0
	LDA #$01                        ;C - - - - - 0x01C75C 0E:C74C: A9 01
	STA playerFacing                ;C - - - - - 0x01C75E 0E:C74E: 85 31
	STA scrollDir                   ;C - - - - - 0x01C760 0E:C750: 85 23
	STA ram_002E                    ;C - - - - - 0x01C762 0E:C752: 85 2E
; GG PASGIYAA..GASGIYAA start stage: LDA #$00 / STA stage
	LDY #$00                        ;C - - - - - 0x01C764 0E:C754: A0 00
	STY enemyLevelIdx               ;C - - - - - 0x01C766 0E:C756: 84 67
	STY stageData                   ;C - - - - - 0x01C768 0E:C758: 84 22
	LDA stageMusicTbl,Y             ;C - - - - - 0x01C76A 0E:C75A: B9 3C C8
	JSR QueueSoundSaved             ;C - - - - - 0x01C76D 0E:C75D: 20 4A F3
	LDA #$FF                        ;C - - - - - 0x01C770 0E:C760: A9 FF
	STA stageScreen                 ;C - - - - - 0x01C772 0E:C762: 85 29
	LDA #$1F                        ;C - - - - - 0x01C774 0E:C764: A9 1F
	STA stageColumn                 ;C - - - - - 0x01C776 0E:C766: 85 24
loc_0E_C768:
	LDA #$01                        ;C - - - - - 0x01C778 0E:C768: A9 01
	STA spriteFlipMask              ;C - - - - - 0x01C77A 0E:C76A: 85 10
	JSR StageScrollUpdate           ;C - - - - - 0x01C77C 0E:C76C: 20 21 E5
	JSR WaitFrame                   ;C - - - - - 0x01C77F 0E:C76F: 20 31 FF
	LDA stageScreen                 ;C - - - - - 0x01C782 0E:C772: A5 29
	BEQ loc_0E_C768                 ;C - - - - - 0x01C784 0E:C774: F0 F2
	LDA #$0A                        ;C - - - - - 0x01C786 0E:C776: A9 0A
	STA prgBank8000                 ;C - - - - - 0x01C788 0E:C778: 85 F4
	JSR SetPrgBanks                 ;C - - - - - 0x01C78A 0E:C77A: 20 4D FF
	JSR QueueScreenText             ;C - - - - - bank=0A 0x01C78D 0E:C77D: 20 00 9C
	LDY stageData                   ;C - - - - - 0x01C790 0E:C780: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01C792 0E:C782: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01C795 0E:C785: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C797 0E:C787: 20 4D FF
	LDA stageField68_s0             ;C - - - - - 0x01C79A 0E:C78A: AD 68 AE
	PHA                             ;C - - - - - 0x01C79D 0E:C78D: 48
	AND #$E0                        ;C - - - - - 0x01C79E 0E:C78E: 29 E0
	STA ram_002A                    ;C - - - - - 0x01C7A0 0E:C790: 85 2A
	PLA                             ;C - - - - - 0x01C7A2 0E:C792: 68
	AND #$1F                        ;C - - - - - 0x01C7A3 0E:C793: 29 1F
	STA ram_002C                    ;C - - - - - 0x01C7A5 0E:C795: 85 2C
	LDA #$00                        ;C - - - - - 0x01C7A7 0E:C797: A9 00
	STA paletteSetIdx               ;C - - - - - 0x01C7A9 0E:C799: 85 2B
	STA worldXPage                  ;C - - - - - 0x01C7AB 0E:C79B: 85 2D
	JSR LoadSectionGfx              ;C - - - - - 0x01C7AD 0E:C79D: 20 DD C3
	LDA #$00                        ;C - - - - - 0x01C7B0 0E:C7A0: A9 00
	STA palUpdateFlag               ;C - - - - - 0x01C7B2 0E:C7A2: 85 18
	JSR FadeOutPaletteFast          ;C - - - - - 0x01C7B4 0E:C7A4: 20 62 C3
	JSR ClearObjects                ;C - - - - - 0x01C7B7 0E:C7A7: 20 34 C3
	LDX #$00                        ;C - - - - - 0x01C7BA 0E:C7AA: A2 00
	LDA #$D0                        ;C - - - - - 0x01C7BC 0E:C7AC: A9 D0
	STA objFlags                    ;C - - - - - 0x01C7BE 0E:C7AE: 8D 60 05
	LDA #$80                        ;C - - - - - 0x01C7C1 0E:C7B1: A9 80
	STA objActive                   ;C - - - - - 0x01C7C3 0E:C7B3: 8D 00 03
	LDA #$30                        ;C - - - - - 0x01C7C6 0E:C7B6: A9 30
	STA objX                        ;C - - - - - 0x01C7C8 0E:C7B8: 8D 60 03
	LDA #$90                        ;C - - - - - 0x01C7CB 0E:C7BB: A9 90
	STA objY                        ;C - - - - - 0x01C7CD 0E:C7BD: 8D C0 03
	LDA #$00                        ;C - - - - - 0x01C7D0 0E:C7C0: A9 00
	STA objXPage                    ;C - - - - - 0x01C7D2 0E:C7C2: 8D 80 03
	STA objYPage                    ;C - - - - - 0x01C7D5 0E:C7C5: 8D E0 03
	STA objKind                     ;C - - - - - 0x01C7D8 0E:C7C8: 8D 20 03
	STA enemyLevelIdx               ;C - - - - - 0x01C7DB 0E:C7CB: 85 67
	JSR SetHopVelY                  ;C - - - - - 0x01C7DD 0E:C7CD: 20 6E F2
	LDY playerId                    ;C - - - - - 0x01C7E0 0E:C7D0: A4 34
	LDA playerStartHealthTbl,Y      ;C - - - - - 0x01C7E2 0E:C7D2: B9 41 C8
	STA playerHealth                ;C - - - - - 0x01C7E5 0E:C7D5: 85 3A
	JSR LoadPlayerPalette           ;C - - - - - 0x01C7E7 0E:C7D7: 20 B4 C8
	LDX #$08                        ;C - - - - - 0x01C7EA 0E:C7DA: A2 08
	STX prgBank8000                 ;C - - - - - 0x01C7EC 0E:C7DC: 86 F4
	INX                             ;C - - - - - 0x01C7EE 0E:C7DE: E8
	STX prgBankA000                 ;C - - - - - 0x01C7EF 0E:C7DF: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C7F1 0E:C7E1: 20 4D FF
	JSR LoadSpawnLists              ;C - - - - - bank=08 0x01C7F4 0E:C7E4: 20 00 80
	JSR FindFirstVisibleSpawn       ;C - - - - - bank=08 0x01C7F7 0E:C7E7: 20 38 80
	JSR SpawnEnemiesInWindow        ;C - - - - - bank=08 0x01C7FA 0E:C7EA: 20 80 80
; GG PEVKTYIA/IE start lives: LDA #$05 / STA lives
	LDA #$05                        ;C - - - - - 0x01C7FD 0E:C7ED: A9 05
	STA lives                       ;C - - - - - 0x01C7FF 0E:C7EF: 85 3E
; GG PENGZYLA start credits: LDA #$03 / STA credits
	LDA #$03                        ;C - - - - - 0x01C801 0E:C7F1: A9 03
	STA credits                     ;C - - - - - 0x01C803 0E:C7F3: 85 AF
	LDA #$00                        ;C - - - - - 0x01C805 0E:C7F5: A9 00
	STA gameAction                  ;C - - - - - 0x01C807 0E:C7F7: 85 30
	STA timerA3                     ;C - - - - - 0x01C809 0E:C7F9: 85 A3
	STA timerA4                     ;C - - - - - 0x01C80B 0E:C7FB: 85 A4
	STA ram_00A5                    ;C - - - - - 0x01C80D 0E:C7FD: 85 A5
	STA actionTimer                 ;C - - - - - 0x01C80F 0E:C7FF: 85 37
	STA stage                       ;C - - - - - 0x01C811 0E:C801: 85 61
	STA stageSection                ;C - - - - - 0x01C813 0E:C803: 85 60
	STA playerLevel                 ;C - - - - - 0x01C815 0E:C805: 85 6B
	STA ram_00B3                    ;C - - - - - 0x01C817 0E:C807: 85 B3
	STA playerExp                   ;C - - - - - 0x01C819 0E:C809: 85 6C
	STA playerExp+1                 ;C - - - - - 0x01C81B 0E:C80B: 85 6D
	STA weaponHeld                  ;C - - - - - 0x01C81D 0E:C80D: 85 A9
	STA ram_00AD                    ;C - - - - - 0x01C81F 0E:C80F: 85 AD
	STA flashTimerA                 ;C - - - - - 0x01C821 0E:C811: 85 69
	STA flashTimerB                 ;C - - - - - 0x01C823 0E:C813: 85 6A
	STA ram_0050                    ;C - - - - - 0x01C825 0E:C815: 85 50
	STA ram_003F                    ;C - - - - - 0x01C827 0E:C817: 85 3F
	STA enemiesDefeated             ;C - - - - - 0x01C829 0E:C819: 85 54
	STA gameOverFlag                ;C - - - - - 0x01C82B 0E:C81B: 85 62
	STA ram_00B5                    ;C - - - - - 0x01C82D 0E:C81D: 85 B5
	STA ram_00B6                    ;C - - - - - 0x01C82F 0E:C81F: 85 B6
	STA ram_00B2                    ;C - - - - - 0x01C831 0E:C821: 85 B2
	STA ram_00B7                    ;C - - - - - 0x01C833 0E:C823: 85 B7
	STA ram_00BB                    ;C - - - - - 0x01C835 0E:C825: 85 BB
	STA screenLockFlag              ;C - - - - - 0x01C837 0E:C827: 85 BC
	STA ram_00BE                    ;C - - - - - 0x01C839 0E:C829: 85 BE
	STA ram_00BA                    ;C - - - - - 0x01C83B 0E:C82B: 85 BA
	STA objAirSnapshot              ;C - - - - - 0x01C83D 0E:C82D: 8D A0 05
	STA objAirSnapshot+1            ;C - - - - - 0x01C840 0E:C830: 8D A1 05
	STA objAirSnapshot+2            ;C - - - - - 0x01C843 0E:C833: 8D A2 05
	STA continueUsedFlag            ;C - - - - - 0x01C846 0E:C836: 8D 50 01
	JMP loc_0E_C8ED                 ;C - - - - - 0x01C849 0E:C839: 4C ED C8
; sound id queued on entering each stage (indexed by stage)
stageMusicTbl:
	.byte $00,$01,$02,$03,$04       ;- D 2 - - - 0x01C84C 0E:C83C:
; start health per playerId: Cody $40, Guy $30, Haggar $50
playerStartHealthTbl:
	.byte $40,$30,$50               ;- D 2 - - - 0x01C851 0E:C841:
; zero $0400-$05FF
ClearObjArrays:
	LDA #$00                        ;C - - - - - 0x01C854 0E:C844: A9 00
	STA ptr_00                      ;C - - - - - 0x01C856 0E:C846: 85 00
	LDA #$04                        ;C - - - - - 0x01C858 0E:C848: A9 04
	STA ptr_00+1                    ;C - - - - - 0x01C85A 0E:C84A: 85 01
	LDX #$01                        ;C - - - - - 0x01C85C 0E:C84C: A2 01
	LDA #$00                        ;C - - - - - 0x01C85E 0E:C84E: A9 00
	TAY                             ;C - - - - - 0x01C860 0E:C850: A8
loc_0E_C851:
	STA (ptr_00),Y                  ;C - - - - - 0x01C861 0E:C851: 91 00
	INY                             ;C - - - - - 0x01C863 0E:C853: C8
	BNE loc_0E_C851                 ;C - - - - - 0x01C864 0E:C854: D0 FB
	INC ptr_00+1                    ;C - - - - - 0x01C866 0E:C856: E6 01
	DEX                             ;C - - - - - 0x01C868 0E:C858: CA
	BPL loc_0E_C851                 ;C - - - - - 0x01C869 0E:C859: 10 F6
	RTS                             ;C - - - - - 0x01C86B 0E:C85B: 60
FadeAndClearScreen:
	JSR FadeOutPalette              ;C - - - - - 0x01C86C 0E:C85C: 20 6E C3
ClearScreenAndSprites:
	JSR WaitFrame                   ;C - - - - - 0x01C86F 0E:C85F: 20 31 FF
	JSR ScreenOff                   ;C - - - - - 0x01C872 0E:C862: 20 65 C2
	LDA #$04                        ;C - - - - - 0x01C875 0E:C865: A9 04
	STA oamHideStart                ;C - - - - - 0x01C877 0E:C867: 85 97
	JSR HideSprites                 ;C - - - - - 0x01C879 0E:C869: 20 1D C3
	JSR ClearObjArrays              ;C - - - - - 0x01C87C 0E:C86C: 20 44 C8
	LDA #$00                        ;C - - - - - 0x01C87F 0E:C86F: A9 00
	STA scrollX                     ;C - - - - - 0x01C881 0E:C871: 85 FC
	STA scrollY                     ;C - - - - - 0x01C883 0E:C873: 85 FA
	STA nametableSelect             ;C - - - - - 0x01C885 0E:C875: 85 FD
	STA ram_00FB                    ;C - - - - - 0x01C887 0E:C877: 85 FB
	STA drawOrderToggle             ;C - - - - - 0x01C889 0E:C879: 85 95
	LDA #$20                        ;C - - - - - 0x01C88B 0E:C87B: A9 20
	LDX #$00                        ;C - - - - - 0x01C88D 0E:C87D: A2 00
	LDY #$00                        ;C - - - - - 0x01C88F 0E:C87F: A0 00
	JSR FillNametable               ;C - - - - - 0x01C891 0E:C881: 20 D1 C2
	JSR HideSprites                 ;C - - - - - 0x01C894 0E:C884: 20 1D C3
	RTS                             ;C - - - - - 0x01C897 0E:C887: 60
PrepareScreenDraw:
	JSR FadeAndClearScreen          ;C - - - - - 0x01C898 0E:C888: 20 5C C8
	JSR ScreenOn                    ;C - - - - - 0x01C89B 0E:C88B: 20 6F C2
	LDX #$04                        ;C - - - - - 0x01C89E 0E:C88E: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C8A0 0E:C890: 86 F4
	INX                             ;C - - - - - 0x01C8A2 0E:C892: E8
	STX prgBankA000                 ;C - - - - - 0x01C8A3 0E:C893: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C8A5 0E:C895: 20 4D FF
	JSR ScreenInit8A40              ;C - - - - - bank=04 0x01C8A8 0E:C898: 20 40 8A
	LDX #$00                        ;C - - - - - 0x01C8AB 0E:C89B: A2 00
	STX prgBank8000                 ;C - - - - - 0x01C8AD 0E:C89D: 86 F4
	INX                             ;C - - - - - 0x01C8AF 0E:C89F: E8
	STX prgBankA000                 ;C - - - - - 0x01C8B0 0E:C8A0: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C8B2 0E:C8A2: 20 4D FF
	RTS                             ;C - - - - - 0x01C8B5 0E:C8A5: 60
ClearScreenSetBank04:
	JSR ClearScreenAndSprites       ;C - - - - - 0x01C8B6 0E:C8A6: 20 5F C8
	LDX #$04                        ;C - - - - - 0x01C8B9 0E:C8A9: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C8BB 0E:C8AB: 86 F4
	INX                             ;C - - - - - 0x01C8BD 0E:C8AD: E8
	STX prgBankA000                 ;C - - - - - 0x01C8BE 0E:C8AE: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C8C0 0E:C8B0: 20 4D FF
	RTS                             ;C - - - - - 0x01C8C3 0E:C8B3: 60
LoadPlayerPalette:
	LDY playerId                    ;C - - - - - 0x01C8C4 0E:C8B4: A4 34
	LDA tbl_0E_C8DA,Y               ;C - - - - - 0x01C8C6 0E:C8B6: B9 DA C8
	TAX                             ;C - - - - - 0x01C8C9 0E:C8B9: AA
	LDY #$07                        ;C - - - - - 0x01C8CA 0E:C8BA: A0 07
loc_0E_C8BC:
	LDA spritePalCody,X             ;C - - - - - 0x01C8CC 0E:C8BC: BD 3E C5
	STA palBuffer+16,Y              ;C - - - - - 0x01C8CF 0E:C8BF: 99 10 06
	STA palBase+16,Y                ;C - - - - - 0x01C8D2 0E:C8C2: 99 30 06
	DEX                             ;C - - - - - 0x01C8D5 0E:C8C5: CA
	DEY                             ;C - - - - - 0x01C8D6 0E:C8C6: 88
	BPL loc_0E_C8BC                 ;C - - - - - 0x01C8D7 0E:C8C7: 10 F3
	STY palUpdateFlag               ;C - - - - - 0x01C8D9 0E:C8C9: 84 18
	LDY playerId                    ;C - - - - - 0x01C8DB 0E:C8CB: A4 34
	LDA PlayerRow_E1E3,Y            ;C - - - - - 0x01C8DD 0E:C8CD: B9 E3 E1
	JSR SetPlayerAnim               ;C - - - - - 0x01C8E0 0E:C8D0: 20 94 F2
	LDA PlayerRow_E22B,Y            ;C - - - - - 0x01C8E3 0E:C8D3: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x01C8E6 0E:C8D6: 20 40 F4
	RTS                             ;C - - - - - 0x01C8E9 0E:C8D9: 60
tbl_0E_C8DA:
	.byte $07,$0F,$17               ;- D 2 - - - 0x01C8EA 0E:C8DA:
; "M FINAL FIGHT  " compared with 0F:FFE0 (header check at 0E:C5B3; mismatch hangs in an endless loop)
romSignatureTbl:
	.byte $4D,$20,$46,$49,$4E,$41,$4C,$20,$46,$49,$47,$48,$54,$59,$20,$20;- D 2 - - - 0x01C8ED 0E:C8DD:
loc_0E_C8ED:
	LDA gameAction                  ;C - - - - - 0x01C8FD 0E:C8ED: A5 30
	CMP #$09                        ;C - - - - - 0x01C8FF 0E:C8EF: C9 09
	BNE loc_0E_C8F6                 ;C - - - - - 0x01C901 0E:C8F1: D0 03
	JMP loc_0E_C93B                 ;c - - - - - 0x01C903 0E:C8F3: 4C 3B C9
loc_0E_C8F6:
	LDA ram_00B7                    ;C - - - - - 0x01C906 0E:C8F6: A5 B7
	BEQ loc_0E_C8FD                 ;C - - - - - 0x01C908 0E:C8F8: F0 03
	JMP loc_0E_C9A7                 ;C - - - - - 0x01C90A 0E:C8FA: 4C A7 C9
loc_0E_C8FD:
	LDA gameOverFlag                ;C - - - - - 0x01C90D 0E:C8FD: A5 62
	BEQ loc_0E_C904                 ;C - - - - - 0x01C90F 0E:C8FF: F0 03
	JMP loc_0E_C987                 ;C - - - - - 0x01C911 0E:C901: 4C 87 C9
loc_0E_C904:
	LDA padPressed                  ;C - - - - - 0x01C914 0E:C904: A5 14
	AND #$10                        ;C - - - - - 0x01C916 0E:C906: 29 10
	BEQ loc_0E_C934                 ;C - - - - - 0x01C918 0E:C908: F0 2A
	LDA gameAction                  ;C - - - - - 0x01C91A 0E:C90A: A5 30
	CMP #$1B                        ;C - - - - - 0x01C91C 0E:C90C: C9 1B
	BEQ loc_0E_C93B                 ;C - - - - - 0x01C91E 0E:C90E: F0 2B
	CMP #$1C                        ;C - - - - - 0x01C920 0E:C910: C9 1C
	BEQ loc_0E_C93B                 ;C - - - - - 0x01C922 0E:C912: F0 27
	CMP #$1E                        ;C - - - - - 0x01C924 0E:C914: C9 1E
	BEQ loc_0E_C93B                 ;C - - - - - 0x01C926 0E:C916: F0 23
	CMP #$19                        ;C - - - - - 0x01C928 0E:C918: C9 19
	BEQ loc_0E_C93B                 ;C - - - - - 0x01C92A 0E:C91A: F0 1F
	CMP #$28                        ;C - - - - - 0x01C92C 0E:C91C: C9 28
	BEQ loc_0E_C93B                 ;C - - - - - 0x01C92E 0E:C91E: F0 1B
	LDA #$15                        ;C - - - - - 0x01C930 0E:C920: A9 15
	JSR QueueSound                  ;C - - - - - 0x01C932 0E:C922: 20 4C F3
	LDY #$F3                        ;C - - - - - 0x01C935 0E:C925: A0 F3
	LDA irqActive                   ;C - - - - - 0x01C937 0E:C927: A5 98
	EOR #$01                        ;C - - - - - 0x01C939 0E:C929: 49 01
	STA irqActive                   ;C - - - - - 0x01C93B 0E:C92B: 85 98
	BNE loc_0E_C930                 ;C - - - - - 0x01C93D 0E:C92D: D0 01
	INY                             ;C - - - - - 0x01C93F 0E:C92F: C8
loc_0E_C930:
	TYA                             ;C - - - - - 0x01C940 0E:C930: 98
	JSR QueueSound                  ;C - - - - - 0x01C941 0E:C931: 20 4C F3
loc_0E_C934:
	LDA irqActive                   ;C - - - - - 0x01C944 0E:C934: A5 98
	BEQ loc_0E_C93B                 ;C - - - - - 0x01C946 0E:C936: F0 03
	JMP loc_0E_C9A7                 ;C - - - - - 0x01C948 0E:C938: 4C A7 C9
loc_0E_C93B:
	JSR RunGameActionFlash          ;C - - - - - 0x01C94B 0E:C93B: 20 B6 C9
	LDX #$00                        ;C - - - - - 0x01C94E 0E:C93E: A2 00
	STX prgBank8000                 ;C - - - - - 0x01C950 0E:C940: 86 F4
	INX                             ;C - - - - - 0x01C952 0E:C942: E8
	STX prgBankA000                 ;C - - - - - 0x01C953 0E:C943: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C955 0E:C945: 20 4D FF
	JSR GameActionDispatch00        ;C - - - - - bank=00 0x01C958 0E:C948: 20 00 80
	JSR UpdateHorizScroll           ;C - - - - - 0x01C95B 0E:C94B: 20 A3 E2
	LDA objX                        ;C - - - - - 0x01C95E 0E:C94E: AD 60 03
	STA ram_0027                    ;C - - - - - 0x01C961 0E:C951: 85 27
	LDA scrollX                     ;C - - - - - 0x01C963 0E:C953: A5 FC
	STA ram_0025                    ;C - - - - - 0x01C965 0E:C955: 85 25
	LDX #$08                        ;C - - - - - 0x01C967 0E:C957: A2 08
	STX prgBank8000                 ;C - - - - - 0x01C969 0E:C959: 86 F4
	INX                             ;C - - - - - 0x01C96B 0E:C95B: E8
	STX prgBankA000                 ;C - - - - - 0x01C96C 0E:C95C: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C96E 0E:C95E: 20 4D FF
	JSR SpawnEnemiesInWindow        ;C - - - - - bank=08 0x01C971 0E:C961: 20 80 80
	JSR StageEventTrigger           ;C - - - - - bank=08 0x01C974 0E:C964: 20 00 89
	JSR PaletteAnimTick             ;C - - - - - bank=09 0x01C977 0E:C967: 20 00 A3
	LDX #$0C                        ;C - - - - - 0x01C97A 0E:C96A: A2 0C
	STX prgBank8000                 ;C - - - - - 0x01C97C 0E:C96C: 86 F4
	INX                             ;C - - - - - 0x01C97E 0E:C96E: E8
	STX prgBankA000                 ;C - - - - - 0x01C97F 0E:C96F: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C981 0E:C971: 20 4D FF
	JSR UpdateEnemiesEntry          ;C - - - - - bank=0C 0x01C984 0E:C974: 20 00 80
	LDA gameAction                  ;C - - - - - 0x01C987 0E:C977: A5 30
	CMP #$07                        ;C - - - - - 0x01C989 0E:C979: C9 07
	BEQ loc_0E_C99D                 ;C - - - - - 0x01C98B 0E:C97B: F0 20
	CMP #$09                        ;C - - - - - 0x01C98D 0E:C97D: C9 09
	BEQ loc_0E_C99D                 ;C - - - - - 0x01C98F 0E:C97F: F0 1C
	JSR UpdateStatusBar             ;C - - - - - 0x01C991 0E:C981: 20 AB E6
	JMP loc_0E_C99D                 ;C - - - - - 0x01C994 0E:C984: 4C 9D C9
loc_0E_C987:
	LDX #$04                        ;C - - - - - 0x01C997 0E:C987: A2 04
	STX prgBank8000                 ;C - - - - - 0x01C999 0E:C989: 86 F4
	INX                             ;C - - - - - 0x01C99B 0E:C98B: E8
	STX prgBankA000                 ;C - - - - - 0x01C99C 0E:C98C: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01C99E 0E:C98E: 20 4D FF
	JSR ScreenDispatch9800          ;C - - - - - bank=04 0x01C9A1 0E:C991: 20 00 98
	LDA objSpriteDown+12            ;C - - - - - 0x01C9A4 0E:C994: AD BC 05
	CMP #$07                        ;C - - - - - 0x01C9A7 0E:C997: C9 07
	BEQ loc_0E_C99D                 ;C - - - - - 0x01C9A9 0E:C999: F0 02
	BNE loc_0E_C9A7                 ;C - - - - - 0x01C9AB 0E:C99B: D0 0A
loc_0E_C99D:
	LDA #$04                        ;C - - - - - 0x01C9AD 0E:C99D: A9 04
	STA oamHideStart                ;C - - - - - 0x01C9AF 0E:C99F: 85 97
	JSR HideSprites                 ;C - - - - - 0x01C9B1 0E:C9A1: 20 1D C3
	JSR DrawObjects                 ;C - - - - - 0x01C9B4 0E:C9A4: 20 BC E9
loc_0E_C9A7:
	JSR UpdateRandom                ;C - - - - - 0x01C9B7 0E:C9A7: 20 B4 C3
	LDA #$00                        ;C - - - - - 0x01C9BA 0E:C9AA: A9 00
	STA renderOffCount              ;C - - - - - 0x01C9BC 0E:C9AC: 85 EE
	JSR WaitFrame                   ;C - - - - - 0x01C9BE 0E:C9AE: 20 31 FF
	INC renderOffCount              ;C - - - - - 0x01C9C1 0E:C9B1: E6 EE
	JMP loc_0E_C8ED                 ;C - - - - - 0x01C9C3 0E:C9B3: 4C ED C8
RunGameActionFlash:
	JSR UpdatePlayerFlash           ;C - - - - - 0x01C9C6 0E:C9B6: 20 D1 CE
; jumps to the handler for gameAction (X=0 on entry)
RunGameAction:
	LDX #$00                        ;C - - - - - 0x01C9C9 0E:C9B9: A2 00
	LDY gameAction                  ;C - - - - - 0x01C9CB 0E:C9BB: A4 30
	LDA gameActionLo,Y              ;C - - - - - 0x01C9CD 0E:C9BD: B9 CA C9
	STA ptr_00                      ;C - - - - - 0x01C9D0 0E:C9C0: 85 00
	LDA gameActionHi,Y              ;C - - - - - 0x01C9D2 0E:C9C2: B9 F5 C9
	STA ptr_00+1                    ;C - - - - - 0x01C9D5 0E:C9C5: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x01C9D7 0E:C9C7: 6C 00 00
gameActionLo:
	.lobytes Act00_Walk, Act01_Jump, Act02_ActionEnd, Act03_Punch, Act04_Grab, Act05_Hit, Act06_Fall, Act07_SelectScreen;- D 2 - - - 0x01C9DA 0E:C9CA:
	.lobytes ActNone, Act09_Continue, Act0A, Act0B_Death, Act0C, ActNone, Act07_SelectScreen, ActNone;- - - - - - 0x01C9E2 0E:C9D2:
	.lobytes ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone;- D 2 - - - 0x01C9EA 0E:C9DA:
	.lobytes ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone;- D 2 - - - 0x01C9F2 0E:C9E2:
	.lobytes ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone;- D 2 - - - 0x01C9FA 0E:C9EA:
	.lobytes ActNone, ActNone, ActNone;- D 2 - - - 0x01CA02 0E:C9F2:
gameActionHi:
	.hibytes Act00_Walk, Act01_Jump, Act02_ActionEnd, Act03_Punch, Act04_Grab, Act05_Hit, Act06_Fall, Act07_SelectScreen;- D 2 - - - 0x01CA05 0E:C9F5:
	.hibytes ActNone, Act09_Continue, Act0A, Act0B_Death, Act0C, ActNone, Act07_SelectScreen, ActNone;- - - - - - 0x01CA0D 0E:C9FD:
	.hibytes ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone;- D 2 - - - 0x01CA15 0E:CA05:
	.hibytes ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone;- D 2 - - - 0x01CA1D 0E:CA0D:
	.hibytes ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone, ActNone;- D 2 - - - 0x01CA25 0E:CA15:
	.hibytes ActNone, ActNone, ActNone;- D 2 - - - 0x01CA2D 0E:CA1D:
; per-frame player control: timers, pad -> new action
Act00_Walk:
	LDA playerInvincible            ;C - - J - - 0x01CA30 0E:CA20: A5 3B
	BEQ loc_0E_CA26                 ;C - - - - - 0x01CA32 0E:CA22: F0 02
	DEC playerInvincible            ;C - - - - - 0x01CA34 0E:CA24: C6 3B
loc_0E_CA26:
	LDA timerA3                     ;C - - - - - 0x01CA36 0E:CA26: A5 A3
	BEQ loc_0E_CA2C                 ;C - - - - - 0x01CA38 0E:CA28: F0 02
	DEC timerA3                     ;C - - - - - 0x01CA3A 0E:CA2A: C6 A3
loc_0E_CA2C:
	LDA padPressed                  ;C - - - - - 0x01CA3C 0E:CA2C: A5 14
	CMP #$80                        ;C - - - - - 0x01CA3E 0E:CA2E: C9 80
	BEQ loc_0E_CA6D                 ;C - - - - - 0x01CA40 0E:CA30: F0 3B
	CMP #$C0                        ;C - - - - - 0x01CA42 0E:CA32: C9 C0
	BEQ loc_0E_CA3C                 ;C - - - - - 0x01CA44 0E:CA34: F0 06
	JMP loc_0E_CAA2                 ;C - - - - - 0x01CA46 0E:CA36: 4C A2 CA
loc_0E_CA39:
	JMP loc_0E_CB07                 ;C - - - - - 0x01CA49 0E:CA39: 4C 07 CB
loc_0E_CA3C:
	LDA playerHealth                ;C - - - - - 0x01CA4C 0E:CA3C: A5 3A
	BEQ loc_0E_CA39                 ;C - - - - - 0x01CA4E 0E:CA3E: F0 F9
	LDA ram_00B2                    ;C - - - - - 0x01CA50 0E:CA40: A5 B2
	BMI loc_0E_CA39                 ;C - - - - - 0x01CA52 0E:CA42: 30 F5
	LDY playerId                    ;C - - - - - 0x01CA54 0E:CA44: A4 34
	CPY #$02                        ;C - - - - - 0x01CA56 0E:CA46: C0 02
	BEQ loc_0E_CA54                 ;C - - - - - 0x01CA58 0E:CA48: F0 0A
	LDA #$38                        ;C - - - - - 0x01CA5A 0E:CA4A: A9 38
	STA objVelYLo                   ;C - - - - - 0x01CA5C 0E:CA4C: 8D 20 04
	LDA #$04                        ;C - - - - - 0x01CA5F 0E:CA4F: A9 04
	STA objVelYHi                   ;C - - - - - 0x01CA61 0E:CA51: 8D 30 04
loc_0E_CA54:
	LDA PlayerRow_E228,Y            ;C - - - - - 0x01CA64 0E:CA54: B9 28 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CA67 0E:CA57: 20 94 F2
	LDA PlayerRow_E270,Y            ;C - - - - - 0x01CA6A 0E:CA5A: B9 70 E2
	JSR SetChrBank2                 ;C - - - - - 0x01CA6D 0E:CA5D: 20 40 F4
	JSR ArmTimerA4                  ;C - - - - - 0x01CA70 0E:CA60: 20 3B F4
	LDA #$17                        ;C - - - - - 0x01CA73 0E:CA63: A9 17
	STA gameAction                  ;C - - - - - 0x01CA75 0E:CA65: 85 30
	LDA objY                        ;C - - - - - 0x01CA77 0E:CA67: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01CA7A 0E:CA6A: 85 36
	RTS                             ;C - - - - - 0x01CA7C 0E:CA6C: 60
loc_0E_CA6D:
	LDA playerHealth                ;C - - - - - 0x01CA7D 0E:CA6D: A5 3A
	BEQ loc_0E_CA77                 ;C - - - - - 0x01CA7F 0E:CA6F: F0 06
	LDA padHeld                     ;C - - - - - 0x01CA81 0E:CA71: A5 16
	AND #$40                        ;C - - - - - 0x01CA83 0E:CA73: 29 40
	BNE loc_0E_CA3C                 ;C - - - - - 0x01CA85 0E:CA75: D0 C5
loc_0E_CA77:
	LDA #$38                        ;C - - - - - 0x01CA87 0E:CA77: A9 38
	STA objVelYLo                   ;C - - - - - 0x01CA89 0E:CA79: 8D 20 04
	LDA #$04                        ;C - - - - - 0x01CA8C 0E:CA7C: A9 04
	STA objVelYHi                   ;C - - - - - 0x01CA8E 0E:CA7E: 8D 30 04
	LDY playerId                    ;C - - - - - 0x01CA91 0E:CA81: A4 34
	LDA PlayerRow_E1E9,Y            ;C - - - - - 0x01CA93 0E:CA83: B9 E9 E1
	JSR SetPlayerAnim               ;C - - - - - 0x01CA96 0E:CA86: 20 94 F2
	LDA PlayerRow_E22E,Y            ;C - - - - - 0x01CA99 0E:CA89: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x01CA9C 0E:CA8C: 20 40 F4
	LDA #$01                        ;C - - - - - 0x01CA9F 0E:CA8F: A9 01
	STA gameAction                  ;C - - - - - 0x01CAA1 0E:CA91: 85 30
	LDA objY                        ;C - - - - - 0x01CAA3 0E:CA93: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01CAA6 0E:CA96: 85 36
	STA jumpBaseY                   ;C - - - - - 0x01CAA8 0E:CA98: 85 A6
	LDA #$1B                        ;C - - - - - 0x01CAAA 0E:CA9A: A9 1B
	JSR QueueSound                  ;C - - - - - 0x01CAAC 0E:CA9C: 20 4C F3
	JMP Act01_Jump                  ;C - - - - - 0x01CAAF 0E:CA9F: 4C 88 CF
loc_0E_CAA2:
	LDY playerId                    ;C - - - - - 0x01CAB2 0E:CAA2: A4 34
	LDA PlayerRow_E1C1,Y            ;C - - - - - 0x01CAB4 0E:CAA4: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x01CAB7 0E:CAA7: 8D 00 04
	LDA PlayerRow_E1C4,Y            ;C - - - - - 0x01CABA 0E:CAAA: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x01CABD 0E:CAAD: 8D 10 04
	LDA PlayerRow_E1C7,Y            ;C - - - - - 0x01CAC0 0E:CAB0: B9 C7 E1
	STA objVelYLo                   ;C - - - - - 0x01CAC3 0E:CAB3: 8D 20 04
	LDA PlayerRow_E1CA,Y            ;C - - - - - 0x01CAC6 0E:CAB6: B9 CA E1
	STA objVelYHi                   ;C - - - - - 0x01CAC9 0E:CAB9: 8D 30 04
	LDA padHeld                     ;C - - - - - 0x01CACC 0E:CABC: A5 16
	CMP #$09                        ;C - - - - - 0x01CACE 0E:CABE: C9 09
	BEQ loc_0E_CAD1                 ;C - - - - - 0x01CAD0 0E:CAC0: F0 0F
	CMP #$05                        ;C - - - - - 0x01CAD2 0E:CAC2: C9 05
	BEQ loc_0E_CAD1                 ;C - - - - - 0x01CAD4 0E:CAC4: F0 0B
	CMP #$0A                        ;C - - - - - 0x01CAD6 0E:CAC6: C9 0A
	BEQ loc_0E_CAD1                 ;C - - - - - 0x01CAD8 0E:CAC8: F0 07
	CMP #$06                        ;C - - - - - 0x01CADA 0E:CACA: C9 06
	BEQ loc_0E_CAD1                 ;C - - - - - 0x01CADC 0E:CACC: F0 03
	JMP loc_0E_CAE5                 ;C - - - - - 0x01CADE 0E:CACE: 4C E5 CA
loc_0E_CAD1:
	LDY playerId                    ;C - - - - - 0x01CAE1 0E:CAD1: A4 34
	LDA PlayerRow_E1D7,Y            ;C - - - - - 0x01CAE3 0E:CAD3: B9 D7 E1
	STA objVelXLo                   ;C - - - - - 0x01CAE6 0E:CAD6: 8D 00 04
	STA objVelYLo                   ;C - - - - - 0x01CAE9 0E:CAD9: 8D 20 04
	LDA PlayerRow_E1DA,Y            ;C - - - - - 0x01CAEC 0E:CADC: B9 DA E1
	STA objVelXHi                   ;C - - - - - 0x01CAEF 0E:CADF: 8D 10 04
	STA objVelYHi                   ;C - - - - - 0x01CAF2 0E:CAE2: 8D 30 04
loc_0E_CAE5:
	LDA padPressed                  ;C - - - - - 0x01CAF5 0E:CAE5: A5 14
	CMP #$40                        ;C - - - - - 0x01CAF7 0E:CAE7: C9 40
	BEQ loc_0E_CAF8                 ;C - - - - - 0x01CAF9 0E:CAE9: F0 0D
	CMP #$80                        ;C - - - - - 0x01CAFB 0E:CAEB: C9 80
	BEQ loc_0E_CAF2                 ;C - - - - - 0x01CAFD 0E:CAED: F0 03
	JMP loc_0E_CCB5                 ;C - - - - - 0x01CAFF 0E:CAEF: 4C B5 CC
loc_0E_CAF2:
	JMP loc_0E_CCDA                 ;c - - - - - 0x01CB02 0E:CAF2: 4C DA CC
loc_0E_CAF5:
	JMP loc_0E_CA3C                 ;c - - - - - 0x01CB05 0E:CAF5: 4C 3C CA
loc_0E_CAF8:
	LDA objY                        ;C - - - - - 0x01CB08 0E:CAF8: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01CB0B 0E:CAFB: 85 36
	LDA playerHealth                ;C - - - - - 0x01CB0D 0E:CAFD: A5 3A
	BEQ loc_0E_CB07                 ;C - - - - - 0x01CB0F 0E:CAFF: F0 06
	LDA padHeld                     ;C - - - - - 0x01CB11 0E:CB01: A5 16
	CMP #$C0                        ;C - - - - - 0x01CB13 0E:CB03: C9 C0
	BEQ loc_0E_CAF5                 ;C - - - - - 0x01CB15 0E:CB05: F0 EE
loc_0E_CB07:
	LDA weaponHeld                  ;C - - - - - 0x01CB17 0E:CB07: A5 A9
	BNE loc_0E_CB66                 ;C - - - - - 0x01CB19 0E:CB09: D0 5B
	LDA timerA3                     ;C - - - - - 0x01CB1B 0E:CB0B: A5 A3
	BNE loc_0E_CB12                 ;C - - - - - 0x01CB1D 0E:CB0D: D0 03
	JMP loc_0E_CCA2                 ;C - - - - - 0x01CB1F 0E:CB0F: 4C A2 CC
loc_0E_CB12:
	LDA #$00                        ;C - - - - - 0x01CB22 0E:CB12: A9 00
	STA timerA3                     ;C - - - - - 0x01CB24 0E:CB14: 85 A3
	LDY playerId                    ;C - - - - - 0x01CB26 0E:CB16: A4 34
	LDA playerStandAnim             ;C - - - - - 0x01CB28 0E:CB18: A5 6F
	CMP PlayerRow_E291,Y            ;C - - - - - 0x01CB2A 0E:CB1A: D9 91 E2
	BNE loc_0E_CB22                 ;C - - - - - 0x01CB2D 0E:CB1D: D0 03
	JMP loc_0E_CBA3                 ;C - - - - - 0x01CB2F 0E:CB1F: 4C A3 CB
loc_0E_CB22:
	LDA playerStandAnim             ;C - - - - - 0x01CB32 0E:CB22: A5 6F
	JSR SetPlayerAnim               ;C - - - - - 0x01CB34 0E:CB24: 20 94 F2
	LDY playerId                    ;C - - - - - 0x01CB37 0E:CB27: A4 34
	LDA objAnim                     ;C - - - - - 0x01CB39 0E:CB29: AD 80 05
	CMP PlayerRow_E288,Y            ;C - - - - - 0x01CB3C 0E:CB2C: D9 88 E2
	BEQ loc_0E_CB53                 ;C - - - - - 0x01CB3F 0E:CB2F: F0 22
	CMP PlayerRow_E28B,Y            ;C - - - - - 0x01CB41 0E:CB31: D9 8B E2
	BEQ loc_0E_CB53                 ;C - - - - - 0x01CB44 0E:CB34: F0 1D
	CMP #$15                        ;C - - - - - 0x01CB46 0E:CB36: C9 15
	BEQ loc_0E_CB3F                 ;C - - - - - 0x01CB48 0E:CB38: F0 05
	LDA PlayerRow_E23A,Y            ;C - - - - - 0x01CB4A 0E:CB3A: B9 3A E2
	BNE loc_0E_CB60                 ;C - - - - - 0x01CB4D 0E:CB3D: D0 21
loc_0E_CB3F:
	LDA #$E8                        ;C - - - - - 0x01CB4F 0E:CB3F: A9 E8
	STA objVelYLo                   ;C - - - - - 0x01CB51 0E:CB41: 8D 20 04
	LDA #$02                        ;C - - - - - 0x01CB54 0E:CB44: A9 02
	STA objVelYHi                   ;C - - - - - 0x01CB56 0E:CB46: 8D 30 04
	LDA objY                        ;C - - - - - 0x01CB59 0E:CB49: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01CB5C 0E:CB4C: 85 36
	LDA PlayerRow_E23D,Y            ;C - - - - - 0x01CB5E 0E:CB4E: B9 3D E2
	BNE loc_0E_CB60                 ;C - - - - - 0x01CB61 0E:CB51: D0 0D
loc_0E_CB53:
	LDA #$01                        ;C - - - - - 0x01CB63 0E:CB53: A9 01
	STA objAnimFrame                ;C - - - - - 0x01CB65 0E:CB55: 8D 70 05
	LDA #$00                        ;C - - - - - 0x01CB68 0E:CB58: A9 00
	STA objAnimFlags                ;C - - - - - 0x01CB6A 0E:CB5A: 8D 90 05
	LDA PlayerRow_E237,Y            ;C - - - - - 0x01CB6D 0E:CB5D: B9 37 E2
loc_0E_CB60:
	JSR SetChrBank2                 ;C - - - - - 0x01CB70 0E:CB60: 20 40 F4
	JMP loc_0E_CB99                 ;C - - - - - 0x01CB73 0E:CB63: 4C 99 CB
loc_0E_CB66:
	LDA playerId                    ;C - - - - - 0x01CB76 0E:CB66: A5 34
	CMP #$01                        ;C - - - - - 0x01CB78 0E:CB68: C9 01
	BEQ loc_0E_CB86                 ;C - - - - - 0x01CB7A 0E:CB6A: F0 1A
	CMP #$02                        ;C - - - - - 0x01CB7C 0E:CB6C: C9 02
	BEQ loc_0E_CB86                 ;C - - - - - 0x01CB7E 0E:CB6E: F0 16
	JSR FindObjNearPlayer           ;C - - - - - 0x01CB80 0E:CB70: 20 33 CF
	BEQ loc_0E_CB86                 ;C - - - - - 0x01CB83 0E:CB73: F0 11
	LDY playerId                    ;C - - - - - 0x01CB85 0E:CB75: A4 34
	LDA PlayerRow_E222,Y            ;C - - - - - 0x01CB87 0E:CB77: B9 22 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CB8A 0E:CB7A: 20 94 F2
	LDA PlayerRow_E26A,Y            ;C - - - - - 0x01CB8D 0E:CB7D: B9 6A E2
	JSR SetChrBank2                 ;C D 2 - I - 0x01CB90 0E:CB80: 20 40 F4
	JMP loc_0E_CB99                 ;C - - - - - 0x01CB93 0E:CB83: 4C 99 CB
loc_0E_CB86:
	LDY playerId                    ;C - - - - - 0x01CB96 0E:CB86: A4 34
	LDA PlayerRow_E225,Y            ;C D 2 - I - 0x01CB98 0E:CB88: B9 25 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CB9B 0E:CB8B: 20 94 F2
	LDA PlayerRow_E26D,Y            ;C - - - - - 0x01CB9E 0E:CB8E: B9 6D E2
	JSR SetChrBank2                 ;C - - - - - 0x01CBA1 0E:CB91: 20 40 F4
	LDA #$11                        ;C - - - - - 0x01CBA4 0E:CB94: A9 11
	STA gameAction                  ;C - - - - - 0x01CBA6 0E:CB96: 85 30
	RTS                             ;C D 2 - I - 0x01CBA8 0E:CB98: 60
loc_0E_CB99:
	LDA #$03                        ;C - - - - - 0x01CBA9 0E:CB99: A9 03
	STA gameAction                  ;C - - - - - 0x01CBAB 0E:CB9B: 85 30
	JMP Act03_Punch                 ;C - - - - - 0x01CBAD 0E:CB9D: 4C 0F D3
loc_0E_CBA0:
	JMP loc_0E_CB22                 ;C D 2 - I - 0x01CBB0 0E:CBA0: 4C 22 CB
loc_0E_CBA3:
	LDY ram_00A8                    ;C - - - - - 0x01CBB3 0E:CBA3: A4 A8
	CPY #$00                        ;C - - - - - 0x01CBB5 0E:CBA5: C0 00
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBB7 0E:CBA7: F0 F7
	CPY #$01                        ;C - - - - - 0x01CBB9 0E:CBA9: C0 01
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBBB 0E:CBAB: F0 F3
	CPY #$02                        ;C - - - - - 0x01CBBD 0E:CBAD: C0 02
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBBF 0E:CBAF: F0 EF
	CPY #$0E                        ;C - - - - - 0x01CBC1 0E:CBB1: C0 0E
	BCS loc_0E_CBA0                 ;C - - - - - 0x01CBC3 0E:CBB3: B0 EB
	LDA objActive,Y                 ;C - - - - - 0x01CBC5 0E:CBB5: B9 00 03
	BPL loc_0E_CBA0                 ;C - - - - - 0x01CBC8 0E:CBB8: 10 E6
	LDA objKind,Y                   ;C - - - - - 0x01CBCA 0E:CBBA: B9 20 03
	CMP #$06                        ;C - - - - - 0x01CBCD 0E:CBBD: C9 06
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBCF 0E:CBBF: F0 DF
	CMP #$03                        ;C - - - - - 0x01CBD1 0E:CBC1: C9 03
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBD3 0E:CBC3: F0 DB
	CMP #$05                        ;C - - - - - 0x01CBD5 0E:CBC5: C9 05
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBD7 0E:CBC7: F0 D7
	CMP #$07                        ;C - - - - - 0x01CBD9 0E:CBC9: C9 07
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBDB 0E:CBCB: F0 D3
	CMP #$16                        ;C - - - - - 0x01CBDD 0E:CBCD: C9 16
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBDF 0E:CBCF: F0 CF
	CMP #$09                        ;C - - - - - 0x01CBE1 0E:CBD1: C9 09
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBE3 0E:CBD3: F0 CB
	CMP #$6C                        ;C - - - - - 0x01CBE5 0E:CBD5: C9 6C
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBE7 0E:CBD7: F0 C7
	CMP #$2E                        ;C - - - - - 0x01CBE9 0E:CBD9: C9 2E
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBEB 0E:CBDB: F0 C3
	CMP #$9D                        ;C - - - - - 0x01CBED 0E:CBDD: C9 9D
	BEQ loc_0E_CBA0                 ;C - - - - - 0x01CBEF 0E:CBDF: F0 BF
	LDA objSpriteAir+15             ;C - - - - - 0x01CBF1 0E:CBE1: AD FF 04
	BEQ loc_0E_CBEE                 ;C - - - - - 0x01CBF4 0E:CBE4: F0 08
	TAY                             ;C - - - - - 0x01CBF6 0E:CBE6: A8
	LDA objLife,Y                   ;C - - - - - 0x01CBF7 0E:CBE7: B9 90 04
	CMP #$26                        ;C - - - - - 0x01CBFA 0E:CBEA: C9 26
	BCC loc_0E_CBA0                 ;C - - - - - 0x01CBFC 0E:CBEC: 90 B2
loc_0E_CBEE:
	LDY ram_00A8                    ;C - - - - - 0x01CBFE 0E:CBEE: A4 A8
	LDA objX                        ;C - - - - - 0x01CC00 0E:CBF0: AD 60 03
	SEC                             ;C - - - - - 0x01CC03 0E:CBF3: 38
	SBC objX,Y                      ;C - - - - - 0x01CC04 0E:CBF4: F9 60 03
	PHA                             ;C - - - - - 0x01CC07 0E:CBF7: 48
	LDA objXPage                    ;C - - - - - 0x01CC08 0E:CBF8: AD 80 03
	SBC objXPage,Y                  ;C - - - - - 0x01CC0B 0E:CBFB: F9 80 03
	PLA                             ;C - - - - - 0x01CC0E 0E:CBFE: 68
	BCS loc_0E_CC06                 ;C - - - - - 0x01CC0F 0E:CBFF: B0 05
	EOR #$FF                        ;C - - - - - 0x01CC11 0E:CC01: 49 FF
	ADC #$01                        ;C - - - - - 0x01CC13 0E:CC03: 69 01
	CLC                             ;C - - - - - 0x01CC15 0E:CC05: 18
loc_0E_CC06:
	CMP #$20                        ;C - - - - - 0x01CC16 0E:CC06: C9 20
	BCS loc_0E_CBA0                 ;C - - - - - 0x01CC18 0E:CC08: B0 96
	LDA objY                        ;C - - - - - 0x01CC1A 0E:CC0A: AD C0 03
	SEC                             ;C - - - - - 0x01CC1D 0E:CC0D: 38
	SBC objY,Y                      ;C - - - - - 0x01CC1E 0E:CC0E: F9 C0 03
	BCS loc_0E_CC18                 ;C - - - - - 0x01CC21 0E:CC11: B0 05
	EOR #$FF                        ;C - - - - - 0x01CC23 0E:CC13: 49 FF
	ADC #$01                        ;C - - - - - 0x01CC25 0E:CC15: 69 01
	CLC                             ;C - - - - - 0x01CC27 0E:CC17: 18
loc_0E_CC18:
	CMP #$14                        ;C - - - - - 0x01CC28 0E:CC18: C9 14
	BCS loc_0E_CBA0                 ;C - - - - - 0x01CC2A 0E:CC1A: B0 84
	LDA padHeld                     ;C - - - - - 0x01CC2C 0E:CC1C: A5 16
	CMP #$44                        ;C - - - - - 0x01CC2E 0E:CC1E: C9 44
	BEQ loc_0E_CC29                 ;C - - - - - 0x01CC30 0E:CC20: F0 07
	CMP #$48                        ;C - - - - - 0x01CC32 0E:CC22: C9 48
	BEQ loc_0E_CC29                 ;C - - - - - 0x01CC34 0E:CC24: F0 03
	JMP loc_0E_CB22                 ;C - - - - - 0x01CC36 0E:CC26: 4C 22 CB
loc_0E_CC29:
	LDY playerId                    ;C - - - - - 0x01CC39 0E:CC29: A4 34
	LDA PlayerRow_E216,Y            ;C - - - - - 0x01CC3B 0E:CC2B: B9 16 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CC3E 0E:CC2E: 20 94 F2
	LDA PlayerRow_E25E,Y            ;C - - - - - 0x01CC41 0E:CC31: B9 5E E2
	JSR SetChrBank2                 ;C - - - - - 0x01CC44 0E:CC34: 20 40 F4
	LDY ram_00A8                    ;C - - - - - 0x01CC47 0E:CC37: A4 A8
	STY grabbedSlot                 ;C - - - - - 0x01CC49 0E:CC39: 84 39
	LDA playerId                    ;C - - - - - 0x01CC4B 0E:CC3B: A5 34
	BNE loc_0E_CC52                 ;C - - - - - 0x01CC4D 0E:CC3D: D0 13
	LDA objFacing,Y                 ;c - - - - - 0x01CC4F 0E:CC3F: B9 60 04
	AND #$03                        ;c - - - - - 0x01CC52 0E:CC42: 29 03
	CMP playerFacing                ;c - - - - - 0x01CC54 0E:CC44: C5 31
	BEQ loc_0E_CC4F                 ;c - - - - - 0x01CC56 0E:CC46: F0 07
	LDA playerFacing                ;c - - - - - 0x01CC58 0E:CC48: A5 31
	STA objFacing,Y                 ;c - - - - - 0x01CC5A 0E:CC4A: 99 60 04
	BNE loc_0E_CC52                 ;c - - - - - 0x01CC5D 0E:CC4D: D0 03
loc_0E_CC4F:
	JSR PlaceGrabbedEnemy           ;c - - - - - 0x01CC5F 0E:CC4F: 20 85 CC
loc_0E_CC52:
	LDA objY                        ;C - - - - - 0x01CC62 0E:CC52: AD C0 03
	STA objY,Y                      ;C - - - - - 0x01CC65 0E:CC55: 99 C0 03
	LDA playerId                    ;C - - - - - 0x01CC68 0E:CC58: A5 34
	CMP #$01                        ;C - - - - - 0x01CC6A 0E:CC5A: C9 01
	BEQ loc_0E_CC65                 ;C - - - - - 0x01CC6C 0E:CC5C: F0 07
	CMP #$02                        ;C - - - - - 0x01CC6E 0E:CC5E: C9 02
	BEQ loc_0E_CC76                 ;C - - - - - 0x01CC70 0E:CC60: F0 14
	JMP loc_0E_D7F2                 ;c - - - - - 0x01CC72 0E:CC62: 4C F2 D7
loc_0E_CC65:
	LDA objFacing,Y                 ;c - - - - - 0x01CC75 0E:CC65: B9 60 04
	AND #$03                        ;c - - - - - 0x01CC78 0E:CC68: 29 03
	CMP playerFacing                ;c - - - - - 0x01CC7A 0E:CC6A: C5 31
	BEQ loc_0E_CC70                 ;c - - - - - 0x01CC7C 0E:CC6C: F0 02
	BNE loc_0E_CC73                 ;c - - - - - 0x01CC7E 0E:CC6E: D0 03
loc_0E_CC70:
	JSR PlaceGrabbedEnemy           ;c - - - - - 0x01CC80 0E:CC70: 20 85 CC
loc_0E_CC73:
	JMP loc_0E_D88C                 ;c - - - - - 0x01CC83 0E:CC73: 4C 8C D8
loc_0E_CC76:
	LDA objFacing,Y                 ;C - - - - - 0x01CC86 0E:CC76: B9 60 04
	AND #$03                        ;C - - - - - 0x01CC89 0E:CC79: 29 03
	CMP playerFacing                ;C - - - - - 0x01CC8B 0E:CC7B: C5 31
	BNE loc_0E_CC82                 ;C - - - - - 0x01CC8D 0E:CC7D: D0 03
	JMP loc_0E_CB22                 ;c - - - - - 0x01CC8F 0E:CC7F: 4C 22 CB
loc_0E_CC82:
	JMP loc_0E_D8A8                 ;C - - - - - 0x01CC92 0E:CC82: 4C A8 D8
PlaceGrabbedEnemy:
	LDA playerFacing                ;c - - - - - 0x01CC95 0E:CC85: A5 31
	AND #$02                        ;c - - - - - 0x01CC97 0E:CC87: 29 02
	TAY                             ;c - - - - - 0x01CC99 0E:CC89: A8
	LDA objX                        ;c - - - - - 0x01CC9A 0E:CC8A: AD 60 03
	CLC                             ;c - - - - - 0x01CC9D 0E:CC8D: 18
	ADC PlayerRow_E1D3,Y            ;c - - - - - 0x01CC9E 0E:CC8E: 79 D3 E1
	PHA                             ;c - - - - - 0x01CCA1 0E:CC91: 48
	LDA objXPage                    ;c - - - - - 0x01CCA2 0E:CC92: AD 80 03
	ADC PlayerRow_E1D4,Y            ;c - - - - - 0x01CCA5 0E:CC95: 79 D4 E1
	LDY grabbedSlot                 ;c - - - - - 0x01CCA8 0E:CC98: A4 39
	STA objXPage,Y                  ;c - - - - - 0x01CCAA 0E:CC9A: 99 80 03
	PLA                             ;c - - - - - 0x01CCAD 0E:CC9D: 68
	STA objX,Y                      ;c - - - - - 0x01CCAE 0E:CC9E: 99 60 03
	RTS                             ;c - - - - - 0x01CCB1 0E:CCA1: 60
loc_0E_CCA2:
	LDA #$03                        ;C - - - - - 0x01CCB2 0E:CCA2: A9 03
	STA gameAction                  ;C - - - - - 0x01CCB4 0E:CCA4: 85 30
	LDY playerId                    ;C - - - - - 0x01CCB6 0E:CCA6: A4 34
	LDA PlayerRow_E1EF,Y            ;C - - - - - 0x01CCB8 0E:CCA8: B9 EF E1
	JSR SetPlayerAnim               ;C - - - - - 0x01CCBB 0E:CCAB: 20 94 F2
	LDA PlayerRow_E237,Y            ;C - - - - - 0x01CCBE 0E:CCAE: B9 37 E2
	JSR SetChrBank2                 ;C - - - - - 0x01CCC1 0E:CCB1: 20 40 F4
; RTS, used for every unused gameAction value
ActNone:
	RTS                             ;C - - J - - 0x01CCC4 0E:CCB4: 60
loc_0E_CCB5:
	LDY playerId                    ;C - - - - - 0x01CCC5 0E:CCB5: A4 34
	LDA weaponHeld                  ;C - - - - - 0x01CCC7 0E:CCB7: A5 A9
	BNE loc_0E_CCCC                 ;C - - - - - 0x01CCC9 0E:CCB9: D0 11
	LDA objAnim                     ;C - - - - - 0x01CCCB 0E:CCBB: AD 80 05
	CMP PlayerRow_E273,Y            ;C - - - - - 0x01CCCE 0E:CCBE: D9 73 E2
	BEQ loc_0E_CCDA                 ;C - - - - - 0x01CCD1 0E:CCC1: F0 17
	LDA PlayerRow_E1E6,Y            ;C - - - - - 0x01CCD3 0E:CCC3: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x01CCD6 0E:CCC6: 20 94 F2
	JMP loc_0E_CCDA                 ;C - - - - - 0x01CCD9 0E:CCC9: 4C DA CC
loc_0E_CCCC:
	LDA objAnim                     ;C - - - - - 0x01CCDC 0E:CCCC: AD 80 05
	CMP PlayerRow_E29A,Y            ;C - - - - - 0x01CCDF 0E:CCCF: D9 9A E2
	BEQ loc_0E_CCDA                 ;C - - - - - 0x01CCE2 0E:CCD2: F0 06
	LDA PlayerRow_E204,Y            ;C - - - - - 0x01CCE4 0E:CCD4: B9 04 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CCE7 0E:CCD7: 20 94 F2
loc_0E_CCDA:
	LDA objY                        ;C - - - - - 0x01CCEA 0E:CCDA: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01CCED 0E:CCDD: 85 36
	LDX #$00                        ;C - - - - - 0x01CCEF 0E:CCDF: A2 00
	LDA padHeld                     ;C - - - - - 0x01CCF1 0E:CCE1: A5 16
	AND #$03                        ;C - - - - - 0x01CCF3 0E:CCE3: 29 03
	BEQ loc_0E_CCFA                 ;C - - - - - 0x01CCF5 0E:CCE5: F0 13
	STA playerFacing                ;C - - - - - 0x01CCF7 0E:CCE7: 85 31
	AND #$01                        ;C - - - - - 0x01CCF9 0E:CCE9: 29 01
	BEQ loc_0E_CCF5                 ;C - - - - - 0x01CCFB 0E:CCEB: F0 08
	LDY #$00                        ;C - - - - - 0x01CCFD 0E:CCED: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x01CCFF 0E:CCEF: 20 00 F0
	JMP loc_0E_CCFA                 ;C - - - - - 0x01CD02 0E:CCF2: 4C FA CC
loc_0E_CCF5:
	LDY #$01                        ;C - - - - - 0x01CD05 0E:CCF5: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x01CD07 0E:CCF7: 20 51 F0
loc_0E_CCFA:
	LDA padHeld                     ;C - - - - - 0x01CD0A 0E:CCFA: A5 16
	AND #$0C                        ;C - - - - - 0x01CD0C 0E:CCFC: 29 0C
	BEQ loc_0E_CD3B                 ;C - - - - - 0x01CD0E 0E:CCFE: F0 3B
	AND #$04                        ;C - - - - - 0x01CD10 0E:CD00: 29 04
	BEQ loc_0E_CD1A                 ;C - - - - - 0x01CD12 0E:CD02: F0 16
	LDA playerId                    ;C - - - - - 0x01CD14 0E:CD04: A5 34
	CMP #$00                        ;C - - - - - 0x01CD16 0E:CD06: C9 00
	BEQ loc_0E_CD12                 ;C - - - - - 0x01CD18 0E:CD08: F0 08
	CMP #$01                        ;C - - - - - 0x01CD1A 0E:CD0A: C9 01
	BEQ loc_0E_CD12                 ;C - - - - - 0x01CD1C 0E:CD0C: F0 04
	LDY #$02                        ;C - - - - - 0x01CD1E 0E:CD0E: A0 02
	BNE loc_0E_CD14                 ;C - - - - - 0x01CD20 0E:CD10: D0 02
loc_0E_CD12:
	LDY #$00                        ;C - - - - - 0x01CD22 0E:CD12: A0 00
loc_0E_CD14:
	JSR MoveYAddCheck               ;C - - - - - 0x01CD24 0E:CD14: 20 A2 F0
	JMP loc_0E_CD3B                 ;C - - - - - 0x01CD27 0E:CD17: 4C 3B CD
loc_0E_CD1A:
	LDY playerId                    ;C - - - - - 0x01CD2A 0E:CD1A: A4 34
	LDA PlayerRow_E1DD,Y            ;C - - - - - 0x01CD2C 0E:CD1C: B9 DD E1
	STA objVelYLo                   ;C - - - - - 0x01CD2F 0E:CD1F: 8D 20 04
	LDA PlayerRow_E1E0,Y            ;C - - - - - 0x01CD32 0E:CD22: B9 E0 E1
	STA objVelYHi                   ;C - - - - - 0x01CD35 0E:CD25: 8D 30 04
	LDA playerId                    ;C - - - - - 0x01CD38 0E:CD28: A5 34
	CMP #$00                        ;C - - - - - 0x01CD3A 0E:CD2A: C9 00
	BEQ loc_0E_CD36                 ;C - - - - - 0x01CD3C 0E:CD2C: F0 08
	CMP #$01                        ;C - - - - - 0x01CD3E 0E:CD2E: C9 01
	BEQ loc_0E_CD36                 ;C - - - - - 0x01CD40 0E:CD30: F0 04
	LDY #$03                        ;C - - - - - 0x01CD42 0E:CD32: A0 03
	BNE loc_0E_CD38                 ;C - - - - - 0x01CD44 0E:CD34: D0 02
loc_0E_CD36:
	LDY #$01                        ;C - - - - - 0x01CD46 0E:CD36: A0 01
loc_0E_CD38:
	JSR MoveYSubCheck               ;C - - - - - 0x01CD48 0E:CD38: 20 F7 F0
loc_0E_CD3B:
	LDA padHeld                     ;C - - - - - 0x01CD4B 0E:CD3B: A5 16
	AND #$0F                        ;C - - - - - 0x01CD4D 0E:CD3D: 29 0F
	BEQ loc_0E_CD5C                 ;C - - - - - 0x01CD4F 0E:CD3F: F0 1B
	CMP #$05                        ;C - - - - - 0x01CD51 0E:CD41: C9 05
	BEQ loc_0E_CD55                 ;C - - - - - 0x01CD53 0E:CD43: F0 10
	CMP #$06                        ;C - - - - - 0x01CD55 0E:CD45: C9 06
	BEQ loc_0E_CD55                 ;C - - - - - 0x01CD57 0E:CD47: F0 0C
	CMP #$09                        ;C - - - - - 0x01CD59 0E:CD49: C9 09
	BEQ loc_0E_CD55                 ;C - - - - - 0x01CD5B 0E:CD4B: F0 08
	CMP #$0A                        ;C - - - - - 0x01CD5D 0E:CD4D: C9 0A
	BEQ loc_0E_CD55                 ;C - - - - - 0x01CD5F 0E:CD4F: F0 04
	AND #$0C                        ;C - - - - - 0x01CD61 0E:CD51: 29 0C
	BNE loc_0E_CD5C                 ;C - - - - - 0x01CD63 0E:CD53: D0 07
loc_0E_CD55:
	LDY #$0F                        ;C - - - - - 0x01CD65 0E:CD55: A0 0F
loc_0E_CD57:
	DEY                             ;C - - - - - 0x01CD67 0E:CD57: 88
	CPY #$02                        ;C - - - - - 0x01CD68 0E:CD58: C0 02
	BNE loc_0E_CD5F                 ;C - - - - - 0x01CD6A 0E:CD5A: D0 03
loc_0E_CD5C:
	JMP loc_0E_CEA4                 ;C - - - - - 0x01CD6C 0E:CD5C: 4C A4 CE
loc_0E_CD5F:
	LDA objActive,Y                 ;C - - - - - 0x01CD6F 0E:CD5F: B9 00 03
	BPL loc_0E_CD57                 ;C - - - - - 0x01CD72 0E:CD62: 10 F3
	LDA objFlags,Y                  ;C - - - - - 0x01CD74 0E:CD64: B9 60 05
	BPL loc_0E_CD57                 ;C - - - - - 0x01CD77 0E:CD67: 10 EE
	LDA objKind,Y                   ;C - - - - - 0x01CD79 0E:CD69: B9 20 03
	CMP #$1E                        ;C - - - - - 0x01CD7C 0E:CD6C: C9 1E
	BCC loc_0E_CD57                 ;C - - - - - 0x01CD7E 0E:CD6E: 90 E7
	CMP #$6F                        ;C - - - - - 0x01CD80 0E:CD70: C9 6F
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD82 0E:CD72: F0 E3
	CMP #$8E                        ;C - - - - - 0x01CD84 0E:CD74: C9 8E
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD86 0E:CD76: F0 DF
	CMP #$9D                        ;C - - - - - 0x01CD88 0E:CD78: C9 9D
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD8A 0E:CD7A: F0 DB
	CMP #$2E                        ;C - - - - - 0x01CD8C 0E:CD7C: C9 2E
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD8E 0E:CD7E: F0 D7
	CMP #$61                        ;C - - - - - 0x01CD90 0E:CD80: C9 61
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD92 0E:CD82: F0 D3
	CMP #$69                        ;C - - - - - 0x01CD94 0E:CD84: C9 69
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD96 0E:CD86: F0 CF
	CMP #$6A                        ;C - - - - - 0x01CD98 0E:CD88: C9 6A
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD9A 0E:CD8A: F0 CB
	CMP #$6C                        ;C - - - - - 0x01CD9C 0E:CD8C: C9 6C
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CD9E 0E:CD8E: F0 C7
	CMP #$6D                        ;C - - - - - 0x01CDA0 0E:CD90: C9 6D
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDA2 0E:CD92: F0 C3
	CMP #$66                        ;C - - - - - 0x01CDA4 0E:CD94: C9 66
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDA6 0E:CD96: F0 BF
	CMP #$91                        ;C - - - - - 0x01CDA8 0E:CD98: C9 91
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDAA 0E:CD9A: F0 BB
	CMP #$72                        ;C - - - - - 0x01CDAC 0E:CD9C: C9 72
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDAE 0E:CD9E: F0 B7
	LDA objDownState,Y              ;C - - - - - 0x01CDB0 0E:CDA0: B9 C0 04
	BNE loc_0E_CD57                 ;C - - - - - 0x01CDB3 0E:CDA3: D0 B2
	LDA objAnim,Y                   ;C - - - - - 0x01CDB5 0E:CDA5: B9 80 05
	CMP #$A6                        ;C - - - - - 0x01CDB8 0E:CDA8: C9 A6
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDBA 0E:CDAA: F0 AB
	CMP #$AC                        ;C - - - - - 0x01CDBC 0E:CDAC: C9 AC
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDBE 0E:CDAE: F0 A7
	CMP #$84                        ;C - - - - - 0x01CDC0 0E:CDB0: C9 84
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDC2 0E:CDB2: F0 A3
	CMP #$E7                        ;C - - - - - 0x01CDC4 0E:CDB4: C9 E7
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDC6 0E:CDB6: F0 9F
	CMP #$BE                        ;C - - - - - 0x01CDC8 0E:CDB8: C9 BE
	BEQ loc_0E_CD57                 ;C - - - - - 0x01CDCA 0E:CDBA: F0 9B
	LDA objY                        ;C - - - - - 0x01CDCC 0E:CDBC: AD C0 03
	SEC                             ;C - - - - - 0x01CDCF 0E:CDBF: 38
	SBC objY,Y                      ;C - - - - - 0x01CDD0 0E:CDC0: F9 C0 03
	BCS loc_0E_CDCA                 ;C - - - - - 0x01CDD3 0E:CDC3: B0 05
	EOR #$FF                        ;C - - - - - 0x01CDD5 0E:CDC5: 49 FF
	ADC #$01                        ;C - - - - - 0x01CDD7 0E:CDC7: 69 01
	CLC                             ;C - - - - - 0x01CDD9 0E:CDC9: 18
loc_0E_CDCA:
	CMP #$08                        ;C - - - - - 0x01CDDA 0E:CDCA: C9 08
	BCS loc_0E_CE11                 ;C - - - - - 0x01CDDC 0E:CDCC: B0 43
	LDA objX                        ;C - - - - - 0x01CDDE 0E:CDCE: AD 60 03
	SEC                             ;C - - - - - 0x01CDE1 0E:CDD1: 38
	SBC objX,Y                      ;C - - - - - 0x01CDE2 0E:CDD2: F9 60 03
	PHA                             ;C - - - - - 0x01CDE5 0E:CDD5: 48
	LDA objXPage                    ;C - - - - - 0x01CDE6 0E:CDD6: AD 80 03
	SBC objXPage,Y                  ;C - - - - - 0x01CDE9 0E:CDD9: F9 80 03
	PLA                             ;C - - - - - 0x01CDEC 0E:CDDC: 68
	BCS loc_0E_CDE4                 ;C - - - - - 0x01CDED 0E:CDDD: B0 05
	EOR #$FF                        ;C - - - - - 0x01CDEF 0E:CDDF: 49 FF
	ADC #$01                        ;C - - - - - 0x01CDF1 0E:CDE1: 69 01
	CLC                             ;C - - - - - 0x01CDF3 0E:CDE3: 18
loc_0E_CDE4:
	STA ptr_00                      ;C - - - - - 0x01CDF4 0E:CDE4: 85 00
	LDA playerId                    ;C - - - - - 0x01CDF6 0E:CDE6: A5 34
	CMP #$02                        ;C - - - - - 0x01CDF8 0E:CDE8: C9 02
	BNE loc_0E_CDF5                 ;C - - - - - 0x01CDFA 0E:CDEA: D0 09
	LDA ptr_00                      ;C - - - - - 0x01CDFC 0E:CDEC: A5 00
	CMP #$08                        ;C - - - - - 0x01CDFE 0E:CDEE: C9 08
	BCS loc_0E_CE11                 ;C - - - - - 0x01CE00 0E:CDF0: B0 1F
	JMP loc_0E_CDFB                 ;C - - - - - 0x01CE02 0E:CDF2: 4C FB CD
loc_0E_CDF5:
	LDA ptr_00                      ;C - - - - - 0x01CE05 0E:CDF5: A5 00
	CMP #$07                        ;C - - - - - 0x01CE07 0E:CDF7: C9 07
	BCS loc_0E_CE11                 ;C - - - - - 0x01CE09 0E:CDF9: B0 16
loc_0E_CDFB:
	LDA objY                        ;C - - - - - 0x01CE0B 0E:CDFB: AD C0 03
	SEC                             ;C - - - - - 0x01CE0E 0E:CDFE: 38
	SBC objY,Y                      ;C - - - - - 0x01CE0F 0E:CDFF: F9 C0 03
	BCS loc_0E_CE09                 ;C - - - - - 0x01CE12 0E:CE02: B0 05
	EOR #$FF                        ;C - - - - - 0x01CE14 0E:CE04: 49 FF
	ADC #$01                        ;C - - - - - 0x01CE16 0E:CE06: 69 01
	CLC                             ;C - - - - - 0x01CE18 0E:CE08: 18
loc_0E_CE09:
	CMP #$00                        ;C - - - - - 0x01CE19 0E:CE09: C9 00
	BEQ loc_0E_CE14                 ;C - - - - - 0x01CE1B 0E:CE0B: F0 07
	CMP #$08                        ;C - - - - - 0x01CE1D 0E:CE0D: C9 08
	BCC loc_0E_CE14                 ;C - - - - - 0x01CE1F 0E:CE0F: 90 03
loc_0E_CE11:
	JMP loc_0E_CD57                 ;C - - - - - 0x01CE21 0E:CE11: 4C 57 CD
loc_0E_CE14:
	LDA ram_0050                    ;C - - - - - 0x01CE24 0E:CE14: A5 50
	BEQ loc_0E_CE38                 ;C - - - - - 0x01CE26 0E:CE16: F0 20
	LDA playerId                    ;C - - - - - 0x01CE28 0E:CE18: A5 34
	CMP #$02                        ;C - - - - - 0x01CE2A 0E:CE1A: C9 02
	BNE loc_0E_CE42                 ;C - - - - - 0x01CE2C 0E:CE1C: D0 24
	LDA playerFacing                ;C - - - - - 0x01CE2E 0E:CE1E: A5 31
	CMP #$02                        ;C - - - - - 0x01CE30 0E:CE20: C9 02
	BNE loc_0E_CE2E                 ;C - - - - - 0x01CE32 0E:CE22: D0 0A
	LDA objX                        ;C - - - - - 0x01CE34 0E:CE24: AD 60 03
	CMP #$28                        ;C - - - - - 0x01CE37 0E:CE27: C9 28
	BCS loc_0E_CE42                 ;C - - - - - 0x01CE39 0E:CE29: B0 17
	JMP loc_0E_CE11                 ;C - - - - - 0x01CE3B 0E:CE2B: 4C 11 CE
loc_0E_CE2E:
	LDA objX                        ;C - - - - - 0x01CE3E 0E:CE2E: AD 60 03
	CMP #$E0                        ;C - - - - - 0x01CE41 0E:CE31: C9 E0
	BCC loc_0E_CE42                 ;C - - - - - 0x01CE43 0E:CE33: 90 0D
	JMP loc_0E_CE11                 ;C - - - - - 0x01CE45 0E:CE35: 4C 11 CE
loc_0E_CE38:
	LDA objX                        ;C - - - - - 0x01CE48 0E:CE38: AD 60 03
	SEC                             ;C - - - - - 0x01CE4B 0E:CE3B: 38
	SBC scrollX                     ;C - - - - - 0x01CE4C 0E:CE3C: E5 FC
	CMP #$24                        ;C - - - - - 0x01CE4E 0E:CE3E: C9 24
	BCC loc_0E_CE11                 ;C - - - - - 0x01CE50 0E:CE40: 90 CF
loc_0E_CE42:
	LDA objY                        ;C - - - - - 0x01CE52 0E:CE42: AD C0 03
	STA objY,Y                      ;C - - - - - 0x01CE55 0E:CE45: 99 C0 03
	STY grabbedSlot                 ;C - - - - - 0x01CE58 0E:CE48: 84 39
	LDA playerFacing                ;C - - - - - 0x01CE5A 0E:CE4A: A5 31
	AND #$02                        ;C - - - - - 0x01CE5C 0E:CE4C: 29 02
	TAY                             ;C - - - - - 0x01CE5E 0E:CE4E: A8
	LDA objX                        ;C - - - - - 0x01CE5F 0E:CE4F: AD 60 03
	CLC                             ;C - - - - - 0x01CE62 0E:CE52: 18
	ADC PlayerRow_E1D3,Y            ;C - - - - - 0x01CE63 0E:CE53: 79 D3 E1
	PHA                             ;C - - - - - 0x01CE66 0E:CE56: 48
	LDA objXPage                    ;C - - - - - 0x01CE67 0E:CE57: AD 80 03
	ADC PlayerRow_E1D4,Y            ;C - - - - - 0x01CE6A 0E:CE5A: 79 D4 E1
	LDY grabbedSlot                 ;C - - - - - 0x01CE6D 0E:CE5D: A4 39
	STA objXPage,Y                  ;C - - - - - 0x01CE6F 0E:CE5F: 99 80 03
	PLA                             ;C - - - - - 0x01CE72 0E:CE62: 68
	STA objX,Y                      ;C - - - - - 0x01CE73 0E:CE63: 99 60 03
	LDA padHeld                     ;C - - - - - 0x01CE76 0E:CE66: A5 16
	AND #$03                        ;C - - - - - 0x01CE78 0E:CE68: 29 03
	BEQ loc_0E_CEA4                 ;C - - - - - 0x01CE7A 0E:CE6A: F0 38
	LDA #$04                        ;C - - - - - 0x01CE7C 0E:CE6C: A9 04
	STA gameAction                  ;C - - - - - 0x01CE7E 0E:CE6E: 85 30
	LDY playerId                    ;C - - - - - 0x01CE80 0E:CE70: A4 34
	CPY #$02                        ;C - - - - - 0x01CE82 0E:CE72: C0 02
	BNE loc_0E_CE85                 ;C - - - - - 0x01CE84 0E:CE74: D0 0F
	LDY grabbedSlot                 ;C - - - - - 0x01CE86 0E:CE76: A4 39
	LDA objY,Y                      ;C - - - - - 0x01CE88 0E:CE78: B9 C0 03
	SEC                             ;C - - - - - 0x01CE8B 0E:CE7B: 38
	SBC #$06                        ;C - - - - - 0x01CE8C 0E:CE7C: E9 06
	STA objY,Y                      ;C - - - - - 0x01CE8E 0E:CE7E: 99 C0 03
	LDA #$5A                        ;C - - - - - 0x01CE91 0E:CE81: A9 5A
	BNE loc_0E_CE89                 ;C - - - - - 0x01CE93 0E:CE83: D0 04
loc_0E_CE85:
	LDA #$3C                        ;C - - - - - 0x01CE95 0E:CE85: A9 3C
	BNE loc_0E_CE89                 ;C - - - - - 0x01CE97 0E:CE87: D0 00
loc_0E_CE89:
	STA grabTimer                   ;C - - - - - 0x01CE99 0E:CE89: 85 38
	LDY grabbedSlot                 ;C - - - - - 0x01CE9B 0E:CE8B: A4 39
	STA objGrabState,Y              ;C - - - - - 0x01CE9D 0E:CE8D: 99 F0 03
	LDA #$00                        ;C - - - - - 0x01CEA0 0E:CE90: A9 00
	STA objAtkBox,Y                 ;C - - - - - 0x01CEA2 0E:CE92: 99 40 04
	LDY playerId                    ;C - - - - - 0x01CEA5 0E:CE95: A4 34
	LDA PlayerRow_E213,Y            ;C - - - - - 0x01CEA7 0E:CE97: B9 13 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CEAA 0E:CE9A: 20 94 F2
	LDA PlayerRow_E25B,Y            ;C - - - - - 0x01CEAD 0E:CE9D: B9 5B E2
	JSR SetChrBank2                 ;C - - - - - 0x01CEB0 0E:CEA0: 20 40 F4
	RTS                             ;C - - - - - 0x01CEB3 0E:CEA3: 60
loc_0E_CEA4:
	LDA padHeld                     ;C - - - - - 0x01CEB4 0E:CEA4: A5 16
	AND #$0F                        ;C - - - - - 0x01CEB6 0E:CEA6: 29 0F
	BNE loc_0E_CEC1                 ;C - - - - - 0x01CEB8 0E:CEA8: D0 17
; slot 0 gets the standing animation for the current weapon state
ResetPlayerStand:
	LDA objY                        ;C - - - - - 0x01CEBA 0E:CEAA: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01CEBD 0E:CEAD: 85 36
	LDA weaponHeld                  ;C - - - - - 0x01CEBF 0E:CEAF: A5 A9
	BNE loc_0E_CEC2                 ;C - - - - - 0x01CEC1 0E:CEB1: D0 0F
	LDY playerId                    ;C - - - - - 0x01CEC3 0E:CEB3: A4 34
	LDA PlayerRow_E1E3,Y            ;C - - - - - 0x01CEC5 0E:CEB5: B9 E3 E1
	JSR SetPlayerAnim               ;C - - - - - 0x01CEC8 0E:CEB8: 20 94 F2
	LDA PlayerRow_E22B,Y            ;C - - - - - 0x01CECB 0E:CEBB: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x01CECE 0E:CEBE: 20 40 F4
loc_0E_CEC1:
	RTS                             ;C - - - - - 0x01CED1 0E:CEC1: 60
loc_0E_CEC2:
	LDY playerId                    ;C - - - - - 0x01CED2 0E:CEC2: A4 34
	LDA PlayerRow_E21F,Y            ;C - - - - - 0x01CED4 0E:CEC4: B9 1F E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CED7 0E:CEC7: 20 94 F2
	LDA PlayerRow_E267,Y            ;C - - - - - 0x01CEDA 0E:CECA: B9 67 E2
	JSR SetChrBank2                 ;C - - - - - 0x01CEDD 0E:CECD: 20 40 F4
	RTS                             ;C - - - - - 0x01CEE0 0E:CED0: 60
; blinks the player palette from ram_006A/ram_0069
UpdatePlayerFlash:
	LDA flashTimerB                 ;C - - - - - 0x01CEE1 0E:CED1: A5 6A
	BEQ loc_0E_CEED                 ;C - - - - - 0x01CEE3 0E:CED3: F0 18
	DEC flashTimerB                 ;C - - - - - 0x01CEE5 0E:CED5: C6 6A
	AND #$02                        ;C - - - - - 0x01CEE7 0E:CED7: 29 02
	BNE loc_0E_CEE2                 ;C - - - - - 0x01CEE9 0E:CED9: D0 07
loc_0E_CEDB:
	LDY playerId                    ;C - - - - - 0x01CEEB 0E:CEDB: A4 34
	LDA UpdatePlayerFlashTbl_FCC8,Y ;C - - - - - 0x01CEED 0E:CEDD: B9 C8 FC
	BNE loc_0E_CEE5                 ;C - - - - - 0x01CEF0 0E:CEE0: D0 03
loc_0E_CEE2:
	LDA UpdatePlayerFlashTbl_FCCB,Y ;C - - - - - 0x01CEF2 0E:CEE2: B9 CB FC
loc_0E_CEE5:
	STA palBuffer+23                ;C - - - - - 0x01CEF5 0E:CEE5: 8D 17 06
	LDA #$FF                        ;C - - - - - 0x01CEF8 0E:CEE8: A9 FF
	STA palUpdateFlag               ;C - - - - - 0x01CEFA 0E:CEEA: 85 18
	RTS                             ;C - - - - - 0x01CEFC 0E:CEEC: 60
loc_0E_CEED:
	LDA flashTimerA                 ;C - - - - - 0x01CEFD 0E:CEED: A5 69
	BEQ loc_0E_CEFA                 ;C - - - - - 0x01CEFF 0E:CEEF: F0 09
	DEC flashTimerA                 ;C - - - - - 0x01CF01 0E:CEF1: C6 69
	AND #$02                        ;C - - - - - 0x01CF03 0E:CEF3: 29 02
	BNE loc_0E_CEE2                 ;C - - - - - 0x01CF05 0E:CEF5: D0 EB
	BEQ loc_0E_CEDB                 ;C - - - - - 0x01CF07 0E:CEF7: F0 E2
	RTS                             ;c - - - - - 0x01CF09 0E:CEF9: 60
loc_0E_CEFA:
	LDY playerId                    ;C - - - - - 0x01CF0A 0E:CEFA: A4 34
	LDA objAnim                     ;C - - - - - 0x01CF0C 0E:CEFC: AD 80 05
	CMP PlayerRow_E297,Y            ;C - - - - - 0x01CF0F 0E:CEFF: D9 97 E2
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF12 0E:CF02: F0 2E
	CMP #$49                        ;C - - - - - 0x01CF14 0E:CF04: C9 49
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF16 0E:CF06: F0 2A
	CMP #$36                        ;C - - - - - 0x01CF18 0E:CF08: C9 36
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF1A 0E:CF0A: F0 26
	CMP #$4C                        ;C - - - - - 0x01CF1C 0E:CF0C: C9 4C
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF1E 0E:CF0E: F0 22
	CMP #$5C                        ;C - - - - - 0x01CF20 0E:CF10: C9 5C
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF22 0E:CF12: F0 1E
	CMP #$15                        ;C - - - - - 0x01CF24 0E:CF14: C9 15
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF26 0E:CF16: F0 1A
	CMP #$14                        ;C - - - - - 0x01CF28 0E:CF18: C9 14
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF2A 0E:CF1A: F0 16
	CMP #$5B                        ;C - - - - - 0x01CF2C 0E:CF1C: C9 5B
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF2E 0E:CF1E: F0 12
	LDA gameAction                  ;C - - - - - 0x01CF30 0E:CF20: A5 30
	CMP #$12                        ;C - - - - - 0x01CF32 0E:CF22: C9 12
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF34 0E:CF24: F0 0C
	CMP #$18                        ;C - - - - - 0x01CF36 0E:CF26: C9 18
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF38 0E:CF28: F0 08
	CMP #$14                        ;C - - - - - 0x01CF3A 0E:CF2A: C9 14
	BEQ loc_0E_CF32                 ;C - - - - - 0x01CF3C 0E:CF2C: F0 04
	LDA #$00                        ;C - - - - - 0x01CF3E 0E:CF2E: A9 00
	STA playerBusy                  ;C - - - - - 0x01CF40 0E:CF30: 85 6E
loc_0E_CF32:
	RTS                             ;C - - - - - 0x01CF42 0E:CF32: 60
FindObjNearPlayer:
	LDY #$0F                        ;C - - - - - 0x01CF43 0E:CF33: A0 0F
loc_0E_CF35:
	LDA objActive,Y                 ;C - - - - - 0x01CF45 0E:CF35: B9 00 03
	BPL loc_0E_CF80                 ;C - - - - - 0x01CF48 0E:CF38: 10 46
	LDA objKind,Y                   ;C - - - - - 0x01CF4A 0E:CF3A: B9 20 03
	CMP #$69                        ;C - - - - - 0x01CF4D 0E:CF3D: C9 69
	BEQ loc_0E_CF80                 ;C - - - - - 0x01CF4F 0E:CF3F: F0 3F
	CMP #$10                        ;C - - - - - 0x01CF51 0E:CF41: C9 10
	BEQ loc_0E_CF80                 ;C - - - - - 0x01CF53 0E:CF43: F0 3B
	CMP #$11                        ;C - - - - - 0x01CF55 0E:CF45: C9 11
	BEQ loc_0E_CF80                 ;C - - - - - 0x01CF57 0E:CF47: F0 37
	CMP #$12                        ;C - - - - - 0x01CF59 0E:CF49: C9 12
	BEQ loc_0E_CF80                 ;C - - - - - 0x01CF5B 0E:CF4B: F0 33
	CMP #$13                        ;C - - - - - 0x01CF5D 0E:CF4D: C9 13
	BEQ loc_0E_CF80                 ;C - - - - - 0x01CF5F 0E:CF4F: F0 2F
	LDA objY                        ;C - - - - - 0x01CF61 0E:CF51: AD C0 03
	SEC                             ;C - - - - - 0x01CF64 0E:CF54: 38
	SBC objY,Y                      ;C - - - - - 0x01CF65 0E:CF55: F9 C0 03
	BCS loc_0E_CF5F                 ;C - - - - - 0x01CF68 0E:CF58: B0 05
	EOR #$FF                        ;C - - - - - 0x01CF6A 0E:CF5A: 49 FF
	ADC #$01                        ;C - - - - - 0x01CF6C 0E:CF5C: 69 01
	CLC                             ;C - - - - - 0x01CF6E 0E:CF5E: 18
loc_0E_CF5F:
	CMP #$10                        ;C - - - - - 0x01CF6F 0E:CF5F: C9 10
	BCS loc_0E_CF80                 ;C - - - - - 0x01CF71 0E:CF61: B0 1D
	LDA objX                        ;C - - - - - 0x01CF73 0E:CF63: AD 60 03
	SEC                             ;C - - - - - 0x01CF76 0E:CF66: 38
	SBC objX,Y                      ;C - - - - - 0x01CF77 0E:CF67: F9 60 03
	PHA                             ;C - - - - - 0x01CF7A 0E:CF6A: 48
	LDA objXPage                    ;C - - - - - 0x01CF7B 0E:CF6B: AD 80 03
	SBC objXPage,Y                  ;C - - - - - 0x01CF7E 0E:CF6E: F9 80 03
	PLA                             ;C - - - - - 0x01CF81 0E:CF71: 68
	BCS loc_0E_CF79                 ;C - - - - - 0x01CF82 0E:CF72: B0 05
	EOR #$FF                        ;c - - - - - 0x01CF84 0E:CF74: 49 FF
	ADC #$01                        ;c - - - - - 0x01CF86 0E:CF76: 69 01
	CLC                             ;c - - - - - 0x01CF88 0E:CF78: 18
loc_0E_CF79:
	CMP #$60                        ;C - - - - - 0x01CF89 0E:CF79: C9 60
	BCS loc_0E_CF80                 ;C - - - - - 0x01CF8B 0E:CF7B: B0 03
	LDA #$FF                        ;C - - - - - 0x01CF8D 0E:CF7D: A9 FF
	RTS                             ;C - - - - - 0x01CF8F 0E:CF7F: 60
loc_0E_CF80:
	DEY                             ;C - - - - - 0x01CF90 0E:CF80: 88
	CPY #$03                        ;C - - - - - 0x01CF91 0E:CF81: C0 03
	BNE loc_0E_CF35                 ;C - - - - - 0x01CF93 0E:CF83: D0 B0
	LDA #$00                        ;C - - - - - 0x01CF95 0E:CF85: A9 00
	RTS                             ;C - - - - - 0x01CF97 0E:CF87: 60
Act01_Jump:
	LDY #$00                        ;C - - - - - 0x01CF98 0E:CF88: A0 00
	LDX #$00                        ;C - - - - - 0x01CF9A 0E:CF8A: A2 00
	JSR MoveYGravityCheck           ;C - - - - - 0x01CF9C 0E:CF8C: 20 19 F1
	BCC loc_0E_CF94                 ;C - - - - - 0x01CF9F 0E:CF8F: 90 03
	JMP loc_0E_D00E                 ;C - - - - - 0x01CFA1 0E:CF91: 4C 0E D0
loc_0E_CF94:
	LDY playerId                    ;C - - - - - 0x01CFA4 0E:CF94: A4 34
	LDA PlayerRow_E279,Y            ;C - - - - - 0x01CFA6 0E:CF96: B9 79 E2
	CMP objAnim                     ;C - - - - - 0x01CFA9 0E:CF99: CD 80 05
	BEQ loc_0E_CFEE                 ;C - - - - - 0x01CFAC 0E:CF9C: F0 50
	LDA PlayerRow_E27C,Y            ;C - - - - - 0x01CFAE 0E:CF9E: B9 7C E2
	CMP objAnim                     ;C - - - - - 0x01CFB1 0E:CFA1: CD 80 05
	BEQ loc_0E_CFEE                 ;C - - - - - 0x01CFB4 0E:CFA4: F0 48
	LDA objVelYHi                   ;C - - - - - 0x01CFB6 0E:CFA6: AD 30 04
	BPL loc_0E_CFEE                 ;C - - - - - 0x01CFB9 0E:CFA9: 10 43
	LDY playerId                    ;C - - - - - 0x01CFBB 0E:CFAB: A4 34
	LDA PlayerRow_E27F,Y            ;C - - - - - 0x01CFBD 0E:CFAD: B9 7F E2
	CMP objAnim                     ;C - - - - - 0x01CFC0 0E:CFB0: CD 80 05
	BEQ loc_0E_CFC7                 ;C - - - - - 0x01CFC3 0E:CFB3: F0 12
	LDA PlayerRow_E285,Y            ;C - - - - - 0x01CFC5 0E:CFB5: B9 85 E2
	CMP objAnim                     ;C - - - - - 0x01CFC8 0E:CFB8: CD 80 05
	BEQ loc_0E_CFC7                 ;C - - - - - 0x01CFCB 0E:CFBB: F0 0A
	LDA PlayerRow_E282,Y            ;C - - - - - 0x01CFCD 0E:CFBD: B9 82 E2
	CMP objAnim                     ;C - - - - - 0x01CFD0 0E:CFC0: CD 80 05
	BEQ loc_0E_CFE6                 ;C - - - - - 0x01CFD3 0E:CFC3: F0 21
	BNE loc_0E_CFEE                 ;C - - - - - 0x01CFD5 0E:CFC5: D0 27
loc_0E_CFC7:
	LDA spriteFlipMask              ;C - - - - - 0x01CFD7 0E:CFC7: A5 10
	CMP #$40                        ;C - - - - - 0x01CFD9 0E:CFC9: C9 40
	BNE loc_0E_CFDF                 ;C - - - - - 0x01CFDB 0E:CFCB: D0 12
	JSR StartAction24               ;c - - - - - 0x01CFDD 0E:CFCD: 20 D1 CF
	RTS                             ;c - - - - - 0x01CFE0 0E:CFD0: 60
StartAction24:
	LDA gameAction                  ;c - - - - - 0x01CFE1 0E:CFD1: A5 30
	STA ram_00BE                    ;c - - - - - 0x01CFE3 0E:CFD3: 85 BE
	LDA #$24                        ;c - - - - - 0x01CFE5 0E:CFD5: A9 24
	STA gameAction                  ;c - - - - - 0x01CFE7 0E:CFD7: 85 30
	LDA #$80                        ;c - - - - - 0x01CFE9 0E:CFD9: A9 80
	STA objActive                   ;c - - - - - 0x01CFEB 0E:CFDB: 8D 00 03
	RTS                             ;c - - - - - 0x01CFEE 0E:CFDE: 60
loc_0E_CFDF:
	LDA objAnimFrame                ;C - - - - - 0x01CFEF 0E:CFDF: AD 70 05
	CMP #$03                        ;C - - - - - 0x01CFF2 0E:CFE2: C9 03
	BNE loc_0E_CFEE                 ;C - - - - - 0x01CFF4 0E:CFE4: D0 08
loc_0E_CFE6:
	LDY playerId                    ;C - - - - - 0x01CFF6 0E:CFE6: A4 34
	LDA PlayerRow_E219,Y            ;C - - - - - 0x01CFF8 0E:CFE8: B9 19 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01CFFB 0E:CFEB: 20 94 F2
loc_0E_CFEE:
	LDA spriteFlipMask              ;C - - - - - 0x01CFFE 0E:CFEE: A5 10
	CMP #$40                        ;C - - - - - 0x01D000 0E:CFF0: C9 40
	BNE loc_0E_CFF8                 ;C - - - - - 0x01D002 0E:CFF2: D0 04
	JSR StartAction24               ;c - - - - - 0x01D004 0E:CFF4: 20 D1 CF
	RTS                             ;c - - - - - 0x01D007 0E:CFF7: 60
loc_0E_CFF8:
	LDA objY                        ;C - - - - - 0x01D008 0E:CFF8: AD C0 03
	CLC                             ;C - - - - - 0x01D00B 0E:CFFB: 18
	ADC #$02                        ;C - - - - - 0x01D00C 0E:CFFC: 69 02
	CMP playerGroundY               ;C - - - - - 0x01D00E 0E:CFFE: C5 36
	BCC loc_0E_D04A                 ;C - - - - - 0x01D010 0E:D000: 90 48
	BEQ loc_0E_D00B                 ;C - - - - - 0x01D012 0E:D002: F0 07
	SBC #$03                        ;C - - - - - 0x01D014 0E:D004: E9 03
	STA objY                        ;C - - - - - 0x01D016 0E:D006: 8D C0 03
	BNE loc_0E_D00E                 ;C - - - - - 0x01D019 0E:D009: D0 03
loc_0E_D00B:
	STA objY                        ;C - - - - - 0x01D01B 0E:D00B: 8D C0 03
loc_0E_D00E:
	LDA spriteFlipMask              ;C - - - - - 0x01D01E 0E:D00E: A5 10
	CMP #$40                        ;C - - - - - 0x01D020 0E:D010: C9 40
	BCS loc_0E_D016                 ;C - - - - - 0x01D022 0E:D012: B0 02
	BCC loc_0E_D01A                 ;C - - - - - 0x01D024 0E:D014: 90 04
loc_0E_D016:
	JSR StartAction24               ;c - - - - - 0x01D026 0E:D016: 20 D1 CF
	RTS                             ;c - - - - - 0x01D029 0E:D019: 60
loc_0E_D01A:
	LDA #$02                        ;C - - - - - 0x01D02A 0E:D01A: A9 02
	STA gameAction                  ;C - - - - - 0x01D02C 0E:D01C: 85 30
	LDA #$03                        ;C - - - - - 0x01D02E 0E:D01E: A9 03
	STA actionTimer                 ;C - - - - - 0x01D030 0E:D020: 85 37
	JSR ClearTimerA4                ;C - - - - - 0x01D032 0E:D022: 20 36 F4
	LDA playerId                    ;C - - - - - 0x01D035 0E:D025: A5 34
	CMP #$01                        ;C - - - - - 0x01D037 0E:D027: C9 01
	BNE loc_0E_D03C                 ;C - - - - - 0x01D039 0E:D029: D0 11
	LDA ram_00B3                    ;C - - - - - 0x01D03B 0E:D02B: A5 B3
	BEQ loc_0E_D03C                 ;C - - - - - 0x01D03D 0E:D02D: F0 0D
	LDA #$68                        ;C - - - - - 0x01D03F 0E:D02F: A9 68
	JSR SetPlayerAnim               ;C - - - - - 0x01D041 0E:D031: 20 94 F2
	LDA #$06                        ;C - - - - - 0x01D044 0E:D034: A9 06
	JSR SetChrBank2                 ;C - - - - - 0x01D046 0E:D036: 20 40 F4
	JMP loc_0E_D03F                 ;C - - - - - 0x01D049 0E:D039: 4C 3F D0
loc_0E_D03C:
	JSR ResetPlayerStand            ;C - - - - - 0x01D04C 0E:D03C: 20 AA CE
loc_0E_D03F:
	LDA #$1C                        ;C - - - - - 0x01D04F 0E:D03F: A9 1C
	JSR QueueSound                  ;C - - - - - 0x01D051 0E:D041: 20 4C F3
	LDA #$00                        ;C - - - - - 0x01D054 0E:D044: A9 00
	STA objParamA                   ;C - - - - - 0x01D056 0E:D046: 8D 10 05
	RTS                             ;C - - - - - 0x01D059 0E:D049: 60
loc_0E_D04A:
	LDA playerId                    ;C - - - - - 0x01D05A 0E:D04A: A5 34
	CMP #$01                        ;C - - - - - 0x01D05C 0E:D04C: C9 01
	BNE loc_0E_D061                 ;C - - - - - 0x01D05E 0E:D04E: D0 11
	LDA objAnim                     ;C - - - - - 0x01D060 0E:D050: AD 80 05
	CMP #$3B                        ;C - - - - - 0x01D063 0E:D053: C9 3B
	BNE loc_0E_D061                 ;C - - - - - 0x01D065 0E:D055: D0 0A
	LDA padPressed                  ;C - - - - - 0x01D067 0E:D057: A5 14
	CMP #$08                        ;C - - - - - 0x01D069 0E:D059: C9 08
	BNE loc_0E_D061                 ;C - - - - - 0x01D06B 0E:D05B: D0 04
	LDA #$05                        ;C - - - - - 0x01D06D 0E:D05D: A9 05
	STA ram_00B3                    ;C - - - - - 0x01D06F 0E:D05F: 85 B3
loc_0E_D061:
	LDA padPressed                  ;C - - - - - 0x01D071 0E:D061: A5 14
	CMP #$40                        ;C - - - - - 0x01D073 0E:D063: C9 40
	BEQ loc_0E_D06A                 ;C - - - - - 0x01D075 0E:D065: F0 03
	JMP loc_0E_D18E                 ;C - - - - - 0x01D077 0E:D067: 4C 8E D1
loc_0E_D06A:
	LDA objVelYHi                   ;C - - - - - 0x01D07A 0E:D06A: AD 30 04
	BPL loc_0E_D076                 ;C - - - - - 0x01D07D 0E:D06D: 10 07
	CMP #$FE                        ;C - - - - - 0x01D07F 0E:D06F: C9 FE
	BCS loc_0E_D076                 ;C - - - - - 0x01D081 0E:D071: B0 03
	JMP loc_0E_D18E                 ;C - - - - - 0x01D083 0E:D073: 4C 8E D1
loc_0E_D076:
	LDA actionStep                  ;C - - - - - 0x01D086 0E:D076: A5 35
	BNE loc_0E_D0D8                 ;C - - - - - 0x01D088 0E:D078: D0 5E
	LDA padHeld                     ;C - - - - - 0x01D08A 0E:D07A: A5 16
	AND #$0F                        ;C - - - - - 0x01D08C 0E:D07C: 29 0F
	STA ptr_00                      ;C - - - - - 0x01D08E 0E:D07E: 85 00
	CMP #$01                        ;C - - - - - 0x01D090 0E:D080: C9 01
	BEQ loc_0E_D0BC                 ;C - - - - - 0x01D092 0E:D082: F0 38
	CMP #$02                        ;C - - - - - 0x01D094 0E:D084: C9 02
	BEQ loc_0E_D0BC                 ;C - - - - - 0x01D096 0E:D086: F0 34
	CMP #$04                        ;C - - - - - 0x01D098 0E:D088: C9 04
	BEQ loc_0E_D098                 ;C - - - - - 0x01D09A 0E:D08A: F0 0C
	CMP #$05                        ;C - - - - - 0x01D09C 0E:D08C: C9 05
	BEQ loc_0E_D098                 ;C - - - - - 0x01D09E 0E:D08E: F0 08
	LDA ptr_00                      ;C - - - - - 0x01D0A0 0E:D090: A5 00
	CMP #$06                        ;C - - - - - 0x01D0A2 0E:D092: C9 06
	BEQ loc_0E_D098                 ;C - - - - - 0x01D0A4 0E:D094: F0 02
	BNE loc_0E_D0BC                 ;C - - - - - 0x01D0A6 0E:D096: D0 24
loc_0E_D098:
	LDY playerId                    ;C - - - - - 0x01D0A8 0E:D098: A4 34
	LDA PlayerRow_E1FB,Y            ;C - - - - - 0x01D0AA 0E:D09A: B9 FB E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D0AD 0E:D09D: 20 94 F2
	LDA PlayerRow_E246,Y            ;C - - - - - 0x01D0B0 0E:D0A0: B9 46 E2
	JSR SetChrBank2                 ;C - - - - - 0x01D0B3 0E:D0A3: 20 40 F4
	CPY #$02                        ;C - - - - - 0x01D0B6 0E:D0A6: C0 02
	BNE loc_0E_D0AE                 ;C - - - - - 0x01D0B8 0E:D0A8: D0 04
	LDA #$03                        ;C - - - - - 0x01D0BA 0E:D0AA: A9 03
	BNE loc_0E_D0B0                 ;C - - - - - 0x01D0BC 0E:D0AC: D0 02
loc_0E_D0AE:
	LDA #$04                        ;C - - - - - 0x01D0BE 0E:D0AE: A9 04
loc_0E_D0B0:
	STA attackType                  ;C - - - - - 0x01D0C0 0E:D0B0: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x01D0C2 0E:D0B2: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x01D0C5 0E:D0B5: A5 36
	STA jumpBaseY                   ;C - - - - - 0x01D0C7 0E:D0B7: 85 A6
	JMP loc_0E_D18E                 ;C - - - - - 0x01D0C9 0E:D0B9: 4C 8E D1
loc_0E_D0BC:
	LDY playerId                    ;C - - - - - 0x01D0CC 0E:D0BC: A4 34
	LDA PlayerRow_E1FE,Y            ;C - - - - - 0x01D0CE 0E:D0BE: B9 FE E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D0D1 0E:D0C1: 20 94 F2
	LDA PlayerRow_E246,Y            ;C - - - - - 0x01D0D4 0E:D0C4: B9 46 E2
	JSR SetChrBank2                 ;C - - - - - 0x01D0D7 0E:D0C7: 20 40 F4
	LDA #$03                        ;C - - - - - 0x01D0DA 0E:D0CA: A9 03
	STA attackType                  ;C - - - - - 0x01D0DC 0E:D0CC: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x01D0DE 0E:D0CE: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x01D0E1 0E:D0D1: A5 36
	STA jumpBaseY                   ;C - - - - - 0x01D0E3 0E:D0D3: 85 A6
	JMP loc_0E_D18E                 ;C - - - - - 0x01D0E5 0E:D0D5: 4C 8E D1
loc_0E_D0D8:
	LDA padPressed                  ;C - - - - - 0x01D0E8 0E:D0D8: A5 14
	CMP #$40                        ;C - - - - - 0x01D0EA 0E:D0DA: C9 40
	BEQ loc_0E_D0E1                 ;C - - - - - 0x01D0EC 0E:D0DC: F0 03
	JMP loc_0E_D18E                 ;c - - - - - 0x01D0EE 0E:D0DE: 4C 8E D1
loc_0E_D0E1:
	LDY playerId                    ;C - - - - - 0x01D0F1 0E:D0E1: A4 34
	LDA objAnim                     ;C - - - - - 0x01D0F3 0E:D0E3: AD 80 05
	CMP PlayerRow_E279,Y            ;C - - - - - 0x01D0F6 0E:D0E6: D9 79 E2
	BNE loc_0E_D0EE                 ;C - - - - - 0x01D0F9 0E:D0E9: D0 03
	JMP loc_0E_D18E                 ;C - - - - - 0x01D0FB 0E:D0EB: 4C 8E D1
loc_0E_D0EE:
	LDA objAnim                     ;C - - - - - 0x01D0FE 0E:D0EE: AD 80 05
	CMP PlayerRow_E27C,Y            ;C - - - - - 0x01D101 0E:D0F1: D9 7C E2
	BNE loc_0E_D0F9                 ;C - - - - - 0x01D104 0E:D0F4: D0 03
	JMP loc_0E_D18E                 ;C - - - - - 0x01D106 0E:D0F6: 4C 8E D1
loc_0E_D0F9:
	LDA playerFacing                ;C - - - - - 0x01D109 0E:D0F9: A5 31
	CMP ram_0032                    ;C - - - - - 0x01D10B 0E:D0FB: C5 32
	BNE loc_0E_D159                 ;C - - - - - 0x01D10D 0E:D0FD: D0 5A
	LDA padHeld                     ;C - - - - - 0x01D10F 0E:D0FF: A5 16
	AND #$0F                        ;C - - - - - 0x01D111 0E:D101: 29 0F
	STA ptr_00                      ;C - - - - - 0x01D113 0E:D103: 85 00
	CMP #$01                        ;C - - - - - 0x01D115 0E:D105: C9 01
	BEQ loc_0E_D13F                 ;C - - - - - 0x01D117 0E:D107: F0 36
	CMP #$02                        ;C - - - - - 0x01D119 0E:D109: C9 02
	BEQ loc_0E_D13F                 ;C - - - - - 0x01D11B 0E:D10B: F0 32
	CMP #$04                        ;C - - - - - 0x01D11D 0E:D10D: C9 04
	BEQ loc_0E_D11D                 ;C - - - - - 0x01D11F 0E:D10F: F0 0C
	CMP #$05                        ;C - - - - - 0x01D121 0E:D111: C9 05
	BEQ loc_0E_D11D                 ;C - - - - - 0x01D123 0E:D113: F0 08
	LDA ptr_00                      ;C - - - - - 0x01D125 0E:D115: A5 00
	CMP #$06                        ;C - - - - - 0x01D127 0E:D117: C9 06
	BEQ loc_0E_D11D                 ;C - - - - - 0x01D129 0E:D119: F0 02
	BNE loc_0E_D13F                 ;C - - - - - 0x01D12B 0E:D11B: D0 22
loc_0E_D11D:
	LDY playerId                    ;C - - - - - 0x01D12D 0E:D11D: A4 34
	LDA PlayerRow_E1FB,Y            ;C - - - - - 0x01D12F 0E:D11F: B9 FB E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D132 0E:D122: 20 94 F2
	LDA PlayerRow_E246,Y            ;C - - - - - 0x01D135 0E:D125: B9 46 E2
	JSR SetChrBank2                 ;C - - - - - 0x01D138 0E:D128: 20 40 F4
	CPY #$02                        ;C - - - - - 0x01D13B 0E:D12B: C0 02
	BNE loc_0E_D133                 ;C - - - - - 0x01D13D 0E:D12D: D0 04
	LDA #$03                        ;C - - - - - 0x01D13F 0E:D12F: A9 03
	BNE loc_0E_D135                 ;C - - - - - 0x01D141 0E:D131: D0 02
loc_0E_D133:
	LDA #$04                        ;C - - - - - 0x01D143 0E:D133: A9 04
loc_0E_D135:
	STA attackType                  ;C - - - - - 0x01D145 0E:D135: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x01D147 0E:D137: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x01D14A 0E:D13A: A5 36
	STA jumpBaseY                   ;C - - - - - 0x01D14C 0E:D13C: 85 A6
	RTS                             ;C - - - - - 0x01D14E 0E:D13E: 60
loc_0E_D13F:
	LDY playerId                    ;C - - - - - 0x01D14F 0E:D13F: A4 34
	LDA PlayerRow_E201,Y            ;C - - - - - 0x01D151 0E:D141: B9 01 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01D154 0E:D144: 20 94 F2
	LDA PlayerRow_E249,Y            ;C - - - - - 0x01D157 0E:D147: B9 49 E2
	JSR SetChrBank2                 ;C - - - - - 0x01D15A 0E:D14A: 20 40 F4
	LDA #$03                        ;C - - - - - 0x01D15D 0E:D14D: A9 03
	STA attackType                  ;C - - - - - 0x01D15F 0E:D14F: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x01D161 0E:D151: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x01D164 0E:D154: A5 36
	STA jumpBaseY                   ;C - - - - - 0x01D166 0E:D156: 85 A6
loc_0E_D158:
	RTS                             ;C - - - - - 0x01D168 0E:D158: 60
loc_0E_D159:
	LDA padHeld                     ;C - - - - - 0x01D169 0E:D159: A5 16
	AND #$0F                        ;C - - - - - 0x01D16B 0E:D15B: 29 0F
	STA ptr_00                      ;C - - - - - 0x01D16D 0E:D15D: 85 00
	CMP #$04                        ;C - - - - - 0x01D16F 0E:D15F: C9 04
	BEQ loc_0E_D16D                 ;C - - - - - 0x01D171 0E:D161: F0 0A
	CMP #$05                        ;C - - - - - 0x01D173 0E:D163: C9 05
	BEQ loc_0E_D16D                 ;C - - - - - 0x01D175 0E:D165: F0 06
	CMP #$06                        ;C - - - - - 0x01D177 0E:D167: C9 06
	BEQ loc_0E_D16D                 ;C - - - - - 0x01D179 0E:D169: F0 02
	BNE loc_0E_D18E                 ;C - - - - - 0x01D17B 0E:D16B: D0 21
loc_0E_D16D:
	LDY playerId                    ;C - - - - - 0x01D17D 0E:D16D: A4 34
	LDA PlayerRow_E1FB,Y            ;C - - - - - 0x01D17F 0E:D16F: B9 FB E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D182 0E:D172: 20 94 F2
	LDA PlayerRow_E243,Y            ;C - - - - - 0x01D185 0E:D175: B9 43 E2
	JSR SetChrBank2                 ;C - - - - - 0x01D188 0E:D178: 20 40 F4
	CPY #$02                        ;C - - - - - 0x01D18B 0E:D17B: C0 02
	BNE loc_0E_D183                 ;C - - - - - 0x01D18D 0E:D17D: D0 04
	LDA #$03                        ;C - - - - - 0x01D18F 0E:D17F: A9 03
	BNE loc_0E_D185                 ;C - - - - - 0x01D191 0E:D181: D0 02
loc_0E_D183:
	LDA #$04                        ;c - - - - - 0x01D193 0E:D183: A9 04
loc_0E_D185:
	STA attackType                  ;C - - - - - 0x01D195 0E:D185: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x01D197 0E:D187: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x01D19A 0E:D18A: A5 36
	STA jumpBaseY                   ;C - - - - - 0x01D19C 0E:D18C: 85 A6
loc_0E_D18E:
	LDA actionStep                  ;C - - - - - 0x01D19E 0E:D18E: A5 35
	BNE loc_0E_D1F3                 ;C - - - - - 0x01D1A0 0E:D190: D0 61
	LDA objVelYHi                   ;C - - - - - 0x01D1A2 0E:D192: AD 30 04
	BMI loc_0E_D158                 ;C - - - - - 0x01D1A5 0E:D195: 30 C1
	LDY playerId                    ;C - - - - - 0x01D1A7 0E:D197: A4 34
	LDA objAnim                     ;C - - - - - 0x01D1A9 0E:D199: AD 80 05
	CMP PlayerRow_E279,Y            ;C - - - - - 0x01D1AC 0E:D19C: D9 79 E2
	BEQ loc_0E_D158                 ;C - - - - - 0x01D1AF 0E:D19F: F0 B7
	LDA padHeld                     ;C - - - - - 0x01D1B1 0E:D1A1: A5 16
	AND #$03                        ;C - - - - - 0x01D1B3 0E:D1A3: 29 03
	BEQ loc_0E_D158                 ;C - - - - - 0x01D1B5 0E:D1A5: F0 B1
	STA ptr_00                      ;C - - - - - 0x01D1B7 0E:D1A7: 85 00
	LDA padPressed                  ;C - - - - - 0x01D1B9 0E:D1A9: A5 14
	CMP #$40                        ;C - - - - - 0x01D1BB 0E:D1AB: C9 40
	BEQ loc_0E_D1C7                 ;C - - - - - 0x01D1BD 0E:D1AD: F0 18
	LDY playerId                    ;C - - - - - 0x01D1BF 0E:D1AF: A4 34
	LDA objAnim                     ;C - - - - - 0x01D1C1 0E:D1B1: AD 80 05
	CMP PlayerRow_E27F,Y            ;C - - - - - 0x01D1C4 0E:D1B4: D9 7F E2
	BEQ loc_0E_D1C7                 ;C - - - - - 0x01D1C7 0E:D1B7: F0 0E
	LDY playerId                    ;C - - - - - 0x01D1C9 0E:D1B9: A4 34
	LDA PlayerRow_E1EC,Y            ;C - - - - - 0x01D1CB 0E:D1BB: B9 EC E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D1CE 0E:D1BE: 20 94 F2
	LDA PlayerRow_E22E,Y            ;C - - - - - 0x01D1D1 0E:D1C1: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x01D1D4 0E:D1C4: 20 40 F4
loc_0E_D1C7:
	INC actionStep                  ;C - - - - - 0x01D1D7 0E:D1C7: E6 35
	LDA ptr_00                      ;C - - - - - 0x01D1D9 0E:D1C9: A5 00
	STA ram_0032                    ;C - - - - - 0x01D1DB 0E:D1CB: 85 32
	AND #$01                        ;C - - - - - 0x01D1DD 0E:D1CD: 29 01
	BEQ loc_0E_D21C                 ;C - - - - - 0x01D1DF 0E:D1CF: F0 4B
	LDA ram_00BB                    ;C - - - - - 0x01D1E1 0E:D1D1: A5 BB
	BPL loc_0E_D1F6                 ;C - - - - - 0x01D1E3 0E:D1D3: 10 21
	LDA ram_0050                    ;C - - - - - 0x01D1E5 0E:D1D5: A5 50
	BMI loc_0E_D1F6                 ;C - - - - - 0x01D1E7 0E:D1D7: 30 1D
	LDA objX                        ;C - - - - - 0x01D1E9 0E:D1D9: AD 60 03
	SEC                             ;C - - - - - 0x01D1EC 0E:D1DC: 38
	SBC scrollX                     ;C - - - - - 0x01D1ED 0E:D1DD: E5 FC
	CMP #$F1                        ;C - - - - - 0x01D1EF 0E:D1DF: C9 F1
	BCC loc_0E_D1F6                 ;C - - - - - 0x01D1F1 0E:D1E1: 90 13
	LDA scrollX                     ;c - - - - - 0x01D1F3 0E:D1E3: A5 FC
	CLC                             ;c - - - - - 0x01D1F5 0E:D1E5: 18
	ADC #$F0                        ;c - - - - - 0x01D1F6 0E:D1E6: 69 F0
	STA objX                        ;c - - - - - 0x01D1F8 0E:D1E8: 8D 60 03
	LDA worldXPage                  ;c - - - - - 0x01D1FB 0E:D1EB: A5 2D
	ADC #$00                        ;c - - - - - 0x01D1FD 0E:D1ED: 69 00
	STA objXPage                    ;c - - - - - 0x01D1FF 0E:D1EF: 8D 80 03
	RTS                             ;c - - - - - 0x01D202 0E:D1F2: 60
loc_0E_D1F3:
	JMP loc_0E_D242                 ;C - - - - - 0x01D203 0E:D1F3: 4C 42 D2
loc_0E_D1F6:
	JSR SetObjFlag40                ;C - - - - - 0x01D206 0E:D1F6: 20 90 F0
	JSR ApplyVelXAdd                ;C - - - - - 0x01D209 0E:D1F9: 20 83 F1
	LDA playerFacing                ;C - - - - - 0x01D20C 0E:D1FC: A5 31
	CMP ram_0032                    ;C - - - - - 0x01D20E 0E:D1FE: C5 32
	BEQ loc_0E_D241                 ;C - - - - - 0x01D210 0E:D200: F0 3F
	LDY playerId                    ;C - - - - - 0x01D212 0E:D202: A4 34
	LDA PlayerRow_E21C,Y            ;C - - - - - 0x01D214 0E:D204: B9 1C E2
	JSR SetPlayerAnim               ;C - - - - - 0x01D217 0E:D207: 20 94 F2
	LDA PlayerRow_E1CD,Y            ;C - - - - - 0x01D21A 0E:D20A: B9 CD E1
	STA objVelXLo                   ;C - - - - - 0x01D21D 0E:D20D: 8D 00 04
	LDA PlayerRow_E1D0,Y            ;C - - - - - 0x01D220 0E:D210: B9 D0 E1
	STA objVelXHi                   ;C - - - - - 0x01D223 0E:D213: 8D 10 04
	LDA #$90                        ;C - - - - - 0x01D226 0E:D216: A9 90
	STA objFlags                    ;C - - - - - 0x01D228 0E:D218: 8D 60 05
	RTS                             ;C - - - - - 0x01D22B 0E:D21B: 60
loc_0E_D21C:
	JSR ClearObjFlag40              ;C - - - - - 0x01D22C 0E:D21C: 20 99 F0
	JSR ApplyVelXSub                ;C - - - - - 0x01D22F 0E:D21F: 20 A1 F1
	LDA playerFacing                ;C - - - - - 0x01D232 0E:D222: A5 31
	CMP ram_0032                    ;C - - - - - 0x01D234 0E:D224: C5 32
	BEQ loc_0E_D241                 ;C - - - - - 0x01D236 0E:D226: F0 19
	LDY playerId                    ;C - - - - - 0x01D238 0E:D228: A4 34
	LDA PlayerRow_E21C,Y            ;C - - - - - 0x01D23A 0E:D22A: B9 1C E2
	JSR SetPlayerAnim               ;C - - - - - 0x01D23D 0E:D22D: 20 94 F2
	LDA PlayerRow_E1CD,Y            ;C - - - - - 0x01D240 0E:D230: B9 CD E1
	STA objVelXLo                   ;C - - - - - 0x01D243 0E:D233: 8D 00 04
	LDA PlayerRow_E1D0,Y            ;C - - - - - 0x01D246 0E:D236: B9 D0 E1
	STA objVelXHi                   ;C - - - - - 0x01D249 0E:D239: 8D 10 04
	LDA #$D0                        ;C - - - - - 0x01D24C 0E:D23C: A9 D0
	STA objFlags                    ;C - - - - - 0x01D24E 0E:D23E: 8D 60 05
loc_0E_D241:
	RTS                             ;C - - - - - 0x01D251 0E:D241: 60
loc_0E_D242:
	LDY playerId                    ;C - - - - - 0x01D252 0E:D242: A4 34
	LDA objAnim                     ;C - - - - - 0x01D254 0E:D244: AD 80 05
	CMP PlayerRow_E27F,Y            ;C - - - - - 0x01D257 0E:D247: D9 7F E2
	BEQ loc_0E_D264                 ;C - - - - - 0x01D25A 0E:D24A: F0 18
	CMP PlayerRow_E282,Y            ;C - - - - - 0x01D25C 0E:D24C: D9 82 E2
	BNE loc_0E_D264                 ;C - - - - - 0x01D25F 0E:D24F: D0 13
	LDA objAnimFlags                ;c - - - - - 0x01D261 0E:D251: AD 90 05
	CMP #$04                        ;c - - - - - 0x01D264 0E:D254: C9 04
	BNE loc_0E_D264                 ;c - - - - - 0x01D266 0E:D256: D0 0C
	LDA PlayerRow_E1EC,Y            ;c - - - - - 0x01D268 0E:D258: B9 EC E1
	JSR SetPlayerAnim               ;c - - - - - 0x01D26B 0E:D25B: 20 94 F2
	LDA PlayerRow_E22E,Y            ;c - - - - - 0x01D26E 0E:D25E: B9 2E E2
	JSR SetChrBank2                 ;c - - - - - 0x01D271 0E:D261: 20 40 F4
loc_0E_D264:
	LDY playerId                    ;C - - - - - 0x01D274 0E:D264: A4 34
	LDA objAnim                     ;C - - - - - 0x01D276 0E:D266: AD 80 05
	CMP PlayerRow_E276,Y            ;C - - - - - 0x01D279 0E:D269: D9 76 E2
	BNE loc_0E_D289                 ;C - - - - - 0x01D27C 0E:D26C: D0 1B
	LDA playerId                    ;C - - - - - 0x01D27E 0E:D26E: A5 34
	CMP #$01                        ;C - - - - - 0x01D280 0E:D270: C9 01
	BEQ loc_0E_D27B                 ;C - - - - - 0x01D282 0E:D272: F0 07
	LDA objAnimFlags                ;C - - - - - 0x01D284 0E:D274: AD 90 05
	CMP #$04                        ;C - - - - - 0x01D287 0E:D277: C9 04
	BNE loc_0E_D289                 ;C - - - - - 0x01D289 0E:D279: D0 0E
loc_0E_D27B:
	LDY playerId                    ;C - - - - - 0x01D28B 0E:D27B: A4 34
	LDA PlayerRow_E1FE,Y            ;C - - - - - 0x01D28D 0E:D27D: B9 FE E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D290 0E:D280: 20 94 F2
	LDA PlayerRow_E243,Y            ;C - - - - - 0x01D293 0E:D283: B9 43 E2
	JSR SetChrBank2                 ;C - - - - - 0x01D296 0E:D286: 20 40 F4
loc_0E_D289:
	LDA ram_0032                    ;C - - - - - 0x01D299 0E:D289: A5 32
	AND #$01                        ;C - - - - - 0x01D29B 0E:D28B: 29 01
	BEQ loc_0E_D2B4                 ;C - - - - - 0x01D29D 0E:D28D: F0 25
	LDA ram_00BB                    ;C - - - - - 0x01D29F 0E:D28F: A5 BB
	BPL loc_0E_D2B1                 ;C - - - - - 0x01D2A1 0E:D291: 10 1E
	LDA ram_0050                    ;C - - - - - 0x01D2A3 0E:D293: A5 50
	BMI loc_0E_D2B1                 ;C - - - - - 0x01D2A5 0E:D295: 30 1A
	LDA objX                        ;C - - - - - 0x01D2A7 0E:D297: AD 60 03
	SEC                             ;C - - - - - 0x01D2AA 0E:D29A: 38
	SBC scrollX                     ;C - - - - - 0x01D2AB 0E:D29B: E5 FC
	CMP #$F1                        ;C - - - - - 0x01D2AD 0E:D29D: C9 F1
	BCC loc_0E_D2B1                 ;C - - - - - 0x01D2AF 0E:D29F: 90 10
	LDA scrollX                     ;c - - - - - 0x01D2B1 0E:D2A1: A5 FC
	CLC                             ;c - - - - - 0x01D2B3 0E:D2A3: 18
	ADC #$F0                        ;c - - - - - 0x01D2B4 0E:D2A4: 69 F0
	STA objX                        ;c - - - - - 0x01D2B6 0E:D2A6: 8D 60 03
	LDA worldXPage                  ;c - - - - - 0x01D2B9 0E:D2A9: A5 2D
	ADC #$00                        ;c - - - - - 0x01D2BB 0E:D2AB: 69 00
	STA objXPage                    ;c - - - - - 0x01D2BD 0E:D2AD: 8D 80 03
	RTS                             ;c - - - - - 0x01D2C0 0E:D2B0: 60
loc_0E_D2B1:
	JMP ApplyVelXAdd                ;C - - - - - 0x01D2C1 0E:D2B1: 4C 83 F1
loc_0E_D2B4:
	JMP ApplyVelXSub                ;C - - - - - 0x01D2C4 0E:D2B4: 4C A1 F1
; counts ram_0037 down, then back to gameAction 0
Act02_ActionEnd:
	LDA actionTimer                 ;C - - J - - 0x01D2C7 0E:D2B7: A5 37
	BMI loc_0E_D2BE                 ;C - - - - - 0x01D2C9 0E:D2B9: 30 03
	DEC actionTimer                 ;C - - - - - 0x01D2CB 0E:D2BB: C6 37
	RTS                             ;C - - - - - 0x01D2CD 0E:D2BD: 60
loc_0E_D2BE:
	LDA playerId                    ;C - - - - - 0x01D2CE 0E:D2BE: A5 34
	CMP #$02                        ;C - - - - - 0x01D2D0 0E:D2C0: C9 02
	BEQ loc_0E_D2C8                 ;C - - - - - 0x01D2D2 0E:D2C2: F0 04
	LDA ram_00B3                    ;C - - - - - 0x01D2D4 0E:D2C4: A5 B3
	BNE loc_0E_D2EA                 ;C - - - - - 0x01D2D6 0E:D2C6: D0 22
loc_0E_D2C8:
	LDA #$00                        ;C - - - - - 0x01D2D8 0E:D2C8: A9 00
	STA gameAction                  ;C - - - - - 0x01D2DA 0E:D2CA: 85 30
	STA actionStep                  ;C - - - - - 0x01D2DC 0E:D2CC: 85 35
	STA timerA3                     ;C - - - - - 0x01D2DE 0E:D2CE: 85 A3
	STA timerA4                     ;C - - - - - 0x01D2E0 0E:D2D0: 85 A4
	STA playerInvincible            ;C - - - - - 0x01D2E2 0E:D2D2: 85 3B
	STA ram_00BA                    ;C - - - - - 0x01D2E4 0E:D2D4: 85 BA
	STA objStep                     ;C - - - - - 0x01D2E6 0E:D2D6: 8D 00 05
	STA objParamA                   ;C - - - - - 0x01D2E9 0E:D2D9: 8D 10 05
	STA objParamB                   ;C - - - - - 0x01D2EC 0E:D2DC: 8D 20 05
	JSR ResetPlayerStand            ;C - - - - - 0x01D2EF 0E:D2DF: 20 AA CE
	LDY playerId                    ;C - - - - - 0x01D2F2 0E:D2E2: A4 34
	LDA PlayerRow_E288,Y            ;C - - - - - 0x01D2F4 0E:D2E4: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x01D2F7 0E:D2E7: 85 6F
	RTS                             ;C - - - - - 0x01D2F9 0E:D2E9: 60
loc_0E_D2EA:
	DEC ram_00B3                    ;C - - - - - 0x01D2FA 0E:D2EA: C6 B3
	LDA objY                        ;C - - - - - 0x01D2FC 0E:D2EC: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D2FF 0E:D2EF: 85 36
	LDA padPressed                  ;C - - - - - 0x01D301 0E:D2F1: A5 14
	CMP #$40                        ;C - - - - - 0x01D303 0E:D2F3: C9 40
	BEQ loc_0E_D2F8                 ;C - - - - - 0x01D305 0E:D2F5: F0 01
	RTS                             ;C - - - - - 0x01D307 0E:D2F7: 60
loc_0E_D2F8:
	LDY playerId                    ;C - - - - - 0x01D308 0E:D2F8: A4 34
	LDA PlayerRow_E24C,Y            ;C - - - - - 0x01D30A 0E:D2FA: B9 4C E2
	STA gameAction                  ;C - - - - - 0x01D30D 0E:D2FD: 85 30
	LDA Act02_ActionEndTbl_FCC5,Y   ;C - - - - - 0x01D30F 0E:D2FF: B9 C5 FC
	STA playerBusy                  ;C - - - - - 0x01D312 0E:D302: 85 6E
	LDA #$80                        ;C - - - - - 0x01D314 0E:D304: A9 80
	STA objActive                   ;C - - - - - 0x01D316 0E:D306: 8D 00 03
	LDA objY                        ;C - - - - - 0x01D319 0E:D309: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D31C 0E:D30C: 85 36
	RTS                             ;C - - - - - 0x01D31E 0E:D30E: 60
Act03_Punch:
	LDA padHeld                     ;C - - J - - 0x01D31F 0E:D30F: A5 16
	CMP #$C0                        ;C - - - - - 0x01D321 0E:D311: C9 C0
	BNE loc_0E_D331                 ;C - - - - - 0x01D323 0E:D313: D0 1C
	LDA playerHealth                ;C - - - - - 0x01D325 0E:D315: A5 3A
	BEQ loc_0E_D331                 ;C - - - - - 0x01D327 0E:D317: F0 18
	LDA ram_00B2                    ;C - - - - - 0x01D329 0E:D319: A5 B2
	BMI loc_0E_D331                 ;C - - - - - 0x01D32B 0E:D31B: 30 14
	LDY playerId                    ;C - - - - - 0x01D32D 0E:D31D: A4 34
	BEQ loc_0E_D32E                 ;C - - - - - 0x01D32F 0E:D31F: F0 0D
	LDA objAnim                     ;C - - - - - 0x01D331 0E:D321: AD 80 05
	CMP PlayerRow_E29D,Y            ;C - - - - - 0x01D334 0E:D324: D9 9D E2
	BEQ loc_0E_D331                 ;C - - - - - 0x01D337 0E:D327: F0 08
	CMP PlayerRow_E2A0,Y            ;C - - - - - 0x01D339 0E:D329: D9 A0 E2
	BEQ loc_0E_D331                 ;C - - - - - 0x01D33C 0E:D32C: F0 03
loc_0E_D32E:
	JMP loc_0E_CA3C                 ;C - - - - - 0x01D33E 0E:D32E: 4C 3C CA
loc_0E_D331:
	LDA playerId                    ;C - - - - - 0x01D341 0E:D331: A5 34
	CMP #$02                        ;C - - - - - 0x01D343 0E:D333: C9 02
	BEQ loc_0E_D340                 ;C - - - - - 0x01D345 0E:D335: F0 09
	LDA playerLevel                 ;C - - - - - 0x01D347 0E:D337: A5 6B
	CMP #$03                        ;C - - - - - 0x01D349 0E:D339: C9 03
	BCC loc_0E_D373                 ;C - - - - - 0x01D34B 0E:D33B: 90 36
	JMP loc_0E_D346                 ;C - - - - - 0x01D34D 0E:D33D: 4C 46 D3
loc_0E_D340:
	LDA playerLevel                 ;C - - - - - 0x01D350 0E:D340: A5 6B
	CMP #$01                        ;C - - - - - 0x01D352 0E:D342: C9 01
	BCC loc_0E_D373                 ;C - - - - - 0x01D354 0E:D344: 90 2D
loc_0E_D346:
	LDA padPressed                  ;C - - - - - 0x01D356 0E:D346: A5 14
	AND #$0F                        ;C - - - - - 0x01D358 0E:D348: 29 0F
	CMP playerFacing                ;C - - - - - 0x01D35A 0E:D34A: C5 31
	BNE loc_0E_D373                 ;C - - - - - 0x01D35C 0E:D34C: D0 25
	LDA padHeld                     ;C - - - - - 0x01D35E 0E:D34E: A5 16
	AND #$F0                        ;C - - - - - 0x01D360 0E:D350: 29 F0
	CMP #$40                        ;C - - - - - 0x01D362 0E:D352: C9 40
	BNE loc_0E_D373                 ;C - - - - - 0x01D364 0E:D354: D0 1D
	LDY playerId                    ;C - - - - - 0x01D366 0E:D356: A4 34
	LDA objAnim                     ;C - - - - - 0x01D368 0E:D358: AD 80 05
	CMP PlayerRow_E29D,Y            ;C - - - - - 0x01D36B 0E:D35B: D9 9D E2
	BEQ loc_0E_D373                 ;C - - - - - 0x01D36E 0E:D35E: F0 13
	CMP PlayerRow_E2A0,Y            ;C - - - - - 0x01D370 0E:D360: D9 A0 E2
	BEQ loc_0E_D373                 ;C - - - - - 0x01D373 0E:D363: F0 0E
	LDA Act03_PunchTbl_FCCE,Y       ;C - - - - - 0x01D375 0E:D365: B9 CE FC
	STA gameAction                  ;C - - - - - 0x01D378 0E:D368: 85 30
	LDA #$80                        ;C - - - - - 0x01D37A 0E:D36A: A9 80
	STA objActive                   ;C - - - - - 0x01D37C 0E:D36C: 8D 00 03
	JSR ClearTimerA4                ;C - - - - - 0x01D37F 0E:D36F: 20 36 F4
	RTS                             ;C - - - - - 0x01D382 0E:D372: 60
loc_0E_D373:
	LDY playerId                    ;C - - - - - 0x01D383 0E:D373: A4 34
	LDA objAnim                     ;C - - - - - 0x01D385 0E:D375: AD 80 05
	CMP PlayerRow_E288,Y            ;C - - - - - 0x01D388 0E:D378: D9 88 E2
	BEQ loc_0E_D38A                 ;C - - - - - 0x01D38B 0E:D37B: F0 0D
	CMP PlayerRow_E28B,Y            ;C - - - - - 0x01D38D 0E:D37D: D9 8B E2
	BEQ loc_0E_D38A                 ;C - - - - - 0x01D390 0E:D380: F0 08
	CMP PlayerRow_E28E,Y            ;C - - - - - 0x01D392 0E:D382: D9 8E E2
	BEQ loc_0E_D38A                 ;C - - - - - 0x01D395 0E:D385: F0 03
	JMP loc_0E_D39E                 ;C - - - - - 0x01D397 0E:D387: 4C 9E D3
loc_0E_D38A:
	LDA padHeld                     ;C - - - - - 0x01D39A 0E:D38A: A5 16
	AND #$03                        ;C - - - - - 0x01D39C 0E:D38C: 29 03
	BEQ loc_0E_D39E                 ;C - - - - - 0x01D39E 0E:D38E: F0 0E
	STA playerFacing                ;C - - - - - 0x01D3A0 0E:D390: 85 31
	AND #$01                        ;C - - - - - 0x01D3A2 0E:D392: 29 01
	BEQ loc_0E_D39B                 ;C - - - - - 0x01D3A4 0E:D394: F0 05
	JSR SetPlayerFlag40             ;C - - - - - 0x01D3A6 0E:D396: 20 3F F0
	BNE loc_0E_D39E                 ;C - - - - - 0x01D3A9 0E:D399: D0 03
loc_0E_D39B:
	JSR ClearPlayerFlag40           ;C - - - - - 0x01D3AB 0E:D39B: 20 48 F0
loc_0E_D39E:
	LDY playerId                    ;C - - - - - 0x01D3AE 0E:D39E: A4 34
	LDA Act03_PunchTbl_D3AD,Y       ;C - - - - - 0x01D3B0 0E:D3A0: B9 AD D3
	STA ptr_00                      ;C - - - - - 0x01D3B3 0E:D3A3: 85 00
	LDA Act03_PunchTbl_D3B0,Y       ;C - - - - - 0x01D3B5 0E:D3A5: B9 B0 D3
	STA ptr_00+1                    ;C - - - - - 0x01D3B8 0E:D3A8: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x01D3BA 0E:D3AA: 6C 00 00
Act03_PunchTbl_D3AD:
	.lobytes Act03_PunchTbl_D3AD_00, Act03_PunchTbl_D3AD_01, Act03_PunchTbl_D3AD_02;- D 2 - - - 0x01D3BD 0E:D3AD:
Act03_PunchTbl_D3B0:
	.hibytes Act03_PunchTbl_D3AD_00, Act03_PunchTbl_D3AD_01, Act03_PunchTbl_D3AD_02;- D 2 - - - 0x01D3C0 0E:D3B0:
Act03_PunchTbl_D3AD_00:
	LDA objAnim                     ;C - - J - - 0x01D3C3 0E:D3B3: AD 80 05
	CMP #$0D                        ;C - - - - - 0x01D3C6 0E:D3B6: C9 0D
	BEQ loc_0E_D3F1                 ;C - - - - - 0x01D3C8 0E:D3B8: F0 37
	CMP #$16                        ;C - - - - - 0x01D3CA 0E:D3BA: C9 16
	BEQ loc_0E_D3F1                 ;C - - - - - 0x01D3CC 0E:D3BC: F0 33
	CMP #$10                        ;C - - - - - 0x01D3CE 0E:D3BE: C9 10
	BEQ loc_0E_D40E                 ;C - - - - - 0x01D3D0 0E:D3C0: F0 4C
	CMP #$13                        ;C - - - - - 0x01D3D2 0E:D3C2: C9 13
	BNE loc_0E_D3C9                 ;C - - - - - 0x01D3D4 0E:D3C4: D0 03
	JMP loc_0E_D438                 ;C - - - - - 0x01D3D6 0E:D3C6: 4C 38 D4
loc_0E_D3C9:
	LDA objAnimFrame                ;C - - - - - 0x01D3D9 0E:D3C9: AD 70 05
	CMP #$01                        ;C - - - - - 0x01D3DC 0E:D3CC: C9 01
	BNE loc_0E_D3D7                 ;C - - - - - 0x01D3DE 0E:D3CE: D0 07
	JSR ArmTimerA4                  ;C - - - - - 0x01D3E0 0E:D3D0: 20 3B F4
	LDA #$08                        ;C - - - - - 0x01D3E3 0E:D3D3: A9 08
	STA attackType                  ;C - - - - - 0x01D3E5 0E:D3D5: 85 A7
loc_0E_D3D7:
	LDA objAnimFrame                ;C - - - - - 0x01D3E7 0E:D3D7: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D3EA 0E:D3DA: C9 02
	BNE loc_0E_D3F0                 ;C - - - - - 0x01D3EC 0E:D3DC: D0 12
	LDA objAnimFlags                ;C - - - - - 0x01D3EE 0E:D3DE: AD 90 05
	CMP #$04                        ;C - - - - - 0x01D3F1 0E:D3E1: C9 04
	BNE loc_0E_D3F0                 ;C - - - - - 0x01D3F3 0E:D3E3: D0 0B
	JSR ClearTimerA4                ;C - - - - - 0x01D3F5 0E:D3E5: 20 36 F4
	LDA #$1E                        ;C - - - - - 0x01D3F8 0E:D3E8: A9 1E
	JSR QueueSound                  ;C - - - - - 0x01D3FA 0E:D3EA: 20 4C F3
	JMP loc_0E_D477                 ;C - - - - - 0x01D3FD 0E:D3ED: 4C 77 D4
loc_0E_D3F0:
	RTS                             ;C - - - - - 0x01D400 0E:D3F0: 60
loc_0E_D3F1:
	LDA objAnimFrame                ;C - - - - - 0x01D401 0E:D3F1: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D404 0E:D3F4: C9 02
	BNE loc_0E_D400                 ;C - - - - - 0x01D406 0E:D3F6: D0 08
	LDA objAnimFlags                ;C - - - - - 0x01D408 0E:D3F8: AD 90 05
	BNE loc_0E_D400                 ;C - - - - - 0x01D40B 0E:D3FB: D0 03
	JSR StartHitTimer               ;C - - - - - 0x01D40D 0E:D3FD: 20 28 F4
loc_0E_D400:
	LDA objAnimFrame                ;C - - - - - 0x01D410 0E:D400: AD 70 05
	CMP #$03                        ;C - - - - - 0x01D413 0E:D403: C9 03
	BNE loc_0E_D40D                 ;C - - - - - 0x01D415 0E:D405: D0 06
	JSR ClearTimerA4                ;C - - - - - 0x01D417 0E:D407: 20 36 F4
	JMP loc_0E_D45E                 ;C - - - - - 0x01D41A 0E:D40A: 4C 5E D4
loc_0E_D40D:
	RTS                             ;C - - - - - 0x01D41D 0E:D40D: 60
loc_0E_D40E:
	LDA objAnimFrame                ;C - - - - - 0x01D41E 0E:D40E: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D421 0E:D411: C9 02
	BNE loc_0E_D424                 ;C - - - - - 0x01D423 0E:D413: D0 0F
	LDA objAnimFlags                ;C - - - - - 0x01D425 0E:D415: AD 90 05
	BNE loc_0E_D424                 ;C - - - - - 0x01D428 0E:D418: D0 0A
	JSR ArmTimerA4                  ;C - - - - - 0x01D42A 0E:D41A: 20 3B F4
	LDA #$06                        ;C - - - - - 0x01D42D 0E:D41D: A9 06
	STA attackType                  ;C - - - - - 0x01D42F 0E:D41F: 85 A7
	JSR PlayHitSound                ;C - - - - - 0x01D431 0E:D421: 20 30 F4
loc_0E_D424:
	LDA objAnimFrame                ;C - - - - - 0x01D434 0E:D424: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D437 0E:D427: C9 04
	BNE loc_0E_D42E                 ;C - - - - - 0x01D439 0E:D429: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D43B 0E:D42B: 20 36 F4
loc_0E_D42E:
	LDA objAnimFrame                ;C - - - - - 0x01D43E 0E:D42E: AD 70 05
	CMP #$05                        ;C - - - - - 0x01D441 0E:D431: C9 05
	BNE loc_0E_D40D                 ;C - - - - - 0x01D443 0E:D433: D0 D8
	JMP loc_0E_D45E                 ;C - - - - - 0x01D445 0E:D435: 4C 5E D4
loc_0E_D438:
	JSR PlayHitSound                ;C - - - - - 0x01D448 0E:D438: 20 30 F4
	LDA #$14                        ;C - - - - - 0x01D44B 0E:D43B: A9 14
	STA gameAction                  ;C - - - - - 0x01D44D 0E:D43D: 85 30
	LDA #$00                        ;C - - - - - 0x01D44F 0E:D43F: A9 00
	STA actionTimer                 ;C - - - - - 0x01D451 0E:D441: 85 37
	LDA #$80                        ;C - - - - - 0x01D453 0E:D443: A9 80
	STA objActive                   ;C - - - - - 0x01D455 0E:D445: 8D 00 03
	STA playerBusy                  ;C - - - - - 0x01D458 0E:D448: 85 6E
	LDA objY                        ;C - - - - - 0x01D45A 0E:D44A: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D45D 0E:D44D: 85 36
	RTS                             ;C - - - - - 0x01D45F 0E:D44F: 60
	.byte $A9,$00,$85,$A4,$85,$30,$85,$A3,$F0,$04;- - - - - - 0x01D460 0E:D450:
Act0A:
	JSR ResetPlayerStand            ;C - - J - - 0x01D46A 0E:D45A: 20 AA CE
	RTS                             ;C - - - - - 0x01D46D 0E:D45D: 60
loc_0E_D45E:
	LDA objAnim                     ;C - - - - - 0x01D46E 0E:D45E: AD 80 05
	CMP #$0D                        ;C - - - - - 0x01D471 0E:D461: C9 0D
	BEQ loc_0E_D46B                 ;C - - - - - 0x01D473 0E:D463: F0 06
	CMP #$16                        ;C - - - - - 0x01D475 0E:D465: C9 16
	BEQ loc_0E_D46F                 ;C - - - - - 0x01D477 0E:D467: F0 06
	BNE loc_0E_D473                 ;C - - - - - 0x01D479 0E:D469: D0 08
loc_0E_D46B:
	LDA #$16                        ;C - - - - - 0x01D47B 0E:D46B: A9 16
	BNE loc_0E_D475                 ;C - - - - - 0x01D47D 0E:D46D: D0 06
loc_0E_D46F:
	LDA #$10                        ;C - - - - - 0x01D47F 0E:D46F: A9 10
	BNE loc_0E_D475                 ;C - - - - - 0x01D481 0E:D471: D0 02
loc_0E_D473:
	LDA #$13                        ;C - - - - - 0x01D483 0E:D473: A9 13
loc_0E_D475:
	STA playerStandAnim             ;C - - - - - 0x01D485 0E:D475: 85 6F
loc_0E_D477:
	JSR StartAction0C               ;C - - - - - 0x01D487 0E:D477: 20 9A D7
	JMP Act0C                       ;C - - - - - 0x01D48A 0E:D47A: 4C 6A DD
Act03_PunchTbl_D3AD_01:
	LDA objAnim                     ;C - - J - - 0x01D48D 0E:D47D: AD 80 05
	CMP #$0E                        ;C - - - - - 0x01D490 0E:D480: C9 0E
	BEQ loc_0E_D4A9                 ;C - - - - - 0x01D492 0E:D482: F0 25
	CMP #$55                        ;C - - - - - 0x01D494 0E:D484: C9 55
	BEQ loc_0E_D4AC                 ;C - - - - - 0x01D496 0E:D486: F0 24
	CMP #$56                        ;C - - - - - 0x01D498 0E:D488: C9 56
	BEQ loc_0E_D4AF                 ;C - - - - - 0x01D49A 0E:D48A: F0 23
	CMP #$17                        ;C - - - - - 0x01D49C 0E:D48C: C9 17
	BEQ loc_0E_D4B2                 ;C - - - - - 0x01D49E 0E:D48E: F0 22
	CMP #$02                        ;C - - - - - 0x01D4A0 0E:D490: C9 02
	BEQ loc_0E_D4B5                 ;C - - - - - 0x01D4A2 0E:D492: F0 21
	CMP #$59                        ;C - - - - - 0x01D4A4 0E:D494: C9 59
	BEQ loc_0E_D4B8                 ;C - - - - - 0x01D4A6 0E:D496: F0 20
	CMP #$11                        ;C - - - - - 0x01D4A8 0E:D498: C9 11
	BEQ loc_0E_D4BB                 ;C - - - - - 0x01D4AA 0E:D49A: F0 1F
	CMP #$14                        ;C - - - - - 0x01D4AC 0E:D49C: C9 14
	BEQ loc_0E_D4BE                 ;C - - - - - 0x01D4AE 0E:D49E: F0 1E
	CMP #$5B                        ;C - - - - - 0x01D4B0 0E:D4A0: C9 5B
	BEQ loc_0E_D4C1                 ;C - - - - - 0x01D4B2 0E:D4A2: F0 1D
	CMP #$35                        ;c - - - - - 0x01D4B4 0E:D4A4: C9 35
	BEQ loc_0E_D4C4                 ;c - - - - - 0x01D4B6 0E:D4A6: F0 1C
	RTS                             ;c - - - - - 0x01D4B8 0E:D4A8: 60
loc_0E_D4A9:
	JMP loc_0E_D4CF                 ;C - - - - - 0x01D4B9 0E:D4A9: 4C CF D4
loc_0E_D4AC:
	JMP loc_0E_D4E6                 ;C - - - - - 0x01D4BC 0E:D4AC: 4C E6 D4
loc_0E_D4AF:
	JMP loc_0E_D4F2                 ;C - - - - - 0x01D4BF 0E:D4AF: 4C F2 D4
loc_0E_D4B2:
	JMP loc_0E_D50F                 ;C - - - - - 0x01D4C2 0E:D4B2: 4C 0F D5
loc_0E_D4B5:
	JMP loc_0E_D55E                 ;C - - - - - 0x01D4C5 0E:D4B5: 4C 5E D5
loc_0E_D4B8:
	JMP loc_0E_D570                 ;C - - - - - 0x01D4C8 0E:D4B8: 4C 70 D5
loc_0E_D4BB:
	JMP loc_0E_D58D                 ;C - - - - - 0x01D4CB 0E:D4BB: 4C 8D D5
loc_0E_D4BE:
	JMP loc_0E_D5B7                 ;C - - - - - 0x01D4CE 0E:D4BE: 4C B7 D5
loc_0E_D4C1:
	JMP loc_0E_D5F3                 ;C - - - - - 0x01D4D1 0E:D4C1: 4C F3 D5
loc_0E_D4C4:
	LDY grabbedSlot                 ;c - - - - - 0x01D4D4 0E:D4C4: A4 39
	LDA objY                        ;c - - - - - 0x01D4D6 0E:D4C6: AD C0 03
	STA objY,Y                      ;c - - - - - 0x01D4D9 0E:D4C9: 99 C0 03
	JMP loc_0E_D88C                 ;c - - - - - 0x01D4DC 0E:D4CC: 4C 8C D8
loc_0E_D4CF:
	LDA objAnimFrame                ;C - - - - - 0x01D4DF 0E:D4CF: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D4E2 0E:D4D2: C9 04
	BNE loc_0E_D52B                 ;C - - - - - 0x01D4E4 0E:D4D4: D0 55
	LDA objAnimFlags                ;C - - - - - 0x01D4E6 0E:D4D6: AD 90 05
	CMP #$02                        ;C - - - - - 0x01D4E9 0E:D4D9: C9 02
	BNE loc_0E_D52B                 ;C - - - - - 0x01D4EB 0E:D4DB: D0 4E
	LDA #$55                        ;C - - - - - 0x01D4ED 0E:D4DD: A9 55
	JSR SetPlayerAnim               ;C - - - - - 0x01D4EF 0E:D4DF: 20 94 F2
	JMP loc_0E_D522                 ;C - - - - - 0x01D4F2 0E:D4E2: 4C 22 D5
loc_0E_D4E5:
	RTS                             ;C - - - - - 0x01D4F5 0E:D4E5: 60
loc_0E_D4E6:
	LDA objAnimFlags                ;C - - - - - 0x01D4F6 0E:D4E6: AD 90 05
	CMP #$04                        ;C - - - - - 0x01D4F9 0E:D4E9: C9 04
	BNE loc_0E_D4E5                 ;C - - - - - 0x01D4FB 0E:D4EB: D0 F8
	LDA #$56                        ;C - - - - - 0x01D4FD 0E:D4ED: A9 56
	JMP loc_0E_D567                 ;C - - - - - 0x01D4FF 0E:D4EF: 4C 67 D5
loc_0E_D4F2:
	LDA objAnimFrame                ;C - - - - - 0x01D502 0E:D4F2: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D505 0E:D4F5: C9 02
	BNE loc_0E_D4FF                 ;C - - - - - 0x01D507 0E:D4F7: D0 06
	JSR ClearTimerA4                ;C - - - - - 0x01D509 0E:D4F9: 20 36 F4
	JMP loc_0E_D61F                 ;C - - - - - 0x01D50C 0E:D4FC: 4C 1F D6
loc_0E_D4FF:
	LDA objAnimFrame                ;C - - - - - 0x01D50F 0E:D4FF: AD 70 05
	CMP #$01                        ;C - - - - - 0x01D512 0E:D502: C9 01
	BNE loc_0E_D4E5                 ;C - - - - - 0x01D514 0E:D504: D0 DF
	LDA objAnimFlags                ;C - - - - - 0x01D516 0E:D506: AD 90 05
	BNE loc_0E_D4E5                 ;C - - - - - 0x01D519 0E:D509: D0 DA
	JSR StartHitTimer               ;C - - - - - 0x01D51B 0E:D50B: 20 28 F4
	RTS                             ;C - - - - - 0x01D51E 0E:D50E: 60
loc_0E_D50F:
	LDA objAnimFrame                ;C - - - - - 0x01D51F 0E:D50F: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D522 0E:D512: C9 04
	BNE loc_0E_D52B                 ;C - - - - - 0x01D524 0E:D514: D0 15
	LDA objAnimFlags                ;C - - - - - 0x01D526 0E:D516: AD 90 05
	CMP #$02                        ;C - - - - - 0x01D529 0E:D519: C9 02
	BNE loc_0E_D52B                 ;C - - - - - 0x01D52B 0E:D51B: D0 0E
	LDA #$02                        ;C - - - - - 0x01D52D 0E:D51D: A9 02
	JSR SetPlayerAnim               ;C - - - - - 0x01D52F 0E:D51F: 20 94 F2
loc_0E_D522:
	LDA #$04                        ;C - - - - - 0x01D532 0E:D522: A9 04
	JSR SetChrBank2                 ;C - - - - - 0x01D534 0E:D524: 20 40 F4
	JSR ClearTimerA4                ;C - - - - - 0x01D537 0E:D527: 20 36 F4
	RTS                             ;C - - - - - 0x01D53A 0E:D52A: 60
loc_0E_D52B:
	LDA objAnimFrame                ;C - - - - - 0x01D53B 0E:D52B: AD 70 05
	CMP #$01                        ;C - - - - - 0x01D53E 0E:D52E: C9 01
	BNE loc_0E_D53A                 ;C - - - - - 0x01D540 0E:D530: D0 08
	LDA objAnimFlags                ;C - - - - - 0x01D542 0E:D532: AD 90 05
	BNE loc_0E_D53A                 ;C - - - - - 0x01D545 0E:D535: D0 03
	JSR StartHitTimer               ;C - - - - - 0x01D547 0E:D537: 20 28 F4
loc_0E_D53A:
	LDA objAnimFrame                ;C - - - - - 0x01D54A 0E:D53A: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D54D 0E:D53D: C9 02
	BNE loc_0E_D544                 ;C - - - - - 0x01D54F 0E:D53F: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D551 0E:D541: 20 36 F4
loc_0E_D544:
	LDA objAnimFrame                ;C - - - - - 0x01D554 0E:D544: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D557 0E:D547: C9 04
	BNE loc_0E_D553                 ;C - - - - - 0x01D559 0E:D549: D0 08
	LDA objAnimFlags                ;C - - - - - 0x01D55B 0E:D54B: AD 90 05
	BNE loc_0E_D553                 ;C - - - - - 0x01D55E 0E:D54E: D0 03
	JSR StartHitTimer               ;C - - - - - 0x01D560 0E:D550: 20 28 F4
loc_0E_D553:
	LDA objAnimFrame                ;C - - - - - 0x01D563 0E:D553: AD 70 05
	CMP #$05                        ;C - - - - - 0x01D566 0E:D556: C9 05
	BNE loc_0E_D55D                 ;C - - - - - 0x01D568 0E:D558: D0 03
	JSR ClearTimerA4                ;c - - - - - 0x01D56A 0E:D55A: 20 36 F4
loc_0E_D55D:
	RTS                             ;C - - - - - 0x01D56D 0E:D55D: 60
loc_0E_D55E:
	LDA objAnimFlags                ;C - - - - - 0x01D56E 0E:D55E: AD 90 05
	CMP #$04                        ;C - - - - - 0x01D571 0E:D561: C9 04
	BNE loc_0E_D55D                 ;C - - - - - 0x01D573 0E:D563: D0 F8
	LDA #$59                        ;C - - - - - 0x01D575 0E:D565: A9 59
loc_0E_D567:
	JSR SetPlayerAnim               ;C - - - - - 0x01D577 0E:D567: 20 94 F2
	LDA #$06                        ;C - - - - - 0x01D57A 0E:D56A: A9 06
	JSR SetChrBank2                 ;C - - - - - 0x01D57C 0E:D56C: 20 40 F4
	RTS                             ;C - - - - - 0x01D57F 0E:D56F: 60
loc_0E_D570:
	LDA objAnimFrame                ;C - - - - - 0x01D580 0E:D570: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D583 0E:D573: C9 02
	BNE loc_0E_D57D                 ;C - - - - - 0x01D585 0E:D575: D0 06
	JSR ClearTimerA4                ;C - - - - - 0x01D587 0E:D577: 20 36 F4
	JMP loc_0E_D61F                 ;C - - - - - 0x01D58A 0E:D57A: 4C 1F D6
loc_0E_D57D:
	LDA objAnimFrame                ;C - - - - - 0x01D58D 0E:D57D: AD 70 05
	CMP #$01                        ;C - - - - - 0x01D590 0E:D580: C9 01
	BNE loc_0E_D55D                 ;C - - - - - 0x01D592 0E:D582: D0 D9
	LDA objAnimFlags                ;C - - - - - 0x01D594 0E:D584: AD 90 05
	BNE loc_0E_D55D                 ;C - - - - - 0x01D597 0E:D587: D0 D4
	JSR StartHitTimer               ;C - - - - - 0x01D599 0E:D589: 20 28 F4
	RTS                             ;C - - - - - 0x01D59C 0E:D58C: 60
loc_0E_D58D:
	LDA objAnimFrame                ;C - - - - - 0x01D59D 0E:D58D: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D5A0 0E:D590: C9 02
	BNE loc_0E_D5A3                 ;C - - - - - 0x01D5A2 0E:D592: D0 0F
	LDA objAnimFlags                ;C - - - - - 0x01D5A4 0E:D594: AD 90 05
	BNE loc_0E_D5A3                 ;C - - - - - 0x01D5A7 0E:D597: D0 0A
	JSR ArmTimerA4                  ;C - - - - - 0x01D5A9 0E:D599: 20 3B F4
	LDA #$06                        ;C - - - - - 0x01D5AC 0E:D59C: A9 06
	STA attackType                  ;C - - - - - 0x01D5AE 0E:D59E: 85 A7
	JSR PlayHitSound                ;C - - - - - 0x01D5B0 0E:D5A0: 20 30 F4
loc_0E_D5A3:
	LDA objAnimFrame                ;C - - - - - 0x01D5B3 0E:D5A3: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D5B6 0E:D5A6: C9 04
	BNE loc_0E_D5AD                 ;C - - - - - 0x01D5B8 0E:D5A8: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D5BA 0E:D5AA: 20 36 F4
loc_0E_D5AD:
	LDA objAnimFrame                ;C - - - - - 0x01D5BD 0E:D5AD: AD 70 05
	CMP #$06                        ;C - - - - - 0x01D5C0 0E:D5B0: C9 06
	BNE loc_0E_D55D                 ;C - - - - - 0x01D5C2 0E:D5B2: D0 A9
	JMP loc_0E_D61F                 ;C - - - - - 0x01D5C4 0E:D5B4: 4C 1F D6
loc_0E_D5B7:
	LDA #$80                        ;C - - - - - 0x01D5C7 0E:D5B7: A9 80
	STA playerBusy                  ;C - - - - - 0x01D5C9 0E:D5B9: 85 6E
	LDA objAnimFrame                ;C - - - - - 0x01D5CB 0E:D5BB: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D5CE 0E:D5BE: C9 04
	BNE loc_0E_D5D1                 ;C - - - - - 0x01D5D0 0E:D5C0: D0 0F
	LDA objAnimFlags                ;C - - - - - 0x01D5D2 0E:D5C2: AD 90 05
	BNE loc_0E_D5D1                 ;C - - - - - 0x01D5D5 0E:D5C5: D0 0A
	JSR ArmTimerA4                  ;C - - - - - 0x01D5D7 0E:D5C7: 20 3B F4
	LDA #$01                        ;C - - - - - 0x01D5DA 0E:D5CA: A9 01
	STA attackType                  ;C - - - - - 0x01D5DC 0E:D5CC: 85 A7
	JSR PlayHitSound                ;C - - - - - 0x01D5DE 0E:D5CE: 20 30 F4
loc_0E_D5D1:
	LDA objAnimFrame                ;C - - - - - 0x01D5E1 0E:D5D1: AD 70 05
	CMP #$06                        ;C - - - - - 0x01D5E4 0E:D5D4: C9 06
	BNE loc_0E_D61E                 ;C - - - - - 0x01D5E6 0E:D5D6: D0 46
	JSR ClearTimerA4                ;C - - - - - 0x01D5E8 0E:D5D8: 20 36 F4
	LDA #$5B                        ;C - - - - - 0x01D5EB 0E:D5DB: A9 5B
	JSR SetPlayerAnim               ;C - - - - - 0x01D5ED 0E:D5DD: 20 94 F2
	LDA #$05                        ;C - - - - - 0x01D5F0 0E:D5E0: A9 05
	JSR SetChrBank2                 ;C - - - - - 0x01D5F2 0E:D5E2: 20 40 F4
	LDA objY                        ;C - - - - - 0x01D5F5 0E:D5E5: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D5F8 0E:D5E8: 85 36
	LDA objY                        ;C - - - - - 0x01D5FA 0E:D5EA: AD C0 03
	SEC                             ;C - - - - - 0x01D5FD 0E:D5ED: 38
	SBC #$20                        ;C - - - - - 0x01D5FE 0E:D5EE: E9 20
	STA objY                        ;C - - - - - 0x01D600 0E:D5F0: 8D C0 03
loc_0E_D5F3:
	LDY #$00                        ;C - - - - - 0x01D603 0E:D5F3: A0 00
	JSR MoveYGravityCheck           ;C - - - - - 0x01D605 0E:D5F5: 20 19 F1
	LDA objVelYHi                   ;C - - - - - 0x01D608 0E:D5F8: AD 30 04
	BPL loc_0E_D61E                 ;C - - - - - 0x01D60B 0E:D5FB: 10 21
	LDA objY                        ;C - - - - - 0x01D60D 0E:D5FD: AD C0 03
	CLC                             ;C - - - - - 0x01D610 0E:D600: 18
	ADC #$02                        ;C - - - - - 0x01D611 0E:D601: 69 02
	CMP playerGroundY               ;C - - - - - 0x01D613 0E:D603: C5 36
	BCC loc_0E_D61E                 ;C - - - - - 0x01D615 0E:D605: 90 17
	BEQ loc_0E_D610                 ;C - - - - - 0x01D617 0E:D607: F0 07
	SBC #$01                        ;C - - - - - 0x01D619 0E:D609: E9 01
	STA objY                        ;C - - - - - 0x01D61B 0E:D60B: 8D C0 03
	BNE loc_0E_D613                 ;C - - - - - 0x01D61E 0E:D60E: D0 03
loc_0E_D610:
	STA objY                        ;c - - - - - 0x01D620 0E:D610: 8D C0 03
loc_0E_D613:
	LDA #$00                        ;C - - - - - 0x01D623 0E:D613: A9 00
	STA timerA4                     ;C - - - - - 0x01D625 0E:D615: 85 A4
	STA gameAction                  ;C - - - - - 0x01D627 0E:D617: 85 30
	STA timerA3                     ;C - - - - - 0x01D629 0E:D619: 85 A3
	JSR ResetPlayerStand            ;C - - - - - 0x01D62B 0E:D61B: 20 AA CE
loc_0E_D61E:
	RTS                             ;C - - - - - 0x01D62E 0E:D61E: 60
loc_0E_D61F:
	LDA objAnim                     ;C - - - - - 0x01D62F 0E:D61F: AD 80 05
	CMP #$56                        ;C - - - - - 0x01D632 0E:D622: C9 56
	BEQ loc_0E_D62F                 ;C - - - - - 0x01D634 0E:D624: F0 09
	CMP #$59                        ;C - - - - - 0x01D636 0E:D626: C9 59
	BEQ loc_0E_D633                 ;C - - - - - 0x01D638 0E:D628: F0 09
	CMP #$11                        ;C - - - - - 0x01D63A 0E:D62A: C9 11
	BEQ loc_0E_D637                 ;C - - - - - 0x01D63C 0E:D62C: F0 09
	RTS                             ;c - - - - - 0x01D63E 0E:D62E: 60
loc_0E_D62F:
	LDA #$17                        ;C - - - - - 0x01D63F 0E:D62F: A9 17
	BNE loc_0E_D639                 ;C - - - - - 0x01D641 0E:D631: D0 06
loc_0E_D633:
	LDA #$11                        ;C - - - - - 0x01D643 0E:D633: A9 11
	BNE loc_0E_D639                 ;C - - - - - 0x01D645 0E:D635: D0 02
loc_0E_D637:
	LDA #$14                        ;C - - - - - 0x01D647 0E:D637: A9 14
loc_0E_D639:
	STA playerStandAnim             ;C - - - - - 0x01D649 0E:D639: 85 6F
	JSR StartAction0C               ;C - - - - - 0x01D64B 0E:D63B: 20 9A D7
	JMP Act0C                       ;C - - - - - 0x01D64E 0E:D63E: 4C 6A DD
Act03_PunchTbl_D3AD_02:
	LDA objAnim                     ;C - - J - - 0x01D651 0E:D641: AD 80 05
	CMP #$0F                        ;C - - - - - 0x01D654 0E:D644: C9 0F
	BEQ loc_0E_D66A                 ;C - - - - - 0x01D656 0E:D646: F0 22
	CMP #$3F                        ;C - - - - - 0x01D658 0E:D648: C9 3F
	BEQ loc_0E_D69C                 ;C - - - - - 0x01D65A 0E:D64A: F0 50
	CMP #$18                        ;C - - - - - 0x01D65C 0E:D64C: C9 18
	BEQ loc_0E_D6A6                 ;C - - - - - 0x01D65E 0E:D64E: F0 56
	CMP #$4E                        ;C - - - - - 0x01D660 0E:D650: C9 4E
	BEQ loc_0E_D69C                 ;C - - - - - 0x01D662 0E:D652: F0 48
	CMP #$12                        ;C - - - - - 0x01D664 0E:D654: C9 12
	BEQ loc_0E_D661                 ;C - - - - - 0x01D666 0E:D656: F0 09
	CMP #$15                        ;C - - - - - 0x01D668 0E:D658: C9 15
	BEQ loc_0E_D664                 ;C - - - - - 0x01D66A 0E:D65A: F0 08
	CMP #$47                        ;c - - - - - 0x01D66C 0E:D65C: C9 47
	BEQ loc_0E_D667                 ;c - - - - - 0x01D66E 0E:D65E: F0 07
	RTS                             ;c - - - - - 0x01D670 0E:D660: 60
loc_0E_D661:
	JMP loc_0E_D6E0                 ;C - - - - - 0x01D671 0E:D661: 4C E0 D6
loc_0E_D664:
	JMP loc_0E_D70A                 ;C - - - - - 0x01D674 0E:D664: 4C 0A D7
loc_0E_D667:
	JMP StartAction0C               ;c - - - - - 0x01D677 0E:D667: 4C 9A D7
loc_0E_D66A:
	LDA objAnimFrame                ;C - - - - - 0x01D67A 0E:D66A: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D67D 0E:D66D: C9 02
	BNE loc_0E_D680                 ;C - - - - - 0x01D67F 0E:D66F: D0 0F
	LDA objAnimFlags                ;C - - - - - 0x01D681 0E:D671: AD 90 05
	BNE loc_0E_D680                 ;C - - - - - 0x01D684 0E:D674: D0 0A
	JSR ArmTimerA4                  ;C - - - - - 0x01D686 0E:D676: 20 3B F4
	LDA #$0B                        ;C - - - - - 0x01D689 0E:D679: A9 0B
	STA attackType                  ;C - - - - - 0x01D68B 0E:D67B: 85 A7
	JSR PlayHitSound                ;C - - - - - 0x01D68D 0E:D67D: 20 30 F4
loc_0E_D680:
	LDA objAnimFrame                ;C - - - - - 0x01D690 0E:D680: AD 70 05
	CMP #$03                        ;C - - - - - 0x01D693 0E:D683: C9 03
	BNE loc_0E_D68F                 ;C - - - - - 0x01D695 0E:D685: D0 08
	LDA objAnimFlags                ;C - - - - - 0x01D697 0E:D687: AD 90 05
	BNE loc_0E_D68F                 ;C - - - - - 0x01D69A 0E:D68A: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D69C 0E:D68C: 20 36 F4
loc_0E_D68F:
	LDA objAnimFrame                ;C - - - - - 0x01D69F 0E:D68F: AD 70 05
	CMP #$05                        ;C - - - - - 0x01D6A2 0E:D692: C9 05
	BNE loc_0E_D69B                 ;C - - - - - 0x01D6A4 0E:D694: D0 05
	LDA #$3F                        ;C - - - - - 0x01D6A6 0E:D696: A9 3F
	JMP loc_0E_D6D4                 ;C - - - - - 0x01D6A8 0E:D698: 4C D4 D6
loc_0E_D69B:
	RTS                             ;C - - - - - 0x01D6AB 0E:D69B: 60
loc_0E_D69C:
	LDA objAnimFlags                ;C - - - - - 0x01D6AC 0E:D69C: AD 90 05
	CMP #$04                        ;C - - - - - 0x01D6AF 0E:D69F: C9 04
	BNE loc_0E_D69B                 ;C - - - - - 0x01D6B1 0E:D6A1: D0 F8
	JMP loc_0E_D777                 ;C - - - - - 0x01D6B3 0E:D6A3: 4C 77 D7
loc_0E_D6A6:
	LDA objAnimFrame                ;C - - - - - 0x01D6B6 0E:D6A6: AD 70 05
	CMP #$02                        ;C - - - - - 0x01D6B9 0E:D6A9: C9 02
	BNE loc_0E_D6BC                 ;C - - - - - 0x01D6BB 0E:D6AB: D0 0F
	LDA objAnimFlags                ;C - - - - - 0x01D6BD 0E:D6AD: AD 90 05
	BNE loc_0E_D6BC                 ;C - - - - - 0x01D6C0 0E:D6B0: D0 0A
	JSR ArmTimerA4                  ;C - - - - - 0x01D6C2 0E:D6B2: 20 3B F4
	LDA #$0B                        ;C - - - - - 0x01D6C5 0E:D6B5: A9 0B
	STA attackType                  ;C - - - - - 0x01D6C7 0E:D6B7: 85 A7
	JSR PlayHitSound                ;C - - - - - 0x01D6C9 0E:D6B9: 20 30 F4
loc_0E_D6BC:
	LDA objAnimFrame                ;C - - - - - 0x01D6CC 0E:D6BC: AD 70 05
	CMP #$03                        ;C - - - - - 0x01D6CF 0E:D6BF: C9 03
	BNE loc_0E_D6CB                 ;C - - - - - 0x01D6D1 0E:D6C1: D0 08
	LDA objAnimFlags                ;C - - - - - 0x01D6D3 0E:D6C3: AD 90 05
	BNE loc_0E_D6CB                 ;C - - - - - 0x01D6D6 0E:D6C6: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D6D8 0E:D6C8: 20 36 F4
loc_0E_D6CB:
	LDA objAnimFrame                ;C - - - - - 0x01D6DB 0E:D6CB: AD 70 05
	CMP #$05                        ;C - - - - - 0x01D6DE 0E:D6CE: C9 05
	BNE loc_0E_D69B                 ;C - - - - - 0x01D6E0 0E:D6D0: D0 C9
	LDA #$4E                        ;C - - - - - 0x01D6E2 0E:D6D2: A9 4E
loc_0E_D6D4:
	JSR SetPlayerAnim               ;C - - - - - 0x01D6E4 0E:D6D4: 20 94 F2
	LDA #$08                        ;C - - - - - 0x01D6E7 0E:D6D7: A9 08
	JSR SetChrBank2                 ;C - - - - - 0x01D6E9 0E:D6D9: 20 40 F4
	JMP loc_0E_D777                 ;C - - - - - 0x01D6EC 0E:D6DC: 4C 77 D7
loc_0E_D6DF:
	RTS                             ;C - - - - - 0x01D6EF 0E:D6DF: 60
loc_0E_D6E0:
	LDA objAnimFrame                ;C - - - - - 0x01D6F0 0E:D6E0: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D6F3 0E:D6E3: C9 04
	BNE loc_0E_D6F6                 ;C - - - - - 0x01D6F5 0E:D6E5: D0 0F
	LDA objAnimFlags                ;C - - - - - 0x01D6F7 0E:D6E7: AD 90 05
	BNE loc_0E_D6F6                 ;C - - - - - 0x01D6FA 0E:D6EA: D0 0A
	JSR ArmTimerA4                  ;C - - - - - 0x01D6FC 0E:D6EC: 20 3B F4
	LDA #$0C                        ;C - - - - - 0x01D6FF 0E:D6EF: A9 0C
	STA attackType                  ;C - - - - - 0x01D701 0E:D6F1: 85 A7
	JSR PlayHitSound                ;C - - - - - 0x01D703 0E:D6F3: 20 30 F4
loc_0E_D6F6:
	LDA objAnimFrame                ;C - - - - - 0x01D706 0E:D6F6: AD 70 05
	CMP #$05                        ;C - - - - - 0x01D709 0E:D6F9: C9 05
	BNE loc_0E_D700                 ;C - - - - - 0x01D70B 0E:D6FB: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D70D 0E:D6FD: 20 36 F4
loc_0E_D700:
	LDA objAnimFrame                ;C - - - - - 0x01D710 0E:D700: AD 70 05
	CMP #$07                        ;C - - - - - 0x01D713 0E:D703: C9 07
	BNE loc_0E_D6DF                 ;C - - - - - 0x01D715 0E:D705: D0 D8
	JMP loc_0E_D777                 ;C - - - - - 0x01D717 0E:D707: 4C 77 D7
loc_0E_D70A:
	LDA objAnimFrame                ;C - - - - - 0x01D71A 0E:D70A: AD 70 05
	CMP #$04                        ;C - - - - - 0x01D71D 0E:D70D: C9 04
	BNE loc_0E_D724                 ;C - - - - - 0x01D71F 0E:D70F: D0 13
	LDA objAnimFlags                ;C - - - - - 0x01D721 0E:D711: AD 90 05
	BNE loc_0E_D724                 ;C - - - - - 0x01D724 0E:D714: D0 0E
	JSR ArmTimerA4                  ;C - - - - - 0x01D726 0E:D716: 20 3B F4
	LDA #$0D                        ;C - - - - - 0x01D729 0E:D719: A9 0D
	STA attackType                  ;C - - - - - 0x01D72B 0E:D71B: 85 A7
	LDA playerGroundY               ;C - - - - - 0x01D72D 0E:D71D: A5 36
	STA jumpBaseY                   ;C - - - - - 0x01D72F 0E:D71F: 85 A6
	JSR PlayHitSound                ;C - - - - - 0x01D731 0E:D721: 20 30 F4
loc_0E_D724:
	LDA objAnimFrame                ;C - - - - - 0x01D734 0E:D724: AD 70 05
	CMP #$07                        ;C - - - - - 0x01D737 0E:D727: C9 07
	BNE loc_0E_D72E                 ;C - - - - - 0x01D739 0E:D729: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x01D73B 0E:D72B: 20 36 F4
loc_0E_D72E:
	LDA objAnimFrame                ;C - - - - - 0x01D73E 0E:D72E: AD 70 05
	CMP #$0F                        ;C - - - - - 0x01D741 0E:D731: C9 0F
	BNE loc_0E_D73A                 ;C - - - - - 0x01D743 0E:D733: D0 05
	LDA objY                        ;c - - - - - 0x01D745 0E:D735: AD C0 03
	STA playerGroundY               ;c - - - - - 0x01D748 0E:D738: 85 36
loc_0E_D73A:
	LDA #$80                        ;C - - - - - 0x01D74A 0E:D73A: A9 80
	STA playerBusy                  ;C - - - - - 0x01D74C 0E:D73C: 85 6E
	LDY #$02                        ;C - - - - - 0x01D74E 0E:D73E: A0 02
	JSR MoveYGravityCheck           ;C - - - - - 0x01D750 0E:D740: 20 19 F1
	LDA objVelYHi                   ;C - - - - - 0x01D753 0E:D743: AD 30 04
	BPL loc_0E_D776                 ;C - - - - - 0x01D756 0E:D746: 10 2E
	LDA objY                        ;C - - - - - 0x01D758 0E:D748: AD C0 03
	CLC                             ;C - - - - - 0x01D75B 0E:D74B: 18
	ADC #$02                        ;C - - - - - 0x01D75C 0E:D74C: 69 02
	CMP playerGroundY               ;C - - - - - 0x01D75E 0E:D74E: C5 36
	BCC loc_0E_D776                 ;C - - - - - 0x01D760 0E:D750: 90 24
	BEQ loc_0E_D75B                 ;C - - - - - 0x01D762 0E:D752: F0 07
	SBC #$01                        ;C - - - - - 0x01D764 0E:D754: E9 01
	STA objY                        ;C - - - - - 0x01D766 0E:D756: 8D C0 03
	BNE loc_0E_D75E                 ;C - - - - - 0x01D769 0E:D759: D0 03
loc_0E_D75B:
	STA objY                        ;C - - - - - 0x01D76B 0E:D75B: 8D C0 03
loc_0E_D75E:
	LDA #$50                        ;C - - - - - 0x01D76E 0E:D75E: A9 50
	JSR SetPlayerAnim               ;C - - - - - 0x01D770 0E:D760: 20 94 F2
	LDA #$0B                        ;C - - - - - 0x01D773 0E:D763: A9 0B
	JSR SetChrBank2                 ;C - - - - - 0x01D775 0E:D765: 20 40 F4
	LDA #$00                        ;C - - - - - 0x01D778 0E:D768: A9 00
	STA timerA4                     ;C - - - - - 0x01D77A 0E:D76A: 85 A4
	STA timerA3                     ;C - - - - - 0x01D77C 0E:D76C: 85 A3
	LDA #$02                        ;C - - - - - 0x01D77E 0E:D76E: A9 02
	STA gameAction                  ;C - - - - - 0x01D780 0E:D770: 85 30
	LDA #$08                        ;C - - - - - 0x01D782 0E:D772: A9 08
	STA actionTimer                 ;C - - - - - 0x01D784 0E:D774: 85 37
loc_0E_D776:
	RTS                             ;C - - - - - 0x01D786 0E:D776: 60
loc_0E_D777:
	LDA objAnim                     ;C - - - - - 0x01D787 0E:D777: AD 80 05
	CMP #$3F                        ;C - - - - - 0x01D78A 0E:D77A: C9 3F
	BEQ loc_0E_D788                 ;C - - - - - 0x01D78C 0E:D77C: F0 0A
	CMP #$4E                        ;C - - - - - 0x01D78E 0E:D77E: C9 4E
	BEQ loc_0E_D78C                 ;C - - - - - 0x01D790 0E:D780: F0 0A
	CMP #$12                        ;C - - - - - 0x01D792 0E:D782: C9 12
	BEQ loc_0E_D790                 ;C - - - - - 0x01D794 0E:D784: F0 0A
	BNE StartAction0C               ;c - - - - - 0x01D796 0E:D786: D0 12
loc_0E_D788:
	LDA #$18                        ;C - - - - - 0x01D798 0E:D788: A9 18
	BNE loc_0E_D792                 ;C - - - - - 0x01D79A 0E:D78A: D0 06
loc_0E_D78C:
	LDA #$12                        ;C - - - - - 0x01D79C 0E:D78C: A9 12
	BNE loc_0E_D792                 ;C - - - - - 0x01D79E 0E:D78E: D0 02
loc_0E_D790:
	LDA #$15                        ;C - - - - - 0x01D7A0 0E:D790: A9 15
loc_0E_D792:
	STA playerStandAnim             ;C - - - - - 0x01D7A2 0E:D792: 85 6F
	JSR StartAction0C               ;C - - - - - 0x01D7A4 0E:D794: 20 9A D7
	JMP Act0C                       ;C - - - - - 0x01D7A7 0E:D797: 4C 6A DD
StartAction0C:
	LDA #$0C                        ;C - - - - - 0x01D7AA 0E:D79A: A9 0C
	STA gameAction                  ;C - - - - - 0x01D7AC 0E:D79C: 85 30
	LDA #$08                        ;C - - - - - 0x01D7AE 0E:D79E: A9 08
	STA actionTimer                 ;C - - - - - 0x01D7B0 0E:D7A0: 85 37
	RTS                             ;C - - - - - 0x01D7B2 0E:D7A2: 60
; per-character handler via table
Act04_Grab:
	LDY playerId                    ;C - - J - - 0x01D7B3 0E:D7A3: A4 34
	LDA Act04_GrabTbl_D7B2,Y        ;C - - - - - 0x01D7B5 0E:D7A5: B9 B2 D7
	STA ptr_00                      ;C - - - - - 0x01D7B8 0E:D7A8: 85 00
	LDA Act04_GrabTbl_D7B5,Y        ;C - - - - - 0x01D7BA 0E:D7AA: B9 B5 D7
	STA ptr_00+1                    ;C - - - - - 0x01D7BD 0E:D7AD: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x01D7BF 0E:D7AF: 6C 00 00
Act04_GrabTbl_D7B2:
	.lobytes Act04_GrabTbl_D7B2_00, Act04_GrabTbl_D7B2_01, Act04_GrabTbl_D7B2_02;- D 2 - - - 0x01D7C2 0E:D7B2:
Act04_GrabTbl_D7B5:
	.hibytes Act04_GrabTbl_D7B2_00, Act04_GrabTbl_D7B2_01, Act04_GrabTbl_D7B2_02;- D 2 - - - 0x01D7C5 0E:D7B5:
Act04_GrabTbl_D7B2_00:
	LDA padPressed                  ;C - - J - - 0x01D7C8 0E:D7B8: A5 14
	CMP #$40                        ;C - - - - - 0x01D7CA 0E:D7BA: C9 40
	BNE loc_0E_D82E                 ;C - - - - - 0x01D7CC 0E:D7BC: D0 70
	LDY grabbedSlot                 ;C - - - - - 0x01D7CE 0E:D7BE: A4 39
	LDA padHeld                     ;C - - - - - 0x01D7D0 0E:D7C0: A5 16
	AND #$0F                        ;C - - - - - 0x01D7D2 0E:D7C2: 29 0F
	BEQ loc_0E_D829                 ;C - - - - - 0x01D7D4 0E:D7C4: F0 63
	CMP playerFacing                ;C - - - - - 0x01D7D6 0E:D7C6: C5 31
	BEQ loc_0E_D7D4                 ;C - - - - - 0x01D7D8 0E:D7C8: F0 0A
	LDA objFacing,Y                 ;C - - - - - 0x01D7DA 0E:D7CA: B9 60 04
	EOR #$03                        ;C - - - - - 0x01D7DD 0E:D7CD: 49 03
	STA objFacing,Y                 ;C - - - - - 0x01D7DF 0E:D7CF: 99 60 04
	BNE loc_0E_D7EB                 ;C - - - - - 0x01D7E2 0E:D7D2: D0 17
loc_0E_D7D4:
	LDA #$FF                        ;C - - - - - 0x01D7E4 0E:D7D4: A9 FF
	STA objMoveMode,Y               ;C - - - - - 0x01D7E6 0E:D7D6: 99 70 04
	LDA playerFacing                ;C - - - - - 0x01D7E9 0E:D7D9: A5 31
	AND #$01                        ;C - - - - - 0x01D7EB 0E:D7DB: 29 01
	BEQ loc_0E_D7E6                 ;C - - - - - 0x01D7ED 0E:D7DD: F0 07
	JSR ClearPlayerFlag40           ;C - - - - - 0x01D7EF 0E:D7DF: 20 48 F0
	LDA #$02                        ;C - - - - - 0x01D7F2 0E:D7E2: A9 02
	BNE loc_0E_D7EB                 ;C - - - - - 0x01D7F4 0E:D7E4: D0 05
loc_0E_D7E6:
	JSR SetPlayerFlag40             ;C - - - - - 0x01D7F6 0E:D7E6: 20 3F F0
	LDA #$01                        ;C - - - - - 0x01D7F9 0E:D7E9: A9 01
loc_0E_D7EB:
	STA playerFacing                ;C - - - - - 0x01D7FB 0E:D7EB: 85 31
	LDA #$34                        ;C - - - - - 0x01D7FD 0E:D7ED: A9 34
	JSR SetPlayerAnim               ;C - - - - - 0x01D7FF 0E:D7EF: 20 94 F2
loc_0E_D7F2:
	LDA #$80                        ;C - - - - - 0x01D802 0E:D7F2: A9 80
	STA playerBusy                  ;C - - - - - 0x01D804 0E:D7F4: 85 6E
	LDY grabbedSlot                 ;C - - - - - 0x01D806 0E:D7F6: A4 39
	LDA #$04                        ;C - - - - - 0x01D808 0E:D7F8: A9 04
	STA objKind,Y                   ;C - - - - - 0x01D80A 0E:D7FA: 99 20 03
	LDA #$80                        ;C - - - - - 0x01D80D 0E:D7FD: A9 80
	STA objActive,Y                 ;C - - - - - 0x01D80F 0E:D7FF: 99 00 03
	LDA objFacing,Y                 ;C - - - - - 0x01D812 0E:D802: B9 60 04
	AND #$01                        ;C - - - - - 0x01D815 0E:D805: 29 01
	BEQ loc_0E_D813                 ;C - - - - - 0x01D817 0E:D807: F0 0A
	LDA objFlags,Y                  ;C - - - - - 0x01D819 0E:D809: B9 60 05
	AND #$BF                        ;C - - - - - 0x01D81C 0E:D80C: 29 BF
	STA objFlags,Y                  ;C - - - - - 0x01D81E 0E:D80E: 99 60 05
	BNE loc_0E_D81B                 ;C - - - - - 0x01D821 0E:D811: D0 08
loc_0E_D813:
	LDA objFlags,Y                  ;C - - - - - 0x01D823 0E:D813: B9 60 05
	ORA #$40                        ;C - - - - - 0x01D826 0E:D816: 09 40
	STA objFlags,Y                  ;C - - - - - 0x01D828 0E:D818: 99 60 05
loc_0E_D81B:
	LDA #$19                        ;C - - - - - 0x01D82B 0E:D81B: A9 19
	STA actionTimer                 ;C - - - - - 0x01D82D 0E:D81D: 85 37
	LDA #$0B                        ;C - - - - - 0x01D82F 0E:D81F: A9 0B
	STA gameAction                  ;C - - - - - 0x01D831 0E:D821: 85 30
	LDA #$33                        ;C - - - - - 0x01D833 0E:D823: A9 33
	JSR QueueSound                  ;C - - - - - 0x01D835 0E:D825: 20 4C F3
	RTS                             ;C - - - - - 0x01D838 0E:D828: 60
loc_0E_D829:
	LDA #$21                        ;C - - - - - 0x01D839 0E:D829: A9 21
	STA gameAction                  ;C - - - - - 0x01D83B 0E:D82B: 85 30
	RTS                             ;C - - - - - 0x01D83D 0E:D82D: 60
loc_0E_D82E:
	LDA padPressed                  ;C - - - - - 0x01D83E 0E:D82E: A5 14
	CMP #$80                        ;C - - - - - 0x01D840 0E:D830: C9 80
	BEQ loc_0E_D84E                 ;C - - - - - 0x01D842 0E:D832: F0 1A
	LDA grabTimer                   ;C - - - - - 0x01D844 0E:D834: A5 38
	BMI loc_0E_D83B                 ;C - - - - - 0x01D846 0E:D836: 30 03
	DEC grabTimer                   ;C - - - - - 0x01D848 0E:D838: C6 38
	RTS                             ;C - - - - - 0x01D84A 0E:D83A: 60
loc_0E_D83B:
	LDA #$00                        ;C - - - - - 0x01D84B 0E:D83B: A9 00
	STA gameAction                  ;C - - - - - 0x01D84D 0E:D83D: 85 30
	STA ram_00B3                    ;C - - - - - 0x01D84F 0E:D83F: 85 B3
	STA ram_00BA                    ;C - - - - - 0x01D851 0E:D841: 85 BA
	LDA #$FF                        ;C - - - - - 0x01D853 0E:D843: A9 FF
	LDY grabbedSlot                 ;C - - - - - 0x01D855 0E:D845: A4 39
	STA objGrabState,Y              ;C - - - - - 0x01D857 0E:D847: 99 F0 03
	JSR ResetPlayerStand            ;C - - - - - 0x01D85A 0E:D84A: 20 AA CE
	RTS                             ;C - - - - - 0x01D85D 0E:D84D: 60
loc_0E_D84E:
	LDA #$38                        ;C - - - - - 0x01D85E 0E:D84E: A9 38
	STA objVelYLo                   ;C - - - - - 0x01D860 0E:D850: 8D 20 04
	LDA #$04                        ;C - - - - - 0x01D863 0E:D853: A9 04
	STA objVelYHi                   ;C - - - - - 0x01D865 0E:D855: 8D 30 04
	LDY playerId                    ;C - - - - - 0x01D868 0E:D858: A4 34
	LDA PlayerRow_E1E9,Y            ;C - - - - - 0x01D86A 0E:D85A: B9 E9 E1
	JSR SetPlayerAnim               ;C - - - - - 0x01D86D 0E:D85D: 20 94 F2
	LDA PlayerRow_E22E,Y            ;C - - - - - 0x01D870 0E:D860: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x01D873 0E:D863: 20 40 F4
	LDA #$00                        ;C - - - - - 0x01D876 0E:D866: A9 00
	STA grabTimer                   ;C - - - - - 0x01D878 0E:D868: 85 38
	STA ram_00BA                    ;C - - - - - 0x01D87A 0E:D86A: 85 BA
	LDA #$FF                        ;C - - - - - 0x01D87C 0E:D86C: A9 FF
	LDY grabbedSlot                 ;C - - - - - 0x01D87E 0E:D86E: A4 39
	STA objGrabState,Y              ;C - - - - - 0x01D880 0E:D870: 99 F0 03
	LDA #$01                        ;C - - - - - 0x01D883 0E:D873: A9 01
	STA gameAction                  ;C - - - - - 0x01D885 0E:D875: 85 30
	LDA objY                        ;C - - - - - 0x01D887 0E:D877: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D88A 0E:D87A: 85 36
	STA jumpBaseY                   ;C - - - - - 0x01D88C 0E:D87C: 85 A6
	LDA #$1B                        ;C - - - - - 0x01D88E 0E:D87E: A9 1B
	JSR QueueSound                  ;C - - - - - 0x01D890 0E:D880: 20 4C F3
	JMP Act01_Jump                  ;C - - - - - 0x01D893 0E:D883: 4C 88 CF
Act04_GrabTbl_D7B2_01:
	LDA padPressed                  ;C - - J - - 0x01D896 0E:D886: A5 14
	CMP #$40                        ;C - - - - - 0x01D898 0E:D888: C9 40
	BNE loc_0E_D82E                 ;C - - - - - 0x01D89A 0E:D88A: D0 A2
loc_0E_D88C:
	LDA #$80                        ;C - - - - - 0x01D89C 0E:D88C: A9 80
	STA playerBusy                  ;C - - - - - 0x01D89E 0E:D88E: 85 6E
	LDA #$13                        ;C - - - - - 0x01D8A0 0E:D890: A9 13
	STA gameAction                  ;C - - - - - 0x01D8A2 0E:D892: 85 30
	LDA #$80                        ;C - - - - - 0x01D8A4 0E:D894: A9 80
	STA objActive                   ;C - - - - - 0x01D8A6 0E:D896: 8D 00 03
	RTS                             ;C - - - - - 0x01D8A9 0E:D899: 60
Act04_GrabTbl_D7B2_02:
	LDA padPressed                  ;C - - J - - 0x01D8AA 0E:D89A: A5 14
	CMP #$40                        ;C - - - - - 0x01D8AC 0E:D89C: C9 40
	BEQ loc_0E_D8A8                 ;C - - - - - 0x01D8AE 0E:D89E: F0 08
	LDA objY                        ;C - - - - - 0x01D8B0 0E:D8A0: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D8B3 0E:D8A3: 85 36
	JMP loc_0E_D8E5                 ;C - - - - - 0x01D8B5 0E:D8A5: 4C E5 D8
loc_0E_D8A8:
	LDY grabbedSlot                 ;C - - - - - 0x01D8B8 0E:D8A8: A4 39
	LDA #$15                        ;C - - - - - 0x01D8BA 0E:D8AA: A9 15
	STA gameAction                  ;C - - - - - 0x01D8BC 0E:D8AC: 85 30
	LDA #$80                        ;C - - - - - 0x01D8BE 0E:D8AE: A9 80
	STA objActive                   ;C - - - - - 0x01D8C0 0E:D8B0: 8D 00 03
	STA objActive,Y                 ;C - - - - - 0x01D8C3 0E:D8B3: 99 00 03
	RTS                             ;C - - - - - 0x01D8C6 0E:D8B6: 60
loc_0E_D8B7:
	LDY grabbedSlot                 ;C - - - - - 0x01D8C7 0E:D8B7: A4 39
	LDA #$80                        ;C - - - - - 0x01D8C9 0E:D8B9: A9 80
	STA objActive,Y                 ;C - - - - - 0x01D8CB 0E:D8BB: 99 00 03
	LDA #$12                        ;C - - - - - 0x01D8CE 0E:D8BE: A9 12
	STA gameAction                  ;C - - - - - 0x01D8D0 0E:D8C0: 85 30
	LDA #$00                        ;C - - - - - 0x01D8D2 0E:D8C2: A9 00
	STA ram_00B3                    ;C - - - - - 0x01D8D4 0E:D8C4: 85 B3
	LDA #$4E                        ;C - - - - - 0x01D8D6 0E:D8C6: A9 4E
	STA objVelYLo                   ;C - - - - - 0x01D8D8 0E:D8C8: 8D 20 04
	LDA #$05                        ;C - - - - - 0x01D8DB 0E:D8CB: A9 05
	STA objVelYHi                   ;C - - - - - 0x01D8DD 0E:D8CD: 8D 30 04
	LDA #$80                        ;C - - - - - 0x01D8E0 0E:D8D0: A9 80
	STA objVelXLo                   ;C - - - - - 0x01D8E2 0E:D8D2: 8D 00 04
	LDA #$01                        ;C - - - - - 0x01D8E5 0E:D8D5: A9 01
	STA objVelXHi                   ;C - - - - - 0x01D8E7 0E:D8D7: 8D 10 04
	LDA objY                        ;C - - - - - 0x01D8EA 0E:D8DA: AD C0 03
	STA playerGroundY               ;C - - - - - 0x01D8ED 0E:D8DD: 85 36
	STA jumpBaseY                   ;C - - - - - 0x01D8EF 0E:D8DF: 85 A6
	RTS                             ;C - - - - - 0x01D8F1 0E:D8E1: 60
loc_0E_D8E2:
	JMP loc_0E_D83B                 ;C - - - - - 0x01D8F2 0E:D8E2: 4C 3B D8
loc_0E_D8E5:
	LDA padPressed                  ;C - - - - - 0x01D8F5 0E:D8E5: A5 14
	CMP #$80                        ;C - - - - - 0x01D8F7 0E:D8E7: C9 80
	BEQ loc_0E_D8B7                 ;C - - - - - 0x01D8F9 0E:D8E9: F0 CC
	LDA grabTimer                   ;C - - - - - 0x01D8FB 0E:D8EB: A5 38
	BMI loc_0E_D8E2                 ;C - - - - - 0x01D8FD 0E:D8ED: 30 F3
	DEC grabTimer                   ;C - - - - - 0x01D8FF 0E:D8EF: C6 38
	LDA #$58                        ;C - - - - - 0x01D901 0E:D8F1: A9 58
	CMP objAnim                     ;C - - - - - 0x01D903 0E:D8F3: CD 80 05
	BEQ loc_0E_D900                 ;C - - - - - 0x01D906 0E:D8F6: F0 08
	JSR SetAnimX                    ;C - - - - - 0x01D908 0E:D8F8: 20 88 F2
	LDA #$08                        ;C - - - - - 0x01D90B 0E:D8FB: A9 08
	JSR SetChrBank2                 ;C - - - - - 0x01D90D 0E:D8FD: 20 40 F4
loc_0E_D900:
	LDX #$00                        ;C - - - - - 0x01D910 0E:D900: A2 00
	LDA padHeld                     ;C - - - - - 0x01D912 0E:D902: A5 16
	AND #$03                        ;C - - - - - 0x01D914 0E:D904: 29 03
	BEQ loc_0E_D92D                 ;C - - - - - 0x01D916 0E:D906: F0 25
	STA objFacing                   ;C - - - - - 0x01D918 0E:D908: 8D 60 04
	AND #$01                        ;C - - - - - 0x01D91B 0E:D90B: 29 01
	BEQ loc_0E_D95C                 ;C - - - - - 0x01D91D 0E:D90D: F0 4D
	LDY #$00                        ;C - - - - - 0x01D91F 0E:D90F: A0 00
	JSR MoveRightCheck              ;C - - - - - 0x01D921 0E:D911: 20 03 F0
	BCS loc_0E_D959                 ;C - - - - - 0x01D924 0E:D914: B0 43
	LDY grabbedSlot                 ;C - - - - - 0x01D926 0E:D916: A4 39
	LDA playerFacing                ;C - - - - - 0x01D928 0E:D918: A5 31
	CMP #$01                        ;C - - - - - 0x01D92A 0E:D91A: C9 01
	BEQ loc_0E_D930                 ;C - - - - - 0x01D92C 0E:D91C: F0 12
	LDA objX                        ;C - - - - - 0x01D92E 0E:D91E: AD 60 03
	SEC                             ;C - - - - - 0x01D931 0E:D921: 38
	SBC scrollX                     ;C - - - - - 0x01D932 0E:D922: E5 FC
	CMP #$F1                        ;C - - - - - 0x01D934 0E:D924: C9 F1
	BEQ loc_0E_D959                 ;C - - - - - 0x01D936 0E:D926: F0 31
	BCS loc_0E_D959                 ;C - - - - - 0x01D938 0E:D928: B0 2F
	JMP loc_0E_D93C                 ;C - - - - - 0x01D93A 0E:D92A: 4C 3C D9
loc_0E_D92D:
	JMP loc_0E_D9A3                 ;C - - - - - 0x01D93D 0E:D92D: 4C A3 D9
loc_0E_D930:
	LDA objX,Y                      ;C - - - - - 0x01D940 0E:D930: B9 60 03
	SEC                             ;C - - - - - 0x01D943 0E:D933: 38
	SBC scrollX                     ;C - - - - - 0x01D944 0E:D934: E5 FC
	CMP #$F9                        ;C - - - - - 0x01D946 0E:D936: C9 F9
	BEQ loc_0E_D959                 ;C - - - - - 0x01D948 0E:D938: F0 1F
	BCS loc_0E_D959                 ;C - - - - - 0x01D94A 0E:D93A: B0 1D
loc_0E_D93C:
	LDA objXFrac,Y                  ;C - - - - - 0x01D94C 0E:D93C: B9 40 03
	CLC                             ;C - - - - - 0x01D94F 0E:D93F: 18
	ADC objVelXLo                   ;C - - - - - 0x01D950 0E:D940: 6D 00 04
	STA objXFrac,Y                  ;C - - - - - 0x01D953 0E:D943: 99 40 03
	LDA objX,Y                      ;C - - - - - 0x01D956 0E:D946: B9 60 03
	ADC objVelXHi                   ;C - - - - - 0x01D959 0E:D949: 6D 10 04
	STA objX,Y                      ;C - - - - - 0x01D95C 0E:D94C: 99 60 03
	BCC loc_0E_D959                 ;C - - - - - 0x01D95F 0E:D94F: 90 08
	LDA objXPage,Y                  ;c - - - - - 0x01D961 0E:D951: B9 80 03
	ADC #$00                        ;c - - - - - 0x01D964 0E:D954: 69 00
	STA objXPage,Y                  ;c - - - - - 0x01D966 0E:D956: 99 80 03
loc_0E_D959:
	JMP loc_0E_D9A3                 ;C - - - - - 0x01D969 0E:D959: 4C A3 D9
loc_0E_D95C:
	LDY #$01                        ;C - - - - - 0x01D96C 0E:D95C: A0 01
	JSR MoveLeftCheck               ;C - - - - - 0x01D96E 0E:D95E: 20 54 F0
	BCS loc_0E_D9A3                 ;C - - - - - 0x01D971 0E:D961: B0 40
	LDY grabbedSlot                 ;C - - - - - 0x01D973 0E:D963: A4 39
	LDA playerFacing                ;C - - - - - 0x01D975 0E:D965: A5 31
	CMP #$01                        ;C - - - - - 0x01D977 0E:D967: C9 01
	BEQ loc_0E_D97A                 ;C - - - - - 0x01D979 0E:D969: F0 0F
	LDA objX,Y                      ;C - - - - - 0x01D97B 0E:D96B: B9 60 03
	SEC                             ;C - - - - - 0x01D97E 0E:D96E: 38
	SBC scrollX                     ;C - - - - - 0x01D97F 0E:D96F: E5 FC
	CMP #$11                        ;C - - - - - 0x01D981 0E:D971: C9 11
	BEQ loc_0E_D9A3                 ;C - - - - - 0x01D983 0E:D973: F0 2E
	BCC loc_0E_D9A3                 ;C - - - - - 0x01D985 0E:D975: 90 2C
	JMP loc_0E_D986                 ;C - - - - - 0x01D987 0E:D977: 4C 86 D9
loc_0E_D97A:
	LDA objX                        ;C - - - - - 0x01D98A 0E:D97A: AD 60 03
	SEC                             ;C - - - - - 0x01D98D 0E:D97D: 38
	SBC scrollX                     ;C - - - - - 0x01D98E 0E:D97E: E5 FC
	CMP #$18                        ;C - - - - - 0x01D990 0E:D980: C9 18
	BEQ loc_0E_D9A3                 ;C - - - - - 0x01D992 0E:D982: F0 1F
	BCC loc_0E_D9A3                 ;C - - - - - 0x01D994 0E:D984: 90 1D
loc_0E_D986:
	LDA objXFrac,Y                  ;C - - - - - 0x01D996 0E:D986: B9 40 03
	SEC                             ;C - - - - - 0x01D999 0E:D989: 38
	SBC objVelXLo                   ;C - - - - - 0x01D99A 0E:D98A: ED 00 04
	STA objXFrac,Y                  ;C - - - - - 0x01D99D 0E:D98D: 99 40 03
	LDA objX,Y                      ;C - - - - - 0x01D9A0 0E:D990: B9 60 03
	SBC objVelXHi                   ;C - - - - - 0x01D9A3 0E:D993: ED 10 04
	STA objX,Y                      ;C - - - - - 0x01D9A6 0E:D996: 99 60 03
	BCS loc_0E_D9A3                 ;C - - - - - 0x01D9A9 0E:D999: B0 08
	LDA objXPage,Y                  ;C - - - - - 0x01D9AB 0E:D99B: B9 80 03
	SBC #$00                        ;C - - - - - 0x01D9AE 0E:D99E: E9 00
	STA objXPage,Y                  ;C - - - - - 0x01D9B0 0E:D9A0: 99 80 03
loc_0E_D9A3:
	LDX #$00                        ;C - - - - - 0x01D9B3 0E:D9A3: A2 00
	LDA padHeld                     ;C - - - - - 0x01D9B5 0E:D9A5: A5 16
	AND #$0C                        ;C - - - - - 0x01D9B7 0E:D9A7: 29 0C
	BEQ loc_0E_D9E9                 ;C - - - - - 0x01D9B9 0E:D9A9: F0 3E
	AND #$04                        ;C - - - - - 0x01D9BB 0E:D9AB: 29 04
	BEQ loc_0E_D9D7                 ;C - - - - - 0x01D9BD 0E:D9AD: F0 28
	LDY #$02                        ;C - - - - - 0x01D9BF 0E:D9AF: A0 02
	JSR MoveYAddCheck               ;C - - - - - 0x01D9C1 0E:D9B1: 20 A2 F0
	BCS loc_0E_D9E9                 ;C - - - - - 0x01D9C4 0E:D9B4: B0 33
	LDY grabbedSlot                 ;C - - - - - 0x01D9C6 0E:D9B6: A4 39
	LDA objYFrac,Y                  ;C - - - - - 0x01D9C8 0E:D9B8: B9 A0 03
	CLC                             ;C - - - - - 0x01D9CB 0E:D9BB: 18
	ADC objVelYLo                   ;C - - - - - 0x01D9CC 0E:D9BC: 6D 20 04
	STA objYFrac,Y                  ;C - - - - - 0x01D9CF 0E:D9BF: 99 A0 03
	LDA objY,Y                      ;C - - - - - 0x01D9D2 0E:D9C2: B9 C0 03
	ADC objVelYHi                   ;C - - - - - 0x01D9D5 0E:D9C5: 6D 30 04
	STA objY,Y                      ;C - - - - - 0x01D9D8 0E:D9C8: 99 C0 03
	CMP #$F0                        ;C - - - - - 0x01D9DB 0E:D9CB: C9 F0
	BCC loc_0E_D9D4                 ;C - - - - - 0x01D9DD 0E:D9CD: 90 05
	ADC #$0F                        ;c - - - - - 0x01D9DF 0E:D9CF: 69 0F
	STA objY,Y                      ;c - - - - - 0x01D9E1 0E:D9D1: 99 C0 03
loc_0E_D9D4:
	JMP loc_0E_D9E9                 ;C - - - - - 0x01D9E4 0E:D9D4: 4C E9 D9
loc_0E_D9D7:
	LDY #$03                        ;C - - - - - 0x01D9E7 0E:D9D7: A0 03
	JSR MoveYSubCheck               ;C - - - - - 0x01D9E9 0E:D9D9: 20 F7 F0
	BCS loc_0E_D9E9                 ;C - - - - - 0x01D9EC 0E:D9DC: B0 0B
	LDY grabbedSlot                 ;C - - - - - 0x01D9EE 0E:D9DE: A4 39
	LDA objY                        ;C - - - - - 0x01D9F0 0E:D9E0: AD C0 03
	SEC                             ;C - - - - - 0x01D9F3 0E:D9E3: 38
	SBC #$08                        ;C - - - - - 0x01D9F4 0E:D9E4: E9 08
	STA objY,Y                      ;C - - - - - 0x01D9F6 0E:D9E6: 99 C0 03
loc_0E_D9E9:
	LDA padHeld                     ;C - - - - - 0x01D9F9 0E:D9E9: A5 16
	AND #$0F                        ;C - - - - - 0x01D9FB 0E:D9EB: 29 0F
	BNE loc_0E_D9F9                 ;C - - - - - 0x01D9FD 0E:D9ED: D0 0A
	LDA #$33                        ;C - - - - - 0x01D9FF 0E:D9EF: A9 33
	JSR SetPlayerAnim               ;C - - - - - 0x01DA01 0E:D9F1: 20 94 F2
	LDA #$08                        ;C - - - - - 0x01DA04 0E:D9F4: A9 08
	JSR SetChrBank2                 ;C - - - - - 0x01DA06 0E:D9F6: 20 40 F4
loc_0E_D9F9:
	RTS                             ;C - - - - - 0x01DA09 0E:D9F9: 60
Act05_Hit:
	LDA padPressed                  ;C - - J - - 0x01DA0A 0E:D9FA: A5 14
	CMP #$C0                        ;C - - - - - 0x01DA0C 0E:D9FC: C9 C0
	BNE loc_0E_DA03                 ;C - - - - - 0x01DA0E 0E:D9FE: D0 03
	JMP loc_0E_CA3C                 ;C - - - - - 0x01DA10 0E:DA00: 4C 3C CA
loc_0E_DA03:
	LDA playerInvincible            ;C - - - - - 0x01DA13 0E:DA03: A5 3B
	CMP #$1E                        ;C - - - - - 0x01DA15 0E:DA05: C9 1E
	BCS loc_0E_DA3C                 ;C - - - - - 0x01DA17 0E:DA07: B0 33
	LDY playerId                    ;C - - - - - 0x01DA19 0E:DA09: A4 34
	LDA PlayerRow_E1C1,Y            ;C - - - - - 0x01DA1B 0E:DA0B: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x01DA1E 0E:DA0E: 8D 00 04
	LDA PlayerRow_E1C4,Y            ;C - - - - - 0x01DA21 0E:DA11: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x01DA24 0E:DA14: 8D 10 04
	LDA PlayerRow_E1C7,Y            ;C - - - - - 0x01DA27 0E:DA17: B9 C7 E1
	STA objVelYLo                   ;C - - - - - 0x01DA2A 0E:DA1A: 8D 20 04
	LDA PlayerRow_E1CA,Y            ;C - - - - - 0x01DA2D 0E:DA1D: B9 CA E1
	STA objVelYHi                   ;C - - - - - 0x01DA30 0E:DA20: 8D 30 04
	LDA #$00                        ;C - - - - - 0x01DA33 0E:DA23: A9 00
	STA grabTimer                   ;C - - - - - 0x01DA35 0E:DA25: 85 38
	STA gameAction                  ;C - - - - - 0x01DA37 0E:DA27: 85 30
	STA timerA3                     ;C - - - - - 0x01DA39 0E:DA29: 85 A3
	STA actionStep                  ;C - - - - - 0x01DA3B 0E:DA2B: 85 35
	STA ram_00BA                    ;C - - - - - 0x01DA3D 0E:DA2D: 85 BA
	STA playerInvincible            ;C - - - - - 0x01DA3F 0E:DA2F: 85 3B
	JSR ResetPlayerStand            ;C - - - - - 0x01DA41 0E:DA31: 20 AA CE
	LDY playerId                    ;C - - - - - 0x01DA44 0E:DA34: A4 34
	LDA PlayerRow_E288,Y            ;C - - - - - 0x01DA46 0E:DA36: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x01DA49 0E:DA39: 85 6F
	RTS                             ;C - - - - - 0x01DA4B 0E:DA3B: 60
loc_0E_DA3C:
	DEC playerInvincible            ;C - - - - - 0x01DA4C 0E:DA3C: C6 3B
	RTS                             ;C - - - - - 0x01DA4E 0E:DA3E: 60
Act06_Fall:
	LDX #$00                        ;C - - J - - 0x01DA4F 0E:DA3F: A2 00
	LDA objActive                   ;C - - - - - 0x01DA51 0E:DA41: AD 00 03
	AND #$0F                        ;C - - - - - 0x01DA54 0E:DA44: 29 0F
	BNE loc_0E_DA84                 ;C - - - - - 0x01DA56 0E:DA46: D0 3C
	LDA playerFacing                ;C - - - - - 0x01DA58 0E:DA48: A5 31
	EOR #$03                        ;C - - - - - 0x01DA5A 0E:DA4A: 49 03
	STA objFacing                   ;C - - - - - 0x01DA5C 0E:DA4C: 8D 60 04
	INC objActive                   ;C - - - - - 0x01DA5F 0E:DA4F: EE 00 03
	LDA #$28                        ;C - - - - - 0x01DA62 0E:DA52: A9 28
	JSR QueueSound                  ;C - - - - - 0x01DA64 0E:DA54: 20 4C F3
	LDA ram_005C                    ;C - - - - - 0x01DA67 0E:DA57: A5 5C
	BMI loc_0E_DA70                 ;C - - - - - 0x01DA69 0E:DA59: 30 15
	LDA #$E6                        ;C - - - - - 0x01DA6B 0E:DA5B: A9 E6
	STA objVelXLo                   ;C - - - - - 0x01DA6D 0E:DA5D: 8D 00 04
	LDA #$00                        ;C - - - - - 0x01DA70 0E:DA60: A9 00
	STA objVelXHi                   ;C - - - - - 0x01DA72 0E:DA62: 8D 10 04
	LDA #$E8                        ;C - - - - - 0x01DA75 0E:DA65: A9 E8
	STA objVelYLo                   ;C - - - - - 0x01DA77 0E:DA67: 8D 20 04
	LDA #$03                        ;C - - - - - 0x01DA7A 0E:DA6A: A9 03
	STA objVelYHi                   ;C - - - - - 0x01DA7C 0E:DA6C: 8D 30 04
	RTS                             ;C - - - - - 0x01DA7F 0E:DA6F: 60
loc_0E_DA70:
	LDA #$80                        ;C - - - - - 0x01DA80 0E:DA70: A9 80
	STA objVelXLo                   ;C - - - - - 0x01DA82 0E:DA72: 8D 00 04
	LDA #$01                        ;C - - - - - 0x01DA85 0E:DA75: A9 01
	STA objVelXHi                   ;C - - - - - 0x01DA87 0E:DA77: 8D 10 04
	LDA #$6E                        ;C - - - - - 0x01DA8A 0E:DA7A: A9 6E
	STA objVelYLo                   ;C - - - - - 0x01DA8C 0E:DA7C: 8D 20 04
	LDA #$04                        ;C - - - - - 0x01DA8F 0E:DA7F: A9 04
	STA objVelYHi                   ;C - - - - - 0x01DA91 0E:DA81: 8D 30 04
loc_0E_DA84:
	LDA objActive                   ;C - - - - - 0x01DA94 0E:DA84: AD 00 03
	AND #$0F                        ;C - - - - - 0x01DA97 0E:DA87: 29 0F
	CMP #$03                        ;C - - - - - 0x01DA99 0E:DA89: C9 03
	BNE loc_0E_DA90                 ;C - - - - - 0x01DA9B 0E:DA8B: D0 03
	JMP loc_0E_DB6C                 ;C - - - - - 0x01DA9D 0E:DA8D: 4C 6C DB
loc_0E_DA90:
	LDA objFacing                   ;C - - - - - 0x01DAA0 0E:DA90: AD 60 04
	AND #$01                        ;C - - - - - 0x01DAA3 0E:DA93: 29 01
	BEQ loc_0E_DACE                 ;C - - - - - 0x01DAA5 0E:DA95: F0 37
	LDA objActive                   ;C - - - - - 0x01DAA7 0E:DA97: AD 00 03
	AND #$0F                        ;C - - - - - 0x01DAAA 0E:DA9A: 29 0F
	CMP #$02                        ;C - - - - - 0x01DAAC 0E:DA9C: C9 02
	BEQ loc_0E_DAC2                 ;C - - - - - 0x01DAAE 0E:DA9E: F0 22
	CMP #$04                        ;C - - - - - 0x01DAB0 0E:DAA0: C9 04
	BEQ loc_0E_DACB                 ;C - - - - - 0x01DAB2 0E:DAA2: F0 27
	LDA objX                        ;C - - - - - 0x01DAB4 0E:DAA4: AD 60 03
	SEC                             ;C - - - - - 0x01DAB7 0E:DAA7: 38
	SBC scrollX                     ;C - - - - - 0x01DAB8 0E:DAA8: E5 FC
	CMP #$E9                        ;C - - - - - 0x01DABA 0E:DAAA: C9 E9
	BEQ loc_0E_DABF                 ;C - - - - - 0x01DABC 0E:DAAC: F0 11
	BCC loc_0E_DAC5                 ;C - - - - - 0x01DABE 0E:DAAE: 90 15
	LDA scrollX                     ;C - - - - - 0x01DAC0 0E:DAB0: A5 FC
	CLC                             ;C - - - - - 0x01DAC2 0E:DAB2: 18
	ADC #$E8                        ;C - - - - - 0x01DAC3 0E:DAB3: 69 E8
	STA objX                        ;C - - - - - 0x01DAC5 0E:DAB5: 8D 60 03
	LDA worldXPage                  ;C - - - - - 0x01DAC8 0E:DAB8: A5 2D
	ADC #$00                        ;C - - - - - 0x01DACA 0E:DABA: 69 00
	STA objXPage                    ;C - - - - - 0x01DACC 0E:DABC: 8D 80 03
loc_0E_DABF:
	INC objActive                   ;C - - - - - 0x01DACF 0E:DABF: EE 00 03
loc_0E_DAC2:
	JMP loc_0E_DB03                 ;C - - - - - 0x01DAD2 0E:DAC2: 4C 03 DB
loc_0E_DAC5:
	JSR ApplyVelXAdd                ;C - - - - - 0x01DAD5 0E:DAC5: 20 83 F1
	JMP loc_0E_DB03                 ;C - - - - - 0x01DAD8 0E:DAC8: 4C 03 DB
loc_0E_DACB:
	JMP loc_0E_DBD4                 ;C - - - - - 0x01DADB 0E:DACB: 4C D4 DB
loc_0E_DACE:
	LDA objActive                   ;C - - - - - 0x01DADE 0E:DACE: AD 00 03
	AND #$0F                        ;C - - - - - 0x01DAE1 0E:DAD1: 29 0F
	CMP #$02                        ;C - - - - - 0x01DAE3 0E:DAD3: C9 02
	BEQ loc_0E_DB03                 ;C - - - - - 0x01DAE5 0E:DAD5: F0 2C
	CMP #$04                        ;C - - - - - 0x01DAE7 0E:DAD7: C9 04
	BEQ loc_0E_DACB                 ;C - - - - - 0x01DAE9 0E:DAD9: F0 F0
	LDA objX                        ;C - - - - - 0x01DAEB 0E:DADB: AD 60 03
	SEC                             ;C - - - - - 0x01DAEE 0E:DADE: 38
	SBC scrollX                     ;C - - - - - 0x01DAEF 0E:DADF: E5 FC
	STA ptr_00                      ;C - - - - - 0x01DAF1 0E:DAE1: 85 00
	LDA ptr_00                      ;C - - - - - 0x01DAF3 0E:DAE3: A5 00
	CMP #$18                        ;C - - - - - 0x01DAF5 0E:DAE5: C9 18
	BEQ loc_0E_DAFA                 ;C - - - - - 0x01DAF7 0E:DAE7: F0 11
	BCS loc_0E_DB00                 ;C - - - - - 0x01DAF9 0E:DAE9: B0 15
	LDA scrollX                     ;C - - - - - 0x01DAFB 0E:DAEB: A5 FC
	CLC                             ;C - - - - - 0x01DAFD 0E:DAED: 18
	ADC #$19                        ;C - - - - - 0x01DAFE 0E:DAEE: 69 19
	STA objX                        ;C - - - - - 0x01DB00 0E:DAF0: 8D 60 03
	LDA worldXPage                  ;C - - - - - 0x01DB03 0E:DAF3: A5 2D
	ADC #$00                        ;C - - - - - 0x01DB05 0E:DAF5: 69 00
	STA objXPage                    ;C - - - - - 0x01DB07 0E:DAF7: 8D 80 03
loc_0E_DAFA:
	INC objActive                   ;C - - - - - 0x01DB0A 0E:DAFA: EE 00 03
	JMP loc_0E_DB03                 ;C - - - - - 0x01DB0D 0E:DAFD: 4C 03 DB
loc_0E_DB00:
	JSR ApplyVelXSub                ;C - - - - - 0x01DB10 0E:DB00: 20 A1 F1
loc_0E_DB03:
	LDY #$04                        ;C - - - - - 0x01DB13 0E:DB03: A0 04
	JSR MoveYGravityCheck           ;C - - - - - 0x01DB15 0E:DB05: 20 19 F1
	BCC loc_0E_DB0D                 ;C - - - - - 0x01DB18 0E:DB08: 90 03
	JMP loc_0E_DB2C                 ;C - - - - - 0x01DB1A 0E:DB0A: 4C 2C DB
loc_0E_DB0D:
	LDA objVelYHi                   ;C - - - - - 0x01DB1D 0E:DB0D: AD 30 04
	BPL loc_0E_DB6B                 ;C - - - - - 0x01DB20 0E:DB10: 10 59
	LDA objY                        ;C - - - - - 0x01DB22 0E:DB12: AD C0 03
	CLC                             ;C - - - - - 0x01DB25 0E:DB15: 18
	ADC #$02                        ;C - - - - - 0x01DB26 0E:DB16: 69 02
	CMP playerGroundY               ;C - - - - - 0x01DB28 0E:DB18: C5 36
	BCC loc_0E_DB6B                 ;C - - - - - 0x01DB2A 0E:DB1A: 90 4F
	BEQ loc_0E_DB29                 ;C - - - - - 0x01DB2C 0E:DB1C: F0 0B
	SBC #$03                        ;C - - - - - 0x01DB2E 0E:DB1E: E9 03
	STA objY                        ;C - - - - - 0x01DB30 0E:DB20: 8D C0 03
	JSR ClampPlayerGroundY          ;C - - - - - 0x01DB33 0E:DB23: 20 29 DC
	JMP loc_0E_DB2C                 ;C - - - - - 0x01DB36 0E:DB26: 4C 2C DB
loc_0E_DB29:
	JSR ClampPlayerGroundY          ;C - - - - - 0x01DB39 0E:DB29: 20 29 DC
loc_0E_DB2C:
	INC objActive                   ;C - - - - - 0x01DB3C 0E:DB2C: EE 00 03
	LDA ram_005C                    ;C - - - - - 0x01DB3F 0E:DB2F: A5 5C
	BMI loc_0E_DB49                 ;C - - - - - 0x01DB41 0E:DB31: 30 16
	LDA #$80                        ;C - - - - - 0x01DB43 0E:DB33: A9 80
	STA objVelXLo                   ;C - - - - - 0x01DB45 0E:DB35: 8D 00 04
	LDA #$00                        ;C - - - - - 0x01DB48 0E:DB38: A9 00
	STA objVelXHi                   ;C - - - - - 0x01DB4A 0E:DB3A: 8D 10 04
	LDA #$6E                        ;C - - - - - 0x01DB4D 0E:DB3D: A9 6E
	STA objVelYLo                   ;C - - - - - 0x01DB4F 0E:DB3F: 8D 20 04
	LDA #$01                        ;C - - - - - 0x01DB52 0E:DB42: A9 01
	STA objVelYHi                   ;C - - - - - 0x01DB54 0E:DB44: 8D 30 04
	BNE loc_0E_DB5D                 ;C - - - - - 0x01DB57 0E:DB47: D0 14
loc_0E_DB49:
	LDA #$00                        ;C - - - - - 0x01DB59 0E:DB49: A9 00
	STA objVelXLo                   ;C - - - - - 0x01DB5B 0E:DB4B: 8D 00 04
	LDA #$01                        ;C - - - - - 0x01DB5E 0E:DB4E: A9 01
	STA objVelXHi                   ;C - - - - - 0x01DB60 0E:DB50: 8D 10 04
	LDA #$6E                        ;C - - - - - 0x01DB63 0E:DB53: A9 6E
	STA objVelYLo                   ;C - - - - - 0x01DB65 0E:DB55: 8D 20 04
	LDA #$01                        ;C - - - - - 0x01DB68 0E:DB58: A9 01
	STA objVelYHi                   ;C - - - - - 0x01DB6A 0E:DB5A: 8D 30 04
loc_0E_DB5D:
	LDY playerId                    ;C - - - - - 0x01DB6D 0E:DB5D: A4 34
	LDA PlayerRow_E20D,Y            ;C - - - - - 0x01DB6F 0E:DB5F: B9 0D E2
	JSR SetPlayerAnim               ;C - - - - - 0x01DB72 0E:DB62: 20 94 F2
	LDA PlayerRow_E255,Y            ;C - - - - - 0x01DB75 0E:DB65: B9 55 E2
	JSR SetChrBank2                 ;C - - - - - 0x01DB78 0E:DB68: 20 40 F4
loc_0E_DB6B:
	RTS                             ;C - - - - - 0x01DB7B 0E:DB6B: 60
loc_0E_DB6C:
	LDA objFacing                   ;C - - - - - 0x01DB7C 0E:DB6C: AD 60 04
	AND #$01                        ;C - - - - - 0x01DB7F 0E:DB6F: 29 01
	BEQ loc_0E_DBA3                 ;C - - - - - 0x01DB81 0E:DB71: F0 30
	LDA objActive                   ;C - - - - - 0x01DB83 0E:DB73: AD 00 03
	AND #$0F                        ;C - - - - - 0x01DB86 0E:DB76: 29 0F
	CMP #$04                        ;C - - - - - 0x01DB88 0E:DB78: C9 04
	BEQ loc_0E_DB9A                 ;C - - - - - 0x01DB8A 0E:DB7A: F0 1E
	LDA objX                        ;C - - - - - 0x01DB8C 0E:DB7C: AD 60 03
	SEC                             ;C - - - - - 0x01DB8F 0E:DB7F: 38
	SBC scrollX                     ;C - - - - - 0x01DB90 0E:DB80: E5 FC
	CMP #$E8                        ;C - - - - - 0x01DB92 0E:DB82: C9 E8
	BEQ loc_0E_DB97                 ;C - - - - - 0x01DB94 0E:DB84: F0 11
	BCC loc_0E_DB9D                 ;C - - - - - 0x01DB96 0E:DB86: 90 15
	LDA scrollX                     ;C - - - - - 0x01DB98 0E:DB88: A5 FC
	CLC                             ;C - - - - - 0x01DB9A 0E:DB8A: 18
	ADC #$E9                        ;C - - - - - 0x01DB9B 0E:DB8B: 69 E9
	STA objX                        ;C - - - - - 0x01DB9D 0E:DB8D: 8D 60 03
	LDA worldXPage                  ;C - - - - - 0x01DBA0 0E:DB90: A5 2D
	ADC #$00                        ;C - - - - - 0x01DBA2 0E:DB92: 69 00
	STA objXPage                    ;C - - - - - 0x01DBA4 0E:DB94: 8D 80 03
loc_0E_DB97:
	INC objActive                   ;C - - - - - 0x01DBA7 0E:DB97: EE 00 03
loc_0E_DB9A:
	JMP loc_0E_DBFD                 ;C - - - - - 0x01DBAA 0E:DB9A: 4C FD DB
loc_0E_DB9D:
	JSR ApplyVelXAdd                ;C - - - - - 0x01DBAD 0E:DB9D: 20 83 F1
	JMP loc_0E_DBD4                 ;C - - - - - 0x01DBB0 0E:DBA0: 4C D4 DB
loc_0E_DBA3:
	LDA objActive                   ;C - - - - - 0x01DBB3 0E:DBA3: AD 00 03
	AND #$0F                        ;C - - - - - 0x01DBB6 0E:DBA6: 29 0F
	CMP #$04                        ;C - - - - - 0x01DBB8 0E:DBA8: C9 04
	BEQ loc_0E_DBCE                 ;C - - - - - 0x01DBBA 0E:DBAA: F0 22
	LDA objX                        ;C - - - - - 0x01DBBC 0E:DBAC: AD 60 03
	SEC                             ;C - - - - - 0x01DBBF 0E:DBAF: 38
	SBC scrollX                     ;C - - - - - 0x01DBC0 0E:DBB0: E5 FC
	STA ptr_00                      ;C - - - - - 0x01DBC2 0E:DBB2: 85 00
	LDA ptr_00                      ;C - - - - - 0x01DBC4 0E:DBB4: A5 00
	CMP #$18                        ;C - - - - - 0x01DBC6 0E:DBB6: C9 18
	BEQ loc_0E_DBCB                 ;C - - - - - 0x01DBC8 0E:DBB8: F0 11
	BCS loc_0E_DBD1                 ;C - - - - - 0x01DBCA 0E:DBBA: B0 15
	LDA scrollX                     ;c - - - - - 0x01DBCC 0E:DBBC: A5 FC
	CLC                             ;c - - - - - 0x01DBCE 0E:DBBE: 18
	ADC #$19                        ;c - - - - - 0x01DBCF 0E:DBBF: 69 19
	STA objX                        ;c - - - - - 0x01DBD1 0E:DBC1: 8D 60 03
	LDA worldXPage                  ;c - - - - - 0x01DBD4 0E:DBC4: A5 2D
	ADC #$00                        ;c - - - - - 0x01DBD6 0E:DBC6: 69 00
	STA objXPage                    ;c - - - - - 0x01DBD8 0E:DBC8: 8D 80 03
loc_0E_DBCB:
	INC objActive,X                 ;C - - - - - 0x01DBDB 0E:DBCB: FE 00 03
loc_0E_DBCE:
	JMP loc_0E_DBD4                 ;C - - - - - 0x01DBDE 0E:DBCE: 4C D4 DB
loc_0E_DBD1:
	JSR ApplyVelXSub                ;C - - - - - 0x01DBE1 0E:DBD1: 20 A1 F1
loc_0E_DBD4:
	LDY #$04                        ;C - - - - - 0x01DBE4 0E:DBD4: A0 04
	JSR MoveYGravityCheck           ;C - - - - - 0x01DBE6 0E:DBD6: 20 19 F1
	BCC loc_0E_DBDE                 ;C - - - - - 0x01DBE9 0E:DBD9: 90 03
	JMP loc_0E_DBFD                 ;C - - - - - 0x01DBEB 0E:DBDB: 4C FD DB
loc_0E_DBDE:
	LDA objVelYHi                   ;C - - - - - 0x01DBEE 0E:DBDE: AD 30 04
	BPL loc_0E_DC28                 ;C - - - - - 0x01DBF1 0E:DBE1: 10 45
	LDA objY                        ;C - - - - - 0x01DBF3 0E:DBE3: AD C0 03
	CLC                             ;C - - - - - 0x01DBF6 0E:DBE6: 18
	ADC #$02                        ;C - - - - - 0x01DBF7 0E:DBE7: 69 02
	CMP playerGroundY               ;C - - - - - 0x01DBF9 0E:DBE9: C5 36
	BCC loc_0E_DC28                 ;C - - - - - 0x01DBFB 0E:DBEB: 90 3B
	BEQ loc_0E_DBFA                 ;C - - - - - 0x01DBFD 0E:DBED: F0 0B
	SBC #$03                        ;C - - - - - 0x01DBFF 0E:DBEF: E9 03
	STA objY                        ;C - - - - - 0x01DC01 0E:DBF1: 8D C0 03
	JSR ClampPlayerGroundY          ;C - - - - - 0x01DC04 0E:DBF4: 20 29 DC
	JMP loc_0E_DBFD                 ;C - - - - - 0x01DC07 0E:DBF7: 4C FD DB
loc_0E_DBFA:
	JSR ClampPlayerGroundY          ;C - - - - - 0x01DC0A 0E:DBFA: 20 29 DC
loc_0E_DBFD:
	LDY playerId                    ;C - - - - - 0x01DC0D 0E:DBFD: A4 34
	LDA PlayerRow_E20D,Y            ;C - - - - - 0x01DC0F 0E:DBFF: B9 0D E2
	JSR SetPlayerAnim               ;C - - - - - 0x01DC12 0E:DC02: 20 94 F2
	LDA PlayerRow_E255,Y            ;C - - - - - 0x01DC15 0E:DC05: B9 55 E2
	JSR SetChrBank2                 ;C - - - - - 0x01DC18 0E:DC08: 20 40 F4
	LDA #$3C                        ;C - - - - - 0x01DC1B 0E:DC0B: A9 3C
	STA actionTimer                 ;C - - - - - 0x01DC1D 0E:DC0D: 85 37
	LDA #$1F                        ;C - - - - - 0x01DC1F 0E:DC0F: A9 1F
	STA gameAction                  ;C - - - - - 0x01DC21 0E:DC11: 85 30
	LDA #$80                        ;C - - - - - 0x01DC23 0E:DC13: A9 80
	STA objActive                   ;C - - - - - 0x01DC25 0E:DC15: 8D 00 03
	LDA #$00                        ;C - - - - - 0x01DC28 0E:DC18: A9 00
	STA objStep                     ;C - - - - - 0x01DC2A 0E:DC1A: 8D 00 05
	STA timerA4                     ;C - - - - - 0x01DC2D 0E:DC1D: 85 A4
	STA jumpBaseY                   ;C - - - - - 0x01DC2F 0E:DC1F: 85 A6
	LDA playerFacing                ;C - - - - - 0x01DC31 0E:DC21: A5 31
	STA ram_0032                    ;C - - - - - 0x01DC33 0E:DC23: 85 32
	JSR ClampPlayerGroundY          ;C - - - - - 0x01DC35 0E:DC25: 20 29 DC
loc_0E_DC28:
	RTS                             ;C - - - - - 0x01DC38 0E:DC28: 60
ClampPlayerGroundY:
	LDY stage                       ;C - - - - - 0x01DC39 0E:DC29: A4 61
	LDA ClampPlayerGroundYTbl_DC59,Y;C - - - - - 0x01DC3B 0E:DC2B: B9 59 DC
	STA ptr_04                      ;C - - - - - 0x01DC3E 0E:DC2E: 85 04
	LDA ClampPlayerGroundYTbl_DC5E,Y;C - - - - - 0x01DC40 0E:DC30: B9 5E DC
	STA ptr_04+1                    ;C - - - - - 0x01DC43 0E:DC33: 85 05
	LDY stageSection                ;C - - - - - 0x01DC45 0E:DC35: A4 60
	LDA objY                        ;C - - - - - 0x01DC47 0E:DC37: AD C0 03
	CMP (ptr_04),Y                  ;C - - - - - 0x01DC4A 0E:DC3A: D1 04
	BEQ loc_0E_DC40                 ;C - - - - - 0x01DC4C 0E:DC3C: F0 02
	BCS loc_0E_DC58                 ;C - - - - - 0x01DC4E 0E:DC3E: B0 18
loc_0E_DC40:
	LDA (ptr_04),Y                  ;C - - - - - 0x01DC50 0E:DC40: B1 04
	STA objY                        ;C - - - - - 0x01DC52 0E:DC42: 8D C0 03
	STA playerGroundY               ;C - - - - - 0x01DC55 0E:DC45: 85 36
	LDA playerId                    ;C - - - - - 0x01DC57 0E:DC47: A5 34
	CMP #$02                        ;C - - - - - 0x01DC59 0E:DC49: C9 02
	BNE loc_0E_DC58                 ;C - - - - - 0x01DC5B 0E:DC4B: D0 0B
	LDA objY                        ;C - - - - - 0x01DC5D 0E:DC4D: AD C0 03
	CLC                             ;C - - - - - 0x01DC60 0E:DC50: 18
	ADC #$02                        ;C - - - - - 0x01DC61 0E:DC51: 69 02
	STA objY                        ;C - - - - - 0x01DC63 0E:DC53: 8D C0 03
	STA playerGroundY               ;C - - - - - 0x01DC66 0E:DC56: 85 36
loc_0E_DC58:
	RTS                             ;C - - - - - 0x01DC68 0E:DC58: 60
ClampPlayerGroundYTbl_DC59:
	.lobytes ClampPlayerGroundYTbl_DC59_00, ClampPlayerGroundYTbl_DC59_01, ClampPlayerGroundYTbl_DC59_02, ClampPlayerGroundYTbl_DC59_00, ClampPlayerGroundYTbl_DC59_02;- D 2 - - - 0x01DC69 0E:DC59:
ClampPlayerGroundYTbl_DC5E:
	.hibytes ClampPlayerGroundYTbl_DC59_00, ClampPlayerGroundYTbl_DC59_01, ClampPlayerGroundYTbl_DC59_02, ClampPlayerGroundYTbl_DC59_00, ClampPlayerGroundYTbl_DC59_02;- D 2 - - - 0x01DC6E 0E:DC5E:
ClampPlayerGroundYTbl_DC59_00:
	.byte $82,$72,$82               ;- D 2 - I - 0x01DC73 0E:DC63:
ClampPlayerGroundYTbl_DC59_01:
	.byte $82,$92,$82               ;- D 2 - I - 0x01DC76 0E:DC66:
ClampPlayerGroundYTbl_DC59_02:
	.byte $82,$82,$82               ;- D 2 - I - 0x01DC79 0E:DC69:
Act09_Continue:
	LDA #$00                        ;C - - - - - 0x01DC7C 0E:DC6C: A9 00
	STA renderOffCount              ;C - - - - - 0x01DC7E 0E:DC6E: 85 EE
	LDA #$F2                        ;C - - - - - 0x01DC80 0E:DC70: A9 F2
	JSR QueueSoundSaved             ;C - - - - - 0x01DC82 0E:DC72: 20 4A F3
	JSR FadeOutPalette              ;C - - - - - 0x01DC85 0E:DC75: 20 6E C3
	JSR WaitFrame                   ;C - - - - - 0x01DC88 0E:DC78: 20 31 FF
	LDA #$00                        ;C - - - - - 0x01DC8B 0E:DC7B: A9 00
	STA scrollX                     ;C - - - - - 0x01DC8D 0E:DC7D: 85 FC
	STA scrollY                     ;C - - - - - 0x01DC8F 0E:DC7F: 85 FA
	STA nametableSelect             ;C - - - - - 0x01DC91 0E:DC81: 85 FD
	STA ram_00FB                    ;C - - - - - 0x01DC93 0E:DC83: 85 FB
	STA scrollXPage                 ;C - - - - - 0x01DC95 0E:DC85: 85 F9
	JSR ScreenOff                   ;C - - - - - 0x01DC97 0E:DC87: 20 65 C2
	LDA #$04                        ;C - - - - - 0x01DC9A 0E:DC8A: A9 04
	STA oamHideStart                ;C - - - - - 0x01DC9C 0E:DC8C: 85 97
	JSR HideSprites                 ;C - - - - - 0x01DC9E 0E:DC8E: 20 1D C3
	JSR ClearObjects                ;C - - - - - 0x01DCA1 0E:DC91: 20 34 C3
	LDA #$20                        ;C - - - - - 0x01DCA4 0E:DC94: A9 20
	LDX #$00                        ;C - - - - - 0x01DCA6 0E:DC96: A2 00
	LDY #$00                        ;C - - - - - 0x01DCA8 0E:DC98: A0 00
	JSR FillNametable               ;C - - - - - 0x01DCAA 0E:DC9A: 20 D1 C2
	JSR HideSprites                 ;C - - - - - 0x01DCAD 0E:DC9D: 20 1D C3
	LDX #$04                        ;C - - - - - 0x01DCB0 0E:DCA0: A2 04
	STX prgBank8000                 ;C - - - - - 0x01DCB2 0E:DCA2: 86 F4
	INX                             ;C - - - - - 0x01DCB4 0E:DCA4: E8
	STX prgBankA000                 ;C - - - - - 0x01DCB5 0E:DCA5: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DCB7 0E:DCA7: 20 4D FF
	LDA credits                     ;C - - - - - 0x01DCBA 0E:DCAA: A5 AF
	BEQ loc_0E_DCD1                 ;C - - - - - 0x01DCBC 0E:DCAC: F0 23
	LDX #$03                        ;C - - - - - 0x01DCBE 0E:DCAE: A2 03
	JSR QueueVramScript             ;C - - - - - bank=04 0x01DCC0 0E:DCB0: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01DCC3 0E:DCB3: 20 6F C2
	JSR ScreenInit9300              ;C - - - - - bank=04 0x01DCC6 0E:DCB6: 20 00 93
	LDA gameAction                  ;C - - - - - 0x01DCC9 0E:DCB9: A5 30
	CMP #$07                        ;C - - - - - 0x01DCCB 0E:DCBB: C9 07
	BNE loc_0E_DCC0                 ;C - - - - - 0x01DCCD 0E:DCBD: D0 01
	RTS                             ;C - - - - - 0x01DCCF 0E:DCBF: 60
loc_0E_DCC0:
	LDA #$00                        ;C - - - - - 0x01DCD0 0E:DCC0: A9 00
	STA renderOffCount              ;C - - - - - 0x01DCD2 0E:DCC2: 85 EE
	JSR FadeAndClearScreen          ;C - - - - - 0x01DCD4 0E:DCC4: 20 5C C8
	LDX #$04                        ;C - - - - - 0x01DCD7 0E:DCC7: A2 04
	STX prgBank8000                 ;C - - - - - 0x01DCD9 0E:DCC9: 86 F4
	INX                             ;C - - - - - 0x01DCDB 0E:DCCB: E8
	STX prgBankA000                 ;C - - - - - 0x01DCDC 0E:DCCC: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DCDE 0E:DCCE: 20 4D FF
loc_0E_DCD1:
	LDX #$05                        ;C - - - - - 0x01DCE1 0E:DCD1: A2 05
	JSR QueueVramScript             ;C - - - - - bank=04 0x01DCE3 0E:DCD3: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01DCE6 0E:DCD6: 20 6F C2
	JSR ScreenInit9500              ;C - - - - - bank=04 0x01DCE9 0E:DCD9: 20 00 95
	RTS                             ;c - - - - - 0x01DCEC 0E:DCDC: 60
; health<0: blink, then lives-- ; no lives left -> gameAction 9 (continue)
Act0B_Death:
	LDA playerHealth                ;C - - J - - 0x01DCED 0E:DCDD: A5 3A
	BMI loc_0E_DD2D                 ;C - - - - - 0x01DCEF 0E:DCDF: 30 4C
	LDA #$00                        ;C - - - - - 0x01DCF1 0E:DCE1: A9 00
	STA timerA3                     ;C - - - - - 0x01DCF3 0E:DCE3: 85 A3
	DEC actionTimer                 ;C - - - - - 0x01DCF5 0E:DCE5: C6 37
	LDA actionTimer                 ;C - - - - - 0x01DCF7 0E:DCE7: A5 37
	BMI loc_0E_DCF0                 ;C - - - - - 0x01DCF9 0E:DCE9: 30 05
	CMP #$01                        ;C - - - - - 0x01DCFB 0E:DCEB: C9 01
	BCC loc_0E_DCF0                 ;C - - - - - 0x01DCFD 0E:DCED: 90 01
	RTS                             ;C - - - - - 0x01DCFF 0E:DCEF: 60
loc_0E_DCF0:
	LDA #$00                        ;C - - - - - 0x01DD00 0E:DCF0: A9 00
	STA gameAction                  ;C - - - - - 0x01DD02 0E:DCF2: 85 30
	STA actionStep                  ;C - - - - - 0x01DD04 0E:DCF4: 85 35
	STA timerA4                     ;C - - - - - 0x01DD06 0E:DCF6: 85 A4
	STA timerA3                     ;C - - - - - 0x01DD08 0E:DCF8: 85 A3
	STA ram_00B3                    ;C - - - - - 0x01DD0A 0E:DCFA: 85 B3
	STA ram_00BA                    ;C - - - - - 0x01DD0C 0E:DCFC: 85 BA
	STA objStep                     ;C - - - - - 0x01DD0E 0E:DCFE: 8D 00 05
	STA objParamA                   ;C - - - - - 0x01DD11 0E:DD01: 8D 10 05
	JSR ResetPlayerStand            ;C - - - - - 0x01DD14 0E:DD04: 20 AA CE
	LDA playerId                    ;C - - - - - 0x01DD17 0E:DD07: A5 34
	CMP #$01                        ;C - - - - - 0x01DD19 0E:DD09: C9 01
	BEQ loc_0E_DD25                 ;C - - - - - 0x01DD1B 0E:DD0B: F0 18
	CMP #$02                        ;C - - - - - 0x01DD1D 0E:DD0D: C9 02
	BEQ loc_0E_DD25                 ;C - - - - - 0x01DD1F 0E:DD0F: F0 14
	LDA playerFacing                ;C - - - - - 0x01DD21 0E:DD11: A5 31
	AND #$01                        ;C - - - - - 0x01DD23 0E:DD13: 29 01
	BEQ loc_0E_DD1C                 ;C - - - - - 0x01DD25 0E:DD15: F0 05
	JSR ClearPlayerFlag40           ;C - - - - - 0x01DD27 0E:DD17: 20 48 F0
	BNE loc_0E_DD1F                 ;C - - - - - 0x01DD2A 0E:DD1A: D0 03
loc_0E_DD1C:
	JSR SetPlayerFlag40             ;C - - - - - 0x01DD2C 0E:DD1C: 20 3F F0
loc_0E_DD1F:
	LDA playerFacing                ;C - - - - - 0x01DD2F 0E:DD1F: A5 31
	EOR #$03                        ;C - - - - - 0x01DD31 0E:DD21: 49 03
	STA playerFacing                ;C - - - - - 0x01DD33 0E:DD23: 85 31
loc_0E_DD25:
	LDY playerId                    ;C - - - - - 0x01DD35 0E:DD25: A4 34
	LDA PlayerRow_E288,Y            ;C - - - - - 0x01DD37 0E:DD27: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x01DD3A 0E:DD2A: 85 6F
	RTS                             ;C - - - - - 0x01DD3C 0E:DD2C: 60
loc_0E_DD2D:
	LDA actionTimer                 ;C - - - - - 0x01DD3D 0E:DD2D: A5 37
	BEQ loc_0E_DD4A                 ;C - - - - - 0x01DD3F 0E:DD2F: F0 19
	AND #$01                        ;C - - - - - 0x01DD41 0E:DD31: 29 01
	BNE loc_0E_DD3F                 ;C - - - - - 0x01DD43 0E:DD33: D0 0A
	LDA objFlags                    ;C - - - - - 0x01DD45 0E:DD35: AD 60 05
	ORA #$04                        ;C - - - - - 0x01DD48 0E:DD38: 09 04
	STA objFlags                    ;C - - - - - 0x01DD4A 0E:DD3A: 8D 60 05
	BNE loc_0E_DD47                 ;C - - - - - 0x01DD4D 0E:DD3D: D0 08
loc_0E_DD3F:
	LDA objFlags                    ;C - - - - - 0x01DD4F 0E:DD3F: AD 60 05
	AND #$FB                        ;C - - - - - 0x01DD52 0E:DD42: 29 FB
	STA objFlags                    ;C - - - - - 0x01DD54 0E:DD44: 8D 60 05
loc_0E_DD47:
	DEC actionTimer                 ;C - - - - - 0x01DD57 0E:DD47: C6 37
	RTS                             ;C - - - - - 0x01DD59 0E:DD49: 60
loc_0E_DD4A:
	LDA #$80                        ;C - - - - - 0x01DD5A 0E:DD4A: A9 80
	STA objActive                   ;C - - - - - 0x01DD5C 0E:DD4C: 8D 00 03
; GG SZKSNIVG infinite lives: DEC lives
	DEC lives                       ;C - - - - - 0x01DD5F 0E:DD4F: C6 3E
	LDA lives                       ;C - - - - - 0x01DD61 0E:DD51: A5 3E
	BPL loc_0E_DD65                 ;C - - - - - 0x01DD63 0E:DD53: 10 10
	LDA #$00                        ;C - - - - - 0x01DD65 0E:DD55: A9 00
	STA gameOverFlag                ;C - - - - - 0x01DD67 0E:DD57: 85 62
	LDA #$32                        ;C - - - - - 0x01DD69 0E:DD59: A9 32
	JSR QueueSound                  ;C - - - - - 0x01DD6B 0E:DD5B: 20 4C F3
	LDA #$09                        ;C - - - - - 0x01DD6E 0E:DD5E: A9 09
	STA gameAction                  ;C - - - - - 0x01DD70 0E:DD60: 85 30
	JMP Act09_Continue              ;C - - - - - 0x01DD72 0E:DD62: 4C 6C DC
loc_0E_DD65:
	LDA #$25                        ;C - - - - - 0x01DD75 0E:DD65: A9 25
	STA gameAction                  ;C - - - - - 0x01DD77 0E:DD67: 85 30
	RTS                             ;C - - - - - 0x01DD79 0E:DD69: 60
; per-character handler via table
Act0C:
	LDY playerId                    ;C - - - - - 0x01DD7A 0E:DD6A: A4 34
	LDA Act0CTbl_DD79,Y             ;C - - - - - 0x01DD7C 0E:DD6C: B9 79 DD
	STA ptr_04                      ;C - - - - - 0x01DD7F 0E:DD6F: 85 04
	LDA Act0CTbl_DD7C,Y             ;C - - - - - 0x01DD81 0E:DD71: B9 7C DD
	STA ptr_04+1                    ;C - - - - - 0x01DD84 0E:DD74: 85 05
	JMP (ptr_04)                    ;C - - - - - 0x01DD86 0E:DD76: 6C 04 00
Act0CTbl_DD79:
	.lobytes Act0CTbl_DD79_00, Act0CTbl_DD79_01, Act0CTbl_DD79_02;- D 2 - - - 0x01DD89 0E:DD79:
Act0CTbl_DD7C:
	.hibytes Act0CTbl_DD79_00, Act0CTbl_DD79_01, Act0CTbl_DD79_02;- D 2 - - - 0x01DD8C 0E:DD7C:
Act0CTbl_DD79_00:
	LDA padPressed                  ;C - - J - - 0x01DD8F 0E:DD7F: A5 14
	AND #$40                        ;C - - - - - 0x01DD91 0E:DD81: 29 40
	BEQ loc_0E_DDA8                 ;C - - - - - 0x01DD93 0E:DD83: F0 23
	LDA timerA3                     ;C - - - - - 0x01DD95 0E:DD85: A5 A3
	BNE loc_0E_DDC1                 ;C - - - - - 0x01DD97 0E:DD87: D0 38
	LDA #$03                        ;C - - - - - 0x01DD99 0E:DD89: A9 03
	STA gameAction                  ;C - - - - - 0x01DD9B 0E:DD8B: 85 30
	RTS                             ;C - - - - - 0x01DD9D 0E:DD8D: 60
loc_0E_DD8E:
	LDA objAnim                     ;C - - - - - 0x01DD9E 0E:DD8E: AD 80 05
	CMP #$45                        ;C - - - - - 0x01DDA1 0E:DD91: C9 45
	BEQ loc_0E_DD9D                 ;C - - - - - 0x01DDA3 0E:DD93: F0 08
	LDA playerStandAnim             ;C - - - - - 0x01DDA5 0E:DD95: A5 6F
	CMP #$16                        ;C - - - - - 0x01DDA7 0E:DD97: C9 16
	BEQ loc_0E_DD9D                 ;C - - - - - 0x01DDA9 0E:DD99: F0 02
	BNE loc_0E_DDC4                 ;C - - - - - 0x01DDAB 0E:DD9B: D0 27
loc_0E_DD9D:
	LDA #$01                        ;C - - - - - 0x01DDAD 0E:DD9D: A9 01
	STA objAnimFrame                ;C - - - - - 0x01DDAF 0E:DD9F: 8D 70 05
	LDA #$00                        ;C - - - - - 0x01DDB2 0E:DDA2: A9 00
	STA objAnimFlags                ;C - - - - - 0x01DDB4 0E:DDA4: 8D 90 05
	RTS                             ;C - - - - - 0x01DDB7 0E:DDA7: 60
loc_0E_DDA8:
	LDA actionTimer                 ;C - - - - - 0x01DDB8 0E:DDA8: A5 37
	BEQ loc_0E_DDB7                 ;C - - - - - 0x01DDBA 0E:DDAA: F0 0B
	DEC actionTimer                 ;C - - - - - 0x01DDBC 0E:DDAC: C6 37
	LDA timerA3                     ;C - - - - - 0x01DDBE 0E:DDAE: A5 A3
	BEQ loc_0E_DD8E                 ;C - - - - - 0x01DDC0 0E:DDB0: F0 DC
	DEC timerA3                     ;C - - - - - 0x01DDC2 0E:DDB2: C6 A3
	JMP loc_0E_DD8E                 ;C - - - - - 0x01DDC4 0E:DDB4: 4C 8E DD
loc_0E_DDB7:
	JSR ResetPlayerStand            ;C - - - - - 0x01DDC7 0E:DDB7: 20 AA CE
	LDA #$00                        ;C - - - - - 0x01DDCA 0E:DDBA: A9 00
	STA gameAction                  ;C - - - - - 0x01DDCC 0E:DDBC: 85 30
	STA timerA4                     ;C - - - - - 0x01DDCE 0E:DDBE: 85 A4
	RTS                             ;C - - - - - 0x01DDD0 0E:DDC0: 60
loc_0E_DDC1:
	JMP loc_0E_CB07                 ;C - - - - - 0x01DDD1 0E:DDC1: 4C 07 CB
loc_0E_DDC4:
	LDA timerA3                     ;C - - - - - 0x01DDD4 0E:DDC4: A5 A3
	BEQ loc_0E_DDB7                 ;C - - - - - 0x01DDD6 0E:DDC6: F0 EF
	LDA #$00                        ;C - - - - - 0x01DDD8 0E:DDC8: A9 00
	STA objAnimFrame                ;C - - - - - 0x01DDDA 0E:DDCA: 8D 70 05
	STA objAnimFlags                ;C - - - - - 0x01DDDD 0E:DDCD: 8D 90 05
	STA timerA4                     ;C - - - - - 0x01DDE0 0E:DDD0: 85 A4
	RTS                             ;C - - - - - 0x01DDE2 0E:DDD2: 60
Act0CTbl_DD79_01:
	LDA padPressed                  ;C - - J - - 0x01DDE3 0E:DDD3: A5 14
	AND #$40                        ;C - - - - - 0x01DDE5 0E:DDD5: 29 40
	BEQ loc_0E_DDF0                 ;C - - - - - 0x01DDE7 0E:DDD7: F0 17
	LDA timerA3                     ;C - - - - - 0x01DDE9 0E:DDD9: A5 A3
	BNE loc_0E_DDC1                 ;C - - - - - 0x01DDEB 0E:DDDB: D0 E4
	LDA #$03                        ;C - - - - - 0x01DDED 0E:DDDD: A9 03
	STA gameAction                  ;C - - - - - 0x01DDEF 0E:DDDF: 85 30
	RTS                             ;C - - - - - 0x01DDF1 0E:DDE1: 60
loc_0E_DDE2:
	LDA playerStandAnim             ;C - - - - - 0x01DDF2 0E:DDE2: A5 6F
	CMP #$17                        ;C - - - - - 0x01DDF4 0E:DDE4: C9 17
	BEQ loc_0E_DDEA                 ;C - - - - - 0x01DDF6 0E:DDE6: F0 02
	BNE loc_0E_DDC4                 ;C - - - - - 0x01DDF8 0E:DDE8: D0 DA
loc_0E_DDEA:
	LDA #$0E                        ;C - - - - - 0x01DDFA 0E:DDEA: A9 0E
	JSR SetPlayerAnim               ;C - - - - - 0x01DDFC 0E:DDEC: 20 94 F2
	RTS                             ;C - - - - - 0x01DDFF 0E:DDEF: 60
loc_0E_DDF0:
	LDA actionTimer                 ;C - - - - - 0x01DE00 0E:DDF0: A5 37
	BEQ loc_0E_DDB7                 ;C - - - - - 0x01DE02 0E:DDF2: F0 C3
	DEC actionTimer                 ;C - - - - - 0x01DE04 0E:DDF4: C6 37
	LDA timerA3                     ;C - - - - - 0x01DE06 0E:DDF6: A5 A3
	BEQ loc_0E_DDE2                 ;C - - - - - 0x01DE08 0E:DDF8: F0 E8
	DEC timerA3                     ;C - - - - - 0x01DE0A 0E:DDFA: C6 A3
	JMP loc_0E_DDE2                 ;C - - - - - 0x01DE0C 0E:DDFC: 4C E2 DD
Act0CTbl_DD79_02:
	LDA padPressed                  ;C - - J - - 0x01DE0F 0E:DDFF: A5 14
	AND #$40                        ;C - - - - - 0x01DE11 0E:DE01: 29 40
	BEQ loc_0E_DE21                 ;C - - - - - 0x01DE13 0E:DE03: F0 1C
	LDA timerA3                     ;C - - - - - 0x01DE15 0E:DE05: A5 A3
	BNE loc_0E_DE30                 ;C - - - - - 0x01DE17 0E:DE07: D0 27
	LDA #$03                        ;C - - - - - 0x01DE19 0E:DE09: A9 03
	STA gameAction                  ;C - - - - - 0x01DE1B 0E:DE0B: 85 30
	RTS                             ;C - - - - - 0x01DE1D 0E:DE0D: 60
loc_0E_DE0E:
	LDA playerStandAnim             ;C - - - - - 0x01DE1E 0E:DE0E: A5 6F
	CMP #$18                        ;C - - - - - 0x01DE20 0E:DE10: C9 18
	BEQ loc_0E_DE16                 ;C - - - - - 0x01DE22 0E:DE12: F0 02
	BNE loc_0E_DDC4                 ;C - - - - - 0x01DE24 0E:DE14: D0 AE
loc_0E_DE16:
	LDA #$0F                        ;C - - - - - 0x01DE26 0E:DE16: A9 0F
	JSR SetPlayerAnim               ;C - - - - - 0x01DE28 0E:DE18: 20 94 F2
	LDA #$09                        ;C - - - - - 0x01DE2B 0E:DE1B: A9 09
	JSR SetChrBank2                 ;C - - - - - 0x01DE2D 0E:DE1D: 20 40 F4
	RTS                             ;C - - - - - 0x01DE30 0E:DE20: 60
loc_0E_DE21:
	LDA actionTimer                 ;C - - - - - 0x01DE31 0E:DE21: A5 37
	BEQ loc_0E_DDB7                 ;C - - - - - 0x01DE33 0E:DE23: F0 92
	DEC actionTimer                 ;C - - - - - 0x01DE35 0E:DE25: C6 37
	LDA timerA3                     ;C - - - - - 0x01DE37 0E:DE27: A5 A3
	BEQ loc_0E_DE0E                 ;C - - - - - 0x01DE39 0E:DE29: F0 E3
	DEC timerA3                     ;C - - - - - 0x01DE3B 0E:DE2B: C6 A3
	JMP loc_0E_DE0E                 ;C - - - - - 0x01DE3D 0E:DE2D: 4C 0E DE
loc_0E_DE30:
	JMP loc_0E_CB07                 ;C - - - - - 0x01DE40 0E:DE30: 4C 07 CB
LoadPlayerHealthByLevel:
	LDY playerId                    ;C - - - - - 0x01DE43 0E:DE33: A4 34
	LDA LoadPlayerHealthByLevelTbl_DE46,Y;C - - - - - 0x01DE45 0E:DE35: B9 46 DE
	STA ptr_02                      ;C - - - - - 0x01DE48 0E:DE38: 85 02
	LDA LoadPlayerHealthByLevelTbl_DE49,Y;C - - - - - 0x01DE4A 0E:DE3A: B9 49 DE
	STA ptr_02+1                    ;C - - - - - 0x01DE4D 0E:DE3D: 85 03
	LDY playerLevel                 ;C - - - - - 0x01DE4F 0E:DE3F: A4 6B
	LDA (ptr_02),Y                  ;C - - - - - 0x01DE51 0E:DE41: B1 02
	STA playerHealth                ;C - - - - - 0x01DE53 0E:DE43: 85 3A
	RTS                             ;C - - - - - 0x01DE55 0E:DE45: 60
LoadPlayerHealthByLevelTbl_DE46:
	.lobytes LoadPlayerHealthByLevelTbl_DE46_00, LoadPlayerHealthByLevelTbl_DE46_01, LoadPlayerHealthByLevelTbl_DE46_02;- D 2 - - - 0x01DE56 0E:DE46:
LoadPlayerHealthByLevelTbl_DE49:
	.hibytes LoadPlayerHealthByLevelTbl_DE46_00, LoadPlayerHealthByLevelTbl_DE46_01, LoadPlayerHealthByLevelTbl_DE46_02;- D 2 - - - 0x01DE59 0E:DE49:
LoadPlayerHealthByLevelTbl_DE46_00:
	.byte $40                       ;- D 2 - I - 0x01DE5C 0E:DE4C:
	.byte $48                       ;- - - - - - 0x01DE5D 0E:DE4D:
	.byte $50,$58,$60               ;- D 2 - I - 0x01DE5E 0E:DE4E:
	.byte $68                       ;- - - - - - 0x01DE61 0E:DE51:
LoadPlayerHealthByLevelTbl_DE46_01:
	.byte $30,$38                   ;- D 2 - I - 0x01DE62 0E:DE52:
	.byte $40                       ;- - - - - - 0x01DE64 0E:DE54:
	.byte $48,$50                   ;- D 2 - I - 0x01DE65 0E:DE55:
	.byte $58                       ;- - - - - - 0x01DE67 0E:DE57:
LoadPlayerHealthByLevelTbl_DE46_02:
	.byte $50,$58,$60,$68           ;- D 2 - I - 0x01DE68 0E:DE58:
	.byte $68,$68                   ;- - - - - - 0x01DE6C 0E:DE5C:
; also used for action $0E (skip stage): resets scroll/queues, rebuilds screen
Act07_SelectScreen:
	LDA #$00                        ;C - - J - - 0x01DE6E 0E:DE5E: A9 00
	STA vramQueueEnd                ;C D 2 - I - 0x01DE70 0E:DE60: 85 65
	STA vramQueueFlag               ;C - - - - - 0x01DE72 0E:DE62: 85 64
	STA hudEnemySlot                ;C - - - - - 0x01DE74 0E:DE64: 85 B0
	STA scrollX                     ;C - - - - - 0x01DE76 0E:DE66: 85 FC
	STA scrollY                     ;C - - - - - 0x01DE78 0E:DE68: 85 FA
	STA nametableSelect             ;C - - - - - 0x01DE7A 0E:DE6A: 85 FD
	STA ram_00FB                    ;C - - - - - 0x01DE7C 0E:DE6C: 85 FB
	STA scrollXPage                 ;C - - - - - 0x01DE7E 0E:DE6E: 85 F9
	STA renderOffCount              ;C - - - - - 0x01DE80 0E:DE70: 85 EE
	JSR FadeOutPalette              ;C - - - - - 0x01DE82 0E:DE72: 20 6E C3
	LDA #$04                        ;C - - - - - 0x01DE85 0E:DE75: A9 04
	STA oamHideStart                ;C - - - - - 0x01DE87 0E:DE77: 85 97
	JSR HideSprites                 ;C - - - - - 0x01DE89 0E:DE79: 20 1D C3
	JSR WaitFrame                   ;C - - - - - 0x01DE8C 0E:DE7C: 20 31 FF
	JSR ClearObjects                ;C - - - - - 0x01DE8F 0E:DE7F: 20 34 C3
	LDA gameAction                  ;C - - - - - 0x01DE92 0E:DE82: A5 30
	CMP #$07                        ;C - - - - - 0x01DE94 0E:DE84: C9 07
	BNE loc_0E_DE8B                 ;C - - - - - 0x01DE96 0E:DE86: D0 03
loc_0E_DE88:
	JMP loc_0E_DF50                 ;C - - - - - 0x01DE98 0E:DE88: 4C 50 DF
loc_0E_DE8B:
	INC enemyLevelIdx               ;C - - - - - 0x01DE9B 0E:DE8B: E6 67
	INC stageSection                ;C - - - - - 0x01DE9D 0E:DE8D: E6 60
	LDA stageSection                ;C - - - - - 0x01DE9F 0E:DE8F: A5 60
	CMP #$03                        ;C - - - - - 0x01DEA1 0E:DE91: C9 03
	BCC loc_0E_DE88                 ;C - - - - - 0x01DEA3 0E:DE93: 90 F3
	LDA #$00                        ;C - - - - - 0x01DEA5 0E:DE95: A9 00
	STA stageSection                ;C - - - - - 0x01DEA7 0E:DE97: 85 60
	INC stage                       ;C - - - - - 0x01DEA9 0E:DE99: E6 61
	LDA stage                       ;C - - - - - 0x01DEAB 0E:DE9B: A5 61
	CMP #$05                        ;C - - - - - 0x01DEAD 0E:DE9D: C9 05
	BNE loc_0E_DE88                 ;C - - - - - 0x01DEAF 0E:DE9F: D0 E7
	LDA #$08                        ;C - - - - - 0x01DEB1 0E:DEA1: A9 08
	JSR QueueSoundSaved             ;C - - - - - 0x01DEB3 0E:DEA3: 20 4A F3
	LDA #$FF                        ;C - - - - - 0x01DEB6 0E:DEA6: A9 FF
	STA irqActive                   ;C - - - - - 0x01DEB8 0E:DEA8: 85 98
	STA ram_00B7                    ;C - - - - - 0x01DEBA 0E:DEAA: 85 B7
	CLI                             ;C - - - - - 0x01DEBC 0E:DEAC: 58
	LDA #$00                        ;C - - - - - 0x01DEBD 0E:DEAD: A9 00
	STA irqEnableIdx                ;C - - - - - 0x01DEBF 0E:DEAF: 85 9B
	JSR ClearScreenSetBank04        ;C - - - - - 0x01DEC1 0E:DEB1: 20 A6 C8
	LDX #$06                        ;C - - - - - 0x01DEC4 0E:DEB4: A2 06
	JSR QueueVramScript             ;C - - - - - bank=04 0x01DEC6 0E:DEB6: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01DEC9 0E:DEB9: 20 6F C2
	JSR ScreenInit9000              ;C - - - - - bank=04 0x01DECC 0E:DEBC: 20 00 90  ; call into the switchable $8000 bank (bank depends on stage)
	LDX #$00                        ;C - - - - - 0x01DECF 0E:DEBF: A2 00
	STX prgBank8000                 ;C - - - - - 0x01DED1 0E:DEC1: 86 F4
	INX                             ;C - - - - - 0x01DED3 0E:DEC3: E8
	STX prgBankA000                 ;C - - - - - 0x01DED4 0E:DEC4: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DED6 0E:DEC6: 20 4D FF
	LDA #$05                        ;C - - - - - 0x01DED9 0E:DEC9: A9 05
	STA textScriptIdx               ;C - - - - - 0x01DEDB 0E:DECB: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01DEDD 0E:DECD: 20 00 9A
	LDA #$00                        ;C - - - - - 0x01DEE0 0E:DED0: A9 00
	STA renderOffCount              ;C - - - - - 0x01DEE2 0E:DED2: 85 EE
	JSR FadeOutPalette              ;C - - - - - 0x01DEE4 0E:DED4: 20 6E C3
	LDA #$04                        ;C - - - - - 0x01DEE7 0E:DED7: A9 04
	STA oamHideStart                ;C - - - - - 0x01DEE9 0E:DED9: 85 97
	JSR HideSprites                 ;C - - - - - 0x01DEEB 0E:DEDB: 20 1D C3
	JSR WaitFrame                   ;C - - - - - 0x01DEEE 0E:DEDE: 20 31 FF
	JSR ClearObjects                ;C - - - - - 0x01DEF1 0E:DEE1: 20 34 C3
	JSR ClearScreenSetBank04        ;C - - - - - 0x01DEF4 0E:DEE4: 20 A6 C8
	LDX #$0D                        ;C - - - - - 0x01DEF7 0E:DEE7: A2 0D
	JSR QueueVramScript             ;C - - - - - bank=04 0x01DEF9 0E:DEE9: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01DEFC 0E:DEEC: 20 6F C2
	JSR ScreenInit8C00              ;C - - - - - bank=04 0x01DEFF 0E:DEEF: 20 00 8C
	LDX #$00                        ;C - - - - - 0x01DF02 0E:DEF2: A2 00
	STX prgBank8000                 ;C - - - - - 0x01DF04 0E:DEF4: 86 F4
	INX                             ;C - - - - - 0x01DF06 0E:DEF6: E8
	STX prgBankA000                 ;C - - - - - 0x01DF07 0E:DEF7: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DF09 0E:DEF9: 20 4D FF
	LDA #$06                        ;C - - - - - 0x01DF0C 0E:DEFC: A9 06
	STA textScriptIdx               ;C - - - - - 0x01DF0E 0E:DEFE: 85 B8
	JSR RunTextScript_00            ;C - - - - - bank=00 0x01DF10 0E:DF00: 20 00 9A
	LDA continueUsedFlag            ;C - - - - - 0x01DF13 0E:DF03: AD 50 01
	BNE loc_0E_DF4D                 ;C - - - - - 0x01DF16 0E:DF06: D0 45
	LDA #$00                        ;C - - - - - 0x01DF18 0E:DF08: A9 00
	STA renderOffCount              ;C - - - - - 0x01DF1A 0E:DF0A: 85 EE
	JSR FadeOutPalette              ;C - - - - - 0x01DF1C 0E:DF0C: 20 6E C3
	LDA #$04                        ;C - - - - - 0x01DF1F 0E:DF0F: A9 04
	STA oamHideStart                ;C - - - - - 0x01DF21 0E:DF11: 85 97
	JSR HideSprites                 ;C - - - - - 0x01DF23 0E:DF13: 20 1D C3
	JSR WaitFrame                   ;C - - - - - 0x01DF26 0E:DF16: 20 31 FF
	JSR ClearObjects                ;C - - - - - 0x01DF29 0E:DF19: 20 34 C3
	JSR ClearScreenSetBank04        ;C - - - - - 0x01DF2C 0E:DF1C: 20 A6 C8
	JSR ScreenOn                    ;C - - - - - 0x01DF2F 0E:DF1F: 20 6F C2
	JSR ScreenInit9600              ;C - - - - - bank=04 0x01DF32 0E:DF22: 20 00 96
	LDX #$08                        ;C - - - - - 0x01DF35 0E:DF25: A2 08
	STX prgBank8000                 ;C - - - - - 0x01DF37 0E:DF27: 86 F4
	INX                             ;C - - - - - 0x01DF39 0E:DF29: E8
	STX prgBankA000                 ;C - - - - - 0x01DF3A 0E:DF2A: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DF3C 0E:DF2C: 20 4D FF
	LDA #$00                        ;C - - - - - 0x01DF3F 0E:DF2F: A9 00
	STA textScriptIdx               ;C - - - - - 0x01DF41 0E:DF31: 85 B8
	JSR RunTextScript_09            ;C - - - - - bank=09 0x01DF43 0E:DF33: 20 00 A7
	INC textScriptIdx               ;C - - - - - 0x01DF46 0E:DF36: E6 B8
	JSR RunTextScript_09            ;C - - - - - bank=09 0x01DF48 0E:DF38: 20 00 A7
	INC textScriptIdx               ;C - - - - - 0x01DF4B 0E:DF3B: E6 B8
	JSR RunTextScript_09            ;C - - - - - bank=09 0x01DF4D 0E:DF3D: 20 00 A7
	INC textScriptIdx               ;C - - - - - 0x01DF50 0E:DF40: E6 B8
	JSR RunTextScript_09            ;C - - - - - bank=09 0x01DF52 0E:DF42: 20 00 A7
	INC textScriptIdx               ;C - - - - - 0x01DF55 0E:DF45: E6 B8
	JSR RunTextScript_09            ;C - - - - - bank=09 0x01DF57 0E:DF47: 20 00 A7
	JSR InitEndingPlayerObj         ;C - - - - - bank=09 0x01DF5A 0E:DF4A: 20 00 AB
loc_0E_DF4D:
	JMP loc_0E_C8ED                 ;C - - - - - 0x01DF5D 0E:DF4D: 4C ED C8
loc_0E_DF50:
	LDA gameAction                  ;C - - - - - 0x01DF60 0E:DF50: A5 30
	CMP #$07                        ;C - - - - - 0x01DF62 0E:DF52: C9 07
	BNE loc_0E_DFA4                 ;C - - - - - 0x01DF64 0E:DF54: D0 4E
	LDA #$05                        ;C - - - - - 0x01DF66 0E:DF56: A9 05
	STA lives                       ;C - - - - - 0x01DF68 0E:DF58: 85 3E
	LDA ram_0051                    ;C - - - - - 0x01DF6A 0E:DF5A: A5 51
	STA playerLevel                 ;C - - - - - 0x01DF6C 0E:DF5C: 85 6B
	LDA #$00                        ;C - - - - - 0x01DF6E 0E:DF5E: A9 00
	STA stageSection                ;C - - - - - 0x01DF70 0E:DF60: 85 60
	STA playerExp                   ;C - - - - - 0x01DF72 0E:DF62: 85 6C
	STA playerExp+1                 ;C - - - - - 0x01DF74 0E:DF64: 85 6D
	LDA stage                       ;C - - - - - 0x01DF76 0E:DF66: A5 61
	BNE loc_0E_DF70                 ;C - - - - - 0x01DF78 0E:DF68: D0 06
	LDA #$00                        ;C - - - - - 0x01DF7A 0E:DF6A: A9 00
	STA enemyLevelIdx               ;C - - - - - 0x01DF7C 0E:DF6C: 85 67
	BEQ loc_0E_DF77                 ;C - - - - - 0x01DF7E 0E:DF6E: F0 07
loc_0E_DF70:
	LDY stage                       ;C - - - - - 0x01DF80 0E:DF70: A4 61
	LDA Act07_SelectScreenTbl_E161,Y;C - - - - - 0x01DF82 0E:DF72: B9 61 E1
	STA enemyLevelIdx               ;C - - - - - 0x01DF85 0E:DF75: 85 67
loc_0E_DF77:
	JSR IrqEnableModeFF             ;C - - - - - 0x01DF87 0E:DF77: 20 2F E1
	JSR ClearScreenAndSprites       ;C - - - - - 0x01DF8A 0E:DF7A: 20 5F C8
	LDX #$04                        ;C - - - - - 0x01DF8D 0E:DF7D: A2 04
	STX prgBank8000                 ;C - - - - - 0x01DF8F 0E:DF7F: 86 F4
	INX                             ;C - - - - - 0x01DF91 0E:DF81: E8
	STX prgBankA000                 ;C - - - - - 0x01DF92 0E:DF82: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DF94 0E:DF84: 20 4D FF
	LDX #$02                        ;C - - - - - 0x01DF97 0E:DF87: A2 02
	JSR QueueVramScript             ;C - - - - - bank=04 0x01DF99 0E:DF89: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01DF9C 0E:DF8C: 20 6F C2
	JSR ScreenInit9100              ;C - - - - - bank=04 0x01DF9F 0E:DF8F: 20 00 91
	JSR FadeAndClearScreen          ;C - - - - - 0x01DFA2 0E:DF92: 20 5C C8
	JSR ScreenOn                    ;C - - - - - 0x01DFA5 0E:DF95: 20 6F C2
	JSR ResetScrollState            ;C - - - - - 0x01DFA8 0E:DF98: 20 43 E1
	JSR IrqEnableMode01             ;C - - - - - 0x01DFAB 0E:DF9B: 20 39 E1
	JSR LoadPlayerHealthByLevel     ;C - - - - - 0x01DFAE 0E:DF9E: 20 33 DE
	JMP loc_0E_DFE9                 ;C - - - - - 0x01DFB1 0E:DFA1: 4C E9 DF
loc_0E_DFA4:
	LDA stageSection                ;C - - - - - 0x01DFB4 0E:DFA4: A5 60
	BNE loc_0E_DFE2                 ;C - - - - - 0x01DFB6 0E:DFA6: D0 3A
	LDA playerLevel                 ;C - - - - - 0x01DFB8 0E:DFA8: A5 6B
	STA ram_0051                    ;C - - - - - 0x01DFBA 0E:DFAA: 85 51
	JSR IrqEnableModeFF             ;C - - - - - 0x01DFBC 0E:DFAC: 20 2F E1
	JSR ClearObjects                ;C - - - - - 0x01DFBF 0E:DFAF: 20 34 C3
	JSR ClearScreenAndSprites       ;C - - - - - 0x01DFC2 0E:DFB2: 20 5F C8
	LDX #$04                        ;C - - - - - 0x01DFC5 0E:DFB5: A2 04
	STX prgBank8000                 ;C - - - - - 0x01DFC7 0E:DFB7: 86 F4
	INX                             ;C - - - - - 0x01DFC9 0E:DFB9: E8
	STX prgBankA000                 ;C - - - - - 0x01DFCA 0E:DFBA: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01DFCC 0E:DFBC: 20 4D FF
	LDY stage                       ;C - - - - - 0x01DFCF 0E:DFBF: A4 61
	LDA Act07_SelectScreenTbl_E15C,Y;C - - - - - 0x01DFD1 0E:DFC1: B9 5C E1
	TAX                             ;C - - - - - 0x01DFD4 0E:DFC4: AA
	JSR QueueVramScript             ;C - - - - - bank=04 0x01DFD5 0E:DFC5: 20 00 80
	JSR ScreenOn                    ;C - - - - - 0x01DFD8 0E:DFC8: 20 6F C2
	JSR ScreenInit8D00              ;C - - - - - bank=04 0x01DFDB 0E:DFCB: 20 00 8D
	LDX #$2D                        ;C - - - - - 0x01DFDE 0E:DFCE: A2 2D
	JSR WaitFrames                  ;C - - - - - 0x01DFE0 0E:DFD0: 20 2A FF
	JSR FadeAndClearScreen          ;C - - - - - 0x01DFE3 0E:DFD3: 20 5C C8
	JSR ScreenOn                    ;C - - - - - 0x01DFE6 0E:DFD6: 20 6F C2
	JSR ResetScrollState            ;C - - - - - 0x01DFE9 0E:DFD9: 20 43 E1
	JSR IrqEnableMode01             ;C - - - - - 0x01DFEC 0E:DFDC: 20 39 E1
	JSR LoadPlayerHealthByLevel     ;C - - - - - 0x01DFEF 0E:DFDF: 20 33 DE
loc_0E_DFE2:
	LDY stage                       ;C - - - - - 0x01DFF2 0E:DFE2: A4 61
	LDA Act07_SelectScreenTbl_E166,Y;C - - - - - 0x01DFF4 0E:DFE4: B9 66 E1
	STA stageData                   ;C - - - - - 0x01DFF7 0E:DFE7: 85 22
loc_0E_DFE9:
	LDY stage                       ;C - - - - - 0x01DFF9 0E:DFE9: A4 61
	LDA stageMusicTbl,Y             ;C - - - - - 0x01DFFB 0E:DFEB: B9 3C C8
	CMP soundLast                   ;C - - - - - 0x01DFFE 0E:DFEE: C5 D9
	BEQ loc_0E_DFF5                 ;C - - - - - 0x01E000 0E:DFF0: F0 03
	JSR QueueSoundSaved             ;C - - - - - 0x01E002 0E:DFF2: 20 4A F3
loc_0E_DFF5:
	LDA #$FF                        ;C - - - - - 0x01E005 0E:DFF5: A9 FF
	STA stageScreen                 ;C - - - - - 0x01E007 0E:DFF7: 85 29
	LDA #$1F                        ;C - - - - - 0x01E009 0E:DFF9: A9 1F
	STA stageColumn                 ;C - - - - - 0x01E00B 0E:DFFB: 85 24
loc_0E_DFFD:
	LDA #$01                        ;C - - - - - 0x01E00D 0E:DFFD: A9 01
	.byte $85                       ;C - - - - - 0x01E00F 0E:DFFF: crosses into bank 0F: STA $10 (zp)
