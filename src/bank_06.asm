.segment "BANK_06"
; 0x00C010-0x00E00F  CPU $8000-$9FFF

	JMP loc_06_806C                 ;C D 0 - - - 0x00C010 06:8000: 4C 6C 80
	JMP loc_06_80FE                 ;C - - - - - 0x00C013 06:8003: 4C FE 80
sub_06_8006:
	LDA #$00                        ;C - - - - - 0x00C016 06:8006: A9 00
	STA ptr_C1+1                    ;C - - - - - 0x00C018 06:8008: 85 C2
	LDY #$08                        ;C - - - - - 0x00C01A 06:800A: A0 08
loc_06_800C:
	ASL ptr_C1+1                    ;C - - - - - 0x00C01C 06:800C: 06 C2
	ROL ptr_C1                      ;C - - - - - 0x00C01E 06:800E: 26 C1
	BCC loc_06_801F                 ;C - - - - - 0x00C020 06:8010: 90 0D
	CLC                             ;C - - - - - 0x00C022 06:8012: 18
	LDA ptr_C1+1                    ;C - - - - - 0x00C023 06:8013: A5 C2
	ADC ram_00C4                    ;C - - - - - 0x00C025 06:8015: 65 C4
	STA ptr_C1+1                    ;C - - - - - 0x00C027 06:8017: 85 C2
	LDA ptr_C1                      ;C - - - - - 0x00C029 06:8019: A5 C1
	ADC #$00                        ;C - - - - - 0x00C02B 06:801B: 69 00
	STA ptr_C1                      ;C - - - - - 0x00C02D 06:801D: 85 C1
loc_06_801F:
	DEY                             ;C - - - - - 0x00C02F 06:801F: 88
	BNE loc_06_800C                 ;C - - - - - 0x00C030 06:8020: D0 EA
	RTS                             ;C - - - - - 0x00C032 06:8022: 60
sub_06_8023:
	ASL A                           ;C - - - - - 0x00C033 06:8023: 0A
	TAY                             ;C - - - - - 0x00C034 06:8024: A8
	INY                             ;C - - - - - 0x00C035 06:8025: C8
	PLA                             ;C - - - - - 0x00C036 06:8026: 68
	STA ptr_C1                      ;C - - - - - 0x00C037 06:8027: 85 C1
	PLA                             ;C - - - - - 0x00C039 06:8029: 68
	STA ptr_C1+1                    ;C - - - - - 0x00C03A 06:802A: 85 C2
	LDA (ptr_C1),Y                  ;C - - - - - 0x00C03C 06:802C: B1 C1
	PHA                             ;C - - - - - 0x00C03E 06:802E: 48
	INY                             ;C - - - - - 0x00C03F 06:802F: C8
	LDA (ptr_C1),Y                  ;C - - - - - 0x00C040 06:8030: B1 C1
	STA ptr_C1+1                    ;C - - - - - 0x00C042 06:8032: 85 C2
	PLA                             ;C - - - - - 0x00C044 06:8034: 68
	STA ptr_C1                      ;C - - - - - 0x00C045 06:8035: 85 C1
	JMP (ptr_C1)                    ;C - - - - - 0x00C047 06:8037: 6C C1 00
sub_06_803A:
	STY ptr_C1                      ;C - - - - - 0x00C04A 06:803A: 84 C1
	LDY #$00                        ;C - - - - - 0x00C04C 06:803C: A0 00
	CMP #$C0                        ;C - - - - - 0x00C04E 06:803E: C9 C0
	BCS loc_06_8047                 ;C - - - - - 0x00C050 06:8040: B0 05
	STA ptr_C1+1                    ;C - - - - - 0x00C052 06:8042: 85 C2
	LDA (ptr_C1),Y                  ;C - - - - - 0x00C054 06:8044: B1 C1
	RTS                             ;C - - - - - 0x00C056 06:8046: 60
loc_06_8047:
	SEC                             ;c - - - - - 0x00C057 06:8047: 38
	SBC #$20                        ;c - - - - - 0x00C058 06:8048: E9 20
	STA ptr_C1+1                    ;c - - - - - 0x00C05A 06:804A: 85 C2
	LDA #$07                        ;c - - - - - 0x00C05C 06:804C: A9 07
	STA MMC3_BANK_SELECT            ;c - - - - - 0x00C05E 06:804E: 8D 00 80
	LDA #$18                        ;c - - - - - 0x00C061 06:8051: A9 18
	STA MMC3_BANK_DATA              ;c - - - - - 0x00C063 06:8053: 8D 01 80
	LDA (ptr_C1),Y                  ;c - - - - - 0x00C066 06:8056: B1 C1
	PHA                             ;c - - - - - 0x00C068 06:8058: 48
	LDA #$07                        ;c - - - - - 0x00C069 06:8059: A9 07
	STA MMC3_BANK_SELECT            ;c - - - - - 0x00C06B 06:805B: 8D 00 80
	LDA #$17                        ;c - - - - - 0x00C06E 06:805E: A9 17
	STA MMC3_BANK_DATA              ;c - - - - - 0x00C070 06:8060: 8D 01 80
	LDA #$20                        ;c - - - - - 0x00C073 06:8063: A9 20
	CLC                             ;c - - - - - 0x00C075 06:8065: 18
	ADC ptr_C1+1                    ;c - - - - - 0x00C076 06:8066: 65 C2
	STA ptr_C1+1                    ;c - - - - - 0x00C078 06:8068: 85 C2
	PLA                             ;c - - - - - 0x00C07A 06:806A: 68
	RTS                             ;c - - - - - 0x00C07B 06:806B: 60
loc_06_806C:
	LDA ram_00C0                    ;C - - - - - 0x00C07C 06:806C: A5 C0
	LSR A                           ;C - - - - - 0x00C07E 06:806E: 4A
	BCS loc_06_80D7                 ;C - - - - - 0x00C07F 06:806F: B0 66
	LDA ram_00D0                    ;C - - - - - 0x00C081 06:8071: A5 D0
	ORA ram_00D1                    ;C - - - - - 0x00C083 06:8073: 05 D1
	BEQ loc_06_807A                 ;C - - - - - 0x00C085 06:8075: F0 03
	JSR sub_06_8252                 ;C - - - - - 0x00C087 06:8077: 20 52 82
loc_06_807A:
	CLC                             ;C - - - - - 0x00C08A 06:807A: 18
	LDA ram_00CA                    ;C - - - - - 0x00C08B 06:807B: A5 CA
	ADC ram_00C8                    ;C - - - - - 0x00C08D 06:807D: 65 C8
	STA ram_00C8                    ;C - - - - - 0x00C08F 06:807F: 85 C8
	LDA ram_00C9                    ;C - - - - - 0x00C091 06:8081: A5 C9
	ADC #$00                        ;C - - - - - 0x00C093 06:8083: 69 00
ofs_06_8085:
	STA ram_00C7                    ;C - - - - - 0x00C095 06:8085: 85 C7
	LDA ram_00CF                    ;C - - - - - 0x00C097 06:8087: A5 CF
	PHA                             ;C - - - - - 0x00C099 06:8089: 48
	LDX #$03                        ;C - - - - - 0x00C09A 06:808A: A2 03
loc_06_808C:
	LSR ram_00CF                    ;C - - - - - 0x00C09C 06:808C: 46 CF
	BCC loc_06_8099                 ;C - - - - - 0x00C09E 06:808E: 90 09
	LDA ram_00CF                    ;C - - - - - 0x00C0A0 06:8090: A5 CF
	ORA #$80                        ;C - - - - - 0x00C0A2 06:8092: 09 80
	STA ram_00CF                    ;C - - - - - 0x00C0A4 06:8094: 85 CF
	JSR sub_06_82DE                 ;C - - - - - 0x00C0A6 06:8096: 20 DE 82
loc_06_8099:
	LDA ram_00C0                    ;C - - - - - 0x00C0A9 06:8099: A5 C0
	AND #$02                        ;C - - - - - 0x00C0AB 06:809B: 29 02
	BNE loc_06_80A6                 ;C - - - - - 0x00C0AD 06:809D: D0 07
	TXA                             ;C - - - - - 0x00C0AF 06:809F: 8A
	PHA                             ;C - - - - - 0x00C0B0 06:80A0: 48
	JSR sub_06_8393                 ;C - - - - - 0x00C0B1 06:80A1: 20 93 83
	PLA                             ;C - - - - - 0x00C0B4 06:80A4: 68
ofs_06_80A5:
	TAX                             ;C - - - - - 0x00C0B5 06:80A5: AA
loc_06_80A6:
	DEX                             ;C - - - - - 0x00C0B6 06:80A6: CA
	BPL loc_06_808C                 ;C - - - - - 0x00C0B7 06:80A7: 10 E3
	PLA                             ;C - - - - - 0x00C0B9 06:80A9: 68
ofs_06_80AA:
	STA ram_00CF                    ;C - - - - - 0x00C0BA 06:80AA: 85 CF
	LSR ram_00C0                    ;C - - - - - 0x00C0BC 06:80AC: 46 C0
	ASL ram_00C0                    ;C - - - - - 0x00C0BE 06:80AE: 06 C0
ofs_06_80B0:
	LDA ram_00CC                    ;C - - - - - 0x00C0C0 06:80B0: A5 CC
ofs_06_80B2:
	AND #$7F                        ;C - - - - - 0x00C0C2 06:80B2: 29 7F
	BEQ loc_06_80D7                 ;C - - - - - 0x00C0C4 06:80B4: F0 21
	LDY #$00                        ;c - - - - - 0x00C0C6 06:80B6: A0 00
	STY ptr_C1                      ;c - - - - - 0x00C0C8 06:80B8: 84 C1
	LDY #$04                        ;c - - - - - 0x00C0CA 06:80BA: A0 04
loc_06_80BC:
	ASL A                           ;c - - - - - 0x00C0CC 06:80BC: 0A
	ROL ptr_C1                      ;c - - - - - 0x00C0CD 06:80BD: 26 C1
	DEY                             ;c - - - - - 0x00C0CF 06:80BF: 88
	BNE loc_06_80BC                 ;c - - - - - 0x00C0D0 06:80C0: D0 FA
	CLC                             ;c - - - - - 0x00C0D2 06:80C2: 18
	ADC ram_00C0                    ;c - - - - - 0x00C0D3 06:80C3: 65 C0
	STA ram_00C0                    ;c - - - - - 0x00C0D5 06:80C5: 85 C0
	LDA ptr_C1                      ;c - - - - - 0x00C0D7 06:80C7: A5 C1
	ADC ram_00CD                    ;c - - - - - 0x00C0D9 06:80C9: 65 CD
	BCC loc_06_80D5                 ;c - - - - - 0x00C0DB 06:80CB: 90 08
	LDA ram_00CC                    ;c - - - - - 0x00C0DD 06:80CD: A5 CC
	AND #$80                        ;c - - - - - 0x00C0DF 06:80CF: 29 80
	STA ram_00CC                    ;c - - - - - 0x00C0E1 06:80D1: 85 CC
	LDA #$FF                        ;c - - - - - 0x00C0E3 06:80D3: A9 FF
loc_06_80D5:
	STA ram_00CD                    ;c - - - - - 0x00C0E5 06:80D5: 85 CD
loc_06_80D7:
	RTS                             ;C - - - - - 0x00C0E7 06:80D7: 60
sub_06_80D8:
	TXA                             ;C - - - - - 0x00C0E8 06:80D8: 8A
	AND #$03                        ;C - - - - - 0x00C0E9 06:80D9: 29 03
	EOR #$03                        ;C - - - - - 0x00C0EB 06:80DB: 49 03
	ASL A                           ;C - - - - - 0x00C0ED 06:80DD: 0A
	ASL A                           ;C - - - - - 0x00C0EE 06:80DE: 0A
	TAY                             ;C - - - - - 0x00C0EF 06:80DF: A8
	LDA #$30                        ;C - - - - - 0x00C0F0 06:80E0: A9 30
	CPY #$08                        ;C - - - - - 0x00C0F2 06:80E2: C0 08
	BNE loc_06_80E8                 ;C - - - - - 0x00C0F4 06:80E4: D0 02
	LDA #$00                        ;C - - - - - 0x00C0F6 06:80E6: A9 00
loc_06_80E8:
	STA SQ1_VOL,Y                   ;C - - - - - 0x00C0F8 06:80E8: 99 00 40
	RTS                             ;C - - - - - 0x00C0FB 06:80EB: 60
sub_06_80EC:
	PHA                             ;C - - - - - 0x00C0FC 06:80EC: 48
	TXA                             ;C - - - - - 0x00C0FD 06:80ED: 8A
	AND #$03                        ;C - - - - - 0x00C0FE 06:80EE: 29 03
	EOR #$03                        ;C - - - - - 0x00C100 06:80F0: 49 03
	ASL A                           ;C - - - - - 0x00C102 06:80F2: 0A
	ASL A                           ;C - - - - - 0x00C103 06:80F3: 0A
	STY ram_00C4                    ;C - - - - - 0x00C104 06:80F4: 84 C4
	ORA ram_00C4                    ;C - - - - - 0x00C106 06:80F6: 05 C4
	TAY                             ;C - - - - - 0x00C108 06:80F8: A8
	PLA                             ;C - - - - - 0x00C109 06:80F9: 68
	STA SQ1_VOL,Y                   ;C - - - - - 0x00C10A 06:80FA: 99 00 40
	RTS                             ;C - - - - - 0x00C10D 06:80FD: 60
loc_06_80FE:
	INC ram_00C0                    ;C - - - - - 0x00C10E 06:80FE: E6 C0
	JSR sub_06_8106                 ;C - - - - - 0x00C110 06:8100: 20 06 81
	DEC ram_00C0                    ;C - - - - - 0x00C113 06:8103: C6 C0
	RTS                             ;C - - - - - 0x00C115 06:8105: 60
sub_06_8106:
	CMP #$F0                        ;C - - - - - 0x00C116 06:8106: C9 F0
	BCC loc_06_810D                 ;C - - - - - 0x00C118 06:8108: 90 03
	JMP loc_06_81AE                 ;C - - - - - 0x00C11A 06:810A: 4C AE 81
loc_06_810D:
	CMP dat_06_8A40                 ;C - - - - - 0x00C11D 06:810D: CD 40 8A
	BCC sub_06_8118                 ;C - - - - - 0x00C120 06:8110: 90 06
	SEC                             ;c - - - - - 0x00C122 06:8112: 38
	SBC dat_06_8A40                 ;c - - - - - 0x00C123 06:8113: ED 40 8A
	BCS loc_06_810D                 ;c - - - - - 0x00C126 06:8116: B0 F5
sub_06_8118:
	ASL A                           ;C - - - - - 0x00C128 06:8118: 0A
	TAX                             ;C - - - - - 0x00C129 06:8119: AA
	LDY tbl_06_8A44,X               ;C - - - - - 0x00C12A 06:811A: BC 44 8A
	TYA                             ;C - - - - - 0x00C12D 06:811D: 98
	ORA tbl_06_8A43,X               ;C - - - - - 0x00C12E 06:811E: 1D 43 8A
	BEQ loc_06_816E                 ;C - - - - - 0x00C131 06:8121: F0 4B
	LDA tbl_06_8A43,X               ;C - - - - - 0x00C133 06:8123: BD 43 8A
	JSR sub_06_803A                 ;C - - - - - 0x00C136 06:8126: 20 3A 80
	TAY                             ;C - - - - - 0x00C139 06:8129: A8
	BEQ loc_06_816F                 ;C - - - - - 0x00C13A 06:812A: F0 43
	LDY #$00                        ;C - - - - - 0x00C13C 06:812C: A0 00
	INX                             ;C - - - - - 0x00C13E 06:812E: E8
	STA ram_00C4                    ;C - - - - - 0x00C13F 06:812F: 85 C4
	AND #$7F                        ;C - - - - - 0x00C141 06:8131: 29 7F
	CMP ram_00CE                    ;C - - - - - 0x00C143 06:8133: C5 CE
	BCC loc_06_816E                 ;C - - - - - 0x00C145 06:8135: 90 37
	STA ram_00CE                    ;C - - - - - 0x00C147 06:8137: 85 CE
	BNE loc_06_8145                 ;C - - - - - 0x00C149 06:8139: D0 0A
	LDA ram_00D6                    ;C - - - - - 0x00C14B 06:813B: A5 D6
	BPL loc_06_8145                 ;C - - - - - 0x00C14D 06:813D: 10 06
	LDA ram_00C4                    ;c - - - - - 0x00C14F 06:813F: A5 C4
	BMI loc_06_8145                 ;c - - - - - 0x00C151 06:8141: 30 02
	STY ram_00D7                    ;c - - - - - 0x00C153 06:8143: 84 D7
loc_06_8145:
	STY ram_00D6                    ;C - - - - - 0x00C155 06:8145: 84 D6
	ASL ram_00C4                    ;C - - - - - 0x00C157 06:8147: 06 C4
	ROR ram_00D6                    ;C - - - - - 0x00C159 06:8149: 66 D6
	BPL loc_06_814F                 ;C - - - - - 0x00C15B 06:814B: 10 02
	STX ram_00D7                    ;c - - - - - 0x00C15D 06:814D: 86 D7
loc_06_814F:
	INC ptr_C1                      ;C - - - - - 0x00C15F 06:814F: E6 C1
	LDA ptr_C1                      ;C - - - - - 0x00C161 06:8151: A5 C1
	STA ram_00D0                    ;C - - - - - 0x00C163 06:8153: 85 D0
	BNE loc_06_8159                 ;C - - - - - 0x00C165 06:8155: D0 02
	INC ptr_C1+1                    ;c - - - - - 0x00C167 06:8157: E6 C2
loc_06_8159:
	LDA ptr_C1+1                    ;C - - - - - 0x00C169 06:8159: A5 C2
	STA ram_00D1                    ;C - - - - - 0x00C16B 06:815B: 85 D1
	TYA                             ;C - - - - - 0x00C16D 06:815D: 98
	STA ram_00D2                    ;C - - - - - 0x00C16E 06:815E: 85 D2
	STA ram_00D3                    ;C - - - - - 0x00C170 06:8160: 85 D3
	STA ram_00D4                    ;C - - - - - 0x00C172 06:8162: 85 D4
	STA ram_00D5                    ;C - - - - - 0x00C174 06:8164: 85 D5
	LDY #$27                        ;C - - - - - 0x00C176 06:8166: A0 27
loc_06_8168:
	STA ram_0700,Y                  ;C - - - - - 0x00C178 06:8168: 99 00 07
	DEY                             ;C - - - - - 0x00C17B 06:816B: 88
	BPL loc_06_8168                 ;C - - - - - 0x00C17C 06:816C: 10 FA
loc_06_816E:
	RTS                             ;C - - - - - 0x00C17E 06:816E: 60
loc_06_816F:
	LDX #$01                        ;C - - - - - 0x00C17F 06:816F: A2 01
	STX ram_00C9                    ;C - - - - - 0x00C181 06:8171: 86 C9
	LDX #$99                        ;C - - - - - 0x00C183 06:8173: A2 99
	STX ram_00CA                    ;C - - - - - 0x00C185 06:8175: 86 CA
	STA ram_00C8                    ;C - - - - - 0x00C187 06:8177: 85 C8
	STA ram_00CB                    ;C - - - - - 0x00C189 06:8179: 85 CB
	STA ram_00CC                    ;C - - - - - 0x00C18B 06:817B: 85 CC
	STA ram_00CD                    ;C - - - - - 0x00C18D 06:817D: 85 CD
	LDX #$53                        ;C - - - - - 0x00C18F 06:817F: A2 53
loc_06_8181:
	STA ram_0728,X                  ;C - - - - - 0x00C191 06:8181: 9D 28 07
	DEX                             ;C - - - - - 0x00C194 06:8184: CA
	BPL loc_06_8181                 ;C - - - - - 0x00C195 06:8185: 10 FA
	LDX #$03                        ;C - - - - - 0x00C197 06:8187: A2 03
loc_06_8189:
	INC ptr_C1                      ;C - - - - - 0x00C199 06:8189: E6 C1
	BNE loc_06_818F                 ;C - - - - - 0x00C19B 06:818B: D0 02
	INC ptr_C1+1                    ;c - - - - - 0x00C19D 06:818D: E6 C2
loc_06_818F:
	LDY ptr_C1                      ;C - - - - - 0x00C19F 06:818F: A4 C1
	LDA ptr_C1+1                    ;C - - - - - 0x00C1A1 06:8191: A5 C2
	JSR sub_06_803A                 ;C - - - - - 0x00C1A3 06:8193: 20 3A 80
	STA ram_0754,X                  ;C - - - - - 0x00C1A6 06:8196: 9D 54 07
	INC ptr_C1                      ;C - - - - - 0x00C1A9 06:8199: E6 C1
	BNE loc_06_819F                 ;C - - - - - 0x00C1AB 06:819B: D0 02
	INC ptr_C1+1                    ;c - - - - - 0x00C1AD 06:819D: E6 C2
loc_06_819F:
	LDY ptr_C1                      ;C - - - - - 0x00C1AF 06:819F: A4 C1
	LDA ptr_C1+1                    ;C - - - - - 0x00C1B1 06:81A1: A5 C2
	JSR sub_06_803A                 ;C - - - - - 0x00C1B3 06:81A3: 20 3A 80
	STA ram_0750,X                  ;C - - - - - 0x00C1B6 06:81A6: 9D 50 07
	DEX                             ;C - - - - - 0x00C1B9 06:81A9: CA
	BPL loc_06_8189                 ;C - - - - - 0x00C1BA 06:81AA: 10 DD
	BMI sub_06_81F1                 ;C - - - - - 0x00C1BC 06:81AC: 30 43
loc_06_81AE:
	STY ram_00C3                    ;C - - - - - 0x00C1BE 06:81AE: 84 C3
	AND #$07                        ;C - - - - - 0x00C1C0 06:81B0: 29 07
	JSR sub_06_8023                 ;C - - - - - 0x00C1C2 06:81B2: 20 23 80
	.word ofs_06_81C5, loc_06_81C8, sub_06_81E4, ofs_06_821E, ofs_06_8226, $822D, loc_06_8234, $824A;W 0x00C1C5 06:81B5:
ofs_06_81C5:
	JSR sub_06_81E4                 ;C - - J - - 0x00C1D5 06:81C5: 20 E4 81
loc_06_81C8:
	LDA #$00                        ;C - - - - - 0x00C1D8 06:81C8: A9 00
	STA ram_00CE                    ;C - - - - - 0x00C1DA 06:81CA: 85 CE
	STA ram_00D0                    ;C - - - - - 0x00C1DC 06:81CC: 85 D0
	STA ram_00D1                    ;C - - - - - 0x00C1DE 06:81CE: 85 D1
	STA ram_00D7                    ;C - - - - - 0x00C1E0 06:81D0: 85 D7
	STA ram_00D8                    ;C - - - - - 0x00C1E2 06:81D2: 85 D8
sub_06_81D4:
	LDA ram_00CF                    ;C - - - - - 0x00C1E4 06:81D4: A5 CF
	BEQ loc_06_81E3                 ;C - - - - - 0x00C1E6 06:81D6: F0 0B
	EOR #$0F                        ;C - - - - - 0x00C1E8 06:81D8: 49 0F
	STA ram_00CF                    ;C - - - - - 0x00C1EA 06:81DA: 85 CF
	JSR sub_06_81F1                 ;C - - - - - 0x00C1EC 06:81DC: 20 F1 81
	LDA #$00                        ;C - - - - - 0x00C1EF 06:81DF: A9 00
	STA ram_00CF                    ;C - - - - - 0x00C1F1 06:81E1: 85 CF
loc_06_81E3:
	RTS                             ;C - - - - - 0x00C1F3 06:81E3: 60
sub_06_81E4:
	LDA #$00                        ;C - - - - - 0x00C1F4 06:81E4: A9 00
	LDX #$03                        ;C - - - - - 0x00C1F6 06:81E6: A2 03
loc_06_81E8:
	STA ram_0754,X                  ;C - - - - - 0x00C1F8 06:81E8: 9D 54 07
	STA ram_0750,X                  ;C - - - - - 0x00C1FB 06:81EB: 9D 50 07
	DEX                             ;C - - - - - 0x00C1FE 06:81EE: CA
	BPL loc_06_81E8                 ;C - - - - - 0x00C1FF 06:81EF: 10 F7
sub_06_81F1:
	LDA ram_00CF                    ;C - - - - - 0x00C201 06:81F1: A5 CF
	PHA                             ;C - - - - - 0x00C203 06:81F3: 48
	LDX #$03                        ;C - - - - - 0x00C204 06:81F4: A2 03
loc_06_81F6:
	LSR ram_00CF                    ;C - - - - - 0x00C206 06:81F6: 46 CF
	BCS loc_06_820A                 ;C - - - - - 0x00C208 06:81F8: B0 10
	JSR sub_06_80D8                 ;C - - - - - 0x00C20A 06:81FA: 20 D8 80
	LDA ram_0754,X                  ;C - - - - - 0x00C20D 06:81FD: BD 54 07
	ORA ram_0750,X                  ;C - - - - - 0x00C210 06:8200: 1D 50 07
	BEQ loc_06_820A                 ;C - - - - - 0x00C213 06:8203: F0 05
	LDA #$FF                        ;C - - - - - 0x00C215 06:8205: A9 FF
	STA ram_077C,X                  ;C - - - - - 0x00C217 06:8207: 9D 7C 07
loc_06_820A:
	DEX                             ;C - - - - - 0x00C21A 06:820A: CA
	BPL loc_06_81F6                 ;C - - - - - 0x00C21B 06:820B: 10 E9
	PLA                             ;C - - - - - 0x00C21D 06:820D: 68
	STA ram_00CF                    ;C - - - - - 0x00C21E 06:820E: 85 CF
	LDA #$08                        ;C - - - - - 0x00C220 06:8210: A9 08
	STA SQ1_SWEEP                   ;C - - - - - 0x00C222 06:8212: 8D 01 40
	STA SQ2_SWEEP                   ;C - - - - - 0x00C225 06:8215: 8D 05 40
	LDA #$0F                        ;C - - - - - 0x00C228 06:8218: A9 0F
	STA SNDCHN                      ;C - - - - - 0x00C22A 06:821A: 8D 15 40
	RTS                             ;C - - - - - 0x00C22D 06:821D: 60
ofs_06_821E:
	LDA ram_00C0                    ;C - - J - - 0x00C22E 06:821E: A5 C0
	ORA #$02                        ;C - - - - - 0x00C230 06:8220: 09 02
	STA ram_00C0                    ;C - - - - - 0x00C232 06:8222: 85 C0
	BNE sub_06_81F1                 ;C - - - - - 0x00C234 06:8224: D0 CB
ofs_06_8226:
	LDA ram_00C0                    ;C - - J - - 0x00C236 06:8226: A5 C0
	AND #$FD                        ;C - - - - - 0x00C238 06:8228: 29 FD
	STA ram_00C0                    ;C - - - - - 0x00C23A 06:822A: 85 C0
	RTS                             ;C - - - - - 0x00C23C 06:822C: 60
	ASL ram_00C3                    ;c - - - - - 0x00C23D 06:822D: 06 C3
	BEQ loc_06_8234                 ;c - - - - - 0x00C23F 06:822F: F0 03
	SEC                             ;c - - - - - 0x00C241 06:8231: 38
	ROR ram_00C3                    ;c - - - - - 0x00C242 06:8232: 66 C3
loc_06_8234:
	LDA ram_00C0                    ;c - - - - - 0x00C244 06:8234: A5 C0
	AND #$0F                        ;c - - - - - 0x00C246 06:8236: 29 0F
	STA ram_00C0                    ;c - - - - - 0x00C248 06:8238: 85 C0
	LDY ram_00C3                    ;c - - - - - 0x00C24A 06:823A: A4 C3
	STY ram_00CC                    ;c - - - - - 0x00C24C 06:823C: 84 CC
	BEQ loc_06_8247                 ;c - - - - - 0x00C24E 06:823E: F0 07
	LDY #$FF                        ;c - - - - - 0x00C250 06:8240: A0 FF
	CPY ram_00CD                    ;c - - - - - 0x00C252 06:8242: C4 CD
	BNE loc_06_8249                 ;c - - - - - 0x00C254 06:8244: D0 03
	INY                             ;c - - - - - 0x00C256 06:8246: C8
loc_06_8247:
	STY ram_00CD                    ;c - - - - - 0x00C257 06:8247: 84 CD
loc_06_8249:
	RTS                             ;c - - - - - 0x00C259 06:8249: 60
	LDA #$00                        ;c - - - - - 0x00C25A 06:824A: A9 00
	SEC                             ;c - - - - - 0x00C25C 06:824C: 38
	SBC ram_00C3                    ;c - - - - - 0x00C25D 06:824D: E5 C3
	STA ram_00D8                    ;c - - - - - 0x00C25F 06:824F: 85 D8
	RTS                             ;c - - - - - 0x00C261 06:8251: 60
sub_06_8252:
	LDA ram_00D3                    ;C - - - - - 0x00C262 06:8252: A5 D3
	BEQ loc_06_825B                 ;C - - - - - 0x00C264 06:8254: F0 05
	DEC ram_00D3                    ;C - - - - - 0x00C266 06:8256: C6 D3
	DEC ram_00D5                    ;C - - - - - 0x00C268 06:8258: C6 D5
	RTS                             ;C - - - - - 0x00C26A 06:825A: 60
loc_06_825B:
	JSR sub_06_8386                 ;C - - - - - 0x00C26B 06:825B: 20 86 83
	STA ram_00C4                    ;C - - - - - 0x00C26E 06:825E: 85 C4
	ASL A                           ;C - - - - - 0x00C270 06:8260: 0A
	BCC loc_06_8273                 ;C - - - - - 0x00C271 06:8261: 90 10
	STY ram_00CE                    ;C - - - - - 0x00C273 06:8263: 84 CE
	LDA ram_00D7                    ;C - - - - - 0x00C275 06:8265: A5 D7
	LSR A                           ;C - - - - - 0x00C277 06:8267: 4A
	BCC loc_06_8270                 ;C - - - - - 0x00C278 06:8268: 90 06
	JSR sub_06_8118                 ;c - - - - - 0x00C27A 06:826A: 20 18 81
	JMP loc_06_825B                 ;c - - - - - 0x00C27D 06:826D: 4C 5B 82
loc_06_8270:
	JMP loc_06_81C8                 ;C - - - - - 0x00C280 06:8270: 4C C8 81
loc_06_8273:
	LSR ram_00C4                    ;C - - - - - 0x00C283 06:8273: 46 C4
	BCC loc_06_82A6                 ;C - - - - - 0x00C285 06:8275: 90 2F
	JSR sub_06_8386                 ;C - - - - - 0x00C287 06:8277: 20 86 83
	ASL A                           ;C - - - - - 0x00C28A 06:827A: 0A
	BEQ loc_06_8289                 ;C - - - - - 0x00C28B 06:827B: F0 0C
	ASL ram_00D6                    ;C - - - - - 0x00C28D 06:827D: 06 D6
	PHP                             ;C - - - - - 0x00C28F 06:827F: 08
	CMP ram_00D6                    ;C - - - - - 0x00C290 06:8280: C5 D6
	BEQ loc_06_8296                 ;C - - - - - 0x00C292 06:8282: F0 12
	PLP                             ;C - - - - - 0x00C294 06:8284: 28
	ROR ram_00D6                    ;C - - - - - 0x00C295 06:8285: 66 D6
	INC ram_00D6                    ;C - - - - - 0x00C297 06:8287: E6 D6
loc_06_8289:
	JSR sub_06_8386                 ;C - - - - - 0x00C299 06:8289: 20 86 83
	TAX                             ;C - - - - - 0x00C29C 06:828C: AA
	JSR sub_06_8386                 ;C - - - - - 0x00C29D 06:828D: 20 86 83
	STA ram_00D0                    ;C - - - - - 0x00C2A0 06:8290: 85 D0
	STX ram_00D1                    ;C - - - - - 0x00C2A2 06:8292: 86 D1
	BNE loc_06_825B                 ;C - - - - - 0x00C2A4 06:8294: D0 C5
loc_06_8296:
	TYA                             ;C - - - - - 0x00C2A6 06:8296: 98
	PLP                             ;C - - - - - 0x00C2A7 06:8297: 28
	ROR A                           ;C - - - - - 0x00C2A8 06:8298: 6A
	STA ram_00D6                    ;C - - - - - 0x00C2A9 06:8299: 85 D6
	CLC                             ;C - - - - - 0x00C2AB 06:829B: 18
	LDA #$02                        ;C - - - - - 0x00C2AC 06:829C: A9 02
	ADC ram_00D0                    ;C - - - - - 0x00C2AE 06:829E: 65 D0
	STA ram_00D0                    ;C - - - - - 0x00C2B0 06:82A0: 85 D0
	BCC loc_06_82A6                 ;C - - - - - 0x00C2B2 06:82A2: 90 02
	INC ram_00D1                    ;c - - - - - 0x00C2B4 06:82A4: E6 D1
loc_06_82A6:
	LSR ram_00C4                    ;C - - - - - 0x00C2B6 06:82A6: 46 C4
	BCC loc_06_82AF                 ;C - - - - - 0x00C2B8 06:82A8: 90 05
	JSR sub_06_8386                 ;C - - - - - 0x00C2BA 06:82AA: 20 86 83
	STA ram_00D4                    ;C - - - - - 0x00C2BD 06:82AD: 85 D4
loc_06_82AF:
	LSR ram_00C4                    ;C - - - - - 0x00C2BF 06:82AF: 46 C4
	BCC loc_06_82B8                 ;C - - - - - 0x00C2C1 06:82B1: 90 05
	JSR sub_06_8386                 ;c - - - - - 0x00C2C3 06:82B3: 20 86 83
	STA ram_00D2                    ;c - - - - - 0x00C2C6 06:82B6: 85 D2
loc_06_82B8:
	JSR sub_06_8386                 ;C - - - - - 0x00C2C8 06:82B8: 20 86 83
	STA ram_00D3                    ;C - - - - - 0x00C2CB 06:82BB: 85 D3
	STA ptr_C1                      ;C - - - - - 0x00C2CD 06:82BD: 85 C1
	LDA ram_00D4                    ;C - - - - - 0x00C2CF 06:82BF: A5 D4
	STA ram_00C4                    ;C - - - - - 0x00C2D1 06:82C1: 85 C4
	JSR sub_06_8006                 ;C - - - - - 0x00C2D3 06:82C3: 20 06 80
	LDY ptr_C1                      ;C - - - - - 0x00C2D6 06:82C6: A4 C1
	INY                             ;C - - - - - 0x00C2D8 06:82C8: C8
	STY ram_00D5                    ;C - - - - - 0x00C2D9 06:82C9: 84 D5
	INC ram_00C0                    ;C - - - - - 0x00C2DB 06:82CB: E6 C0
	JSR sub_06_8386                 ;C - - - - - 0x00C2DD 06:82CD: 20 86 83
	PHA                             ;C - - - - - 0x00C2E0 06:82D0: 48
	EOR ram_00CF                    ;C - - - - - 0x00C2E1 06:82D1: 45 CF
	BEQ loc_06_82DA                 ;C - - - - - 0x00C2E3 06:82D3: F0 05
	STA ram_00CF                    ;C - - - - - 0x00C2E5 06:82D5: 85 CF
	JSR sub_06_81D4                 ;C - - - - - 0x00C2E7 06:82D7: 20 D4 81
loc_06_82DA:
	PLA                             ;C - - - - - 0x00C2EA 06:82DA: 68
	STA ram_00CF                    ;C - - - - - 0x00C2EB 06:82DB: 85 CF
	RTS                             ;C - - - - - 0x00C2ED 06:82DD: 60
sub_06_82DE:
	LDY ram_0700,X                  ;C - - - - - 0x00C2EE 06:82DE: BC 00 07
	BEQ loc_06_82E6                 ;C - - - - - 0x00C2F1 06:82E1: F0 03
	JSR sub_06_8684                 ;C - - - - - 0x00C2F3 06:82E3: 20 84 86
loc_06_82E6:
	LDA ram_00C0                    ;C - - - - - 0x00C2F6 06:82E6: A5 C0
	LSR A                           ;C - - - - - 0x00C2F8 06:82E8: 4A
	BCS loc_06_830A                 ;C - - - - - 0x00C2F9 06:82E9: B0 1F
	JSR sub_06_86BA                 ;C - - - - - 0x00C2FB 06:82EB: 20 BA 86
	LDA ram_00D3                    ;C - - - - - 0x00C2FE 06:82EE: A5 D3
	BEQ loc_06_82FA                 ;C - - - - - 0x00C300 06:82F0: F0 08
	CPX #$01                        ;C - - - - - 0x00C302 06:82F2: E0 01
	BEQ loc_06_82FB                 ;C - - - - - 0x00C304 06:82F4: F0 05
	LDA ram_00D5                    ;C - - - - - 0x00C306 06:82F6: A5 D5
	BEQ loc_06_8300                 ;C - - - - - 0x00C308 06:82F8: F0 06
loc_06_82FA:
	RTS                             ;C - - - - - 0x00C30A 06:82FA: 60
loc_06_82FB:
	DEC ram_0710,X                  ;C - - - - - 0x00C30B 06:82FB: DE 10 07
	BNE loc_06_82FA                 ;C - - - - - 0x00C30E 06:82FE: D0 FA
loc_06_8300:
	LDA ram_0704,X                  ;C - - - - - 0x00C310 06:8300: BD 04 07
	AND #$04                        ;C - - - - - 0x00C313 06:8303: 29 04
	BNE loc_06_82FA                 ;C - - - - - 0x00C315 06:8305: D0 F3
	JMP sub_06_85A3                 ;C - - - - - 0x00C317 06:8307: 4C A3 85
loc_06_830A:
	LDA #$00                        ;C - - - - - 0x00C31A 06:830A: A9 00
	STA ram_00C4                    ;C - - - - - 0x00C31C 06:830C: 85 C4
	JSR sub_06_8386                 ;C - - - - - 0x00C31E 06:830E: 20 86 83
loc_06_8311:
	LSR A                           ;C - - - - - 0x00C321 06:8311: 4A
	BCC loc_06_8320                 ;C - - - - - 0x00C322 06:8312: 90 0C
	PHA                             ;C - - - - - 0x00C324 06:8314: 48
	JSR sub_06_8386                 ;C - - - - - 0x00C325 06:8315: 20 86 83
	STA ram_00C3                    ;C - - - - - 0x00C328 06:8318: 85 C3
	LDA ram_00C4                    ;C - - - - - 0x00C32A 06:831A: A5 C4
	JSR sub_06_8326                 ;C - - - - - 0x00C32C 06:831C: 20 26 83
	PLA                             ;C - - - - - 0x00C32F 06:831F: 68
loc_06_8320:
	BEQ loc_06_8333                 ;C - - - - - 0x00C330 06:8320: F0 11
	INC ram_00C4                    ;C - - - - - 0x00C332 06:8322: E6 C4
	BNE loc_06_8311                 ;C - - - - - 0x00C334 06:8324: D0 EB
sub_06_8326:
	JSR sub_06_8023                 ;C - - - - - 0x00C336 06:8326: 20 23 80
	.word ofs_06_866F, ofs_06_86AD, ofs_06_865A, ofs_06_86A7, ofs_06_86A1;W 0x00C339 06:8329:
loc_06_8333:
	JSR sub_06_8386                 ;C - - - - - 0x00C343 06:8333: 20 86 83
	TAY                             ;C - - - - - 0x00C346 06:8336: A8
	BNE loc_06_8349                 ;C - - - - - 0x00C347 06:8337: D0 10
	STA ram_0710,X                  ;C - - - - - 0x00C349 06:8339: 9D 10 07
	LDA ram_0704,X                  ;C - - - - - 0x00C34C 06:833C: BD 04 07
	AND #$F8                        ;C - - - - - 0x00C34F 06:833F: 29 F8
	ORA #$04                        ;C - - - - - 0x00C351 06:8341: 09 04
	STA ram_0704,X                  ;C - - - - - 0x00C353 06:8343: 9D 04 07
	JMP sub_06_80D8                 ;C - - - - - 0x00C356 06:8346: 4C D8 80
loc_06_8349:
	LDA ram_0704,X                  ;C - - - - - 0x00C359 06:8349: BD 04 07
	ORA #$20                        ;C - - - - - 0x00C35C 06:834C: 09 20
	STA ram_0704,X                  ;C - - - - - 0x00C35E 06:834E: 9D 04 07
	LDA ram_0718,X                  ;C - - - - - 0x00C361 06:8351: BD 18 07
	ASL A                           ;C - - - - - 0x00C364 06:8354: 0A
	LDA #$54                        ;C - - - - - 0x00C365 06:8355: A9 54
	BCS loc_06_835B                 ;C - - - - - 0x00C367 06:8357: B0 02
	LDA #$0A                        ;C - - - - - 0x00C369 06:8359: A9 0A
loc_06_835B:
	STA ram_071C,X                  ;C - - - - - 0x00C36B 06:835B: 9D 1C 07
	TYA                             ;C - - - - - 0x00C36E 06:835E: 98
	BPL loc_06_836B                 ;C - - - - - 0x00C36F 06:835F: 10 0A
	CPX #$01                        ;C - - - - - 0x00C371 06:8361: E0 01
	BNE loc_06_8368                 ;C - - - - - 0x00C373 06:8363: D0 03
	JSR sub_06_85AE                 ;c - - - - - 0x00C375 06:8365: 20 AE 85
loc_06_8368:
	JMP sub_06_8644                 ;C - - - - - 0x00C378 06:8368: 4C 44 86
loc_06_836B:
	JSR sub_06_85AE                 ;C - - - - - 0x00C37B 06:836B: 20 AE 85
	LDA #$FF                        ;C - - - - - 0x00C37E 06:836E: A9 FF
	STA ram_077C,X                  ;C - - - - - 0x00C380 06:8370: 9D 7C 07
	DEY                             ;C - - - - - 0x00C383 06:8373: 88
	TXA                             ;C - - - - - 0x00C384 06:8374: 8A
	BNE loc_06_837F                 ;C - - - - - 0x00C385 06:8375: D0 08
	STA ram_00C3                    ;C - - - - - 0x00C387 06:8377: 85 C3
	TYA                             ;C - - - - - 0x00C389 06:8379: 98
	EOR #$0F                        ;C - - - - - 0x00C38A 06:837A: 49 0F
	JMP sub_06_8636                 ;C - - - - - 0x00C38C 06:837C: 4C 36 86
loc_06_837F:
	TYA                             ;C - - - - - 0x00C38F 06:837F: 98
	CLC                             ;C - - - - - 0x00C390 06:8380: 18
	ADC ram_00D2                    ;C - - - - - 0x00C391 06:8381: 65 D2
	JMP sub_06_85DE                 ;C - - - - - 0x00C393 06:8383: 4C DE 85
sub_06_8386:
	LDY ram_00D0                    ;C - - - - - 0x00C396 06:8386: A4 D0
	LDA ram_00D1                    ;C - - - - - 0x00C398 06:8388: A5 D1
	INC ram_00D0                    ;C - - - - - 0x00C39A 06:838A: E6 D0
	BNE loc_06_8390                 ;C - - - - - 0x00C39C 06:838C: D0 02
	INC ram_00D1                    ;C - - - - - 0x00C39E 06:838E: E6 D1
loc_06_8390:
	JMP sub_06_803A                 ;C - - - - - 0x00C3A0 06:8390: 4C 3A 80
sub_06_8393:
	TXA                             ;C - - - - - 0x00C3A3 06:8393: 8A
	ORA #$28                        ;C - - - - - 0x00C3A4 06:8394: 09 28
	TAX                             ;C - - - - - 0x00C3A6 06:8396: AA
	LDA ram_0728,X                  ;C - - - - - 0x00C3A7 06:8397: BD 28 07
	ORA ram_072C,X                  ;C - - - - - 0x00C3AA 06:839A: 1D 2C 07
	BEQ loc_06_83CC                 ;C - - - - - 0x00C3AD 06:839D: F0 2D
	LDA ram_0738,X                  ;C - - - - - 0x00C3AF 06:839F: BD 38 07
	BEQ loc_06_83CD                 ;C - - - - - 0x00C3B2 06:83A2: F0 29
	LDY ram_0700,X                  ;C - - - - - 0x00C3B4 06:83A4: BC 00 07
	BEQ loc_06_83AF                 ;C - - - - - 0x00C3B7 06:83A7: F0 06
	JSR sub_06_8684                 ;C - - - - - 0x00C3B9 06:83A9: 20 84 86
	JSR sub_06_86BA                 ;C - - - - - 0x00C3BC 06:83AC: 20 BA 86
loc_06_83AF:
	LDA ram_0740,X                  ;C - - - - - 0x00C3BF 06:83AF: BD 40 07
	SEC                             ;C - - - - - 0x00C3C2 06:83B2: 38
	SBC ram_00C7                    ;C - - - - - 0x00C3C3 06:83B3: E5 C7
	STA ram_0740,X                  ;C - - - - - 0x00C3C5 06:83B5: 9D 40 07
	BEQ loc_06_83BC                 ;C - - - - - 0x00C3C8 06:83B8: F0 02
	BCS loc_06_83BF                 ;C - - - - - 0x00C3CA 06:83BA: B0 03
loc_06_83BC:
	JSR sub_06_85A3                 ;C - - - - - 0x00C3CC 06:83BC: 20 A3 85
loc_06_83BF:
	LDA ram_0738,X                  ;C - - - - - 0x00C3CF 06:83BF: BD 38 07
	SEC                             ;C - - - - - 0x00C3D2 06:83C2: 38
	SBC ram_00C7                    ;C - - - - - 0x00C3D3 06:83C3: E5 C7
	STA ram_0738,X                  ;C - - - - - 0x00C3D5 06:83C5: 9D 38 07
	BEQ loc_06_83CD                 ;C - - - - - 0x00C3D8 06:83C8: F0 03
	BCC loc_06_83CD                 ;C - - - - - 0x00C3DA 06:83CA: 90 01
loc_06_83CC:
	RTS                             ;C - - - - - 0x00C3DC 06:83CC: 60
loc_06_83CD:
	JSR sub_06_8592                 ;C - - - - - 0x00C3DD 06:83CD: 20 92 85
	CMP #$20                        ;C - - - - - 0x00C3E0 06:83D0: C9 20
	BCS loc_06_83DA                 ;C - - - - - 0x00C3E2 06:83D2: B0 06
	JSR sub_06_8497                 ;C - - - - - 0x00C3E4 06:83D4: 20 97 84
	JMP loc_06_83CD                 ;C - - - - - 0x00C3E7 06:83D7: 4C CD 83
loc_06_83DA:
	PHA                             ;C - - - - - 0x00C3EA 06:83DA: 48
	ROL A                           ;C - - - - - 0x00C3EB 06:83DB: 2A
	ROL A                           ;C - - - - - 0x00C3EC 06:83DC: 2A
	ROL A                           ;C - - - - - 0x00C3ED 06:83DD: 2A
	ROL A                           ;C - - - - - 0x00C3EE 06:83DE: 2A
	AND #$07                        ;C - - - - - 0x00C3EF 06:83DF: 29 07
	TAY                             ;C - - - - - 0x00C3F1 06:83E1: A8
	DEY                             ;C - - - - - 0x00C3F2 06:83E2: 88
	LDA ram_0730,X                  ;C - - - - - 0x00C3F3 06:83E3: BD 30 07
	ASL A                           ;C - - - - - 0x00C3F6 06:83E6: 0A
	ASL A                           ;C - - - - - 0x00C3F7 06:83E7: 0A
	BPL loc_06_83EF                 ;C - - - - - 0x00C3F8 06:83E8: 10 05
	LDA tbl_06_8915,Y               ;C - - - - - 0x00C3FA 06:83EA: B9 15 89
	BNE loc_06_8406                 ;C - - - - - 0x00C3FD 06:83ED: D0 17
loc_06_83EF:
	ASL A                           ;C - - - - - 0x00C3FF 06:83EF: 0A
	ASL A                           ;C - - - - - 0x00C400 06:83F0: 0A
	LDA tbl_06_891C,Y               ;C - - - - - 0x00C401 06:83F1: B9 1C 89
	BCC loc_06_8406                 ;C - - - - - 0x00C404 06:83F4: 90 10
	STA ram_00C3                    ;C - - - - - 0x00C406 06:83F6: 85 C3
	LDA ram_0730,X                  ;C - - - - - 0x00C408 06:83F8: BD 30 07
	AND #$EF                        ;C - - - - - 0x00C40B 06:83FB: 29 EF
	STA ram_0730,X                  ;C - - - - - 0x00C40D 06:83FD: 9D 30 07
	LDA ram_00C3                    ;C - - - - - 0x00C410 06:8400: A5 C3
	LSR A                           ;C - - - - - 0x00C412 06:8402: 4A
	CLC                             ;C - - - - - 0x00C413 06:8403: 18
	ADC ram_00C3                    ;C - - - - - 0x00C414 06:8404: 65 C3
loc_06_8406:
	CLC                             ;C - - - - - 0x00C416 06:8406: 18
	ADC ram_0738,X                  ;C - - - - - 0x00C417 06:8407: 7D 38 07
	STA ram_0738,X                  ;C - - - - - 0x00C41A 06:840A: 9D 38 07
	TAY                             ;C - - - - - 0x00C41D 06:840D: A8
	PLA                             ;C - - - - - 0x00C41E 06:840E: 68
	AND #$1F                        ;C - - - - - 0x00C41F 06:840F: 29 1F
	BNE loc_06_8419                 ;C - - - - - 0x00C421 06:8411: D0 06
	JSR sub_06_85A3                 ;C - - - - - 0x00C423 06:8413: 20 A3 85
	JMP loc_06_8491                 ;C - - - - - 0x00C426 06:8416: 4C 91 84
loc_06_8419:
	PHA                             ;C - - - - - 0x00C429 06:8419: 48
	STY ram_00C4                    ;C - - - - - 0x00C42A 06:841A: 84 C4
	LDA ram_073C,X                  ;C - - - - - 0x00C42C 06:841C: BD 3C 07
	STA ptr_C1                      ;C - - - - - 0x00C42F 06:841F: 85 C1
	JSR sub_06_8006                 ;C - - - - - 0x00C431 06:8421: 20 06 80
	LDA ptr_C1                      ;C - - - - - 0x00C434 06:8424: A5 C1
	BNE loc_06_842A                 ;C - - - - - 0x00C436 06:8426: D0 02
	LDA #$01                        ;c - - - - - 0x00C438 06:8428: A9 01
loc_06_842A:
	STA ram_0740,X                  ;C - - - - - 0x00C43A 06:842A: 9D 40 07
	PLA                             ;C - - - - - 0x00C43D 06:842D: 68
	TAY                             ;C - - - - - 0x00C43E 06:842E: A8
	DEY                             ;C - - - - - 0x00C43F 06:842F: 88
	LDA ram_0730,X                  ;C - - - - - 0x00C440 06:8430: BD 30 07
	BPL loc_06_8440                 ;C - - - - - 0x00C443 06:8433: 10 0B
	LDA ram_0718,X                  ;C - - - - - 0x00C445 06:8435: BD 18 07
	BNE loc_06_8454                 ;C - - - - - 0x00C448 06:8438: D0 1A
	JSR sub_06_8644                 ;C - - - - - 0x00C44A 06:843A: 20 44 86
	JMP loc_06_847E                 ;C - - - - - 0x00C44D 06:843D: 4C 7E 84
loc_06_8440:
	JSR sub_06_85AE                 ;C - - - - - 0x00C450 06:8440: 20 AE 85
	LDA ram_00CF                    ;C - - - - - 0x00C453 06:8443: A5 CF
	BMI loc_06_8454                 ;C - - - - - 0x00C455 06:8445: 30 0D
	STY ram_00C3                    ;C - - - - - 0x00C457 06:8447: 84 C3
	TXA                             ;C - - - - - 0x00C459 06:8449: 8A
	AND #$03                        ;C - - - - - 0x00C45A 06:844A: 29 03
	TAY                             ;C - - - - - 0x00C45C 06:844C: A8
	LDA #$FF                        ;C - - - - - 0x00C45D 06:844D: A9 FF
	STA ram_077C,Y                  ;C - - - - - 0x00C45F 06:844F: 99 7C 07
	LDY ram_00C3                    ;C - - - - - 0x00C462 06:8452: A4 C3
loc_06_8454:
	TXA                             ;C - - - - - 0x00C464 06:8454: 8A
	AND #$03                        ;C - - - - - 0x00C465 06:8455: 29 03
	BNE loc_06_8466                 ;C - - - - - 0x00C467 06:8457: D0 0D
	STA ram_00C3                    ;C - - - - - 0x00C469 06:8459: 85 C3
	TYA                             ;C - - - - - 0x00C46B 06:845B: 98
	AND #$0F                        ;C - - - - - 0x00C46C 06:845C: 29 0F
	EOR #$0F                        ;C - - - - - 0x00C46E 06:845E: 49 0F
	JSR sub_06_8636                 ;C - - - - - 0x00C470 06:8460: 20 36 86
	JMP loc_06_847E                 ;C - - - - - 0x00C473 06:8463: 4C 7E 84
loc_06_8466:
	STY ram_00C3                    ;C - - - - - 0x00C476 06:8466: 84 C3
	LDA ram_0730,X                  ;C - - - - - 0x00C478 06:8468: BD 30 07
	AND #$0F                        ;C - - - - - 0x00C47B 06:846B: 29 0F
	TAY                             ;C - - - - - 0x00C47D 06:846D: A8
	LDA tbl_06_8923,Y               ;C - - - - - 0x00C47E 06:846E: B9 23 89
	CLC                             ;C - - - - - 0x00C481 06:8471: 18
	ADC ram_00C3                    ;C - - - - - 0x00C482 06:8472: 65 C3
	CLC                             ;C - - - - - 0x00C484 06:8474: 18
	ADC ram_00CB                    ;C - - - - - 0x00C485 06:8475: 65 CB
	CLC                             ;C - - - - - 0x00C487 06:8477: 18
	ADC ram_0734,X                  ;C - - - - - 0x00C488 06:8478: 7D 34 07
	JSR sub_06_85DE                 ;C - - - - - 0x00C48B 06:847B: 20 DE 85
loc_06_847E:
	LDA ram_0730,X                  ;C - - - - - 0x00C48E 06:847E: BD 30 07
	TAY                             ;C - - - - - 0x00C491 06:8481: A8
	AND #$40                        ;C - - - - - 0x00C492 06:8482: 29 40
	ASL A                           ;C - - - - - 0x00C494 06:8484: 0A
	STA ram_00C4                    ;C - - - - - 0x00C495 06:8485: 85 C4
	TYA                             ;C - - - - - 0x00C497 06:8487: 98
	AND #$7F                        ;C - - - - - 0x00C498 06:8488: 29 7F
	ORA ram_00C4                    ;C - - - - - 0x00C49A 06:848A: 05 C4
	STA ram_0730,X                  ;C - - - - - 0x00C49C 06:848C: 9D 30 07
	BPL loc_06_8496                 ;C - - - - - 0x00C49F 06:848F: 10 05
loc_06_8491:
	LDA #$FF                        ;C - - - - - 0x00C4A1 06:8491: A9 FF
	STA ram_0740,X                  ;C - - - - - 0x00C4A3 06:8493: 9D 40 07
loc_06_8496:
	RTS                             ;C - - - - - 0x00C4A6 06:8496: 60
sub_06_8497:
	CMP #$04                        ;C - - - - - 0x00C4A7 06:8497: C9 04
	BCC loc_06_84A4                 ;C - - - - - 0x00C4A9 06:8499: 90 09
	STA ram_00C4                    ;C - - - - - 0x00C4AB 06:849B: 85 C4
	JSR sub_06_8592                 ;C - - - - - 0x00C4AD 06:849D: 20 92 85
	STA ram_00C3                    ;C - - - - - 0x00C4B0 06:84A0: 85 C3
	LDA ram_00C4                    ;C - - - - - 0x00C4B2 06:84A2: A5 C4
loc_06_84A4:
	JSR sub_06_8023                 ;C - - - - - 0x00C4B4 06:84A4: 20 23 80
	.word ofs_06_84D9, ofs_06_84DD, ofs_06_84E1, ofs_06_84E8, sub_06_8575, ofs_06_84F1, ofs_06_84FF, ofs_06_865A;W 0x00C4B7 06:84A7:
	.word ofs_06_866F, ofs_06_8505, ofs_06_8510, ofs_06_8515, ofs_06_86A1, ofs_06_86A7, ofs_06_851B, ofs_06_851F;W 0x00C4C7 06:84B7:
	.word ofs_06_8523, ofs_06_8527, ofs_06_851B, ofs_06_851F, ofs_06_8523, ofs_06_8527, $855A, ofs_06_8580;W 0x00C4D7 06:84C7:
	.word ofs_06_86AD               ;W 0x00C4E7 06:84D7:
ofs_06_84D9:
	LDA #$20                        ;C - - J - - 0x00C4E9 06:84D9: A9 20
	BNE loc_06_84EA                 ;C - - - - - 0x00C4EB 06:84DB: D0 0D
ofs_06_84DD:
	LDA #$40                        ;C - - J - - 0x00C4ED 06:84DD: A9 40
	BNE loc_06_84EA                 ;C - - - - - 0x00C4EF 06:84DF: D0 09
ofs_06_84E1:
	LDA #$10                        ;C - - J - - 0x00C4F1 06:84E1: A9 10
	ORA ram_0730,X                  ;C - - - - - 0x00C4F3 06:84E3: 1D 30 07
	BNE loc_06_84ED                 ;C - - - - - 0x00C4F6 06:84E6: D0 05
ofs_06_84E8:
	LDA #$08                        ;C - - J - - 0x00C4F8 06:84E8: A9 08
loc_06_84EA:
	EOR ram_0730,X                  ;C - - - - - 0x00C4FA 06:84EA: 5D 30 07
loc_06_84ED:
	STA ram_0730,X                  ;C - - - - - 0x00C4FD 06:84ED: 9D 30 07
	RTS                             ;C - - - - - 0x00C500 06:84F0: 60
ofs_06_84F1:
	LDA #$00                        ;C - - J - - 0x00C501 06:84F1: A9 00
	STA ram_00C8                    ;C - - - - - 0x00C503 06:84F3: 85 C8
	JSR sub_06_8592                 ;C - - - - - 0x00C505 06:84F5: 20 92 85
	LDY ram_00C3                    ;C - - - - - 0x00C508 06:84F8: A4 C3
	STA ram_00CA                    ;C - - - - - 0x00C50A 06:84FA: 85 CA
	STY ram_00C9                    ;C - - - - - 0x00C50C 06:84FC: 84 C9
	RTS                             ;C - - - - - 0x00C50E 06:84FE: 60
ofs_06_84FF:
	LDA ram_00C3                    ;C - - J - - 0x00C50F 06:84FF: A5 C3
	STA ram_073C,X                  ;C - - - - - 0x00C511 06:8501: 9D 3C 07
	RTS                             ;C - - - - - 0x00C514 06:8504: 60
ofs_06_8505:
	LDA ram_0730,X                  ;C - - J - - 0x00C515 06:8505: BD 30 07
	AND #$F8                        ;C - - - - - 0x00C518 06:8508: 29 F8
	ORA ram_00C3                    ;C - - - - - 0x00C51A 06:850A: 05 C3
	STA ram_0730,X                  ;C - - - - - 0x00C51C 06:850C: 9D 30 07
	RTS                             ;C - - - - - 0x00C51F 06:850F: 60
ofs_06_8510:
	LDA ram_00C3                    ;C - - J - - 0x00C520 06:8510: A5 C3
	STA ram_00CB                    ;C - - - - - 0x00C522 06:8512: 85 CB
	RTS                             ;C - - - - - 0x00C524 06:8514: 60
ofs_06_8515:
	LDA ram_00C3                    ;C - - J - - 0x00C525 06:8515: A5 C3
	STA ram_0734,X                  ;C - - - - - 0x00C527 06:8517: 9D 34 07
	RTS                             ;C - - - - - 0x00C52A 06:851A: 60
ofs_06_851B:
	LDA #$00                        ;C - - J - - 0x00C52B 06:851B: A9 00
	BEQ loc_06_8529                 ;C - - - - - 0x00C52D 06:851D: F0 0A
ofs_06_851F:
	LDA #$04                        ;C - - J - - 0x00C52F 06:851F: A9 04
	BNE loc_06_8529                 ;C - - - - - 0x00C531 06:8521: D0 06
ofs_06_8523:
	LDA #$08                        ;C - - J - - 0x00C533 06:8523: A9 08
	BNE loc_06_8529                 ;C - - - - - 0x00C535 06:8525: D0 02
ofs_06_8527:
	LDA #$0C                        ;C - - J - - 0x00C537 06:8527: A9 0C
loc_06_8529:
	STA ptr_C1+1                    ;C - - - - - 0x00C539 06:8529: 85 C2
	TXA                             ;C - - - - - 0x00C53B 06:852B: 8A
	CLC                             ;C - - - - - 0x00C53C 06:852C: 18
	ADC ptr_C1+1                    ;C - - - - - 0x00C53D 06:852D: 65 C2
	TAY                             ;C - - - - - 0x00C53F 06:852F: A8
	LDA ram_00C4                    ;C - - - - - 0x00C540 06:8530: A5 C4
	CMP #$12                        ;C - - - - - 0x00C542 06:8532: C9 12
	BCS loc_06_8547                 ;C - - - - - 0x00C544 06:8534: B0 11
	LDA ram_0744,Y                  ;C - - - - - 0x00C546 06:8536: B9 44 07
	SEC                             ;C - - - - - 0x00C549 06:8539: 38
	SBC #$01                        ;C - - - - - 0x00C54A 06:853A: E9 01
	BCS loc_06_8540                 ;C - - - - - 0x00C54C 06:853C: B0 02
	LDA ram_00C3                    ;C - - - - - 0x00C54E 06:853E: A5 C3
loc_06_8540:
	STA ram_0744,Y                  ;C - - - - - 0x00C550 06:8540: 99 44 07
	BEQ loc_06_8566                 ;C - - - - - 0x00C553 06:8543: F0 21
	BNE loc_06_8555                 ;C - - - - - 0x00C555 06:8545: D0 0E
loc_06_8547:
	LDA ram_0744,Y                  ;C - - - - - 0x00C557 06:8547: B9 44 07
	SEC                             ;C - - - - - 0x00C55A 06:854A: 38
	SBC #$01                        ;C - - - - - 0x00C55B 06:854B: E9 01
	BNE loc_06_8566                 ;C - - - - - 0x00C55D 06:854D: D0 17
	STA ram_0744,Y                  ;C - - - - - 0x00C55F 06:854F: 99 44 07
	JSR sub_06_8575                 ;C - - - - - 0x00C562 06:8552: 20 75 85
loc_06_8555:
	JSR sub_06_8592                 ;C - - - - - 0x00C565 06:8555: 20 92 85
	STA ram_00C3                    ;C - - - - - 0x00C568 06:8558: 85 C3
	JSR sub_06_8592                 ;C - - - - - 0x00C56A 06:855A: 20 92 85
	STA ram_0728,X                  ;C - - - - - 0x00C56D 06:855D: 9D 28 07
	LDA ram_00C3                    ;C - - - - - 0x00C570 06:8560: A5 C3
	STA ram_072C,X                  ;C - - - - - 0x00C572 06:8562: 9D 2C 07
	RTS                             ;C - - - - - 0x00C575 06:8565: 60
loc_06_8566:
	LDA #$02                        ;C - - - - - 0x00C576 06:8566: A9 02
	CLC                             ;C - - - - - 0x00C578 06:8568: 18
	ADC ram_0728,X                  ;C - - - - - 0x00C579 06:8569: 7D 28 07
	STA ram_0728,X                  ;C - - - - - 0x00C57C 06:856C: 9D 28 07
	BCC loc_06_8574                 ;C - - - - - 0x00C57F 06:856F: 90 03
	INC ram_072C,X                  ;C - - - - - 0x00C581 06:8571: FE 2C 07
loc_06_8574:
	RTS                             ;C - - - - - 0x00C584 06:8574: 60
sub_06_8575:
	LDA ram_0730,X                  ;C - - J - - 0x00C585 06:8575: BD 30 07
	AND #$97                        ;C - - - - - 0x00C588 06:8578: 29 97
	ORA ram_00C3                    ;C - - - - - 0x00C58A 06:857A: 05 C3
	STA ram_0730,X                  ;C - - - - - 0x00C58C 06:857C: 9D 30 07
	RTS                             ;C - - - - - 0x00C58F 06:857F: 60
ofs_06_8580:
	PLA                             ;C - - J - - 0x00C590 06:8580: 68
	PLA                             ;C - - - - - 0x00C591 06:8581: 68
	LDA #$00                        ;C - - - - - 0x00C592 06:8582: A9 00
ofs_06_8584:
	STA ram_0728,X                  ;C - - - - - 0x00C594 06:8584: 9D 28 07
	STA ram_072C,X                  ;C - - - - - 0x00C597 06:8587: 9D 2C 07
ofs_06_858A:
	LDA ram_00CF                    ;C - - - - - 0x00C59A 06:858A: A5 CF
	BMI loc_06_8591                 ;C - - - - - 0x00C59C 06:858C: 30 03
	JMP sub_06_80D8                 ;C - - - - - 0x00C59E 06:858E: 4C D8 80
loc_06_8591:
	RTS                             ;C - - - - - 0x00C5A1 06:8591: 60
sub_06_8592:
	LDY ram_0728,X                  ;C - - - - - 0x00C5A2 06:8592: BC 28 07
	LDA ram_072C,X                  ;C - - - - - 0x00C5A5 06:8595: BD 2C 07
	INC ram_0728,X                  ;C - - - - - 0x00C5A8 06:8598: FE 28 07
	BNE loc_06_85A0                 ;C - - - - - 0x00C5AB 06:859B: D0 03
	INC ram_072C,X                  ;C - - - - - 0x00C5AD 06:859D: FE 2C 07
loc_06_85A0:
	JMP sub_06_803A                 ;C - - - - - 0x00C5B0 06:85A0: 4C 3A 80
sub_06_85A3:
	LDA ram_0704,X                  ;C - - - - - 0x00C5B3 06:85A3: BD 04 07
	AND #$F8                        ;C - - - - - 0x00C5B6 06:85A6: 29 F8
	ORA #$03                        ;C - - - - - 0x00C5B8 06:85A8: 09 03
	STA ram_0704,X                  ;C - - - - - 0x00C5BA 06:85AA: 9D 04 07
	RTS                             ;C - - - - - 0x00C5BD 06:85AD: 60
sub_06_85AE:
	TYA                             ;C - - - - - 0x00C5BE 06:85AE: 98
	PHA                             ;C - - - - - 0x00C5BF 06:85AF: 48
	LDY #$00                        ;C - - - - - 0x00C5C0 06:85B0: A0 00
	LDA ram_0704,X                  ;C - - - - - 0x00C5C2 06:85B2: BD 04 07
	AND #$F8                        ;C - - - - - 0x00C5C5 06:85B5: 29 F8
	STA ram_0704,X                  ;C - - - - - 0x00C5C7 06:85B7: 9D 04 07
	CPX #$29                        ;C - - - - - 0x00C5CA 06:85BA: E0 29
	BEQ loc_06_85D0                 ;C - - - - - 0x00C5CC 06:85BC: F0 12
	CPX #$01                        ;C - - - - - 0x00C5CE 06:85BE: E0 01
	BNE loc_06_85D7                 ;C - - - - - 0x00C5D0 06:85C0: D0 15
	LDA ram_00D3                    ;C - - - - - 0x00C5D2 06:85C2: A5 D3
	STA ptr_C1                      ;C - - - - - 0x00C5D4 06:85C4: 85 C1
	LDA ram_070C,X                  ;C - - - - - 0x00C5D6 06:85C6: BD 0C 07
	STA ram_00C4                    ;C - - - - - 0x00C5D9 06:85C9: 85 C4
	JSR sub_06_8006                 ;C - - - - - 0x00C5DB 06:85CB: 20 06 80
	LDY ptr_C1                      ;C - - - - - 0x00C5DE 06:85CE: A4 C1
loc_06_85D0:
	INY                             ;C - - - - - 0x00C5E0 06:85D0: C8
	INC ram_0704,X                  ;C - - - - - 0x00C5E1 06:85D1: FE 04 07
	INC ram_0704,X                  ;C - - - - - 0x00C5E4 06:85D4: FE 04 07
loc_06_85D7:
	TYA                             ;C - - - - - 0x00C5E7 06:85D7: 98
	STA ram_0710,X                  ;C - - - - - 0x00C5E8 06:85D8: 9D 10 07
	PLA                             ;C - - - - - 0x00C5EB 06:85DB: 68
	TAY                             ;C - - - - - 0x00C5EC 06:85DC: A8
	RTS                             ;C - - - - - 0x00C5ED 06:85DD: 60
sub_06_85DE:
	CMP #$60                        ;C - - - - - 0x00C5EE 06:85DE: C9 60
	BCC loc_06_85E4                 ;C - - - - - 0x00C5F0 06:85E0: 90 02
	LDA #$5F                        ;c - - - - - 0x00C5F2 06:85E2: A9 5F
loc_06_85E4:
	STA ram_00C3                    ;C - - - - - 0x00C5F4 06:85E4: 85 C3
	INC ram_00C3                    ;C - - - - - 0x00C5F6 06:85E6: E6 C3
	CPX #$28                        ;C - - - - - 0x00C5F8 06:85E8: E0 28
	BCC loc_06_862A                 ;C - - - - - 0x00C5FA 06:85EA: 90 3E
	LDA ram_071C,X                  ;C - - - - - 0x00C5FC 06:85EC: BD 1C 07
	BEQ loc_06_861D                 ;C - - - - - 0x00C5FF 06:85EF: F0 2C
	CMP ram_00C3                    ;C - - - - - 0x00C601 06:85F1: C5 C3
	BNE loc_06_85FC                 ;C - - - - - 0x00C603 06:85F3: D0 07
	LDA ram_0730,X                  ;C - - - - - 0x00C605 06:85F5: BD 30 07
	BPL loc_06_861D                 ;C - - - - - 0x00C608 06:85F8: 10 23
	BMI sub_06_8644                 ;C - - - - - 0x00C60A 06:85FA: 30 48
loc_06_85FC:
	LDA ram_0718,X                  ;C - - - - - 0x00C60C 06:85FC: BD 18 07
	BEQ loc_06_861D                 ;C - - - - - 0x00C60F 06:85FF: F0 1C
	BCS loc_06_8607                 ;C - - - - - 0x00C611 06:8601: B0 04
	ORA #$80                        ;C - - - - - 0x00C613 06:8603: 09 80
	BNE loc_06_8609                 ;C - - - - - 0x00C615 06:8605: D0 02
loc_06_8607:
	AND #$7F                        ;C - - - - - 0x00C617 06:8607: 29 7F
loc_06_8609:
	STA ram_0718,X                  ;C - - - - - 0x00C619 06:8609: 9D 18 07
	LDA ram_0704,X                  ;C - - - - - 0x00C61C 06:860C: BD 04 07
	ORA #$20                        ;C - - - - - 0x00C61F 06:860F: 09 20
	STA ram_0704,X                  ;C - - - - - 0x00C621 06:8611: 9D 04 07
	LDA ram_00C3                    ;C - - - - - 0x00C624 06:8614: A5 C3
	LDY ram_071C,X                  ;C - - - - - 0x00C626 06:8616: BC 1C 07
	STY ram_00C3                    ;C - - - - - 0x00C629 06:8619: 84 C3
	BNE loc_06_8627                 ;C - - - - - 0x00C62B 06:861B: D0 0A
loc_06_861D:
	LDA ram_0704,X                  ;C - - - - - 0x00C62D 06:861D: BD 04 07
	AND #$DF                        ;C - - - - - 0x00C630 06:8620: 29 DF
	STA ram_0704,X                  ;C - - - - - 0x00C632 06:8622: 9D 04 07
	LDA ram_00C3                    ;C - - - - - 0x00C635 06:8625: A5 C3
loc_06_8627:
	STA ram_071C,X                  ;C - - - - - 0x00C637 06:8627: 9D 1C 07
loc_06_862A:
	ASL ram_00C3                    ;C - - - - - 0x00C63A 06:862A: 06 C3
	LDY ram_00C3                    ;C - - - - - 0x00C63C 06:862C: A4 C3
	LDA tbl_06_8959,Y               ;C - - - - - 0x00C63E 06:862E: B9 59 89
	STA ram_00C3                    ;C - - - - - 0x00C641 06:8631: 85 C3
	LDA tbl_06_895A,Y               ;C - - - - - 0x00C643 06:8633: B9 5A 89
sub_06_8636:
	STA ram_0724,X                  ;C - - - - - 0x00C646 06:8636: 9D 24 07
	LDA ram_00C3                    ;C - - - - - 0x00C649 06:8639: A5 C3
	STA ram_0720,X                  ;C - - - - - 0x00C64B 06:863B: 9D 20 07
	LDY #$04                        ;C - - - - - 0x00C64E 06:863E: A0 04
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C650 06:8640: B1 C5
	BMI loc_06_864C                 ;C - - - - - 0x00C652 06:8642: 30 08
sub_06_8644:
	LDA ram_0704,X                  ;C - - - - - 0x00C654 06:8644: BD 04 07
	AND #$08                        ;C - - - - - 0x00C657 06:8647: 29 08
	BNE loc_06_864C                 ;C - - - - - 0x00C659 06:8649: D0 01
	RTS                             ;C - - - - - 0x00C65B 06:864B: 60
loc_06_864C:
	LDA #$00                        ;C - - - - - 0x00C65C 06:864C: A9 00
	STA ram_0708,X                  ;C - - - - - 0x00C65E 06:864E: 9D 08 07
	LDA ram_0704,X                  ;C - - - - - 0x00C661 06:8651: BD 04 07
	AND #$37                        ;C - - - - - 0x00C664 06:8654: 29 37
	STA ram_0704,X                  ;C - - - - - 0x00C666 06:8656: 9D 04 07
	RTS                             ;C - - - - - 0x00C669 06:8659: 60
ofs_06_865A:
	CPX #$01                        ;C - - J - - 0x00C66A 06:865A: E0 01
	BNE loc_06_8662                 ;C - - - - - 0x00C66C 06:865C: D0 04
	LDA ram_00C3                    ;C - - - - - 0x00C66E 06:865E: A5 C3
	BNE loc_06_866B                 ;C - - - - - 0x00C670 06:8660: D0 09
loc_06_8662:
	LDA ram_070C,X                  ;C - - - - - 0x00C672 06:8662: BD 0C 07
	AND #$C0                        ;C - - - - - 0x00C675 06:8665: 29 C0
	ORA ram_00C3                    ;C - - - - - 0x00C677 06:8667: 05 C3
	ORA #$30                        ;C - - - - - 0x00C679 06:8669: 09 30
loc_06_866B:
	STA ram_070C,X                  ;C - - - - - 0x00C67B 06:866B: 9D 0C 07
	RTS                             ;C - - - - - 0x00C67E 06:866E: 60
ofs_06_866F:
	INC ram_00C3                    ;C - - J - - 0x00C67F 06:866F: E6 C3
	LDA ram_00C3                    ;C - - - - - 0x00C681 06:8671: A5 C3
	CMP ram_0700,X                  ;C - - - - - 0x00C683 06:8673: DD 00 07
	BEQ loc_06_86A0                 ;C - - - - - 0x00C686 06:8676: F0 28
	STA ram_0700,X                  ;C - - - - - 0x00C688 06:8678: 9D 00 07
	TAY                             ;C - - - - - 0x00C68B 06:867B: A8
	LDA ram_0704,X                  ;C - - - - - 0x00C68C 06:867C: BD 04 07
	ORA #$08                        ;C - - - - - 0x00C68F 06:867F: 09 08
ofs_06_8681:
	STA ram_0704,X                  ;C - - - - - 0x00C691 06:8681: 9D 04 07
sub_06_8684:
	DEY                             ;C - - - - - 0x00C694 06:8684: 88
ofs_06_8685:
	LDA #$00                        ;C - - - - - 0x00C695 06:8685: A9 00
	STA ram_00C3                    ;C - - - - - 0x00C697 06:8687: 85 C3
	TYA                             ;C - - - - - 0x00C699 06:8689: 98
	ASL A                           ;C - - - - - 0x00C69A 06:868A: 0A
	ROL ram_00C3                    ;C - - - - - 0x00C69B 06:868B: 26 C3
	ASL A                           ;C - - - - - 0x00C69D 06:868D: 0A
	ROL ram_00C3                    ;C - - - - - 0x00C69E 06:868E: 26 C3
	ASL A                           ;C - - - - - 0x00C6A0 06:8690: 0A
	ROL ram_00C3                    ;C - - - - - 0x00C6A1 06:8691: 26 C3
	CLC                             ;C - - - - - 0x00C6A3 06:8693: 18
	ADC dat_06_8A42                 ;C - - - - - 0x00C6A4 06:8694: 6D 42 8A
	STA ptr_C5                      ;C - - - - - 0x00C6A7 06:8697: 85 C5
	LDA ram_00C3                    ;C - - - - - 0x00C6A9 06:8699: A5 C3
	ADC dat_06_8A41                 ;C - - - - - 0x00C6AB 06:869B: 6D 41 8A
	STA ptr_C5+1                    ;C - - - - - 0x00C6AE 06:869E: 85 C6
loc_06_86A0:
	RTS                             ;C - - - - - 0x00C6B0 06:86A0: 60
ofs_06_86A1:
	LDA ram_00C3                    ;C - - J - - 0x00C6B1 06:86A1: A5 C3
	STA ram_0714,X                  ;C - - - - - 0x00C6B3 06:86A3: 9D 14 07
	RTS                             ;C - - - - - 0x00C6B6 06:86A6: 60
ofs_06_86A7:
	LDA ram_00C3                    ;C - - J - - 0x00C6B7 06:86A7: A5 C3
	STA ram_0718,X                  ;C - - - - - 0x00C6B9 06:86A9: 9D 18 07
	RTS                             ;C - - - - - 0x00C6BC 06:86AC: 60
ofs_06_86AD:
	LDA ram_070C,X                  ;C - - J - - 0x00C6BD 06:86AD: BD 0C 07
	AND #$0F                        ;C - - - - - 0x00C6C0 06:86B0: 29 0F
	ORA ram_00C3                    ;C - - - - - 0x00C6C2 06:86B2: 05 C3
	ORA #$30                        ;C - - - - - 0x00C6C4 06:86B4: 09 30
	STA ram_070C,X                  ;C - - - - - 0x00C6C6 06:86B6: 9D 0C 07
	RTS                             ;C - - - - - 0x00C6C9 06:86B9: 60
sub_06_86BA:
	LDA ram_0710,X                  ;C - - - - - 0x00C6CA 06:86BA: BD 10 07
	STA ram_00C4                    ;C - - - - - 0x00C6CD 06:86BD: 85 C4
	LDA ram_0704,X                  ;C - - - - - 0x00C6CF 06:86BF: BD 04 07
	AND #$07                        ;C - - - - - 0x00C6D2 06:86C2: 29 07
	JSR sub_06_8023                 ;C - - - - - 0x00C6D4 06:86C4: 20 23 80
	.word ofs_06_86D1, ofs_06_86E6, loc_06_8720, ofs_06_8702, loc_06_8914;W 0x00C6D7 06:86C7:
ofs_06_86D1:
	LDY #$00                        ;C - - J - - 0x00C6E1 06:86D1: A0 00
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C6E3 06:86D3: B1 C5
	TAY                             ;C - - - - - 0x00C6E5 06:86D5: A8
	LDA ram_00C4                    ;C - - - - - 0x00C6E6 06:86D6: A5 C4
	CLC                             ;C - - - - - 0x00C6E8 06:86D8: 18
	ADC tbl_06_8933,Y               ;C - - - - - 0x00C6E9 06:86D9: 79 33 89
	BCS loc_06_86E2                 ;C - - - - - 0x00C6EC 06:86DC: B0 04
	CMP #$F0                        ;C - - - - - 0x00C6EE 06:86DE: C9 F0
	BCC loc_06_871D                 ;C - - - - - 0x00C6F0 06:86E0: 90 3B
loc_06_86E2:
	LDA #$F0                        ;C - - - - - 0x00C6F2 06:86E2: A9 F0
	BNE loc_06_871A                 ;C - - - - - 0x00C6F4 06:86E4: D0 34
ofs_06_86E6:
	LDY #$01                        ;C - - J - - 0x00C6F6 06:86E6: A0 01
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C6F8 06:86E8: B1 C5
	BEQ loc_06_86FB                 ;C - - - - - 0x00C6FA 06:86EA: F0 0F
	TAY                             ;C - - - - - 0x00C6FC 06:86EC: A8
	LDA ram_00C4                    ;C - - - - - 0x00C6FD 06:86ED: A5 C4
	SEC                             ;C - - - - - 0x00C6FF 06:86EF: 38
	SBC tbl_06_8933,Y               ;C - - - - - 0x00C700 06:86F0: F9 33 89
	BCC loc_06_86FB                 ;C - - - - - 0x00C703 06:86F3: 90 06
	LDY #$02                        ;C - - - - - 0x00C705 06:86F5: A0 02
	CMP (ptr_C5),Y                  ;C - - - - - 0x00C707 06:86F7: D1 C5
	BCS loc_06_871D                 ;C - - - - - 0x00C709 06:86F9: B0 22
loc_06_86FB:
	LDY #$02                        ;C - - - - - 0x00C70B 06:86FB: A0 02
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C70D 06:86FD: B1 C5
	JMP loc_06_871A                 ;C - - - - - 0x00C70F 06:86FF: 4C 1A 87
ofs_06_8702:
	TXA                             ;C - - J - - 0x00C712 06:8702: 8A
	AND #$03                        ;C - - - - - 0x00C713 06:8703: 29 03
	CMP #$01                        ;C - - - - - 0x00C715 06:8705: C9 01
	BEQ loc_06_8718                 ;C - - - - - 0x00C717 06:8707: F0 0F
	LDY #$03                        ;C - - - - - 0x00C719 06:8709: A0 03
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C71B 06:870B: B1 C5
	BEQ loc_06_8720                 ;C - - - - - 0x00C71D 06:870D: F0 11
	TAY                             ;C - - - - - 0x00C71F 06:870F: A8
	LDA ram_00C4                    ;C - - - - - 0x00C720 06:8710: A5 C4
	SEC                             ;C - - - - - 0x00C722 06:8712: 38
	SBC tbl_06_8933,Y               ;C - - - - - 0x00C723 06:8713: F9 33 89
	BCS loc_06_871D                 ;C - - - - - 0x00C726 06:8716: B0 05
loc_06_8718:
	LDA #$00                        ;C - - - - - 0x00C728 06:8718: A9 00
loc_06_871A:
	INC ram_0704,X                  ;C - - - - - 0x00C72A 06:871A: FE 04 07
loc_06_871D:
	STA ram_0710,X                  ;C - - - - - 0x00C72D 06:871D: 9D 10 07
loc_06_8720:
	CPX #$28                        ;C - - - - - 0x00C730 06:8720: E0 28
	BCC loc_06_8737                 ;C - - - - - 0x00C732 06:8722: 90 13
	LDA ram_00CF                    ;C - - - - - 0x00C734 06:8724: A5 CF
	BPL loc_06_872B                 ;C - - - - - 0x00C736 06:8726: 10 03
	JMP loc_06_88A0                 ;C - - - - - 0x00C738 06:8728: 4C A0 88
loc_06_872B:
	LDA ram_00CD                    ;C - - - - - 0x00C73B 06:872B: A5 CD
	LDY ram_00CC                    ;C - - - - - 0x00C73D 06:872D: A4 CC
	BMI loc_06_8733                 ;C - - - - - 0x00C73F 06:872F: 30 02
	EOR #$FF                        ;C - - - - - 0x00C741 06:8731: 49 FF
loc_06_8733:
	CMP #$FF                        ;C - - - - - 0x00C743 06:8733: C9 FF
	BNE loc_06_8740                 ;C - - - - - 0x00C745 06:8735: D0 09
loc_06_8737:
	TXA                             ;C - - - - - 0x00C747 06:8737: 8A
	AND #$03                        ;C - - - - - 0x00C748 06:8738: 29 03
	CMP #$01                        ;C - - - - - 0x00C74A 06:873A: C9 01
	BNE loc_06_8760                 ;C - - - - - 0x00C74C 06:873C: D0 22
	BEQ loc_06_8752                 ;C - - - - - 0x00C74E 06:873E: F0 12
loc_06_8740:
	CPX #$29                        ;c - - - - - 0x00C750 06:8740: E0 29
	BNE loc_06_875B                 ;c - - - - - 0x00C752 06:8742: D0 17
	STA ram_00C4                    ;c - - - - - 0x00C754 06:8744: 85 C4
	LDA ram_0740,X                  ;c - - - - - 0x00C756 06:8746: BD 40 07
	STA ptr_C1                      ;c - - - - - 0x00C759 06:8749: 85 C1
	JSR sub_06_8006                 ;c - - - - - 0x00C75B 06:874B: 20 06 80
	LDA ptr_C1                      ;c - - - - - 0x00C75E 06:874E: A5 C1
	BEQ loc_06_87AA                 ;c - - - - - 0x00C760 06:8750: F0 58
loc_06_8752:
	LDA ram_0710,X                  ;C - - - - - 0x00C762 06:8752: BD 10 07
	BEQ loc_06_87AA                 ;C - - - - - 0x00C765 06:8755: F0 53
	LDA #$FF                        ;C - - - - - 0x00C767 06:8757: A9 FF
	BNE loc_06_87AA                 ;C - - - - - 0x00C769 06:8759: D0 4F
loc_06_875B:
	CMP ram_0710,X                  ;c - - - - - 0x00C76B 06:875B: DD 10 07
	BCC loc_06_8763                 ;c - - - - - 0x00C76E 06:875E: 90 03
loc_06_8760:
	LDA ram_0710,X                  ;C - - - - - 0x00C770 06:8760: BD 10 07
loc_06_8763:
	LSR A                           ;C - - - - - 0x00C773 06:8763: 4A
	LSR A                           ;C - - - - - 0x00C774 06:8764: 4A
	LSR A                           ;C - - - - - 0x00C775 06:8765: 4A
	LSR A                           ;C - - - - - 0x00C776 06:8766: 4A
	EOR #$0F                        ;C - - - - - 0x00C777 06:8767: 49 0F
	STA ram_00C3                    ;C - - - - - 0x00C779 06:8769: 85 C3
	LDY #$06                        ;C - - - - - 0x00C77B 06:876B: A0 06
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C77D 06:876D: B1 C5
	CMP #$05                        ;C - - - - - 0x00C77F 06:876F: C9 05
	BCC loc_06_8797                 ;C - - - - - 0x00C781 06:8771: 90 24
	STA ram_00C4                    ;C - - - - - 0x00C783 06:8773: 85 C4
	LDY ram_0708,X                  ;C - - - - - 0x00C785 06:8775: BC 08 07
	LDA ram_0704,X                  ;C - - - - - 0x00C788 06:8778: BD 04 07
	ASL A                           ;C - - - - - 0x00C78B 06:877B: 0A
	ASL A                           ;C - - - - - 0x00C78C 06:877C: 0A
	TYA                             ;C - - - - - 0x00C78D 06:877D: 98
	BCC loc_06_8782                 ;C - - - - - 0x00C78E 06:877E: 90 02
	EOR #$FF                        ;C - - - - - 0x00C790 06:8780: 49 FF
loc_06_8782:
	BEQ loc_06_8797                 ;C - - - - - 0x00C792 06:8782: F0 13
	STA ptr_C1                      ;C - - - - - 0x00C794 06:8784: 85 C1
	JSR sub_06_8006                 ;C - - - - - 0x00C796 06:8786: 20 06 80
	LDA ptr_C1                      ;C - - - - - 0x00C799 06:8789: A5 C1
	LSR A                           ;C - - - - - 0x00C79B 06:878B: 4A
	LSR A                           ;C - - - - - 0x00C79C 06:878C: 4A
	CMP #$10                        ;C - - - - - 0x00C79D 06:878D: C9 10
	BCS loc_06_87A5                 ;C - - - - - 0x00C79F 06:878F: B0 14
	CMP ram_00C3                    ;C - - - - - 0x00C7A1 06:8791: C5 C3
	BCC loc_06_8797                 ;C - - - - - 0x00C7A3 06:8793: 90 02
	STA ram_00C3                    ;C - - - - - 0x00C7A5 06:8795: 85 C3
loc_06_8797:
	LDA #$10                        ;C - - - - - 0x00C7A7 06:8797: A9 10
	STA ram_00C4                    ;C - - - - - 0x00C7A9 06:8799: 85 C4
	LDA ram_070C,X                  ;C - - - - - 0x00C7AB 06:879B: BD 0C 07
	SEC                             ;C - - - - - 0x00C7AE 06:879E: 38
	SBC ram_00C3                    ;C - - - - - 0x00C7AF 06:879F: E5 C3
	BIT ram_00C4                    ;C - - - - - 0x00C7B1 06:87A1: 24 C4
	BNE loc_06_87AA                 ;C - - - - - 0x00C7B3 06:87A3: D0 05
loc_06_87A5:
	LDA ram_070C,X                  ;C - - - - - 0x00C7B5 06:87A5: BD 0C 07
	AND #$F0                        ;C - - - - - 0x00C7B8 06:87A8: 29 F0
loc_06_87AA:
	LDY #$00                        ;C - - - - - 0x00C7BA 06:87AA: A0 00
	JSR sub_06_80EC                 ;C - - - - - 0x00C7BC 06:87AC: 20 EC 80
	TXA                             ;C - - - - - 0x00C7BF 06:87AF: 8A
	AND #$03                        ;C - - - - - 0x00C7C0 06:87B0: 29 03
	TAY                             ;C - - - - - 0x00C7C2 06:87B2: A8
	LDA ram_077C,Y                  ;C - - - - - 0x00C7C3 06:87B3: B9 7C 07
	BMI loc_06_880C                 ;C - - - - - 0x00C7C6 06:87B6: 30 54
	LDY #$05                        ;C - - - - - 0x00C7C8 06:87B8: A0 05
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C7CA 06:87BA: B1 C5
	BEQ loc_06_880C                 ;C - - - - - 0x00C7CC 06:87BC: F0 4E
	STA ram_00C4                    ;C - - - - - 0x00C7CE 06:87BE: 85 C4
	LDY ram_0708,X                  ;C - - - - - 0x00C7D0 06:87C0: BC 08 07
	LDA ram_0704,X                  ;C - - - - - 0x00C7D3 06:87C3: BD 04 07
	ASL A                           ;C - - - - - 0x00C7D6 06:87C6: 0A
	ASL A                           ;C - - - - - 0x00C7D7 06:87C7: 0A
	TYA                             ;C - - - - - 0x00C7D8 06:87C8: 98
	BCC loc_06_87CD                 ;C - - - - - 0x00C7D9 06:87C9: 90 02
	EOR #$FF                        ;C - - - - - 0x00C7DB 06:87CB: 49 FF
loc_06_87CD:
	BEQ loc_06_880C                 ;C - - - - - 0x00C7DD 06:87CD: F0 3D
	STA ptr_C1                      ;C - - - - - 0x00C7DF 06:87CF: 85 C1
	JSR sub_06_8006                 ;C - - - - - 0x00C7E1 06:87D1: 20 06 80
	LDA ptr_C1                      ;C - - - - - 0x00C7E4 06:87D4: A5 C1
	LSR A                           ;C - - - - - 0x00C7E6 06:87D6: 4A
	ROR ptr_C1+1                    ;C - - - - - 0x00C7E7 06:87D7: 66 C2
	LSR A                           ;C - - - - - 0x00C7E9 06:87D9: 4A
	ROR ptr_C1+1                    ;C - - - - - 0x00C7EA 06:87DA: 66 C2
	LSR A                           ;C - - - - - 0x00C7EC 06:87DC: 4A
	ROR ptr_C1+1                    ;C - - - - - 0x00C7ED 06:87DD: 66 C2
	LSR A                           ;C - - - - - 0x00C7EF 06:87DF: 4A
	ROR ptr_C1+1                    ;C - - - - - 0x00C7F0 06:87E0: 66 C2
	TAY                             ;C - - - - - 0x00C7F2 06:87E2: A8
	ORA ptr_C1+1                    ;C - - - - - 0x00C7F3 06:87E3: 05 C2
	BEQ loc_06_880C                 ;C - - - - - 0x00C7F5 06:87E5: F0 25
	LDA ram_0704,X                  ;C - - - - - 0x00C7F7 06:87E7: BD 04 07
	BMI loc_06_87FA                 ;C - - - - - 0x00C7FA 06:87EA: 30 0E
	CLC                             ;C - - - - - 0x00C7FC 06:87EC: 18
	LDA ptr_C1+1                    ;C - - - - - 0x00C7FD 06:87ED: A5 C2
	ADC ram_0720,X                  ;C - - - - - 0x00C7FF 06:87EF: 7D 20 07
	STA ptr_C1+1                    ;C - - - - - 0x00C802 06:87F2: 85 C2
	TYA                             ;C - - - - - 0x00C804 06:87F4: 98
	ADC ram_0724,X                  ;C - - - - - 0x00C805 06:87F5: 7D 24 07
	BNE loc_06_8809                 ;C - - - - - 0x00C808 06:87F8: D0 0F
loc_06_87FA:
	SEC                             ;C - - - - - 0x00C80A 06:87FA: 38
	LDA ram_0720,X                  ;C - - - - - 0x00C80B 06:87FB: BD 20 07
	SBC ptr_C1+1                    ;C - - - - - 0x00C80E 06:87FE: E5 C2
	STA ptr_C1+1                    ;C - - - - - 0x00C810 06:8800: 85 C2
ofs_06_8802:
	LDA ram_0724,X                  ;C - - - - - 0x00C812 06:8802: BD 24 07
	STY ptr_C1                      ;C - - - - - 0x00C815 06:8805: 84 C1
	SBC ptr_C1                      ;C - - - - - 0x00C817 06:8807: E5 C1
loc_06_8809:
	TAY                             ;C - - - - - 0x00C819 06:8809: A8
	BNE loc_06_8814                 ;C - - - - - 0x00C81A 06:880A: D0 08
loc_06_880C:
	LDA ram_0720,X                  ;C - - - - - 0x00C81C 06:880C: BD 20 07
	STA ptr_C1+1                    ;C - - - - - 0x00C81F 06:880F: 85 C2
	LDY ram_0724,X                  ;C - - - - - 0x00C821 06:8811: BC 24 07
loc_06_8814:
	CPX #$28                        ;C - - - - - 0x00C824 06:8814: E0 28
	BCS loc_06_8835                 ;C - - - - - 0x00C826 06:8816: B0 1D
	LDA ram_00D6                    ;C - - - - - 0x00C828 06:8818: A5 D6
	BPL loc_06_8835                 ;C - - - - - 0x00C82A 06:881A: 10 19
	LDA ram_00D8                    ;c - - - - - 0x00C82C 06:881C: A5 D8
	BEQ loc_06_8835                 ;c - - - - - 0x00C82E 06:881E: F0 15
	STA ram_00C4                    ;c - - - - - 0x00C830 06:8820: 85 C4
	STY ptr_C1                      ;c - - - - - 0x00C832 06:8822: 84 C1
	LDA ptr_C1+1                    ;c - - - - - 0x00C834 06:8824: A5 C2
	PHA                             ;c - - - - - 0x00C836 06:8826: 48
	JSR sub_06_8006                 ;c - - - - - 0x00C837 06:8827: 20 06 80
	PLA                             ;c - - - - - 0x00C83A 06:882A: 68
	CLC                             ;c - - - - - 0x00C83B 06:882B: 18
	ADC ptr_C1+1                    ;c - - - - - 0x00C83C 06:882C: 65 C2
	STA ptr_C1+1                    ;c - - - - - 0x00C83E 06:882E: 85 C2
	LDA #$00                        ;c - - - - - 0x00C840 06:8830: A9 00
	ADC ptr_C1                      ;c - - - - - 0x00C842 06:8832: 65 C1
	TAY                             ;c - - - - - 0x00C844 06:8834: A8
loc_06_8835:
	TXA                             ;C - - - - - 0x00C845 06:8835: 8A
	AND #$03                        ;C - - - - - 0x00C846 06:8836: 29 03
	BNE loc_06_8849                 ;C - - - - - 0x00C848 06:8838: D0 0F
	TYA                             ;C - - - - - 0x00C84A 06:883A: 98
	AND #$0F                        ;C - - - - - 0x00C84B 06:883B: 29 0F
	LDY #$07                        ;C - - - - - 0x00C84D 06:883D: A0 07
	ORA (ptr_C5),Y                  ;C - - - - - 0x00C84F 06:883F: 11 C5
	STA ptr_C1+1                    ;C - - - - - 0x00C851 06:8841: 85 C2
	LDA #$00                        ;C - - - - - 0x00C853 06:8843: A9 00
	STA ptr_C1                      ;C - - - - - 0x00C855 06:8845: 85 C1
	BEQ loc_06_8884                 ;C - - - - - 0x00C857 06:8847: F0 3B
loc_06_8849:
	TYA                             ;C - - - - - 0x00C859 06:8849: 98
	LDY #$08                        ;C - - - - - 0x00C85A 06:884A: A0 08
loc_06_884C:
	DEY                             ;C - - - - - 0x00C85C 06:884C: 88
	CMP tbl_06_8953,Y               ;C - - - - - 0x00C85D 06:884D: D9 53 89
	BCC loc_06_884C                 ;C - - - - - 0x00C860 06:8850: 90 FA
	STA ptr_C1                      ;C - - - - - 0x00C862 06:8852: 85 C1
	TYA                             ;C - - - - - 0x00C864 06:8854: 98
	CLC                             ;C - - - - - 0x00C865 06:8855: 18
	ADC ptr_C1                      ;C - - - - - 0x00C866 06:8856: 65 C1
	TAY                             ;C - - - - - 0x00C868 06:8858: A8
	AND #$07                        ;C - - - - - 0x00C869 06:8859: 29 07
	CLC                             ;C - - - - - 0x00C86B 06:885B: 18
	ADC #$07                        ;C - - - - - 0x00C86C 06:885C: 69 07
	STA ptr_C1                      ;C - - - - - 0x00C86E 06:885E: 85 C1
	TYA                             ;C - - - - - 0x00C870 06:8860: 98
	AND #$38                        ;C - - - - - 0x00C871 06:8861: 29 38
	EOR #$38                        ;C - - - - - 0x00C873 06:8863: 49 38
	BEQ loc_06_8870                 ;C - - - - - 0x00C875 06:8865: F0 09
loc_06_8867:
	LSR ptr_C1                      ;C - - - - - 0x00C877 06:8867: 46 C1
	ROR ptr_C1+1                    ;C - - - - - 0x00C879 06:8869: 66 C2
	SEC                             ;C - - - - - 0x00C87B 06:886B: 38
	SBC #$08                        ;C - - - - - 0x00C87C 06:886C: E9 08
	BNE loc_06_8867                 ;C - - - - - 0x00C87E 06:886E: D0 F7
loc_06_8870:
	LDY #$00                        ;C - - - - - 0x00C880 06:8870: A0 00
	LDA ram_0714,X                  ;C - - - - - 0x00C882 06:8872: BD 14 07
	BEQ loc_06_8884                 ;C - - - - - 0x00C885 06:8875: F0 0D
	BPL loc_06_887A                 ;C - - - - - 0x00C887 06:8877: 10 01
	DEY                             ;C - - - - - 0x00C889 06:8879: 88
loc_06_887A:
	CLC                             ;C - - - - - 0x00C88A 06:887A: 18
	ADC ptr_C1+1                    ;C - - - - - 0x00C88B 06:887B: 65 C2
	STA ptr_C1+1                    ;C - - - - - 0x00C88D 06:887D: 85 C2
	TYA                             ;C - - - - - 0x00C88F 06:887F: 98
	ADC ptr_C1                      ;C - - - - - 0x00C890 06:8880: 65 C1
	STA ptr_C1                      ;C - - - - - 0x00C892 06:8882: 85 C1
loc_06_8884:
	LDY #$02                        ;C - - - - - 0x00C894 06:8884: A0 02
	LDA ptr_C1+1                    ;C - - - - - 0x00C896 06:8886: A5 C2
ofs_06_8888:
	JSR sub_06_80EC                 ;C - - - - - 0x00C898 06:8888: 20 EC 80
	TXA                             ;C - - - - - 0x00C89B 06:888B: 8A
	AND #$03                        ;C - - - - - 0x00C89C 06:888C: 29 03
	TAY                             ;C - - - - - 0x00C89E 06:888E: A8
	LDA ptr_C1                      ;C - - - - - 0x00C89F 06:888F: A5 C1
	CMP ram_077C,Y                  ;C - - - - - 0x00C8A1 06:8891: D9 7C 07
	BEQ loc_06_88A0                 ;C - - - - - 0x00C8A4 06:8894: F0 0A
	STA ram_077C,Y                  ;C - - - - - 0x00C8A6 06:8896: 99 7C 07
	ORA #$08                        ;C - - - - - 0x00C8A9 06:8899: 09 08
	LDY #$03                        ;C - - - - - 0x00C8AB 06:889B: A0 03
	JSR sub_06_80EC                 ;C - - - - - 0x00C8AD 06:889D: 20 EC 80
loc_06_88A0:
	LDA ram_0704,X                  ;C - - - - - 0x00C8B0 06:88A0: BD 04 07
	AND #$20                        ;C - - - - - 0x00C8B3 06:88A3: 29 20
	BEQ loc_06_88FA                 ;C - - - - - 0x00C8B5 06:88A5: F0 53
	LDA ram_0718,X                  ;C - - - - - 0x00C8B7 06:88A7: BD 18 07
	BEQ loc_06_88F2                 ;C - - - - - 0x00C8BA 06:88AA: F0 46
	LDY #$00                        ;C - - - - - 0x00C8BC 06:88AC: A0 00
	ASL A                           ;C - - - - - 0x00C8BE 06:88AE: 0A
	PHP                             ;C - - - - - 0x00C8BF 06:88AF: 08
	BCC loc_06_88B8                 ;C - - - - - 0x00C8C0 06:88B0: 90 06
	EOR #$FF                        ;C - - - - - 0x00C8C2 06:88B2: 49 FF
	CLC                             ;C - - - - - 0x00C8C4 06:88B4: 18
	ADC #$01                        ;C - - - - - 0x00C8C5 06:88B5: 69 01
	DEY                             ;C - - - - - 0x00C8C7 06:88B7: 88
loc_06_88B8:
	CLC                             ;C - - - - - 0x00C8C8 06:88B8: 18
	ADC ram_0720,X                  ;C - - - - - 0x00C8C9 06:88B9: 7D 20 07
	STA ram_0720,X                  ;C - - - - - 0x00C8CC 06:88BC: 9D 20 07
	TYA                             ;C - - - - - 0x00C8CF 06:88BF: 98
	ADC ram_0724,X                  ;C - - - - - 0x00C8D0 06:88C0: 7D 24 07
	STA ram_0724,X                  ;C - - - - - 0x00C8D3 06:88C3: 9D 24 07
	LDA ram_071C,X                  ;C - - - - - 0x00C8D6 06:88C6: BD 1C 07
	ASL A                           ;C - - - - - 0x00C8D9 06:88C9: 0A
	TAY                             ;C - - - - - 0x00C8DA 06:88CA: A8
	SEC                             ;C - - - - - 0x00C8DB 06:88CB: 38
	LDA ram_0720,X                  ;C - - - - - 0x00C8DC 06:88CC: BD 20 07
	SBC tbl_06_8959,Y               ;C - - - - - 0x00C8DF 06:88CF: F9 59 89
	LDA ram_0724,X                  ;C - - - - - 0x00C8E2 06:88D2: BD 24 07
	AND #$3F                        ;C - - - - - 0x00C8E5 06:88D5: 29 3F
	SBC tbl_06_895A,Y               ;C - - - - - 0x00C8E7 06:88D7: F9 5A 89
	LDA #$FF                        ;C - - - - - 0x00C8EA 06:88DA: A9 FF
	ADC #$00                        ;C - - - - - 0x00C8EC 06:88DC: 69 00
	PLP                             ;C - - - - - 0x00C8EE 06:88DE: 28
	ADC #$00                        ;C - - - - - 0x00C8EF 06:88DF: 69 00
	BNE loc_06_88FA                 ;C - - - - - 0x00C8F1 06:88E1: D0 17
	TXA                             ;C - - - - - 0x00C8F3 06:88E3: 8A
	BEQ loc_06_88FA                 ;C - - - - - 0x00C8F4 06:88E4: F0 14
	LDA tbl_06_8959,Y               ;C - - - - - 0x00C8F6 06:88E6: B9 59 89
	STA ram_0720,X                  ;C - - - - - 0x00C8F9 06:88E9: 9D 20 07
	LDA tbl_06_895A,Y               ;C - - - - - 0x00C8FC 06:88EC: B9 5A 89
	STA ram_0724,X                  ;C - - - - - 0x00C8FF 06:88EF: 9D 24 07
loc_06_88F2:
	LDA ram_0704,X                  ;C - - - - - 0x00C902 06:88F2: BD 04 07
	AND #$DF                        ;C - - - - - 0x00C905 06:88F5: 29 DF
	STA ram_0704,X                  ;C - - - - - 0x00C907 06:88F7: 9D 04 07
loc_06_88FA:
	LDY #$04                        ;C - - - - - 0x00C90A 06:88FA: A0 04
	LDA (ptr_C5),Y                  ;C - - - - - 0x00C90C 06:88FC: B1 C5
	AND #$7F                        ;C - - - - - 0x00C90E 06:88FE: 29 7F
	BEQ loc_06_8914                 ;C - - - - - 0x00C910 06:8900: F0 12
	CLC                             ;C - - - - - 0x00C912 06:8902: 18
	ADC ram_0708,X                  ;C - - - - - 0x00C913 06:8903: 7D 08 07
	STA ram_0708,X                  ;C - - - - - 0x00C916 06:8906: 9D 08 07
	BCC loc_06_8914                 ;C - - - - - 0x00C919 06:8909: 90 09
	LDA ram_0704,X                  ;C - - - - - 0x00C91B 06:890B: BD 04 07
	CLC                             ;C - - - - - 0x00C91E 06:890E: 18
	ADC #$40                        ;C - - - - - 0x00C91F 06:890F: 69 40
	STA ram_0704,X                  ;C - - - - - 0x00C921 06:8911: 9D 04 07
loc_06_8914:
	RTS                             ;C - - - - - 0x00C924 06:8914: 60
tbl_06_8915:
	.byte $02                       ;- - - - - - 0x00C925 06:8915:
	.byte $04,$08,$10,$20           ;- D 0 - - - 0x00C926 06:8916:
	.byte $40,$80                   ;- - - - - - 0x00C92A 06:891A:
tbl_06_891C:
	.byte $03                       ;- - - - - - 0x00C92C 06:891C:
	.byte $06,$0C,$18,$30,$60,$C0   ;- D 0 - - - 0x00C92D 06:891D:
tbl_06_8923:
	.byte $00                       ;- - - - - - 0x00C933 06:8923:
	.byte $0C,$18,$24,$30           ;- D 0 - - - 0x00C934 06:8924:
	.byte $3C,$48,$54,$18           ;- - - - - - 0x00C938 06:8928:
	.byte $24,$30                   ;- D 0 - - - 0x00C93C 06:892C:
	.byte $3C,$48,$54,$60,$6C       ;- - - - - - 0x00C93E 06:892E:
tbl_06_8933:
	.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B;- - - - - - 0x00C943 06:8933:
	.byte $0C                       ;- D 0 - - - 0x00C94F 06:893F:
	.byte $0E                       ;- - - - - - 0x00C950 06:8940:
	.byte $0F,$10,$12               ;- D 0 - - - 0x00C951 06:8941:
	.byte $13                       ;- - - - - - 0x00C954 06:8944:
	.byte $14,$16                   ;- D 0 - - - 0x00C955 06:8945:
	.byte $18                       ;- - - - - - 0x00C957 06:8947:
	.byte $1B                       ;- D 0 - - - 0x00C958 06:8948:
	.byte $1E,$23,$28               ;- - - - - - 0x00C959 06:8949:
	.byte $30,$3C,$50,$7E,$7F,$FE,$FF;- D 0 - - - 0x00C95C 06:894C:
tbl_06_8953:
	.byte $00,$07,$0E,$15,$1C,$23   ;- D 0 - - - 0x00C963 06:8953:
tbl_06_8959:
	.byte $2A                       ;- D 0 - - - 0x00C969 06:8959:
tbl_06_895A:
	.byte $31                       ;- D 0 - - - 0x00C96A 06:895A:
	.byte $5C,$37,$9C,$36,$E7,$35,$3C,$35,$9B,$34,$02,$34,$72,$33,$EA,$32;- - - - - - 0x00C96B 06:895B:
	.byte $6A,$32                   ;- - - - - - 0x00C97B 06:896B:
	.byte $F1,$31                   ;- D 0 - - - 0x00C97D 06:896D:
	.byte $80,$31,$14,$31,$5C,$30,$9C,$2F,$E7,$2E,$3C,$2E,$9B,$2D,$02,$2D;- - - - - - 0x00C97F 06:896F:
	.byte $72,$2C                   ;- - - - - - 0x00C98F 06:897F:
	.byte $EA,$2B                   ;- D 0 - - - 0x00C991 06:8981:
	.byte $6A,$2B                   ;- - - - - - 0x00C993 06:8983:
	.byte $F1,$2A,$80,$2A,$14,$2A,$5C,$29,$9C,$28,$E7,$27,$3C,$27,$9B,$26;- D 0 - - - 0x00C995 06:8985:
	.byte $02,$26,$72,$25,$EA,$24,$6A,$24,$F1,$23,$80,$23,$14,$23,$5C,$22;- D 0 - - - 0x00C9A5 06:8995:
	.byte $9C,$21,$E7,$20,$3C,$20,$9B,$1F,$02,$1F,$72,$1E,$EA,$1D,$6A,$1D;- D 0 - - - 0x00C9B5 06:89A5:
	.byte $F1,$1C,$80,$1C,$14,$1C,$5C,$1B,$9C,$1A,$E7,$19,$3C,$19,$9B,$18;- D 0 - - - 0x00C9C5 06:89B5:
	.byte $02,$18,$72,$17,$EA,$16,$6A,$16,$F1,$15,$80,$15,$14,$15,$5C,$14;- D 0 - - - 0x00C9D5 06:89C5:
	.byte $9C,$13,$E7,$12,$3C,$12,$9B,$11,$02,$11;- D 0 - - - 0x00C9E5 06:89D5:
	.byte $72,$10,$EA,$0F,$6A,$0F,$F1,$0E;- - - - - - 0x00C9EF 06:89DF:
	.byte $80,$0E                   ;- D 0 - - - 0x00C9F7 06:89E7:
	.byte $14,$0E                   ;- - - - - - 0x00C9F9 06:89E9:
	.byte $5C,$0D                   ;- D 0 - - - 0x00C9FB 06:89EB:
	.byte $9C,$0C,$E7,$0B           ;- - - - - - 0x00C9FD 06:89ED:
	.byte $3C,$0B                   ;- D 0 - - - 0x00CA01 06:89F1:
	.byte $9B,$0A                   ;- - - - - - 0x00CA03 06:89F3:
	.byte $02,$0A                   ;- D 0 - - - 0x00CA05 06:89F5:
	.byte $72,$09,$EA,$08,$6A,$08,$F1,$07,$80,$07;- - - - - - 0x00CA07 06:89F7:
	.byte $14,$07                   ;- D 0 - - - 0x00CA11 06:8A01:
	.byte $5C,$06,$9C,$05,$E7,$04,$3C,$04,$9B,$03,$02,$03,$72,$02,$EA,$01;- - - - - - 0x00CA13 06:8A03:
	.byte $6A,$01,$F1,$00,$80,$00,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x00CA23 06:8A13:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x00CA33 06:8A23:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x00CA43 06:8A33:
dat_06_8A40:
	.byte $36                       ;- D 0 - - - 0x00CA50 06:8A40:
dat_06_8A41:
	.byte $8A                       ;- D 0 - - - 0x00CA51 06:8A41:
dat_06_8A42:
	.byte $AF                       ;- D 0 - - - 0x00CA52 06:8A42:
tbl_06_8A43:
	.byte $8B                       ;- D 0 - - - 0x00CA53 06:8A43:
tbl_06_8A44:
	.byte $57,$8E,$1B,$90,$F7,$93,$AD,$97,$07,$9A,$1F,$9C,$89,$9F,$AE,$A2;- D 0 - - - 0x00CA54 06:8A44:
	.byte $38,$A4,$82,$A5,$E2,$A6,$BF,$A7,$36,$A8,$75,$A9,$77,$AA,$01;- D 0 - - - 0x00CA64 06:8A54:
	.byte $00,$00,$00               ;- - - - - - 0x00CA73 06:8A63:
	.word $AA00, $AA82, $AA9A, $AAB2, $AAE2, $ABFE, $AB1F, $AB30;W 0x00CA76 06:8A66:
	.word $AB47, $AB64, $AB79, $AB8F, $ABA6, $ABBF, $ABCF;W 0x00CA86 06:8A76:
	.byte $E4                       ;W 0x00CA94 06:8A84:
tbl_06_8A85:
	.word $F9AB, $1AAC, $55AC, $6CAC, $B3AC, $CBAC, $E2AC, $F7AC;W 0x00CA95 06:8A85:
	.word $0BAD, $32AD, $47AD, $56AD, $6BAD, $A9AD, $BAAD, $C9AD;W 0x00CAA5 06:8A95:
	.word $E8AD, $FAAD, $20AE, $34AE;W 0x00CAB5 06:8AA5:
	.byte $AE                       ;- D 0 - - - 0x00CABD 06:8AAD:
	.byte $4A,$1F,$15,$60,$10,$00,$00,$00,$00,$1F,$13,$C0,$10,$76,$02,$0A;- D 0 - - - 0x00CABE 06:8AAE:
	.byte $00,$1C,$12,$C0,$12,$00,$00,$00,$00,$1F,$0E,$90;- D 0 - I - 0x00CACE 06:8ABE:
	.byte $10                       ;- - - - - - 0x00CADA 06:8ACA:
	.byte $00,$00,$00,$00,$1F,$13,$C0,$0C,$76,$02,$0A,$00,$1F,$1C,$C0,$15;- D 0 - I - 0x00CADB 06:8ACB:
	.byte $C0,$7D,$76,$00,$1F,$1E,$90,$1A,$00,$00,$00,$00,$1C,$12,$C0,$12;- D 0 - I - 0x00CAEB 06:8ADB:
	.byte $70,$07,$00               ;- D 0 - I - 0x00CAFB 06:8AEB:
	.byte $00                       ;- - - - - - 0x00CAFE 06:8AEE:
	.byte $1D,$1C,$B0,$0F,$00,$00,$00,$00;- D 0 - I - 0x00CAFF 06:8AEF:
	.byte $1F,$1F,$F0,$0F,$BC,$6F,$00,$00;- - - - - - 0x00CB07 06:8AF7:
	.byte $1F,$0E,$90,$10,$E4,$03,$00;- D 0 - I - 0x00CB0F 06:8AFF:
	.byte $00                       ;- - - - - - 0x00CB16 06:8B06:
	.byte $1F,$1B,$60               ;- D 0 - I - 0x00CB17 06:8B07:
	.byte $15                       ;- - - - - - 0x00CB1A 06:8B0A:
	.byte $FF,$05,$00,$00,$1F,$1F,$50;- D 0 - I - 0x00CB1B 06:8B0B:
	.byte $1F                       ;- - - - - - 0x00CB22 06:8B12:
	.byte $00,$00,$00,$00,$1F,$1F,$F0,$0F,$00,$00,$00,$00,$1F,$1F,$F0,$0F;- D 0 - I - 0x00CB23 06:8B13:
	.byte $00,$00,$00,$80,$1C,$1C,$E0,$10,$00,$00,$00;- D 0 - I - 0x00CB33 06:8B23:
	.byte $00                       ;- - - - - - 0x00CB3E 06:8B2E:
	.byte $1F,$1F,$F0               ;- D 0 - I - 0x00CB3F 06:8B2F:
	.byte $1F                       ;- - - - - - 0x00CB42 06:8B32:
	.byte $FF,$4B,$00               ;- D 0 - I - 0x00CB43 06:8B33:
	.byte $00                       ;- - - - - - 0x00CB46 06:8B36:
	.byte $1F,$1F,$F0,$1F,$BC,$6F,$00,$00,$19,$12,$E0,$0F,$00,$00,$00,$00;- D 0 - I - 0x00CB47 06:8B37:
	.byte $1F,$1F,$F0,$1F,$00,$00,$00,$00,$1F;- D 0 - I - 0x00CB57 06:8B47:
	.byte $1F,$F0                   ;- - - - - - 0x00CB60 06:8B50:
	.byte $19,$E4,$03,$00           ;- D 0 - I - 0x00CB62 06:8B52:
	.byte $00                       ;- - - - - - 0x00CB66 06:8B56:
	.byte $00,$8B,$60,$8C,$60,$8C,$E7,$8D,$98,$05,$02,$2E,$0A,$FD,$06,$F0;- D 0 - I - 0x00CB67 06:8B57:
	.byte $07,$0B,$09,$02,$18,$C0,$C0,$04,$00,$04,$00,$04,$00,$08,$02,$D6;- D 0 - I - 0x00CB77 06:8B67:
	.byte $0D,$7F,$01,$03,$CA,$08,$07,$8A,$01,$CA,$08,$02,$0D,$00,$12,$08;- D 0 - I - 0x00CB87 06:8B77:
	.byte $8B,$9D,$88,$86,$85,$A6,$85,$83,$85,$83,$81,$03,$B8,$B9,$02,$B6;- D 0 - I - 0x00CB97 06:8B87:
	.byte $98,$99,$0E,$01,$8B,$72,$85,$83,$85,$01,$86,$08,$07,$01,$86,$08;- D 0 - I - 0x00CBA7 06:8B97:
	.byte $02,$85,$83,$81,$03       ;- D 0 - I - 0x00CBB7 06:8BA7:
tbl_06_8BAC:
	.byte $98,$99,$14,$00,$8C,$52,$B8,$01,$D6,$08,$07,$02,$01,$B6,$08,$02;- D 0 - I - 0x00CBBC 06:8BAC:
	.byte $04,$40,$55,$0D,$32,$02,$01,$76,$0D,$00,$80,$96,$80,$96,$98,$99;- D 0 - I - 0x00CBCC 06:8BBC:
	.byte $12,$00,$8B,$E0,$94,$80,$74,$60,$01,$B6,$08,$07,$01,$D6,$08,$02;- D 0 - I - 0x00CBDC 06:8BCC:
	.byte $0E,$01,$8B,$BC,$9B,$80,$08,$07,$02,$BD,$08,$02,$9B,$80,$B9,$04;- D 0 - I - 0x00CBEC 06:8BDC:
	.byte $40,$55,$0D,$0A,$02,$01,$76,$0D,$00,$80,$96,$80,$96,$15,$00,$8C;- D 0 - I - 0x00CBFC 06:8BEC:
	.byte $03,$98,$99,$11,$01,$8B,$EB,$96,$98,$99,$9B,$01,$DD,$08,$07,$01;- D 0 - I - 0x00CC0C 06:8BFC:
	.byte $FD,$08,$02,$9E,$9D,$9B,$99,$02,$B8,$79,$60,$D9,$02,$BB,$9D,$7E;- D 0 - I - 0x00CC1C 06:8C0C:
	.byte $60,$9D,$7B,$60,$99,$01,$76,$0D,$78,$01,$B8,$60,$01,$78,$01,$B9;- D 0 - I - 0x00CC2C 06:8C1C:
	.byte $60,$01,$7A,$01,$BB,$A0,$02,$01,$9D,$08,$07,$01,$DD,$04,$00,$08;- D 0 - I - 0x00CC3C 06:8C2C:
	.byte $02,$F6,$01,$7D,$02,$03,$8A,$08,$07,$02,$01,$CA,$11,$01,$8C,$39;- D 0 - I - 0x00CC4C 06:8C3C:
	.byte $0D,$00,$10,$01,$8B,$70,$03,$88,$80,$01,$CA,$08,$07,$02,$01,$AA;- D 0 - I - 0x00CC5C 06:8C4C:
	.byte $16,$8B,$6E               ;- D 0 - I - 0x00CC6C 06:8C5C:
	.byte $17                       ;- - - - - - 0x00CC6F 06:8C5F:
	.byte $06,$F0,$07,$09,$08,$02,$09,$02,$18,$C0,$C0,$04,$00,$04,$00,$04;- D 0 - I - 0x00CC70 06:8C60:
	.byte $00,$C6,$68,$6A,$6C,$6D,$8F,$02,$D1,$8C,$8A,$88,$C6,$12,$00,$8C;- D 0 - I - 0x00CC80 06:8C70:
	.byte $8F,$68,$6A,$6C,$6D,$8F,$02,$D1,$8F,$8D,$8A,$0E,$01,$8C,$6F,$A8;- D 0 - I - 0x00CC90 06:8C80:
	.byte $8A,$01,$91,$08,$07,$01,$F1,$08,$02,$13,$00,$8C,$E3,$01,$C6,$01;- D 0 - I - 0x00CCA0 06:8C90:
	.byte $86,$A8,$8F,$80,$CD,$83,$85,$86,$01,$C8,$01,$88;- D 0 - I - 0x00CCB0 06:8CA0:
tbl_06_8CAC:
	.byte $A6,$AC,$02,$AD,$A8,$A6,$02,$C6,$80,$01,$88,$01,$E8,$01,$EA,$01;- D 0 - I - 0x00CCBC 06:8CAC:
	.byte $EA,$E6,$E8,$02,$A8,$02,$A6,$A5,$A0,$02,$C5,$02,$AA,$8A,$02,$AA;- D 0 - I - 0x00CCCC 06:8CBC:
	.byte $6A,$68,$02,$A6,$86,$02,$A6,$66,$68,$02,$AA,$8A,$02,$AA,$6A,$6C;- D 0 - I - 0x00CCDC 06:8CCC:
	.byte $02,$CD,$AC,$0F,$01,$8C,$6D,$16,$8C,$6B;- D 0 - I - 0x00CCEC 06:8CDC:
	.byte $17                       ;- - - - - - 0x00CCF6 06:8CE6:
	.byte $06,$64,$08,$05,$09,$03,$91,$71,$6F,$80,$94,$04,$00,$04,$00,$04;- D 0 - I - 0x00CCF7 06:8CE7:
	.byte $00,$04,$00,$06,$E6,$08,$00,$8A,$8A,$8A;- D 0 - I - 0x00CD07 06:8CF7:
	.word $AC8A, $AD8C              ;W 0x00CD11 06:8D01:
	.byte $8D,$8D,$6D,$6D,$80,$14,$00,$8D,$20,$12,$00,$8D,$19,$8F,$8D,$8C;- D 0 - I - 0x00CD15 06:8D05:
	.byte $0E,$01,$8C,$F8,$92,$91,$8D,$10,$01,$8C,$F4,$8C,$8D,$8F,$92,$92;- D 0 - I - 0x00CD25 06:8D15:
	.byte $92,$72,$72,$02,$91,$71,$8D,$01,$8A,$01,$EA,$13,$00,$8D,$94,$8F;- D 0 - I - 0x00CD35 06:8D25:
	.byte $91,$92,$AC,$8D,$8F,$8C,$80,$8D,$02,$CA,$8F,$8F,$8F,$8F,$8F,$AD;- D 0 - I - 0x00CD45 06:8D35:
	.byte $A8,$02,$AA,$AC,$AD,$8F,$8D,$8C,$8A,$8C,$8D,$8F,$B1,$8F,$8D,$8C;- D 0 - I - 0x00CD55 06:8D45:
	.byte $8D,$8F,$91,$92,$02,$B4,$92,$91,$AF,$92,$B1,$8F,$D1,$8F,$02,$B2;- D 0 - I - 0x00CD65 06:8D55:
	.byte $91,$02,$AF,$8D,$02,$AC,$8D,$8F,$91,$92;- D 0 - I - 0x00CD75 06:8D65:
	.word $B291, $B180, $AC80       ;W 0x00CD7F 06:8D6F:
	.byte $A0,$02,$D1,$02,$AD,$8D,$02,$AD,$6D,$6C,$02,$AA,$8A,$02,$AA,$6A;- D 0 - I - 0x00CD85 06:8D75:
	.byte $6C,$02,$AD,$8D,$02,$AD,$6D,$6F,$02,$D1,$AF,$0F,$01,$8C,$F6,$16;- D 0 - I - 0x00CD95 06:8D85:
	.byte $8C,$F2                   ;- D 0 - I - 0x00CDA5 06:8D95:
	.byte $17                       ;- - - - - - 0x00CDA7 06:8D97:
	.byte $06,$96,$07,$0B,$08,$06,$8A,$6A,$6A,$65,$65,$8A,$04,$00,$04,$00;- D 0 - I - 0x00CDA8 06:8D98:
	.byte $04,$00,$04,$00,$65,$6F,$6F,$6F,$68,$6F,$6F,$6F,$65,$6F,$6F,$6F;- D 0 - I - 0x00CDB8 06:8DA8:
	.byte $68,$6F,$65,$6F,$15,$00,$8D,$D0,$65,$6F,$6F,$6F,$88,$85,$6C,$6C;- D 0 - I - 0x00CDC8 06:8DB8:
	.byte $85,$68,$68,$88,$11,$01,$8D,$AA,$85,$88,$88,$85,$6C,$6C,$6A,$6A;- D 0 - I - 0x00CDD8 06:8DC8:
	.byte $6C,$6C,$88,$0E,$01,$8D,$A8,$13,$00,$8E,$17,$04,$00,$A5,$88,$A5;- D 0 - I - 0x00CDE8 06:8DD8:
	.byte $85,$A8,$85,$8F,$8F,$85,$8F,$8F,$88,$85,$0E,$04,$8D,$E3,$A5,$88;- D 0 - I - 0x00CDF8 06:8DE8:
	.byte $A5,$88,$A5,$A5,$88,$80,$88,$68,$68,$68,$68,$68,$68,$04,$00,$88;- D 0 - I - 0x00CE08 06:8DF8:
	.byte $6F,$6F,$10,$0B,$8E,$05,$AC,$AC,$AC,$88,$85,$0F,$01,$8D,$A6,$16;- D 0 - I - 0x00CE18 06:8E08:
	.byte $8D,$A4                   ;- D 0 - I - 0x00CE28 06:8E18:
	.byte $17                       ;- - - - - - 0x00CE2A 06:8E1A:
	.byte $00,$8E,$24,$8E,$FC,$8F,$C6,$90,$8B,$05,$02,$49,$06,$E6,$09,$01;- D 0 - I - 0x00CE2B 06:8E1B:
	.byte $18,$C0,$04,$08,$04,$08,$07,$09,$08,$02,$AC,$8B,$8C,$80,$AE,$87;- D 0 - I - 0x00CE3B 06:8E2B:
	.byte $01,$B0,$08,$07,$01,$D0,$08,$02,$AE,$8C,$8E,$90,$8E,$80,$AB,$87;- D 0 - I - 0x00CE4B 06:8E3B:
	.byte $12,$08,$8E,$56,$C9,$A9,$AB,$0E,$01,$8E,$2F,$01,$E9,$08,$07,$01;- D 0 - I - 0x00CE5B 06:8E4B:
	.byte $E9,$04,$00,$08           ;- D 0 - I - 0x00CE6B 06:8E5B:
	.word $A002, $AC03, $A78B       ;W 0x00CE6F 06:8E5F:
	.byte $A9,$89,$AC,$8B,$A7,$12,$08,$8E,$80,$01,$85,$08,$07,$01,$E5,$08;- D 0 - I - 0x00CE75 06:8E65:
	.byte $02,$01,$C7,$08,$07,$01,$C7,$0E,$01,$8E,$5C,$01,$90,$08,$07,$01;- D 0 - I - 0x00CE85 06:8E75:
	.byte $F0,$08,$02,$CE,$CB,$18,$80,$04,$08,$8B,$AC,$01,$AC,$08,$07,$02;- D 0 - I - 0x00CE95 06:8E85:
	.byte $01,$AC,$08,$02,$80,$8C,$8B,$89,$8B,$AC,$12,$08,$8E,$A8,$89,$0E;- D 0 - I - 0x00CEA5 06:8E95:
	.byte $01,$8E,$8C,$AE,$8C,$8E,$01,$A9,$08,$07,$02,$01,$A9,$08,$02,$80;- D 0 - I - 0x00CEB5 06:8EA5:
	.byte $AE,$8E,$A9,$AE,$B0,$91,$02,$AE,$A7,$91,$90,$91,$B0,$AE,$8B,$18;- D 0 - I - 0x00CEC5 06:8EB5:
	.byte $C0,$02,$AC,$02,$AE,$B0,$02,$AE,$02,$AB,$A7,$02,$A9,$02,$AB,$AC;- D 0 - I - 0x00CED5 06:8EC5:
	.byte $8B,$8C,$8B,$01,$A7,$08,$07,$01,$A7,$80,$08,$02,$02,$AC,$02,$AE;- D 0 - I - 0x00CEE5 06:8ED5:
	.byte $B0,$8E,$8B,$89,$A7,$AB,$87,$C9,$80,$AC,$90,$07,$0C,$95,$60,$95;- D 0 - I - 0x00CEF5 06:8EE5:
	.byte $60,$95,$C0,$16,$8E,$2D   ;- D 0 - I - 0x00CF05 06:8EF5:
	.byte $17                       ;- - - - - - 0x00CF0B 06:8EFB:
	.byte $06,$E6,$09,$02,$18,$C0,$04,$00,$04,$00,$07,$08,$08,$02,$B5,$93;- D 0 - I - 0x00CF0C 06:8EFC:
	.byte $95,$80,$B7,$8E,$98,$97,$95,$98,$97,$95,$93,$90,$95,$97,$98,$97;- D 0 - I - 0x00CF1C 06:8F0C:
	.byte $80,$B3,$8E,$12,$00,$8F,$2D,$90,$91,$93,$91,$B0,$AE,$0E,$01,$8F;- D 0 - I - 0x00CF2C 06:8F1C:
	.byte $04,$90,$90,$8E,$90,$80,$AE,$90,$95,$90,$95,$98,$9C,$03,$89,$64;- D 0 - I - 0x00CF3C 06:8F2C:
	.byte $03,$78,$75,$70,$04,$00,$04,$00,$02,$89,$75,$80,$02,$B0,$AC,$0E;- D 0 - I - 0x00CF4C 06:8F3C:
	.byte $01,$8F,$42,$02,$89,$75,$80,$02,$B1,$AC,$02,$8B,$77,$80,$02,$B3;- D 0 - I - 0x00CF5C 06:8F4C:
	.byte $AE,$0F,$01,$8F,$40,$90,$B1,$B1,$8C,$95,$6C,$6E,$91,$95,$91,$91;- D 0 - I - 0x00CF6C 06:8F5C:
	.byte $95,$B5,$91,$8E,$B0,$B0,$8C,$93,$6C,$6E,$90,$93,$90,$90,$93,$B3;- D 0 - I - 0x00CF7C 06:8F6C:
	.byte $B1,$91,$91,$B1,$8C,$6E,$70,$71,$75,$9A,$B1,$91,$B1,$B1,$B3,$93;- D 0 - I - 0x00CF8C 06:8F7C:
	.byte $B3,$8E,$90,$8E,$B4,$94,$B4,$90,$92,$94,$02,$B5,$02;- D 0 - I - 0x00CF9C 06:8F8C:
	.word $B8B7, $B702, ofs_03_B303-1;W 0x00CFA9 06:8F99:
	.byte $AE,$02,$B1,$02,$B3,$B5,$02,$B3,$B0,$8B,$90,$97,$02,$B5,$02,$B7;- D 0 - I - 0x00CFAF 06:8F9F:
	.byte $B8,$97,$B3,$AE,$AE,$8E,$90,$90,$8E,$90,$80,$B5,$98,$9C,$60,$9C;- D 0 - I - 0x00CFBF 06:8FAF:
	.byte $60,$9C,$C0,$16,$8F,$02   ;- D 0 - I - 0x00CFCF 06:8FBF:
	.byte $17                       ;- - - - - - 0x00CFD5 06:8FC5:
	.byte $06,$DC,$08,$00,$09,$02,$04,$00,$04,$00,$B1,$80,$91,$80,$93,$B3;- D 0 - I - 0x00CFD6 06:8FC6:
	.byte $95,$95,$95,$95,$80,$B3,$93,$B1,$80,$91,$80,$93,$B3,$12,$00,$8F;- D 0 - I - 0x00CFE6 06:8FD6:
	.byte $F1,$95,$95,$95,$95,$B3,$B3,$0E,$01,$8F,$CE,$B5,$B5,$B5,$B5,$04;- D 0 - I - 0x00CFF6 06:8FE6:
	.byte $00,$75,$60,$90,$0E,$03,$8F,$F5,$04,$00,$04,$00,$02,$95,$75,$80;- D 0 - I - 0x00D006 06:8FF6:
	.byte $B5,$93,$90,$93,$0E,$01,$90,$00,$02,$91,$71,$80,$B1,$93,$95,$91;- D 0 - I - 0x00D016 06:9006:
	.byte $02,$93,$73,$80,$B3,$97,$9A,$97,$0F,$01,$8F,$FE,$04,$00,$AE,$80;- D 0 - I - 0x00D026 06:9016:
	.byte $AE,$91,$95,$9A,$AE,$80,$AE,$91,$95,$9A,$12,$00,$90,$44,$AC,$80;- D 0 - I - 0x00D036 06:9026:
	.byte $AC,$90,$93,$98,$AC,$80,$AC,$90,$93,$98,$0E,$01,$90,$22,$B0,$80;- D 0 - I - 0x00D046 06:9036:
	.byte $B0,$93,$97,$9A,$B0,$80,$B0,$94,$97,$9A,$95,$95,$95,$B5,$97,$98;- D 0 - I - 0x00D056 06:9046:
	.byte $95,$93,$93,$93,$B3,$95,$97,$93,$91,$91,$91,$B1,$93,$95,$91,$90;- D 0 - I - 0x00D066 06:9056:
	.byte $90,$90,$B0,$91,$93,$90,$91,$91,$91,$B1,$93,$95,$91,$93,$93,$93;- D 0 - I - 0x00D076 06:9066:
	.byte $B3,$95,$97,$93,$95,$95,$95,$B5,$97,$98,$97,$95,$60,$95,$60,$95;- D 0 - I - 0x00D086 06:9076:
	.byte $C0,$16,$8F,$CC           ;- D 0 - I - 0x00D096 06:9086:
	.byte $17                       ;- - - - - - 0x00D09A 06:908A:
	.byte $06,$8C,$07,$09,$08,$06,$04,$00,$04,$00,$04,$00,$85,$85,$8A,$12;- D 0 - I - 0x00D09B 06:908B:
	.byte $00,$90,$A5,$A5,$85,$AA,$0E,$03,$90,$95,$85,$13,$00,$90,$B0,$AB;- D 0 - I - 0x00D0AB 06:909B:
	.byte $AB,$0F,$01,$90,$93,$85,$85,$8A,$85,$85,$85,$8A,$85,$65,$6C,$6C;- D 0 - I - 0x00D0BB 06:90AB:
	.byte $6C,$6B,$6B,$66,$66,$04,$00,$02,$85,$65,$8A,$A5,$85,$AA,$0E,$07;- D 0 - I - 0x00D0CB 06:90BB:
	.byte $90,$C0,$04,$00,$A5,$8A,$A5,$85,$8A,$8A,$0E,$07,$90,$CD,$04,$00;- D 0 - I - 0x00D0DB 06:90CB:
	.byte $65,$65,$85,$8A,$A5,$85,$8A,$85,$0E,$06,$90,$D9,$02,$8B,$02,$8B;- D 0 - I - 0x00D0EB 06:90DB:
	.byte $8B,$04,$00,$6A,$0E,$07,$90,$EC,$16,$90,$91;- D 0 - I - 0x00D0FB 06:90EB:
	.byte $17                       ;- - - - - - 0x00D106 06:90F6:
	.byte $00,$91,$00,$91,$F6,$92,$AE,$93,$36,$05,$02,$49,$0A,$01,$06,$F0;- D 0 - I - 0x00D107 06:90F7:
	.byte $07,$08,$08,$02,$09,$02,$18,$40,$90,$92,$90,$04,$00,$04,$00,$04;- D 0 - I - 0x00D117 06:9107:
	.byte $00,$02,$92,$60,$01,$74,$0D,$7F,$75,$01,$95,$94,$B5,$01,$97,$08;- D 0 - I - 0x00D127 06:9117:
	.byte $07,$01,$97,$08,$02,$95,$94,$B5,$B4,$90,$02,$92,$60,$B5,$94,$B5;- D 0 - I - 0x00D137 06:9127:
	.byte $0D,$00,$12,$00,$91,$5B,$01,$03,$8B,$0D,$14,$01,$8D,$0D,$00,$A9;- D 0 - I - 0x00D147 06:9137:
	.byte $86,$08,$07,$01,$B0,$07,$06,$90,$07,$03,$01,$90,$08,$02,$07,$08;- D 0 - I - 0x00D157 06:9147:
	.byte $0E,$01,$91,$16,$13,$00,$91,$6F,$01,$76,$0D,$7F,$77,$02,$01,$B7;- D 0 - I - 0x00D167 06:9157:
	.byte $D9,$0D,$00,$80,$0F,$01,$91,$14,$01,$B4,$08,$07,$01,$B4,$08,$02;- D 0 - I - 0x00D177 06:9167:
	.byte $01,$B3,$08,$07,$01,$B3,$08,$02,$80,$04,$00,$04,$00,$9E,$7E,$9E;- D 0 - I - 0x00D187 06:9177:
	.byte $7C,$03,$89,$66,$86,$86,$64,$69,$6B,$12,$08,$91,$A1,$80,$8C,$8B;- D 0 - I - 0x00D197 06:9187:
	.byte $89,$02,$8B,$02,$89,$84,$0E,$01,$91,$82,$13,$08,$91,$B5,$80,$8C;- D 0 - I - 0x00D1A7 06:9197:
	.byte $8B,$89,$01,$A6,$08,$07,$01,$A6,$08,$02,$0F,$01,$91,$80,$80,$AC;- D 0 - I - 0x00D1B7 06:91A7:
	.byte $01,$8D,$08,$07,$01,$CD,$08,$02,$01,$CE,$08,$07,$01,$CE,$08,$02;- D 0 - I - 0x00D1C7 06:91B7:
	.byte $01,$CD,$08,$07,$01,$CD,$08,$02,$04,$00,$B2,$B5,$94,$B5,$B7,$95;- D 0 - I - 0x00D1D7 06:91C7:
	.byte $94,$B5,$B4,$90,$B2,$B5,$94,$B5,$12,$00,$91,$EF,$B7,$99,$97,$95;- D 0 - I - 0x00D1E7 06:91D7:
	.byte $97,$95,$94,$90,$0E,$01,$91,$CF,$D4,$D3,$90,$16,$91,$12;- D 0 - I - 0x00D1F7 06:91E7:
	.byte $17                       ;- - - - - - 0x00D205 06:91F5:
	.byte $06,$F0,$07,$08,$08,$02,$09,$02,$18,$40,$8B,$8D,$8B,$04,$00,$04;- D 0 - I - 0x00D206 06:91F6:
	.byte $00,$04,$00,$02,$8D,$60,$B0,$0D,$7F,$8F,$B0,$01,$51,$02,$92,$01;- D 0 - I - 0x00D216 06:9206:
	.byte $52,$90,$8F,$B0,$AF,$8B,$02,$8D,$60,$B0,$8F,$B0,$0D,$00,$12,$00;- D 0 - I - 0x00D226 06:9216:
	.byte $92,$37,$01,$B7,$08,$07,$01,$D7,$08,$02,$95,$94,$90,$0E,$01,$92;- D 0 - I - 0x00D236 06:9226:
	.byte $07,$13,$00,$92,$42,$D2,$D4,$80,$0F,$01,$92,$05,$CF,$CE,$80,$0C;- D 0 - I - 0x00D246 06:9236:
	.byte $02,$04,$00,$04,$00,$99,$79,$99,$77,$03,$89,$61,$81,$81,$03,$77;- D 0 - I - 0x00D256 06:9246:
	.byte $03,$69,$6B,$12,$08,$92,$6B,$80,$87,$86,$84,$02,$86,$02,$84,$03;- D 0 - I - 0x00D266 06:9256:
	.byte $97,$0E,$01,$92,$49,$13,$08,$92,$78,$80,$8C,$85,$84,$C1,$0F,$01;- D 0 - I - 0x00D276 06:9266:
	.byte $92,$47,$80,$A7,$01,$88,$08,$07,$01,$C8,$08,$02,$03,$F5,$F4,$0C;- D 0 - I - 0x00D286 06:9276:
	.byte $00,$04,$00,$AD,$B0,$8F,$B0,$B2,$90,$8F,$B0,$AF,$8B,$AD,$B0,$8F;- D 0 - I - 0x00D296 06:9286:
	.byte $B0,$12,$00,$92,$A7,$B2,$94,$92,$90,$92,$90,$8F,$8B,$0E,$01,$92;- D 0 - I - 0x00D2A6 06:9296:
	.byte $87,$CF,$CE,$8B,$16,$92,$03;- D 0 - I - 0x00D2B6 06:92A6:
	.byte $17                       ;- - - - - - 0x00D2BD 06:92AD:
	.byte $06,$E6,$09,$02,$08,$00,$95,$95,$95,$04,$00,$B2,$80,$E0,$A0,$90;- D 0 - I - 0x00D2BE 06:92AE:
	.byte $90,$90,$B2,$02,$C0,$80,$99,$97,$95,$97,$92,$94,$90,$B2,$B2,$C0;- D 0 - I - 0x00D2CE 06:92BE:
	.byte $80,$8B,$8C,$8D,$8E,$8F,$90,$91,$D2,$8B,$B2,$CB,$69,$6B,$AD,$B0;- D 0 - I - 0x00D2DE 06:92CE:
	.byte $04,$00,$04,$00,$04,$00,$04,$00,$52,$40,$52,$40,$92,$0E,$05,$92;- D 0 - I - 0x00D2EE 06:92DE:
	.byte $E4,$15,$00,$92,$FA,$AD,$90,$8D,$11,$01,$92,$E2,$97,$95,$94,$95;- D 0 - I - 0x00D2FE 06:92EE:
	.byte $0F,$01,$92,$E0,$14,$00,$93,$32,$04,$00,$04,$00,$92,$0E,$07,$93;- D 0 - I - 0x00D30E 06:92FE:
	.byte $08,$04,$00,$98,$0E,$07,$93,$0F,$04,$00,$92,$0E,$07,$93,$16,$98;- D 0 - I - 0x00D31E 06:930E:
	.byte $98,$98,$97,$96,$95,$94,$93,$0F,$01,$93,$06,$F5,$D4,$97,$99,$B0;- D 0 - I - 0x00D32E 06:931E:
	.byte $10,$01,$92,$DE,$16,$92,$B7;- D 0 - I - 0x00D33E 06:932E:
	.byte $17                       ;- - - - - - 0x00D345 06:9335:
	.byte $06,$96,$07,$0B,$08,$00,$8A,$8A,$8A,$04,$40,$0D,$32,$8D,$8B,$01;- D 0 - I - 0x00D346 06:9336:
	.byte $89,$E0,$C0,$88,$01,$8D,$8B,$01,$A9,$C0,$E0,$01,$8D,$01,$8B,$01;- D 0 - I - 0x00D356 06:9346:
	.byte $8D,$8B,$01,$A9,$E0,$6A,$6A,$66,$66,$01,$8D,$8B,$01,$89,$C0,$89;- D 0 - I - 0x00D366 06:9356:
	.byte $01,$8D,$01,$88,$80,$A9,$6A,$6A,$69,$69,$68,$68,$08,$06,$04,$00;- D 0 - I - 0x00D376 06:9366:
	.byte $65,$4F,$40,$68,$4F,$40,$0E,$1F,$93,$74,$04,$00,$85,$88,$0E,$1F;- D 0 - I - 0x00D386 06:9376:
	.byte $93,$80,$AE,$AB,$AB,$AB,$AE,$AB,$AB,$AB,$04,$00,$65,$4F,$40,$66;- D 0 - I - 0x00D396 06:9386:
	.byte $4F,$40,$0E,$1B,$93,$90,$08,$00,$6B,$65,$88,$6D,$6D,$8A,$66,$66;- D 0 - I - 0x00D3A6 06:9396:
	.byte $85,$85,$8E,$16,$93,$3F   ;- D 0 - I - 0x00D3B6 06:93A6:
	.byte $17                       ;- - - - - - 0x00D3BC 06:93AC:
	.byte $00                       ;- D 0 - I - 0x00D3BD 06:93AD:
	.word ofs_03_B691+2, ofs_0E_C194;W 0x00D3BE 06:93AE:
	.byte $95,$7A,$96,$5E,$05,$01,$EB,$06,$F0,$07,$09,$08,$02,$09,$01,$18;- D 0 - I - 0x00D3C2 06:93B2:
	.byte $C0,$00,$5C,$7D,$00,$7B,$78,$7B,$78,$76,$78,$76,$74,$76,$74,$71;- D 0 - I - 0x00D3D2 06:93C2:
	.byte $74,$71,$6F,$6C,$6C,$6C,$60,$6C,$6D,$6D,$60,$6D,$6E,$6E,$60,$6E;- D 0 - I - 0x00D3E2 06:93D2:
	.byte $70,$70,$60,$70,$04,$08,$04,$08,$02,$8C,$6A,$80,$A8,$87,$88,$8A;- D 0 - I - 0x00D3F2 06:93E2:
	.byte $02,$8C,$6A,$80,$01,$68,$08,$07,$01,$C8,$60,$08,$02,$0E,$01,$93;- D 0 - I - 0x00D402 06:93F2:
	.byte $E8,$02,$8D,$6C,$80,$AA,$88,$8A,$8C,$02,$8D,$6C,$80,$02,$01,$8A;- D 0 - I - 0x00D412 06:9402:
	.byte $01,$AA,$6A,$6C,$6D,$6D,$6C,$60,$01,$AC,$08,$07,$01,$CC,$08,$02;- D 0 - I - 0x00D422 06:9412:
	.byte $60                       ;- D 0 - I - 0x00D432 06:9422:
	.word $B300, $ACB0, $A8AA       ;W 0x00D433 06:9423:
	.byte $A7,$00,$68,$65,$60,$01,$65,$08,$07,$01,$C5,$08,$02,$60,$65,$67;- D 0 - I - 0x00D439 06:9429:
	.byte $68                       ;- D 0 - I - 0x00D449 06:9439:
	.word $AA02, $A702, $ACAA, $AA80;W 0x00D44A 06:943A:
	.byte $80,$01,$A8,$08,$07,$01,$C8,$08,$02,$80,$88,$87,$85,$67,$03,$78;- D 0 - I - 0x00D452 06:9442:
	.byte $60,$01,$D8,$01,$98,$60,$78,$79,$D8,$00,$B8,$BC,$BF,$02,$00,$01;- D 0 - I - 0x00D462 06:9452:
	.byte $03,$CA,$01,$6A,$60,$6A,$6C,$CD,$00,$AF,$AD,$AA,$04,$08,$04,$08;- D 0 - I - 0x00D472 06:9462:
	.byte $6C,$6C,$60,$6A,$6A,$60,$A8,$87,$88,$8A,$6C,$6C,$60,$6A,$6A,$60;- D 0 - I - 0x00D482 06:9472:
	.byte $13,$08,$94,$99,$01,$68,$08,$07,$01,$C8,$08,$02,$60,$0E,$01,$94;- D 0 - I - 0x00D492 06:9482:
	.byte $70,$0B,$05,$0F,$01,$94,$6E,$0B,$00,$02,$AD,$60,$6D,$6C,$6A,$6D;- D 0 - I - 0x00D4A2 06:9492:
	.byte $6C,$60,$01,$AC,$08,$07,$01,$CC,$60,$08,$02,$01,$B0,$08,$07,$01;- D 0 - I - 0x00D4B2 06:94A2:
	.byte $B0,$08,$02,$01,$B3,$08,$07,$01,$B3,$08,$02,$16,$93,$E6;- D 0 - I - 0x00D4C2 06:94B2:
	.byte $17                       ;- - - - - - 0x00D4D0 06:94C0:
	.byte $06,$F0,$07,$08,$08,$02,$09,$02,$18,$C0,$E0,$E0,$04,$00,$04,$00;- D 0 - I - 0x00D4D1 06:94C1:
	.byte $02,$91,$71,$80,$B1,$8F,$91,$93,$02,$91,$71,$80,$02,$B1,$12,$00;- D 0 - I - 0x00D4E1 06:94D1:
	.byte $94,$EB,$71,$70,$6F,$6E,$0E,$01,$94,$CF,$6D,$6F,$71,$6D,$02,$93;- D 0 - I - 0x00D4F1 06:94E1:
	.byte $73,$80,$B3,$91,$93,$94,$02,$93,$73,$80,$02,$B3,$AF,$6F,$6F,$60;- D 0 - I - 0x00D501 06:94F1:
	.byte $01,$AF,$02,$01,$8F,$8C,$8D,$8F,$00,$B0,$B0,$B0,$B0,$B1,$B0,$00;- D 0 - I - 0x00D511 06:9501:
	.byte $71,$6D,$60,$8D,$68,$6A,$6C,$CD,$02,$B3,$02,$AF,$B3,$B4,$80,$B3;- D 0 - I - 0x00D521 06:9511:
	.byte $80,$02,$D1,$80,$91,$8F,$8D,$6C,$67,$60,$01,$C7,$01,$87,$60,$67;- D 0 - I - 0x00D531 06:9521:
	.byte $68,$C7,$00,$A7,$AC,$B0,$02,$00,$01,$D3,$01,$73,$60,$73,$74,$D6;- D 0 - I - 0x00D541 06:9531:
	.byte $00,$B6,$B6,$B3,$04,$00,$74,$74,$60,$73,$73,$60,$B1,$8F,$91,$93;- D 0 - I - 0x00D551 06:9541:
	.byte $74,$74,$60,$73,$73,$60,$12,$00,$95,$64,$01,$71,$01,$D1,$60,$0E;- D 0 - I - 0x00D561 06:9551:
	.byte $02,$95,$45,$02,$B1,$60,$71,$6F,$6D,$71,$70,$60,$01,$D0,$01,$90;- D 0 - I - 0x00D571 06:9561:
	.byte $6E,$70,$71,$D3,$D6,$16,$94,$CD;- D 0 - I - 0x00D581 06:9571:
	.byte $17                       ;- - - - - - 0x00D589 06:9579:
	.byte $06,$C8,$08,$00,$09,$02,$E0,$AC,$AD,$AE,$B0,$04,$00,$04,$00,$02;- D 0 - I - 0x00D58A 06:957A:
	.byte $91,$71,$80,$91,$80,$91,$8F,$91,$71,$02,$91,$B1,$02,$91,$12,$00;- D 0 - I - 0x00D59A 06:958A:
	.byte $95,$B7,$02,$8F,$8E,$02,$8D,$6D,$80,$8D,$80,$8D,$8C,$8D,$6D,$02;- D 0 - I - 0x00D5AA 06:959A:
	.byte $8D,$AD,$02,$8D,$02,$8F,$91,$0B,$FE,$0E,$01,$95,$87,$0B,$00,$02;- D 0 - I - 0x00D5BA 06:95AA:
	.byte $93,$96,$02,$94,$74,$80,$94,$80,$94,$93,$91,$8C,$8C,$60,$02,$8C;- D 0 - I - 0x00D5CA 06:95BA:
	.byte $02,$8C,$67,$6C,$6E,$70,$71,$04,$00,$8D,$8D,$60,$02,$8D,$02,$8D;- D 0 - I - 0x00D5DA 06:95CA:
	.byte $68,$6D,$68,$6D,$71,$0B,$02,$0E,$01,$95,$D1,$0B,$00,$AF,$80,$B0;- D 0 - I - 0x00D5EA 06:95DA:
	.byte $80,$B1,$71,$71,$91,$91,$71,$91,$60,$91,$8F,$8D,$04,$00,$04,$00;- D 0 - I - 0x00D5FA 06:95EA:
	.byte $8C,$60,$6C,$6C,$67,$6C,$6D,$0E,$02,$95,$F8;- D 0 - I - 0x00D60A 06:95FA:
	.word $B300, $ADB0              ;W 0x00D615 06:9605:
	.byte $0F,$01,$95,$F6,$04,$00,$04,$00,$71,$91,$71,$91,$71,$02,$91,$71;- D 0 - I - 0x00D619 06:9609:
	.byte $6F,$71,$02,$94,$0E,$01,$96,$0F,$13,$00,$96,$41,$04,$00,$6D,$8D;- D 0 - I - 0x00D629 06:9619:
	.byte $6D,$8D,$6D,$02,$8D,$6D,$68,$6D,$12,$00,$96,$3B,$02,$91,$0E,$01;- D 0 - I - 0x00D639 06:9629:
	.byte $96,$25,$02,$8F,$0F,$01,$96,$0D,$78,$98,$78,$98,$78,$98,$78,$73;- D 0 - I - 0x00D649 06:9639:
	.byte $70,$73,$70,$6C,$67,$8C,$8C,$6C,$93,$90,$6C,$70,$6C,$73,$70,$76;- D 0 - I - 0x00D659 06:9649:
	.byte $73,$16,$95,$85           ;- D 0 - I - 0x00D669 06:9659:
	.byte $17                       ;- - - - - - 0x00D66D 06:965D:
	.byte $06,$78,$07,$09,$08,$06,$0D,$64,$01,$AC,$01,$8A,$0D,$00,$80,$65;- D 0 - I - 0x00D66E 06:965E:
	.byte $6A,$6A,$65,$6A,$02,$8A,$65,$04,$00,$6A,$0E,$0E,$96,$75,$04,$00;- D 0 - I - 0x00D67E 06:966E:
	.byte $04,$00,$02,$85,$65,$8A,$65,$85,$65,$85,$AA,$0E,$06,$96,$7E,$85;- D 0 - I - 0x00D68E 06:967E:
	.byte $06,$E6,$8C,$65,$02,$8C,$02,$8C,$65,$06,$78,$6A,$6A,$6A,$6A,$04;- D 0 - I - 0x00D69E 06:968E:
	.byte $00,$02,$85,$65,$8A,$65,$85,$65,$85,$AA,$0E,$01,$96,$9D,$04,$00;- D 0 - I - 0x00D6AE 06:969E:
	.byte $06,$E6,$AC,$06,$78,$12,$00,$96,$BC,$85,$0E,$02,$96,$AC,$65,$65;- D 0 - I - 0x00D6BE 06:96AE:
	.byte $8A,$8A,$65,$85,$65,$85,$6A,$6A,$8A,$04,$00,$02,$85,$65,$8A,$65;- D 0 - I - 0x00D6CE 06:96BE:
	.byte $85,$65,$85,$AA,$02,$85,$65,$8A,$65,$65,$06,$E6,$00,$AC,$AC,$AC;- D 0 - I - 0x00D6DE 06:96CE:
	.byte $06,$78,$0E,$01,$96,$C7,$04,$00,$65,$85,$65,$8A,$65,$85,$65,$85;- D 0 - I - 0x00D6EE 06:96DE:
	.byte $AA,$0E,$06,$96,$E4,$85,$06,$E6,$8C,$65,$02,$8C,$02,$8C,$06,$78;- D 0 - I - 0x00D6FE 06:96EE:
	.byte $65,$6A,$6A,$6A,$6A,$16,$96,$7C;- D 0 - I - 0x00D70E 06:96FE:
	.byte $17                       ;- - - - - - 0x00D716 06:9706:
	.byte $00,$97,$10,$97,$DC,$98,$9D,$99,$82,$05,$02,$86,$06,$E6,$07,$08;- D 0 - I - 0x00D717 06:9707:
	.byte $08,$0F,$09,$01,$18,$40,$01,$03,$CA,$01,$8A,$85,$8A,$01,$89,$02;- D 0 - I - 0x00D727 06:9717:
	.byte $01,$C9,$A5,$01,$C8,$01,$88,$AA,$01,$87,$01,$C7,$A5,$A3,$01,$CA;- D 0 - I - 0x00D737 06:9727:
	.byte $01,$8A,$AC,$A9,$A9,$89,$87,$02,$A5,$01,$C8,$01,$88,$AA,$A7,$A7;- D 0 - I - 0x00D747 06:9737:
	.byte $87,$85,$A3,$01,$E5,$01,$E5,$80,$04,$00,$A0,$03,$CD,$AC,$CA,$8A;- D 0 - I - 0x00D757 06:9747:
	.byte $02,$AC,$8A,$89,$80,$01,$85,$C5,$01,$E5,$A0,$CB,$AA,$C8,$88,$02;- D 0 - I - 0x00D767 06:9757:
	.byte $AA,$88,$86,$80,$C1,$80,$81,$61,$60,$61,$60,$61,$60,$80,$02,$A3;- D 0 - I - 0x00D777 06:9767:
	.byte $A0,$CD,$AC,$CA,$8A,$02,$AD,$8F,$8C,$80,$01,$88;- D 0 - I - 0x00D787 06:9777:
	.word $E801, ofs_06_8580, $8886 ;W 0x00D793 06:9783:
	.byte $8D,$8A,$80,$01,$86,$01,$E6,$80,$86,$88,$8A,$8C,$89,$80,$01,$85;- D 0 - I - 0x00D799 06:9789:
	.byte $01,$C5,$80,$AF,$04,$08,$8F,$8F,$8E,$8C,$8F,$8F,$AE,$AA,$02,$01;- D 0 - I - 0x00D7A9 06:9799:
	.byte $A5,$01,$C5,$00,$A2,$A3,$A5,$02,$00,$C6,$12,$08,$97,$BE,$AA,$02;- D 0 - I - 0x00D7B9 06:97A9:
	.byte $AF,$0E,$01,$97,$9D,$A8,$CA,$A8,$AA,$02,$AC,$01,$C8;- D 0 - I - 0x00D7C9 06:97B9:
	.word ofs_06_8802-1, $AC80, $A802;W 0x00D7D6 06:97C6:
	.byte $A3,$02,$A6,$C5,$80,$00,$B2,$B2,$B2,$00,$B1,$A0,$16,$97,$4F;- D 0 - I - 0x00D7DC 06:97CC:
	.byte $17                       ;- - - - - - 0x00D7EB 06:97DB:
	.byte $06,$E6,$07,$07,$08,$0F,$09,$02,$18,$C0,$01,$D1,$01,$91,$8D,$91;- D 0 - I - 0x00D7EC 06:97DC:
	.byte $AC,$8D,$8F,$02,$AC,$AC,$8F,$8D,$8C,$AC,$AF,$01,$8A,$01,$CA,$A7;- D 0 - I - 0x00D7FC 06:97EC:
	.byte $A7,$8D,$8F,$91,$CD,$02,$CC,$02,$A9,$8C,$8D,$8F,$CC,$EA,$A9,$8A;- D 0 - I - 0x00D80C 06:97FC:
	.byte $8C,$A9,$89,$AC,$8F,$91,$93,$B5,$B8,$9B,$04,$00,$A0,$D1,$AF,$CD;- D 0 - I - 0x00D81C 06:980C:
	.byte $8D,$02,$AF,$8D,$8C,$80,$01,$C9,$01,$89,$9D,$BB,$B9,$B8,$91,$A0;- D 0 - I - 0x00D82C 06:981C:
	.byte $CF,$AD,$CB,$8B,$02,$AD,$8B,$8A,$80,$C6,$80,$8A,$6A,$60,$6A,$60;- D 0 - I - 0x00D83C 06:982C:
	.byte $6A,$60,$80,$02,$A9,$A0,$D1,$AF,$CD,$8D,$02,$B1,$92,$8F,$80,$01;- D 0 - I - 0x00D84C 06:983C:
	.byte $CC,$01,$8C,$03,$88,$86,$83,$03,$B8,$88,$8A,$8C,$92,$8D,$80,$01;- D 0 - I - 0x00D85C 06:984C:
	.byte $CA,$01,$8A,$9E,$99,$98,$B6,$8A,$8C,$8D,$8F,$8F,$80,$01,$8F,$01;- D 0 - I - 0x00D86C 06:985C:
	.byte $CF,$80,$B5,$95,$D5,$04,$00,$F6,$DA,$00,$A5,$A7,$A9,$00,$EA,$02;- D 0 - I - 0x00D87C 06:986C:
	.byte $B2,$92,$D2,$0E,$01,$98,$71,$02,$AC,$AC,$8D,$8F,$8D,$80,$AC,$02;- D 0 - I - 0x00D88C 06:987C:
	.byte $AF,$AC,$02,$A9,$CC,$80,$00,$B5,$B5,$B5,$00,$B5,$A0,$16,$98,$16;- D 0 - I - 0x00D89C 06:988C:
	.byte $17                       ;- - - - - - 0x00D8AC 06:989C:
	.byte $06,$C8,$08,$00,$09,$03,$04,$00,$04,$00,$8A,$8A,$80,$8A,$80,$8A;- D 0 - I - 0x00D8AD 06:989D:
	.byte $80,$85,$85,$85           ;- D 0 - I - 0x00D8BD 06:98AD:
	.word ofs_06_8580, ofs_06_8580, ofs_06_8580;W 0x00D8C1 06:98B1:
	.byte $0B,$FE,$0E,$01,$98,$A5,$0B,$00,$0F,$01,$98,$A3,$0B,$00,$85,$87;- D 0 - I - 0x00D8C7 06:98B7:
	.byte $89,$A5,$85,$A9,$91,$8F,$8D,$AC,$A5,$85,$04,$00,$8A,$04,$00,$8A;- D 0 - I - 0x00D8D7 06:98C7:
	.byte $80,$0E,$04,$98,$D4,$8A,$85,$8A,$88,$86,$85,$04,$00,$85,$80,$0E;- D 0 - I - 0x00D8E7 06:98D7:
	.byte $04,$98,$E2,$85,$85,$83,$85,$86,$88,$04,$00,$88,$80,$0E,$04,$98;- D 0 - I - 0x00D8F7 06:98E7:
	.byte $F0,$88,$88,$83,$85,$88,$86,$86,$80,$86,$80,$86,$80,$86,$86,$86;- D 0 - I - 0x00D907 06:98F7:
	.byte $86,$86,$80,$A5,$85,$8A,$04,$00,$8A,$80,$0E,$04,$99,$0D,$8A,$8A;- D 0 - I - 0x00D917 06:9907:
	.byte $85,$86,$8A,$88,$04,$00,$88,$80,$0E,$04,$99,$1B,$88,$88,$85,$86;- D 0 - I - 0x00D927 06:9917:
	.byte $88,$86,$04,$00,$86,$80,$0E,$04,$99,$29,$86,$86,$81,$83,$86,$85;- D 0 - I - 0x00D937 06:9927:
	.byte $85                       ;- D 0 - I - 0x00D947 06:9937:
	.word ofs_06_8580, ofs_06_8580, ofs_06_8580, $A585;W 0x00D948 06:9938:
	.byte $85,$85,$87,$89,$8C,$04,$00,$04,$00,$04,$00,$AA,$80,$8A,$80,$8A;- D 0 - I - 0x00D950 06:9940:
	.byte $80,$8A,$0E,$01,$99,$49,$0B,$F9,$0F,$01,$99,$47,$0B,$00,$10,$01;- D 0 - I - 0x00D960 06:9950:
	.byte $99,$45,$A8,$80,$88,$80,$88,$80,$88,$A8,$80;- D 0 - I - 0x00D970 06:9960:
	.word ofs_06_8888, $8388, $A586, ofs_06_8580, ofs_06_8580, ofs_06_8580;W 0x00D97B 06:996B:
	.byte $00,$A5,$A5,$A5,$00,$A5,$A0,$16,$98,$D1;- D 0 - I - 0x00D987 06:9977:
	.byte $17                       ;- - - - - - 0x00D991 06:9981:
	.byte $06,$DC,$07,$09,$08,$00,$04,$00,$04,$00,$A5,$8A,$A5,$85,$8A,$12;- D 0 - I - 0x00D992 06:9982:
	.byte $00,$99,$9A,$85,$0E,$03,$99,$8A,$8A,$0F,$01,$99,$88,$A5,$8A,$A5;- D 0 - I - 0x00D9A2 06:9992:
	.byte $85,$8A,$85,$04,$00,$07,$0D,$8E,$07,$09,$85,$12,$00,$99,$B6,$85;- D 0 - I - 0x00D9B2 06:99A2:
	.byte $0E,$02,$99,$A5,$04,$00,$04,$00,$04,$00,$A5,$8A,$A5,$85,$AA,$85;- D 0 - I - 0x00D9C2 06:99B2:
	.byte $12,$00,$99,$CF,$85,$8A,$A5,$85,$AA,$0E,$03,$99,$BA,$13,$00,$99;- D 0 - I - 0x00D9D2 06:99C2:
	.byte $E1,$85,$8A,$85,$85,$07,$0D,$AE,$07,$09,$85,$0F,$01,$99,$B8,$07;- D 0 - I - 0x00D9E2 06:99D2:
	.byte $0D,$AE,$04,$00,$07,$09,$85,$12,$00,$99,$F4,$07,$0D,$8E,$0E,$02;- D 0 - I - 0x00D9F2 06:99E2:
	.byte $99,$E4,$04,$00,$85,$85,$8A,$A5,$85,$8A,$12,$00,$9A,$0B,$A5,$85;- D 0 - I - 0x00DA02 06:99F2:
	.byte $8A,$A5,$85,$8A,$85,$0E,$05,$99,$F4,$6A,$6A,$07,$0D,$00,$AE,$AE;- D 0 - I - 0x00DA12 06:9A02:
	.byte $AE,$00,$AE,$07,$09,$66,$66,$66,$66,$16,$99,$B6;- D 0 - I - 0x00DA22 06:9A12:
	.byte $17                       ;- - - - - - 0x00DA2E 06:9A1E:
	.byte $00,$9A,$28,$9A,$D5,$9B,$73,$9C,$0D,$05,$02,$AA,$06,$E4,$07,$09;- D 0 - I - 0x00DA2F 06:9A1F:
	.byte $08,$02,$09,$01,$0D,$19,$18,$C0,$80,$DC,$DD,$DC,$DD,$01,$FE,$08;- D 0 - I - 0x00DA3F 06:9A2F:
	.byte $07,$01,$DE,$08,$02,$00,$BF,$BE,$BD,$00,$01,$FC,$01,$FC,$0D,$00;- D 0 - I - 0x00DA4F 06:9A3F:
	.byte $04,$00,$04,$00,$04,$00,$04,$00,$BE,$80,$9E,$80,$9E,$80,$9E,$0F;- D 0 - I - 0x00DA5F 06:9A4F:
	.byte $02,$9A,$55,$02,$03,$AB,$14,$08,$9A,$70,$02,$AA,$A9,$10,$01,$9A;- D 0 - I - 0x00DA6F 06:9A5F:
	.byte $53,$02,$AC,$AD,$15,$08,$9A,$9E,$81,$81,$82,$81,$84,$A1,$81,$85;- D 0 - I - 0x00DA7F 06:9A6F:
	.byte $86,$88,$C1,$80,$00,$8B,$88,$85,$88,$85,$82,$85,$82,$03,$97,$9A;- D 0 - I - 0x00DA8F 06:9A7F:
	.byte $97,$94,$00,$80,$99,$99,$99,$99,$99,$99,$99,$11,$01,$9A,$51,$08;- D 0 - I - 0x00DA9F 06:9A8F:
	.byte $0A,$07,$0B,$6C,$02,$01,$CD,$02,$01,$8D,$02,$B4,$CD,$80,$6C,$02;- D 0 - I - 0x00DAAF 06:9A9F:
	.byte $01,$CD,$02,$01,$8D,$02,$B5,$CD,$80,$6C,$02,$01,$CD,$02,$01,$8D;- D 0 - I - 0x00DABF 06:9AAF:
	.byte $02,$B7,$02,$AD,$B7,$02,$B5,$02,$AD,$B5,$02,$B4,$CD,$80,$08,$02;- D 0 - I - 0x00DACF 06:9ABF:
	.byte $07,$09,$16,$9A,$4F       ;- D 0 - I - 0x00DADF 06:9ACF:
	.byte $17                       ;- - - - - - 0x00DAE4 06:9AD4:
	.byte $06,$E4,$07,$09,$08,$02,$09,$01,$18,$C0,$80,$D7,$D6,$D7,$D6,$01;- D 0 - I - 0x00DAE5 06:9AD5:
	.byte $F5,$08,$07,$01,$D5,$08,$02,$00,$B4,$B5,$B6,$00,$01,$F7,$01,$F7;- D 0 - I - 0x00DAF5 06:9AE5:
	.byte $04,$00,$04,$00,$04,$00,$04,$00,$95,$95,$94,$95,$80,$95,$13,$00;- D 0 - I - 0x00DB05 06:9AF5:
	.byte $9B,$0D,$92,$95,$0F,$02,$9A,$FB,$99,$95,$02,$BA,$14,$00,$9B,$1C;- D 0 - I - 0x00DB15 06:9B05:
	.byte $02,$B9,$B8,$10,$01,$9A,$F9,$02,$BB,$BD,$15,$00,$9B,$3F,$94,$94;- D 0 - I - 0x00DB25 06:9B15:
	.byte $94,$94,$94,$B4,$94,$97,$94,$91,$D4,$80,$BD,$BA,$B7,$B4,$80,$94;- D 0 - I - 0x00DB35 06:9B25:
	.byte $94,$94,$94,$94,$94,$94,$11,$01,$9A,$F7,$7C,$02,$01,$DD,$02,$01;- D 0 - I - 0x00DB45 06:9B35:
	.byte $9D,$02,$03,$AB,$A5,$86,$88,$85,$65,$02,$01,$C6,$02,$01,$86,$02;- D 0 - I - 0x00DB55 06:9B45:
	.byte $AD,$A6,$88,$89,$86,$66,$02,$01,$C8,$02;- D 0 - I - 0x00DB65 06:9B55:
	.word ofs_06_8802-1, $B402, $A802;W 0x00DB6F 06:9B5F:
	.byte $B4,$02,$B2,$02,$A6,$B2,$02,$B1,$C5,$80,$16,$9A,$F5;- D 0 - I - 0x00DB75 06:9B65:
	.byte $17                       ;- - - - - - 0x00DB82 06:9B72:
	.byte $08,$00,$09,$02,$06,$D2,$80,$E0,$E0,$E0,$E0,$E0,$E0,$04,$00,$04;- D 0 - I - 0x00DB83 06:9B73:
	.byte $00,$04,$00,$92,$92,$90,$B2,$8D,$90,$8D,$92,$92,$90,$B2,$95,$94;- D 0 - I - 0x00DB93 06:9B83:
	.byte $90,$92,$92,$90,$B2,$8D,$90,$8D,$97,$92,$8B,$12,$00,$9B,$AA,$B6;- D 0 - I - 0x00DBA3 06:9B93:
	.byte $8A,$95,$90,$0E,$01,$9B,$84,$B8,$8C,$99,$90,$13,$00,$9B,$D4,$8D;- D 0 - I - 0x00DBB3 06:9BA3:
	.byte $8D,$8D,$AD,$8E,$90,$8E,$8D,$8D,$8D,$AD,$94,$91,$8D,$8D,$97,$8D;- D 0 - I - 0x00DBC3 06:9BB3:
	.byte $94,$8D,$91,$8B,$8E,$80,$8D,$8D,$8D,$8D,$8D,$8F,$91,$0F,$01,$9B;- D 0 - I - 0x00DBD3 06:9BC3:
	.byte $82,$94,$92,$91,$AD,$8D,$8D,$8D,$04,$00,$88,$89,$8B,$AD,$8D,$8F;- D 0 - I - 0x00DBE3 06:9BD3:
	.byte $91,$95,$94,$92,$AD,$8D,$8D,$8D,$12,$00,$9C,$01,$89,$8B,$8C,$AD;- D 0 - I - 0x00DBF3 06:9BE3:
	.byte $8D,$8F,$91,$97,$94,$91,$AD,$8D,$8D,$8D,$0E,$01,$9B,$DB,$04,$00;- D 0 - I - 0x00DC03 06:9BF3:
	.byte $99,$8D,$0E,$03,$9C,$01,$16,$9B,$80;- D 0 - I - 0x00DC13 06:9C03:
	.byte $17                       ;- - - - - - 0x00DC1C 06:9C0C:
	.byte $06,$78,$07,$09,$08,$06,$80,$E0,$E0,$E0,$E0,$AA,$AA,$AA,$AA,$AA;- D 0 - I - 0x00DC1D 06:9C0D:
	.byte $AA,$AA,$6A,$6A,$6A,$6A,$04,$00,$04,$00,$04,$00,$85;- D 0 - I - 0x00DC2D 06:9C1D:
	.word $AA85, ofs_06_8580, ofs_06_858A;W 0x00DC3A 06:9C2A:
	.byte $85,$85,$8A,$A5,$85       ;- D 0 - I - 0x00DC40 06:9C30:
	.word $85AA, $AA85, ofs_06_8580, ofs_06_858A, $B406, $AB02, $AB02;W 0x00DC45 06:9C35:
	.byte $AB,$06,$78,$0E,$01,$9C,$27,$13,$00,$9C,$70,$85,$85,$8A,$A5,$85;- D 0 - I - 0x00DC53 06:9C43:
	.byte $AA,$85,$85,$8A,$A5,$85,$6A,$6A,$8A,$06,$B4,$AA,$AA,$AA,$AA,$06;- D 0 - I - 0x00DC63 06:9C53:
	.byte $78,$80,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$0F,$01,$9C,$25,$04,$00,$85;- D 0 - I - 0x00DC73 06:9C63:
	.byte $85,$8A,$A5,$85,$8A,$85,$0E,$06,$9C,$70,$06,$B4,$AB,$AB,$AB,$AB;- D 0 - I - 0x00DC83 06:9C73:
	.byte $06,$78,$16,$9C,$23       ;- D 0 - I - 0x00DC93 06:9C83:
	.byte $17                       ;- - - - - - 0x00DC98 06:9C88:
	.byte $00,$9C,$92,$9D,$9B,$9E,$63,$9F,$28,$05,$02,$00,$0A,$FE,$06,$DC;- D 0 - I - 0x00DC99 06:9C89:
	.byte $07,$0A,$08,$02,$09,$01,$18,$C0,$96,$99,$9D,$03,$88,$8D,$81,$83;- D 0 - I - 0x00DCA9 06:9C99:
	.byte $04,$08,$68,$69,$02,$01,$AA,$08,$07,$01,$CA,$08,$02,$6A,$6D,$01;- D 0 - I - 0x00DCB9 06:9CA9:
	.byte $B1,$08,$07,$01,$D1,$08,$02,$00,$8F,$8D,$8C,$02,$00,$AD,$01,$AA;- D 0 - I - 0x00DCC9 06:9CB9:
	.byte $08,$07,$01,$CA,$08,$02,$67,$68,$89,$8C,$91,$8F,$8D,$8C,$01,$CA;- D 0 - I - 0x00DCD9 06:9CC9:
	.byte $08,$07,$01,$CA,$08,$02,$01,$D6,$08,$07,$01,$B6,$08,$02,$00,$94;- D 0 - I - 0x00DCE9 06:9CD9:
	.byte $92,$91,$00,$01,$D2,$08,$07,$01,$B2,$08,$02,$80,$75,$76,$01,$B5;- D 0 - I - 0x00DCF9 06:9CE9:
	.byte $08,$07,$01,$B5,$08,$02,$00,$A5,$A6,$A8,$00,$AA,$AC,$AD,$AF,$80;- D 0 - I - 0x00DD09 06:9CF9:
	.byte $8F,$D1,$AC,$04,$48,$B1,$08,$07,$01,$B1,$08,$02,$8C,$8D,$8F,$01;- D 0 - I - 0x00DD19 06:9D09:
	.byte $B4,$08,$07,$02,$01,$B4,$08,$02,$92,$91,$8F,$CD,$80,$8C,$88,$6D;- D 0 - I - 0x00DD29 06:9D19:
	.byte $6F,$12,$08,$9D,$3B,$01,$D1,$08,$07,$01,$D1,$80,$08,$02,$0E,$01;- D 0 - I - 0x00DD39 06:9D29:
	.byte $9D,$0C,$91,$03,$98,$94,$91,$03,$91,$8C,$88,$B1,$8A,$86,$81,$66;- D 0 - I - 0x00DD49 06:9D39:
	.byte $6A,$8D,$AC,$A8,$65,$03,$78,$74,$7B,$03,$68,$6D,$6C,$68,$65,$03;- D 0 - I - 0x00DD59 06:9D49:
	.byte $78,$B1,$96,$BB,$BE,$03,$AA,$80,$68,$66,$01,$C5,$08,$07,$02,$01;- D 0 - I - 0x00DD69 06:9D59:
	.byte $A5,$08,$02,$8A,$86,$81,$66,$6A,$8D,$AC,$01,$91,$08,$07,$01,$91;- D 0 - I - 0x00DD79 06:9D69:
	.byte $08,$02,$6F,$6C,$68,$63,$03,$78,$79,$7D,$03,$68,$6C,$6F,$B1,$8A;- D 0 - I - 0x00DD89 06:9D79:
	.byte $A3,$A6,$AA,$80,$6C,$6D,$01,$D1,$08,$07,$01,$B1,$08,$02,$16,$9C;- D 0 - I - 0x00DD99 06:9D89:
	.byte $A9                       ;- D 0 - I - 0x00DDA9 06:9D99:
	.byte $17                       ;- - - - - - 0x00DDAA 06:9D9A:
	.byte $06,$F0,$0C,$01,$07,$08,$08,$02,$09,$01,$18,$80,$8A,$96,$8C,$98;- D 0 - I - 0x00DDAB 06:9D9B:
	.byte $8D,$94,$96,$94,$04,$08,$04,$08,$6A,$65,$6A,$8D,$6C,$68,$6C,$6D;- D 0 - I - 0x00DDBB 06:9DAB:
	.byte $72,$6F,$70,$71,$6F,$70,$71,$68,$63,$68,$8C,$6A,$66,$6A,$68,$65;- D 0 - I - 0x00DDCB 06:9DBB:
	.byte $61,$63,$03,$78,$79,$76,$7D,$7E,$79,$7E,$03,$8A,$6F,$6C,$68,$6A;- D 0 - I - 0x00DDDB 06:9DCB:
	.byte $6C,$6D,$6F,$70,$71,$70,$71,$71,$6C,$88,$6F,$6C,$88,$6D,$6A,$86;- D 0 - I - 0x00DDEB 06:9DDB:
	.byte $6C,$68,$85,$0E,$01,$9D,$B1,$AF,$B1,$B2,$B4,$80,$94,$CC,$A8,$04;- D 0 - I - 0x00DDFB 06:9DEB:
	.byte $00,$96,$99,$9D,$03,$CA,$8D,$8C,$88,$83,$03,$D8,$99,$9E,$03,$8A;- D 0 - I - 0x00DE0B 06:9DFB:
	.byte $8D,$D2,$8F,$91,$8C,$88,$85,$03,$98,$94,$B1,$0E,$01,$9D,$FA,$0C;- D 0 - I - 0x00DE1B 06:9E0B:
	.byte $FD,$03,$8A,$86,$81,$66,$6A,$8D,$AC,$A8,$65,$03,$78,$74,$7B,$03;- D 0 - I - 0x00DE2B 06:9E1B:
	.byte $68,$6D,$6C,$68,$65,$03,$78,$B1,$96,$BB,$BE,$03,$AA,$80,$68,$66;- D 0 - I - 0x00DE3B 06:9E2B:
	.byte $02,$C5,$80,$8A,$86,$81,$66,$6A,$8D,$AC,$AC,$6A,$67,$63,$03,$76;- D 0 - I - 0x00DE4B 06:9E3B:
	.byte $73,$74,$78,$7B,$7F,$03,$6A,$AC,$8A,$0C,$01,$AA,$AD,$B1,$80,$67;- D 0 - I - 0x00DE5B 06:9E4B:
	.byte $68,$02,$CC,$80,$16,$9D,$AF;- D 0 - I - 0x00DE6B 06:9E5B:
	.byte $17                       ;- - - - - - 0x00DE72 06:9E62:
	.byte $06,$DC,$08,$02,$09,$02,$8A,$96,$8C,$98,$8D,$99,$9B,$94,$04,$00;- D 0 - I - 0x00DE73 06:9E63:
	.byte $04,$00,$6A,$6D,$91,$76,$71,$02,$9D,$7D,$9B,$98,$99,$68,$6F,$94;- D 0 - I - 0x00DE83 06:9E73:
	.byte $78,$74,$02,$9D,$7D,$9B,$98,$94,$66,$6A,$8D,$72,$6D,$02,$99,$79;- D 0 - I - 0x00DE93 06:9E83:
	.byte $98,$7D,$7B,$98,$12,$00,$9E,$AB,$71,$91,$71,$6C,$8C,$6C,$68,$88;- D 0 - I - 0x00DEA3 06:9E93:
	.byte $68,$65,$85,$65,$0E,$01,$9E,$73,$65,$85,$65,$68,$88,$68,$6C,$8C;- D 0 - I - 0x00DEB3 06:9EA3:
	.byte $6C,$71,$91,$71,$AF,$B1,$B2,$B4,$80,$8F,$8C,$B1,$02,$A0,$04,$00;- D 0 - I - 0x00DEC3 06:9EB3:
	.byte $02,$96,$76,$96,$76,$96,$76,$96,$76,$78,$79,$7B,$02,$94,$74,$94;- D 0 - I - 0x00DED3 06:9EC3:
	.byte $74,$94,$74,$94,$7B,$79,$78,$79,$02,$92,$72,$92,$72,$92,$72,$92;- D 0 - I - 0x00DEE3 06:9ED3:
	.byte $7E,$7B,$78,$79,$02,$9D,$7D,$9D,$7D,$9D,$7D,$9D,$7D,$78,$74,$71;- D 0 - I - 0x00DEF3 06:9EE3:
	.byte $0E,$01,$9E,$C1,$04,$00,$B2,$9E,$B2,$72,$74,$76,$78,$79,$7B,$B1;- D 0 - I - 0x00DF03 06:9EF3:
	.byte $9D,$B1,$7B,$79,$78,$79,$78,$74,$AF,$9B,$AF,$7B,$78,$74,$76,$79;- D 0 - I - 0x00DF13 06:9F03:
	.byte $78,$02,$91,$71,$71,$9D,$91,$9D,$71,$7D,$71,$7D,$71,$0E,$01,$9E;- D 0 - I - 0x00DF23 06:9F13:
	.byte $F7,$16,$9E,$71           ;- D 0 - I - 0x00DF33 06:9F23:
	.byte $17                       ;- - - - - - 0x00DF37 06:9F27:
	.byte $06,$96,$07,$09,$08,$06,$8F,$68,$88,$6F,$6A,$6C,$88,$8C,$68,$68;- D 0 - I - 0x00DF38 06:9F28:
	.byte $71,$6C,$04,$00,$04,$00,$04,$00,$85,$6F,$6F,$88,$01,$88,$0D,$0A;- D 0 - I - 0x00DF48 06:9F38:
	.byte $01,$8C,$65,$65,$68,$65,$6F,$6F,$0E,$02,$9F,$3E,$8C,$68,$68,$04;- D 0 - I - 0x00DF58 06:9F48:
	.byte $00,$6C,$6C,$60,$68,$0E,$02,$9F,$57,$0F,$01,$9F,$3C,$04,$40,$8C;- D 0 - I - 0x00DF68 06:9F58:
	.byte $01,$85,$0E,$03,$9F,$65,$80,$65,$65,$88,$85,$6F,$6F,$6C,$6C,$6D;- D 0 - I - 0x00DF78 06:9F68:
	.byte $6D,$6A,$6A,$04,$00,$02,$85,$65,$88,$65,$85,$65,$85,$88,$85,$0E;- D 0 - I - 0x00DF88 06:9F78:
	.byte $07,$9F,$7B,$04,$00,$04,$00,$A5,$88,$A5,$85,$A8,$0E,$02,$9F,$8D;- D 0 - I - 0x00DF98 06:9F88:
	.byte $02,$85,$65,$68,$8F,$65,$68,$6D,$6C,$68,$6A,$6D,$6C,$6A,$0F,$01;- D 0 - I - 0x00DFA8 06:9F98:
	.byte $9F,$8B,$16,$9F,$3A       ;- D 0 - I - 0x00DFB8 06:9FA8:
	.byte $17                       ;- - - - - - 0x00DFBD 06:9FAD:
	.byte $00,$9F,$B7,$A0,$65,$A1,$25,$A1,$C4,$05,$02,$16,$0A,$01,$06,$E6;- D 0 - I - 0x00DFBE 06:9FAE:
	.byte $18,$40,$07,$0B,$08,$02,$09,$01,$C0,$02,$03,$96,$02,$91,$8D,$04;- D 0 - I - 0x00DFCE 06:9FBE:
	.byte $48,$CA,$08,$07,$01,$CA,$08,$02,$01,$CC,$08,$07,$01,$CC,$08,$02;- D 0 - I - 0x00DFDE 06:9FCE:
	.byte $01,$CD,$08,$07,$01,$CD,$08,$02,$12,$08,$9F,$F6,$01,$CC,$08,$07;- D 0 - I - 0x00DFEE 06:9FDE:
	.byte $01,$CC,$08,$02,$0E,$01,$9F,$CD,$01,$D1,$08,$07,$01,$D1,$05,$02;- D 0 - I - 0x00DFFE 06:9FEE:
	.byte $00,$04                   ;- D 0 - I - 0x00E00E 06:9FFE:
