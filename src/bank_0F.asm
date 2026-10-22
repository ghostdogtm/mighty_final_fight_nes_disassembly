.segment "BANK_0F"
; 0x01E010-0x02000F  CPU $E000-$FFFF

	.byte $10                       ;C D 3 - - - 0x01E010 0F:E000: operand of the instruction at 0E:DFFF
	JSR StageScrollUpdate           ;C D 3 - - - 0x01E011 0F:E001: 20 21 E5
	JSR WaitFrame                   ;C - - - - - 0x01E014 0F:E004: 20 31 FF
	LDA ram_0029                    ;C - - - - - 0x01E017 0F:E007: A5 29
	.byte $F0, $F2                  ;C - - - - - BEQ loc_0E_DFFD 0x01E019 0F:E009: (branch to another bank, kept as bytes)
	LDX #$0A                        ;C - - - - - 0x01E01B 0F:E00B: A2 0A
	STX prgBank8000                 ;C - - - - - 0x01E01D 0F:E00D: 86 F4
	INX                             ;C - - - - - 0x01E01F 0F:E00F: E8
	STX prgBankA000                 ;C - - - - - 0x01E020 0F:E010: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01E022 0F:E012: 20 4D FF
	JSR QueueScreenText             ;C - - - - - bank=0A 0x01E025 0F:E015: 20 00 9C
	LDY stage                       ;C - - - - - 0x01E028 0F:E018: A4 61
	LDA stageBankTable,Y            ;C - - - - - 0x01E02A 0F:E01A: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01E02D 0F:E01D: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01E02F 0F:E01F: 20 4D FF
	LDA stageSection                ;C - - - - - 0x01E032 0F:E022: A5 60
	CMP #$01                        ;C - - - - - 0x01E034 0F:E024: C9 01
	BEQ loc_0F_E032                 ;C - - - - - 0x01E036 0F:E026: F0 0A
	CMP #$02                        ;C - - - - - 0x01E038 0F:E028: C9 02
	BEQ loc_0F_E038                 ;C - - - - - 0x01E03A 0F:E02A: F0 0C
	LDA stageField68_s0             ;C - - - - - 0x01E03C 0F:E02C: AD 68 AE
	JMP loc_0F_E03B                 ;C - - - - - 0x01E03F 0F:E02F: 4C 3B E0
loc_0F_E032:
	LDA stageField68_s1             ;C - - - - - 0x01E042 0F:E032: AD 98 AE
	JMP loc_0F_E03B                 ;C - - - - - 0x01E045 0F:E035: 4C 3B E0
loc_0F_E038:
	LDA stageField68_s2             ;C - - - - - 0x01E048 0F:E038: AD C8 AE
loc_0F_E03B:
	PHA                             ;C - - - - - 0x01E04B 0F:E03B: 48
	AND #$E0                        ;C - - - - - 0x01E04C 0F:E03C: 29 E0
	STA ram_002A                    ;C - - - - - 0x01E04E 0F:E03E: 85 2A
	PLA                             ;C D 3 - I - 0x01E050 0F:E040: 68
	AND #$1F                        ;C - - - - - 0x01E051 0F:E041: 29 1F
	STA ram_002C                    ;C - - - - - 0x01E053 0F:E043: 85 2C
	LDA #$00                        ;C - - - - - 0x01E055 0F:E045: A9 00
	STA paletteSetIdx               ;C - - - - - 0x01E057 0F:E047: 85 2B
	STA ram_002D                    ;C - - - - - 0x01E059 0F:E049: 85 2D
	JSR LoadSectionGfx              ;C - - - - - 0x01E05B 0F:E04B: 20 DD C3
	LDA #$00                        ;C - - - - - 0x01E05E 0F:E04E: A9 00
	STA palUpdateFlag               ;C D 3 - I - 0x01E060 0F:E050: 85 18
	JSR WaitFrame                   ;C - - - - - 0x01E062 0F:E052: 20 31 FF
	JSR FadeOutPaletteFast          ;C - - - - - 0x01E065 0F:E055: 20 62 C3
	JSR ClearObjects                ;C D 3 - I - 0x01E068 0F:E058: 20 34 C3
	LDX #$00                        ;C - - - - - 0x01E06B 0F:E05B: A2 00
	LDA #$D0                        ;C - - - - - 0x01E06D 0F:E05D: A9 D0
	STA objFlags                    ;C - - - - - 0x01E06F 0F:E05F: 8D 60 05
	LDA #$80                        ;C - - - - - 0x01E072 0F:E062: A9 80
	STA objActive                   ;C - - - - - 0x01E074 0F:E064: 8D 00 03
	LDA #$00                        ;C - - - - - 0x01E077 0F:E067: A9 00
	STA objYPage                    ;C - - - - - 0x01E079 0F:E069: 8D E0 03
	STA objKind                     ;C - - - - - 0x01E07C 0F:E06C: 8D 20 03
	LDA scrollXPage                 ;C - - - - - 0x01E07F 0F:E06F: A5 F9
	STA objXPage                    ;C - - - - - 0x01E081 0F:E071: 8D 80 03
	JSR SetHopVelY                  ;C - - - - - 0x01E084 0F:E074: 20 6E F2
	JSR LoadPlayerPalette           ;C - - - - - 0x01E087 0F:E077: 20 B4 C8
	JSR SetPlayerStartPos           ;C - - - - - 0x01E08A 0F:E07A: 20 6B E1
	LDX #$08                        ;C - - - - - 0x01E08D 0F:E07D: A2 08
	STX prgBank8000                 ;C - - - - - 0x01E08F 0F:E07F: 86 F4
	INX                             ;C - - - - - 0x01E091 0F:E081: E8
	STX prgBankA000                 ;C - - - - - 0x01E092 0F:E082: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01E094 0F:E084: 20 4D FF
	JSR LoadSpawnLists              ;C - - - - - bank=08 0x01E097 0F:E087: 20 00 80
	JSR FindFirstVisibleSpawn       ;C - - - - - bank=08 0x01E09A 0F:E08A: 20 38 80
	JSR SpawnEnemiesInWindow        ;C - - - - - bank=08 0x01E09D 0F:E08D: 20 80 80
	LDA stageSection                ;C D 3 - I - 0x01E0A0 0F:E090: A5 60
	CMP #$02                        ;C - - - - - 0x01E0A2 0F:E092: C9 02
	BNE loc_0F_E0A3                 ;C - - - - - 0x01E0A4 0F:E094: D0 0D
	LDA stage                       ;C - - - - - 0x01E0A6 0F:E096: A5 61
	BEQ loc_0F_E09F                 ;C D 3 - I - 0x01E0A8 0F:E098: F0 05
	LDA #$05                        ;C - - - - - 0x01E0AA 0F:E09A: A9 05
	JSR QueueSoundSaved             ;C - - - - - 0x01E0AC 0F:E09C: 20 4A F3
loc_0F_E09F:
	LDA #$FF                        ;C - - - - - 0x01E0AF 0F:E09F: A9 FF
	BNE loc_0F_E0A5                 ;C - - - - - 0x01E0B1 0F:E0A1: D0 02
loc_0F_E0A3:
	LDA #$00                        ;C - - - - - 0x01E0B3 0F:E0A3: A9 00
loc_0F_E0A5:
	STA ram_005C                    ;C - - - - - 0x01E0B5 0F:E0A5: 85 5C
	LDA #$01                        ;C - - - - - 0x01E0B7 0F:E0A7: A9 01
	STA playerFacing                ;C - - - - - 0x01E0B9 0F:E0A9: 85 31
	STA ram_0032                    ;C - - - - - 0x01E0BB 0F:E0AB: 85 32
	LDA #$00                        ;C - - - - - 0x01E0BD 0F:E0AD: A9 00
	STA gameAction                  ;C - - - - - 0x01E0BF 0F:E0AF: 85 30
	STA ram_0035                    ;C - - - - - 0x01E0C1 0F:E0B1: 85 35
	STA timerA3                     ;C - - - - - 0x01E0C3 0F:E0B3: 85 A3
	STA timerA4                     ;C - - - - - 0x01E0C5 0F:E0B5: 85 A4
	STA ram_00A5                    ;C - - - - - 0x01E0C7 0F:E0B7: 85 A5
	STA actionTimer                 ;C - - - - - 0x01E0C9 0F:E0B9: 85 37
	STA ram_00B3                    ;C - - - - - 0x01E0CB 0F:E0BB: 85 B3
	STA weaponHeld                  ;C - - - - - 0x01E0CD 0F:E0BD: 85 A9
	STA ram_00AD                    ;C - - - - - 0x01E0CF 0F:E0BF: 85 AD
	STA ram_0069                    ;C - - - - - 0x01E0D1 0F:E0C1: 85 69
	STA ram_006A                    ;C - - - - - 0x01E0D3 0F:E0C3: 85 6A
	STA ram_0050                    ;C - - - - - 0x01E0D5 0F:E0C5: 85 50
	STA ram_003F                    ;C - - - - - 0x01E0D7 0F:E0C7: 85 3F
	STA ram_0054                    ;C - - - - - 0x01E0D9 0F:E0C9: 85 54
	STA gameOverFlag                ;C - - - - - 0x01E0DB 0F:E0CB: 85 62
	STA ram_00B5                    ;C - - - - - 0x01E0DD 0F:E0CD: 85 B5
	STA ram_00B6                    ;C - - - - - 0x01E0DF 0F:E0CF: 85 B6
	STA ram_00BB                    ;C - - - - - 0x01E0E1 0F:E0D1: 85 BB
	STA ram_00BC                    ;C - - - - - 0x01E0E3 0F:E0D3: 85 BC
	STA ram_00A6                    ;C - - - - - 0x01E0E5 0F:E0D5: 85 A6
	STA ram_00BE                    ;C - - - - - 0x01E0E7 0F:E0D7: 85 BE
	STA ram_00BA                    ;C - - - - - 0x01E0E9 0F:E0D9: 85 BA
	STA ram_00B2                    ;C - - - - - 0x01E0EB 0F:E0DB: 85 B2
	STA objAirSnapshot              ;C - - - - - 0x01E0ED 0F:E0DD: 8D A0 05
	STA objAirSnapshot+1            ;C - - - - - 0x01E0F0 0F:E0E0: 8D A1 05
	STA objAirSnapshot+2            ;C - - - - - 0x01E0F3 0F:E0E3: 8D A2 05
	LDA stage                       ;C - - - - - 0x01E0F6 0F:E0E6: A5 61
	BNE loc_0F_E10A                 ;C - - - - - 0x01E0F8 0F:E0E8: D0 20
	LDA stageSection                ;C - - - - - 0x01E0FA 0F:E0EA: A5 60
	AND #$01                        ;C - - - - - 0x01E0FC 0F:E0EC: 29 01
	BEQ loc_0F_E0FE                 ;C - - - - - 0x01E0FE 0F:E0EE: F0 0E
	LDA #$1B                        ;C - - - - - 0x01E100 0F:E0F0: A9 1B
	STA gameAction                  ;C - - - - - 0x01E102 0F:E0F2: 85 30
	LDA objFlags                    ;C - - - - - 0x01E104 0F:E0F4: AD 60 05
	ORA #$20                        ;C - - - - - 0x01E107 0F:E0F7: 09 20
	STA objFlags                    ;C - - - - - 0x01E109 0F:E0F9: 8D 60 05
	BNE loc_0F_E12C                 ;C - - - - - 0x01E10C 0F:E0FC: D0 2E
loc_0F_E0FE:
	LDA stageSection                ;C - - - - - 0x01E10E 0F:E0FE: A5 60
	CMP #$02                        ;C - - - - - 0x01E110 0F:E100: C9 02
	BNE loc_0F_E12C                 ;C - - - - - 0x01E112 0F:E102: D0 28
	LDA #$1C                        ;C - - - - - 0x01E114 0F:E104: A9 1C
	STA gameAction                  ;C - - - - - 0x01E116 0F:E106: 85 30
	BNE loc_0F_E12C                 ;C - - - - - 0x01E118 0F:E108: D0 22
loc_0F_E10A:
	LDA stage                       ;C - - - - - 0x01E11A 0F:E10A: A5 61
	CMP #$01                        ;C - - - - - 0x01E11C 0F:E10C: C9 01
	BNE loc_0F_E11C                 ;C - - - - - 0x01E11E 0F:E10E: D0 0C
	LDA stageSection                ;C - - - - - 0x01E120 0F:E110: A5 60
	CMP #$02                        ;C - - - - - 0x01E122 0F:E112: C9 02
	BNE loc_0F_E12C                 ;C - - - - - 0x01E124 0F:E114: D0 16
	LDA #$20                        ;C - - - - - 0x01E126 0F:E116: A9 20
	STA gameAction                  ;C - - - - - 0x01E128 0F:E118: 85 30
	BNE loc_0F_E12C                 ;C - - - - - 0x01E12A 0F:E11A: D0 10
loc_0F_E11C:
	LDA stage                       ;C - - - - - 0x01E12C 0F:E11C: A5 61
	CMP #$04                        ;C - - - - - 0x01E12E 0F:E11E: C9 04
	BNE loc_0F_E12C                 ;C - - - - - 0x01E130 0F:E120: D0 0A
	LDA stageSection                ;C - - - - - 0x01E132 0F:E122: A5 60
	CMP #$02                        ;C - - - - - 0x01E134 0F:E124: C9 02
	BNE loc_0F_E12C                 ;C - - - - - 0x01E136 0F:E126: D0 04
	LDA #$20                        ;C - - - - - 0x01E138 0F:E128: A9 20
	STA gameAction                  ;C - - - - - 0x01E13A 0F:E12A: 85 30
loc_0F_E12C:
	JMP loc_0E_C8ED                 ;C - - - - - 0x01E13C 0F:E12C: 4C ED C8
; ram_0098=$FF, ram_009B=0, CLI
IrqEnableModeFF:
	LDA #$FF                        ;C - - - - - 0x01E13F 0F:E12F: A9 FF
	STA ram_0098                    ;C - - - - - 0x01E141 0F:E131: 85 98
	CLI                             ;C - - - - - 0x01E143 0F:E133: 58
	LDA #$00                        ;C - - - - - 0x01E144 0F:E134: A9 00
	STA ram_009B                    ;C - - - - - 0x01E146 0F:E136: 85 9B
	RTS                             ;C - - - - - 0x01E148 0F:E138: 60
; ram_009B=1, ram_0098=0, CLI
IrqEnableMode01:
	CLI                             ;C - - - - - 0x01E149 0F:E139: 58
	LDA #$01                        ;C - - - - - 0x01E14A 0F:E13A: A9 01
	STA ram_009B                    ;C - - - - - 0x01E14C 0F:E13C: 85 9B
	LDA #$00                        ;C - - - - - 0x01E14E 0F:E13E: A9 00
	STA ram_0098                    ;C - - - - - 0x01E150 0F:E140: 85 98
	RTS                             ;C - - - - - 0x01E152 0F:E142: 60
; zero scroll/nametable, facing=1
ResetScrollState:
	LDA #$00                        ;C - - - - - 0x01E153 0F:E143: A9 00
	STA scrollX                     ;C - - - - - 0x01E155 0F:E145: 85 FC
	STA scrollY                     ;C - - - - - 0x01E157 0F:E147: 85 FA
	STA nametableSelect             ;C - - - - - 0x01E159 0F:E149: 85 FD
	STA ram_00FB                    ;C - - - - - 0x01E15B 0F:E14B: 85 FB
	STA scrollXPage                 ;C - - - - - 0x01E15D 0F:E14D: 85 F9
	STA renderOffCount              ;C - - - - - 0x01E15F 0F:E14F: 85 EE
	LDA #$01                        ;C - - - - - 0x01E161 0F:E151: A9 01
	STA playerFacing                ;C - - - - - 0x01E163 0F:E153: 85 31
	STA ram_0023                    ;C - - - - - 0x01E165 0F:E155: 85 23
	STA ram_0032                    ;C - - - - - 0x01E167 0F:E157: 85 32
	STA ram_002E                    ;C - - - - - 0x01E169 0F:E159: 85 2E
	RTS                             ;C - - - - - 0x01E16B 0F:E15B: 60
tbl_0F_E15C:
	.byte $08                       ;- - - - - - 0x01E16C 0F:E15C:
	.byte $09,$0A,$0B,$0C           ;- D 3 - - - 0x01E16D 0F:E15D:
tbl_0F_E161:
	.byte $00,$03,$06,$09           ;- - - - - - 0x01E171 0F:E161:
	.byte $0C                       ;- D 3 - - - 0x01E175 0F:E165:
tbl_0F_E166:
	.byte $00,$01,$02,$03,$04       ;- D 3 - - - 0x01E176 0F:E166:
; objY/objX from per-stage tables indexed by stageSection
SetPlayerStartPos:
	LDY stage                       ;C - - - - - 0x01E17B 0F:E16B: A4 61
	LDA tbl_0F_E18F,Y               ;C - - - - - 0x01E17D 0F:E16D: B9 8F E1
	STA ptr_04                      ;C - - - - - 0x01E180 0F:E170: 85 04
	LDA tbl_0F_E194,Y               ;C - - - - - 0x01E182 0F:E172: B9 94 E1
	STA ptr_04+1                    ;C - - - - - 0x01E185 0F:E175: 85 05
	LDA tbl_0F_E199,Y               ;C - - - - - 0x01E187 0F:E177: B9 99 E1
	STA ptr_06                      ;C - - - - - 0x01E18A 0F:E17A: 85 06
	LDA tbl_0F_E19E,Y               ;C - - - - - 0x01E18C 0F:E17C: B9 9E E1
	STA ptr_06+1                    ;C - - - - - 0x01E18F 0F:E17F: 85 07
	LDA stageSection                ;C - - - - - 0x01E191 0F:E181: A5 60
	TAY                             ;C - - - - - 0x01E193 0F:E183: A8
ofs_0F_E184:
	LDA (ptr_04),Y                  ;C - - - - - 0x01E194 0F:E184: B1 04
	STA objY                        ;C - - - - - 0x01E196 0F:E186: 8D C0 03
	LDA (ptr_06),Y                  ;C - - - - - 0x01E199 0F:E189: B1 06
	STA objX                        ;C - - - - - 0x01E19B 0F:E18B: 8D 60 03
	RTS                             ;C - - - - - 0x01E19E 0F:E18E: 60
tbl_0F_E18F:
	.lobytes tbl_0F_E1A3, tbl_0F_E1A6, tbl_0F_E1A9, tbl_0F_E1AC, tbl_0F_E1AF;- D 3 - - - 0x01E19F 0F:E18F:
tbl_0F_E194:
	.hibytes tbl_0F_E1A3, tbl_0F_E1A6, tbl_0F_E1A9, tbl_0F_E1AC, tbl_0F_E1AF;- D 3 - - - 0x01E1A4 0F:E194:
tbl_0F_E199:
	.lobytes tbl_0F_E1B2, tbl_0F_E1B5, tbl_0F_E1B8, tbl_0F_E1BB, tbl_0F_E1BE;- D 3 - - - 0x01E1A9 0F:E199:
tbl_0F_E19E:
	.hibytes tbl_0F_E1B2, tbl_0F_E1B5, tbl_0F_E1B8, tbl_0F_E1BB, tbl_0F_E1BE;- D 3 - - - 0x01E1AE 0F:E19E:
tbl_0F_E1A3:
	.byte $90,$81,$00               ;- D 3 - I - 0x01E1B3 0F:E1A3:
tbl_0F_E1A6:
	.byte $98,$98,$A0               ;- D 3 - I - 0x01E1B6 0F:E1A6:
tbl_0F_E1A9:
	.byte $98,$98,$88               ;- D 3 - I - 0x01E1B9 0F:E1A9:
tbl_0F_E1AC:
	.byte $98,$78,$A0               ;- D 3 - I - 0x01E1BC 0F:E1AC:
tbl_0F_E1AF:
	.byte $98,$98,$98               ;- D 3 - I - 0x01E1BF 0F:E1AF:
tbl_0F_E1B2:
	.byte $30,$0C,$40               ;- D 3 - I - 0x01E1C2 0F:E1B2:
tbl_0F_E1B5:
	.byte $30,$30,$00               ;- D 3 - I - 0x01E1C5 0F:E1B5:
tbl_0F_E1B8:
	.byte $30,$30,$18               ;- D 3 - I - 0x01E1C8 0F:E1B8:
tbl_0F_E1BB:
	.byte $30,$40,$30               ;- D 3 - I - 0x01E1CB 0F:E1BB:
tbl_0F_E1BE:
	.byte $30,$30,$30               ;- D 3 - I - 0x01E1CE 0F:E1BE:
tbl_0F_E1C1:
	.byte $4C,$80,$19               ;- D 3 - - - 0x01E1D1 0F:E1C1: Cody, Guy, Haggar
tbl_0F_E1C4:
	.byte $01,$01,$01               ;- D 3 - - - 0x01E1D4 0F:E1C4: Cody, Guy, Haggar
tbl_0F_E1C7:
	.byte $00,$33,$CC               ;- D 3 - - - 0x01E1D7 0F:E1C7: Cody, Guy, Haggar
tbl_0F_E1CA:
	.byte $01,$01,$00               ;- D 3 - - - 0x01E1DA 0F:E1CA: Cody, Guy, Haggar
tbl_0F_E1CD:
	.byte $80,$B3,$33               ;- D 3 - - - 0x01E1DD 0F:E1CD: Cody, Guy, Haggar
tbl_0F_E1D0:
	.byte $01,$01,$01               ;- D 3 - - - 0x01E1E0 0F:E1D0: Cody, Guy, Haggar
tbl_0F_E1D3:
	.byte $0F                       ;- D 3 - - - 0x01E1E3 0F:E1D3:
tbl_0F_E1D4:
	.byte $00,$F1,$FF               ;- D 3 - - - 0x01E1E4 0F:E1D4:
tbl_0F_E1D7:
	.byte $D9,$0F,$B5               ;- D 3 - - - 0x01E1E7 0F:E1D7:
tbl_0F_E1DA:
	.byte $00,$01                   ;- D 3 - - - 0x01E1EA 0F:E1DA:
	.byte $00                       ;W 0x01E1EC 0F:E1DC:
tbl_0F_E1DD:
	.word $E6B3                     ;W 0x01E1ED 0F:E1DD:
	.byte $80                       ;W 0x01E1EF 0F:E1DF:
tbl_0F_E1E0:
	.byte $00,$00,$00               ;- D 3 - - - 0x01E1F0 0F:E1E0: Cody, Guy, Haggar
tbl_0F_E1E3:
	.byte $01,$02,$03               ;- D 3 - - - 0x01E1F3 0F:E1E3: Cody, Guy, Haggar
tbl_0F_E1E6:
	.byte $04,$05,$06               ;- D 3 - - - 0x01E1F6 0F:E1E6: Cody, Guy, Haggar
tbl_0F_E1E9:
	.byte $07,$08,$09               ;- D 3 - - - 0x01E1F9 0F:E1E9: Cody, Guy, Haggar
tbl_0F_E1EC:
	.byte $0A,$0B,$0C               ;- D 3 - - - 0x01E1FC 0F:E1EC: Cody, Guy, Haggar
tbl_0F_E1EF:
	.byte $0D,$0E,$0F               ;- D 3 - - - 0x01E1FF 0F:E1EF: Cody, Guy, Haggar
tbl_0F_E1F2:
	.byte $10,$11,$12               ;- D 3 - - - 0x01E202 0F:E1F2: Cody, Guy, Haggar
	.byte $13,$14,$15               ;- - - - - - 0x01E205 0F:E1F5: Cody, Guy, Haggar
	.byte $16,$17,$18               ;- - - - - - 0x01E208 0F:E1F8: Cody, Guy, Haggar
tbl_0F_E1FB:
	.byte $19,$1A,$1B               ;- D 3 - - - 0x01E20B 0F:E1FB: Cody, Guy, Haggar
tbl_0F_E1FE:
	.byte $1C,$1D,$1E               ;- D 3 - - - 0x01E20E 0F:E1FE: Cody, Guy, Haggar
tbl_0F_E201:
	.byte $1F,$20,$21               ;- D 3 - - - 0x01E211 0F:E201: Cody, Guy, Haggar
tbl_0F_E204:
	.byte $53,$05,$54               ;- D 3 - - - 0x01E214 0F:E204: Cody, Guy, Haggar
tbl_0F_E207:
	.byte $25,$26,$27               ;- D 3 - - - 0x01E217 0F:E207: Cody, Guy, Haggar
tbl_0F_E20A:
	.byte $28,$29,$2A               ;- D 3 - - - 0x01E21A 0F:E20A: Cody, Guy, Haggar
tbl_0F_E20D:
	.byte $2B,$2C,$2D               ;- D 3 - - - 0x01E21D 0F:E20D: Cody, Guy, Haggar
tbl_0F_E210:
	.byte $2E,$2F,$30               ;- D 3 - - - 0x01E220 0F:E210: Cody, Guy, Haggar
tbl_0F_E213:
	.byte $31,$32,$33               ;- D 3 - - - 0x01E223 0F:E213: Cody, Guy, Haggar
tbl_0F_E216:
	.byte $34,$35,$36               ;- - - - - - 0x01E226 0F:E216: Cody, Guy, Haggar
tbl_0F_E219:
	.byte $37,$38,$39               ;- D 3 - - - 0x01E229 0F:E219: Cody, Guy, Haggar
tbl_0F_E21C:
	.byte $3A,$3B,$3C               ;- D 3 - - - 0x01E22C 0F:E21C: Cody, Guy, Haggar
tbl_0F_E21F:
	.byte $42,$02,$44               ;- D 3 - - - 0x01E22F 0F:E21F: Cody, Guy, Haggar
tbl_0F_E222:
	.byte $45,$46,$47               ;- D 3 - - - 0x01E232 0F:E222: Cody, Guy, Haggar
tbl_0F_E225:
	.byte $4A,$46,$47               ;- D 3 - - - 0x01E235 0F:E225: Cody, Guy, Haggar
tbl_0F_E228:
	.byte $6C,$6A                   ;- D 3 - - - 0x01E238 0F:E228: Cody, Guy, Haggar
dat_0F_E22A:
	.byte $57                       ;- D 3 - - - 0x01E23A 0F:E22A:
tbl_0F_E22B:
	.byte $00,$04,$08               ;- D 3 - - - 0x01E23B 0F:E22B: Cody, Guy, Haggar
tbl_0F_E22E:
	.byte $01,$05,$12               ;- D 3 - - - 0x01E23E 0F:E22E: Cody, Guy, Haggar
	.byte $07,$05,$12               ;- - - - - - 0x01E241 0F:E231: Cody, Guy, Haggar
	.byte $07,$05,$12               ;- - - - - - 0x01E244 0F:E234: Cody, Guy, Haggar
tbl_0F_E237:
	.byte $02,$06,$09               ;- D 3 - - - 0x01E247 0F:E237: Cody, Guy, Haggar
tbl_0F_E23A:
	.byte $03,$07,$09               ;- D 3 - - - 0x01E24A 0F:E23A: Cody, Guy, Haggar
tbl_0F_E23D:
	.byte $03,$07,$10               ;- - - - - - 0x01E24D 0F:E23D: Cody, Guy, Haggar
	.byte $02,$06,$09               ;- - - - - - 0x01E250 0F:E240: Cody, Guy, Haggar
tbl_0F_E243:
	.byte $02,$06,$13               ;- D 3 - - - 0x01E253 0F:E243: Cody, Guy, Haggar
tbl_0F_E246:
	.byte $02,$06,$13               ;- D 3 - - - 0x01E256 0F:E246: Cody, Guy, Haggar
tbl_0F_E249:
	.byte $01,$05,$13               ;- D 3 - - - 0x01E259 0F:E249: Cody, Guy, Haggar
tbl_0F_E24C:
	.byte $23,$18,$00               ;- - - - - - 0x01E25C 0F:E24C: Cody, Guy, Haggar
tbl_0F_E24F:
	.byte $0D,$15,$11               ;- D 3 - - - 0x01E25F 0F:E24F: Cody, Guy, Haggar
tbl_0F_E252:
	.byte $0D,$15,$13               ;- D 3 - - - 0x01E262 0F:E252: Cody, Guy, Haggar
tbl_0F_E255:
	.byte $0D,$15,$12               ;- D 3 - - - 0x01E265 0F:E255: Cody, Guy, Haggar
tbl_0F_E258:
	.byte $00,$04,$0B               ;- D 3 - - - 0x01E268 0F:E258: Cody, Guy, Haggar
tbl_0F_E25B:
	.byte $0C,$14,$08               ;- D 3 - - - 0x01E26B 0F:E25B: Cody, Guy, Haggar
tbl_0F_E25E:
	.byte $0C,$14,$0B               ;- - - - - - 0x01E26E 0F:E25E: Cody, Guy, Haggar
	.byte $07,$07,$07               ;- - - - - - 0x01E271 0F:E261: Cody, Guy, Haggar
	.byte $00,$06,$00               ;- - - - - - 0x01E274 0F:E264: Cody, Guy, Haggar
tbl_0F_E267:
	.byte $00,$04,$08               ;- D 3 - - - 0x01E277 0F:E267: Cody, Guy, Haggar
tbl_0F_E26A:
	.byte $03,$16,$0B               ;- D 3 - - - 0x01E27A 0F:E26A: Cody, Guy, Haggar
tbl_0F_E26D:
	.byte $03,$16,$11               ;- D 3 - - - 0x01E27D 0F:E26D: Cody, Guy, Haggar
tbl_0F_E270:
	.byte $0E,$17                   ;- D 3 - - - 0x01E280 0F:E270: Cody, Guy, Haggar
dat_0F_E272:
	.byte $0F                       ;- D 3 - - - 0x01E282 0F:E272:
tbl_0F_E273:
	.byte $04,$05,$06               ;- D 3 - - - 0x01E283 0F:E273: Cody, Guy, Haggar
tbl_0F_E276:
	.byte $1F,$20,$21               ;- D 3 - - - 0x01E286 0F:E276: Cody, Guy, Haggar
tbl_0F_E279:
	.byte $1C,$1D,$1E               ;- D 3 - - - 0x01E289 0F:E279: Cody, Guy, Haggar
tbl_0F_E27C:
	.byte $1F,$20,$21               ;- D 3 - - - 0x01E28C 0F:E27C: Cody, Guy, Haggar
tbl_0F_E27F:
	.byte $0A,$0B,$0C               ;- D 3 - - - 0x01E28F 0F:E27F: Cody, Guy, Haggar
tbl_0F_E282:
	.byte $07,$08,$09               ;- D 3 - - - 0x01E292 0F:E282: Cody, Guy, Haggar
tbl_0F_E285:
	.byte $3A,$3B,$3C               ;- D 3 - - - 0x01E295 0F:E285: Cody, Guy, Haggar
tbl_0F_E288:
	.byte $0D,$0E,$0F               ;- D 3 - - - 0x01E298 0F:E288: Cody, Guy, Haggar
tbl_0F_E28B:
	.byte $16,$17,$18               ;- D 3 - - - 0x01E29B 0F:E28B: Cody, Guy, Haggar
tbl_0F_E28E:
	.byte $45,$46,$47               ;- D 3 - - - 0x01E29E 0F:E28E: Cody, Guy, Haggar
tbl_0F_E291:
	.byte $13,$14,$15               ;- D 3 - - - 0x01E2A1 0F:E291: Cody, Guy, Haggar
	.byte $10,$11,$12               ;- - - - - - 0x01E2A4 0F:E294: Cody, Guy, Haggar
tbl_0F_E297:
	.byte $34,$35,$52               ;- D 3 - - - 0x01E2A7 0F:E297: Cody, Guy, Haggar
tbl_0F_E29A:
	.byte $53,$05,$54               ;- D 3 - - - 0x01E2AA 0F:E29A: Cody, Guy, Haggar
tbl_0F_E29D:
	.byte $00,$14,$15               ;- D 3 - - - 0x01E2AD 0F:E29D: Cody, Guy, Haggar
tbl_0F_E2A0:
	.byte $00,$5B,$15               ;- D 3 - - - 0x01E2B0 0F:E2A0: Cody, Guy, Haggar
; scroll follows the player (skipped for several gameActions)
UpdateHorizScroll:
	LDA gameAction                  ;C - - - - - 0x01E2B3 0F:E2A3: A5 30
	CMP #$06                        ;C - - - - - 0x01E2B5 0F:E2A5: C9 06
	BEQ loc_0F_E2BF                 ;C - - - - - 0x01E2B7 0F:E2A7: F0 16
	CMP #$1B                        ;C - - - - - 0x01E2B9 0F:E2A9: C9 1B
	BEQ loc_0F_E2BF                 ;C - - - - - 0x01E2BB 0F:E2AB: F0 12
	CMP #$1F                        ;C - - - - - 0x01E2BD 0F:E2AD: C9 1F
	BEQ loc_0F_E2BF                 ;C - - - - - 0x01E2BF 0F:E2AF: F0 0E
	CMP #$0B                        ;C - - - - - 0x01E2C1 0F:E2B1: C9 0B
	BEQ loc_0F_E2BF                 ;C - - - - - 0x01E2C3 0F:E2B3: F0 0A
	CMP #$09                        ;C - - - - - 0x01E2C5 0F:E2B5: C9 09
	BEQ loc_0F_E2BF                 ;C - - - - - 0x01E2C7 0F:E2B7: F0 06
	CMP #$0D                        ;C - - - - - 0x01E2C9 0F:E2B9: C9 0D
	BEQ loc_0F_E2BF                 ;C - - - - - 0x01E2CB 0F:E2BB: F0 02
	BNE loc_0F_E2C0                 ;C - - - - - 0x01E2CD 0F:E2BD: D0 01
loc_0F_E2BF:
	RTS                             ;C - - - - - 0x01E2CF 0F:E2BF: 60
loc_0F_E2C0:
	LDA ram_0050                    ;C - - - - - 0x01E2D0 0F:E2C0: A5 50
	BEQ loc_0F_E2C7                 ;C - - - - - 0x01E2D2 0F:E2C2: F0 03
	JMP loc_0F_E473                 ;C - - - - - 0x01E2D4 0F:E2C4: 4C 73 E4
loc_0F_E2C7:
	LDA ram_002A                    ;C - - - - - 0x01E2D7 0F:E2C7: A5 2A
	AND #$20                        ;C - - - - - 0x01E2D9 0F:E2C9: 29 20
	BNE loc_0F_E2D0                 ;C - - - - - 0x01E2DB 0F:E2CB: D0 03
	JMP loc_0F_E473                 ;c - - - - - 0x01E2DD 0F:E2CD: 4C 73 E4
loc_0F_E2D0:
	LDA #$01                        ;C - - - - - 0x01E2E0 0F:E2D0: A9 01
	STA spriteFlipMask              ;C - - - - - 0x01E2E2 0F:E2D2: 85 10
	STA ram_002E                    ;C - - - - - 0x01E2E4 0F:E2D4: 85 2E
	LDA objX                        ;C - - - - - 0x01E2E6 0F:E2D6: AD 60 03
	SEC                             ;C - - - - - 0x01E2E9 0F:E2D9: 38
	SBC scrollX                     ;C - - - - - 0x01E2EA 0F:E2DA: E5 FC
	STA ptr_00                      ;C - - - - - 0x01E2EC 0F:E2DC: 85 00
	SEC                             ;C - - - - - 0x01E2EE 0F:E2DE: 38
	SBC #$80                        ;C - - - - - 0x01E2EF 0F:E2DF: E9 80
	BCS loc_0F_E2E7                 ;C - - - - - 0x01E2F1 0F:E2E1: B0 04
	EOR #$FF                        ;C - - - - - 0x01E2F3 0F:E2E3: 49 FF
	ADC #$01                        ;C - - - - - 0x01E2F5 0F:E2E5: 69 01
loc_0F_E2E7:
	STA ptr_00+1                    ;C - - - - - 0x01E2F7 0F:E2E7: 85 01
	LDA objX                        ;C - - - - - 0x01E2F9 0F:E2E9: AD 60 03
	SEC                             ;C - - - - - 0x01E2FC 0F:E2EC: 38
	SBC ram_0027                    ;C - - - - - 0x01E2FD 0F:E2ED: E5 27
	STA ptr_02                      ;C - - - - - 0x01E2FF 0F:E2EF: 85 02
	BMI loc_0F_E2F6                 ;C - - - - - 0x01E301 0F:E2F1: 30 03
	JMP loc_0F_E3A3                 ;C - - - - - 0x01E303 0F:E2F3: 4C A3 E3
loc_0F_E2F6:
	EOR #$FF                        ;C - - - - - 0x01E306 0F:E2F6: 49 FF
	CLC                             ;C - - - - - 0x01E308 0F:E2F8: 18
	ADC #$01                        ;C - - - - - 0x01E309 0F:E2F9: 69 01
	STA ptr_02                      ;C - - - - - 0x01E30B 0F:E2FB: 85 02
	LDA ptr_00+1                    ;C - - - - - 0x01E30D 0F:E2FD: A5 01
	CMP #$19                        ;C - - - - - 0x01E30F 0F:E2FF: C9 19
	BCC loc_0F_E307                 ;C - - - - - 0x01E311 0F:E301: 90 04
	LDA ptr_02                      ;C - - - - - 0x01E313 0F:E303: A5 02
	STA ptr_00+1                    ;C - - - - - 0x01E315 0F:E305: 85 01
loc_0F_E307:
	LDA #$18                        ;C - - - - - 0x01E317 0F:E307: A9 18
	CMP ptr_00+1                    ;C - - - - - 0x01E319 0F:E309: C5 01
	BCS loc_0F_E30F                 ;C - - - - - 0x01E31B 0F:E30B: B0 02
	STA ptr_00+1                    ;C - - - - - 0x01E31D 0F:E30D: 85 01
loc_0F_E30F:
	LDA #$02                        ;C - - - - - 0x01E31F 0F:E30F: A9 02
	STA spriteFlipMask              ;C - - - - - 0x01E321 0F:E311: 85 10
	STA ram_002E                    ;C - - - - - 0x01E323 0F:E313: 85 2E
	LDA ptr_00                      ;C - - - - - 0x01E325 0F:E315: A5 00
	CMP #$80                        ;C - - - - - 0x01E327 0F:E317: C9 80
	BCS loc_0F_E353                 ;C - - - - - 0x01E329 0F:E319: B0 38
	LDA playerId                    ;C - - - - - 0x01E32B 0F:E31B: A5 34
	CMP #$02                        ;C - - - - - 0x01E32D 0F:E31D: C9 02
	BNE loc_0F_E32F                 ;C - - - - - 0x01E32F 0F:E31F: D0 0E
	LDA gameAction                  ;C - - - - - 0x01E331 0F:E321: A5 30
	CMP #$04                        ;C - - - - - 0x01E333 0F:E323: C9 04
	BNE loc_0F_E32F                 ;C - - - - - 0x01E335 0F:E325: D0 08
	LDA playerFacing                ;C - - - - - 0x01E337 0F:E327: A5 31
	CMP #$02                        ;C - - - - - 0x01E339 0F:E329: C9 02
	BEQ loc_0F_E333                 ;C - - - - - 0x01E33B 0F:E32B: F0 06
	BNE loc_0F_E32F                 ;C - - - - - 0x01E33D 0F:E32D: D0 00
loc_0F_E32F:
	LDA #$18                        ;C - - - - - 0x01E33F 0F:E32F: A9 18
	BNE loc_0F_E335                 ;C - - - - - 0x01E341 0F:E331: D0 02
loc_0F_E333:
	LDA #$24                        ;C - - - - - 0x01E343 0F:E333: A9 24
loc_0F_E335:
	STA ptr_0E+1                    ;C - - - - - 0x01E345 0F:E335: 85 0F
	LDA objX                        ;C - - - - - 0x01E347 0F:E337: AD 60 03
	SEC                             ;C - - - - - 0x01E34A 0F:E33A: 38
	SBC scrollX                     ;C - - - - - 0x01E34B 0F:E33B: E5 FC
	STA ptr_00                      ;C - - - - - 0x01E34D 0F:E33D: 85 00
	CMP ptr_0E+1                    ;C - - - - - 0x01E34F 0F:E33F: C5 0F
	BCS loc_0F_E352                 ;C - - - - - 0x01E351 0F:E341: B0 0F
	LDA scrollX                     ;C - - - - - 0x01E353 0F:E343: A5 FC
	CLC                             ;C - - - - - 0x01E355 0F:E345: 18
	ADC ptr_0E+1                    ;C - - - - - 0x01E356 0F:E346: 65 0F
	STA objX                        ;C - - - - - 0x01E358 0F:E348: 8D 60 03
	LDA scrollXPage                 ;C - - - - - 0x01E35B 0F:E34B: A5 F9
	ADC #$00                        ;C - - - - - 0x01E35D 0F:E34D: 69 00
	STA objXPage                    ;C - - - - - 0x01E35F 0F:E34F: 8D 80 03
loc_0F_E352:
	RTS                             ;C - - - - - 0x01E362 0F:E352: 60
loc_0F_E353:
	LDA gameAction                  ;C - - - - - 0x01E363 0F:E353: A5 30
	CMP #$1D                        ;C - - - - - 0x01E365 0F:E355: C9 1D
	BNE loc_0F_E3A0                 ;C - - - - - 0x01E367 0F:E357: D0 47
	LDA stage                       ;C - - - - - 0x01E369 0F:E359: A5 61
	BNE loc_0F_E373                 ;C - - - - - 0x01E36B 0F:E35B: D0 16
	LDA stageSection                ;C - - - - - 0x01E36D 0F:E35D: A5 60
	CMP #$01                        ;C - - - - - 0x01E36F 0F:E35F: C9 01
	BNE loc_0F_E373                 ;C - - - - - 0x01E371 0F:E361: D0 10
	LDA ram_002D                    ;C - - - - - 0x01E373 0F:E363: A5 2D
	CMP #$02                        ;C - - - - - 0x01E375 0F:E365: C9 02
	BNE loc_0F_E373                 ;C - - - - - 0x01E377 0F:E367: D0 0A
	LDA #$1E                        ;C - - - - - 0x01E379 0F:E369: A9 1E
	STA gameAction                  ;C - - - - - 0x01E37B 0F:E36B: 85 30
	LDA #$80                        ;C - - - - - 0x01E37D 0F:E36D: A9 80
	STA objActive                   ;C - - - - - 0x01E37F 0F:E36F: 8D 00 03
	RTS                             ;C - - - - - 0x01E382 0F:E372: 60
loc_0F_E373:
	LDA stage                       ;C - - - - - 0x01E383 0F:E373: A5 61
	CMP #$03                        ;C - - - - - 0x01E385 0F:E375: C9 03
	BNE loc_0F_E38D                 ;C - - - - - 0x01E387 0F:E377: D0 14
	LDA stageSection                ;C - - - - - 0x01E389 0F:E379: A5 60
	BNE loc_0F_E38D                 ;C - - - - - 0x01E38B 0F:E37B: D0 10
	LDA ram_002D                    ;C - - - - - 0x01E38D 0F:E37D: A5 2D
	CMP #$02                        ;C - - - - - 0x01E38F 0F:E37F: C9 02
	BCC loc_0F_E38D                 ;C - - - - - 0x01E391 0F:E381: 90 0A
	LDA #$26                        ;C - - - - - 0x01E393 0F:E383: A9 26
	STA gameAction                  ;C - - - - - 0x01E395 0F:E385: 85 30
	LDA #$80                        ;C - - - - - 0x01E397 0F:E387: A9 80
	STA objActive                   ;C - - - - - 0x01E399 0F:E389: 8D 00 03
	RTS                             ;C - - - - - 0x01E39C 0F:E38C: 60
loc_0F_E38D:
	JSR ResetPlayerStand            ;C - - - - - 0x01E39D 0F:E38D: 20 AA CE
	LDA #$00                        ;C - - - - - 0x01E3A0 0F:E390: A9 00
	STA gameAction                  ;C - - - - - 0x01E3A2 0F:E392: 85 30
	STA ram_00BB                    ;C - - - - - 0x01E3A4 0F:E394: 85 BB
	STA ram_0035                    ;C - - - - - 0x01E3A6 0F:E396: 85 35
	JSR ClearTimerA4                ;C - - - - - 0x01E3A8 0F:E398: 20 36 F4
	LDA #$80                        ;C - - - - - 0x01E3AB 0F:E39B: A9 80
	STA objActive                   ;C - - - - - 0x01E3AD 0F:E39D: 8D 00 03
loc_0F_E3A0:
	JMP loc_0F_E473                 ;C - - - - - 0x01E3B0 0F:E3A0: 4C 73 E4
loc_0F_E3A3:
	LDA ptr_00                      ;C - - - - - 0x01E3B3 0F:E3A3: A5 00
	CMP #$81                        ;C - - - - - 0x01E3B5 0F:E3A5: C9 81
	BCC loc_0F_E353                 ;C - - - - - 0x01E3B7 0F:E3A7: 90 AA
	LDA ram_002D                    ;C - - - - - 0x01E3B9 0F:E3A9: A5 2D
	CMP ram_002C                    ;C - - - - - 0x01E3BB 0F:E3AB: C5 2C
	BEQ loc_0F_E353                 ;C - - - - - 0x01E3BD 0F:E3AD: F0 A4
	LDA ram_00BB                    ;C - - - - - 0x01E3BF 0F:E3AF: A5 BB
	BEQ loc_0F_E418                 ;C - - - - - 0x01E3C1 0F:E3B1: F0 65
	LDA gameAction                  ;C - - - - - 0x01E3C3 0F:E3B3: A5 30
	CMP #$01                        ;C - - - - - 0x01E3C5 0F:E3B5: C9 01
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3C7 0F:E3B7: F0 3E
	CMP #$17                        ;C - - - - - 0x01E3C9 0F:E3B9: C9 17
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3CB 0F:E3BB: F0 3A
	CMP #$18                        ;C - - - - - 0x01E3CD 0F:E3BD: C9 18
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3CF 0F:E3BF: F0 36
	CMP #$23                        ;C - - - - - 0x01E3D1 0F:E3C1: C9 23
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3D3 0F:E3C3: F0 32
	CMP #$11                        ;C - - - - - 0x01E3D5 0F:E3C5: C9 11
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3D7 0F:E3C7: F0 2E
	CMP #$25                        ;C - - - - - 0x01E3D9 0F:E3C9: C9 25
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3DB 0F:E3CB: F0 2A
ofs_0F_E3CD:
	CMP #$24                        ;C - - - - - 0x01E3DD 0F:E3CD: C9 24
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3DF 0F:E3CF: F0 26
	CMP #$15                        ;C - - - - - 0x01E3E1 0F:E3D1: C9 15
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3E3 0F:E3D3: F0 22
	CMP #$0F                        ;C - - - - - 0x01E3E5 0F:E3D5: C9 0F
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3E7 0F:E3D7: F0 1E
	CMP #$22                        ;C - - - - - 0x01E3E9 0F:E3D9: C9 22
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3EB 0F:E3DB: F0 1A
	CMP #$24                        ;C - - - - - 0x01E3ED 0F:E3DD: C9 24
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3EF 0F:E3DF: F0 16
	CMP #$02                        ;C - - - - - 0x01E3F1 0F:E3E1: C9 02
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3F3 0F:E3E3: F0 12
	CMP #$14                        ;C - - - - - 0x01E3F5 0F:E3E5: C9 14
	BEQ loc_0F_E3F7                 ;C - - - - - 0x01E3F7 0F:E3E7: F0 0E
	CMP #$1D                        ;C - - - - - 0x01E3F9 0F:E3E9: C9 1D
	BEQ loc_0F_E409                 ;C - - - - - 0x01E3FB 0F:E3EB: F0 1C
	LDA ptr_00                      ;C - - - - - 0x01E3FD 0F:E3ED: A5 00
	CMP #$81                        ;C - - - - - 0x01E3FF 0F:E3EF: C9 81
	BCC loc_0F_E3F8                 ;C - - - - - 0x01E401 0F:E3F1: 90 05
	LDA #$1D                        ;C - - - - - 0x01E403 0F:E3F3: A9 1D
	STA gameAction                  ;C - - - - - 0x01E405 0F:E3F5: 85 30
loc_0F_E3F7:
	RTS                             ;C - - - - - 0x01E407 0F:E3F7: 60
loc_0F_E3F8:
	JSR ResetPlayerStand            ;c - - - - - 0x01E408 0F:E3F8: 20 AA CE
	LDA #$00                        ;c - - - - - 0x01E40B 0F:E3FB: A9 00
	STA gameAction                  ;c - - - - - 0x01E40D 0F:E3FD: 85 30
	STA ram_00BB                    ;c - - - - - 0x01E40F 0F:E3FF: 85 BB
	STA ram_0035                    ;c - - - - - 0x01E411 0F:E401: 85 35
	LDA #$80                        ;c - - - - - 0x01E413 0F:E403: A9 80
	STA objActive                   ;c - - - - - 0x01E415 0F:E405: 8D 00 03
	RTS                             ;c - - - - - 0x01E418 0F:E408: 60
loc_0F_E409:
	LDA scrollX                     ;C - - - - - 0x01E419 0F:E409: A5 FC
	CLC                             ;C - - - - - 0x01E41B 0F:E40B: 18
	ADC #$01                        ;C - - - - - 0x01E41C 0F:E40C: 69 01
	STA scrollX                     ;C - - - - - 0x01E41E 0F:E40E: 85 FC
	BCC loc_0F_E415                 ;C - - - - - 0x01E420 0F:E410: 90 03
	INC ram_002D                    ;c - - - - - 0x01E422 0F:E412: E6 2D
	RTS                             ;c - - - - - 0x01E424 0F:E414: 60
loc_0F_E415:
	JMP loc_0F_E4DF                 ;C - - - - - 0x01E425 0F:E415: 4C DF E4
loc_0F_E418:
	LDA ptr_00+1                    ;C - - - - - 0x01E428 0F:E418: A5 01
	CMP #$19                        ;C - - - - - 0x01E42A 0F:E41A: C9 19
	BCC loc_0F_E42E                 ;C - - - - - 0x01E42C 0F:E41C: 90 10
	LDA ptr_02                      ;C - - - - - 0x01E42E 0F:E41E: A5 02
	STA ptr_00+1                    ;C - - - - - 0x01E430 0F:E420: 85 01
	BNE loc_0F_E42E                 ;C - - - - - 0x01E432 0F:E422: D0 0A
	LDA gameAction                  ;C - - - - - 0x01E434 0F:E424: A5 30
	CMP #$14                        ;C - - - - - 0x01E436 0F:E426: C9 14
	BNE loc_0F_E42E                 ;C - - - - - 0x01E438 0F:E428: D0 04
	LDA #$01                        ;c - - - - - 0x01E43A 0F:E42A: A9 01
	STA ptr_00+1                    ;c - - - - - 0x01E43C 0F:E42C: 85 01
loc_0F_E42E:
	LDA #$18                        ;C - - - - - 0x01E43E 0F:E42E: A9 18
	CMP ptr_00+1                    ;C - - - - - 0x01E440 0F:E430: C5 01
	BCS loc_0F_E436                 ;C - - - - - 0x01E442 0F:E432: B0 02
	STA ptr_00+1                    ;c - - - - - 0x01E444 0F:E434: 85 01
loc_0F_E436:
	LDA ptr_00+1                    ;C - - - - - 0x01E446 0F:E436: A5 01
	CMP #$04                        ;C - - - - - 0x01E448 0F:E438: C9 04
	BCC loc_0F_E440                 ;C - - - - - 0x01E44A 0F:E43A: 90 04
	LDA #$01                        ;C - - - - - 0x01E44C 0F:E43C: A9 01
	STA ptr_00+1                    ;C - - - - - 0x01E44E 0F:E43E: 85 01
loc_0F_E440:
	LDA ptr_00+1                    ;C - - - - - 0x01E450 0F:E440: A5 01
	BEQ loc_0F_E473                 ;C - - - - - 0x01E452 0F:E442: F0 2F
	LDA scrollX                     ;C - - - - - 0x01E454 0F:E444: A5 FC
	CLC                             ;C - - - - - 0x01E456 0F:E446: 18
	ADC ptr_00+1                    ;C - - - - - 0x01E457 0F:E447: 65 01
	STA scrollX                     ;C - - - - - 0x01E459 0F:E449: 85 FC
	BCC loc_0F_E46F                 ;C - - - - - 0x01E45B 0F:E44B: 90 22
	INC ram_002D                    ;C - - - - - 0x01E45D 0F:E44D: E6 2D
	LDA ram_002D                    ;C - - - - - 0x01E45F 0F:E44F: A5 2D
	CMP ram_002C                    ;C - - - - - 0x01E461 0F:E451: C5 2C
	BNE loc_0F_E463                 ;C - - - - - 0x01E463 0F:E453: D0 0E
	LDA #$00                        ;C - - - - - 0x01E465 0F:E455: A9 00
	STA scrollX                     ;C - - - - - 0x01E467 0F:E457: 85 FC
	LDA #$F0                        ;C - - - - - 0x01E469 0F:E459: A9 F0
	CMP objX                        ;C - - - - - 0x01E46B 0F:E45B: CD 60 03
	BCS loc_0F_E463                 ;C - - - - - 0x01E46E 0F:E45E: B0 03
	STA objX                        ;c - - - - - 0x01E470 0F:E460: 8D 60 03
loc_0F_E463:
	LDA #$FF                        ;C - - - - - 0x01E473 0F:E463: A9 FF
	STA ram_0050                    ;C - - - - - 0x01E475 0F:E465: 85 50
	STA ram_00BB                    ;C - - - - - 0x01E477 0F:E467: 85 BB
	LDA #$00                        ;C - - - - - 0x01E479 0F:E469: A9 00
	STA scrollX                     ;C - - - - - 0x01E47B 0F:E46B: 85 FC
	INC scrollXPage                 ;C - - - - - 0x01E47D 0F:E46D: E6 F9
loc_0F_E46F:
	JMP loc_0F_E4DF                 ;C - - - - - 0x01E47F 0F:E46F: 4C DF E4
	.byte $60                       ;- - - - - - 0x01E482 0F:E472:
loc_0F_E473:
	LDA scrollX                     ;C - - - - - 0x01E483 0F:E473: A5 FC
	BNE loc_0F_E495                 ;C - - - - - 0x01E485 0F:E475: D0 1E
	LDA playerId                    ;C - - - - - 0x01E487 0F:E477: A5 34
	CMP #$02                        ;C - - - - - 0x01E489 0F:E479: C9 02
	BNE loc_0F_E489                 ;C - - - - - 0x01E48B 0F:E47B: D0 0C
	LDA gameAction                  ;C - - - - - 0x01E48D 0F:E47D: A5 30
	CMP #$04                        ;C - - - - - 0x01E48F 0F:E47F: C9 04
ofs_0F_E481:
	BNE loc_0F_E489                 ;C - - - - - 0x01E491 0F:E481: D0 06
	LDA playerFacing                ;C - - - - - 0x01E493 0F:E483: A5 31
	CMP #$02                        ;C - - - - - 0x01E495 0F:E485: C9 02
	BEQ loc_0F_E496                 ;C - - - - - 0x01E497 0F:E487: F0 0D
loc_0F_E489:
	LDA objX                        ;C - - - - - 0x01E499 0F:E489: AD 60 03
	CMP #$18                        ;C - - - - - 0x01E49C 0F:E48C: C9 18
	BCS loc_0F_E4A3                 ;C - - - - - 0x01E49E 0F:E48E: B0 13
	LDA #$18                        ;C - - - - - 0x01E4A0 0F:E490: A9 18
	STA objX                        ;C - - - - - 0x01E4A2 0F:E492: 8D 60 03
loc_0F_E495:
	RTS                             ;C - - - - - 0x01E4A5 0F:E495: 60
loc_0F_E496:
	LDA objX                        ;C - - - - - 0x01E4A6 0F:E496: AD 60 03
	CMP #$20                        ;C - - - - - 0x01E4A9 0F:E499: C9 20
	BCS loc_0F_E4A3                 ;C - - - - - 0x01E4AB 0F:E49B: B0 06
	LDA #$20                        ;C - - - - - 0x01E4AD 0F:E49D: A9 20
	STA objX                        ;C - - - - - 0x01E4AF 0F:E49F: 8D 60 03
	RTS                             ;C - - - - - 0x01E4B2 0F:E4A2: 60
loc_0F_E4A3:
	LDA playerId                    ;C - - - - - 0x01E4B3 0F:E4A3: A5 34
	CMP #$02                        ;C - - - - - 0x01E4B5 0F:E4A5: C9 02
	BNE loc_0F_E4C8                 ;C - - - - - 0x01E4B7 0F:E4A7: D0 1F
	LDA gameAction                  ;C - - - - - 0x01E4B9 0F:E4A9: A5 30
	CMP #$04                        ;C - - - - - 0x01E4BB 0F:E4AB: C9 04
	BNE loc_0F_E4C8                 ;C - - - - - 0x01E4BD 0F:E4AD: D0 19
	LDA playerFacing                ;C - - - - - 0x01E4BF 0F:E4AF: A5 31
	CMP #$02                        ;C - - - - - 0x01E4C1 0F:E4B1: C9 02
	BEQ loc_0F_E4C8                 ;C - - - - - 0x01E4C3 0F:E4B3: F0 13
	LDA objX                        ;C - - - - - 0x01E4C5 0F:E4B5: AD 60 03
	CMP #$E8                        ;C - - - - - 0x01E4C8 0F:E4B8: C9 E8
	BCC loc_0F_E495                 ;C - - - - - 0x01E4CA 0F:E4BA: 90 D9
	LDA gameAction                  ;c - - - - - 0x01E4CC 0F:E4BC: A5 30
	CMP #$19                        ;c - - - - - 0x01E4CE 0F:E4BE: C9 19
	BEQ loc_0F_E4DE                 ;c - - - - - 0x01E4D0 0F:E4C0: F0 1C
	LDA #$E8                        ;c - - - - - 0x01E4D2 0F:E4C2: A9 E8
	STA objX                        ;c - - - - - 0x01E4D4 0F:E4C4: 8D 60 03
	RTS                             ;c - - - - - 0x01E4D7 0F:E4C7: 60
loc_0F_E4C8:
	LDA objX                        ;C - - - - - 0x01E4D8 0F:E4C8: AD 60 03
	CMP #$F0                        ;C - - - - - 0x01E4DB 0F:E4CB: C9 F0
	BCC loc_0F_E495                 ;C - - - - - 0x01E4DD 0F:E4CD: 90 C6
	LDA gameAction                  ;C - - - - - 0x01E4DF 0F:E4CF: A5 30
	CMP #$19                        ;C - - - - - 0x01E4E1 0F:E4D1: C9 19
	BEQ loc_0F_E4DE                 ;C - - - - - 0x01E4E3 0F:E4D3: F0 09
	CMP #$0E                        ;C - - - - - 0x01E4E5 0F:E4D5: C9 0E
	BEQ loc_0F_E4DE                 ;C - - - - - 0x01E4E7 0F:E4D7: F0 05
	LDA #$F0                        ;C - - - - - 0x01E4E9 0F:E4D9: A9 F0
	STA objX                        ;C - - - - - 0x01E4EB 0F:E4DB: 8D 60 03
loc_0F_E4DE:
	RTS                             ;C - - - - - 0x01E4EE 0F:E4DE: 60
loc_0F_E4DF:
	LDA scrollX                     ;C - - - - - 0x01E4EF 0F:E4DF: A5 FC
	SEC                             ;C - - - - - 0x01E4F1 0F:E4E1: 38
	SBC ram_0025                    ;C - - - - - 0x01E4F2 0F:E4E2: E5 25
	BPL loc_0F_E4EB                 ;C - - - - - 0x01E4F4 0F:E4E4: 10 05
	EOR #$FF                        ;c - - - - - 0x01E4F6 0F:E4E6: 49 FF
	CLC                             ;c - - - - - 0x01E4F8 0F:E4E8: 18
	ADC #$01                        ;c - - - - - 0x01E4F9 0F:E4E9: 69 01
loc_0F_E4EB:
	STA ptr_02+1                    ;C - - - - - 0x01E4FB 0F:E4EB: 85 03
	BEQ loc_0F_E51F                 ;C - - - - - 0x01E4FD 0F:E4ED: F0 30
	LDA ram_0023                    ;C - - - - - 0x01E4FF 0F:E4EF: A5 23
	AND #$0C                        ;C - - - - - 0x01E501 0F:E4F1: 29 0C
	BEQ loc_0F_E506                 ;C - - - - - 0x01E503 0F:E4F3: F0 11
	LDA spriteFlipMask              ;c - - - - - 0x01E505 0F:E4F5: A5 10
	STA ram_0023                    ;c - - - - - 0x01E507 0F:E4F7: 85 23
	AND #$01                        ;c - - - - - 0x01E509 0F:E4F9: 29 01
	TAX                             ;c - - - - - 0x01E50B 0F:E4FB: AA
	LDA tbl_0F_E60B,X               ;c - - - - - 0x01E50C 0F:E4FC: BD 0B E6
	STA ram_0025                    ;c - - - - - 0x01E50F 0F:E4FF: 85 25
	LDA tbl_0F_E60D,X               ;c - - - - - 0x01E511 0F:E501: BD 0D E6
	STA ram_0024                    ;c - - - - - 0x01E514 0F:E504: 85 24
loc_0F_E506:
	LDA spriteFlipMask              ;C - - - - - 0x01E516 0F:E506: A5 10
	AND #$01                        ;C - - - - - 0x01E518 0F:E508: 29 01
	BEQ loc_0F_E511                 ;C - - - - - 0x01E51A 0F:E50A: F0 05
	LDA ram_0025                    ;C - - - - - 0x01E51C 0F:E50C: A5 25
	JMP loc_0F_E515                 ;C - - - - - 0x01E51E 0F:E50E: 4C 15 E5
loc_0F_E511:
	LDA ram_0025                    ;c - - - - - 0x01E521 0F:E511: A5 25
	EOR #$FF                        ;c - - - - - 0x01E523 0F:E513: 49 FF
loc_0F_E515:
	AND #$07                        ;C - - - - - 0x01E525 0F:E515: 29 07
	CLC                             ;C - - - - - 0x01E527 0F:E517: 18
	ADC ptr_02+1                    ;C - - - - - 0x01E528 0F:E518: 65 03
	LSR A                           ;C - - - - - 0x01E52A 0F:E51A: 4A
	LSR A                           ;C - - - - - 0x01E52B 0F:E51B: 4A
	LSR A                           ;C - - - - - 0x01E52C 0F:E51C: 4A
	BNE StageScrollUpdate           ;C - - - - - 0x01E52D 0F:E51D: D0 02
loc_0F_E51F:
	SEC                             ;C - - - - - 0x01E52F 0F:E51F: 38
	RTS                             ;C - - - - - 0x01E530 0F:E520: 60
; steps screen/column counters, then loads metatile columns
StageScrollUpdate:
	LDA spriteFlipMask              ;C - - - - - 0x01E531 0F:E521: A5 10
	PHA                             ;C - - - - - 0x01E533 0F:E523: 48
	AND #$01                        ;C - - - - - 0x01E534 0F:E524: 29 01
	TAX                             ;C - - - - - 0x01E536 0F:E526: AA
	PLA                             ;C - - - - - 0x01E537 0F:E527: 68
	CMP ram_0023                    ;C - - - - - 0x01E538 0F:E528: C5 23
	STA ram_0023                    ;C - - - - - 0x01E53A 0F:E52A: 85 23
	BEQ loc_0F_E531                 ;C - - - - - 0x01E53C 0F:E52C: F0 03
	JMP loc_0F_E53F                 ;c - - - - - 0x01E53E 0F:E52E: 4C 3F E5
loc_0F_E531:
	LDA ram_0024                    ;C - - - - - 0x01E541 0F:E531: A5 24
	CLC                             ;C - - - - - 0x01E543 0F:E533: 18
	ADC tbl_0F_E601,X               ;C - - - - - 0x01E544 0F:E534: 7D 01 E6
	CMP #$20                        ;C - - - - - 0x01E547 0F:E537: C9 20
	AND #$1F                        ;C - - - - - 0x01E549 0F:E539: 29 1F
	STA ram_0024                    ;C - - - - - 0x01E54B 0F:E53B: 85 24
	BCC loc_0F_E547                 ;C - - - - - 0x01E54D 0F:E53D: 90 08
loc_0F_E53F:
	LDA ram_0029                    ;C - - - - - 0x01E54F 0F:E53F: A5 29
	CLC                             ;C - - - - - 0x01E551 0F:E541: 18
	ADC tbl_0F_E601,X               ;C - - - - - 0x01E552 0F:E542: 7D 01 E6
	STA ram_0029                    ;C - - - - - 0x01E555 0F:E545: 85 29
loc_0F_E547:
	LDY stageData                   ;C - - - - - 0x01E557 0F:E547: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01E559 0F:E549: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01E55C 0F:E54C: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01E55E 0F:E54E: 20 4D FF
	LDA ram_0024                    ;C - - - - - 0x01E561 0F:E551: A5 24
	LSR A                           ;C - - - - - 0x01E563 0F:E553: 4A
	LSR A                           ;C - - - - - 0x01E564 0F:E554: 4A
	STA ram_0028                    ;C - - - - - 0x01E565 0F:E555: 85 28
	LDY ram_0029                    ;C - - - - - 0x01E567 0F:E557: A4 29
	JSR StageScreenPtr              ;C - - - - - 0x01E569 0F:E559: 20 6E E6
	LDA #$00                        ;C - - - - - 0x01E56C 0F:E55C: A9 00
	STA ptr_02+1                    ;C - - - - - 0x01E56E 0F:E55E: 85 03
loc_0F_E560:
	JSR StageLoadMetaTiles          ;C - - - - - 0x01E570 0F:E560: 20 0F E6
	LDY ram_0028                    ;C - - - - - 0x01E573 0F:E563: A4 28
	LDA ram_0640,Y                  ;C - - - - - 0x01E575 0F:E565: B9 40 06
	STA spritePriorityBit           ;C - - - - - 0x01E578 0F:E568: 85 11
	LDA ram_0024                    ;C - - - - - 0x01E57A 0F:E56A: A5 24
	AND #$03                        ;C - - - - - 0x01E57C 0F:E56C: 29 03
	TAY                             ;C - - - - - 0x01E57E 0F:E56E: A8
	LDX ptr_02+1                    ;C - - - - - 0x01E57F 0F:E56F: A6 03
	LDA ram_06C0,Y                  ;C - - - - - 0x01E581 0F:E571: B9 C0 06
	STA vramQueue+3,X               ;C - - - - - 0x01E584 0F:E574: 9D 83 07
	LDA ram_06C4,Y                  ;C - - - - - 0x01E587 0F:E577: B9 C4 06
	STA vramQueue+4,X               ;C - - - - - 0x01E58A 0F:E57A: 9D 84 07
	LDA ram_0028                    ;C - - - - - 0x01E58D 0F:E57D: A5 28
	CMP #$38                        ;C - - - - - 0x01E58F 0F:E57F: C9 38
	BCS loc_0F_E58F                 ;C - - - - - 0x01E591 0F:E581: B0 0C
	LDA ram_06C8,Y                  ;C - - - - - 0x01E593 0F:E583: B9 C8 06
	STA vramQueue+5,X               ;C - - - - - 0x01E596 0F:E586: 9D 85 07
	LDA ram_06CC,Y                  ;C - - - - - 0x01E599 0F:E589: B9 CC 06
	STA vramQueue+6,X               ;C - - - - - 0x01E59C 0F:E58C: 9D 86 07
loc_0F_E58F:
	LDA ram_0024                    ;C - - - - - 0x01E59F 0F:E58F: A5 24
	AND #$01                        ;C - - - - - 0x01E5A1 0F:E591: 29 01
	BEQ loc_0F_E5BE                 ;C - - - - - 0x01E5A3 0F:E593: F0 29
	LDA spriteFlipMask              ;C - - - - - 0x01E5A5 0F:E595: A5 10
	AND tbl_0F_E603,Y               ;C - - - - - 0x01E5A7 0F:E597: 39 03 E6
	STA spriteFlipMask              ;C - - - - - 0x01E5AA 0F:E59A: 85 10
	LDA spritePriorityBit           ;C - - - - - 0x01E5AC 0F:E59C: A5 11
	AND tbl_0F_E607,Y               ;C - - - - - 0x01E5AE 0F:E59E: 39 07 E6
	ORA spriteFlipMask              ;C - - - - - 0x01E5B1 0F:E5A1: 05 10
	STA vramQueue+27,X              ;C - - - - - 0x01E5B3 0F:E5A3: 9D 9B 07
	LDY ram_0028                    ;C - - - - - 0x01E5B6 0F:E5A6: A4 28
	STA ram_0640,Y                  ;C - - - - - 0x01E5B8 0F:E5A8: 99 40 06
	LDA #$23                        ;C - - - - - 0x01E5BB 0F:E5AB: A9 23
	STA vramQueue+24,X              ;C - - - - - 0x01E5BD 0F:E5AD: 9D 98 07
	TYA                             ;C - - - - - 0x01E5C0 0F:E5B0: 98
	ORA #$C0                        ;C - - - - - 0x01E5C1 0F:E5B1: 09 C0
	CLC                             ;C - - - - - 0x01E5C3 0F:E5B3: 18
	ADC #$08                        ;C - - - - - 0x01E5C4 0F:E5B4: 69 08
	STA vramQueue+25,X              ;C - - - - - 0x01E5C6 0F:E5B6: 9D 99 07
	LDA #$00                        ;C - - - - - 0x01E5C9 0F:E5B9: A9 00
	STA vramQueue+26,X              ;C - - - - - 0x01E5CB 0F:E5BB: 9D 9A 07
loc_0F_E5BE:
	INC ptr_02+1                    ;C - - - - - 0x01E5CE 0F:E5BE: E6 03
	INC ptr_02+1                    ;C - - - - - 0x01E5D0 0F:E5C0: E6 03
	INC ptr_02+1                    ;C - - - - - 0x01E5D2 0F:E5C2: E6 03
	INC ptr_02+1                    ;C - - - - - 0x01E5D4 0F:E5C4: E6 03
	LDA ram_0028                    ;C - - - - - 0x01E5D6 0F:E5C6: A5 28
	CLC                             ;C - - - - - 0x01E5D8 0F:E5C8: 18
	ADC #$08                        ;C - - - - - 0x01E5D9 0F:E5C9: 69 08
	STA ram_0028                    ;C - - - - - 0x01E5DB 0F:E5CB: 85 28
	CMP #$28                        ;C - - - - - 0x01E5DD 0F:E5CD: C9 28
	BCC loc_0F_E5FE                 ;C - - - - - 0x01E5DF 0F:E5CF: 90 2D
	LDA #$20                        ;C - - - - - 0x01E5E1 0F:E5D1: A9 20
	STA vramQueue                   ;C - - - - - 0x01E5E3 0F:E5D3: 8D 80 07
	LDA ram_0024                    ;C - - - - - 0x01E5E6 0F:E5D6: A5 24
	CLC                             ;C - - - - - 0x01E5E8 0F:E5D8: 18
	ADC #$80                        ;C - - - - - 0x01E5E9 0F:E5D9: 69 80
	STA vramQueue+1                 ;C - - - - - 0x01E5EB 0F:E5DB: 8D 81 07
	LDA #$14                        ;C - - - - - 0x01E5EE 0F:E5DE: A9 14
	STA vramQueue+2                 ;C - - - - - 0x01E5F0 0F:E5E0: 8D 82 07
	LDY #$00                        ;C - - - - - 0x01E5F3 0F:E5E3: A0 00
	LDA ram_0024                    ;C - - - - - 0x01E5F5 0F:E5E5: A5 24
	AND #$01                        ;C - - - - - 0x01E5F7 0F:E5E7: 29 01
	BEQ loc_0F_E5ED                 ;C - - - - - 0x01E5F9 0F:E5E9: F0 02
	LDY #$14                        ;C - - - - - 0x01E5FB 0F:E5EB: A0 14
loc_0F_E5ED:
	LDA #$FF                        ;C - - - - - 0x01E5FD 0F:E5ED: A9 FF
	STA vramQueue+24,Y              ;C - - - - - 0x01E5FF 0F:E5EF: 99 98 07
	STA vramUpdateFlag1             ;C - - - - - 0x01E602 0F:E5F2: 85 1A
	LDA #$00                        ;C - - - - - 0x01E604 0F:E5F4: A9 00
	STA vramQueue+3                 ;C - - - - - 0x01E606 0F:E5F6: 8D 83 07
	STA vramQueue+23                ;C - - - - - 0x01E609 0F:E5F9: 8D 97 07
	CLC                             ;C - - - - - 0x01E60C 0F:E5FC: 18
	RTS                             ;C - - - - - 0x01E60D 0F:E5FD: 60
loc_0F_E5FE:
	JMP loc_0F_E560                 ;C - - - - - 0x01E60E 0F:E5FE: 4C 60 E5
tbl_0F_E601:
	.byte $FF                       ;- - - - - - 0x01E611 0F:E601:
	.byte $01                       ;- D 3 - - - 0x01E612 0F:E602:
tbl_0F_E603:
	.byte $33                       ;- - - - - - 0x01E613 0F:E603:
	.byte $33                       ;- D 3 - - - 0x01E614 0F:E604:
	.byte $CC                       ;- - - - - - 0x01E615 0F:E605:
	.byte $CC                       ;- D 3 - - - 0x01E616 0F:E606:
tbl_0F_E607:
	.byte $CC                       ;- - - - - - 0x01E617 0F:E607:
	.byte $CC                       ;- D 3 - - - 0x01E618 0F:E608:
	.byte $33                       ;- - - - - - 0x01E619 0F:E609:
	.byte $33                       ;- D 3 - - - 0x01E61A 0F:E60A:
tbl_0F_E60B:
	.byte $00,$FF                   ;- - - - - - 0x01E61B 0F:E60B:
tbl_0F_E60D:
	.byte $01,$1F                   ;- - - - - - 0x01E61D 0F:E60D:
; 4 blocks of the current 32x32 metatile -> ram_06C0.. tile buffer, attributes -> spriteFlipMask
StageLoadMetaTiles:
	JSR StageMetaPtr                ;C - - - - - 0x01E61F 0F:E60F: 20 53 E6
	LDY #$03                        ;C - - - - - 0x01E622 0F:E612: A0 03
	STY ptr_02                      ;C - - - - - 0x01E624 0F:E614: 84 02
	LDA #$00                        ;C - - - - - 0x01E626 0F:E616: A9 00
	STA spriteFlipMask              ;C - - - - - 0x01E628 0F:E618: 85 10
loc_0F_E61A:
	LDY ptr_02                      ;C - - - - - 0x01E62A 0F:E61A: A4 02
	LDX tbl_0F_E64F,Y               ;C - - - - - 0x01E62C 0F:E61C: BE 4F E6
	LDA (ptr_00),Y                  ;C - - - - - 0x01E62F 0F:E61F: B1 00
	TAY                             ;C - - - - - 0x01E631 0F:E621: A8
	LDA stageBlockTL,Y              ;C - - - - - 0x01E632 0F:E622: B9 00 BB
	STA ram_06C0,X                  ;C - - - - - 0x01E635 0F:E625: 9D C0 06
	LDA stageBlockTR,Y              ;C - - - - - 0x01E638 0F:E628: B9 00 BC
	STA ram_06C1,X                  ;C - - - - - 0x01E63B 0F:E62B: 9D C1 06
	LDA stageBlockBL,Y              ;C - - - - - 0x01E63E 0F:E62E: B9 00 BD
	STA ram_06C4,X                  ;C - - - - - 0x01E641 0F:E631: 9D C4 06
	LDA stageBlockBR,Y              ;C - - - - - 0x01E644 0F:E634: B9 00 BE
	STA ram_06C5,X                  ;C - - - - - 0x01E647 0F:E637: 9D C5 06
	LDA stageBlockAttr,Y            ;C - - - - - 0x01E64A 0F:E63A: B9 00 BF
	AND #$03                        ;C - - - - - 0x01E64D 0F:E63D: 29 03
	ORA spriteFlipMask              ;C - - - - - 0x01E64F 0F:E63F: 05 10
	STA spriteFlipMask              ;C - - - - - 0x01E651 0F:E641: 85 10
	DEC ptr_02                      ;C - - - - - 0x01E653 0F:E643: C6 02
	BMI loc_0F_E64E                 ;C - - - - - 0x01E655 0F:E645: 30 07
	ASL spriteFlipMask              ;C - - - - - 0x01E657 0F:E647: 06 10
	ASL spriteFlipMask              ;C - - - - - 0x01E659 0F:E649: 06 10
	JMP loc_0F_E61A                 ;C - - - - - 0x01E65B 0F:E64B: 4C 1A E6
loc_0F_E64E:
	RTS                             ;C - - - - - 0x01E65E 0F:E64E: 60
tbl_0F_E64F:
	.byte $00,$02,$08,$0A           ;- D 3 - - - 0x01E65F 0F:E64F:
; ptr_00 = $B700 + 4 * map[ram_0028] (the four 16x16 block ids of the metatile)
StageMetaPtr:
	JSR RefreshStageBank            ;C - - - - - 0x01E663 0F:E653: 20 DF C1
	LDA #$00                        ;C - - - - - 0x01E666 0F:E656: A9 00
	STA ptr_00+1                    ;C - - - - - 0x01E668 0F:E658: 85 01
	LDY ram_0028                    ;C - - - - - 0x01E66A 0F:E65A: A4 28
	LDA (ptr_20),Y                  ;C - - - - - 0x01E66C 0F:E65C: B1 20
	ASL A                           ;C - - - - - 0x01E66E 0F:E65E: 0A
	ROL ptr_00+1                    ;C - - - - - 0x01E66F 0F:E65F: 26 01
	ASL A                           ;C - - - - - 0x01E671 0F:E661: 0A
	ROL ptr_00+1                    ;C - - - - - 0x01E672 0F:E662: 26 01
	STA ptr_00                      ;C - - - - - 0x01E674 0F:E664: 85 00
	LDA ptr_00+1                    ;C - - - - - 0x01E676 0F:E666: A5 01
	CLC                             ;C - - - - - 0x01E678 0F:E668: 18
	ADC #$B7                        ;C - - - - - 0x01E679 0F:E669: 69 B7  ; metatile table at $B700, 4 block ids per entry
	STA ptr_00+1                    ;C - - - - - 0x01E67B 0F:E66B: 85 01
	RTS                             ;C - - - - - 0x01E67D 0F:E66D: 60
; Y = screen index; ptr_20 = $AF00 + 64 * stageFieldNN[Y] of the current section
StageScreenPtr:
	LDA stageSection                ;C - - - - - 0x01E67E 0F:E66E: A5 60
	BEQ loc_0F_E67A                 ;C - - - - - 0x01E680 0F:E670: F0 08
	CMP #$01                        ;C - - - - - 0x01E682 0F:E672: C9 01
	BEQ loc_0F_E680                 ;C - - - - - 0x01E684 0F:E674: F0 0A
	CMP #$02                        ;C - - - - - 0x01E686 0F:E676: C9 02
	BEQ loc_0F_E686                 ;C - - - - - 0x01E688 0F:E678: F0 0C
loc_0F_E67A:
	LDA stageField60_s0,Y           ;C - - - - - 0x01E68A 0F:E67A: B9 60 AE
	JMP loc_0F_E689                 ;C - - - - - 0x01E68D 0F:E67D: 4C 89 E6
loc_0F_E680:
	LDA stageField60_s1,Y           ;C - - - - - 0x01E690 0F:E680: B9 90 AE
	JMP loc_0F_E689                 ;C - - - - - 0x01E693 0F:E683: 4C 89 E6
loc_0F_E686:
	LDA stageField60_s2,Y           ;C - - - - - 0x01E696 0F:E686: B9 C0 AE
loc_0F_E689:
	PHA                             ;C - - - - - 0x01E699 0F:E689: 48
	LDA #$00                        ;C - - - - - 0x01E69A 0F:E68A: A9 00
	STA ptr_00                      ;C - - - - - 0x01E69C 0F:E68C: 85 00
	PLA                             ;C - - - - - 0x01E69E 0F:E68E: 68
	ASL A                           ;C - - - - - 0x01E69F 0F:E68F: 0A
	ROL ptr_00                      ;C - - - - - 0x01E6A0 0F:E690: 26 00
	ASL A                           ;C - - - - - 0x01E6A2 0F:E692: 0A
	ROL ptr_00                      ;C - - - - - 0x01E6A3 0F:E693: 26 00
	ASL A                           ;C - - - - - 0x01E6A5 0F:E695: 0A
	ROL ptr_00                      ;C - - - - - 0x01E6A6 0F:E696: 26 00
	ASL A                           ;C - - - - - 0x01E6A8 0F:E698: 0A
	ROL ptr_00                      ;C - - - - - 0x01E6A9 0F:E699: 26 00
	ASL A                           ;C - - - - - 0x01E6AB 0F:E69B: 0A
	ROL ptr_00                      ;C - - - - - 0x01E6AC 0F:E69C: 26 00
	ASL A                           ;C - - - - - 0x01E6AE 0F:E69E: 0A
	ROL ptr_00                      ;C - - - - - 0x01E6AF 0F:E69F: 26 00
	STA ptr_20                      ;C - - - - - 0x01E6B1 0F:E6A1: 85 20
	LDA ptr_00                      ;C - - - - - 0x01E6B3 0F:E6A3: A5 00
	CLC                             ;C - - - - - 0x01E6B5 0F:E6A5: 18  ; map screens at $AF00, 64 bytes each
ofs_0F_E6A6:
	ADC #$AF                        ;C - - - - - 0x01E6B6 0F:E6A6: 69 AF
	STA ptr_20+1                    ;C - - - - - 0x01E6B8 0F:E6A8: 85 21
	RTS                             ;C - - - - - 0x01E6BA 0F:E6AA: 60
; queues HUD health/name for the VRAM update
UpdateStatusBar:
	LDA vramUpdateFlag0             ;C - - - - - 0x01E6BB 0F:E6AB: A5 19
	ORA vramUpdateFlag1             ;C - - - - - 0x01E6BD 0F:E6AD: 05 1A
	BNE loc_0F_E6DC                 ;C - - - - - 0x01E6BF 0F:E6AF: D0 2B
	LDA gameOverFlag                ;C - - - - - 0x01E6C1 0F:E6B1: A5 62
	BEQ loc_0F_E6BE                 ;C - - - - - 0x01E6C3 0F:E6B3: F0 09
	CMP #$F9                        ;C - - - - - 0x01E6C5 0F:E6B5: C9 F9
	BNE loc_0F_E6DC                 ;C - - - - - 0x01E6C7 0F:E6B7: D0 23
	LDA #$00                        ;C - - - - - 0x01E6C9 0F:E6B9: A9 00
	STA gameOverFlag                ;C - - - - - 0x01E6CB 0F:E6BB: 85 62
	RTS                             ;C - - - - - 0x01E6CD 0F:E6BD: 60
loc_0F_E6BE:
	LDA gameAction                  ;C - - - - - 0x01E6CE 0F:E6BE: A5 30
	CMP #$0E                        ;C - - - - - 0x01E6D0 0F:E6C0: C9 0E
	BEQ loc_0F_E6DC                 ;C - - - - - 0x01E6D2 0F:E6C2: F0 18
	JSR QueueHudHealthBar           ;C - - - - - 0x01E6D4 0F:E6C4: 20 DD E6
	LDA gameAction                  ;C - - - - - 0x01E6D7 0F:E6C7: A5 30
	CMP #$04                        ;C - - - - - 0x01E6D9 0F:E6C9: C9 04
	BNE loc_0F_E6D5                 ;C - - - - - 0x01E6DB 0F:E6CB: D0 08
	LDX ram_0039                    ;C - - - - - 0x01E6DD 0F:E6CD: A6 39
	STX ram_00B0                    ;C - - - - - 0x01E6DF 0F:E6CF: 86 B0
	LDA #$00                        ;C - - - - - 0x01E6E1 0F:E6D1: A9 00
	STA ram_00B1                    ;C - - - - - 0x01E6E3 0F:E6D3: 85 B1
loc_0F_E6D5:
	JSR SelectHudEnemy              ;C - - - - - 0x01E6E5 0F:E6D5: 20 9B E8
	LDA #$FF                        ;C - - - - - 0x01E6E8 0F:E6D8: A9 FF
	STA vramQueueFlag               ;C - - - - - 0x01E6EA 0F:E6DA: 85 64
loc_0F_E6DC:
	RTS                             ;C - - - - - 0x01E6EC 0F:E6DC: 60
; player name + health bar into vramQueue
QueueHudHealthBar:
	LDX vramQueueEnd                ;C - - - - - 0x01E6ED 0F:E6DD: A6 65
	LDA gameAction                  ;C - - - - - 0x01E6EF 0F:E6DF: A5 30
	CMP #$27                        ;C - - - - - 0x01E6F1 0F:E6E1: C9 27
	BEQ loc_0F_E742                 ;C - - - - - 0x01E6F3 0F:E6E3: F0 5D
	LDY playerLevel                 ;C - - - - - 0x01E6F5 0F:E6E5: A4 6B
	LDA playerId                    ;C - - - - - 0x01E6F7 0F:E6E7: A5 34
	BEQ loc_0F_E6F9                 ;C - - - - - 0x01E6F9 0F:E6E9: F0 0E
	CMP #$01                        ;C - - - - - 0x01E6FB 0F:E6EB: C9 01
	BEQ loc_0F_E6F4                 ;C - - - - - 0x01E6FD 0F:E6ED: F0 05
	LDA tbl_0F_E875,Y               ;C - - - - - 0x01E6FF 0F:E6EF: B9 75 E8
	BNE loc_0F_E6FC                 ;C - - - - - 0x01E702 0F:E6F2: D0 08
loc_0F_E6F4:
	LDA tbl_0F_E86F,Y               ;C - - - - - 0x01E704 0F:E6F4: B9 6F E8
	BNE loc_0F_E6FC                 ;C - - - - - 0x01E707 0F:E6F7: D0 03
loc_0F_E6F9:
	LDA tbl_0F_E869,Y               ;C - - - - - 0x01E709 0F:E6F9: B9 69 E8
loc_0F_E6FC:
	STA vramQueue,X                 ;C - - - - - 0x01E70C 0F:E6FC: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E70F 0F:E6FF: FE 80 07
	STA ptr_00                      ;C - - - - - 0x01E712 0F:E702: 85 00
	INX                             ;C - - - - - 0x01E714 0F:E704: E8
	LDA #$20                        ;C - - - - - 0x01E715 0F:E705: A9 20
	STA vramQueue,X                 ;C - - - - - 0x01E717 0F:E707: 9D 80 07
	INX                             ;C - - - - - 0x01E71A 0F:E70A: E8
	LDA #$4A                        ;C - - - - - 0x01E71B 0F:E70B: A9 4A
	STA vramQueue,X                 ;C - - - - - 0x01E71D 0F:E70D: 9D 80 07
	INX                             ;C - - - - - 0x01E720 0F:E710: E8
	LDA playerHealth                ;C - - - - - 0x01E721 0F:E711: A5 3A
	BPL loc_0F_E717                 ;C - - - - - 0x01E723 0F:E713: 10 02
	LDA #$00                        ;C - - - - - 0x01E725 0F:E715: A9 00
loc_0F_E717:
	STA ptr_00+1                    ;C - - - - - 0x01E727 0F:E717: 85 01
loc_0F_E719:
	LDA ptr_00+1                    ;C - - - - - 0x01E729 0F:E719: A5 01
	BMI loc_0F_E729                 ;C - - - - - 0x01E72B 0F:E71B: 30 0C
	BEQ loc_0F_E72B                 ;C - - - - - 0x01E72D 0F:E71D: F0 0C
	CMP #$07                        ;C - - - - - 0x01E72F 0F:E71F: C9 07
	BCS loc_0F_E725                 ;C - - - - - 0x01E731 0F:E721: B0 02
	BNE loc_0F_E72B                 ;C - - - - - 0x01E733 0F:E723: D0 06
loc_0F_E725:
	LDA #$18                        ;C - - - - - 0x01E735 0F:E725: A9 18
	BNE loc_0F_E72B                 ;C - - - - - 0x01E737 0F:E727: D0 02
loc_0F_E729:
	LDA #$10                        ;C - - - - - 0x01E739 0F:E729: A9 10
loc_0F_E72B:
	ORA #$10                        ;C - - - - - 0x01E73B 0F:E72B: 09 10
	STA vramQueue,X                 ;C - - - - - 0x01E73D 0F:E72D: 9D 80 07
	LDA ptr_00+1                    ;C - - - - - 0x01E740 0F:E730: A5 01
	SEC                             ;C - - - - - 0x01E742 0F:E732: 38
	SBC #$08                        ;C - - - - - 0x01E743 0F:E733: E9 08
	STA ptr_00+1                    ;C - - - - - 0x01E745 0F:E735: 85 01
	INX                             ;C - - - - - 0x01E747 0F:E737: E8
	DEC ptr_00                      ;C - - - - - 0x01E748 0F:E738: C6 00
	BNE loc_0F_E719                 ;C - - - - - 0x01E74A 0F:E73A: D0 DD
	LDA #$1A                        ;C - - - - - 0x01E74C 0F:E73C: A9 1A
	STA vramQueue,X                 ;C - - - - - 0x01E74E 0F:E73E: 9D 80 07
	INX                             ;C - - - - - 0x01E751 0F:E741: E8
loc_0F_E742:
	LDA #$01                        ;C - - - - - 0x01E752 0F:E742: A9 01
	STA vramQueue,X                 ;C - - - - - 0x01E754 0F:E744: 9D 80 07
	INX                             ;C - - - - - 0x01E757 0F:E747: E8
	LDA #$20                        ;C - - - - - 0x01E758 0F:E748: A9 20
	STA vramQueue,X                 ;C - - - - - 0x01E75A 0F:E74A: 9D 80 07
	INX                             ;C - - - - - 0x01E75D 0F:E74D: E8
	LDA #$5C                        ;C - - - - - 0x01E75E 0F:E74E: A9 5C
	STA vramQueue,X                 ;C - - - - - 0x01E760 0F:E750: 9D 80 07
	INX                             ;C - - - - - 0x01E763 0F:E753: E8
	LDA stage                       ;C - - - - - 0x01E764 0F:E754: A5 61
	STA vramQueue,X                 ;C - - - - - 0x01E766 0F:E756: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E769 0F:E759: FE 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E76C 0F:E75C: FE 80 07
	INX                             ;C - - - - - 0x01E76F 0F:E75F: E8
	LDA #$01                        ;C - - - - - 0x01E770 0F:E760: A9 01
	STA vramQueue,X                 ;C - - - - - 0x01E772 0F:E762: 9D 80 07
	INX                             ;C - - - - - 0x01E775 0F:E765: E8
	LDA #$20                        ;C - - - - - 0x01E776 0F:E766: A9 20
	STA vramQueue,X                 ;C - - - - - 0x01E778 0F:E768: 9D 80 07
	INX                             ;C - - - - - 0x01E77B 0F:E76B: E8
	LDA #$7C                        ;C - - - - - 0x01E77C 0F:E76C: A9 7C
	STA vramQueue,X                 ;C - - - - - 0x01E77E 0F:E76E: 9D 80 07
	INX                             ;C - - - - - 0x01E781 0F:E771: E8
	LDA lives                       ;C - - - - - 0x01E782 0F:E772: A5 3E
	AND #$0F                        ;C - - - - - 0x01E784 0F:E774: 29 0F
	STA vramQueue,X                 ;C - - - - - 0x01E786 0F:E776: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E789 0F:E779: FE 80 07
	INX                             ;C - - - - - 0x01E78C 0F:E77C: E8
	LDA #$01                        ;C - - - - - 0x01E78D 0F:E77D: A9 01
	STA vramQueue,X                 ;C - - - - - 0x01E78F 0F:E77F: 9D 80 07
	INX                             ;C - - - - - 0x01E792 0F:E782: E8
	LDA #$23                        ;C - - - - - 0x01E793 0F:E783: A9 23
	STA vramQueue,X                 ;C - - - - - 0x01E795 0F:E785: 9D 80 07
	INX                             ;C - - - - - 0x01E798 0F:E788: E8
	LDA #$49                        ;C - - - - - 0x01E799 0F:E789: A9 49
	CLC                             ;C - - - - - 0x01E79B 0F:E78B: 18
	ADC playerLevel                 ;C - - - - - 0x01E79C 0F:E78C: 65 6B
	STA vramQueue,X                 ;C - - - - - 0x01E79E 0F:E78E: 9D 80 07
	LDA playerId                    ;C - - - - - 0x01E7A1 0F:E791: A5 34
	CMP #$02                        ;C - - - - - 0x01E7A3 0F:E793: C9 02
	BNE loc_0F_E79D                 ;C - - - - - 0x01E7A5 0F:E795: D0 06
	INC vramQueue,X                 ;C - - - - - 0x01E7A7 0F:E797: FE 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E7AA 0F:E79A: FE 80 07
loc_0F_E79D:
	INX                             ;C - - - - - 0x01E7AD 0F:E79D: E8
	LDA #$73                        ;C - - - - - 0x01E7AE 0F:E79E: A9 73
	STA vramQueue,X                 ;C - - - - - 0x01E7B0 0F:E7A0: 9D 80 07
	INX                             ;C - - - - - 0x01E7B3 0F:E7A3: E8
	LDA #$03                        ;C - - - - - 0x01E7B4 0F:E7A4: A9 03
	STA vramQueue,X                 ;C - - - - - 0x01E7B6 0F:E7A6: 9D 80 07
	INX                             ;C - - - - - 0x01E7B9 0F:E7A9: E8
	LDA #$23                        ;C - - - - - 0x01E7BA 0F:E7AA: A9 23
	STA vramQueue,X                 ;C - - - - - 0x01E7BC 0F:E7AC: 9D 80 07
	INX                             ;C - - - - - 0x01E7BF 0F:E7AF: E8
	LDA #$56                        ;C - - - - - 0x01E7C0 0F:E7B0: A9 56
	STA vramQueue,X                 ;C - - - - - 0x01E7C2 0F:E7B2: 9D 80 07
	INX                             ;C - - - - - 0x01E7C5 0F:E7B5: E8
	LDA playerId                    ;C - - - - - 0x01E7C6 0F:E7B6: A5 34
	CMP #$02                        ;C - - - - - 0x01E7C8 0F:E7B8: C9 02
	BEQ loc_0F_E7C4                 ;C - - - - - 0x01E7CA 0F:E7BA: F0 08
	LDA playerLevel                 ;C - - - - - 0x01E7CC 0F:E7BC: A5 6B
	CMP #$05                        ;C - - - - - 0x01E7CE 0F:E7BE: C9 05
	BEQ loc_0F_E7F2                 ;C - - - - - 0x01E7D0 0F:E7C0: F0 30
	BNE loc_0F_E7CA                 ;C - - - - - 0x01E7D2 0F:E7C2: D0 06
loc_0F_E7C4:
	LDA playerLevel                 ;C - - - - - 0x01E7D4 0F:E7C4: A5 6B
	CMP #$03                        ;C - - - - - 0x01E7D6 0F:E7C6: C9 03
	BEQ loc_0F_E7F2                 ;C - - - - - 0x01E7D8 0F:E7C8: F0 28
loc_0F_E7CA:
	LDA playerExp+1                 ;C - - - - - 0x01E7DA 0F:E7CA: A5 6D
	AND #$0F                        ;C - - - - - 0x01E7DC 0F:E7CC: 29 0F
	STA vramQueue,X                 ;C - - - - - 0x01E7DE 0F:E7CE: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E7E1 0F:E7D1: FE 80 07
	INX                             ;C - - - - - 0x01E7E4 0F:E7D4: E8
	LDA playerExp                   ;C - - - - - 0x01E7E5 0F:E7D5: A5 6C
	AND #$F0                        ;C - - - - - 0x01E7E7 0F:E7D7: 29 F0
	LSR A                           ;C - - - - - 0x01E7E9 0F:E7D9: 4A
	LSR A                           ;C - - - - - 0x01E7EA 0F:E7DA: 4A
	LSR A                           ;C - - - - - 0x01E7EB 0F:E7DB: 4A
	LSR A                           ;C - - - - - 0x01E7EC 0F:E7DC: 4A
	STA vramQueue,X                 ;C - - - - - 0x01E7ED 0F:E7DD: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E7F0 0F:E7E0: FE 80 07
	INX                             ;C - - - - - 0x01E7F3 0F:E7E3: E8
	LDA playerExp                   ;C - - - - - 0x01E7F4 0F:E7E4: A5 6C
	AND #$0F                        ;C - - - - - 0x01E7F6 0F:E7E6: 29 0F
	STA vramQueue,X                 ;C - - - - - 0x01E7F8 0F:E7E8: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E7FB 0F:E7EB: FE 80 07
	INX                             ;C - - - - - 0x01E7FE 0F:E7EE: E8
	JMP loc_0F_E7F5                 ;C - - - - - 0x01E7FF 0F:E7EF: 4C F5 E7
loc_0F_E7F2:
	JSR QueueHudFiller              ;C - - - - - 0x01E802 0F:E7F2: 20 56 E8
loc_0F_E7F5:
	LDA #$03                        ;C - - - - - 0x01E805 0F:E7F5: A9 03
	STA vramQueue,X                 ;C - - - - - 0x01E807 0F:E7F7: 9D 80 07
	INX                             ;C - - - - - 0x01E80A 0F:E7FA: E8
	LDA #$23                        ;C - - - - - 0x01E80B 0F:E7FB: A9 23
	STA vramQueue,X                 ;C - - - - - 0x01E80D 0F:E7FD: 9D 80 07
	INX                             ;C - - - - - 0x01E810 0F:E800: E8
	LDA #$5A                        ;C - - - - - 0x01E811 0F:E801: A9 5A
	STA vramQueue,X                 ;C - - - - - 0x01E813 0F:E803: 9D 80 07
	INX                             ;C - - - - - 0x01E816 0F:E806: E8
	LDY playerId                    ;C - - - - - 0x01E817 0F:E807: A4 34
	CPY #$02                        ;C - - - - - 0x01E819 0F:E809: C0 02
	BEQ loc_0F_E815                 ;C - - - - - 0x01E81B 0F:E80B: F0 08
	LDA playerLevel                 ;C - - - - - 0x01E81D 0F:E80D: A5 6B
	CMP #$05                        ;C - - - - - 0x01E81F 0F:E80F: C9 05
	BEQ loc_0F_E850                 ;C - - - - - 0x01E821 0F:E811: F0 3D
	BNE loc_0F_E81B                 ;C - - - - - 0x01E823 0F:E813: D0 06
loc_0F_E815:
	LDA playerLevel                 ;C - - - - - 0x01E825 0F:E815: A5 6B
	CMP #$03                        ;C - - - - - 0x01E827 0F:E817: C9 03
	BEQ loc_0F_E850                 ;C - - - - - 0x01E829 0F:E819: F0 35
loc_0F_E81B:
	LDA tbl_0F_E87B,Y               ;C - - - - - 0x01E82B 0F:E81B: B9 7B E8
	STA ptr_00                      ;C - - - - - 0x01E82E 0F:E81E: 85 00
	LDA tbl_0F_E87E,Y               ;C - - - - - 0x01E830 0F:E820: B9 7E E8
	STA ptr_00+1                    ;C - - - - - 0x01E833 0F:E823: 85 01
	LDA playerLevel                 ;C - - - - - 0x01E835 0F:E825: A5 6B
	ASL A                           ;C - - - - - 0x01E837 0F:E827: 0A
	TAY                             ;C - - - - - 0x01E838 0F:E828: A8
	LDA (ptr_00),Y                  ;C - - - - - 0x01E839 0F:E829: B1 00
	STA vramQueue,X                 ;C - - - - - 0x01E83B 0F:E82B: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E83E 0F:E82E: FE 80 07
	INX                             ;C - - - - - 0x01E841 0F:E831: E8
	INY                             ;C - - - - - 0x01E842 0F:E832: C8
	LDA (ptr_00),Y                  ;C - - - - - 0x01E843 0F:E833: B1 00
	AND #$F0                        ;C - - - - - 0x01E845 0F:E835: 29 F0
	LSR A                           ;C - - - - - 0x01E847 0F:E837: 4A
	LSR A                           ;C - - - - - 0x01E848 0F:E838: 4A
	LSR A                           ;C - - - - - 0x01E849 0F:E839: 4A
	LSR A                           ;C - - - - - 0x01E84A 0F:E83A: 4A
	STA vramQueue,X                 ;C - - - - - 0x01E84B 0F:E83B: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E84E 0F:E83E: FE 80 07
	INX                             ;C - - - - - 0x01E851 0F:E841: E8
	LDA (ptr_00),Y                  ;C - - - - - 0x01E852 0F:E842: B1 00
	AND #$0F                        ;C - - - - - 0x01E854 0F:E844: 29 0F
	STA vramQueue,X                 ;C - - - - - 0x01E856 0F:E846: 9D 80 07
	INC vramQueue,X                 ;C - - - - - 0x01E859 0F:E849: FE 80 07
	INX                             ;C - - - - - 0x01E85C 0F:E84C: E8
	JMP loc_0F_E853                 ;C - - - - - 0x01E85D 0F:E84D: 4C 53 E8
loc_0F_E850:
	JSR QueueHudFiller              ;C - - - - - 0x01E860 0F:E850: 20 56 E8
loc_0F_E853:
	STX vramQueueEnd                ;C - - - - - 0x01E863 0F:E853: 86 65
	RTS                             ;C - - - - - 0x01E865 0F:E855: 60
; three $78 tiles into vramQueue
QueueHudFiller:
	LDA #$78                        ;C - - - - - 0x01E866 0F:E856: A9 78
	STA vramQueue,X                 ;C - - - - - 0x01E868 0F:E858: 9D 80 07
	INX                             ;C - - - - - 0x01E86B 0F:E85B: E8
	LDA #$78                        ;C - - - - - 0x01E86C 0F:E85C: A9 78
	STA vramQueue,X                 ;C - - - - - 0x01E86E 0F:E85E: 9D 80 07
	INX                             ;C - - - - - 0x01E871 0F:E861: E8
	LDA #$78                        ;C - - - - - 0x01E872 0F:E862: A9 78
	STA vramQueue,X                 ;C - - - - - 0x01E874 0F:E864: 9D 80 07
	INX                             ;C - - - - - 0x01E877 0F:E867: E8
	RTS                             ;C - - - - - 0x01E878 0F:E868: 60
tbl_0F_E869:
	.byte $08,$09,$0A,$0B,$0C       ;- D 3 - - - 0x01E879 0F:E869:
	.byte $0D                       ;- - - - - - 0x01E87E 0F:E86E:
tbl_0F_E86F:
	.byte $06,$07,$08,$09,$0A,$0B   ;- D 3 - - - 0x01E87F 0F:E86F:
tbl_0F_E875:
	.byte $0A,$0B,$0C,$0D           ;- D 3 - - - 0x01E885 0F:E875:
	.byte $0D,$0D                   ;- - - - - - 0x01E889 0F:E879:
tbl_0F_E87B:
	.lobytes tbl_0F_E881, tbl_0F_E88B, tbl_0F_E895;- D 3 - - - 0x01E88B 0F:E87B:
tbl_0F_E87E:
	.hibytes tbl_0F_E881, tbl_0F_E88B, tbl_0F_E895;- D 3 - - - 0x01E88E 0F:E87E:
tbl_0F_E881:
	.byte $00,$33,$00               ;- D 3 - I - 0x01E891 0F:E881:
tbl_0F_E884:
	.byte $54,$00,$90,$01,$47,$02,$50;- D 3 - I - 0x01E894 0F:E884:
tbl_0F_E88B:
	.byte $00,$27,$00,$45,$00,$74,$01,$22,$02,$10;- D 3 - I - 0x01E89B 0F:E88B:
tbl_0F_E895:
	.byte $01,$25,$01,$93,$03,$70   ;- D 3 - I - 0x01E8A5 0F:E895:
; picks the enemy shown on the HUD (objSpriteDown 7/8/9/B)
SelectHudEnemy:
	LDY #$02                        ;C - - - - - 0x01E8AB 0F:E89B: A0 02
loc_0F_E89D:
	LDA objSpriteDown,Y             ;C - - - - - 0x01E8AD 0F:E89D: B9 B0 05
	CMP #$07                        ;C - - - - - 0x01E8B0 0F:E8A0: C9 07
	BEQ loc_0F_E8B8                 ;C - - - - - 0x01E8B2 0F:E8A2: F0 14
	CMP #$08                        ;C - - - - - 0x01E8B4 0F:E8A4: C9 08
	BEQ loc_0F_E8B8                 ;C - - - - - 0x01E8B6 0F:E8A6: F0 10
	CMP #$09                        ;C - - - - - 0x01E8B8 0F:E8A8: C9 09
ofs_0F_E8AA:
	BEQ loc_0F_E8B8                 ;C - - - - - 0x01E8BA 0F:E8AA: F0 0C
	CMP #$0B                        ;C - - - - - 0x01E8BC 0F:E8AC: C9 0B
	BEQ loc_0F_E8B8                 ;C - - - - - 0x01E8BE 0F:E8AE: F0 08
	INY                             ;C - - - - - 0x01E8C0 0F:E8B0: C8
	CPY #$10                        ;C - - - - - 0x01E8C1 0F:E8B1: C0 10
	BNE loc_0F_E89D                 ;C - - - - - 0x01E8C3 0F:E8B3: D0 E8
	JMP loc_0F_E8BD                 ;C - - - - - 0x01E8C5 0F:E8B5: 4C BD E8
loc_0F_E8B8:
	LDA objLife,Y                   ;C - - - - - 0x01E8C8 0F:E8B8: B9 90 04
	BPL loc_0F_E8C2                 ;C - - - - - 0x01E8CB 0F:E8BB: 10 05
loc_0F_E8BD:
	LDA ram_00B0                    ;C - - - - - 0x01E8CD 0F:E8BD: A5 B0
	BNE loc_0F_E8C9                 ;C - - - - - 0x01E8CF 0F:E8BF: D0 08
	RTS                             ;C - - - - - 0x01E8D1 0F:E8C1: 60
loc_0F_E8C2:
	LDA #$01                        ;C - - - - - 0x01E8D2 0F:E8C2: A9 01
	STA ram_00B1                    ;C - - - - - 0x01E8D4 0F:E8C4: 85 B1
	STY ram_00B0                    ;C - - - - - 0x01E8D6 0F:E8C6: 84 B0
	TYA                             ;C - - - - - 0x01E8D8 0F:E8C8: 98
loc_0F_E8C9:
	TAY                             ;C - - - - - 0x01E8D9 0F:E8C9: A8
	LDX vramQueueEnd                ;C - - - - - 0x01E8DA 0F:E8CA: A6 65
	LDA #$0F                        ;C - - - - - 0x01E8DC 0F:E8CC: A9 0F
	STA vramQueue,X                 ;C - - - - - 0x01E8DE 0F:E8CE: 9D 80 07
	STA ptr_02                      ;C - - - - - 0x01E8E1 0F:E8D1: 85 02
	INX                             ;C - - - - - 0x01E8E3 0F:E8D3: E8
	LDA #$20                        ;C - - - - - 0x01E8E4 0F:E8D4: A9 20
	STA vramQueue,X                 ;C - - - - - 0x01E8E6 0F:E8D6: 9D 80 07
	INX                             ;C - - - - - 0x01E8E9 0F:E8D9: E8
	LDA #$69                        ;C - - - - - 0x01E8EA 0F:E8DA: A9 69
	STA vramQueue,X                 ;C - - - - - 0x01E8EC 0F:E8DC: 9D 80 07
	INX                             ;C - - - - - 0x01E8EF 0F:E8DF: E8
	LDA objHudLife,Y                ;C - - - - - 0x01E8F0 0F:E8E0: B9 A0 04
	LSR A                           ;C - - - - - 0x01E8F3 0F:E8E3: 4A
	LSR A                           ;C - - - - - 0x01E8F4 0F:E8E4: 4A
	LSR A                           ;C - - - - - 0x01E8F5 0F:E8E5: 4A
	STA ptr_00                      ;C - - - - - 0x01E8F6 0F:E8E6: 85 00
	BEQ loc_0F_E93F                 ;C - - - - - 0x01E8F8 0F:E8E8: F0 55
	INC ram_00B1                    ;C - - - - - 0x01E8FA 0F:E8EA: E6 B1
	LDA ram_00B1                    ;C - - - - - 0x01E8FC 0F:E8EC: A5 B1
	CMP #$96                        ;C - - - - - 0x01E8FE 0F:E8EE: C9 96
	BEQ loc_0F_E93F                 ;C - - - - - 0x01E900 0F:E8F0: F0 4D
	LDA objLife,Y                   ;C - - - - - 0x01E902 0F:E8F2: B9 90 04
	BPL loc_0F_E903                 ;C - - - - - 0x01E905 0F:E8F5: 10 0C
	LDA ram_00B1                    ;C - - - - - 0x01E907 0F:E8F7: A5 B1
	CMP #$1E                        ;C - - - - - 0x01E909 0F:E8F9: C9 1E
	BEQ loc_0F_E93F                 ;C - - - - - 0x01E90B 0F:E8FB: F0 42
	AND #$02                        ;C - - - - - 0x01E90D 0F:E8FD: 29 02
	BNE loc_0F_E947                 ;C - - - - - 0x01E90F 0F:E8FF: D0 46
	LDA #$00                        ;C - - - - - 0x01E911 0F:E901: A9 00
loc_0F_E903:
	STA ptr_00+1                    ;C - - - - - 0x01E913 0F:E903: 85 01
	LDA #$19                        ;C - - - - - 0x01E915 0F:E905: A9 19
	STA vramQueue,X                 ;C - - - - - 0x01E917 0F:E907: 9D 80 07
	INX                             ;C - - - - - 0x01E91A 0F:E90A: E8
	DEC ptr_02                      ;C - - - - - 0x01E91B 0F:E90B: C6 02
loc_0F_E90D:
	LDA ptr_00+1                    ;C - - - - - 0x01E91D 0F:E90D: A5 01
	BMI loc_0F_E91D                 ;C - - - - - 0x01E91F 0F:E90F: 30 0C
	BEQ loc_0F_E91F                 ;C - - - - - 0x01E921 0F:E911: F0 0C
	CMP #$07                        ;C - - - - - 0x01E923 0F:E913: C9 07
	BCS loc_0F_E919                 ;C - - - - - 0x01E925 0F:E915: B0 02
	BNE loc_0F_E91F                 ;C - - - - - 0x01E927 0F:E917: D0 06
loc_0F_E919:
	LDA #$18                        ;C - - - - - 0x01E929 0F:E919: A9 18
	BNE loc_0F_E91F                 ;C - - - - - 0x01E92B 0F:E91B: D0 02
loc_0F_E91D:
	LDA #$10                        ;C - - - - - 0x01E92D 0F:E91D: A9 10
loc_0F_E91F:
	ORA #$10                        ;C - - - - - 0x01E92F 0F:E91F: 09 10
	STA vramQueue,X                 ;C - - - - - 0x01E931 0F:E921: 9D 80 07
	INX                             ;C - - - - - 0x01E934 0F:E924: E8
	DEC ptr_02                      ;C - - - - - 0x01E935 0F:E925: C6 02
	LDA ptr_00+1                    ;C - - - - - 0x01E937 0F:E927: A5 01
	SEC                             ;C - - - - - 0x01E939 0F:E929: 38
	SBC #$08                        ;C - - - - - 0x01E93A 0F:E92A: E9 08
	STA ptr_00+1                    ;C - - - - - 0x01E93C 0F:E92C: 85 01
	DEC ptr_00                      ;C - - - - - 0x01E93E 0F:E92E: C6 00
	BNE loc_0F_E90D                 ;C - - - - - 0x01E940 0F:E930: D0 DB
	LDA #$1A                        ;C - - - - - 0x01E942 0F:E932: A9 1A
	STA vramQueue,X                 ;C - - - - - 0x01E944 0F:E934: 9D 80 07
	INX                             ;C - - - - - 0x01E947 0F:E937: E8
	DEC ptr_02                      ;C - - - - - 0x01E948 0F:E938: C6 02
	BNE loc_0F_E947                 ;C - - - - - 0x01E94A 0F:E93A: D0 0B
	STX vramQueueEnd                ;C - - - - - 0x01E94C 0F:E93C: 86 65
	RTS                             ;C - - - - - 0x01E94E 0F:E93E: 60
loc_0F_E93F:
	LDA #$95                        ;C - - - - - 0x01E94F 0F:E93F: A9 95
	STA ram_00B1                    ;C - - - - - 0x01E951 0F:E941: 85 B1
	LDA #$0F                        ;C - - - - - 0x01E953 0F:E943: A9 0F
	STA ptr_02                      ;C - - - - - 0x01E955 0F:E945: 85 02
loc_0F_E947:
	LDA #$00                        ;C - - - - - 0x01E957 0F:E947: A9 00
	STA vramQueue,X                 ;C - - - - - 0x01E959 0F:E949: 9D 80 07
	INX                             ;C - - - - - 0x01E95C 0F:E94C: E8
	DEC ptr_02                      ;C - - - - - 0x01E95D 0F:E94D: C6 02
	BNE loc_0F_E947                 ;C - - - - - 0x01E95F 0F:E94F: D0 F6
	STX vramQueueEnd                ;C - - - - - 0x01E961 0F:E951: 86 65
	RTS                             ;C - - - - - 0x01E963 0F:E953: 60
; 6 bytes from tables by playerLevel to PPU $2349
QueueHudLevelText:
	LDX vramQueueEnd                ;C - - - - - 0x01E964 0F:E954: A6 65
	LDA #$06                        ;C - - - - - 0x01E966 0F:E956: A9 06
	STA vramQueue,X                 ;C - - - - - 0x01E968 0F:E958: 9D 80 07
	INX                             ;C - - - - - 0x01E96B 0F:E95B: E8
	LDA #$23                        ;C - - - - - 0x01E96C 0F:E95C: A9 23
	STA vramQueue,X                 ;C - - - - - 0x01E96E 0F:E95E: 9D 80 07
	INX                             ;C - - - - - 0x01E971 0F:E961: E8
	LDA #$49                        ;C - - - - - 0x01E972 0F:E962: A9 49
	STA vramQueue,X                 ;C - - - - - 0x01E974 0F:E964: 9D 80 07
	INX                             ;C - - - - - 0x01E977 0F:E967: E8
	LDY playerLevel                 ;C - - - - - 0x01E978 0F:E968: A4 6B
	LDA playerId                    ;C - - - - - 0x01E97A 0F:E96A: A5 34
	CMP #$02                        ;C - - - - - 0x01E97C 0F:E96C: C9 02
	BNE loc_0F_E972                 ;C - - - - - 0x01E97E 0F:E96E: D0 02
	INY                             ;C - - - - - 0x01E980 0F:E970: C8
	INY                             ;C - - - - - 0x01E981 0F:E971: C8
loc_0F_E972:
	LDA tbl_0F_E98C,Y               ;C - - - - - 0x01E982 0F:E972: B9 8C E9
	STA ptr_00                      ;C - - - - - 0x01E985 0F:E975: 85 00
	LDA tbl_0F_E992,Y               ;C - - - - - 0x01E987 0F:E977: B9 92 E9
	STA ptr_00+1                    ;C - - - - - 0x01E98A 0F:E97A: 85 01
	LDY #$00                        ;C - - - - - 0x01E98C 0F:E97C: A0 00
loc_0F_E97E:
	LDA (ptr_00),Y                  ;C - - - - - 0x01E98E 0F:E97E: B1 00
	STA vramQueue,X                 ;C - - - - - 0x01E990 0F:E980: 9D 80 07
	INX                             ;C - - - - - 0x01E993 0F:E983: E8
	INY                             ;C - - - - - 0x01E994 0F:E984: C8
	CPY #$06                        ;C - - - - - 0x01E995 0F:E985: C0 06
	BNE loc_0F_E97E                 ;C - - - - - 0x01E997 0F:E987: D0 F5
	STX vramQueueEnd                ;C - - - - - 0x01E999 0F:E989: 86 65
	RTS                             ;C - - - - - 0x01E99B 0F:E98B: 60
tbl_0F_E98C:
	.lobytes tbl_0F_E998, tbl_0F_E99E, tbl_0F_E9A4, tbl_0F_E9AA, tbl_0F_E9B0, tbl_0F_E9B6;- D 3 - - - 0x01E99C 0F:E98C:
tbl_0F_E992:
	.hibytes tbl_0F_E998, tbl_0F_E99E, tbl_0F_E9A4, tbl_0F_E9AA, tbl_0F_E9B0, tbl_0F_E9B6;- D 3 - - - 0x01E9A2 0F:E992:
tbl_0F_E998:
	.byte $73,$74,$74,$74,$74,$74   ;- D 3 - I - 0x01E9A8 0F:E998:
tbl_0F_E99E:
	.byte $73,$73,$74,$74,$74,$74   ;- D 3 - I - 0x01E9AE 0F:E99E:
tbl_0F_E9A4:
	.byte $73,$73,$73,$74,$74,$74   ;- D 3 - I - 0x01E9B4 0F:E9A4:
tbl_0F_E9AA:
	.byte $73,$73,$73,$73,$74,$74   ;- D 3 - I - 0x01E9BA 0F:E9AA:
tbl_0F_E9B0:
	.byte $73,$73,$73,$73,$73,$74   ;- D 3 - I - 0x01E9C0 0F:E9B0:
tbl_0F_E9B6:
	.byte $73,$73,$73,$73,$73,$73   ;- D 3 - I - 0x01E9C6 0F:E9B6:
; slots 15,14 first; then slots 0-15 ascending / 13-0 descending, alternating every frame (flicker order)
DrawObjects:
	LDX #$0F                        ;C - - - - - 0x01E9CC 0F:E9BC: A2 0F
	LDA objActive,X                 ;C - - - - - 0x01E9CE 0F:E9BE: BD 00 03
	BPL loc_0F_E9C6                 ;C - - - - - 0x01E9D1 0F:E9C1: 10 03
	JSR DrawObject                  ;C - - - - - 0x01E9D3 0F:E9C3: 20 FE E9
loc_0F_E9C6:
	DEX                             ;C - - - - - 0x01E9D6 0F:E9C6: CA
	LDA objActive,X                 ;C - - - - - 0x01E9D7 0F:E9C7: BD 00 03
	BPL loc_0F_E9CF                 ;C - - - - - 0x01E9DA 0F:E9CA: 10 03
	JSR DrawObject                  ;C - - - - - 0x01E9DC 0F:E9CC: 20 FE E9
loc_0F_E9CF:
	INC drawOrderToggle             ;C - - - - - 0x01E9DF 0F:E9CF: E6 95
	LDA drawOrderToggle             ;C - - - - - 0x01E9E1 0F:E9D1: A5 95
	LSR A                           ;C - - - - - 0x01E9E3 0F:E9D3: 4A
	BCS loc_0F_E9EB                 ;C - - - - - 0x01E9E4 0F:E9D4: B0 15
	LDX #$00                        ;C - - - - - 0x01E9E6 0F:E9D6: A2 00
	STX drawSlot                    ;C - - - - - 0x01E9E8 0F:E9D8: 86 96
loc_0F_E9DA:
	LDA objActive,X                 ;C - - - - - 0x01E9EA 0F:E9DA: BD 00 03
	BPL loc_0F_E9E2                 ;C - - - - - 0x01E9ED 0F:E9DD: 10 03
	JSR DrawObject                  ;C - - - - - 0x01E9EF 0F:E9DF: 20 FE E9
loc_0F_E9E2:
	INC drawSlot                    ;C - - - - - 0x01E9F2 0F:E9E2: E6 96
	LDX drawSlot                    ;C - - - - - 0x01E9F4 0F:E9E4: A6 96
	CPX #$10                        ;C - - - - - 0x01E9F6 0F:E9E6: E0 10
	BNE loc_0F_E9DA                 ;C - - - - - 0x01E9F8 0F:E9E8: D0 F0
	RTS                             ;C - - - - - 0x01E9FA 0F:E9EA: 60
loc_0F_E9EB:
	LDX #$0D                        ;C - - - - - 0x01E9FB 0F:E9EB: A2 0D
	STX drawSlot                    ;C - - - - - 0x01E9FD 0F:E9ED: 86 96
loc_0F_E9EF:
	LDA objActive,X                 ;C - - - - - 0x01E9FF 0F:E9EF: BD 00 03
	BPL loc_0F_E9F7                 ;C - - - - - 0x01EA02 0F:E9F2: 10 03
	JSR DrawObject                  ;C - - - - - 0x01EA04 0F:E9F4: 20 FE E9
loc_0F_E9F7:
	DEC drawSlot                    ;C - - - - - 0x01EA07 0F:E9F7: C6 96
	LDX drawSlot                    ;C - - - - - 0x01EA09 0F:E9F9: A6 96
	BPL loc_0F_E9EF                 ;C - - - - - 0x01EA0B 0F:E9FB: 10 F2
	RTS                             ;C - - - - - 0x01EA0D 0F:E9FD: 60
; X = slot; objFlags: bit4 = world coords (subtract scroll), bit7 = on screen, bit2 = hidden, bit5 = sprite priority
DrawObject:
	LDA objFlags,X                  ;C - - - - - 0x01EA0E 0F:E9FE: BD 60 05
	AND #$10                        ;C - - - - - 0x01EA11 0F:EA01: 29 10
	BEQ loc_0F_EA58                 ;C - - - - - 0x01EA13 0F:EA03: F0 53
	LDA objX,X                      ;C - - - - - 0x01EA15 0F:EA05: BD 60 03
	SEC                             ;C - - - - - 0x01EA18 0F:EA08: 38
	SBC scrollX                     ;C - - - - - 0x01EA19 0F:EA09: E5 FC
	STA spriteBaseX                 ;C - - - - - 0x01EA1B 0F:EA0B: 85 13
	LDA objXPage,X                  ;C - - - - - 0x01EA1D 0F:EA0D: BD 80 03
	SBC scrollXPage                 ;C - - - - - 0x01EA20 0F:EA10: E5 F9
	BNE loc_0F_EA24                 ;C - - - - - 0x01EA22 0F:EA12: D0 10
	LDA objYPage,X                  ;C - - - - - 0x01EA24 0F:EA14: BD E0 03
	BEQ loc_0F_EA5D                 ;C - - - - - 0x01EA27 0F:EA17: F0 44
	CPX #$00                        ;c - - - - - 0x01EA29 0F:EA19: E0 00
	BEQ loc_0F_EA4D                 ;c - - - - - 0x01EA2B 0F:EA1B: F0 30
	LDA objYPage,X                  ;c - - - - - 0x01EA2D 0F:EA1D: BD E0 03
	BMI loc_0F_EA30                 ;c - - - - - 0x01EA30 0F:EA20: 30 0E
	BPL loc_0F_EA30                 ;c - - - - - 0x01EA32 0F:EA22: 10 0C
loc_0F_EA24:
	LDA spriteBaseX                 ;C - - - - - 0x01EA34 0F:EA24: A5 13
	BCS loc_0F_EA2C                 ;C - - - - - 0x01EA36 0F:EA26: B0 04
	EOR #$FF                        ;C - - - - - 0x01EA38 0F:EA28: 49 FF
	ADC #$01                        ;C - - - - - 0x01EA3A 0F:EA2A: 69 01
loc_0F_EA2C:
	CMP #$68                        ;C - - - - - 0x01EA3C 0F:EA2C: C9 68
	BCC loc_0F_EA34                 ;C - - - - - 0x01EA3E 0F:EA2E: 90 04
loc_0F_EA30:
	JSR DrawObjectOffscreen         ;C - - - - - 0x01EA40 0F:EA30: 20 33 EC
	RTS                             ;C - - - - - 0x01EA43 0F:EA33: 60
loc_0F_EA34:
	CMP #$00                        ;C - - - - - 0x01EA44 0F:EA34: C9 00
	BCC loc_0F_EA4D                 ;C - - - - - 0x01EA46 0F:EA36: 90 15
	LDA objAnim,X                   ;C - - - - - 0x01EA48 0F:EA38: BD 80 05
	CMP #$7E                        ;C - - - - - 0x01EA4B 0F:EA3B: C9 7E
	BEQ loc_0F_EA30                 ;C - - - - - 0x01EA4D 0F:EA3D: F0 F1
	LDA stage                       ;C - - - - - 0x01EA4F 0F:EA3F: A5 61
	CMP #$03                        ;C - - - - - 0x01EA51 0F:EA41: C9 03
	BNE loc_0F_EA4D                 ;C - - - - - 0x01EA53 0F:EA43: D0 08
	LDA stageSection                ;C - - - - - 0x01EA55 0F:EA45: A5 60
	CMP #$01                        ;C - - - - - 0x01EA57 0F:EA47: C9 01
	BNE loc_0F_EA4D                 ;C - - - - - 0x01EA59 0F:EA49: D0 02
	BEQ loc_0F_EA30                 ;c - - - - - 0x01EA5B 0F:EA4B: F0 E3
loc_0F_EA4D:
	LDA objFlags,X                  ;C - - - - - 0x01EA5D 0F:EA4D: BD 60 05
	AND #$7F                        ;C - - - - - 0x01EA60 0F:EA50: 29 7F
	STA objFlags,X                  ;C - - - - - 0x01EA62 0F:EA52: 9D 60 05
	JMP loc_0F_EA6F                 ;C - - - - - 0x01EA65 0F:EA55: 4C 6F EA
loc_0F_EA58:
	LDA objX,X                      ;C - - - - - 0x01EA68 0F:EA58: BD 60 03
	STA spriteBaseX                 ;C - - - - - 0x01EA6B 0F:EA5B: 85 13
loc_0F_EA5D:
	LDA objY,X                      ;C - - - - - 0x01EA6D 0F:EA5D: BD C0 03
	STA spriteBaseY                 ;C - - - - - 0x01EA70 0F:EA60: 85 12
	LDA objFlags,X                  ;C - - - - - 0x01EA72 0F:EA62: BD 60 05
	ORA #$80                        ;C - - - - - 0x01EA75 0F:EA65: 09 80
	STA objFlags,X                  ;C - - - - - 0x01EA77 0F:EA67: 9D 60 05
	AND #$04                        ;C - - - - - 0x01EA7A 0F:EA6A: 29 04
	BEQ loc_0F_EA6F                 ;C - - - - - 0x01EA7C 0F:EA6C: F0 01
loc_0F_EA6E:
	RTS                             ;C - - - - - 0x01EA7E 0F:EA6E: 60
; 
loc_0F_EA6F:
	LDY objKind,X                   ;C - - - - - 0x01EA7F 0F:EA6F: BC 20 03
	LDA animBankTable,Y             ;C - - - - - 0x01EA82 0F:EA72: B9 93 EB
	STA prgBank8000                 ;C - - - - - 0x01EA85 0F:EA75: 85 F4
	CLC                             ;C - - - - - 0x01EA87 0F:EA77: 18
	ADC #$01                        ;C - - - - - 0x01EA88 0F:EA78: 69 01
	STA prgBankA000                 ;C - - - - - 0x01EA8A 0F:EA7A: 85 F5
	STX ptr_00                      ;C - - - - - 0x01EA8C 0F:EA7C: 86 00
	JSR SetPrgBanks                 ;C - - - - - 0x01EA8E 0F:EA7E: 20 4D FF
	LDX ptr_00                      ;C - - - - - 0x01EA91 0F:EA81: A6 00
	LDY #$00                        ;C - - - - - 0x01EA93 0F:EA83: A0 00
	LDA objFlags,X                  ;C - - - - - 0x01EA95 0F:EA85: BD 60 05
	PHA                             ;C - - - - - 0x01EA98 0F:EA88: 48
	AND #$40                        ;C - - - - - 0x01EA99 0F:EA89: 29 40
ofs_0F_EA8B:
	STA spriteFlipMask              ;C - - - - - 0x01EA9B 0F:EA8B: 85 10
	PLA                             ;C - - - - - 0x01EA9D 0F:EA8D: 68
	AND #$20                        ;C - - - - - 0x01EA9E 0F:EA8E: 29 20
	STA spritePriorityBit           ;C - - - - - 0x01EAA0 0F:EA90: 85 11
	LDA objAnim,X                   ;C - - - - - 0x01EAA2 0F:EA92: BD 80 05
	BEQ loc_0F_EA6E                 ;C - - - - - 0x01EAA5 0F:EA95: F0 D7
	AND #$7F                        ;C - - - - - 0x01EAA7 0F:EA97: 29 7F
	TAY                             ;C - - - - - 0x01EAA9 0F:EA99: A8
	LDA animPtrLo,Y                 ;C - - - - - 0x01EAAA 0F:EA9A: B9 00 80
	STA ptr_00                      ;C - - - - - 0x01EAAD 0F:EA9D: 85 00
	LDA animPtrHi,Y                 ;C - - - - - 0x01EAAF 0F:EA9F: B9 80 80
	STA ptr_00+1                    ;C - - - - - 0x01EAB2 0F:EAA2: 85 01
	LDA objAnimFlags,X              ;C - - - - - 0x01EAB4 0F:EAA4: BD 90 05
	AND #$7F                        ;C - - - - - 0x01EAB7 0F:EAA7: 29 7F
	INC objAnimFlags,X              ;C - - - - - 0x01EAB9 0F:EAA9: FE 90 05
	LDY #$01                        ;C - - - - - 0x01EABC 0F:EAAC: A0 01
	CMP (ptr_00),Y                  ;C - - - - - 0x01EABE 0F:EAAE: D1 00
	BNE loc_0F_EACC                 ;C - - - - - 0x01EAC0 0F:EAB0: D0 1A
	LDA objAnimFlags,X              ;C - - - - - 0x01EAC2 0F:EAB2: BD 90 05
	AND #$80                        ;C - - - - - 0x01EAC5 0F:EAB5: 29 80
	STA objAnimFlags,X              ;C - - - - - 0x01EAC7 0F:EAB7: 9D 90 05
	LDA objAnimFrame,X              ;C - - - - - 0x01EACA 0F:EABA: BD 70 05
	AND #$7F                        ;C - - - - - 0x01EACD 0F:EABD: 29 7F
	INC objAnimFrame,X              ;C - - - - - 0x01EACF 0F:EABF: FE 70 05
	DEY                             ;C - - - - - 0x01EAD2 0F:EAC2: 88
	CMP (ptr_00),Y                  ;C - - - - - 0x01EAD3 0F:EAC3: D1 00
	BNE loc_0F_EACC                 ;C - - - - - 0x01EAD5 0F:EAC5: D0 05
	LDA #$00                        ;C - - - - - 0x01EAD7 0F:EAC7: A9 00
	STA objAnimFrame,X              ;C - - - - - 0x01EAD9 0F:EAC9: 9D 70 05
loc_0F_EACC:
	LDA objFlags,X                  ;C - - - - - 0x01EADC 0F:EACC: BD 60 05
	BPL loc_0F_EAEF                 ;C - - - - - 0x01EADF 0F:EACF: 10 1E
	LDA objAnimFlags,X              ;C - - - - - 0x01EAE1 0F:EAD1: BD 90 05
	BPL loc_0F_EADC                 ;C - - - - - 0x01EAE4 0F:EAD4: 10 06
	LDA frameCounter                ;c - - - - - 0x01EAE6 0F:EAD6: A5 92
	AND #$04                        ;c - - - - - 0x01EAE8 0F:EAD8: 29 04
	BNE loc_0F_EAEF                 ;c - - - - - 0x01EAEA 0F:EADA: D0 13
loc_0F_EADC:
	LDA objAnimFrame,X              ;C - - - - - 0x01EAEC 0F:EADC: BD 70 05
	AND #$7F                        ;C - - - - - 0x01EAEF 0F:EADF: 29 7F
	CLC                             ;C - - - - - 0x01EAF1 0F:EAE1: 18
	ADC #$02                        ;C - - - - - 0x01EAF2 0F:EAE2: 69 02
	TAY                             ;C - - - - - 0x01EAF4 0F:EAE4: A8
	LDA (ptr_00),Y                  ;C - - - - - 0x01EAF5 0F:EAE5: B1 00
	BNE loc_0F_EAF0                 ;C - - - - - 0x01EAF7 0F:EAE7: D0 07
	STA objActive,X                 ;C - - - - - 0x01EAF9 0F:EAE9: 9D 00 03
	JMP loc_0F_EC81                 ;C - - - - - 0x01EAFC 0F:EAEC: 4C 81 EC
loc_0F_EAEF:
	RTS                             ;C - - - - - 0x01EAFF 0F:EAEF: 60
; the offset table ($B100/$B200 + index) holds (dy, dx) per sprite.
loc_0F_EAF0:
	TAY                             ;C - - - - - 0x01EB00 0F:EAF0: A8
	LDA frameListLo,Y               ;C - - - - - 0x01EB01 0F:EAF1: B9 00 81
	STA ptr_02                      ;C - - - - - 0x01EB04 0F:EAF4: 85 02
	LDA frameListHi,Y               ;C - - - - - 0x01EB06 0F:EAF6: B9 00 82
	STA ptr_02+1                    ;C - - - - - 0x01EB09 0F:EAF9: 85 03
ofs_0F_EAFB:
	LDY #$00                        ;C - - - - - 0x01EB0B 0F:EAFB: A0 00
	LDA (ptr_02),Y                  ;C - - - - - 0x01EB0D 0F:EAFD: B1 02
	PHA                             ;C - - - - - 0x01EB0F 0F:EAFF: 48
	LDY #$0B                        ;C - - - - - 0x01EB10 0F:EB00: A0 0B
	PLA                             ;C - - - - - 0x01EB12 0F:EB02: 68
	BPL loc_0F_EB09                 ;C - - - - - 0x01EB13 0F:EB03: 10 04
	AND #$7F                        ;C - - - - - 0x01EB15 0F:EB05: 29 7F
	LDY #$03                        ;C - - - - - 0x01EB17 0F:EB07: A0 03
loc_0F_EB09:
	STA ptr_04                      ;C - - - - - 0x01EB19 0F:EB09: 85 04
	CPY prgBankA000                 ;C - - - - - 0x01EB1B 0F:EB0B: C4 F5
	BEQ loc_0F_EB18                 ;C - - - - - 0x01EB1D 0F:EB0D: F0 09
	STY prgBankA000                 ;C - - - - - 0x01EB1F 0F:EB0F: 84 F5
	STX ptr_04+1                    ;C - - - - - 0x01EB21 0F:EB11: 86 05
	JSR SetPrgBanks                 ;C - - - - - 0x01EB23 0F:EB13: 20 4D FF
	LDX ptr_04+1                    ;C - - - - - 0x01EB26 0F:EB16: A6 05
loc_0F_EB18:
	LDY #$01                        ;C - - - - - 0x01EB28 0F:EB18: A0 01
	LDA (ptr_02),Y                  ;C - - - - - 0x01EB2A 0F:EB1A: B1 02
	TAX                             ;C - - - - - 0x01EB2C 0F:EB1C: AA
	LDA spriteOffsetLo,X            ;C - - - - - 0x01EB2D 0F:EB1D: BD 00 B1
	SEC                             ;C - - - - - 0x01EB30 0F:EB20: 38
	SBC #$02                        ;C - - - - - 0x01EB31 0F:EB21: E9 02
	STA ptr_04+1                    ;C - - - - - 0x01EB33 0F:EB23: 85 05
	LDA spriteOffsetHi,X            ;C - - - - - 0x01EB35 0F:EB25: BD 00 B2
	SBC #$00                        ;C - - - - - 0x01EB38 0F:EB28: E9 00
	STA ptr_06                      ;C - - - - - 0x01EB3A 0F:EB2A: 85 06
	LDX oamHideStart                ;C - - - - - 0x01EB3C 0F:EB2C: A6 97
	BEQ loc_0F_EB8A                 ;C - - - - - 0x01EB3E 0F:EB2E: F0 5A
loc_0F_EB30:
	LDA #$F0                        ;C - - - - - 0x01EB40 0F:EB30: A9 F0
	STA ptr_00                      ;C - - - - - 0x01EB42 0F:EB32: 85 00
	INY                             ;C - - - - - 0x01EB44 0F:EB34: C8
	LDA (ptr_02),Y                  ;C - - - - - 0x01EB45 0F:EB35: B1 02
	STA oamBuffer+1,X               ;C - - - - - 0x01EB47 0F:EB37: 9D 01 02
	LDA spriteBaseY                 ;C - - - - - 0x01EB4A 0F:EB3A: A5 12
	CLC                             ;C - - - - - 0x01EB4C 0F:EB3C: 18
	ADC (ptr_04+1),Y                ;C - - - - - 0x01EB4D 0F:EB3D: 71 05
	STA oamBuffer,X                 ;C - - - - - 0x01EB4F 0F:EB3F: 9D 00 02
	LDA (ptr_04+1),Y                ;C - - - - - 0x01EB52 0F:EB42: B1 05
	BMI loc_0F_EB4A                 ;C - - - - - 0x01EB54 0F:EB44: 30 04
	BCC loc_0F_EB4C                 ;C - - - - - 0x01EB56 0F:EB46: 90 04
	BCS loc_0F_EB8B                 ;c - - - - - 0x01EB58 0F:EB48: B0 41
loc_0F_EB4A:
	BCC loc_0F_EB8B                 ;C - - - - - 0x01EB5A 0F:EB4A: 90 3F
loc_0F_EB4C:
	LDA oamBuffer,X                 ;C - - - - - 0x01EB5C 0F:EB4C: BD 00 02
	CMP ptr_00                      ;C - - - - - 0x01EB5F 0F:EB4F: C5 00
	BCS loc_0F_EB8B                 ;C - - - - - 0x01EB61 0F:EB51: B0 38
	INY                             ;C - - - - - 0x01EB63 0F:EB53: C8
	LDA (ptr_02),Y                  ;C - - - - - 0x01EB64 0F:EB54: B1 02
	EOR spriteFlipMask              ;C - - - - - 0x01EB66 0F:EB56: 45 10
	ORA spritePriorityBit           ;C - - - - - 0x01EB68 0F:EB58: 05 11
	STA oamBuffer+2,X               ;C - - - - - 0x01EB6A 0F:EB5A: 9D 02 02
	LDA (ptr_04+1),Y                ;C - - - - - 0x01EB6D 0F:EB5D: B1 05
	STA ptr_00+1                    ;C - - - - - 0x01EB6F 0F:EB5F: 85 01
	LDA spriteFlipMask              ;C - - - - - 0x01EB71 0F:EB61: A5 10
	BEQ loc_0F_EB6C                 ;C - - - - - 0x01EB73 0F:EB63: F0 07
	LDA #$F8                        ;C - - - - - 0x01EB75 0F:EB65: A9 F8
	SEC                             ;C - - - - - 0x01EB77 0F:EB67: 38
	SBC ptr_00+1                    ;C - - - - - 0x01EB78 0F:EB68: E5 01
	STA ptr_00+1                    ;C - - - - - 0x01EB7A 0F:EB6A: 85 01
loc_0F_EB6C:
	LDA spriteBaseX                 ;C - - - - - 0x01EB7C 0F:EB6C: A5 13
	CLC                             ;C - - - - - 0x01EB7E 0F:EB6E: 18
	ADC ptr_00+1                    ;C - - - - - 0x01EB7F 0F:EB6F: 65 01
	STA oamBuffer+3,X               ;C - - - - - 0x01EB81 0F:EB71: 9D 03 02
	LDA ptr_00+1                    ;C - - - - - 0x01EB84 0F:EB74: A5 01
	BMI loc_0F_EB7C                 ;C - - - - - 0x01EB86 0F:EB76: 30 04
	BCC loc_0F_EB7E                 ;C - - - - - 0x01EB88 0F:EB78: 90 04
	BCS loc_0F_EB8C                 ;C - - - - - 0x01EB8A 0F:EB7A: B0 10
loc_0F_EB7C:
	BCC loc_0F_EB8C                 ;C - - - - - 0x01EB8C 0F:EB7C: 90 0E
loc_0F_EB7E:
	INX                             ;C - - - - - 0x01EB8E 0F:EB7E: E8
	INX                             ;C - - - - - 0x01EB8F 0F:EB7F: E8
	INX                             ;C - - - - - 0x01EB90 0F:EB80: E8
	INX                             ;C - - - - - 0x01EB91 0F:EB81: E8
	STX oamHideStart                ;C - - - - - 0x01EB92 0F:EB82: 86 97
	BEQ loc_0F_EB8A                 ;C - - - - - 0x01EB94 0F:EB84: F0 04
loc_0F_EB86:
	DEC ptr_04                      ;C - - - - - 0x01EB96 0F:EB86: C6 04
	BPL loc_0F_EB30                 ;C - - - - - 0x01EB98 0F:EB88: 10 A6
loc_0F_EB8A:
	RTS                             ;C - - - - - 0x01EB9A 0F:EB8A: 60
loc_0F_EB8B:
	INY                             ;C - - - - - 0x01EB9B 0F:EB8B: C8
loc_0F_EB8C:
	LDA #$F8                        ;C - - - - - 0x01EB9C 0F:EB8C: A9 F8
	STA oamBuffer,X                 ;C - - - - - 0x01EB9E 0F:EB8E: 9D 00 02
	BNE loc_0F_EB86                 ;C - - - - - 0x01EBA1 0F:EB91: D0 F3
; objKind -> PRG bank at $8000 for its animation data ($0A or $02; +1 goes to $A000)
animBankTable:
	.byte $0A,$0A,$02,$02,$02,$02,$02,$02,$02,$0A;- D 3 - - - 0x01EBA3 0F:EB93:
	.byte $0A,$0A,$0A,$0A           ;- - - - - - 0x01EBAD 0F:EB9D:
	.byte $02,$02,$0A               ;- D 3 - - - 0x01EBB1 0F:EBA1:
	.byte $0A                       ;- - - - - - 0x01EBB4 0F:EBA4:
	.byte $0A,$0A                   ;- D 3 - - - 0x01EBB5 0F:EBA5:
	.byte $0A,$0A                   ;- - - - - - 0x01EBB7 0F:EBA7:
	.byte $02                       ;- D 3 - - - 0x01EBB9 0F:EBA9:
	.byte $0A,$0A,$0A,$0A,$0A,$0A,$0A,$02;- - - - - - 0x01EBBA 0F:EBAA:
	.res 13, $02                    ;- D 3 - - - 0x01EBC2 0F:EBB2: fill 13 bytes
	.byte $02,$02                   ;- - - - - - 0x01EBCF 0F:EBBF:
	.byte $02                       ;- D 3 - - - 0x01EBD1 0F:EBC1:
	.byte $02                       ;- - - - - - 0x01EBD2 0F:EBC2:
	.byte $02,$02,$02,$02,$02,$02   ;- D 3 - - - 0x01EBD3 0F:EBC3:
	.res 10, $02                    ;- - - - - - 0x01EBD9 0F:EBC9: fill 10 bytes
	.byte $02                       ;- D 3 - - - 0x01EBE3 0F:EBD3:
	.byte $02                       ;- - - - - - 0x01EBE4 0F:EBD4:
	.byte $02,$02                   ;- D 3 - - - 0x01EBE5 0F:EBD5:
	.byte $02                       ;- - - - - - 0x01EBE7 0F:EBD7:
	.byte $02                       ;- D 3 - - - 0x01EBE8 0F:EBD8:
	.byte $02                       ;- - - - - - 0x01EBE9 0F:EBD9:
	.byte $02                       ;- D 3 - - - 0x01EBEA 0F:EBDA:
	.byte $02                       ;- - - - - - 0x01EBEB 0F:EBDB:
	.byte $02,$02,$02               ;- D 3 - - - 0x01EBEC 0F:EBDC:
	.res 13, $02                    ;- - - - - - 0x01EBEF 0F:EBDF: fill 13 bytes
tbl_0F_EBEC:
	.byte $02,$02,$02,$02,$02,$02,$02,$0A,$0A;- - - - - - 0x01EBFC 0F:EBEC:
	.byte $0A,$0A                   ;- D 3 - - - 0x01EC05 0F:EBF5:
	.byte $02                       ;- - - - - - 0x01EC07 0F:EBF7:
	.byte $02,$0A,$0A,$02,$0A       ;- D 3 - - - 0x01EC08 0F:EBF8:
	.byte $0A                       ;- - - - - - 0x01EC0D 0F:EBFD:
	.byte $02,$0A,$0A,$0A,$0A,$0A   ;- D 3 - - - 0x01EC0E 0F:EBFE:
	.byte $0A                       ;- - - - - - 0x01EC14 0F:EC04:
	.byte $0A                       ;- D 3 - - - 0x01EC15 0F:EC05:
	.byte $0A                       ;- - - - - - 0x01EC16 0F:EC06:
	.byte $02                       ;- D 3 - - - 0x01EC17 0F:EC07:
	.byte $02,$02,$02,$02,$02,$02   ;- - - - - - 0x01EC18 0F:EC08:
	.byte $0A                       ;- D 3 - - - 0x01EC1E 0F:EC0E:
	.byte $02                       ;- - - - - - 0x01EC1F 0F:EC0F:
	.byte $02                       ;- D 3 - - - 0x01EC20 0F:EC10:
	.byte $02,$02                   ;- - - - - - 0x01EC21 0F:EC11:
	.byte $02,$02                   ;- D 3 - - - 0x01EC23 0F:EC13:
	.byte $02                       ;- - - - - - 0x01EC25 0F:EC15:
	.byte $02                       ;- D 3 - - - 0x01EC26 0F:EC16:
	.res 11, $02                    ;- - - - - - 0x01EC27 0F:EC17: fill 11 bytes
	.byte $02,$02,$0A               ;- D 3 - - - 0x01EC32 0F:EC22:
	.byte $0A,$0A,$02               ;- - - - - - 0x01EC35 0F:EC25:
	.byte $0A                       ;- D 3 - - - 0x01EC38 0F:EC28:
	.byte $02,$02,$02,$02,$02       ;- - - - - - 0x01EC39 0F:EC29:
	.byte $02                       ;- D 3 - - - 0x01EC3E 0F:EC2E:
	.byte $02                       ;- - - - - - 0x01EC3F 0F:EC2F:
	.byte $02,$02,$02               ;- D 3 - - - 0x01EC40 0F:EC30:
; object is off screen: removes it (or ignores it on stage 3 section 1)
DrawObjectOffscreen:
	LDA stage                       ;C - - - - - 0x01EC43 0F:EC33: A5 61
	CMP #$03                        ;C - - - - - 0x01EC45 0F:EC35: C9 03
	BNE loc_0F_EC41                 ;C - - - - - 0x01EC47 0F:EC37: D0 08
	LDA stageSection                ;c - - - - - 0x01EC49 0F:EC39: A5 60
	CMP #$01                        ;c - - - - - 0x01EC4B 0F:EC3B: C9 01
	BNE loc_0F_EC41                 ;c - - - - - 0x01EC4D 0F:EC3D: D0 02
	BEQ loc_0F_EC81                 ;c - - - - - 0x01EC4F 0F:EC3F: F0 40
loc_0F_EC41:
	LDY #$00                        ;C - - - - - 0x01EC51 0F:EC41: A0 00
loc_0F_EC43:
	LDA tbl_0F_ECC3,Y               ;C - - - - - 0x01EC53 0F:EC43: B9 C3 EC
	CMP objKind,X                   ;C - - - - - 0x01EC56 0F:EC46: DD 20 03
	BEQ loc_0F_EC81                 ;C - - - - - 0x01EC59 0F:EC49: F0 36
	CMP #$FF                        ;C - - - - - 0x01EC5B 0F:EC4B: C9 FF
	BEQ loc_0F_EC53                 ;C - - - - - 0x01EC5D 0F:EC4D: F0 04
	INY                             ;C - - - - - 0x01EC5F 0F:EC4F: C8
	BNE loc_0F_EC43                 ;C - - - - - 0x01EC60 0F:EC50: D0 F1
	RTS                             ;c - - - - - 0x01EC62 0F:EC52: 60
loc_0F_EC53:
	LDA scrollXPage                 ;c - - - - - 0x01EC63 0F:EC53: A5 F9
	SEC                             ;c - - - - - 0x01EC65 0F:EC55: 38
	SBC objXPage,X                  ;c - - - - - 0x01EC66 0F:EC56: FD 80 03
	BMI loc_0F_EC6E                 ;c - - - - - 0x01EC69 0F:EC59: 30 13
	LDA objX,X                      ;c - - - - - 0x01EC6B 0F:EC5B: BD 60 03
	CLC                             ;c - - - - - 0x01EC6E 0F:EC5E: 18
	ADC #$10                        ;c - - - - - 0x01EC6F 0F:EC5F: 69 10
	STA objX,X                      ;c - - - - - 0x01EC71 0F:EC61: 9D 60 03
	LDA objXPage,X                  ;c - - - - - 0x01EC74 0F:EC64: BD 80 03
	ADC #$00                        ;c - - - - - 0x01EC77 0F:EC67: 69 00
	STA objXPage,X                  ;c - - - - - 0x01EC79 0F:EC69: 9D 80 03
	SEC                             ;c - - - - - 0x01EC7C 0F:EC6C: 38
	RTS                             ;c - - - - - 0x01EC7D 0F:EC6D: 60
loc_0F_EC6E:
	LDA objX,X                      ;c - - - - - 0x01EC7E 0F:EC6E: BD 60 03
	SEC                             ;c - - - - - 0x01EC81 0F:EC71: 38
	SBC #$10                        ;c - - - - - 0x01EC82 0F:EC72: E9 10
	STA objX,X                      ;c - - - - - 0x01EC84 0F:EC74: 9D 60 03
	LDA objXPage,X                  ;c - - - - - 0x01EC87 0F:EC77: BD 80 03
	SBC #$00                        ;c - - - - - 0x01EC8A 0F:EC7A: E9 00
	STA objXPage,X                  ;c - - - - - 0x01EC8C 0F:EC7C: 9D 80 03
	SEC                             ;c - - - - - 0x01EC8F 0F:EC7F: 38
	RTS                             ;c - - - - - 0x01EC90 0F:EC80: 60
loc_0F_EC81:
	LDA #$00                        ;C - - - - - 0x01EC91 0F:EC81: A9 00
	STA objActive,X                 ;C - - - - - 0x01EC93 0F:EC83: 9D 00 03
	STA objState,X                  ;C - - - - - 0x01EC96 0F:EC86: 9D 10 03
	STA objFlags,X                  ;C - - - - - 0x01EC99 0F:EC89: 9D 60 05
	STA objMoveMode,X               ;C - - - - - 0x01EC9C 0F:EC8C: 9D 70 04
	STA objStunTimer,X              ;C - - - - - 0x01EC9F 0F:EC8F: 9D B0 04
	STA objKind,X                   ;C - - - - - 0x01ECA2 0F:EC92: 9D 20 03
	STA objId,X                     ;C - - - - - 0x01ECA5 0F:EC95: 9D 30 03
ofs_0F_EC98:
	STA objAtkBox,X                 ;C - - - - - 0x01ECA8 0F:EC98: 9D 40 04
	STA objAtkDamage,X              ;C - - - - - 0x01ECAB 0F:EC9B: 9D 50 04
	STA objDownState,X              ;C - - - - - 0x01ECAE 0F:EC9E: 9D C0 04
	STA objAtkHeavy,X               ;C - - - - - 0x01ECB1 0F:ECA1: 9D D0 04
	STA objHitTimer,X               ;C - - - - - 0x01ECB4 0F:ECA4: 9D E0 04
	STA objSpriteDown,X             ;C - - - - - 0x01ECB7 0F:ECA7: 9D B0 05
	STA objVariant,X                ;C - - - - - 0x01ECBA 0F:ECAA: 9D C0 05
	STA objTimer,X                  ;C - - - - - 0x01ECBD 0F:ECAD: 9D D0 05
	STA objCounter,X                ;C - - - - - 0x01ECC0 0F:ECB0: 9D E0 05
	STA objToggle,X                 ;C - - - - - 0x01ECC3 0F:ECB3: 9D F0 05
	STA objSpriteAir,X              ;C - - - - - 0x01ECC6 0F:ECB6: 9D F0 04
	STA objGrabState,X              ;C - - - - - 0x01ECC9 0F:ECB9: 9D F0 03
	LDA #$FF                        ;C - - - - - 0x01ECCC 0F:ECBC: A9 FF
	STA objSpawnIndex,X             ;C - - - - - 0x01ECCE 0F:ECBE: 9D 80 04
	CLC                             ;C - - - - - 0x01ECD1 0F:ECC1: 18
	RTS                             ;C - - - - - 0x01ECD2 0F:ECC2: 60
tbl_0F_ECC3:
	.byte $2E,$9D,$7F,$91,$95,$01   ;- D 3 - - - 0x01ECD3 0F:ECC3:
	.byte $10,$11,$12,$13,$61,$FF   ;- - - - - - 0x01ECD9 0F:ECC9:
; vertical tile collision probe
TileCollideY:
	LDA tbl_0F_EEEB,Y               ;C - - - - - 0x01ECDF 0F:ECCF: B9 EB EE
	STA ram_0040                    ;C - - - - - 0x01ECE2 0F:ECD2: 85 40
	JSR TileCollideBegin            ;C - - - - - 0x01ECE4 0F:ECD4: 20 C4 EE
	TAY                             ;C - - - - - 0x01ECE7 0F:ECD7: A8
	LDA tbl_0F_EEF6,Y               ;C - - - - - 0x01ECE8 0F:ECD8: B9 F6 EE
	STA ptr_02                      ;C - - - - - 0x01ECEB 0F:ECDB: 85 02
	LDA objYPage,X                  ;C - - - - - 0x01ECED 0F:ECDD: BD E0 03
	STA ptr_02+1                    ;C - - - - - 0x01ECF0 0F:ECE0: 85 03
	LDA tbl_0F_EEF7,Y               ;C - - - - - 0x01ECF2 0F:ECE2: B9 F7 EE
	PHA                             ;C - - - - - 0x01ECF5 0F:ECE5: 48
	CLC                             ;C - - - - - 0x01ECF6 0F:ECE6: 18
	ADC objY,X                      ;C - - - - - 0x01ECF7 0F:ECE7: 7D C0 03
	STA spritePriorityBit           ;C - - - - - 0x01ECFA 0F:ECEA: 85 11
	PLA                             ;C - - - - - 0x01ECFC 0F:ECEC: 68
	BMI loc_0F_ECF9                 ;C - - - - - 0x01ECFD 0F:ECED: 30 0A
	BCS loc_0F_ECFB                 ;C - - - - - 0x01ECFF 0F:ECEF: B0 0A
	LDA spritePriorityBit           ;C - - - - - 0x01ED01 0F:ECF1: A5 11
	CMP #$F0                        ;C - - - - - 0x01ED03 0F:ECF3: C9 F0
	BCS loc_0F_ECFB                 ;C - - - - - 0x01ED05 0F:ECF5: B0 04
	BCC loc_0F_ED08                 ;C - - - - - 0x01ED07 0F:ECF7: 90 0F
loc_0F_ECF9:
	BCS loc_0F_ED08                 ;C - - - - - 0x01ED09 0F:ECF9: B0 0D
loc_0F_ECFB:
	LDA #$00                        ;c - - - - - 0x01ED0B 0F:ECFB: A9 00
	LDY ptr_02                      ;c - - - - - 0x01ED0D 0F:ECFD: A4 02
loc_0F_ECFF:
	STA a:ptr_42,Y                  ;c - - - - - 0x01ED0F 0F:ECFF: 99 42 00
	DEY                             ;c - - - - - 0x01ED12 0F:ED02: 88
	BPL loc_0F_ECFF                 ;c - - - - - 0x01ED13 0F:ED03: 10 FA
	JMP loc_0F_EEDF                 ;c - - - - - 0x01ED15 0F:ED05: 4C DF EE
loc_0F_ED08:
	LDA ptr_02+1                    ;C - - - - - 0x01ED18 0F:ED08: A5 03
	BNE loc_0F_ECFB                 ;C - - - - - 0x01ED1A 0F:ED0A: D0 EF
	LDA spritePriorityBit           ;C - - - - - 0x01ED1C 0F:ED0C: A5 11
	LSR A                           ;C - - - - - 0x01ED1E 0F:ED0E: 4A
	LSR A                           ;C - - - - - 0x01ED1F 0F:ED0F: 4A
	PHA                             ;C - - - - - 0x01ED20 0F:ED10: 48
	AND #$38                        ;C - - - - - 0x01ED21 0F:ED11: 29 38
	SEC                             ;C - - - - - 0x01ED23 0F:ED13: 38
	SBC #$08                        ;C - - - - - 0x01ED24 0F:ED14: E9 08
	STA ram_0028                    ;C - - - - - 0x01ED26 0F:ED16: 85 28
	PLA                             ;C - - - - - 0x01ED28 0F:ED18: 68
	LSR A                           ;C - - - - - 0x01ED29 0F:ED19: 4A
	AND #$02                        ;C - - - - - 0x01ED2A 0F:ED1A: 29 02
	STA ptr_02+1                    ;C - - - - - 0x01ED2C 0F:ED1C: 85 03
	LDA #$00                        ;C - - - - - 0x01ED2E 0F:ED1E: A9 00
	STA ptr_04                      ;C - - - - - 0x01ED30 0F:ED20: 85 04
	LDA tbl_0F_EEF8,Y               ;C - - - - - 0x01ED32 0F:ED22: B9 F8 EE
	BPL loc_0F_ED29                 ;C - - - - - 0x01ED35 0F:ED25: 10 02
	DEC ptr_04                      ;C - - - - - 0x01ED37 0F:ED27: C6 04
loc_0F_ED29:
	CLC                             ;C - - - - - 0x01ED39 0F:ED29: 18
	ADC objX,X                      ;C - - - - - 0x01ED3A 0F:ED2A: 7D 60 03
	STA spriteBaseY                 ;C - - - - - 0x01ED3D 0F:ED2D: 85 12
	LDA objXPage,X                  ;C - - - - - 0x01ED3F 0F:ED2F: BD 80 03
	ADC ptr_04                      ;C - - - - - 0x01ED42 0F:ED32: 65 04
	STA spriteBaseX                 ;C - - - - - 0x01ED44 0F:ED34: 85 13
	LDA spriteBaseY                 ;C - - - - - 0x01ED46 0F:ED36: A5 12
	LSR A                           ;C - - - - - 0x01ED48 0F:ED38: 4A
	LSR A                           ;C - - - - - 0x01ED49 0F:ED39: 4A
	LSR A                           ;C - - - - - 0x01ED4A 0F:ED3A: 4A
	LSR A                           ;C - - - - - 0x01ED4B 0F:ED3B: 4A
	PHA                             ;C - - - - - 0x01ED4C 0F:ED3C: 48
	AND #$01                        ;C - - - - - 0x01ED4D 0F:ED3D: 29 01
	ORA ptr_02+1                    ;C - - - - - 0x01ED4F 0F:ED3F: 05 03
	STA ptr_02+1                    ;C - - - - - 0x01ED51 0F:ED41: 85 03
	PLA                             ;C - - - - - 0x01ED53 0F:ED43: 68
	LSR A                           ;C - - - - - 0x01ED54 0F:ED44: 4A
	ORA ram_0028                    ;C - - - - - 0x01ED55 0F:ED45: 05 28
	STA ram_0028                    ;C - - - - - 0x01ED57 0F:ED47: 85 28
loc_0F_ED49:
	STX ptr_04                      ;C - - - - - 0x01ED59 0F:ED49: 86 04
	LDY stageData                   ;C - - - - - 0x01ED5B 0F:ED4B: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01ED5D 0F:ED4D: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01ED60 0F:ED50: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01ED62 0F:ED52: 20 4D FF
	LDX ptr_04                      ;C - - - - - 0x01ED65 0F:ED55: A6 04
	LDY spriteBaseX                 ;C - - - - - 0x01ED67 0F:ED57: A4 13
	JSR StageScreenPtr              ;C - - - - - 0x01ED69 0F:ED59: 20 6E E6
loc_0F_ED5C:
	JSR StageMetaPtr                ;C - - - - - 0x01ED6C 0F:ED5C: 20 53 E6
loc_0F_ED5F:
	LDY ptr_02+1                    ;C - - - - - 0x01ED6F 0F:ED5F: A4 03
	LDA (ptr_00),Y                  ;C - - - - - 0x01ED71 0F:ED61: B1 00
	TAY                             ;C - - - - - 0x01ED73 0F:ED63: A8
	LDA stageBlockAttr,Y            ;C - - - - - 0x01ED74 0F:ED64: B9 00 BF
	AND #$F0                        ;C - - - - - 0x01ED77 0F:ED67: 29 F0
	LDY ptr_02                      ;C - - - - - 0x01ED79 0F:ED69: A4 02
	STA a:ptr_42,Y                  ;C - - - - - 0x01ED7B 0F:ED6B: 99 42 00
	CMP ram_0041                    ;C - - - - - 0x01ED7E 0F:ED6E: C5 41
	BCC loc_0F_ED74                 ;C - - - - - 0x01ED80 0F:ED70: 90 02
	STA ram_0041                    ;C - - - - - 0x01ED82 0F:ED72: 85 41
loc_0F_ED74:
	ORA spriteFlipMask              ;C - - - - - 0x01ED84 0F:ED74: 05 10
	STA spriteFlipMask              ;C - - - - - 0x01ED86 0F:ED76: 85 10
	DEC ptr_02                      ;C - - - - - 0x01ED88 0F:ED78: C6 02
	BMI loc_0F_EDB3                 ;C - - - - - 0x01ED8A 0F:ED7A: 30 37
	INC ram_0040                    ;C - - - - - 0x01ED8C 0F:ED7C: E6 40
	LDY ram_0040                    ;C - - - - - 0x01ED8E 0F:ED7E: A4 40
	LDA spriteBaseY                 ;C - - - - - 0x01ED90 0F:ED80: A5 12
	PHA                             ;C - - - - - 0x01ED92 0F:ED82: 48
	AND #$10                        ;C - - - - - 0x01ED93 0F:ED83: 29 10
	STA ptr_04                      ;C - - - - - 0x01ED95 0F:ED85: 85 04
	PLA                             ;C - - - - - 0x01ED97 0F:ED87: 68
	CLC                             ;C - - - - - 0x01ED98 0F:ED88: 18
	ADC tbl_0F_EEF8,Y               ;C - - - - - 0x01ED99 0F:ED89: 79 F8 EE
	STA spriteBaseY                 ;C - - - - - 0x01ED9C 0F:ED8C: 85 12
	AND #$10                        ;C - - - - - 0x01ED9E 0F:ED8E: 29 10
	CMP ptr_04                      ;C - - - - - 0x01EDA0 0F:ED90: C5 04
	BEQ loc_0F_ED5F                 ;C - - - - - 0x01EDA2 0F:ED92: F0 CB
	LDA ptr_02+1                    ;C - - - - - 0x01EDA4 0F:ED94: A5 03
	EOR #$01                        ;C - - - - - 0x01EDA6 0F:ED96: 49 01
	STA ptr_02+1                    ;C - - - - - 0x01EDA8 0F:ED98: 85 03
	AND #$01                        ;C - - - - - 0x01EDAA 0F:ED9A: 29 01
	BNE loc_0F_ED5F                 ;C - - - - - 0x01EDAC 0F:ED9C: D0 C1
	INC ram_0028                    ;C - - - - - 0x01EDAE 0F:ED9E: E6 28
	LDA ram_0028                    ;C - - - - - 0x01EDB0 0F:EDA0: A5 28
	AND #$07                        ;C - - - - - 0x01EDB2 0F:EDA2: 29 07
	BNE loc_0F_ED5C                 ;C - - - - - 0x01EDB4 0F:EDA4: D0 B6
	INC spriteBaseX                 ;C - - - - - 0x01EDB6 0F:EDA6: E6 13
	DEC ram_0028                    ;C - - - - - 0x01EDB8 0F:EDA8: C6 28
	LDA ram_0028                    ;C - - - - - 0x01EDBA 0F:EDAA: A5 28
	AND #$38                        ;C - - - - - 0x01EDBC 0F:EDAC: 29 38
	STA ram_0028                    ;C - - - - - 0x01EDBE 0F:EDAE: 85 28
	JMP loc_0F_ED49                 ;C - - - - - 0x01EDC0 0F:EDB0: 4C 49 ED
loc_0F_EDB3:
	CPX #$00                        ;C - - - - - 0x01EDC3 0F:EDB3: E0 00
	BNE loc_0F_EDB7                 ;C - - - - - 0x01EDC5 0F:EDB5: D0 00
loc_0F_EDB7:
	JMP loc_0F_EEDF                 ;C - - - - - 0x01EDC7 0F:EDB7: 4C DF EE
; horizontal tile collision probe
TileCollideX:
	LDA tbl_0F_EF23,Y               ;C - - - - - 0x01EDCA 0F:EDBA: B9 23 EF
	STA ram_0040                    ;C - - - - - 0x01EDCD 0F:EDBD: 85 40
	JSR TileCollideBegin            ;C - - - - - 0x01EDCF 0F:EDBF: 20 C4 EE
	TAY                             ;C - - - - - 0x01EDD2 0F:EDC2: A8
	LDA tbl_0F_EF2D,Y               ;C - - - - - 0x01EDD3 0F:EDC3: B9 2D EF
	STA ptr_02                      ;C - - - - - 0x01EDD6 0F:EDC6: 85 02
	LDA #$00                        ;C - - - - - 0x01EDD8 0F:EDC8: A9 00
	STA ptr_04                      ;C - - - - - 0x01EDDA 0F:EDCA: 85 04
	LDA tbl_0F_EF2E,Y               ;C - - - - - 0x01EDDC 0F:EDCC: B9 2E EF
	BPL loc_0F_EDD3                 ;C - - - - - 0x01EDDF 0F:EDCF: 10 02
	DEC ptr_04                      ;C - - - - - 0x01EDE1 0F:EDD1: C6 04
loc_0F_EDD3:
	CLC                             ;C - - - - - 0x01EDE3 0F:EDD3: 18
	ADC objX,X                      ;C - - - - - 0x01EDE4 0F:EDD4: 7D 60 03
	STA spriteBaseY                 ;C - - - - - 0x01EDE7 0F:EDD7: 85 12
	LDA objXPage,X                  ;C - - - - - 0x01EDE9 0F:EDD9: BD 80 03
	ADC ptr_04                      ;C - - - - - 0x01EDEC 0F:EDDC: 65 04
	STA spriteBaseX                 ;C - - - - - 0x01EDEE 0F:EDDE: 85 13
	LDA spriteBaseY                 ;C - - - - - 0x01EDF0 0F:EDE0: A5 12
	LSR A                           ;C - - - - - 0x01EDF2 0F:EDE2: 4A
	LSR A                           ;C - - - - - 0x01EDF3 0F:EDE3: 4A
	LSR A                           ;C - - - - - 0x01EDF4 0F:EDE4: 4A
	LSR A                           ;C - - - - - 0x01EDF5 0F:EDE5: 4A
	PHA                             ;C - - - - - 0x01EDF6 0F:EDE6: 48
	AND #$01                        ;C - - - - - 0x01EDF7 0F:EDE7: 29 01
	STA ptr_02+1                    ;C - - - - - 0x01EDF9 0F:EDE9: 85 03
	PLA                             ;C - - - - - 0x01EDFB 0F:EDEB: 68
	LSR A                           ;C - - - - - 0x01EDFC 0F:EDEC: 4A
ofs_0F_EDED:
	STA ram_0028                    ;C - - - - - 0x01EDFD 0F:EDED: 85 28
	LDA objYPage,X                  ;C - - - - - 0x01EDFF 0F:EDEF: BD E0 03
	BMI loc_0F_EE18                 ;C - - - - - 0x01EE02 0F:EDF2: 30 24
	BNE loc_0F_EE12                 ;C - - - - - 0x01EE04 0F:EDF4: D0 1C
	LDA objY,X                      ;C - - - - - 0x01EE06 0F:EDF6: BD C0 03
	CLC                             ;C - - - - - 0x01EE09 0F:EDF9: 18
	ADC tbl_0F_EF2F,Y               ;C - - - - - 0x01EE0A 0F:EDFA: 79 2F EF
	STA spritePriorityBit           ;C - - - - - 0x01EE0D 0F:EDFD: 85 11
	LDA tbl_0F_EF2F,Y               ;C - - - - - 0x01EE0F 0F:EDFF: B9 2F EF
	BPL loc_0F_EE08                 ;C - - - - - 0x01EE12 0F:EE02: 10 04
	BCC loc_0F_EE18                 ;C - - - - - 0x01EE14 0F:EE04: 90 12
	BCS loc_0F_EE0A                 ;C - - - - - 0x01EE16 0F:EE06: B0 02
loc_0F_EE08:
	BCS loc_0F_EE12                 ;c - - - - - 0x01EE18 0F:EE08: B0 08
loc_0F_EE0A:
	LDA spritePriorityBit           ;C - - - - - 0x01EE1A 0F:EE0A: A5 11
	CMP #$F0                        ;C - - - - - 0x01EE1C 0F:EE0C: C9 F0
	BCC loc_0F_EE43                 ;C - - - - - 0x01EE1E 0F:EE0E: 90 33
	BCS loc_0F_EE08                 ;c - - - - - 0x01EE20 0F:EE10: B0 F6
loc_0F_EE12:
	LDA #$EF                        ;c - - - - - 0x01EE22 0F:EE12: A9 EF
	STA spritePriorityBit           ;c - - - - - 0x01EE24 0F:EE14: 85 11
	BNE loc_0F_EE43                 ;c - - - - - 0x01EE26 0F:EE16: D0 2B
loc_0F_EE18:
	LDA #$00                        ;c - - - - - 0x01EE28 0F:EE18: A9 00
	STA spritePriorityBit           ;c - - - - - 0x01EE2A 0F:EE1A: 85 11
	BEQ loc_0F_EE43                 ;c - - - - - 0x01EE2C 0F:EE1C: F0 25
loc_0F_EE1E:
	LDA spritePriorityBit           ;c - - - - - 0x01EE2E 0F:EE1E: A5 11
	CLC                             ;c - - - - - 0x01EE30 0F:EE20: 18
	ADC tbl_0F_EF2F,Y               ;c - - - - - 0x01EE31 0F:EE21: 79 2F EF
	STA spritePriorityBit           ;c - - - - - 0x01EE34 0F:EE24: 85 11
	CMP #$F0                        ;c - - - - - 0x01EE36 0F:EE26: C9 F0
	BCC loc_0F_EE32                 ;c - - - - - 0x01EE38 0F:EE28: 90 08
	ADC #$10                        ;c - - - - - 0x01EE3A 0F:EE2A: 69 10
	STA spritePriorityBit           ;c - - - - - 0x01EE3C 0F:EE2C: 85 11
	INC ptr_04                      ;c - - - - - 0x01EE3E 0F:EE2E: E6 04
	BEQ loc_0F_EE43                 ;c - - - - - 0x01EE40 0F:EE30: F0 11
loc_0F_EE32:
	INY                             ;c - - - - - 0x01EE42 0F:EE32: C8
	STY ram_0040                    ;c - - - - - 0x01EE43 0F:EE33: 84 40
	LDY ptr_02                      ;c - - - - - 0x01EE45 0F:EE35: A4 02
	LDA #$00                        ;c - - - - - 0x01EE47 0F:EE37: A9 00
	STA a:ptr_42,Y                  ;c - - - - - 0x01EE49 0F:EE39: 99 42 00
	DEC ptr_02                      ;c - - - - - 0x01EE4C 0F:EE3C: C6 02
	BPL loc_0F_EE1E                 ;c - - - - - 0x01EE4E 0F:EE3E: 10 DE
	JMP loc_0F_EEDF                 ;c - - - - - 0x01EE50 0F:EE40: 4C DF EE
loc_0F_EE43:
	LDA spritePriorityBit           ;C - - - - - 0x01EE53 0F:EE43: A5 11
	LSR A                           ;C - - - - - 0x01EE55 0F:EE45: 4A
	LSR A                           ;C - - - - - 0x01EE56 0F:EE46: 4A
	PHA                             ;C - - - - - 0x01EE57 0F:EE47: 48
	AND #$38                        ;C - - - - - 0x01EE58 0F:EE48: 29 38
	ORA ram_0028                    ;C - - - - - 0x01EE5A 0F:EE4A: 05 28
	STA ram_0028                    ;C - - - - - 0x01EE5C 0F:EE4C: 85 28
	PLA                             ;C - - - - - 0x01EE5E 0F:EE4E: 68
	LSR A                           ;C - - - - - 0x01EE5F 0F:EE4F: 4A
	AND #$02                        ;C - - - - - 0x01EE60 0F:EE50: 29 02
	ORA ptr_02+1                    ;C - - - - - 0x01EE62 0F:EE52: 05 03
	STA ptr_02+1                    ;C - - - - - 0x01EE64 0F:EE54: 85 03
	STX ptr_04                      ;C - - - - - 0x01EE66 0F:EE56: 86 04
	LDY stageData                   ;C - - - - - 0x01EE68 0F:EE58: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01EE6A 0F:EE5A: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01EE6D 0F:EE5D: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01EE6F 0F:EE5F: 20 4D FF
	LDX ptr_04                      ;C - - - - - 0x01EE72 0F:EE62: A6 04
	LDY spriteBaseX                 ;C - - - - - 0x01EE74 0F:EE64: A4 13
	JSR StageScreenPtr              ;C - - - - - 0x01EE76 0F:EE66: 20 6E E6
loc_0F_EE69:
	JSR StageMetaPtr                ;C - - - - - 0x01EE79 0F:EE69: 20 53 E6
loc_0F_EE6C:
	LDY ptr_02+1                    ;C - - - - - 0x01EE7C 0F:EE6C: A4 03
	LDA (ptr_00),Y                  ;C - - - - - 0x01EE7E 0F:EE6E: B1 00
	TAY                             ;C - - - - - 0x01EE80 0F:EE70: A8
	LDA stageBlockAttr,Y            ;C - - - - - 0x01EE81 0F:EE71: B9 00 BF
	AND #$F0                        ;C - - - - - 0x01EE84 0F:EE74: 29 F0
	LDY ptr_02                      ;C - - - - - 0x01EE86 0F:EE76: A4 02
	STA a:ptr_42,Y                  ;C - - - - - 0x01EE88 0F:EE78: 99 42 00
	CMP ram_0041                    ;C - - - - - 0x01EE8B 0F:EE7B: C5 41
	BCC loc_0F_EE81                 ;C - - - - - 0x01EE8D 0F:EE7D: 90 02
	STA ram_0041                    ;C - - - - - 0x01EE8F 0F:EE7F: 85 41
loc_0F_EE81:
	ORA spriteFlipMask              ;C - - - - - 0x01EE91 0F:EE81: 05 10
	STA spriteFlipMask              ;C - - - - - 0x01EE93 0F:EE83: 85 10
	DEC ptr_02                      ;C - - - - - 0x01EE95 0F:EE85: C6 02
	BMI loc_0F_EEBD                 ;C - - - - - 0x01EE97 0F:EE87: 30 34
	INC ram_0040                    ;C - - - - - 0x01EE99 0F:EE89: E6 40
	LDY ram_0040                    ;C - - - - - 0x01EE9B 0F:EE8B: A4 40
	LDA spritePriorityBit           ;C - - - - - 0x01EE9D 0F:EE8D: A5 11
	PHA                             ;C - - - - - 0x01EE9F 0F:EE8F: 48
	AND #$10                        ;C - - - - - 0x01EEA0 0F:EE90: 29 10
	STA ptr_04                      ;C - - - - - 0x01EEA2 0F:EE92: 85 04
	PLA                             ;C - - - - - 0x01EEA4 0F:EE94: 68
	CLC                             ;C - - - - - 0x01EEA5 0F:EE95: 18
	ADC tbl_0F_EF2F,Y               ;C - - - - - 0x01EEA6 0F:EE96: 79 2F EF
	STA spritePriorityBit           ;C - - - - - 0x01EEA9 0F:EE99: 85 11
	AND #$10                        ;C - - - - - 0x01EEAB 0F:EE9B: 29 10
	CMP ptr_04                      ;C - - - - - 0x01EEAD 0F:EE9D: C5 04
	BEQ loc_0F_EE6C                 ;C - - - - - 0x01EEAF 0F:EE9F: F0 CB
	LDA ptr_02+1                    ;C - - - - - 0x01EEB1 0F:EEA1: A5 03
	EOR #$02                        ;C - - - - - 0x01EEB3 0F:EEA3: 49 02
	STA ptr_02+1                    ;C - - - - - 0x01EEB5 0F:EEA5: 85 03
	AND #$02                        ;C - - - - - 0x01EEB7 0F:EEA7: 29 02
	BNE loc_0F_EE6C                 ;C - - - - - 0x01EEB9 0F:EEA9: D0 C1
	LDA ram_0028                    ;C - - - - - 0x01EEBB 0F:EEAB: A5 28
	PHA                             ;C - - - - - 0x01EEBD 0F:EEAD: 48
	CLC                             ;C - - - - - 0x01EEBE 0F:EEAE: 18
	ADC #$08                        ;C - - - - - 0x01EEBF 0F:EEAF: 69 08
	STA ram_0028                    ;C - - - - - 0x01EEC1 0F:EEB1: 85 28
	CMP #$40                        ;C - - - - - 0x01EEC3 0F:EEB3: C9 40
	PLA                             ;C - - - - - 0x01EEC5 0F:EEB5: 68
	BCC loc_0F_EE69                 ;C - - - - - 0x01EEC6 0F:EEB6: 90 B1
	STA ram_0028                    ;c - - - - - 0x01EEC8 0F:EEB8: 85 28
	JMP loc_0F_EE6C                 ;c - - - - - 0x01EECA 0F:EEBA: 4C 6C EE
loc_0F_EEBD:
	CPX #$00                        ;C - - - - - 0x01EECD 0F:EEBD: E0 00
	BNE loc_0F_EEC1                 ;C - - - - - 0x01EECF 0F:EEBF: D0 00
loc_0F_EEC1:
	JMP loc_0F_EEDF                 ;C - - - - - 0x01EED1 0F:EEC1: 4C DF EE
; switches to the stage bank, saves the old one
TileCollideBegin:
	PHA                             ;C - - - - - 0x01EED4 0F:EEC4: 48
	TXA                             ;C - - - - - 0x01EED5 0F:EEC5: 8A
	PHA                             ;C - - - - - 0x01EED6 0F:EEC6: 48
	LDA #$00                        ;C - - - - - 0x01EED7 0F:EEC7: A9 00
	STA spriteFlipMask              ;C - - - - - 0x01EED9 0F:EEC9: 85 10
	STA ram_0041                    ;C - - - - - 0x01EEDB 0F:EECB: 85 41
	LDA prgBankA000                 ;C - - - - - 0x01EEDD 0F:EECD: A5 F5
	STA ram_002F                    ;C - - - - - 0x01EEDF 0F:EECF: 85 2F
	LDY stageData                   ;C - - - - - 0x01EEE1 0F:EED1: A4 22
	LDA stageBankTable,Y            ;C - - - - - 0x01EEE3 0F:EED3: B9 F8 C1
	STA prgBankA000                 ;C - - - - - 0x01EEE6 0F:EED6: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01EEE8 0F:EED8: 20 4D FF
	PLA                             ;C - - - - - 0x01EEEB 0F:EEDB: 68
	TAX                             ;C - - - - - 0x01EEEC 0F:EEDC: AA
	PLA                             ;C - - - - - 0x01EEED 0F:EEDD: 68
	RTS                             ;C - - - - - 0x01EEEE 0F:EEDE: 60
loc_0F_EEDF:
	TXA                             ;C - - - - - 0x01EEEF 0F:EEDF: 8A
	PHA                             ;C - - - - - 0x01EEF0 0F:EEE0: 48
	LDA ram_002F                    ;C - - - - - 0x01EEF1 0F:EEE1: A5 2F
	STA prgBankA000                 ;C - - - - - 0x01EEF3 0F:EEE3: 85 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01EEF5 0F:EEE5: 20 4D FF
	PLA                             ;C - - - - - 0x01EEF8 0F:EEE8: 68
	TAX                             ;C - - - - - 0x01EEF9 0F:EEE9: AA
	RTS                             ;C - - - - - 0x01EEFA 0F:EEEA: 60
tbl_0F_EEEB:
	.byte $00,$05,$09,$0D,$11,$15,$19,$1E,$21;- D 3 - - - 0x01EEFB 0F:EEEB:
tbl_0F_EEF4:
	.byte $24,$29                   ;- D 3 - - - 0x01EF04 0F:EEF4:
tbl_0F_EEF6:
	.byte $02                       ;- D 3 - - - 0x01EF06 0F:EEF6:
tbl_0F_EEF7:
	.byte $12                       ;- D 3 - - - 0x01EF07 0F:EEF7:
tbl_0F_EEF8:
	.byte $F9,$07,$07,$01,$EE,$F9,$0E,$01,$12,$F9,$0E,$01,$EC,$F9,$0E,$01;- D 3 - - - 0x01EF08 0F:EEF8:
	.byte $14,$F9,$0E,$01,$EC,$F9,$0E,$02,$10,$FB,$05,$05,$00,$10,$F0,$00;- D 3 - - - 0x01EF18 0F:EF08:
	.byte $10,$10,$02,$13,$F2,$0E,$0E,$01,$ED,$F2,$1C;- D 3 - - - 0x01EF28 0F:EF18:
tbl_0F_EF23:
	.byte $00,$04                   ;- D 3 - - - 0x01EF33 0F:EF23:
	.byte $08,$0C,$10,$14,$18,$1C   ;- - - - - - 0x01EF35 0F:EF25:
	.byte $20,$24                   ;- D 3 - - - 0x01EF3B 0F:EF2B:
tbl_0F_EF2D:
	.byte $01                       ;- D 3 - - - 0x01EF3D 0F:EF2D:
tbl_0F_EF2E:
	.byte $08                       ;- D 3 - - - 0x01EF3E 0F:EF2E:
tbl_0F_EF2F:
	.byte $F1,$1E,$01,$F8,$F1,$1E   ;- D 3 - - - 0x01EF3F 0F:EF2F:
	.byte $01,$13,$F1,$1E,$01,$ED,$F1,$1E,$01,$08,$F1,$1E,$01,$F8,$F1,$1E;- - - - - - 0x01EF45 0F:EF35:
	.byte $01,$04,$FC,$04,$01,$FC,$FC,$04;- - - - - - 0x01EF55 0F:EF45:
	.byte $01,$10,$F0,$20,$01,$F0,$F0,$20;- D 3 - - - 0x01EF5D 0F:EF4D:
PushOutLeft:
	LDA spriteBaseY                 ;C - - - - - 0x01EF65 0F:EF55: A5 12
	AND #$0F                        ;C - - - - - 0x01EF67 0F:EF57: 29 0F
	STA spriteBaseY                 ;C - - - - - 0x01EF69 0F:EF59: 85 12
	LDA objX,X                      ;C - - - - - 0x01EF6B 0F:EF5B: BD 60 03
	SEC                             ;C - - - - - 0x01EF6E 0F:EF5E: 38
	SBC spriteBaseY                 ;C - - - - - 0x01EF6F 0F:EF5F: E5 12
	STA objX,X                      ;C - - - - - 0x01EF71 0F:EF61: 9D 60 03
	LDA objXPage,X                  ;C - - - - - 0x01EF74 0F:EF64: BD 80 03
	SBC #$00                        ;C - - - - - 0x01EF77 0F:EF67: E9 00
	STA objXPage,X                  ;C - - - - - 0x01EF79 0F:EF69: 9D 80 03
	RTS                             ;C - - - - - 0x01EF7C 0F:EF6C: 60
PushOutRight:
	LDA spriteBaseY                 ;C - - - - - 0x01EF7D 0F:EF6D: A5 12
	AND #$0F                        ;C - - - - - 0x01EF7F 0F:EF6F: 29 0F
	EOR #$0F                        ;C - - - - - 0x01EF81 0F:EF71: 49 0F
	SEC                             ;C - - - - - 0x01EF83 0F:EF73: 38
	ADC objX,X                      ;C - - - - - 0x01EF84 0F:EF74: 7D 60 03
	STA objX,X                      ;C - - - - - 0x01EF87 0F:EF77: 9D 60 03
	LDA objXPage,X                  ;C - - - - - 0x01EF8A 0F:EF7A: BD 80 03
	ADC #$00                        ;C - - - - - 0x01EF8D 0F:EF7D: 69 00
	STA objXPage,X                  ;C - - - - - 0x01EF8F 0F:EF7F: 9D 80 03
	RTS                             ;C - - - - - 0x01EF92 0F:EF82: 60
PushOutDown:
	LDA spritePriorityBit           ;C - - - - - 0x01EF93 0F:EF83: A5 11
	AND #$0F                        ;C - - - - - 0x01EF95 0F:EF85: 29 0F
	EOR #$0F                        ;C - - - - - 0x01EF97 0F:EF87: 49 0F
	SEC                             ;C - - - - - 0x01EF99 0F:EF89: 38
	ADC objY,X                      ;C - - - - - 0x01EF9A 0F:EF8A: 7D C0 03
	STA objY,X                      ;C - - - - - 0x01EF9D 0F:EF8D: 9D C0 03
	CMP #$F0                        ;C - - - - - 0x01EFA0 0F:EF90: C9 F0
	BCC loc_0F_EF9C                 ;C - - - - - 0x01EFA2 0F:EF92: 90 08
	ADC #$0F                        ;c - - - - - 0x01EFA4 0F:EF94: 69 0F
	STA objY,X                      ;c - - - - - 0x01EFA6 0F:EF96: 9D C0 03
	INC objYPage,X                  ;c - - - - - 0x01EFA9 0F:EF99: FE E0 03
loc_0F_EF9C:
	RTS                             ;C - - - - - 0x01EFAC 0F:EF9C: 60
PushOutUp:
	LDA spritePriorityBit           ;C - - - - - 0x01EFAD 0F:EF9D: A5 11
	PHA                             ;C - - - - - 0x01EFAF 0F:EF9F: 48
	AND #$0F                        ;C - - - - - 0x01EFB0 0F:EFA0: 29 0F
	STA spritePriorityBit           ;C - - - - - 0x01EFB2 0F:EFA2: 85 11
	LDA objY,X                      ;C - - - - - 0x01EFB4 0F:EFA4: BD C0 03
	SEC                             ;C - - - - - 0x01EFB7 0F:EFA7: 38
	SBC spritePriorityBit           ;C - - - - - 0x01EFB8 0F:EFA8: E5 11
	STA objY,X                      ;C - - - - - 0x01EFBA 0F:EFAA: 9D C0 03
	BCS loc_0F_EFB7                 ;C - - - - - 0x01EFBD 0F:EFAD: B0 08
	SBC #$0F                        ;c - - - - - 0x01EFBF 0F:EFAF: E9 0F
	STA objY,X                      ;c - - - - - 0x01EFC1 0F:EFB1: 9D C0 03
	DEC objYPage,X                  ;c - - - - - 0x01EFC4 0F:EFB4: DE E0 03
loc_0F_EFB7:
	PLA                             ;C - - - - - 0x01EFC7 0F:EFB7: 68
	STA spritePriorityBit           ;C - - - - - 0x01EFC8 0F:EFB8: 85 11
	RTS                             ;C - - - - - 0x01EFCA 0F:EFBA: 60
	.byte $00,$EC,$40,$25,$00,$01,$00,$10,$00,$00,$00,$02,$00,$01,$00,$00;- - - - - - 0x01EFCB 0F:EFBB:
	.byte $01,$08,$40,$38,$00,$10,$01,$20,$00,$00,$40,$20,$00,$94,$10,$00;- - - - - - 0x01EFDB 0F:EFCB:
	.byte $00,$1D,$41,$28,$04,$2D,$41,$13,$14,$16,$10,$80,$74,$16,$50,$24;- - - - - - 0x01EFEB 0F:EFDB:
	.byte $54,$40,$11,$3A,$02,$A1,$14,$02,$50,$F4,$41,$80,$00,$04,$10,$18;- - - - - - 0x01EFFB 0F:EFEB:
	.byte $00,$88,$04,$AC,$21       ;- - - - - - 0x01F00B 0F:EFFB:
SetFlag40MoveRight:
	JSR SetObjFlag40                ;C - - - - - 0x01F010 0F:F000: 20 90 F0
MoveRightCheck:
	CPX #$00                        ;C - - - - - 0x01F013 0F:F003: E0 00
	BNE loc_0F_F011                 ;C - - - - - 0x01F015 0F:F005: D0 0A
	LDA objX                        ;C - - - - - 0x01F017 0F:F007: AD 60 03
	STA ptr_02                      ;C - - - - - 0x01F01A 0F:F00A: 85 02
	LDA objXPage                    ;C - - - - - 0x01F01C 0F:F00C: AD 80 03
	STA ptr_02+1                    ;C - - - - - 0x01F01F 0F:F00F: 85 03
loc_0F_F011:
	JSR ApplyVelXAdd                ;C - - - - - 0x01F021 0F:F011: 20 83 F1
	JSR TileCollideX                ;C - - - - - 0x01F024 0F:F014: 20 BA ED
	CLC                             ;C - - - - - 0x01F027 0F:F017: 18
	LDA spriteFlipMask              ;C - - - - - 0x01F028 0F:F018: A5 10
	AND #$40                        ;C - - - - - 0x01F02A 0F:F01A: 29 40
	BNE loc_0F_F025                 ;C - - - - - 0x01F02C 0F:F01C: D0 07
	BEQ loc_0F_F024                 ;C - - - - - 0x01F02E 0F:F01E: F0 04
loc_0F_F020:
	JSR PushOutLeft                 ;C - - - - - 0x01F030 0F:F020: 20 55 EF
	SEC                             ;C - - - - - 0x01F033 0F:F023: 38
loc_0F_F024:
	RTS                             ;C - - - - - 0x01F034 0F:F024: 60
loc_0F_F025:
	CPX #$00                        ;C - - - - - 0x01F035 0F:F025: E0 00
	BNE loc_0F_F020                 ;C - - - - - 0x01F037 0F:F027: D0 F7
	LDA spriteFlipMask              ;c - - - - - 0x01F039 0F:F029: A5 10
	CMP #$40                        ;c - - - - - 0x01F03B 0F:F02B: C9 40
	BEQ loc_0F_F035                 ;c - - - - - 0x01F03D 0F:F02D: F0 06
	CMP #$50                        ;c - - - - - 0x01F03F 0F:F02F: C9 50
	BEQ loc_0F_F035                 ;c - - - - - 0x01F041 0F:F031: F0 02
	CLC                             ;c - - - - - 0x01F043 0F:F033: 18
	RTS                             ;c - - - - - 0x01F044 0F:F034: 60
loc_0F_F035:
	LDA objVelYHi                   ;c - - - - - 0x01F045 0F:F035: AD 30 04
	BMI loc_0F_F024                 ;c - - - - - 0x01F048 0F:F038: 30 EA
	JSR StartAction24FromGrab       ;c - - - - - 0x01F04A 0F:F03A: 20 DC F0
	CLC                             ;c - - - - - 0x01F04D 0F:F03D: 18
	RTS                             ;c - - - - - 0x01F04E 0F:F03E: 60
; objFlags[0] |= $40
SetPlayerFlag40:
	LDA objFlags                    ;C - - - - - 0x01F04F 0F:F03F: AD 60 05
	ORA #$40                        ;C - - - - - 0x01F052 0F:F042: 09 40
	STA objFlags                    ;C - - - - - 0x01F054 0F:F044: 8D 60 05
	RTS                             ;C - - - - - 0x01F057 0F:F047: 60
; objFlags[0] &= $BF
ClearPlayerFlag40:
	LDA objFlags                    ;C - - - - - 0x01F058 0F:F048: AD 60 05
	AND #$BF                        ;C - - - - - 0x01F05B 0F:F04B: 29 BF
	STA objFlags                    ;C - - - - - 0x01F05D 0F:F04D: 8D 60 05
	RTS                             ;C - - - - - 0x01F060 0F:F050: 60
ClearFlag40MoveLeft:
	JSR ClearObjFlag40              ;C - - - - - 0x01F061 0F:F051: 20 99 F0
MoveLeftCheck:
	CPX #$00                        ;C - - - - - 0x01F064 0F:F054: E0 00
	BNE loc_0F_F062                 ;C - - - - - 0x01F066 0F:F056: D0 0A
	LDA objX                        ;C - - - - - 0x01F068 0F:F058: AD 60 03
	STA ptr_02                      ;C - - - - - 0x01F06B 0F:F05B: 85 02
	LDA objXPage                    ;C - - - - - 0x01F06D 0F:F05D: AD 80 03
	STA ptr_02+1                    ;C - - - - - 0x01F070 0F:F060: 85 03
loc_0F_F062:
	JSR ApplyVelXSub                ;C - - - - - 0x01F072 0F:F062: 20 A1 F1
	JSR TileCollideX                ;C - - - - - 0x01F075 0F:F065: 20 BA ED
	CLC                             ;C - - - - - 0x01F078 0F:F068: 18
	LDA spriteFlipMask              ;C - - - - - 0x01F079 0F:F069: A5 10
	AND #$40                        ;C - - - - - 0x01F07B 0F:F06B: 29 40
	BNE loc_0F_F076                 ;C - - - - - 0x01F07D 0F:F06D: D0 07
	BEQ loc_0F_F075                 ;C - - - - - 0x01F07F 0F:F06F: F0 04
loc_0F_F071:
	JSR PushOutRight                ;C - - - - - 0x01F081 0F:F071: 20 6D EF
	SEC                             ;C - - - - - 0x01F084 0F:F074: 38
loc_0F_F075:
	RTS                             ;C - - - - - 0x01F085 0F:F075: 60
loc_0F_F076:
	CPX #$00                        ;C - - - - - 0x01F086 0F:F076: E0 00
	BNE loc_0F_F071                 ;C - - - - - 0x01F088 0F:F078: D0 F7
	LDA spriteFlipMask              ;c - - - - - 0x01F08A 0F:F07A: A5 10
	CMP #$40                        ;c - - - - - 0x01F08C 0F:F07C: C9 40
	BEQ loc_0F_F086                 ;c - - - - - 0x01F08E 0F:F07E: F0 06
	CMP #$50                        ;c - - - - - 0x01F090 0F:F080: C9 50
	BEQ loc_0F_F086                 ;c - - - - - 0x01F092 0F:F082: F0 02
	CLC                             ;c - - - - - 0x01F094 0F:F084: 18
	RTS                             ;c - - - - - 0x01F095 0F:F085: 60
loc_0F_F086:
	LDA objVelYHi                   ;c - - - - - 0x01F096 0F:F086: AD 30 04
	BMI loc_0F_F075                 ;c - - - - - 0x01F099 0F:F089: 30 EA
	JSR StartAction24FromGrab       ;c - - - - - 0x01F09B 0F:F08B: 20 DC F0
	CLC                             ;c - - - - - 0x01F09E 0F:F08E: 18
	RTS                             ;c - - - - - 0x01F09F 0F:F08F: 60
; objFlags[X] |= $40
SetObjFlag40:
	LDA objFlags,X                  ;C - - - - - 0x01F0A0 0F:F090: BD 60 05
	ORA #$40                        ;C - - - - - 0x01F0A3 0F:F093: 09 40
	STA objFlags,X                  ;C - - - - - 0x01F0A5 0F:F095: 9D 60 05
	RTS                             ;C - - - - - 0x01F0A8 0F:F098: 60
ClearObjFlag40:
	LDA objFlags,X                  ;C - - - - - 0x01F0A9 0F:F099: BD 60 05
	AND #$BF                        ;C - - - - - 0x01F0AC 0F:F09C: 29 BF
	STA objFlags,X                  ;C - - - - - 0x01F0AE 0F:F09E: 9D 60 05
	RTS                             ;C - - - - - 0x01F0B1 0F:F0A1: 60
MoveYAddCheck:
	CPX #$00                        ;C - - - - - 0x01F0B2 0F:F0A2: E0 00
	BNE loc_0F_F0B0                 ;C - - - - - 0x01F0B4 0F:F0A4: D0 0A
	LDA objY                        ;C - - - - - 0x01F0B6 0F:F0A6: AD C0 03
	STA ptr_02                      ;C - - - - - 0x01F0B9 0F:F0A9: 85 02
	LDA objXPage                    ;C - - - - - 0x01F0BB 0F:F0AB: AD 80 03
	STA ptr_02+1                    ;C - - - - - 0x01F0BE 0F:F0AE: 85 03
loc_0F_F0B0:
	JSR ApplyVelYAdd                ;C - - - - - 0x01F0C0 0F:F0B0: 20 BF F1
	JSR TileCollideY                ;C - - - - - 0x01F0C3 0F:F0B3: 20 CF EC
	CLC                             ;C - - - - - 0x01F0C6 0F:F0B6: 18
	LDA spriteFlipMask              ;C - - - - - 0x01F0C7 0F:F0B7: A5 10
	CMP #$10                        ;C - - - - - 0x01F0C9 0F:F0B9: C9 10
	BNE loc_0F_F0C2                 ;C - - - - - 0x01F0CB 0F:F0BB: D0 05
loc_0F_F0BD:
	JSR PushOutUp                   ;C - - - - - 0x01F0CD 0F:F0BD: 20 9D EF
	SEC                             ;C - - - - - 0x01F0D0 0F:F0C0: 38
	RTS                             ;C - - - - - 0x01F0D1 0F:F0C1: 60
loc_0F_F0C2:
	CMP #$02                        ;C - - - - - 0x01F0D2 0F:F0C2: C9 02
	BEQ loc_0F_F0CC                 ;C - - - - - 0x01F0D4 0F:F0C4: F0 06
	AND #$40                        ;C - - - - - 0x01F0D6 0F:F0C6: 29 40
	BNE loc_0F_F0D4                 ;C - - - - - 0x01F0D8 0F:F0C8: D0 0A
	CLC                             ;C - - - - - 0x01F0DA 0F:F0CA: 18
	RTS                             ;C - - - - - 0x01F0DB 0F:F0CB: 60
loc_0F_F0CC:
	LDA gameAction                  ;c - - - - - 0x01F0DC 0F:F0CC: A5 30
	CMP #$0D                        ;c - - - - - 0x01F0DE 0F:F0CE: C9 0D
	BEQ loc_0F_F0BD                 ;c - - - - - 0x01F0E0 0F:F0D0: F0 EB
	CLC                             ;c - - - - - 0x01F0E2 0F:F0D2: 18
	RTS                             ;c - - - - - 0x01F0E3 0F:F0D3: 60
loc_0F_F0D4:
	CPX #$00                        ;C - - - - - 0x01F0E4 0F:F0D4: E0 00
	BNE loc_0F_F0BD                 ;C - - - - - 0x01F0E6 0F:F0D6: D0 E5
	JSR StartAction24FromGrab       ;c - - - - - 0x01F0E8 0F:F0D8: 20 DC F0
	RTS                             ;c - - - - - 0x01F0EB 0F:F0DB: 60
; gameAction=$24, remembers the old one in ram_00BE
StartAction24FromGrab:
	LDA gameAction                  ;c - - - - - 0x01F0EC 0F:F0DC: A5 30
	STA ram_00BE                    ;c - - - - - 0x01F0EE 0F:F0DE: 85 BE
	LDA #$24                        ;c - - - - - 0x01F0F0 0F:F0E0: A9 24
	STA gameAction                  ;c - - - - - 0x01F0F2 0F:F0E2: 85 30
	LDA #$80                        ;c - - - - - 0x01F0F4 0F:F0E4: A9 80
	STA objActive                   ;c - - - - - 0x01F0F6 0F:F0E6: 8D 00 03
	LDA ram_00BE                    ;c - - - - - 0x01F0F9 0F:F0E9: A5 BE
	CMP #$04                        ;c - - - - - 0x01F0FB 0F:F0EB: C9 04
	BNE loc_0F_F0F6                 ;c - - - - - 0x01F0FD 0F:F0ED: D0 07
	LDA #$FF                        ;c - - - - - 0x01F0FF 0F:F0EF: A9 FF
	LDY ram_0039                    ;c - - - - - 0x01F101 0F:F0F1: A4 39
	STA objGrabState,Y              ;c - - - - - 0x01F103 0F:F0F3: 99 F0 03
loc_0F_F0F6:
	RTS                             ;c - - - - - 0x01F106 0F:F0F6: 60
MoveYSubCheck:
	CPX #$00                        ;C - - - - - 0x01F107 0F:F0F7: E0 00
	BNE loc_0F_F105                 ;C - - - - - 0x01F109 0F:F0F9: D0 0A
	LDA objY                        ;C - - - - - 0x01F10B 0F:F0FB: AD C0 03
	STA ptr_02                      ;C - - - - - 0x01F10E 0F:F0FE: 85 02
	LDA objXPage                    ;C - - - - - 0x01F110 0F:F100: AD 80 03
	STA ptr_02+1                    ;C - - - - - 0x01F113 0F:F103: 85 03
loc_0F_F105:
	JSR ApplyVelYUpAlt              ;C - - - - - 0x01F115 0F:F105: 20 DF F1
	JSR TileCollideY                ;C - - - - - 0x01F118 0F:F108: 20 CF EC
	CLC                             ;C - - - - - 0x01F11B 0F:F10B: 18
	LDA spriteFlipMask              ;C - - - - - 0x01F11C 0F:F10C: A5 10
	CMP #$30                        ;C - - - - - 0x01F11E 0F:F10E: C9 30
	BEQ loc_0F_F114                 ;C - - - - - 0x01F120 0F:F110: F0 02
	BNE loc_0F_F118                 ;C - - - - - 0x01F122 0F:F112: D0 04
loc_0F_F114:
	JSR PushOutDown                 ;C - - - - - 0x01F124 0F:F114: 20 83 EF
	SEC                             ;C - - - - - 0x01F127 0F:F117: 38
loc_0F_F118:
	RTS                             ;C - - - - - 0x01F128 0F:F118: 60
MoveYGravityCheck:
	CPX #$00                        ;C - - - - - 0x01F129 0F:F119: E0 00
	BNE loc_0F_F127                 ;C - - - - - 0x01F12B 0F:F11B: D0 0A
	LDA objY                        ;C - - - - - 0x01F12D 0F:F11D: AD C0 03
	STA ptr_02                      ;C - - - - - 0x01F130 0F:F120: 85 02
	LDA objXPage                    ;C - - - - - 0x01F132 0F:F122: AD 80 03
	STA ptr_02+1                    ;C - - - - - 0x01F135 0F:F125: 85 03
loc_0F_F127:
	LDA objVelYHi,X                 ;C - - - - - 0x01F137 0F:F127: BD 30 04
	BPL loc_0F_F14E                 ;C - - - - - 0x01F13A 0F:F12A: 10 22
	JSR ApplyVelYSub                ;C - - - - - 0x01F13C 0F:F12C: 20 0E F2
	JSR ApplyGravity                ;C - - - - - 0x01F13F 0F:F12F: 20 4C F2
	JSR TileCollideY                ;C - - - - - 0x01F142 0F:F132: 20 CF EC
	CPX #$00                        ;C - - - - - 0x01F145 0F:F135: E0 00
	BNE loc_0F_F139                 ;C - - - - - 0x01F147 0F:F137: D0 00
loc_0F_F139:
	LDA spriteFlipMask              ;C - - - - - 0x01F149 0F:F139: A5 10
	CMP #$10                        ;C - - - - - 0x01F14B 0F:F13B: C9 10
	BEQ loc_0F_F146                 ;C - - - - - 0x01F14D 0F:F13D: F0 07
	CMP #$40                        ;C - - - - - 0x01F14F 0F:F13F: C9 40
	BCS loc_0F_F170                 ;C - - - - - 0x01F151 0F:F141: B0 2D
	JMP loc_0F_F16E                 ;C - - - - - 0x01F153 0F:F143: 4C 6E F1
loc_0F_F146:
	JSR PushOutUp                   ;C - - - - - 0x01F156 0F:F146: 20 9D EF
	JSR SetHopVelY                  ;C - - - - - 0x01F159 0F:F149: 20 6E F2
	SEC                             ;C - - - - - 0x01F15C 0F:F14C: 38
	RTS                             ;C - - - - - 0x01F15D 0F:F14D: 60
loc_0F_F14E:
	INY                             ;C - - - - - 0x01F15E 0F:F14E: C8
	JSR ApplyVelYUp                 ;C - - - - - 0x01F15F 0F:F14F: 20 2E F2
	JSR ApplyGravity                ;C - - - - - 0x01F162 0F:F152: 20 4C F2
	JSR TileCollideY                ;C - - - - - 0x01F165 0F:F155: 20 CF EC
	LDA spriteFlipMask              ;C - - - - - 0x01F168 0F:F158: A5 10
	CMP #$30                        ;C - - - - - 0x01F16A 0F:F15A: C9 30
	BEQ loc_0F_F16E                 ;C - - - - - 0x01F16C 0F:F15C: F0 10
	CMP #$40                        ;C - - - - - 0x01F16E 0F:F15E: C9 40
	BCS loc_0F_F170                 ;C - - - - - 0x01F170 0F:F160: B0 0E
	CMP #$10                        ;C - - - - - 0x01F172 0F:F162: C9 10
	BEQ loc_0F_F168                 ;C - - - - - 0x01F174 0F:F164: F0 02
	BNE loc_0F_F16E                 ;C - - - - - 0x01F176 0F:F166: D0 06
loc_0F_F168:
	JSR PushOutDown                 ;c - - - - - 0x01F178 0F:F168: 20 83 EF
	JSR SetHopVelY                  ;c - - - - - 0x01F17B 0F:F16B: 20 6E F2
loc_0F_F16E:
	CLC                             ;C - - - - - 0x01F17E 0F:F16E: 18
	RTS                             ;C - - - - - 0x01F17F 0F:F16F: 60
loc_0F_F170:
	CPX #$00                        ;C - - - - - 0x01F180 0F:F170: E0 00
	BNE loc_0F_F16E                 ;C - - - - - 0x01F182 0F:F172: D0 FA
	LDA gameAction                  ;C - - - - - 0x01F184 0F:F174: A5 30
	STA ram_00BE                    ;C - - - - - 0x01F186 0F:F176: 85 BE
	LDA #$80                        ;C - - - - - 0x01F188 0F:F178: A9 80
	STA objActive                   ;C - - - - - 0x01F18A 0F:F17A: 8D 00 03
	LDA #$24                        ;C - - - - - 0x01F18D 0F:F17D: A9 24
	STA gameAction                  ;C - - - - - 0x01F18F 0F:F17F: 85 30
	CLC                             ;C - - - - - 0x01F191 0F:F181: 18
	RTS                             ;C - - - - - 0x01F192 0F:F182: 60
; slot X: 16.8 position += velocity (moving right)
ApplyVelXAdd:
	LDA objXFrac,X                  ;C - - - - - 0x01F193 0F:F183: BD 40 03
	CLC                             ;C - - - - - 0x01F196 0F:F186: 18
	ADC objVelXLo,X                 ;C - - - - - 0x01F197 0F:F187: 7D 00 04
	STA objXFrac,X                  ;C - - - - - 0x01F19A 0F:F18A: 9D 40 03
	LDA objX,X                      ;C - - - - - 0x01F19D 0F:F18D: BD 60 03
	ADC objVelXHi,X                 ;C - - - - - 0x01F1A0 0F:F190: 7D 10 04
	STA objX,X                      ;C - - - - - 0x01F1A3 0F:F193: 9D 60 03
	BCC loc_0F_F1A0                 ;C - - - - - 0x01F1A6 0F:F196: 90 08
	LDA objXPage,X                  ;C - - - - - 0x01F1A8 0F:F198: BD 80 03
	ADC #$00                        ;C - - - - - 0x01F1AB 0F:F19B: 69 00
	STA objXPage,X                  ;C - - - - - 0x01F1AD 0F:F19D: 9D 80 03
loc_0F_F1A0:
	RTS                             ;C - - - - - 0x01F1B0 0F:F1A0: 60
; slot X: position -= velocity (moving left)
ApplyVelXSub:
	LDA objXFrac,X                  ;C - - - - - 0x01F1B1 0F:F1A1: BD 40 03
	SEC                             ;C - - - - - 0x01F1B4 0F:F1A4: 38
	SBC objVelXLo,X                 ;C - - - - - 0x01F1B5 0F:F1A5: FD 00 04
	STA objXFrac,X                  ;C - - - - - 0x01F1B8 0F:F1A8: 9D 40 03
	LDA objX,X                      ;C - - - - - 0x01F1BB 0F:F1AB: BD 60 03
	SBC objVelXHi,X                 ;C - - - - - 0x01F1BE 0F:F1AE: FD 10 04
	STA objX,X                      ;C - - - - - 0x01F1C1 0F:F1B1: 9D 60 03
	BCS loc_0F_F1BE                 ;C - - - - - 0x01F1C4 0F:F1B4: B0 08
	LDA objXPage,X                  ;C - - - - - 0x01F1C6 0F:F1B6: BD 80 03
	SBC #$00                        ;C - - - - - 0x01F1C9 0F:F1B9: E9 00
	STA objXPage,X                  ;C - - - - - 0x01F1CB 0F:F1BB: 9D 80 03
loc_0F_F1BE:
	RTS                             ;C - - - - - 0x01F1CE 0F:F1BE: 60
; slot X: Y += velocity, wraps at $F0 into objYPage
ApplyVelYAdd:
	LDA objYFrac,X                  ;C - - - - - 0x01F1CF 0F:F1BF: BD A0 03
	CLC                             ;C - - - - - 0x01F1D2 0F:F1C2: 18
	ADC objVelYLo,X                 ;C - - - - - 0x01F1D3 0F:F1C3: 7D 20 04
	STA objYFrac,X                  ;C - - - - - 0x01F1D6 0F:F1C6: 9D A0 03
	LDA objY,X                      ;C - - - - - 0x01F1D9 0F:F1C9: BD C0 03
	ADC objVelYHi,X                 ;C - - - - - 0x01F1DC 0F:F1CC: 7D 30 04
	STA objY,X                      ;C - - - - - 0x01F1DF 0F:F1CF: 9D C0 03
	CMP #$F0                        ;C - - - - - 0x01F1E2 0F:F1D2: C9 F0
	BCC loc_0F_F1DE                 ;C - - - - - 0x01F1E4 0F:F1D4: 90 08
	ADC #$0F                        ;c - - - - - 0x01F1E6 0F:F1D6: 69 0F
	STA objY,X                      ;c - - - - - 0x01F1E8 0F:F1D8: 9D C0 03
	INC objYPage,X                  ;c - - - - - 0x01F1EB 0F:F1DB: FE E0 03
loc_0F_F1DE:
	RTS                             ;C - - - - - 0x01F1EE 0F:F1DE: 60
; copy of ApplyVelYUp
ApplyVelYUpAlt:
	LDA objYFrac,X                  ;C - - - - - 0x01F1EF 0F:F1DF: BD A0 03
	SEC                             ;C - - - - - 0x01F1F2 0F:F1E2: 38
	SBC objVelYLo,X                 ;C - - - - - 0x01F1F3 0F:F1E3: FD 20 04
	STA objYFrac,X                  ;C - - - - - 0x01F1F6 0F:F1E6: 9D A0 03
	LDA objY,X                      ;C - - - - - 0x01F1F9 0F:F1E9: BD C0 03
	SBC objVelYHi,X                 ;C - - - - - 0x01F1FC 0F:F1EC: FD 30 04
	STA objY,X                      ;C - - - - - 0x01F1FF 0F:F1EF: 9D C0 03
	BCS loc_0F_F1FC                 ;C - - - - - 0x01F202 0F:F1F2: B0 08
	SBC #$0F                        ;c - - - - - 0x01F204 0F:F1F4: E9 0F
	STA objY,X                      ;c - - - - - 0x01F206 0F:F1F6: 9D C0 03
	DEC objYPage,X                  ;c - - - - - 0x01F209 0F:F1F9: DE E0 03
loc_0F_F1FC:
	RTS                             ;C - - - - - 0x01F20C 0F:F1FC: 60
; picks Add/Sub from the sign of objVelYHi, then applies gravity
ApplyVelY:
	LDA objVelYHi,X                 ;C - - - - - 0x01F20D 0F:F1FD: BD 30 04
	BPL loc_0F_F208                 ;C - - - - - 0x01F210 0F:F200: 10 06
	JSR ApplyVelYSub                ;C - - - - - 0x01F212 0F:F202: 20 0E F2
	JMP ApplyGravity                ;C - - - - - 0x01F215 0F:F205: 4C 4C F2
loc_0F_F208:
	JSR ApplyVelYUp                 ;C - - - - - 0x01F218 0F:F208: 20 2E F2
	JMP ApplyGravity                ;C - - - - - 0x01F21B 0F:F20B: 4C 4C F2
ApplyVelYSub:
	LDA objYFrac,X                  ;C - - - - - 0x01F21E 0F:F20E: BD A0 03
	SEC                             ;C - - - - - 0x01F221 0F:F211: 38
	SBC objVelYLo,X                 ;C - - - - - 0x01F222 0F:F212: FD 20 04
	STA objYFrac,X                  ;C - - - - - 0x01F225 0F:F215: 9D A0 03
	LDA objY,X                      ;C - - - - - 0x01F228 0F:F218: BD C0 03
	SBC objVelYHi,X                 ;C - - - - - 0x01F22B 0F:F21B: FD 30 04
	STA objY,X                      ;C - - - - - 0x01F22E 0F:F21E: 9D C0 03
	CMP #$F0                        ;C - - - - - 0x01F231 0F:F221: C9 F0
	BCC loc_0F_F22D                 ;C - - - - - 0x01F233 0F:F223: 90 08
	ADC #$0F                        ;c - - - - - 0x01F235 0F:F225: 69 0F
	STA objY,X                      ;c - - - - - 0x01F237 0F:F227: 9D C0 03
	INC objYPage,X                  ;c - - - - - 0x01F23A 0F:F22A: FE E0 03
loc_0F_F22D:
	RTS                             ;C - - - - - 0x01F23D 0F:F22D: 60
ApplyVelYUp:
	LDA objYFrac,X                  ;C - - - - - 0x01F23E 0F:F22E: BD A0 03
	SEC                             ;C - - - - - 0x01F241 0F:F231: 38
	SBC objVelYLo,X                 ;C - - - - - 0x01F242 0F:F232: FD 20 04
	STA objYFrac,X                  ;C - - - - - 0x01F245 0F:F235: 9D A0 03
	LDA objY,X                      ;C - - - - - 0x01F248 0F:F238: BD C0 03
	SBC objVelYHi,X                 ;C - - - - - 0x01F24B 0F:F23B: FD 30 04
	STA objY,X                      ;C - - - - - 0x01F24E 0F:F23E: 9D C0 03
	BCS loc_0F_F24B                 ;C - - - - - 0x01F251 0F:F241: B0 08
	SBC #$0F                        ;c - - - - - 0x01F253 0F:F243: E9 0F
	STA objY,X                      ;c - - - - - 0x01F255 0F:F245: 9D C0 03
	DEC objYPage,X                  ;c - - - - - 0x01F258 0F:F248: DE E0 03
loc_0F_F24B:
	RTS                             ;C - - - - - 0x01F25B 0F:F24B: 60
; objVelY -= ram_0099, clamped at -7
ApplyGravity:
	LDA objVelYLo,X                 ;C - - - - - 0x01F25C 0F:F24C: BD 20 04
	SEC                             ;C - - - - - 0x01F25F 0F:F24F: 38
	SBC ram_0099                    ;C - - - - - 0x01F260 0F:F250: E5 99
	STA objVelYLo,X                 ;C - - - - - 0x01F262 0F:F252: 9D 20 04
	LDA objVelYHi,X                 ;C - - - - - 0x01F265 0F:F255: BD 30 04
	SBC #$00                        ;C - - - - - 0x01F268 0F:F258: E9 00
	STA objVelYHi,X                 ;C - - - - - 0x01F26A 0F:F25A: 9D 30 04
	BPL loc_0F_F26D                 ;C - - - - - 0x01F26D 0F:F25D: 10 0E
	CMP #$F9                        ;C - - - - - 0x01F26F 0F:F25F: C9 F9
	BCS loc_0F_F26D                 ;C - - - - - 0x01F271 0F:F261: B0 0A
	LDA #$F9                        ;C - - - - - 0x01F273 0F:F263: A9 F9
	STA objVelYHi,X                 ;C - - - - - 0x01F275 0F:F265: 9D 30 04
	LDA #$00                        ;C - - - - - 0x01F278 0F:F268: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x01F27A 0F:F26A: 9D 20 04
loc_0F_F26D:
	RTS                             ;C - - - - - 0x01F27D 0F:F26D: 60
SetHopVelY:
	CPX #$00                        ;C - - - - - 0x01F27E 0F:F26E: E0 00
	BEQ loc_0F_F27D                 ;C - - - - - 0x01F280 0F:F270: F0 0B
	LDA #$AB                        ;C - - - - - 0x01F282 0F:F272: A9 AB
	STA objVelYLo,X                 ;C - - - - - 0x01F284 0F:F274: 9D 20 04
	LDA #$FF                        ;C - - - - - 0x01F287 0F:F277: A9 FF
	STA objVelYHi,X                 ;C - - - - - 0x01F289 0F:F279: 9D 30 04
	RTS                             ;C - - - - - 0x01F28C 0F:F27C: 60
loc_0F_F27D:
	LDA #$C0                        ;C - - - - - 0x01F28D 0F:F27D: A9 C0
	STA objVelYLo,X                 ;C - - - - - 0x01F28F 0F:F27F: 9D 20 04
	LDA #$FF                        ;C - - - - - 0x01F292 0F:F282: A9 FF
	STA objVelYHi,X                 ;C - - - - - 0x01F294 0F:F284: 9D 30 04
	RTS                             ;C - - - - - 0x01F297 0F:F287: 60
; A = anim id for slot X
SetAnimX:
	STA objAnim,X                   ;C - - - - - 0x01F298 0F:F288: 9D 80 05
	LDA #$00                        ;C - - - - - 0x01F29B 0F:F28B: A9 00
	STA objAnimFrame,X              ;C - - - - - 0x01F29D 0F:F28D: 9D 70 05
	STA objAnimFlags,X              ;C - - - - - 0x01F2A0 0F:F290: 9D 90 05
	RTS                             ;C - - - - - 0x01F2A3 0F:F293: 60
; A = anim id for slot 0; frame and flags reset
SetPlayerAnim:
	STA objAnim                     ;C - - - - - 0x01F2A4 0F:F294: 8D 80 05
	LDA #$00                        ;C - - - - - 0x01F2A7 0F:F297: A9 00
	STA objAnimFrame                ;C - - - - - 0x01F2A9 0F:F299: 8D 70 05
	STA objAnimFlags                ;C - - - - - 0x01F2AC 0F:F29C: 8D 90 05
	RTS                             ;C - - - - - 0x01F2AF 0F:F29F: 60
; A = anim id for slot Y; keeps dir bit, sets objActive/objState=$80, objFlags=$10
SetAnimY:
	STA objAnim,Y                   ;C - - - - - 0x01F2B0 0F:F2A0: 99 80 05
	LDA #$00                        ;C - - - - - 0x01F2B3 0F:F2A3: A9 00
	STA objAnimFrame,Y              ;C - - - - - 0x01F2B5 0F:F2A5: 99 70 05
	LDA objAnimFlags,Y              ;C - - - - - 0x01F2B8 0F:F2A8: B9 90 05
	AND #$80                        ;C - - - - - 0x01F2BB 0F:F2AB: 29 80
	STA objAnimFlags,Y              ;C - - - - - 0x01F2BD 0F:F2AD: 99 90 05
	LDA #$10                        ;C - - - - - 0x01F2C0 0F:F2B0: A9 10
	STA objFlags,Y                  ;C - - - - - 0x01F2C2 0F:F2B2: 99 60 05
	LDA #$80                        ;C - - - - - 0x01F2C5 0F:F2B5: A9 80
	STA objActive,Y                 ;C - - - - - 0x01F2C7 0F:F2B7: 99 00 03
	STA objState,Y                  ;C - - - - - 0x01F2CA 0F:F2BA: 99 10 03
	RTS                             ;C - - - - - 0x01F2CD 0F:F2BD: 60
; zeroes every field of slot X
ClearObject:
	LDA #$00                        ;C - - - - - 0x01F2CE 0F:F2BE: A9 00
	STA objActive,X                 ;C - - - - - 0x01F2D0 0F:F2C0: 9D 00 03
	STA objState,X                  ;C - - - - - 0x01F2D3 0F:F2C3: 9D 10 03
	STA objFlags,X                  ;C - - - - - 0x01F2D6 0F:F2C6: 9D 60 05
	STA objStunTimer,X              ;C - - - - - 0x01F2D9 0F:F2C9: 9D B0 04
	STA objKind,X                   ;C - - - - - 0x01F2DC 0F:F2CC: 9D 20 03
	STA objId,X                     ;C - - - - - 0x01F2DF 0F:F2CF: 9D 30 03
	STA objAtkBox,X                 ;C - - - - - 0x01F2E2 0F:F2D2: 9D 40 04
	STA objAtkDamage,X              ;C - - - - - 0x01F2E5 0F:F2D5: 9D 50 04
	STA objLife,X                   ;C - - - - - 0x01F2E8 0F:F2D8: 9D 90 04
	STA objHudLife,X                ;C - - - - - 0x01F2EB 0F:F2DB: 9D A0 04
	STA objDownState,X              ;C - - - - - 0x01F2EE 0F:F2DE: 9D C0 04
	STA objAtkHeavy,X               ;C - - - - - 0x01F2F1 0F:F2E1: 9D D0 04
	STA objHitTimer,X               ;C - - - - - 0x01F2F4 0F:F2E4: 9D E0 04
	STA objGrabState,X              ;C - - - - - 0x01F2F7 0F:F2E7: 9D F0 03
	STA objSpriteDown,X             ;C - - - - - 0x01F2FA 0F:F2EA: 9D B0 05
	STA objVariant,X                ;C - - - - - 0x01F2FD 0F:F2ED: 9D C0 05
	STA objTimer,X                  ;C - - - - - 0x01F300 0F:F2F0: 9D D0 05
	STA objCounter,X                ;C - - - - - 0x01F303 0F:F2F3: 9D E0 05
	STA objToggle,X                 ;C - - - - - 0x01F306 0F:F2F6: 9D F0 05
	STA objSpriteAir,X              ;C - - - - - 0x01F309 0F:F2F9: 9D F0 04
	STA objStep,X                   ;C - - - - - 0x01F30C 0F:F2FC: 9D 00 05
	STA objLandY,X                  ;C - - - - - 0x01F30F 0F:F2FF: 9D 10 05
	STA objStartY,X                 ;C - - - - - 0x01F312 0F:F302: 9D 20 05
	STA objSavedY,X                 ;C - - - - - 0x01F315 0F:F305: 9D 30 05
	STA objCooldown,X               ;C - - - - - 0x01F318 0F:F308: 9D 40 05
	STA objSubStep,X                ;C - - - - - 0x01F31B 0F:F30B: 9D 50 05
	LDA #$FF                        ;C - - - - - 0x01F31E 0F:F30E: A9 FF
	STA objSpawnIndex,X             ;C - - - - - 0x01F320 0F:F310: 9D 80 04
	RTS                             ;C - - - - - 0x01F323 0F:F313: 60
; objFacing[X] = 1/2 depending on side of player
FaceToPlayer:
	LDA #$01                        ;C - - - - - 0x01F324 0F:F314: A9 01
	STA objFacing,X                 ;C - - - - - 0x01F326 0F:F316: 9D 60 04
	LDA objX,X                      ;C - - - - - 0x01F329 0F:F319: BD 60 03
	SEC                             ;C - - - - - 0x01F32C 0F:F31C: 38
	SBC objX                        ;C - - - - - 0x01F32D 0F:F31D: ED 60 03
	LDA objXPage,X                  ;C - - - - - 0x01F330 0F:F320: BD 80 03
	SBC objXPage                    ;C - - - - - 0x01F333 0F:F323: ED 80 03
	BCC loc_0F_F32D                 ;C - - - - - 0x01F336 0F:F326: 90 05
	LDA #$02                        ;C - - - - - 0x01F338 0F:F328: A9 02
	STA objFacing,X                 ;C - - - - - 0x01F33A 0F:F32A: 9D 60 04
loc_0F_F32D:
	RTS                             ;C - - - - - 0x01F33D 0F:F32D: 60
; objFlags bit 6 from objFacing
FacingToFlag:
	LDA objFacing,X                 ;C - - - - - 0x01F33E 0F:F32E: BD 60 04
	ROR A                           ;C - - - - - 0x01F341 0F:F331: 6A
	ROR A                           ;C - - - - - 0x01F342 0F:F332: 6A
	ROR A                           ;C - - - - - 0x01F343 0F:F333: 6A
	AND #$40                        ;C - - - - - 0x01F344 0F:F334: 29 40
	STA ptr_00                      ;C - - - - - 0x01F346 0F:F336: 85 00
	LDA objFlags,X                  ;C - - - - - 0x01F348 0F:F338: BD 60 05
	AND #$BF                        ;C - - - - - 0x01F34B 0F:F33B: 29 BF
	ORA ptr_00                      ;C - - - - - 0x01F34D 0F:F33D: 05 00
	STA objFlags,X                  ;C - - - - - 0x01F34F 0F:F33F: 9D 60 05
	RTS                             ;C - - - - - 0x01F352 0F:F342: 60
; FaceToPlayer + FacingToFlag
FaceToPlayerFlag:
	JSR FaceToPlayer                ;C - - - - - 0x01F353 0F:F343: 20 14 F3
	JSR FacingToFlag                ;C - - - - - 0x01F356 0F:F346: 20 2E F3
	RTS                             ;C - - - - - 0x01F359 0F:F349: 60
; ram_00D9 = A, then QueueSound
QueueSoundSaved:
	STA soundLast                   ;C - - - - - 0x01F35A 0F:F34A: 85 D9
; A = sound/music id -> 8-entry ring buffer soundQueue ($88 = empty slot)
QueueSound:
	STX ptr_00                      ;C - - - - - 0x01F35C 0F:F34C: 86 00
	LDX soundQueueWrite             ;C - - - - - 0x01F35E 0F:F34E: A6 DA
	STA ptr_00+1                    ;C - - - - - 0x01F360 0F:F350: 85 01
	LDA soundQueue,X                ;C - - - - - 0x01F362 0F:F352: B5 DC
	CMP #$88                        ;C - - - - - 0x01F364 0F:F354: C9 88
	BNE loc_0F_F362                 ;C - - - - - 0x01F366 0F:F356: D0 0A
	LDA ptr_00+1                    ;C - - - - - 0x01F368 0F:F358: A5 01
	STA soundQueue,X                ;C - - - - - 0x01F36A 0F:F35A: 95 DC
	INX                             ;C - - - - - 0x01F36C 0F:F35C: E8
	TXA                             ;C - - - - - 0x01F36D 0F:F35D: 8A
	AND #$07                        ;C - - - - - 0x01F36E 0F:F35E: 29 07
	STA soundQueueWrite             ;C - - - - - 0x01F370 0F:F360: 85 DA
loc_0F_F362:
	LDX ptr_00                      ;C - - - - - 0x01F372 0F:F362: A6 00
	RTS                             ;C - - - - - 0x01F374 0F:F364: 60
DistanceYToPlayer:
	LDA objY                        ;C - - - - - 0x01F375 0F:F365: AD C0 03
	SEC                             ;C - - - - - 0x01F378 0F:F368: 38
	SBC objY,X                      ;C - - - - - 0x01F379 0F:F369: FD C0 03
	BCS loc_0F_F373                 ;C - - - - - 0x01F37C 0F:F36C: B0 05
	EOR #$FF                        ;C - - - - - 0x01F37E 0F:F36E: 49 FF
	ADC #$01                        ;C - - - - - 0x01F380 0F:F370: 69 01
	CLC                             ;C - - - - - 0x01F382 0F:F372: 18
loc_0F_F373:
	RTS                             ;C - - - - - 0x01F383 0F:F373: 60
; A = |objX[0] - objX[X]|, carry = direction
DistanceXToPlayer:
	LDA objX                        ;C - - - - - 0x01F384 0F:F374: AD 60 03
	SEC                             ;C - - - - - 0x01F387 0F:F377: 38
	SBC objX,X                      ;C - - - - - 0x01F388 0F:F378: FD 60 03
	PHA                             ;C - - - - - 0x01F38B 0F:F37B: 48
	LDA objXPage                    ;C - - - - - 0x01F38C 0F:F37C: AD 80 03
	SBC objXPage,X                  ;C - - - - - 0x01F38F 0F:F37F: FD 80 03
	PLA                             ;C - - - - - 0x01F392 0F:F382: 68
	BCS loc_0F_F38A                 ;C - - - - - 0x01F393 0F:F383: B0 05
	EOR #$FF                        ;C - - - - - 0x01F395 0F:F385: 49 FF
	ADC #$01                        ;C - - - - - 0x01F397 0F:F387: 69 01
	CLC                             ;C - - - - - 0x01F399 0F:F389: 18
loc_0F_F38A:
	RTS                             ;C - - - - - 0x01F39A 0F:F38A: 60
CalcDirToPlayer:
	LDY #$00                        ;C - - - - - 0x01F39B 0F:F38B: A0 00
	LDA objY                        ;C - - - - - 0x01F39D 0F:F38D: AD C0 03
	SEC                             ;C - - - - - 0x01F3A0 0F:F390: 38
	SBC objY,X                      ;C - - - - - 0x01F3A1 0F:F391: FD C0 03
	LDY #$00                        ;C - - - - - 0x01F3A4 0F:F394: A0 00
	BCS loc_0F_F39E                 ;C - - - - - 0x01F3A6 0F:F396: B0 06
	EOR #$FF                        ;C - - - - - 0x01F3A8 0F:F398: 49 FF
	ADC #$01                        ;C - - - - - 0x01F3AA 0F:F39A: 69 01
	LDY #$04                        ;C - - - - - 0x01F3AC 0F:F39C: A0 04
loc_0F_F39E:
	STA ptr_00                      ;C - - - - - 0x01F3AE 0F:F39E: 85 00
	LDA objX                        ;C - - - - - 0x01F3B0 0F:F3A0: AD 60 03
	SEC                             ;C - - - - - 0x01F3B3 0F:F3A3: 38
	SBC objX,X                      ;C - - - - - 0x01F3B4 0F:F3A4: FD 60 03
	PHA                             ;C - - - - - 0x01F3B7 0F:F3A7: 48
	LDA objXPage                    ;C - - - - - 0x01F3B8 0F:F3A8: AD 80 03
	SBC objXPage,X                  ;C - - - - - 0x01F3BB 0F:F3AB: FD 80 03
	PLA                             ;C - - - - - 0x01F3BE 0F:F3AE: 68
	BCS loc_0F_F3B7                 ;C - - - - - 0x01F3BF 0F:F3AF: B0 06
	EOR #$FF                        ;C - - - - - 0x01F3C1 0F:F3B1: 49 FF
	ADC #$01                        ;C - - - - - 0x01F3C3 0F:F3B3: 69 01
	INY                             ;C - - - - - 0x01F3C5 0F:F3B5: C8
	INY                             ;C - - - - - 0x01F3C6 0F:F3B6: C8
loc_0F_F3B7:
	STA ptr_00+1                    ;C - - - - - 0x01F3C7 0F:F3B7: 85 01
	CMP ptr_00                      ;C - - - - - 0x01F3C9 0F:F3B9: C5 00
	BCS loc_0F_F3C6                 ;C - - - - - 0x01F3CB 0F:F3BB: B0 09
	PHA                             ;C - - - - - 0x01F3CD 0F:F3BD: 48
	LDA ptr_00                      ;C - - - - - 0x01F3CE 0F:F3BE: A5 00
	STA ptr_00+1                    ;C - - - - - 0x01F3D0 0F:F3C0: 85 01
	PLA                             ;C - - - - - 0x01F3D2 0F:F3C2: 68
	STA ptr_00                      ;C - - - - - 0x01F3D3 0F:F3C3: 85 00
	INY                             ;C - - - - - 0x01F3D5 0F:F3C5: C8
loc_0F_F3C6:
	LDA #$00                        ;C - - - - - 0x01F3D6 0F:F3C6: A9 00
	STA ptr_02                      ;C - - - - - 0x01F3D8 0F:F3C8: 85 02
	LDA ptr_00+1                    ;C - - - - - 0x01F3DA 0F:F3CA: A5 01
	LSR A                           ;C - - - - - 0x01F3DC 0F:F3CC: 4A
	LSR A                           ;C - - - - - 0x01F3DD 0F:F3CD: 4A
	CMP ptr_00                      ;C - - - - - 0x01F3DE 0F:F3CE: C5 00
	BCS loc_0F_F3DB                 ;C - - - - - 0x01F3E0 0F:F3D0: B0 09
	INC ptr_02                      ;C - - - - - 0x01F3E2 0F:F3D2: E6 02
	ASL A                           ;C - - - - - 0x01F3E4 0F:F3D4: 0A
	CMP ptr_00                      ;C - - - - - 0x01F3E5 0F:F3D5: C5 00
	BCS loc_0F_F3DB                 ;C - - - - - 0x01F3E7 0F:F3D7: B0 02
	INC ptr_02                      ;C - - - - - 0x01F3E9 0F:F3D9: E6 02
loc_0F_F3DB:
	TYA                             ;C - - - - - 0x01F3EB 0F:F3DB: 98
	ASL A                           ;C - - - - - 0x01F3EC 0F:F3DC: 0A
	ASL A                           ;C - - - - - 0x01F3ED 0F:F3DD: 0A
	CLC                             ;C - - - - - 0x01F3EE 0F:F3DE: 18
	ADC ptr_02                      ;C - - - - - 0x01F3EF 0F:F3DF: 65 02
	TAY                             ;C - - - - - 0x01F3F1 0F:F3E1: A8
	LDA tbl_0F_F3E6,Y               ;C - - - - - 0x01F3F2 0F:F3E2: B9 E6 F3
	RTS                             ;C - - - - - 0x01F3F5 0F:F3E5: 60
tbl_0F_F3E6:
	.byte $04,$05,$06               ;- D 3 - - - 0x01F3F6 0F:F3E6:
	.byte $04                       ;- - - - - - 0x01F3F9 0F:F3E9:
	.byte $08,$07,$06               ;- D 3 - - - 0x01F3FA 0F:F3EA:
	.byte $04                       ;- - - - - - 0x01F3FD 0F:F3ED:
	.byte $0C,$0B,$0A               ;- D 3 - - - 0x01F3FE 0F:F3EE:
	.byte $04                       ;- - - - - - 0x01F401 0F:F3F1:
	.byte $08,$09,$0A               ;- D 3 - - - 0x01F402 0F:F3F2:
	.byte $04                       ;- - - - - - 0x01F405 0F:F3F5:
	.byte $04,$03,$02               ;- D 3 - - - 0x01F406 0F:F3F6:
	.byte $04                       ;- - - - - - 0x01F409 0F:F3F9:
	.byte $00,$01,$02               ;- D 3 - - - 0x01F40A 0F:F3FA:
	.byte $04                       ;- - - - - - 0x01F40D 0F:F3FD:
	.byte $0C,$0D,$0E               ;- D 3 - - - 0x01F40E 0F:F3FE:
	.byte $04                       ;- - - - - - 0x01F411 0F:F401:
	.byte $00,$0F,$0E               ;- D 3 - - - 0x01F412 0F:F402:
	.byte $04                       ;- - - - - - 0x01F415 0F:F405:
RedrawAndWaitFrame:
	LDA prgR6Shadow                 ;C - - - - - 0x01F416 0F:F406: A5 F2
	PHA                             ;C - - - - - 0x01F418 0F:F408: 48
	LDA prgR7Shadow                 ;C - - - - - 0x01F419 0F:F409: A5 F3
	PHA                             ;C - - - - - 0x01F41B 0F:F40B: 48
	INC nmiSkipFlag                 ;C - - - - - 0x01F41C 0F:F40C: E6 9A
	LDA #$04                        ;C - - - - - 0x01F41E 0F:F40E: A9 04
	STA oamHideStart                ;C - - - - - 0x01F420 0F:F410: 85 97
	JSR HideSprites                 ;C - - - - - 0x01F422 0F:F412: 20 1D C3
	JSR DrawObjects                 ;C - - - - - 0x01F425 0F:F415: 20 BC E9
	LDA #$00                        ;C - - - - - 0x01F428 0F:F418: A9 00
	STA nmiSkipFlag                 ;C - - - - - 0x01F42A 0F:F41A: 85 9A
	JSR WaitFrame                   ;C - - - - - 0x01F42C 0F:F41C: 20 31 FF
	PLA                             ;C - - - - - 0x01F42F 0F:F41F: 68
	STA prgBankA000                 ;C - - - - - 0x01F430 0F:F420: 85 F5
	PLA                             ;C - - - - - 0x01F432 0F:F422: 68
	STA prgBank8000                 ;C - - - - - 0x01F433 0F:F423: 85 F4
	JMP SetPrgBanks                 ;C - - - - - 0x01F435 0F:F425: 4C 4D FF
StartHitTimer:
	LDA #$1E                        ;C - - - - - 0x01F438 0F:F428: A9 1E
	STA timerA4                     ;C - - - - - 0x01F43A 0F:F42A: 85 A4
	LDA #$00                        ;C - - - - - 0x01F43C 0F:F42C: A9 00
	STA ram_00A7                    ;C - - - - - 0x01F43E 0F:F42E: 85 A7
; QueueSound $17
PlayHitSound:
	LDA #$17                        ;C - - - - - 0x01F440 0F:F430: A9 17
	JSR QueueSound                  ;C - - - - - 0x01F442 0F:F432: 20 4C F3
	RTS                             ;C - - - - - 0x01F445 0F:F435: 60
ClearTimerA4:
	LDA #$00                        ;C - - - - - 0x01F446 0F:F436: A9 00
	STA timerA4                     ;C - - - - - 0x01F448 0F:F438: 85 A4
	RTS                             ;C - - - - - 0x01F44A 0F:F43A: 60
; timerA4 = $1E
ArmTimerA4:
	LDA #$1E                        ;C - - - - - 0x01F44B 0F:F43B: A9 1E
	STA timerA4                     ;C - - - - - 0x01F44D 0F:F43D: 85 A4
	RTS                             ;C - - - - - 0x01F44F 0F:F43F: 60
; chrBankShadow+2 = A
SetChrBank2:
	STA chrBankShadow+2             ;C - - - - - 0x01F450 0F:F440: 85 EA
	RTS                             ;C - - - - - 0x01F452 0F:F442: 60
; SetAnimX, chrBankShadow+3 = Y
SetAnimXChr3:
	JSR SetAnimX                    ;C - - - - - 0x01F453 0F:F443: 20 88 F2
	STY chrBankShadow+3             ;C - - - - - 0x01F456 0F:F446: 84 EB
	RTS                             ;C - - - - - 0x01F458 0F:F448: 60
; SetAnimX, chrBankShadow+4 = Y
SetAnimXChr4:
	JSR SetAnimX                    ;C - - - - - 0x01F459 0F:F449: 20 88 F2
	STY chrBankShadow+4             ;C - - - - - 0x01F45C 0F:F44C: 84 EC
	RTS                             ;C - - - - - 0x01F45E 0F:F44E: 60
SetAnimXChr5:
	JSR SetAnimX                    ;C - - - - - 0x01F45F 0F:F44F: 20 88 F2
	STY chrBankShadow+5             ;C - - - - - 0x01F462 0F:F452: 84 ED
loc_0F_F454:
	RTS                             ;C - - - - - 0x01F464 0F:F454: 60
SpawnEffect7E:
	LDA objAnim,X                   ;C - - - - - 0x01F465 0F:F455: BD 80 05
	CMP #$9D                        ;C - - - - - 0x01F468 0F:F458: C9 9D
	BEQ loc_0F_F454                 ;C - - - - - 0x01F46A 0F:F45A: F0 F8
	JSR FindFreeEffectSlot          ;C - - - - - 0x01F46C 0F:F45C: 20 2A F7
	BCS loc_0F_F454                 ;C - - - - - 0x01F46F 0F:F45F: B0 F3
	STY ptr_0E+1                    ;C - - - - - 0x01F471 0F:F461: 84 0F
	LDA #$7E                        ;C - - - - - 0x01F473 0F:F463: A9 7E
	JSR SetAnimY                    ;C - - - - - 0x01F475 0F:F465: 20 A0 F2
	LDA #$01                        ;C - - - - - 0x01F478 0F:F468: A9 01
	STA objKind,Y                   ;C - - - - - 0x01F47A 0F:F46A: 99 20 03
	STA objId,Y                     ;C - - - - - 0x01F47D 0F:F46D: 99 30 03
	LDA #$00                        ;C - - - - - 0x01F480 0F:F470: A9 00
	STA objStunTimer,Y              ;C - - - - - 0x01F482 0F:F472: 99 B0 04
	STA objAtkBox,Y                 ;C - - - - - 0x01F485 0F:F475: 99 40 04
	STA objAtkDamage,Y              ;C - - - - - 0x01F488 0F:F478: 99 50 04
	STA objLife,Y                   ;C - - - - - 0x01F48B 0F:F47B: 99 90 04
	STA objHudLife,Y                ;C - - - - - 0x01F48E 0F:F47E: 99 A0 04
	STA objDownState,Y              ;C - - - - - 0x01F491 0F:F481: 99 C0 04
	STA objAtkHeavy,Y               ;C - - - - - 0x01F494 0F:F484: 99 D0 04
	STA objHitTimer,Y               ;C - - - - - 0x01F497 0F:F487: 99 E0 04
	STA objGrabState,Y              ;C - - - - - 0x01F49A 0F:F48A: 99 F0 03
	STA objSpriteDown,Y             ;C - - - - - 0x01F49D 0F:F48D: 99 B0 05
	STA objVariant,Y                ;C - - - - - 0x01F4A0 0F:F490: 99 C0 05
	STA objTimer,Y                  ;C - - - - - 0x01F4A3 0F:F493: 99 D0 05
	STA objCounter,Y                ;C - - - - - 0x01F4A6 0F:F496: 99 E0 05
	STA objToggle,Y                 ;C - - - - - 0x01F4A9 0F:F499: 99 F0 05
	STA objSpriteAir,Y              ;C - - - - - 0x01F4AC 0F:F49C: 99 F0 04
	LDA objYPage                    ;C - - - - - 0x01F4AF 0F:F49F: AD E0 03
	STA objYPage,Y                  ;C - - - - - 0x01F4B2 0F:F4A2: 99 E0 03
	LDA playerId                    ;C - - - - - 0x01F4B5 0F:F4A5: A5 34
	CMP #$02                        ;C - - - - - 0x01F4B7 0F:F4A7: C9 02
	BNE loc_0F_F4D7                 ;C - - - - - 0x01F4B9 0F:F4A9: D0 2C
	LDA ram_00A7                    ;C - - - - - 0x01F4BB 0F:F4AB: A5 A7
	CMP #$0F                        ;C - - - - - 0x01F4BD 0F:F4AD: C9 0F
	BCC loc_0F_F4B8                 ;C - - - - - 0x01F4BF 0F:F4AF: 90 07
	CMP #$17                        ;C - - - - - 0x01F4C1 0F:F4B1: C9 17
	BCS loc_0F_F4B8                 ;C - - - - - 0x01F4C3 0F:F4B3: B0 03
	JMP loc_0F_F4E1                 ;C - - - - - 0x01F4C5 0F:F4B5: 4C E1 F4
loc_0F_F4B8:
	LDA playerFacing                ;C - - - - - 0x01F4C8 0F:F4B8: A5 31
	AND #$02                        ;C - - - - - 0x01F4CA 0F:F4BA: 29 02
	TAY                             ;C - - - - - 0x01F4CC 0F:F4BC: A8
	LDA objX                        ;C - - - - - 0x01F4CD 0F:F4BD: AD 60 03
	CLC                             ;C - - - - - 0x01F4D0 0F:F4C0: 18
	ADC tbl_0F_F550,Y               ;C - - - - - 0x01F4D1 0F:F4C1: 79 50 F5
	PHA                             ;C - - - - - 0x01F4D4 0F:F4C4: 48
	LDA objXPage                    ;C - - - - - 0x01F4D5 0F:F4C5: AD 80 03
	ADC tbl_0F_F551,Y               ;C - - - - - 0x01F4D8 0F:F4C8: 79 51 F5
	LDY ptr_0E+1                    ;C - - - - - 0x01F4DB 0F:F4CB: A4 0F
	STA objXPage,Y                  ;C - - - - - 0x01F4DD 0F:F4CD: 99 80 03
	PLA                             ;C - - - - - 0x01F4E0 0F:F4D0: 68
	STA objX,Y                      ;C - - - - - 0x01F4E1 0F:F4D1: 99 60 03
	JMP loc_0F_F522                 ;C - - - - - 0x01F4E4 0F:F4D4: 4C 22 F5
loc_0F_F4D7:
	LDA ram_00A7                    ;C - - - - - 0x01F4E7 0F:F4D7: A5 A7
	CMP #$0F                        ;C - - - - - 0x01F4E9 0F:F4D9: C9 0F
	BCC loc_0F_F506                 ;C - - - - - 0x01F4EB 0F:F4DB: 90 29
	CMP #$17                        ;C - - - - - 0x01F4ED 0F:F4DD: C9 17
	BCS loc_0F_F506                 ;C - - - - - 0x01F4EF 0F:F4DF: B0 25
loc_0F_F4E1:
	JSR DistanceXToPlayer           ;C - - - - - 0x01F4F1 0F:F4E1: 20 74 F3
	BCC loc_0F_F4EA                 ;C - - - - - 0x01F4F4 0F:F4E4: 90 04
	LDY #$02                        ;C - - - - - 0x01F4F6 0F:F4E6: A0 02
	BNE loc_0F_F4EC                 ;C - - - - - 0x01F4F8 0F:F4E8: D0 02
loc_0F_F4EA:
	LDY #$00                        ;C - - - - - 0x01F4FA 0F:F4EA: A0 00
loc_0F_F4EC:
	LDA objX                        ;C - - - - - 0x01F4FC 0F:F4EC: AD 60 03
	CLC                             ;C - - - - - 0x01F4FF 0F:F4EF: 18
	ADC tbl_0F_F554,Y               ;C - - - - - 0x01F500 0F:F4F0: 79 54 F5
	PHA                             ;C - - - - - 0x01F503 0F:F4F3: 48
	LDA objXPage                    ;C - - - - - 0x01F504 0F:F4F4: AD 80 03
	ADC tbl_0F_F555,Y               ;C - - - - - 0x01F507 0F:F4F7: 79 55 F5
	LDY ptr_0E+1                    ;C - - - - - 0x01F50A 0F:F4FA: A4 0F
	STA objXPage,Y                  ;C - - - - - 0x01F50C 0F:F4FC: 99 80 03
	PLA                             ;C - - - - - 0x01F50F 0F:F4FF: 68
	STA objX,Y                      ;C - - - - - 0x01F510 0F:F500: 99 60 03
	JMP loc_0F_F522                 ;C - - - - - 0x01F513 0F:F503: 4C 22 F5
loc_0F_F506:
	LDA playerFacing                ;C - - - - - 0x01F516 0F:F506: A5 31
	AND #$02                        ;C - - - - - 0x01F518 0F:F508: 29 02
	TAY                             ;C - - - - - 0x01F51A 0F:F50A: A8
	LDA objX                        ;C - - - - - 0x01F51B 0F:F50B: AD 60 03
	CLC                             ;C - - - - - 0x01F51E 0F:F50E: 18
	ADC tbl_0F_F54C,Y               ;C - - - - - 0x01F51F 0F:F50F: 79 4C F5
	PHA                             ;C - - - - - 0x01F522 0F:F512: 48
	LDA objXPage                    ;C - - - - - 0x01F523 0F:F513: AD 80 03
	ADC tbl_0F_F54D,Y               ;C - - - - - 0x01F526 0F:F516: 79 4D F5
	LDY ptr_0E+1                    ;C - - - - - 0x01F529 0F:F519: A4 0F
	STA objXPage,Y                  ;C - - - - - 0x01F52B 0F:F51B: 99 80 03
	PLA                             ;C - - - - - 0x01F52E 0F:F51E: 68
	STA objX,Y                      ;C - - - - - 0x01F52F 0F:F51F: 99 60 03
loc_0F_F522:
	LDA playerId                    ;C - - - - - 0x01F532 0F:F522: A5 34
	CMP #$02                        ;C - - - - - 0x01F534 0F:F524: C9 02
	BNE loc_0F_F542                 ;C - - - - - 0x01F536 0F:F526: D0 1A
	LDA ram_00A7                    ;C - - - - - 0x01F538 0F:F528: A5 A7
	CMP #$1B                        ;C - - - - - 0x01F53A 0F:F52A: C9 1B
	BEQ loc_0F_F538                 ;C - - - - - 0x01F53C 0F:F52C: F0 0A
	CMP #$1C                        ;C - - - - - 0x01F53E 0F:F52E: C9 1C
	BEQ loc_0F_F538                 ;C - - - - - 0x01F540 0F:F530: F0 06
	CMP #$1D                        ;C - - - - - 0x01F542 0F:F532: C9 1D
	BEQ loc_0F_F538                 ;C - - - - - 0x01F544 0F:F534: F0 02
	BNE loc_0F_F542                 ;C - - - - - 0x01F546 0F:F536: D0 0A
loc_0F_F538:
	LDA objY                        ;C - - - - - 0x01F548 0F:F538: AD C0 03
	SEC                             ;C - - - - - 0x01F54B 0F:F53B: 38
	SBC #$10                        ;C - - - - - 0x01F54C 0F:F53C: E9 10
	STA objY,Y                      ;C - - - - - 0x01F54E 0F:F53E: 99 C0 03
	RTS                             ;C - - - - - 0x01F551 0F:F541: 60
loc_0F_F542:
	LDA objY                        ;C - - - - - 0x01F552 0F:F542: AD C0 03
	CLC                             ;C - - - - - 0x01F555 0F:F545: 18
	ADC #$04                        ;C - - - - - 0x01F556 0F:F546: 69 04
	STA objY,Y                      ;C - - - - - 0x01F558 0F:F548: 99 C0 03
	RTS                             ;C - - - - - 0x01F55B 0F:F54B: 60
tbl_0F_F54C:
	.byte $12                       ;- D 3 - - - 0x01F55C 0F:F54C:
tbl_0F_F54D:
	.byte $00,$EE,$FF               ;- D 3 - - - 0x01F55D 0F:F54D:
tbl_0F_F550:
	.byte $13                       ;- D 3 - - - 0x01F560 0F:F550:
tbl_0F_F551:
	.byte $00,$ED,$FF               ;- D 3 - - - 0x01F561 0F:F551:
tbl_0F_F554:
	.byte $1C                       ;- D 3 - - - 0x01F564 0F:F554:
tbl_0F_F555:
	.byte $00,$E4,$FF               ;- D 3 - - - 0x01F565 0F:F555:
loc_0F_F558:
	SEC                             ;C - - - - - 0x01F568 0F:F558: 38
	RTS                             ;C - - - - - 0x01F569 0F:F559: 60
CheckHitEligible:
	SEC                             ;C - - - - - 0x01F56A 0F:F55A: 38
	LDA objFlags,X                  ;C - - - - - 0x01F56B 0F:F55B: BD 60 05
	BPL loc_0F_F558                 ;C - - - - - 0x01F56E 0F:F55E: 10 F8
	AND #$04                        ;C - - - - - 0x01F570 0F:F560: 29 04
	BNE loc_0F_F558                 ;C - - - - - 0x01F572 0F:F562: D0 F4
	LDA objActive,X                 ;C - - - - - 0x01F574 0F:F564: BD 00 03
	BPL loc_0F_F558                 ;C - - - - - 0x01F577 0F:F567: 10 EF
	LDA objKind,X                   ;C - - - - - 0x01F579 0F:F569: BD 20 03
	CMP #$06                        ;C - - - - - 0x01F57C 0F:F56C: C9 06
	BEQ loc_0F_F558                 ;C - - - - - 0x01F57E 0F:F56E: F0 E8
	CMP #$07                        ;C - - - - - 0x01F580 0F:F570: C9 07
	BEQ loc_0F_F558                 ;C - - - - - 0x01F582 0F:F572: F0 E4
	CMP #$69                        ;C - - - - - 0x01F584 0F:F574: C9 69
	BEQ loc_0F_F5B8                 ;C - - - - - 0x01F586 0F:F576: F0 40
	CMP #$6A                        ;C - - - - - 0x01F588 0F:F578: C9 6A
	BEQ loc_0F_F5B8                 ;C - - - - - 0x01F58A 0F:F57A: F0 3C
	CMP #$10                        ;C - - - - - 0x01F58C 0F:F57C: C9 10
	BEQ loc_0F_F5B8                 ;C - - - - - 0x01F58E 0F:F57E: F0 38
	CMP #$11                        ;C - - - - - 0x01F590 0F:F580: C9 11
	BEQ loc_0F_F5B8                 ;C - - - - - 0x01F592 0F:F582: F0 34
	CMP #$12                        ;C - - - - - 0x01F594 0F:F584: C9 12
	BEQ loc_0F_F5B8                 ;C - - - - - 0x01F596 0F:F586: F0 30
	CMP #$13                        ;C - - - - - 0x01F598 0F:F588: C9 13
	BEQ loc_0F_F5B8                 ;C - - - - - 0x01F59A 0F:F58A: F0 2C
	LDA ram_006A                    ;C - - - - - 0x01F59C 0F:F58C: A5 6A
	BNE loc_0F_F558                 ;C - - - - - 0x01F59E 0F:F58E: D0 C8
	LDA ram_0069                    ;C - - - - - 0x01F5A0 0F:F590: A5 69
	BNE loc_0F_F558                 ;C - - - - - 0x01F5A2 0F:F592: D0 C4
	LDA gameAction                  ;C - - - - - 0x01F5A4 0F:F594: A5 30
	CMP #$16                        ;C - - - - - 0x01F5A6 0F:F596: C9 16
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5A8 0F:F598: F0 BE
	CMP #$17                        ;C - - - - - 0x01F5AA 0F:F59A: C9 17
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5AC 0F:F59C: F0 BA
	CMP #$06                        ;C - - - - - 0x01F5AE 0F:F59E: C9 06
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5B0 0F:F5A0: F0 B6
	CMP #$1F                        ;C - - - - - 0x01F5B2 0F:F5A2: C9 1F
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5B4 0F:F5A4: F0 B2
	CMP #$0B                        ;C - - - - - 0x01F5B6 0F:F5A6: C9 0B
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5B8 0F:F5A8: F0 AE
	CMP #$25                        ;C - - - - - 0x01F5BA 0F:F5AA: C9 25
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5BC 0F:F5AC: F0 AA
	CMP #$0F                        ;C - - - - - 0x01F5BE 0F:F5AE: C9 0F
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5C0 0F:F5B0: F0 A6
	CMP #$24                        ;C - - - - - 0x01F5C2 0F:F5B2: C9 24
	BEQ loc_0F_F558                 ;C - - - - - 0x01F5C4 0F:F5B4: F0 A2
	BNE loc_0F_F5BF                 ;C - - - - - 0x01F5C6 0F:F5B6: D0 07
loc_0F_F5B8:
	LDA #$00                        ;C - - - - - 0x01F5C8 0F:F5B8: A9 00
	STA ptr_02+1                    ;C - - - - - 0x01F5CA 0F:F5BA: 85 03
	JMP loc_0F_F63F                 ;C - - - - - 0x01F5CC 0F:F5BC: 4C 3F F6
loc_0F_F5BF:
	LDA objY                        ;C - - - - - 0x01F5CF 0F:F5BF: AD C0 03
	CMP playerGroundY               ;C - - - - - 0x01F5D2 0F:F5C2: C5 36
	BEQ loc_0F_F5CC                 ;C - - - - - 0x01F5D4 0F:F5C4: F0 06
	LDA #$01                        ;C - - - - - 0x01F5D6 0F:F5C6: A9 01
	STA ptr_00+1                    ;C - - - - - 0x01F5D8 0F:F5C8: 85 01
ofs_0F_F5CA:
	BNE loc_0F_F5D0                 ;C - - - - - 0x01F5DA 0F:F5CA: D0 04
loc_0F_F5CC:
	LDA #$00                        ;C - - - - - 0x01F5DC 0F:F5CC: A9 00
	STA ptr_00+1                    ;C - - - - - 0x01F5DE 0F:F5CE: 85 01
loc_0F_F5D0:
	LDA objAnim,X                   ;C - - - - - 0x01F5E0 0F:F5D0: BD 80 05
	CMP #$84                        ;C - - - - - 0x01F5E3 0F:F5D3: C9 84
	BEQ loc_0F_F5E3                 ;C - - - - - 0x01F5E5 0F:F5D5: F0 0C
	CMP #$AC                        ;C - - - - - 0x01F5E7 0F:F5D7: C9 AC
	BEQ loc_0F_F5E3                 ;C - - - - - 0x01F5E9 0F:F5D9: F0 08
	CMP #$E7                        ;C - - - - - 0x01F5EB 0F:F5DB: C9 E7
	BEQ loc_0F_F5E3                 ;C - - - - - 0x01F5ED 0F:F5DD: F0 04
	CMP #$BE                        ;C - - - - - 0x01F5EF 0F:F5DF: C9 BE
	BNE loc_0F_F5E9                 ;C - - - - - 0x01F5F1 0F:F5E1: D0 06
loc_0F_F5E3:
	LDA ptr_00+1                    ;C - - - - - 0x01F5F3 0F:F5E3: A5 01
	ORA #$02                        ;C - - - - - 0x01F5F5 0F:F5E5: 09 02
	STA ptr_00+1                    ;C - - - - - 0x01F5F7 0F:F5E7: 85 01
loc_0F_F5E9:
	LDA ptr_00+1                    ;C - - - - - 0x01F5F9 0F:F5E9: A5 01
	CMP #$01                        ;C - - - - - 0x01F5FB 0F:F5EB: C9 01
	BEQ loc_0F_F615                 ;C - - - - - 0x01F5FD 0F:F5ED: F0 26
	CMP #$02                        ;C - - - - - 0x01F5FF 0F:F5EF: C9 02
	BEQ loc_0F_F601                 ;C - - - - - 0x01F601 0F:F5F1: F0 0E
	CMP #$03                        ;C - - - - - 0x01F603 0F:F5F3: C9 03
	BEQ loc_0F_F628                 ;C - - - - - 0x01F605 0F:F5F5: F0 31
	JSR DistanceYToPlayer           ;C - - - - - 0x01F607 0F:F5F7: 20 65 F3
	CMP #$0C                        ;C - - - - - 0x01F60A 0F:F5FA: C9 0C
	BCC loc_0F_F63B                 ;C - - - - - 0x01F60C 0F:F5FC: 90 3D
	JMP loc_0F_F679                 ;C - - - - - 0x01F60E 0F:F5FE: 4C 79 F6
loc_0F_F601:
	LDA objY                        ;C - - - - - 0x01F611 0F:F601: AD C0 03
	SEC                             ;C - - - - - 0x01F614 0F:F604: 38
	SBC objStartY,X                 ;C - - - - - 0x01F615 0F:F605: FD 20 05
	BCS loc_0F_F60E                 ;C - - - - - 0x01F618 0F:F608: B0 04
	EOR #$FF                        ;C - - - - - 0x01F61A 0F:F60A: 49 FF
	ADC #$01                        ;C - - - - - 0x01F61C 0F:F60C: 69 01
loc_0F_F60E:
	CMP #$08                        ;C - - - - - 0x01F61E 0F:F60E: C9 08
	BCC loc_0F_F63B                 ;C - - - - - 0x01F620 0F:F610: 90 29
	JMP loc_0F_F679                 ;C - - - - - 0x01F622 0F:F612: 4C 79 F6
loc_0F_F615:
	LDA playerGroundY               ;C - - - - - 0x01F625 0F:F615: A5 36
	SEC                             ;C - - - - - 0x01F627 0F:F617: 38
	SBC objY,X                      ;C - - - - - 0x01F628 0F:F618: FD C0 03
	BCS loc_0F_F621                 ;C - - - - - 0x01F62B 0F:F61B: B0 04
	EOR #$FF                        ;C - - - - - 0x01F62D 0F:F61D: 49 FF
	ADC #$01                        ;C - - - - - 0x01F62F 0F:F61F: 69 01
loc_0F_F621:
	CMP #$08                        ;C - - - - - 0x01F631 0F:F621: C9 08
	BCC loc_0F_F63B                 ;C - - - - - 0x01F633 0F:F623: 90 16
	JMP loc_0F_F679                 ;C - - - - - 0x01F635 0F:F625: 4C 79 F6
loc_0F_F628:
	LDA playerGroundY               ;C - - - - - 0x01F638 0F:F628: A5 36
	SEC                             ;C - - - - - 0x01F63A 0F:F62A: 38
	SBC objStartY,X                 ;C - - - - - 0x01F63B 0F:F62B: FD 20 05
	BCS loc_0F_F634                 ;C - - - - - 0x01F63E 0F:F62E: B0 04
	EOR #$FF                        ;C - - - - - 0x01F640 0F:F630: 49 FF
	ADC #$01                        ;C - - - - - 0x01F642 0F:F632: 69 01
loc_0F_F634:
	CMP #$08                        ;C - - - - - 0x01F644 0F:F634: C9 08
	BCC loc_0F_F63B                 ;C - - - - - 0x01F646 0F:F636: 90 03
	JMP loc_0F_F679                 ;C - - - - - 0x01F648 0F:F638: 4C 79 F6
loc_0F_F63B:
	LDA #$FF                        ;C - - - - - 0x01F64B 0F:F63B: A9 FF
	STA ptr_02+1                    ;C - - - - - 0x01F64D 0F:F63D: 85 03
loc_0F_F63F:
	LDA objAtkBox,X                 ;C - - - - - 0x01F64F 0F:F63F: BD 40 04
	AND #$1F                        ;C - - - - - 0x01F652 0F:F642: 29 1F
	TAY                             ;C - - - - - 0x01F654 0F:F644: A8
	LDA objX                        ;C - - - - - 0x01F655 0F:F645: AD 60 03
	SEC                             ;C - - - - - 0x01F658 0F:F648: 38
	SBC objX,X                      ;C - - - - - 0x01F659 0F:F649: FD 60 03
	PHA                             ;C - - - - - 0x01F65C 0F:F64C: 48
	LDA objXPage                    ;C - - - - - 0x01F65D 0F:F64D: AD 80 03
	SBC objXPage,X                  ;C - - - - - 0x01F660 0F:F650: FD 80 03
	PLA                             ;C - - - - - 0x01F663 0F:F653: 68
	BCS loc_0F_F65C                 ;C - - - - - 0x01F664 0F:F654: B0 06
	EOR #$FF                        ;C - - - - - 0x01F666 0F:F656: 49 FF
	ADC #$01                        ;C - - - - - 0x01F668 0F:F658: 69 01
	BCC loc_0F_F67C                 ;C - - - - - 0x01F66A 0F:F65A: 90 20
loc_0F_F65C:
	STA ptr_00                      ;C - - - - - 0x01F66C 0F:F65C: 85 00
	LDA ptr_02+1                    ;C - - - - - 0x01F66E 0F:F65E: A5 03
	BNE loc_0F_F66B                 ;C - - - - - 0x01F670 0F:F660: D0 09
	LDA objFacing                   ;C - - - - - 0x01F672 0F:F662: AD 60 04
	AND #$01                        ;C - - - - - 0x01F675 0F:F665: 29 01
	BEQ loc_0F_F672                 ;C - - - - - 0x01F677 0F:F667: F0 09
	BNE loc_0F_F692                 ;C - - - - - 0x01F679 0F:F669: D0 27
loc_0F_F66B:
	LDA objFlags,X                  ;C - - - - - 0x01F67B 0F:F66B: BD 60 05
	AND #$40                        ;C - - - - - 0x01F67E 0F:F66E: 29 40
	BEQ loc_0F_F692                 ;C - - - - - 0x01F680 0F:F670: F0 20
loc_0F_F672:
	LDA ptr_00                      ;C - - - - - 0x01F682 0F:F672: A5 00
	CMP tbl_0F_F6EA,Y               ;C - - - - - 0x01F684 0F:F674: D9 EA F6
	BCC loc_0F_F699                 ;C - - - - - 0x01F687 0F:F677: 90 20
loc_0F_F679:
	JMP loc_0F_F6A9                 ;C - - - - - 0x01F689 0F:F679: 4C A9 F6
loc_0F_F67C:
	STA ptr_00                      ;C - - - - - 0x01F68C 0F:F67C: 85 00
	LDA ptr_02+1                    ;C - - - - - 0x01F68E 0F:F67E: A5 03
	BNE loc_0F_F68B                 ;C - - - - - 0x01F690 0F:F680: D0 09
	LDA objFacing                   ;C - - - - - 0x01F692 0F:F682: AD 60 04
	AND #$01                        ;C - - - - - 0x01F695 0F:F685: 29 01
	BEQ loc_0F_F692                 ;C - - - - - 0x01F697 0F:F687: F0 09
	BNE loc_0F_F672                 ;C - - - - - 0x01F699 0F:F689: D0 E7
loc_0F_F68B:
	LDA objFlags,X                  ;C - - - - - 0x01F69B 0F:F68B: BD 60 05
	AND #$40                        ;C - - - - - 0x01F69E 0F:F68E: 29 40
	BEQ loc_0F_F672                 ;C - - - - - 0x01F6A0 0F:F690: F0 E0
loc_0F_F692:
	LDA ptr_00                      ;C - - - - - 0x01F6A2 0F:F692: A5 00
	CMP tbl_0F_F6CA,Y               ;C - - - - - 0x01F6A4 0F:F694: D9 CA F6
	BCS loc_0F_F6A9                 ;C - - - - - 0x01F6A7 0F:F697: B0 10
loc_0F_F699:
	LDA objY                        ;C - - - - - 0x01F6A9 0F:F699: AD C0 03
	SEC                             ;C - - - - - 0x01F6AC 0F:F69C: 38
	SBC objY,X                      ;C - - - - - 0x01F6AD 0F:F69D: FD C0 03
	BCS loc_0F_F6A6                 ;C - - - - - 0x01F6B0 0F:F6A0: B0 04
	EOR #$FF                        ;C - - - - - 0x01F6B2 0F:F6A2: 49 FF
	ADC #$01                        ;C - - - - - 0x01F6B4 0F:F6A4: 69 01
loc_0F_F6A6:
	CMP tbl_0F_F6AA,Y               ;C - - - - - 0x01F6B6 0F:F6A6: D9 AA F6
loc_0F_F6A9:
	RTS                             ;C - - - - - 0x01F6B9 0F:F6A9: 60
tbl_0F_F6AA:
	.byte $05,$05,$05,$05,$05,$05,$08,$08,$0C,$14,$20,$24,$18,$18;- D 3 - - - 0x01F6BA 0F:F6AA:
	.byte $0B                       ;- - - - - - 0x01F6C8 0F:F6B8:
	.byte $1C,$20,$23,$27           ;- D 3 - - - 0x01F6C9 0F:F6B9:
	.byte $20                       ;- - - - - - 0x01F6CD 0F:F6BD:
	.byte $14                       ;- D 3 - - - 0x01F6CE 0F:F6BE:
	.byte $14,$18                   ;- - - - - - 0x01F6CF 0F:F6BF:
	.byte $26,$10                   ;- D 3 - - - 0x01F6D1 0F:F6C1:
	.byte $00,$00,$00,$00,$00       ;- - - - - - 0x01F6D3 0F:F6C3:
	.byte $0C,$12                   ;- D 3 - - - 0x01F6D8 0F:F6C8:
tbl_0F_F6CA:
	.byte $00,$00,$00,$00,$00,$00   ;- - - - - - 0x01F6DA 0F:F6CA:
	.byte $00,$04,$08,$0B,$14,$00,$00;- D 3 - - - 0x01F6E0 0F:F6D0:
	.byte $00,$00                   ;- - - - - - 0x01F6E7 0F:F6D7:
	.byte $0C,$10                   ;- D 3 - - - 0x01F6E9 0F:F6D9:
	.byte $08,$08,$00               ;- - - - - - 0x01F6EB 0F:F6DB:
	.byte $08                       ;- D 3 - - - 0x01F6EE 0F:F6DE:
	.byte $10,$04,$08               ;- - - - - - 0x01F6EF 0F:F6DF:
tbl_0F_F6E2:
	.byte $00,$00,$00,$00,$00,$00   ;- - - - - - 0x01F6F2 0F:F6E2:
	.byte $0A,$0D                   ;- D 3 - - - 0x01F6F8 0F:F6E8:
tbl_0F_F6EA:
	.byte $1D,$17,$1A,$1D,$1D,$20,$20,$04,$12,$18,$14,$25,$23,$21,$25,$14;- D 3 - - - 0x01F6FA 0F:F6EA:
	.byte $20,$21,$23               ;- D 3 - - - 0x01F70A 0F:F6FA:
	.byte $23                       ;- - - - - - 0x01F70D 0F:F6FD:
	.byte $08                       ;- D 3 - - - 0x01F70E 0F:F6FE:
	.byte $10                       ;- - - - - - 0x01F70F 0F:F6FF:
	.byte $10,$24,$26               ;- D 3 - - - 0x01F710 0F:F700:
	.byte $00,$00,$00,$00,$00       ;- - - - - - 0x01F713 0F:F703:
	.byte $0A,$0D                   ;- D 3 - - - 0x01F718 0F:F708:
	LDX #$0D                        ;c - - - - - 0x01F71A 0F:F70A: A2 0D
loc_0F_F70C:
	LDA objActive,X                 ;c - - - - - 0x01F71C 0F:F70C: BD 00 03
	BPL loc_0F_F718                 ;c - - - - - 0x01F71F 0F:F70F: 10 07
	DEX                             ;c - - - - - 0x01F721 0F:F711: CA
	CPX #$02                        ;c - - - - - 0x01F722 0F:F712: E0 02
	BNE loc_0F_F70C                 ;c - - - - - 0x01F724 0F:F714: D0 F6
	SEC                             ;c - - - - - 0x01F726 0F:F716: 38
	RTS                             ;c - - - - - 0x01F727 0F:F717: 60
loc_0F_F718:
	CLC                             ;c - - - - - 0x01F728 0F:F718: 18
	RTS                             ;c - - - - - 0x01F729 0F:F719: 60
; carry set if none
FindFreeEnemySlot:
	LDY #$0D                        ;C - - - - - 0x01F72A 0F:F71A: A0 0D
loc_0F_F71C:
	LDA objActive,Y                 ;C - - - - - 0x01F72C 0F:F71C: B9 00 03
	BPL loc_0F_F728                 ;C - - - - - 0x01F72F 0F:F71F: 10 07
	DEY                             ;C - - - - - 0x01F731 0F:F721: 88
	CPY #$02                        ;C - - - - - 0x01F732 0F:F722: C0 02
	BNE loc_0F_F71C                 ;C - - - - - 0x01F734 0F:F724: D0 F6
	SEC                             ;c - - - - - 0x01F736 0F:F726: 38
	RTS                             ;c - - - - - 0x01F737 0F:F727: 60
loc_0F_F728:
	CLC                             ;C - - - - - 0x01F738 0F:F728: 18
	RTS                             ;C - - - - - 0x01F739 0F:F729: 60
; carry set if none
FindFreeEffectSlot:
	LDY #$0F                        ;C - - - - - 0x01F73A 0F:F72A: A0 0F
loc_0F_F72C:
	LDA objActive,Y                 ;C - - - - - 0x01F73C 0F:F72C: B9 00 03
	BPL loc_0F_F728                 ;C - - - - - 0x01F73F 0F:F72F: 10 F7
	DEY                             ;C - - - - - 0x01F741 0F:F731: 88
	CPY #$0D                        ;C - - - - - 0x01F742 0F:F732: C0 0D
	BNE loc_0F_F72C                 ;C - - - - - 0x01F744 0F:F734: D0 F6
	SEC                             ;C - - - - - 0x01F746 0F:F736: 38
	RTS                             ;C - - - - - 0x01F747 0F:F737: 60
CheckAttackEligible:
	LDA objFlags,X                  ;C - - - - - 0x01F748 0F:F738: BD 60 05
	BPL loc_0F_F745                 ;C - - - - - 0x01F74B 0F:F73B: 10 08
	AND #$04                        ;C - - - - - 0x01F74D 0F:F73D: 29 04
	BNE loc_0F_F745                 ;C - - - - - 0x01F74F 0F:F73F: D0 04
	LDA gameAction                  ;C - - - - - 0x01F751 0F:F741: A5 30
	BNE loc_0F_F747                 ;C - - - - - 0x01F753 0F:F743: D0 02
loc_0F_F745:
	SEC                             ;C - - - - - 0x01F755 0F:F745: 38
	RTS                             ;C - - - - - 0x01F756 0F:F746: 60
loc_0F_F747:
	LDA objDownState,X              ;C - - - - - 0x01F757 0F:F747: BD C0 04
	BNE loc_0F_F745                 ;C - - - - - 0x01F75A 0F:F74A: D0 F9
	LDA objKind,X                   ;C - - - - - 0x01F75C 0F:F74C: BD 20 03
	CMP #$1F                        ;C - - - - - 0x01F75F 0F:F74F: C9 1F
	BCC loc_0F_F745                 ;C - - - - - 0x01F761 0F:F751: 90 F2
	CMP #$69                        ;C - - - - - 0x01F763 0F:F753: C9 69
	BEQ loc_0F_F745                 ;C - - - - - 0x01F765 0F:F755: F0 EE
	CMP #$6A                        ;C - - - - - 0x01F767 0F:F757: C9 6A
	BEQ loc_0F_F745                 ;C - - - - - 0x01F769 0F:F759: F0 EA
	CMP #$6C                        ;C - - - - - 0x01F76B 0F:F75B: C9 6C
	BEQ loc_0F_F745                 ;C - - - - - 0x01F76D 0F:F75D: F0 E6
	CMP #$95                        ;C - - - - - 0x01F76F 0F:F75F: C9 95
	BEQ loc_0F_F745                 ;C - - - - - 0x01F771 0F:F761: F0 E2
	CMP #$63                        ;C - - - - - 0x01F773 0F:F763: C9 63
	BEQ loc_0F_F745                 ;C - - - - - 0x01F775 0F:F765: F0 DE
	CMP #$61                        ;C - - - - - 0x01F777 0F:F767: C9 61
	BEQ loc_0F_F745                 ;C - - - - - 0x01F779 0F:F769: F0 DA
	LDA timerA4                     ;C - - - - - 0x01F77B 0F:F76B: A5 A4
	BEQ loc_0F_F745                 ;C - - - - - 0x01F77D 0F:F76D: F0 D6
	LDA objKind,X                   ;C - - - - - 0x01F77F 0F:F76F: BD 20 03
	CMP #$5F                        ;C - - - - - 0x01F782 0F:F772: C9 5F
	BEQ loc_0F_F745                 ;C - - - - - 0x01F784 0F:F774: F0 CF
	LDA objY,X                      ;C - - - - - 0x01F786 0F:F776: BD C0 03
	STA ptr_04                      ;C - - - - - 0x01F789 0F:F779: 85 04
	LDA objAnim,X                   ;C - - - - - 0x01F78B 0F:F77B: BD 80 05
	CMP #$84                        ;C - - - - - 0x01F78E 0F:F77E: C9 84
	BEQ loc_0F_F78E                 ;C - - - - - 0x01F790 0F:F780: F0 0C
	CMP #$AC                        ;C - - - - - 0x01F792 0F:F782: C9 AC
	BEQ loc_0F_F78E                 ;C - - - - - 0x01F794 0F:F784: F0 08
	CMP #$E7                        ;C - - - - - 0x01F796 0F:F786: C9 E7
	BEQ loc_0F_F78E                 ;C - - - - - 0x01F798 0F:F788: F0 04
	CMP #$BE                        ;C - - - - - 0x01F79A 0F:F78A: C9 BE
	BNE loc_0F_F794                 ;C - - - - - 0x01F79C 0F:F78C: D0 06
loc_0F_F78E:
	LDA objStartY,X                 ;C - - - - - 0x01F79E 0F:F78E: BD 20 05
	STA objY,X                      ;C - - - - - 0x01F7A1 0F:F791: 9D C0 03
loc_0F_F794:
	LDA ram_00A7                    ;C - - - - - 0x01F7A4 0F:F794: A5 A7
	CMP #$0F                        ;C - - - - - 0x01F7A6 0F:F796: C9 0F
	BEQ loc_0F_F7CA                 ;C - - - - - 0x01F7A8 0F:F798: F0 30
	CMP #$10                        ;C - - - - - 0x01F7AA 0F:F79A: C9 10
	BEQ loc_0F_F7CA                 ;C - - - - - 0x01F7AC 0F:F79C: F0 2C
	CMP #$11                        ;C - - - - - 0x01F7AE 0F:F79E: C9 11
	BEQ loc_0F_F7EA                 ;C - - - - - 0x01F7B0 0F:F7A0: F0 48
	CMP #$12                        ;C - - - - - 0x01F7B2 0F:F7A2: C9 12
	BEQ loc_0F_F7EA                 ;C - - - - - 0x01F7B4 0F:F7A4: F0 44
	CMP #$14                        ;C - - - - - 0x01F7B6 0F:F7A6: C9 14
	BEQ loc_0F_F7D0                 ;C - - - - - 0x01F7B8 0F:F7A8: F0 26
	CMP #$15                        ;C - - - - - 0x01F7BA 0F:F7AA: C9 15
	BEQ loc_0F_F7D0                 ;C - - - - - 0x01F7BC 0F:F7AC: F0 22
	CMP #$16                        ;C - - - - - 0x01F7BE 0F:F7AE: C9 16
	BEQ loc_0F_F7D0                 ;C - - - - - 0x01F7C0 0F:F7B0: F0 1E
	CMP #$17                        ;C - - - - - 0x01F7C2 0F:F7B2: C9 17
	BEQ loc_0F_F7D0                 ;C - - - - - 0x01F7C4 0F:F7B4: F0 1A
	CMP #$07                        ;C - - - - - 0x01F7C6 0F:F7B6: C9 07
	BEQ loc_0F_F7CD                 ;C - - - - - 0x01F7C8 0F:F7B8: F0 13
	CMP #$03                        ;C - - - - - 0x01F7CA 0F:F7BA: C9 03
	BEQ loc_0F_F7CD                 ;C - - - - - 0x01F7CC 0F:F7BC: F0 0F
	CMP #$04                        ;C - - - - - 0x01F7CE 0F:F7BE: C9 04
	BEQ loc_0F_F7CD                 ;C - - - - - 0x01F7D0 0F:F7C0: F0 0B
	CMP #$0D                        ;C - - - - - 0x01F7D2 0F:F7C2: C9 0D
	BEQ loc_0F_F7EF                 ;C - - - - - 0x01F7D4 0F:F7C4: F0 29
	CMP #$18                        ;C - - - - - 0x01F7D6 0F:F7C6: C9 18
	BEQ loc_0F_F7EF                 ;C - - - - - 0x01F7D8 0F:F7C8: F0 25
loc_0F_F7CA:
	JMP loc_0F_F7EA                 ;C - - - - - 0x01F7DA 0F:F7CA: 4C EA F7
loc_0F_F7CD:
	JMP loc_0F_F7EF                 ;C - - - - - 0x01F7DD 0F:F7CD: 4C EF F7
loc_0F_F7D0:
	LDA ram_00A6                    ;C - - - - - 0x01F7E0 0F:F7D0: A5 A6
	SEC                             ;C - - - - - 0x01F7E2 0F:F7D2: 38
	SBC objY,X                      ;C - - - - - 0x01F7E3 0F:F7D3: FD C0 03
	BCS loc_0F_F7DC                 ;C - - - - - 0x01F7E6 0F:F7D6: B0 04
	EOR #$FF                        ;C - - - - - 0x01F7E8 0F:F7D8: 49 FF
	ADC #$01                        ;C - - - - - 0x01F7EA 0F:F7DA: 69 01
loc_0F_F7DC:
	CMP #$14                        ;C - - - - - 0x01F7EC 0F:F7DC: C9 14
	BCS loc_0F_F7E3                 ;C - - - - - 0x01F7EE 0F:F7DE: B0 03
	JMP loc_0F_F7FF                 ;C - - - - - 0x01F7F0 0F:F7E0: 4C FF F7
loc_0F_F7E3:
	LDA ptr_04                      ;C - - - - - 0x01F7F3 0F:F7E3: A5 04
	STA objY,X                      ;C - - - - - 0x01F7F5 0F:F7E5: 9D C0 03
	SEC                             ;C - - - - - 0x01F7F8 0F:F7E8: 38
	RTS                             ;C - - - - - 0x01F7F9 0F:F7E9: 60
loc_0F_F7EA:
	LDA objY                        ;C - - - - - 0x01F7FA 0F:F7EA: AD C0 03
	BNE loc_0F_F7F1                 ;C - - - - - 0x01F7FD 0F:F7ED: D0 02
loc_0F_F7EF:
	LDA ram_00A6                    ;C - - - - - 0x01F7FF 0F:F7EF: A5 A6
loc_0F_F7F1:
	SEC                             ;C - - - - - 0x01F801 0F:F7F1: 38
	SBC objY,X                      ;C - - - - - 0x01F802 0F:F7F2: FD C0 03
	BCS loc_0F_F7FB                 ;C - - - - - 0x01F805 0F:F7F5: B0 04
	EOR #$FF                        ;C - - - - - 0x01F807 0F:F7F7: 49 FF
	ADC #$01                        ;C - - - - - 0x01F809 0F:F7F9: 69 01
loc_0F_F7FB:
	CMP #$0C                        ;C - - - - - 0x01F80B 0F:F7FB: C9 0C
	BCS loc_0F_F862                 ;C - - - - - 0x01F80D 0F:F7FD: B0 63
loc_0F_F7FF:
	LDA ram_00A7                    ;C - - - - - 0x01F80F 0F:F7FF: A5 A7
	CMP #$1B                        ;C - - - - - 0x01F811 0F:F801: C9 1B
	BEQ loc_0F_F80D                 ;C - - - - - 0x01F813 0F:F803: F0 08
	CMP #$1C                        ;C - - - - - 0x01F815 0F:F805: C9 1C
	BEQ loc_0F_F80D                 ;C - - - - - 0x01F817 0F:F807: F0 04
	CMP #$1D                        ;C - - - - - 0x01F819 0F:F809: C9 1D
	BNE loc_0F_F811                 ;C - - - - - 0x01F81B 0F:F80B: D0 04
loc_0F_F80D:
	CPX ram_0039                    ;C - - - - - 0x01F81D 0F:F80D: E4 39
	BNE loc_0F_F862                 ;C - - - - - 0x01F81F 0F:F80F: D0 51
loc_0F_F811:
	LDY ram_00A7                    ;C - - - - - 0x01F821 0F:F811: A4 A7
	LDA objX                        ;C - - - - - 0x01F823 0F:F813: AD 60 03
	SEC                             ;C - - - - - 0x01F826 0F:F816: 38
	SBC objX,X                      ;C - - - - - 0x01F827 0F:F817: FD 60 03
	PHA                             ;C - - - - - 0x01F82A 0F:F81A: 48
	LDA objXPage                    ;C - - - - - 0x01F82B 0F:F81B: AD 80 03
	SBC objXPage,X                  ;C - - - - - 0x01F82E 0F:F81E: FD 80 03
	PLA                             ;C - - - - - 0x01F831 0F:F821: 68
	BCS loc_0F_F82B                 ;C - - - - - 0x01F832 0F:F822: B0 07
	EOR #$FF                        ;C - - - - - 0x01F834 0F:F824: 49 FF
	ADC #$01                        ;C - - - - - 0x01F836 0F:F826: 69 01
	JMP loc_0F_F83D                 ;C - - - - - 0x01F838 0F:F828: 4C 3D F8
loc_0F_F82B:
	STA ptr_00                      ;C - - - - - 0x01F83B 0F:F82B: 85 00
	LDA playerFacing                ;C - - - - - 0x01F83D 0F:F82D: A5 31
	AND #$01                        ;C - - - - - 0x01F83F 0F:F82F: 29 01
	BEQ loc_0F_F845                 ;C - - - - - 0x01F841 0F:F831: F0 12
loc_0F_F833:
	LDA ptr_00                      ;C - - - - - 0x01F843 0F:F833: A5 00
	CMP tbl_0F_F8B1,Y               ;C - - - - - 0x01F845 0F:F835: D9 B1 F8
	BCS loc_0F_F862                 ;C - - - - - 0x01F848 0F:F838: B0 28
	JMP loc_0F_F84C                 ;C - - - - - 0x01F84A 0F:F83A: 4C 4C F8
loc_0F_F83D:
	STA ptr_00                      ;C - - - - - 0x01F84D 0F:F83D: 85 00
	LDA playerFacing                ;C - - - - - 0x01F84F 0F:F83F: A5 31
	AND #$01                        ;C - - - - - 0x01F851 0F:F841: 29 01
	BEQ loc_0F_F833                 ;C - - - - - 0x01F853 0F:F843: F0 EE
loc_0F_F845:
	LDA ptr_00                      ;C - - - - - 0x01F855 0F:F845: A5 00
	CMP tbl_0F_F88D,Y               ;C - - - - - 0x01F857 0F:F847: D9 8D F8
	BCS loc_0F_F862                 ;C - - - - - 0x01F85A 0F:F84A: B0 16
loc_0F_F84C:
	LDA ptr_04                      ;C - - - - - 0x01F85C 0F:F84C: A5 04
	STA objY,X                      ;C - - - - - 0x01F85E 0F:F84E: 9D C0 03
	LDA objY                        ;C - - - - - 0x01F861 0F:F851: AD C0 03
	SEC                             ;C - - - - - 0x01F864 0F:F854: 38
	SBC objY,X                      ;C - - - - - 0x01F865 0F:F855: FD C0 03
	BCS loc_0F_F85E                 ;C - - - - - 0x01F868 0F:F858: B0 04
	EOR #$FF                        ;C - - - - - 0x01F86A 0F:F85A: 49 FF
	ADC #$01                        ;C - - - - - 0x01F86C 0F:F85C: 69 01
loc_0F_F85E:
	CMP tbl_0F_F869,Y               ;C - - - - - 0x01F86E 0F:F85E: D9 69 F8
	RTS                             ;C - - - - - 0x01F871 0F:F861: 60
loc_0F_F862:
	LDA ptr_04                      ;C - - - - - 0x01F872 0F:F862: A5 04
	STA objY,X                      ;C - - - - - 0x01F874 0F:F864: 9D C0 03
; GG APVYNEAU hit anywhere: SEC / RTS at the end of the hit test
	SEC                             ;C - - - - - 0x01F877 0F:F867: 38
	RTS                             ;C - - - - - 0x01F878 0F:F868: 60
tbl_0F_F869:
	.byte $14,$20                   ;- D 3 - - - 0x01F879 0F:F869:
	.byte $2E                       ;- - - - - - 0x01F87B 0F:F86B:
	.byte $28,$1C                   ;- D 3 - - - 0x01F87C 0F:F86C:
	.byte $0C                       ;- - - - - - 0x01F87E 0F:F86E:
	.byte $14,$14,$14               ;- D 3 - - - 0x01F87F 0F:F86F:
	.byte $14,$14                   ;- - - - - - 0x01F882 0F:F872:
	.byte $14,$14,$1E,$14,$28,$28,$28,$28;- D 3 - - - 0x01F884 0F:F874:
	.byte $14                       ;- - - - - - 0x01F88C 0F:F87C:
	.byte $28,$28,$28,$28,$1C       ;- D 3 - - - 0x01F88D 0F:F87D:
	.byte $14                       ;- - - - - - 0x01F892 0F:F882:
	.byte $14,$0C,$0C,$0C           ;- D 3 - - - 0x01F893 0F:F883:
	.byte $14,$14,$14,$14,$14,$14   ;- - - - - - 0x01F897 0F:F887:
tbl_0F_F88D:
	.byte $1D,$1F                   ;- D 3 - - - 0x01F89D 0F:F88D:
	.byte $2C                       ;- - - - - - 0x01F89F 0F:F88F:
	.byte $1E,$18                   ;- D 3 - - - 0x01F8A0 0F:F890:
	.byte $0C                       ;- - - - - - 0x01F8A2 0F:F892:
	.byte $1E,$18,$24               ;- D 3 - - - 0x01F8A3 0F:F893:
	.byte $1C,$0C                   ;- - - - - - 0x01F8A6 0F:F896:
	.byte $20,$22,$24,$28,$20,$22,$24,$28;- D 3 - - - 0x01F8A8 0F:F898:
	.byte $0C                       ;- - - - - - 0x01F8B0 0F:F8A0:
	.byte $20,$22,$24,$28,$18       ;- D 3 - - - 0x01F8B1 0F:F8A1:
	.byte $24                       ;- - - - - - 0x01F8B6 0F:F8A6:
	.byte $14,$14,$16,$14           ;- D 3 - - - 0x01F8B7 0F:F8A7:
	.byte $0C,$0C,$1E,$1E,$0C,$0C   ;- - - - - - 0x01F8BB 0F:F8AB:
tbl_0F_F8B1:
	.byte $08,$08                   ;- D 3 - - - 0x01F8C1 0F:F8B1:
	.byte $28                       ;- - - - - - 0x01F8C3 0F:F8B3:
	.byte $08,$08,$08,$08,$0E       ;- D 3 - - - 0x01F8C4 0F:F8B4:
	.byte $08,$08,$08               ;- - - - - - 0x01F8C9 0F:F8B9:
	.byte $08,$08,$08,$08,$1C,$1E,$20,$24;- D 3 - - - 0x01F8CC 0F:F8BC:
	.byte $08                       ;- - - - - - 0x01F8D4 0F:F8C4:
	.byte $1C,$1E,$20,$24,$08       ;- D 3 - - - 0x01F8D5 0F:F8C5:
	.byte $08                       ;- - - - - - 0x01F8DA 0F:F8CA:
	.byte $08                       ;- D 3 - - - 0x01F8DB 0F:F8CB:
	.byte $00,$08,$00,$08,$08,$08,$08,$08,$08;- - - - - - 0x01F8DC 0F:F8CC:
UpdatePlayerInvincible:
	LDA ram_006E                    ;C - - - - - 0x01F8E5 0F:F8D5: A5 6E
	BPL loc_0F_F8DA                 ;C - - - - - 0x01F8E7 0F:F8D7: 10 01
loc_0F_F8D9:
	RTS                             ;c - - - - - 0x01F8E9 0F:F8D9: 60
loc_0F_F8DA:
	LDA objActive+1                 ;C - - - - - 0x01F8EA 0F:F8DA: AD 01 03
	BPL loc_0F_F8ED                 ;C - - - - - 0x01F8ED 0F:F8DD: 10 0E
	LDA objAnim+1                   ;c - - - - - 0x01F8EF 0F:F8DF: AD 81 05
	CMP #$74                        ;c - - - - - 0x01F8F2 0F:F8E2: C9 74
	BNE loc_0F_F8ED                 ;c - - - - - 0x01F8F4 0F:F8E4: D0 07
	LDA #$00                        ;c - - - - - 0x01F8F6 0F:F8E6: A9 00
	STA objActive+1                 ;c - - - - - 0x01F8F8 0F:F8E8: 8D 01 03
	BEQ loc_0F_F8FE                 ;c - - - - - 0x01F8FB 0F:F8EB: F0 11
loc_0F_F8ED:
	LDA objActive+2                 ;C - - - - - 0x01F8FD 0F:F8ED: AD 02 03
	BPL loc_0F_F8FE                 ;C - - - - - 0x01F900 0F:F8F0: 10 0C
	LDA objAnim+2                   ;C - - - - - 0x01F902 0F:F8F2: AD 82 05
	CMP #$74                        ;C - - - - - 0x01F905 0F:F8F5: C9 74
	BNE loc_0F_F8FE                 ;C - - - - - 0x01F907 0F:F8F7: D0 05
	LDA #$00                        ;C - - - - - 0x01F909 0F:F8F9: A9 00
	STA objActive+2                 ;C - - - - - 0x01F90B 0F:F8FB: 8D 02 03
loc_0F_F8FE:
	LDA playerInvincible            ;C - - - - - 0x01F90E 0F:F8FE: A5 3B
	BEQ loc_0F_F8D9                 ;C - - - - - 0x01F910 0F:F900: F0 D7
	CMP #$3C                        ;C - - - - - 0x01F912 0F:F902: C9 3C
	BNE loc_0F_F8D9                 ;C - - - - - 0x01F914 0F:F904: D0 D3
	LDA gameAction                  ;C - - - - - 0x01F916 0F:F906: A5 30
	CMP #$04                        ;C - - - - - 0x01F918 0F:F908: C9 04
	BEQ loc_0F_F90E                 ;C - - - - - 0x01F91A 0F:F90A: F0 02
	BNE loc_0F_F915                 ;C - - - - - 0x01F91C 0F:F90C: D0 07
loc_0F_F90E:
	LDA #$FF                        ;C - - - - - 0x01F91E 0F:F90E: A9 FF
	LDY ram_0039                    ;C - - - - - 0x01F920 0F:F910: A4 39
	STA objGrabState,Y              ;C - - - - - 0x01F922 0F:F912: 99 F0 03
loc_0F_F915:
	LDA weaponHeld                  ;C - - - - - 0x01F925 0F:F915: A5 A9
	BEQ loc_0F_F922                 ;C - - - - - 0x01F927 0F:F917: F0 09
	LDA playerId                    ;C - - - - - 0x01F929 0F:F919: A5 34
	CMP #$01                        ;C - - - - - 0x01F92B 0F:F91B: C9 01
	BEQ loc_0F_F922                 ;C - - - - - 0x01F92D 0F:F91D: F0 03
	JSR InitSlot1Follower           ;C - - - - - 0x01F92F 0F:F91F: 20 C4 FA
loc_0F_F922:
	LDY objAtkDamage,X              ;C - - - - - 0x01F932 0F:F922: BC 50 04
	LDA playerHealth                ;C - - - - - 0x01F935 0F:F925: A5 3A
	SEC                             ;C - - - - - 0x01F937 0F:F927: 38
	SBC tbl_0F_FD16,Y               ;C - - - - - 0x01F938 0F:F928: F9 16 FD
; GG SZXNUPSA infinite health: STA playerHealth
	STA playerHealth                ;C - - - - - 0x01F93B 0F:F92B: 85 3A
	BMI loc_0F_F999                 ;C - - - - - 0x01F93D 0F:F92D: 30 6A
	LDA tbl_0F_FD56,Y               ;C - - - - - 0x01F93F 0F:F92F: B9 56 FD
	BNE loc_0F_F999                 ;C - - - - - 0x01F942 0F:F932: D0 65
	LDY playerId                    ;C - - - - - 0x01F944 0F:F934: A4 34
	LDA tbl_0F_E207,Y               ;C - - - - - 0x01F946 0F:F936: B9 07 E2
	JSR SetPlayerAnim               ;C - - - - - 0x01F949 0F:F939: 20 94 F2
	LDA tbl_0F_E24F,Y               ;C - - - - - 0x01F94C 0F:F93C: B9 4F E2
	JSR SetChrBank2                 ;C - - - - - 0x01F94F 0F:F93F: 20 40 F4
	LDA objFacing,X                 ;C - - - - - 0x01F952 0F:F942: BD 60 04
	EOR #$03                        ;C - - - - - 0x01F955 0F:F945: 49 03
	ROR A                           ;C - - - - - 0x01F957 0F:F947: 6A
	ROR A                           ;C - - - - - 0x01F958 0F:F948: 6A
	ROR A                           ;C - - - - - 0x01F959 0F:F949: 6A
	AND #$40                        ;C - - - - - 0x01F95A 0F:F94A: 29 40
	STA ptr_00                      ;C - - - - - 0x01F95C 0F:F94C: 85 00
	LDA objFlags                    ;C - - - - - 0x01F95E 0F:F94E: AD 60 05
	AND #$BF                        ;C - - - - - 0x01F961 0F:F951: 29 BF
	ORA ptr_00                      ;C - - - - - 0x01F963 0F:F953: 05 00
	STA objFlags                    ;C - - - - - 0x01F965 0F:F955: 8D 60 05
	CMP #$90                        ;C - - - - - 0x01F968 0F:F958: C9 90
	BEQ loc_0F_F960                 ;C - - - - - 0x01F96A 0F:F95A: F0 04
	LDA #$01                        ;C - - - - - 0x01F96C 0F:F95C: A9 01
	BNE loc_0F_F962                 ;C - - - - - 0x01F96E 0F:F95E: D0 02
loc_0F_F960:
	LDA #$02                        ;C - - - - - 0x01F970 0F:F960: A9 02
loc_0F_F962:
	STA playerFacing                ;C - - - - - 0x01F972 0F:F962: 85 31
	LDA gameAction                  ;C - - - - - 0x01F974 0F:F964: A5 30
	CMP #$01                        ;C - - - - - 0x01F976 0F:F966: C9 01
	BEQ loc_0F_F9B7                 ;C - - - - - 0x01F978 0F:F968: F0 4D
	CMP #$14                        ;C - - - - - 0x01F97A 0F:F96A: C9 14
	BEQ loc_0F_F9B7                 ;C - - - - - 0x01F97C 0F:F96C: F0 49
	LDA #$05                        ;C - - - - - 0x01F97E 0F:F96E: A9 05
	STA gameAction                  ;C - - - - - 0x01F980 0F:F970: 85 30
	LDA playerId                    ;C - - - - - 0x01F982 0F:F972: A5 34
	CMP #$01                        ;C - - - - - 0x01F984 0F:F974: C9 01
	BEQ loc_0F_F981                 ;C - - - - - 0x01F986 0F:F976: F0 09
	LDA #$00                        ;C - - - - - 0x01F988 0F:F978: A9 00
	STA timerA4                     ;C - - - - - 0x01F98A 0F:F97A: 85 A4
	STA weaponHeld                  ;C - - - - - 0x01F98C 0F:F97C: 85 A9
	STA timerA3                     ;C - - - - - 0x01F98E 0F:F97E: 85 A3
	RTS                             ;C - - - - - 0x01F990 0F:F980: 60
loc_0F_F981:
	LDA weaponHeld                  ;C - - - - - 0x01F991 0F:F981: A5 A9
	BEQ loc_0F_F991                 ;C - - - - - 0x01F993 0F:F983: F0 0C
	JSR ClearTimerA4                ;c - - - - - 0x01F995 0F:F985: 20 36 F4
	LDA #$00                        ;c - - - - - 0x01F998 0F:F988: A9 00
	STA timerA3                     ;c - - - - - 0x01F99A 0F:F98A: 85 A3
	LDA #$FF                        ;c - - - - - 0x01F99C 0F:F98C: A9 FF
	STA weaponHeld                  ;c - - - - - 0x01F99E 0F:F98E: 85 A9
	RTS                             ;c - - - - - 0x01F9A0 0F:F990: 60
loc_0F_F991:
	JSR ClearTimerA4                ;C - - - - - 0x01F9A1 0F:F991: 20 36 F4
	LDA #$00                        ;C - - - - - 0x01F9A4 0F:F994: A9 00
	STA timerA3                     ;C - - - - - 0x01F9A6 0F:F996: 85 A3
	RTS                             ;C - - - - - 0x01F9A8 0F:F998: 60
loc_0F_F999:
	LDA objFacing,X                 ;C - - - - - 0x01F9A9 0F:F999: BD 60 04
	EOR #$03                        ;C - - - - - 0x01F9AC 0F:F99C: 49 03
	ROR A                           ;C - - - - - 0x01F9AE 0F:F99E: 6A
	ROR A                           ;C - - - - - 0x01F9AF 0F:F99F: 6A
	ROR A                           ;C - - - - - 0x01F9B0 0F:F9A0: 6A
	AND #$40                        ;C - - - - - 0x01F9B1 0F:F9A1: 29 40
ofs_0F_F9A3:
	STA ptr_00                      ;C - - - - - 0x01F9B3 0F:F9A3: 85 00
	LDA objFlags                    ;C - - - - - 0x01F9B5 0F:F9A5: AD 60 05
	AND #$BF                        ;C - - - - - 0x01F9B8 0F:F9A8: 29 BF
	ORA ptr_00                      ;C - - - - - 0x01F9BA 0F:F9AA: 05 00
	STA objFlags                    ;C - - - - - 0x01F9BC 0F:F9AC: 8D 60 05
	CMP #$90                        ;C - - - - - 0x01F9BF 0F:F9AF: C9 90
	BEQ loc_0F_F9B7                 ;C - - - - - 0x01F9C1 0F:F9B1: F0 04
	LDA #$01                        ;C - - - - - 0x01F9C3 0F:F9B3: A9 01
	BNE loc_0F_F9B9                 ;C - - - - - 0x01F9C5 0F:F9B5: D0 02
loc_0F_F9B7:
	LDA #$02                        ;C - - - - - 0x01F9C7 0F:F9B7: A9 02
loc_0F_F9B9:
	STA playerFacing                ;C - - - - - 0x01F9C9 0F:F9B9: 85 31
	LDY playerId                    ;C - - - - - 0x01F9CB 0F:F9BB: A4 34
	LDA tbl_0F_E20A,Y               ;C - - - - - 0x01F9CD 0F:F9BD: B9 0A E2
	JSR SetPlayerAnim               ;C - - - - - 0x01F9D0 0F:F9C0: 20 94 F2
	LDA tbl_0F_E252,Y               ;C - - - - - 0x01F9D3 0F:F9C3: B9 52 E2
	JSR SetChrBank2                 ;C - - - - - 0x01F9D6 0F:F9C6: 20 40 F4
	LDA #$00                        ;C - - - - - 0x01F9D9 0F:F9C9: A9 00
	STA timerA4                     ;C - - - - - 0x01F9DB 0F:F9CB: 85 A4
	STA timerA3                     ;C - - - - - 0x01F9DD 0F:F9CD: 85 A3
	LDA playerId                    ;C - - - - - 0x01F9DF 0F:F9CF: A5 34
	CMP #$01                        ;C - - - - - 0x01F9E1 0F:F9D1: C9 01
	BEQ loc_0F_F9DB                 ;C - - - - - 0x01F9E3 0F:F9D3: F0 06
	LDA #$00                        ;C - - - - - 0x01F9E5 0F:F9D5: A9 00
	STA weaponHeld                  ;C - - - - - 0x01F9E7 0F:F9D7: 85 A9
	STA ram_00AD                    ;C - - - - - 0x01F9E9 0F:F9D9: 85 AD
loc_0F_F9DB:
	LDA #$06                        ;C - - - - - 0x01F9EB 0F:F9DB: A9 06
	STA gameAction                  ;C - - - - - 0x01F9ED 0F:F9DD: 85 30
	LDA #$80                        ;C - - - - - 0x01F9EF 0F:F9DF: A9 80
	STA objActive                   ;C - - - - - 0x01F9F1 0F:F9E1: 8D 00 03
	RTS                             ;C - - - - - 0x01F9F4 0F:F9E4: 60
CheckObjContact:
	LDA #$02                        ;C - - - - - 0x01F9F5 0F:F9E5: A9 02
	STA spriteFlipMask              ;C - - - - - 0x01F9F7 0F:F9E7: 85 10
loc_0F_F9E9:
	LDY spriteFlipMask              ;C - - - - - 0x01F9F9 0F:F9E9: A4 10
	LDA objActive,Y                 ;C - - - - - 0x01F9FB 0F:F9EB: B9 00 03
	BPL loc_0F_FA5D                 ;C - - - - - 0x01F9FE 0F:F9EE: 10 6D
	LDA objFlags,Y                  ;C - - - - - 0x01FA00 0F:F9F0: B9 60 05
	BPL loc_0F_FA5D                 ;C - - - - - 0x01FA03 0F:F9F3: 10 68
	LDA objKind,Y                   ;C - - - - - 0x01FA05 0F:F9F5: B9 20 03
	CMP #$66                        ;C - - - - - 0x01FA08 0F:F9F8: C9 66
	BEQ loc_0F_FA5D                 ;C - - - - - 0x01FA0A 0F:F9FA: F0 61
	CMP #$69                        ;C - - - - - 0x01FA0C 0F:F9FC: C9 69
	BEQ loc_0F_FA5D                 ;C - - - - - 0x01FA0E 0F:F9FE: F0 5D
	CMP #$09                        ;C - - - - - 0x01FA10 0F:FA00: C9 09
	BEQ loc_0F_FA5D                 ;C - - - - - 0x01FA12 0F:FA02: F0 59
	LDA objActive,X                 ;C - - - - - 0x01FA14 0F:FA04: BD 00 03
	BPL loc_0F_FA84                 ;C - - - - - 0x01FA17 0F:FA07: 10 7B
	LDA objKind,X                   ;C - - - - - 0x01FA19 0F:FA09: BD 20 03
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA1C 0F:FA0C: F0 76
	CMP #$05                        ;C - - - - - 0x01FA1E 0F:FA0E: C9 05
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA20 0F:FA10: F0 72
	CMP #$06                        ;C - - - - - 0x01FA22 0F:FA12: C9 06
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA24 0F:FA14: F0 6E
	CMP #$07                        ;C - - - - - 0x01FA26 0F:FA16: C9 07
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA28 0F:FA18: F0 6A
	CMP #$6C                        ;C - - - - - 0x01FA2A 0F:FA1A: C9 6C
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA2C 0F:FA1C: F0 66
	CMP #$6D                        ;C - - - - - 0x01FA2E 0F:FA1E: C9 6D
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA30 0F:FA20: F0 62
	CMP #$66                        ;C - - - - - 0x01FA32 0F:FA22: C9 66
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA34 0F:FA24: F0 5E
	CMP #$69                        ;C - - - - - 0x01FA36 0F:FA26: C9 69
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA38 0F:FA28: F0 5A
	CMP #$6A                        ;C - - - - - 0x01FA3A 0F:FA2A: C9 6A
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA3C 0F:FA2C: F0 56
	CMP #$05                        ;C - - - - - 0x01FA3E 0F:FA2E: C9 05
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA40 0F:FA30: F0 52
	CMP #$10                        ;C - - - - - 0x01FA42 0F:FA32: C9 10
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA44 0F:FA34: F0 4E
	CMP #$11                        ;C - - - - - 0x01FA46 0F:FA36: C9 11
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA48 0F:FA38: F0 4A
	CMP #$12                        ;C - - - - - 0x01FA4A 0F:FA3A: C9 12
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA4C 0F:FA3C: F0 46
	CMP #$13                        ;C - - - - - 0x01FA4E 0F:FA3E: C9 13
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA50 0F:FA40: F0 42
	CMP #$60                        ;C - - - - - 0x01FA52 0F:FA42: C9 60
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA54 0F:FA44: F0 3E
	CMP #$95                        ;C - - - - - 0x01FA56 0F:FA46: C9 95
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA58 0F:FA48: F0 3A
	CMP #$61                        ;C - - - - - 0x01FA5A 0F:FA4A: C9 61
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA5C 0F:FA4C: F0 36
	LDA objAnim,X                   ;C - - - - - 0x01FA5E 0F:FA4E: BD 80 05
	CMP #$74                        ;C - - - - - 0x01FA61 0F:FA51: C9 74
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA63 0F:FA53: F0 2F
	CMP #$7F                        ;C - - - - - 0x01FA65 0F:FA55: C9 7F
	BEQ loc_0F_FA84                 ;C - - - - - 0x01FA67 0F:FA57: F0 2B
	CMP #$79                        ;C - - - - - 0x01FA69 0F:FA59: C9 79
	BNE loc_0F_FA60                 ;C - - - - - 0x01FA6B 0F:FA5B: D0 03
loc_0F_FA5D:
	JMP loc_0F_FA84                 ;C - - - - - 0x01FA6D 0F:FA5D: 4C 84 FA
loc_0F_FA60:
	LDA objDownState,X              ;C - - - - - 0x01FA70 0F:FA60: BD C0 04
	BNE loc_0F_FA84                 ;C - - - - - 0x01FA73 0F:FA63: D0 1F
	LDA objFlags,X                  ;C - - - - - 0x01FA75 0F:FA65: BD 60 05
	BPL loc_0F_FA84                 ;C - - - - - 0x01FA78 0F:FA68: 10 1A
	AND #$04                        ;C - - - - - 0x01FA7A 0F:FA6A: 29 04
	BNE loc_0F_FA8F                 ;C - - - - - 0x01FA7C 0F:FA6C: D0 21
	LDA objX,Y                      ;C - - - - - 0x01FA7E 0F:FA6E: B9 60 03
	STA ptr_00                      ;C - - - - - 0x01FA81 0F:FA71: 85 00
	LDA objXPage,Y                  ;C - - - - - 0x01FA83 0F:FA73: B9 80 03
	STA ptr_00+1                    ;C - - - - - 0x01FA86 0F:FA76: 85 01
	LDA objY,Y                      ;C - - - - - 0x01FA88 0F:FA78: B9 C0 03
	STA ptr_02                      ;C - - - - - 0x01FA8B 0F:FA7B: 85 02
	STY ptr_0E+1                    ;C - - - - - 0x01FA8D 0F:FA7D: 84 0F
	JSR TestHitBoxOverlap           ;C - - - - - 0x01FA8F 0F:FA7F: 20 91 FA
	BCC loc_0F_FA90                 ;C - - - - - 0x01FA92 0F:FA82: 90 0C
loc_0F_FA84:
	DEC spriteFlipMask              ;C - - - - - 0x01FA94 0F:FA84: C6 10
	LDA spriteFlipMask              ;C - - - - - 0x01FA96 0F:FA86: A5 10
	CMP #$00                        ;C - - - - - 0x01FA98 0F:FA88: C9 00
	BEQ loc_0F_FA8F                 ;C - - - - - 0x01FA9A 0F:FA8A: F0 03
	JMP loc_0F_F9E9                 ;C - - - - - 0x01FA9C 0F:FA8C: 4C E9 F9
loc_0F_FA8F:
	SEC                             ;C - - - - - 0x01FA9F 0F:FA8F: 38
loc_0F_FA90:
	RTS                             ;C - - - - - 0x01FAA0 0F:FA90: 60
TestHitBoxOverlap:
	LDA objAtkBox,Y                 ;C - - - - - 0x01FAA1 0F:FA91: B9 40 04
	TAY                             ;C - - - - - 0x01FAA4 0F:FA94: A8
	SEC                             ;C - - - - - 0x01FAA5 0F:FA95: 38
	LDA ptr_00                      ;C - - - - - 0x01FAA6 0F:FA96: A5 00
	SEC                             ;C - - - - - 0x01FAA8 0F:FA98: 38
	SBC objX,X                      ;C - - - - - 0x01FAA9 0F:FA99: FD 60 03
	PHA                             ;C - - - - - 0x01FAAC 0F:FA9C: 48
	LDA ptr_00+1                    ;C - - - - - 0x01FAAD 0F:FA9D: A5 01
	SBC objXPage,X                  ;C - - - - - 0x01FAAF 0F:FA9F: FD 80 03
	PLA                             ;C - - - - - 0x01FAB2 0F:FAA2: 68
	BCS loc_0F_FAA9                 ;C - - - - - 0x01FAB3 0F:FAA3: B0 04
	EOR #$FF                        ;C - - - - - 0x01FAB5 0F:FAA5: 49 FF
	ADC #$01                        ;C - - - - - 0x01FAB7 0F:FAA7: 69 01
loc_0F_FAA9:
	CMP tbl_0F_FAC2,Y               ;C - - - - - 0x01FAB9 0F:FAA9: D9 C2 FA
	BCS loc_0F_FABF                 ;C - - - - - 0x01FABC 0F:FAAC: B0 11
	LDA ptr_02                      ;C - - - - - 0x01FABE 0F:FAAE: A5 02
	SEC                             ;C - - - - - 0x01FAC0 0F:FAB0: 38
	SBC objY,X                      ;C - - - - - 0x01FAC1 0F:FAB1: FD C0 03
	BCS loc_0F_FABA                 ;C - - - - - 0x01FAC4 0F:FAB4: B0 04
	EOR #$FF                        ;C - - - - - 0x01FAC6 0F:FAB6: 49 FF
	ADC #$01                        ;C - - - - - 0x01FAC8 0F:FAB8: 69 01
loc_0F_FABA:
	CMP tbl_0F_FAC0,Y               ;C - - - - - 0x01FACA 0F:FABA: D9 C0 FA
	BCC loc_0F_FABF                 ;C - - - - - 0x01FACD 0F:FABD: 90 00
loc_0F_FABF:
	RTS                             ;C - - - - - 0x01FACF 0F:FABF: 60
tbl_0F_FAC0:
	.byte $0E,$14                   ;- D 3 - - - 0x01FAD0 0F:FAC0:
tbl_0F_FAC2:
	.byte $14,$14                   ;- D 3 - - - 0x01FAD2 0F:FAC2:
InitSlot1Follower:
	LDA #$80                        ;C - - - - - 0x01FAD4 0F:FAC4: A9 80
	STA objActive+1                 ;C - - - - - 0x01FAD6 0F:FAC6: 8D 01 03
	LDA #$90                        ;C - - - - - 0x01FAD9 0F:FAC9: A9 90
	STA objFlags+1                  ;C - - - - - 0x01FADB 0F:FACB: 8D 61 05
	LDA objX                        ;C - - - - - 0x01FADE 0F:FACE: AD 60 03
	STA objX+1                      ;C - - - - - 0x01FAE1 0F:FAD1: 8D 61 03
	LDA objY                        ;C - - - - - 0x01FAE4 0F:FAD4: AD C0 03
	STA objY+1                      ;C - - - - - 0x01FAE7 0F:FAD7: 8D C1 03
	LDA objXPage                    ;C - - - - - 0x01FAEA 0F:FADA: AD 80 03
	STA objXPage+1                  ;C - - - - - 0x01FAED 0F:FADD: 8D 81 03
	LDA objYPage                    ;C - - - - - 0x01FAF0 0F:FAE0: AD E0 03
	STA objYPage+1                  ;C - - - - - 0x01FAF3 0F:FAE3: 8D E1 03
	LDY playerId                    ;C - - - - - 0x01FAF6 0F:FAE6: A4 34
	LDA tbl_0F_FB06,Y               ;C - - - - - 0x01FAF8 0F:FAE8: B9 06 FB
	STA objAnim+1                   ;C - - - - - 0x01FAFB 0F:FAEB: 8D 81 05
	LDA #$00                        ;C - - - - - 0x01FAFE 0F:FAEE: A9 00
	STA objAnimFlags+1              ;C - - - - - 0x01FB00 0F:FAF0: 8D 91 05
	STA objAnimFrame+1              ;C - - - - - 0x01FB03 0F:FAF3: 8D 71 05
	LDA playerFacing                ;C - - - - - 0x01FB06 0F:FAF6: A5 31
	STA objFacing+1                 ;C - - - - - 0x01FB08 0F:FAF8: 8D 61 04
	LDA #$66                        ;C - - - - - 0x01FB0B 0F:FAFB: A9 66
	STA objKind+1                   ;C - - - - - 0x01FB0D 0F:FAFD: 8D 21 03
	LDA #$2F                        ;C - - - - - 0x01FB10 0F:FB00: A9 2F
	STA objAtkBox+1                 ;C - - - - - 0x01FB12 0F:FB02: 8D 41 04
	RTS                             ;C - - - - - 0x01FB15 0F:FB05: 60
tbl_0F_FB06:
	.byte $41,$41                   ;- - - - - - 0x01FB16 0F:FB06:
	.byte $51                       ;- D 3 - - - 0x01FB18 0F:FB08:
InitHitFields:
	LDY ram_00A7                    ;C - - - - - 0x01FB19 0F:FB09: A4 A7
	LDA tbl_0F_FB17,Y               ;C - - - - - 0x01FB1B 0F:FB0B: B9 17 FB
	STA objStunTimer,X              ;C - - - - - 0x01FB1E 0F:FB0E: 9D B0 04
	LDA #$1E                        ;C - - - - - 0x01FB21 0F:FB11: A9 1E
	STA objHitTimer,X               ;C - - - - - 0x01FB23 0F:FB13: 9D E0 04
	RTS                             ;C - - - - - 0x01FB26 0F:FB16: 60
tbl_0F_FB17:
	.byte $02,$18                   ;- D 3 - - - 0x01FB27 0F:FB17:
	.byte $20                       ;- - - - - - 0x01FB29 0F:FB19:
	.byte $10,$10,$10,$10,$10,$10,$10,$08,$02,$04,$18,$02,$03,$03,$03,$03;- D 3 - - - 0x01FB2A 0F:FB1A:
	.byte $08,$10,$10,$10,$10,$04   ;- D 3 - - - 0x01FB3A 0F:FB2A:
	.byte $04                       ;- - - - - - 0x01FB40 0F:FB30:
	.byte $04,$02,$02,$02           ;- D 3 - - - 0x01FB41 0F:FB31:
	.byte $02,$02,$02,$02           ;- - - - - - 0x01FB45 0F:FB35:
	.byte $08                       ;- D 3 - - - 0x01FB49 0F:FB39:
	.byte $A9,$20,$A0,$18           ;- - - - - - 0x01FB4A 0F:FB3A:
CheckNearPlayer:
	STA ptr_00                      ;C - - - - - 0x01FB4E 0F:FB3E: 85 00
	STY ptr_00+1                    ;C - - - - - 0x01FB50 0F:FB40: 84 01
	JSR DistanceXToPlayer           ;C - - - - - 0x01FB52 0F:FB42: 20 74 F3
	STA ptr_02                      ;C - - - - - 0x01FB55 0F:FB45: 85 02
	JSR DistanceYToPlayerGround     ;C - - - - - 0x01FB57 0F:FB47: 20 D9 FB
	STA ptr_02+1                    ;C - - - - - 0x01FB5A 0F:FB4A: 85 03
	LDA ptr_00                      ;C - - - - - 0x01FB5C 0F:FB4C: A5 00
	SEC                             ;C - - - - - 0x01FB5E 0F:FB4E: 38
	SBC ptr_02                      ;C - - - - - 0x01FB5F 0F:FB4F: E5 02
	BCC loc_0F_FB5A                 ;C - - - - - 0x01FB61 0F:FB51: 90 07
	LDA ptr_00+1                    ;C - - - - - 0x01FB63 0F:FB53: A5 01
	SEC                             ;C - - - - - 0x01FB65 0F:FB55: 38
	SBC ptr_02+1                    ;C - - - - - 0x01FB66 0F:FB56: E5 03
	BCC loc_0F_FB5A                 ;C - - - - - 0x01FB68 0F:FB58: 90 00
loc_0F_FB5A:
	RTS                             ;C - - - - - 0x01FB6A 0F:FB5A: 60
DirToPlayerGround:
	LDA objY                        ;C - - - - - 0x01FB6B 0F:FB5B: AD C0 03
	STA ptr_0E+1                    ;C - - - - - 0x01FB6E 0F:FB5E: 85 0F
	LDA playerGroundY               ;C - - - - - 0x01FB70 0F:FB60: A5 36
	STA objY                        ;C - - - - - 0x01FB72 0F:FB62: 8D C0 03
	JSR CalcDirToPlayer             ;C - - - - - 0x01FB75 0F:FB65: 20 8B F3
	STA ptr_0E                      ;C - - - - - 0x01FB78 0F:FB68: 85 0E
	LDA ptr_0E+1                    ;C - - - - - 0x01FB7A 0F:FB6A: A5 0F
	STA objY                        ;C - - - - - 0x01FB7C 0F:FB6C: 8D C0 03
	LDA ptr_0E                      ;C - - - - - 0x01FB7F 0F:FB6F: A5 0E
	RTS                             ;C - - - - - 0x01FB81 0F:FB71: 60
DirToPlayerOffset:
	LDA objY                        ;C - - - - - 0x01FB82 0F:FB72: AD C0 03
	STA ptr_0E+1                    ;C - - - - - 0x01FB85 0F:FB75: 85 0F
	LDA objX                        ;C - - - - - 0x01FB87 0F:FB77: AD 60 03
	STA ptr_0E                      ;C - - - - - 0x01FB8A 0F:FB7A: 85 0E
	LDA objXPage                    ;C - - - - - 0x01FB8C 0F:FB7C: AD 80 03
	STA ptr_0C+1                    ;C - - - - - 0x01FB8F 0F:FB7F: 85 0D
	LDY objSpriteDown,X             ;C - - - - - 0x01FB91 0F:FB81: BC B0 05
	JSR DistanceXToPlayer           ;C - - - - - 0x01FB94 0F:FB84: 20 74 F3
	BCS loc_0F_FB9E                 ;C - - - - - 0x01FB97 0F:FB87: B0 15
	LDA objX                        ;C - - - - - 0x01FB99 0F:FB89: AD 60 03
	CLC                             ;C - - - - - 0x01FB9C 0F:FB8C: 18
	ADC tbl_0F_FBCC,Y               ;C - - - - - 0x01FB9D 0F:FB8D: 79 CC FB
	STA objX                        ;C - - - - - 0x01FBA0 0F:FB90: 8D 60 03
	LDA objXPage                    ;C - - - - - 0x01FBA3 0F:FB93: AD 80 03
	ADC #$00                        ;C - - - - - 0x01FBA6 0F:FB96: 69 00
	STA objXPage                    ;C - - - - - 0x01FBA8 0F:FB98: 8D 80 03
	JMP loc_0F_FBB0                 ;C - - - - - 0x01FBAB 0F:FB9B: 4C B0 FB
loc_0F_FB9E:
	LDA objX                        ;C - - - - - 0x01FBAE 0F:FB9E: AD 60 03
	SEC                             ;C - - - - - 0x01FBB1 0F:FBA1: 38
	SBC tbl_0F_FBCC,Y               ;C - - - - - 0x01FBB2 0F:FBA2: F9 CC FB
	STA objX                        ;C - - - - - 0x01FBB5 0F:FBA5: 8D 60 03
	LDA objXPage                    ;C - - - - - 0x01FBB8 0F:FBA8: AD 80 03
	SBC #$00                        ;C - - - - - 0x01FBBB 0F:FBAB: E9 00
	STA objXPage                    ;C - - - - - 0x01FBBD 0F:FBAD: 8D 80 03
loc_0F_FBB0:
	LDA playerGroundY               ;C - - - - - 0x01FBC0 0F:FBB0: A5 36
	STA objY                        ;C - - - - - 0x01FBC2 0F:FBB2: 8D C0 03
	JSR CalcDirToPlayer             ;C - - - - - 0x01FBC5 0F:FBB5: 20 8B F3
	STA ptr_0C                      ;C - - - - - 0x01FBC8 0F:FBB8: 85 0C
	LDA ptr_0E+1                    ;C - - - - - 0x01FBCA 0F:FBBA: A5 0F
	STA objY                        ;C - - - - - 0x01FBCC 0F:FBBC: 8D C0 03
	LDA ptr_0E                      ;C - - - - - 0x01FBCF 0F:FBBF: A5 0E
	STA objX                        ;C - - - - - 0x01FBD1 0F:FBC1: 8D 60 03
	LDA ptr_0C+1                    ;C - - - - - 0x01FBD4 0F:FBC4: A5 0D
	STA objXPage                    ;C - - - - - 0x01FBD6 0F:FBC6: 8D 80 03
	LDA ptr_0C                      ;C - - - - - 0x01FBD9 0F:FBC9: A5 0C
	RTS                             ;C - - - - - 0x01FBDB 0F:FBCB: 60
tbl_0F_FBCC:
	.byte $1C,$16,$19,$19,$1C,$1F   ;- D 3 - - - 0x01FBDC 0F:FBCC:
	.byte $00                       ;- - - - - - 0x01FBE2 0F:FBD2:
	.byte $20,$20                   ;- D 3 - - - 0x01FBE3 0F:FBD3:
	.byte $20,$20,$20,$00           ;- - - - - - 0x01FBE5 0F:FBD5:
DistanceYToPlayerGround:
	LDA objY                        ;C - - - - - 0x01FBE9 0F:FBD9: AD C0 03
	STA ptr_0E+1                    ;C - - - - - 0x01FBEC 0F:FBDC: 85 0F
	LDA playerGroundY               ;C - - - - - 0x01FBEE 0F:FBDE: A5 36
	STA objY                        ;C - - - - - 0x01FBF0 0F:FBE0: 8D C0 03
	JSR DistanceYToPlayer           ;C - - - - - 0x01FBF3 0F:FBE3: 20 65 F3
	STA ptr_0E                      ;C - - - - - 0x01FBF6 0F:FBE6: 85 0E
	LDA ptr_0E+1                    ;C - - - - - 0x01FBF8 0F:FBE8: A5 0F
	STA objY                        ;C - - - - - 0x01FBFA 0F:FBEA: 8D C0 03
	LDA ptr_0E                      ;C - - - - - 0x01FBFD 0F:FBED: A5 0E
	RTS                             ;C - - - - - 0x01FBFF 0F:FBEF: 60
tbl_0F_FBF0:
	.byte $08,$09,$09,$09,$01,$05,$05,$05,$04,$06,$06,$06,$02,$0A,$0A,$0A;- D 3 - - - 0x01FC00 0F:FBF0:
	.byte $08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$00,$01,$02,$03,$04,$05,$06,$07;- - - - - - 0x01FC10 0F:FC00:
tbl_0F_FC10:
	.byte $02,$04                   ;- D 3 - - - 0x01FC20 0F:FC10:
	.byte $02                       ;- - - - - - 0x01FC22 0F:FC12:
	.byte $01,$03,$04,$04,$04,$01   ;- D 3 - - - 0x01FC23 0F:FC13:
	.byte $00                       ;- - - - - - 0x01FC29 0F:FC19:
	.byte $04,$01,$02,$04,$01,$02,$02,$02,$02,$04,$02,$02,$02,$02,$04;- D 3 - - - 0x01FC2A 0F:FC1A:
	.byte $02                       ;- - - - - - 0x01FC39 0F:FC29:
	.byte $02,$04,$04,$06,$24,$32   ;- D 3 - - - 0x01FC3A 0F:FC2A:
	.byte $16,$08                   ;- - - - - - 0x01FC40 0F:FC30:
	.byte $06                       ;- D 3 - - - 0x01FC42 0F:FC32:
tbl_0F_FC33:
	.byte $01,$02,$00,$01,$02,$00   ;- D 3 - - - 0x01FC43 0F:FC33:
	.byte $00                       ;- - - - - - 0x01FC49 0F:FC39:
	.byte $01,$01,$00               ;- D 3 - - - 0x01FC4A 0F:FC3A:
	.byte $01                       ;- - - - - - 0x01FC4D 0F:FC3D:
	.byte $01,$00                   ;- D 3 - - - 0x01FC4E 0F:FC3E:
	.byte $02                       ;W 0x01FC50 0F:FC40:
tbl_0F_FC41:
	.word $B5B4, $B3B2              ;W 0x01FC51 0F:FC41:
	.byte $B6                       ;- D 3 - - - 0x01FC55 0F:FC45:
	.byte $B8                       ;- D 3 - - - 0x01FC56 0F:FC46:
	.byte $00,$ED                   ;- - - - - - 0x01FC57 0F:FC47:
	.byte $FB,$DB                   ;- D 3 - - - 0x01FC59 0F:FC49:
	.byte $FB,$C9,$00               ;- - - - - - 0x01FC5B 0F:FC4B:
tbl_0F_FC4E:
	.byte $18,$1B,$1D,$1F,$20,$24   ;- D 3 - - - 0x01FC5E 0F:FC4E:
	.byte $00,$28                   ;- - - - - - 0x01FC64 0F:FC54:
	.byte $2C,$24                   ;- D 3 - - - 0x01FC66 0F:FC56:
	.byte $2C,$38,$00               ;- - - - - - 0x01FC68 0F:FC58:
tbl_0F_FC5B:
	.byte $85,$8C,$93,$9C,$A9,$D4   ;- D 3 - - - 0x01FC6B 0F:FC5B:
	.byte $00,$EA                   ;- - - - - - 0x01FC71 0F:FC61:
	.byte $F7,$DF                   ;- D 3 - - - 0x01FC73 0F:FC63:
	.byte $F7,$C3,$00               ;- - - - - - 0x01FC75 0F:FC65:
tbl_0F_FC68:
	.byte $AF,$B0,$AD,$AE,$B1,$D8   ;- D 3 - - - 0x01FC78 0F:FC68:
	.byte $00,$EE                   ;- - - - - - 0x01FC7E 0F:FC6E:
	.byte $FC,$E3                   ;- D 3 - - - 0x01FC80 0F:FC70:
	.byte $FC                       ;- - - - - - 0x01FC82 0F:FC72:
	.byte $CA                       ;- D 3 - - - 0x01FC83 0F:FC73:
	.byte $00                       ;- - - - - - 0x01FC84 0F:FC74:
tbl_0F_FC75:
	.byte $19,$1C,$1D,$3D,$21,$26   ;- D 3 - - - 0x01FC85 0F:FC75:
	.byte $00,$2B                   ;- - - - - - 0x01FC8B 0F:FC7B:
	.byte $2D,$26                   ;- D 3 - - - 0x01FC8D 0F:FC7D:
	.byte $2D                       ;- - - - - - 0x01FC8F 0F:FC7F:
	.byte $3A                       ;- D 3 - - - 0x01FC90 0F:FC80:
	.byte $00                       ;- - - - - - 0x01FC91 0F:FC81:
tbl_0F_FC82:
	.byte $06,$03,$06,$06,$06,$06   ;- D 3 - - - 0x01FC92 0F:FC82:
	.byte $00                       ;- - - - - - 0x01FC98 0F:FC88:
	.byte $10,$1C,$1E               ;- D 3 - - - 0x01FC99 0F:FC89:
	.byte $1C                       ;- - - - - - 0x01FC9C 0F:FC8C:
	.byte $1E                       ;- D 3 - - - 0x01FC9D 0F:FC8D:
	.byte $00                       ;- - - - - - 0x01FC9E 0F:FC8E:
tbl_0F_FC8F:
	.byte $86,$8D,$95,$9E,$AA,$D5,$BA,$EB,$F8,$E0;- D 3 - - - 0x01FC9F 0F:FC8F:
	.byte $F8                       ;- - - - - - 0x01FCA9 0F:FC99:
	.byte $C4,$C8,$FD               ;- D 3 - - - 0x01FCAA 0F:FC9A:
tbl_0F_FC9D:
	.byte $19,$1C,$1E,$3D,$21,$26   ;- D 3 - - - 0x01FCAD 0F:FC9D:
	.byte $00                       ;- - - - - - 0x01FCB3 0F:FCA3:
	.byte $2B,$2D,$26               ;- D 3 - - - 0x01FCB4 0F:FCA4:
	.byte $2D                       ;- - - - - - 0x01FCB7 0F:FCA7:
	.byte $39,$39                   ;- D 3 - - - 0x01FCB8 0F:FCA8:
	.byte $2E                       ;- - - - - - 0x01FCBA 0F:FCAA:
tbl_0F_FCAB:
	.byte $87,$8E,$96,$9F,$AB,$D6,$B9,$EC,$F9,$E1;- D 3 - - - 0x01FCBB 0F:FCAB:
	.byte $F9                       ;- - - - - - 0x01FCC5 0F:FCB5:
	.byte $C5,$C1,$FD               ;- D 3 - - - 0x01FCC6 0F:FCB6:
	.byte $10,$10,$10,$10,$00,$11,$11;- - - - - - 0x01FCC9 0F:FCB9:
tbl_0F_FCC0:
	.byte $20,$7F                   ;- D 3 - - - 0x01FCD0 0F:FCC0:
	.byte $30,$10,$FF               ;- - - - - - 0x01FCD2 0F:FCC2:
tbl_0F_FCC5:
	.byte $FF                       ;- - - - - - 0x01FCD5 0F:FCC5:
	.byte $FF                       ;- D 3 - - - 0x01FCD6 0F:FCC6:
	.byte $00                       ;- - - - - - 0x01FCD7 0F:FCC7:
tbl_0F_FCC8:
	.byte $21,$15,$19               ;- D 3 - - - 0x01FCD8 0F:FCC8:
tbl_0F_FCCB:
	.byte $30                       ;- D 3 - - - 0x01FCDB 0F:FCCB:
	.byte $30,$30                   ;- - - - - - 0x01FCDC 0F:FCCC:
tbl_0F_FCCE:
	.byte $23,$27,$10               ;- D 3 - - - 0x01FCDE 0F:FCCE:
tbl_0F_FCD1:
	.byte $1E,$1F                   ;- D 3 - - - 0x01FCE1 0F:FCD1:
	.byte $20,$21,$00               ;- - - - - - 0x01FCE3 0F:FCD3:
tbl_0F_FCD6:
	.byte $F0                       ;- D 3 - - - 0x01FCE6 0F:FCD6:
tbl_0F_FCD7:
	.byte $FF,$10,$00               ;- D 3 - - - 0x01FCE7 0F:FCD7:
tbl_0F_FCDA:
	.byte $EE                       ;- D 3 - - - 0x01FCEA 0F:FCDA:
tbl_0F_FCDB:
	.byte $FF,$12,$00               ;- D 3 - - - 0x01FCEB 0F:FCDB:
tbl_0F_FCDE:
	.byte $EC                       ;- D 3 - - - 0x01FCEE 0F:FCDE:
tbl_0F_FCDF:
	.byte $FF,$14,$00               ;- D 3 - - - 0x01FCEF 0F:FCDF:
tbl_0F_FCE2:
	.byte $1C                       ;- D 3 - - - 0x01FCF2 0F:FCE2:
tbl_0F_FCE3:
	.byte $00,$E4,$FF               ;- D 3 - - - 0x01FCF3 0F:FCE3:
tbl_0F_FCE6:
	.byte $F0                       ;- D 3 - - - 0x01FCF6 0F:FCE6:
tbl_0F_FCE7:
	.byte $FF,$10,$00               ;- D 3 - - - 0x01FCF7 0F:FCE7:
tbl_0F_FCEA:
	.byte $F0                       ;- D 3 - - - 0x01FCFA 0F:FCEA:
tbl_0F_FCEB:
	.byte $FF,$10,$00               ;- D 3 - - - 0x01FCFB 0F:FCEB:
tbl_0F_FCEE:
	.byte $F6                       ;- D 3 - - - 0x01FCFE 0F:FCEE:
tbl_0F_FCEF:
	.byte $FF,$0A,$00               ;- D 3 - - - 0x01FCFF 0F:FCEF:
tbl_0F_FCF2:
	.byte $04                       ;- D 3 - - - 0x01FD02 0F:FCF2:
tbl_0F_FCF3:
	.byte $00,$FC,$FF               ;- D 3 - - - 0x01FD03 0F:FCF3:
tbl_0F_FCF6:
	.byte $1C                       ;- D 3 - - - 0x01FD06 0F:FCF6:
tbl_0F_FCF7:
	.byte $00,$E4,$FF               ;- D 3 - - - 0x01FD07 0F:FCF7:
tbl_0F_FCFA:
	.byte $FE                       ;- D 3 - - - 0x01FD0A 0F:FCFA:
tbl_0F_FCFB:
	.byte $FF,$02,$00               ;- D 3 - - - 0x01FD0B 0F:FCFB:
tbl_0F_FCFE:
	.byte $FA                       ;- D 3 - - - 0x01FD0E 0F:FCFE:
tbl_0F_FCFF:
	.byte $FF,$06,$00               ;- D 3 - - - 0x01FD0F 0F:FCFF:
tbl_0F_FD02:
	.byte $D8                       ;- D 3 - - - 0x01FD12 0F:FD02:
tbl_0F_FD03:
	.byte $FF,$28,$00               ;- D 3 - - - 0x01FD13 0F:FD03:
tbl_0F_FD06:
	.byte $F2                       ;- D 3 - - - 0x01FD16 0F:FD06:
tbl_0F_FD07:
	.byte $FF,$0E,$00               ;- D 3 - - - 0x01FD17 0F:FD07:
tbl_0F_FD0A:
	.byte $10                       ;- - - - - - 0x01FD1A 0F:FD0A:
tbl_0F_FD0B:
	.byte $00,$F0,$FF               ;- - - - - - 0x01FD1B 0F:FD0B:
tbl_0F_FD0E:
	.byte $F0                       ;- D 3 - - - 0x01FD1E 0F:FD0E:
tbl_0F_FD0F:
	.byte $FF,$10,$00               ;- D 3 - - - 0x01FD1F 0F:FD0F:
tbl_0F_FD12:
	.byte $F8                       ;- D 3 - - - 0x01FD22 0F:FD12:
tbl_0F_FD13:
	.byte $FF,$08,$00               ;- D 3 - - - 0x01FD23 0F:FD13:
tbl_0F_FD16:
	.byte $08,$04,$08               ;- D 3 - - - 0x01FD26 0F:FD16:
	.byte $0A                       ;- - - - - - 0x01FD29 0F:FD19:
	.byte $0A,$0C,$0A,$0A           ;- D 3 - - - 0x01FD2A 0F:FD1A:
	.byte $08,$04                   ;- - - - - - 0x01FD2E 0F:FD1E:
	.byte $08,$0A                   ;- D 3 - - - 0x01FD30 0F:FD20:
	.byte $0A,$0C                   ;- - - - - - 0x01FD32 0F:FD22:
	.byte $20,$0A,$0A,$06,$0A       ;- D 3 - - - 0x01FD34 0F:FD24:
	.byte $0E,$0E                   ;- - - - - - 0x01FD39 0F:FD29:
	.byte $10,$12,$18               ;- D 3 - - - 0x01FD3B 0F:FD2B:
	.byte $0A,$06,$0A               ;- - - - - - 0x01FD3E 0F:FD2E:
	.byte $0E                       ;- D 3 - - - 0x01FD41 0F:FD31:
	.byte $0E,$10                   ;- - - - - - 0x01FD42 0F:FD32:
	.byte $02,$05,$0C,$08,$0C       ;- D 3 - - - 0x01FD44 0F:FD34:
	.byte $12                       ;- - - - - - 0x01FD49 0F:FD39:
	.byte $12,$14,$0A,$14,$0C       ;- D 3 - - - 0x01FD4A 0F:FD3A:
	.byte $08,$0C                   ;- - - - - - 0x01FD4F 0F:FD3F:
	.byte $12                       ;- D 3 - - - 0x01FD51 0F:FD41:
	.byte $12,$14                   ;- - - - - - 0x01FD52 0F:FD42:
	.byte $1C                       ;- D 3 - - - 0x01FD54 0F:FD44:
	.byte $10                       ;- - - - - - 0x01FD55 0F:FD45:
	.byte $08                       ;- D 3 - - - 0x01FD56 0F:FD46:
	.byte $0A                       ;- - - - - - 0x01FD57 0F:FD47:
	.byte $0C,$14,$18,$1C           ;- D 3 - - - 0x01FD58 0F:FD48:
	.byte $06,$08                   ;- - - - - - 0x01FD5C 0F:FD4C:
	.byte $0A,$06,$0A,$0E           ;- D 3 - - - 0x01FD5E 0F:FD4E:
	.byte $24,$00,$00               ;- - - - - - 0x01FD62 0F:FD52:
	.byte $00                       ;- D 3 - - - 0x01FD65 0F:FD55:
tbl_0F_FD56:
	.byte $00,$00,$00               ;- D 3 - - - 0x01FD66 0F:FD56:
	.byte $00                       ;- - - - - - 0x01FD69 0F:FD59:
	.byte $00,$00,$FF,$00           ;- D 3 - - - 0x01FD6A 0F:FD5A:
	.byte $FF,$FF                   ;- - - - - - 0x01FD6E 0F:FD5E:
	.byte $FF,$FF                   ;- D 3 - - - 0x01FD70 0F:FD60:
	.byte $FF,$FF                   ;- - - - - - 0x01FD72 0F:FD62:
	.byte $FF,$FF,$00,$00,$00       ;- D 3 - - - 0x01FD74 0F:FD64:
	.byte $00,$00                   ;- - - - - - 0x01FD79 0F:FD69:
	.byte $00,$FF,$FF               ;- D 3 - - - 0x01FD7B 0F:FD6B:
	.byte $FF,$FF,$FF               ;- - - - - - 0x01FD7E 0F:FD6E:
	.byte $FF                       ;- D 3 - - - 0x01FD81 0F:FD71:
	.byte $FF,$FF                   ;- - - - - - 0x01FD82 0F:FD72:
	.byte $00,$FF,$00,$00,$00       ;- D 3 - - - 0x01FD84 0F:FD74:
	.byte $00                       ;- - - - - - 0x01FD89 0F:FD79:
	.byte $00,$00,$FF,$FF,$FF       ;- D 3 - - - 0x01FD8A 0F:FD7A:
	.byte $FF,$FF                   ;- - - - - - 0x01FD8F 0F:FD7F:
	.byte $FF                       ;- D 3 - - - 0x01FD91 0F:FD81:
	.byte $FF,$FF                   ;- - - - - - 0x01FD92 0F:FD82:
	.byte $FF                       ;- D 3 - - - 0x01FD94 0F:FD84:
	.byte $FF                       ;- - - - - - 0x01FD95 0F:FD85:
	.byte $FF                       ;- D 3 - - - 0x01FD96 0F:FD86:
	.byte $FF                       ;- - - - - - 0x01FD97 0F:FD87:
	.byte $FF,$FF,$FF,$FF           ;- D 3 - - - 0x01FD98 0F:FD88:
	.byte $FF,$FF                   ;- - - - - - 0x01FD9C 0F:FD8C:
	.byte $FF,$FF,$FF,$FF           ;- D 3 - - - 0x01FD9E 0F:FD8E:
	.byte $FF,$00,$00               ;- - - - - - 0x01FDA2 0F:FD92:
	.byte $FF                       ;- D 3 - - - 0x01FDA5 0F:FD95:
	.byte $04,$44,$30,$14,$00,$01,$40,$11,$04,$00,$A4,$44,$01,$04,$00,$44;- - - - - - 0x01FDA6 0F:FD96:
	.byte $C0,$15,$56,$54,$06,$01,$84,$44,$46,$10,$C0,$01,$04,$40,$2D,$10;- - - - - - 0x01FDB6 0F:FDA6:
	.byte $5C,$04,$81,$01,$24,$00,$02,$00,$00,$00,$E0,$50,$50,$40,$8E,$04;- - - - - - 0x01FDC6 0F:FDB6:
	.byte $60,$00,$34,$00,$08,$04,$50,$40,$90,$00,$C1,$01,$B0,$10,$08,$00;- - - - - - 0x01FDD6 0F:FDC6:
	.byte $00,$11,$02,$00,$90,$11,$02,$00,$40,$00,$08,$05,$0A,$15,$43,$40;- - - - - - 0x01FDE6 0F:FDD6:
	.byte $20,$04,$08,$40,$1B,$10,$40,$81,$15,$10,$A2,$01,$64,$00,$4C,$10;- - - - - - 0x01FDF6 0F:FDE6:
	.byte $50,$40,$66,$40,$34,$11,$00,$00,$00,$01;- - - - - - 0x01FE06 0F:FDF6:
RESET:
	SEI                             ;C - - - - - 0x01FE10 0F:FE00: 78
	CLD                             ;C - - - - - 0x01FE11 0F:FE01: D8
	LDA #$08                        ;C - - - - - 0x01FE12 0F:FE02: A9 08
	STA PPUCTRL                     ;C - - - - - 0x01FE14 0F:FE04: 8D 00 20
	LDA #$40                        ;C - - - - - 0x01FE17 0F:FE07: A9 40
	STA JOY2                        ;C - - - - - 0x01FE19 0F:FE09: 8D 17 40
	LDX #$00                        ;C - - - - - 0x01FE1C 0F:FE0C: A2 00
	STX PPUMASK                     ;C - - - - - 0x01FE1E 0F:FE0E: 8E 01 20
	STX DMC_FREQ                    ;C - - - - - 0x01FE21 0F:FE11: 8E 10 40
	STX SNDCHN                      ;C - - - - - 0x01FE24 0F:FE14: 8E 15 40
	DEX                             ;C - - - - - 0x01FE27 0F:FE17: CA
	TXS                             ;C - - - - - 0x01FE28 0F:FE18: 9A
	LDX #$04                        ;C - - - - - 0x01FE29 0F:FE19: A2 04
loc_0F_FE1B:
	LDA PPUSTATUS                   ;C - - - - - 0x01FE2B 0F:FE1B: AD 02 20
	BPL loc_0F_FE1B                 ;C - - - - - 0x01FE2E 0F:FE1E: 10 FB
loc_0F_FE20:
	LDA PPUSTATUS                   ;C - - - - - 0x01FE30 0F:FE20: AD 02 20
	BMI loc_0F_FE20                 ;C - - - - - 0x01FE33 0F:FE23: 30 FB
	DEX                             ;C - - - - - 0x01FE35 0F:FE25: CA
	BNE loc_0F_FE1B                 ;C - - - - - 0x01FE36 0F:FE26: D0 F3
	LDA PPUSTATUS                   ;C - - - - - 0x01FE38 0F:FE28: AD 02 20
	LDA #$10                        ;C - - - - - 0x01FE3B 0F:FE2B: A9 10
	TAY                             ;C - - - - - 0x01FE3D 0F:FE2D: A8
loc_0F_FE2E:
	STA PPUADDR                     ;C - - - - - 0x01FE3E 0F:FE2E: 8D 06 20
	STA PPUADDR                     ;C - - - - - 0x01FE41 0F:FE31: 8D 06 20
	EOR #$10                        ;C - - - - - 0x01FE44 0F:FE34: 49 10
	DEY                             ;C - - - - - 0x01FE46 0F:FE36: 88
	BNE loc_0F_FE2E                 ;C - - - - - 0x01FE47 0F:FE37: D0 F5
	TYA                             ;C - - - - - 0x01FE49 0F:FE39: 98
loc_0F_FE3A:
	STA a:ptr_00,Y                  ;C - - - - - 0x01FE4A 0F:FE3A: 99 00 00
	DEY                             ;C - - - - - 0x01FE4D 0F:FE3D: 88
	BNE loc_0F_FE3A                 ;C - - - - - 0x01FE4E 0F:FE3E: D0 FA
loc_0F_FE40:
	INC ptr_00+1                    ;C - - - - - 0x01FE50 0F:FE40: E6 01
loc_0F_FE42:
	STA (ptr_00),Y                  ;C - - - - - 0x01FE52 0F:FE42: 91 00
	INY                             ;C - - - - - 0x01FE54 0F:FE44: C8
	BNE loc_0F_FE42                 ;C - - - - - 0x01FE55 0F:FE45: D0 FB
	LDX ptr_00+1                    ;C - - - - - 0x01FE57 0F:FE47: A6 01
	CPX #$07                        ;C - - - - - 0x01FE59 0F:FE49: E0 07
	BNE loc_0F_FE40                 ;C - - - - - 0x01FE5B 0F:FE4B: D0 F3
	LDY #$07                        ;C - - - - - 0x01FE5D 0F:FE4D: A0 07
	LDA #$88                        ;C - - - - - 0x01FE5F 0F:FE4F: A9 88
loc_0F_FE51:
	STA soundQueue,X                ;C - - - - - 0x01FE61 0F:FE51: 95 DC
	DEX                             ;C - - - - - 0x01FE63 0F:FE53: CA
	BPL loc_0F_FE51                 ;C - - - - - 0x01FE64 0F:FE54: 10 FB
	LDA #$18                        ;C - - - - - 0x01FE66 0F:FE56: A9 18
	STA ppuMaskBuf                  ;C - - - - - 0x01FE68 0F:FE58: 85 FE
	LDA #$01                        ;C - - - - - 0x01FE6A 0F:FE5A: A9 01
	STA MMC3_MIRRORING              ;C - - - - - 0x01FE6C 0F:FE5C: 8D 00 A0
	LDX #$0C                        ;C - - - - - 0x01FE6F 0F:FE5F: A2 0C
	STX prgBank8000                 ;C - - - - - 0x01FE71 0F:FE61: 86 F4
	INX                             ;C - - - - - 0x01FE73 0F:FE63: E8
	STX prgBankA000                 ;C - - - - - 0x01FE74 0F:FE64: 86 F5
	JSR SetPrgBanks                 ;C - - - - - 0x01FE76 0F:FE66: 20 4D FF
	LDX #$00                        ;C - - - - - 0x01FE79 0F:FE69: A2 00
	STX MMC3_BANK_SELECT            ;C - - - - - 0x01FE7B 0F:FE6B: 8E 00 80
	LDA #$40                        ;C - - - - - 0x01FE7E 0F:FE6E: A9 40
	STA MMC3_BANK_DATA              ;C - - - - - 0x01FE80 0F:FE70: 8D 01 80
	INX                             ;C - - - - - 0x01FE83 0F:FE73: E8
	STX MMC3_BANK_SELECT            ;C - - - - - 0x01FE84 0F:FE74: 8E 00 80
	LDA #$42                        ;C - - - - - 0x01FE87 0F:FE77: A9 42
	STA MMC3_BANK_DATA              ;C - - - - - 0x01FE89 0F:FE79: 8D 01 80
	LDA #$40                        ;C - - - - - 0x01FE8C 0F:FE7C: A9 40
	STA chrBankShadow               ;C - - - - - 0x01FE8E 0F:FE7E: 85 E8
	LDA #$42                        ;C - - - - - 0x01FE90 0F:FE80: A9 42
	STA chrBankShadow+1             ;C - - - - - 0x01FE92 0F:FE82: 85 E9
	LDA #$00                        ;C - - - - - 0x01FE94 0F:FE84: A9 00
	STA chrBankShadow+2             ;C - - - - - 0x01FE96 0F:FE86: 85 EA
	LDA #$01                        ;C - - - - - 0x01FE98 0F:FE88: A9 01
	STA chrBankShadow+3             ;C - - - - - 0x01FE9A 0F:FE8A: 85 EB
	LDA #$02                        ;C - - - - - 0x01FE9C 0F:FE8C: A9 02
	STA chrBankShadow+4             ;C - - - - - 0x01FE9E 0F:FE8E: 85 EC
	LDA #$03                        ;C - - - - - 0x01FEA0 0F:FE90: A9 03
	STA chrBankShadow+5             ;C - - - - - 0x01FEA2 0F:FE92: 85 ED
	JSR HideSprites                 ;C - - - - - 0x01FEA4 0F:FE94: 20 1D C3
	LDA #$20                        ;C - - - - - 0x01FEA7 0F:FE97: A9 20
	LDX #$00                        ;C - - - - - 0x01FEA9 0F:FE99: A2 00
	LDY #$00                        ;C - - - - - 0x01FEAB 0F:FE9B: A0 00
	JSR FillNametable               ;C - - - - - 0x01FEAD 0F:FE9D: 20 D1 C2
	LDA #$24                        ;C - - - - - 0x01FEB0 0F:FEA0: A9 24
	LDX #$00                        ;C - - - - - 0x01FEB2 0F:FEA2: A2 00
	LDY #$00                        ;C - - - - - 0x01FEB4 0F:FEA4: A0 00
	JSR FillNametable               ;C - - - - - 0x01FEB6 0F:FEA6: 20 D1 C2
	LDA #$C5                        ;C - - - - - 0x01FEB9 0F:FEA9: A9 C5
	STA ptr_93+1                    ;C - - - - - 0x01FEBB 0F:FEAB: 85 94
ofs_0F_FEAD:
	LDA #$56                        ;C - - - - - 0x01FEBD 0F:FEAD: A9 56
	STA ptr_93                      ;C - - - - - 0x01FEBF 0F:FEAF: 85 93
	LDA #$00                        ;C - - - - - 0x01FEC1 0F:FEB1: A9 00
	JSR StartTask                   ;C - - - - - 0x01FEC3 0F:FEB3: 20 02 FF
	LDA #$88                        ;C - - - - - 0x01FEC6 0F:FEB6: A9 88
	STA bufPPUCTRL                  ;C - - - - - 0x01FEC8 0F:FEB8: 85 FF
; reset stack, fall into the scan
SchedulerRestart:
	LDX #$FF                        ;C - - - - - 0x01FECA 0F:FEBA: A2 FF
	TXS                             ;C - - - - - 0x01FECC 0F:FEBC: 9A
; picks the first ready task (state>=4), "new" task (8) is started via its entry address
SchedulerLoop:
	LDX #$00                        ;C - - - - - 0x01FECD 0F:FEBD: A2 00
	STX nmiTickFlag                 ;C - - - - - 0x01FECF 0F:FEBF: 86 90
	LDY #$04                        ;C - - - - - 0x01FED1 0F:FEC1: A0 04
loc_0F_FEC3:
	LDA taskTable,X                 ;C - - - - - 0x01FED3 0F:FEC3: B5 80
	CMP #$04                        ;C - - - - - 0x01FED5 0F:FEC5: C9 04
	BCS loc_0F_FED3                 ;C - - - - - 0x01FED7 0F:FEC7: B0 0A
	INX                             ;C - - - - - 0x01FED9 0F:FEC9: E8
	INX                             ;C - - - - - 0x01FEDA 0F:FECA: E8
	INX                             ;C - - - - - 0x01FEDB 0F:FECB: E8
	INX                             ;C - - - - - 0x01FEDC 0F:FECC: E8
	DEY                             ;C - - - - - 0x01FEDD 0F:FECD: 88
	BNE loc_0F_FEC3                 ;C - - - - - 0x01FEDE 0F:FECE: D0 F3
	JMP SchedulerLoop               ;C - - - - - 0x01FEE0 0F:FED0: 4C BD FE
loc_0F_FED3:
	LDA nmiTickFlag                 ;C - - - - - 0x01FEE3 0F:FED3: A5 90
	BNE SchedulerLoop               ;C - - - - - 0x01FEE5 0F:FED5: D0 E6
	DEY                             ;C - - - - - 0x01FEE7 0F:FED7: 88
	TYA                             ;C - - - - - 0x01FEE8 0F:FED8: 98
	EOR #$03                        ;C - - - - - 0x01FEE9 0F:FED9: 49 03
	STA currentTask                 ;C - - - - - 0x01FEEB 0F:FEDB: 85 91
	LDY taskTable,X                 ;C - - - - - 0x01FEED 0F:FEDD: B4 80
	LDA #$02                        ;C - - - - - 0x01FEEF 0F:FEDF: A9 02
	STA taskTable,X                 ;C - - - - - 0x01FEF1 0F:FEE1: 95 80
	CPY #$08                        ;C - - - - - 0x01FEF3 0F:FEE3: C0 08
	BNE loc_0F_FEF2                 ;C - - - - - 0x01FEF5 0F:FEE5: D0 0B
	LDA taskTable+2,X               ;C - - - - - 0x01FEF7 0F:FEE7: B5 82
	STA ptr_93                      ;C - - - - - 0x01FEF9 0F:FEE9: 85 93
	LDA taskTable+3,X               ;C - - - - - 0x01FEFB 0F:FEEB: B5 83
	STA ptr_93+1                    ;C - - - - - 0x01FEFD 0F:FEED: 85 94
	JMP (ptr_93)                    ;C - - - - - 0x01FEFF 0F:FEEF: 6C 93 00
loc_0F_FEF2:
	LDA taskTable+2,X               ;C - - - - - 0x01FF02 0F:FEF2: B5 82
	TAX                             ;C - - - - - 0x01FF04 0F:FEF4: AA
	TXS                             ;C - - - - - 0x01FF05 0F:FEF5: 9A
	LDA currentTask                 ;C - - - - - 0x01FF06 0F:FEF6: A5 91
	BNE loc_0F_FEFD                 ;C - - - - - 0x01FF08 0F:FEF8: D0 03
	JSR ReadPads                    ;C - - - - - 0x01FF0A 0F:FEFA: 20 79 C2
loc_0F_FEFD:
	PLA                             ;C - - - - - 0x01FF0D 0F:FEFD: 68
	TAY                             ;C - - - - - 0x01FF0E 0F:FEFE: A8
	PLA                             ;C - - - - - 0x01FF0F 0F:FEFF: 68
	TAX                             ;C - - - - - 0x01FF10 0F:FF00: AA
	RTS                             ;C - - - - - 0x01FF11 0F:FF01: 60
; A=task index, ptr_93=entry address
StartTask:
	JSR TaskSlot                    ;C - - - - - 0x01FF12 0F:FF02: 20 26 FF
	LDA ptr_93                      ;C - - - - - 0x01FF15 0F:FF05: A5 93
	STA taskTable+2,X               ;C - - - - - 0x01FF17 0F:FF07: 95 82
	LDA ptr_93+1                    ;C - - - - - 0x01FF19 0F:FF09: A5 94
	STA taskTable+3,X               ;C - - - - - 0x01FF1B 0F:FF0B: 95 83
	LDA #$08                        ;C - - - - - 0x01FF1D 0F:FF0D: A9 08
	STA taskTable,X                 ;C - - - - - 0x01FF1F 0F:FF0F: 95 80
	RTS                             ;C - - - - - 0x01FF21 0F:FF11: 60
; A=task index: state=0
KillTask:
	JSR TaskSlot                    ;- - - - - - 0x01FF22 0F:FF12: 20 26 FF
	LDA #$00                        ;- - - - - - 0x01FF25 0F:FF15: A9 00
	STA taskTable,X                 ;- - - - - - 0x01FF27 0F:FF17: 95 80
	RTS                             ;- - - - - - 0x01FF29 0F:FF19: 60
; state=0 and jump to the scheduler
KillCurrentTask:
	JSR CurrentTaskSlot             ;- - - - - - 0x01FF2A 0F:FF1A: 20 24 FF
	LDA #$00                        ;- - - - - - 0x01FF2D 0F:FF1D: A9 00
	STA taskTable,X                 ;- - - - - - 0x01FF2F 0F:FF1F: 95 80
	JMP SchedulerRestart            ;- - - - - - 0x01FF31 0F:FF21: 4C BA FE
; X = currentTask*4
CurrentTaskSlot:
	LDA currentTask                 ;C - - - - - 0x01FF34 0F:FF24: A5 91
; X = A*4
TaskSlot:
	ASL A                           ;C - - - - - 0x01FF36 0F:FF26: 0A
	ASL A                           ;C - - - - - 0x01FF37 0F:FF27: 0A
	TAX                             ;C - - - - - 0x01FF38 0F:FF28: AA
	RTS                             ;C - - - - - 0x01FF39 0F:FF29: 60
; X = number of frames to wait
WaitFrames:
	JSR WaitFrame                   ;C - - - - - 0x01FF3A 0F:FF2A: 20 31 FF
	DEX                             ;C - - - - - 0x01FF3D 0F:FF2D: CA
	BNE WaitFrames                  ;C - - - - - 0x01FF3E 0F:FF2E: D0 FA
	RTS                             ;C - - - - - 0x01FF40 0F:FF30: 60
; yield to the scheduler for one frame (coroutine switch)
WaitFrame:
	LDA #$01                        ;C - - - - - 0x01FF41 0F:FF31: A9 01
	STA ptr_93                      ;C - - - - - 0x01FF43 0F:FF33: 85 93
	TXA                             ;C - - - - - 0x01FF45 0F:FF35: 8A
	PHA                             ;C - - - - - 0x01FF46 0F:FF36: 48
	TYA                             ;C - - - - - 0x01FF47 0F:FF37: 98
	PHA                             ;C - - - - - 0x01FF48 0F:FF38: 48
	JSR CurrentTaskSlot             ;C - - - - - 0x01FF49 0F:FF39: 20 24 FF
	LDA ptr_93                      ;C - - - - - 0x01FF4C 0F:FF3C: A5 93
	STA taskTable+1,X               ;C - - - - - 0x01FF4E 0F:FF3E: 95 81
	LDA #$01                        ;C - - - - - 0x01FF50 0F:FF40: A9 01
	STA taskTable,X                 ;C - - - - - 0x01FF52 0F:FF42: 95 80
	TXA                             ;C - - - - - 0x01FF54 0F:FF44: 8A
	TAY                             ;C - - - - - 0x01FF55 0F:FF45: A8
	TSX                             ;C - - - - - 0x01FF56 0F:FF46: BA
	STX taskTable+2,Y               ;C - - - - - 0x01FF57 0F:FF47: 96 82
	JMP SchedulerRestart            ;C - - - - - 0x01FF59 0F:FF49: 4C BA FE
loc_0F_FF4C:
	RTS                             ;C - - - - - 0x01FF5C 0F:FF4C: 60
; applies prgBank8000/prgBankA000 to MMC3 R6/R7
SetPrgBanks:
	INC bankSwitchBusy              ;C - - - - - 0x01FF5D 0F:FF4D: E6 F6
	LDA #$06                        ;C - - - - - 0x01FF5F 0F:FF4F: A9 06
	STA mmc3SelectShadow            ;C - - - - - 0x01FF61 0F:FF51: 85 F0
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01FF63 0F:FF53: 8D 00 80
	LDA prgBank8000                 ;C - - - - - 0x01FF66 0F:FF56: A5 F4
	STA prgR6Shadow                 ;C - - - - - 0x01FF68 0F:FF58: 85 F2
	STA MMC3_BANK_DATA              ;C - - - - - 0x01FF6A 0F:FF5A: 8D 01 80
	LDA #$07                        ;C - - - - - 0x01FF6D 0F:FF5D: A9 07
	STA mmc3SelectShadow            ;C - - - - - 0x01FF6F 0F:FF5F: 85 F0
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01FF71 0F:FF61: 8D 00 80
	LDA prgBankA000                 ;C - - - - - 0x01FF74 0F:FF64: A5 F5
	STA prgR7Shadow                 ;C - - - - - 0x01FF76 0F:FF66: 85 F3
	STA MMC3_BANK_DATA              ;C - - - - - 0x01FF78 0F:FF68: 8D 01 80
	DEC bankSwitchBusy              ;C - - - - - 0x01FF7B 0F:FF6B: C6 F6
	LDA ram_00F7                    ;C - - - - - 0x01FF7D 0F:FF6D: A5 F7
	BNE SoundUpdate                 ;C - - - - - 0x01FF7F 0F:FF6F: D0 01
	RTS                             ;C - - - - - 0x01FF81 0F:FF71: 60
; maps banks 6/7 and drains the sound queue
SoundUpdate:
	LDA bankSwitchBusy              ;C - - - - - 0x01FF82 0F:FF72: A5 F6
	BNE loc_0F_FFB2                 ;C - - - - - 0x01FF84 0F:FF74: D0 3C
	LDA #$06                        ;C - - - - - 0x01FF86 0F:FF76: A9 06
	STA mmc3SelectShadow            ;C - - - - - 0x01FF88 0F:FF78: 85 F0
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01FF8A 0F:FF7A: 8D 00 80
	LDA #$06                        ;C - - - - - 0x01FF8D 0F:FF7D: A9 06
	STA MMC3_BANK_DATA              ;C - - - - - 0x01FF8F 0F:FF7F: 8D 01 80
	LDA #$07                        ;C - - - - - 0x01FF92 0F:FF82: A9 07
ofs_0F_FF84:
	STA mmc3SelectShadow            ;C - - - - - 0x01FF94 0F:FF84: 85 F0
	STA MMC3_BANK_SELECT            ;C - - - - - 0x01FF96 0F:FF86: 8D 00 80
	LDA #$07                        ;C - - - - - 0x01FF99 0F:FF89: A9 07
	STA MMC3_BANK_DATA              ;C - - - - - 0x01FF9B 0F:FF8B: 8D 01 80
; drains soundQueue into the driver (06:8003), then runs one driver frame (06:8000)
SoundStep:
	LDX soundQueueRead              ;C - - - - - 0x01FF9E 0F:FF8E: A6 DB
	LDA soundQueue,X                ;C - - - - - 0x01FFA0 0F:FF90: B5 DC
	CMP #$88                        ;C - - - - - 0x01FFA2 0F:FF92: C9 88
	BEQ loc_0F_FFA8                 ;C - - - - - 0x01FFA4 0F:FF94: F0 12
	PHA                             ;C - - - - - 0x01FFA6 0F:FF96: 48
	LDA #$88                        ;C - - - - - 0x01FFA7 0F:FF97: A9 88
	STA soundQueue,X                ;C - - - - - 0x01FFA9 0F:FF99: 95 DC
	INX                             ;C - - - - - 0x01FFAB 0F:FF9B: E8
	TXA                             ;C - - - - - 0x01FFAC 0F:FF9C: 8A
	AND #$07                        ;C - - - - - 0x01FFAD 0F:FF9D: 29 07
	STA soundQueueRead              ;C - - - - - 0x01FFAF 0F:FF9F: 85 DB
	PLA                             ;C - - - - - 0x01FFB1 0F:FFA1: 68
	JSR SoundPlay                   ;C - - - - - bank=06 0x01FFB2 0F:FFA2: 20 03 80
	JMP SoundStep                   ;C - - - - - 0x01FFB5 0F:FFA5: 4C 8E FF
loc_0F_FFA8:
	JSR SoundFrame                  ;C - - - - - bank=06 0x01FFB8 0F:FFA8: 20 00 80
	LDA #$00                        ;C - - - - - 0x01FFBB 0F:FFAB: A9 00
	STA ram_00F7                    ;C - - - - - 0x01FFBD 0F:FFAD: 85 F7
	JMP SetPrgBanks                 ;C - - - - - 0x01FFBF 0F:FFAF: 4C 4D FF
loc_0F_FFB2:
	INC ram_00F7                    ;C - - - - - 0x01FFC2 0F:FFB2: E6 F7
	RTS                             ;C - - - - - 0x01FFC4 0F:FFB4: 60
	.byte $01,$47,$00,$80,$01,$08,$10,$31,$11,$40,$00,$C4,$41,$02,$30,$24;- - - - - - 0x01FFC5 0F:FFB5:
	.byte $00,$41,$40,$00,$12,$08,$00,$44,$00,$10,$41,$61,$45,$06,$00,$A0;- - - - - - 0x01FFD5 0F:FFC5:
	.byte $40,$48,$04,$08,$00,$0C,$00,$84,$40,$88,$50;- - - - - - 0x01FFE5 0F:FFD5:
tbl_0F_FFE0:
	.byte $4D,$20,$46,$49,$4E,$41,$4C,$20,$46,$49,$47,$48,$54,$59,$20,$20;- D 3 - - - 0x01FFF0 0F:FFE0:
	.byte $10,$B9,$E8,$BB,$33,$04,$01,$0F;- - - - - - 0x020000 0F:FFF0:
dat_0F_FFF8:
	.byte $08                       ;- D 3 - - - 0x020008 0F:FFF8:
	.byte $0E                       ;- - - - - - 0x020009 0F:FFF9:
Vectors:
	.word NMI, RESET, IRQ           ;W 0x02000A 0F:FFFA:
