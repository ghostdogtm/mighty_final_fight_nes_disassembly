.segment "BANK_01"
; 0x002010-0x00400F  CPU $A000-$BFFF

ofs_01_A000:
	JMP loc_01_A0FD                 ;C D 1 J - - 0x002010 01:A000: 4C FD A0
ofs_01_A003:
	JMP loc_01_A101                 ;C - - J - - 0x002013 01:A003: 4C 01 A1
	.byte $4C,$30,$A0               ;- - - - - - 0x002016 01:A006:
ofs_01_A009:
	JMP loc_01_AA33                 ;C - - J - - 0x002019 01:A009: 4C 33 AA
	.byte $4C,$30,$A0,$4C,$30,$A0,$4C,$30,$A0,$4C,$30,$A0,$4C,$30,$A0,$4C;- - - - - - 0x00201C 01:A00C:
	.byte $30,$A0,$4C,$30,$A0,$4C,$30,$A0,$4C,$30,$A0,$4C,$30,$A0,$4C,$30;- - - - - - 0x00202C 01:A01C:
	.byte $A0                       ;- - - - - - 0x00203C 01:A02C:
ofs_01_A02D:
	JMP loc_01_A09B                 ;C - - J - - 0x00203D 01:A02D: 4C 9B A0
	.byte $60                       ;- - - - - - 0x002040 01:A030:
sub_01_A031:
	STY ptr_00                      ;C - - - - - 0x002041 01:A031: 84 00
	LDA objArr_05C0,X               ;C - - - - - 0x002043 01:A033: BD C0 05
	BEQ loc_01_A03A                 ;C - - - - - 0x002046 01:A036: F0 02
	LDA #$01                        ;C - - - - - 0x002048 01:A038: A9 01
loc_01_A03A:
	TAY                             ;C - - - - - 0x00204A 01:A03A: A8
	LDA #$00                        ;C - - - - - 0x00204B 01:A03B: A9 00
	STA ptr_0E+1                    ;C - - - - - 0x00204D 01:A03D: 85 0F
	LDA objArr_0460,X               ;C - - - - - 0x00204F 01:A03F: BD 60 04
	AND #$08                        ;C - - - - - 0x002052 01:A042: 29 08
	BEQ loc_01_A05D                 ;C - - - - - 0x002054 01:A044: F0 17
	JSR sub_0F_F1DF                 ;C - - - - - 0x002056 01:A046: 20 DF F1
	LDA objY,X                      ;C - - - - - 0x002059 01:A049: BD C0 03
	CMP tbl_01_A08E,Y               ;C - - - - - 0x00205C 01:A04C: D9 8E A0
	BCS loc_01_A077                 ;C - - - - - 0x00205F 01:A04F: B0 26
	LDA tbl_01_A08E,Y               ;C - - - - - 0x002061 01:A051: B9 8E A0
	STA objY,X                      ;C - - - - - 0x002064 01:A054: 9D C0 03
	LDA #$08                        ;C - - - - - 0x002067 01:A057: A9 08
	STA ptr_0E+1                    ;C - - - - - 0x002069 01:A059: 85 0F
	BNE loc_01_A077                 ;C - - - - - 0x00206B 01:A05B: D0 1A
loc_01_A05D:
	LDA objArr_0460,X               ;C - - - - - 0x00206D 01:A05D: BD 60 04
	AND #$04                        ;C - - - - - 0x002070 01:A060: 29 04
	BEQ loc_01_A077                 ;C - - - - - 0x002072 01:A062: F0 13
	JSR sub_0F_F1BF                 ;C - - - - - 0x002074 01:A064: 20 BF F1
	LDA objY,X                      ;C - - - - - 0x002077 01:A067: BD C0 03
	CMP #$AF                        ;C - - - - - 0x00207A 01:A06A: C9 AF
	BCC loc_01_A077                 ;C - - - - - 0x00207C 01:A06C: 90 09
	LDA #$AE                        ;C - - - - - 0x00207E 01:A06E: A9 AE
	STA objY,X                      ;C - - - - - 0x002080 01:A070: 9D C0 03
	LDA #$04                        ;C - - - - - 0x002083 01:A073: A9 04
	STA ptr_0E+1                    ;C - - - - - 0x002085 01:A075: 85 0F
loc_01_A077:
	LDY ptr_00                      ;C - - - - - 0x002087 01:A077: A4 00
	LDA objArr_0460,X               ;C - - - - - 0x002089 01:A079: BD 60 04
	AND #$01                        ;C - - - - - 0x00208C 01:A07C: 29 01
	BEQ loc_01_A083                 ;C - - - - - 0x00208E 01:A07E: F0 03
	JMP sub_0F_F183                 ;C - - - - - 0x002090 01:A080: 4C 83 F1
loc_01_A083:
	LDA objArr_0460,X               ;C - - - - - 0x002093 01:A083: BD 60 04
	AND #$02                        ;C - - - - - 0x002096 01:A086: 29 02
	BEQ loc_01_A08D                 ;C - - - - - 0x002098 01:A088: F0 03
	JMP sub_0F_F1A1                 ;C - - - - - 0x00209A 01:A08A: 4C A1 F1
loc_01_A08D:
	RTS                             ;C - - - - - 0x00209D 01:A08D: 60
tbl_01_A08E:
	.byte $85,$82                   ;- D 1 - - - 0x00209E 01:A08E:
sub_01_A090:
	JSR sub_0F_F374                 ;C - - - - - 0x0020A0 01:A090: 20 74 F3
	BCS loc_01_A098                 ;C - - - - - 0x0020A3 01:A093: B0 03
	JMP sub_0F_F099                 ;C - - - - - 0x0020A5 01:A095: 4C 99 F0
loc_01_A098:
	JMP sub_0F_F090                 ;C - - - - - 0x0020A8 01:A098: 4C 90 F0
loc_01_A09B:
	LDA objArr_0300,X               ;C - - - - - 0x0020AB 01:A09B: BD 00 03
	AND #$0F                        ;C - - - - - 0x0020AE 01:A09E: 29 0F
	BNE loc_01_A0C7                 ;C - - - - - 0x0020B0 01:A0A0: D0 25
	JSR sub_0F_F374                 ;C - - - - - 0x0020B2 01:A0A2: 20 74 F3
	CMP #$10                        ;C - - - - - 0x0020B5 01:A0A5: C9 10
	BCS loc_01_A0C6                 ;C - - - - - 0x0020B7 01:A0A7: B0 1D
	LDA #$01                        ;C - - - - - 0x0020B9 01:A0A9: A9 01
	STA ram_0031                    ;C - - - - - 0x0020BB 01:A0AB: 85 31
	LDA #$0D                        ;C - - - - - 0x0020BD 01:A0AD: A9 0D
	STA ram_00A7                    ;C - - - - - 0x0020BF 01:A0AF: 85 A7
	JSR sub_0F_F455                 ;C - - - - - 0x0020C1 01:A0B1: 20 55 F4
	LDA #$18                        ;C - - - - - 0x0020C4 01:A0B4: A9 18
	JSR sub_0F_F34C                 ;C - - - - - 0x0020C6 01:A0B6: 20 4C F3
	INC objArr_0300,X               ;C - - - - - 0x0020C9 01:A0B9: FE 00 03
	LDA objX                        ;C - - - - - 0x0020CC 01:A0BC: AD 60 03
	CMP #$70                        ;C - - - - - 0x0020CF 01:A0BF: C9 70
	BCC loc_01_A0C6                 ;C - - - - - 0x0020D1 01:A0C1: 90 03
	INC objArr_0550                 ;C - - - - - 0x0020D3 01:A0C3: EE 50 05
loc_01_A0C6:
	RTS                             ;C - - - - - 0x0020D6 01:A0C6: 60
loc_01_A0C7:
	LDA objX                        ;C - - - - - 0x0020D7 01:A0C7: AD 60 03
	CMP #$70                        ;C - - - - - 0x0020DA 01:A0CA: C9 70
	BCC loc_01_A0D3                 ;C - - - - - 0x0020DC 01:A0CC: 90 05
	LDA #$02                        ;C - - - - - 0x0020DE 01:A0CE: A9 02
	STA objArr_0550                 ;C - - - - - 0x0020E0 01:A0D0: 8D 50 05
loc_01_A0D3:
	LDA #$FF                        ;C - - - - - 0x0020E3 01:A0D3: A9 FF
	LDY #$31                        ;C - - - - - 0x0020E5 01:A0D5: A0 31
	JSR sub_0F_F443                 ;C - - - - - 0x0020E7 01:A0D7: 20 43 F4
	LDA #$90                        ;C - - - - - 0x0020EA 01:A0DA: A9 90
	STA objArr_0560,X               ;C - - - - - 0x0020EC 01:A0DC: 9D 60 05
	LDA objX,X                      ;C - - - - - 0x0020EF 01:A0DF: BD 60 03
	CLC                             ;C - - - - - 0x0020F2 01:A0E2: 18
	ADC #$03                        ;C - - - - - 0x0020F3 01:A0E3: 69 03
	STA objX,X                      ;C - - - - - 0x0020F5 01:A0E5: 9D 60 03
	BCS loc_01_A0F5                 ;C - - - - - 0x0020F8 01:A0E8: B0 0B
	LDA objY,X                      ;C - - - - - 0x0020FA 01:A0EA: BD C0 03
	SBC #$02                        ;C - - - - - 0x0020FD 01:A0ED: E9 02
	STA objY,X                      ;C - - - - - 0x0020FF 01:A0EF: 9D C0 03
	BCC loc_01_A0F5                 ;C - - - - - 0x002102 01:A0F2: 90 01
	RTS                             ;C - - - - - 0x002104 01:A0F4: 60
loc_01_A0F5:
	LDA #$03                        ;C - - - - - 0x002105 01:A0F5: A9 03
	STA objArr_0550                 ;C - - - - - 0x002107 01:A0F7: 8D 50 05
	JMP sub_0F_F2BE                 ;C - - - - - 0x00210A 01:A0FA: 4C BE F2
loc_01_A0FD:
	LDA #$07                        ;C - - - - - 0x00210D 01:A0FD: A9 07
	BNE loc_01_A103                 ;C - - - - - 0x00210F 01:A0FF: D0 02
loc_01_A101:
	LDA #$08                        ;C - - - - - 0x002111 01:A101: A9 08
loc_01_A103:
	STA objSpriteDown,X             ;C - - - - - 0x002113 01:A103: 9D B0 05
	LDA #$00                        ;C - - - - - 0x002116 01:A106: A9 00
	STA objArr_05C0,X               ;C - - - - - 0x002118 01:A108: 9D C0 05
	STA objArr_0440,X               ;C - - - - - 0x00211B 01:A10B: 9D 40 04
	LDA objArr_04C0,X               ;C - - - - - 0x00211E 01:A10E: BD C0 04
	BEQ loc_01_A116                 ;C - - - - - 0x002121 01:A111: F0 03
	DEC objArr_04C0,X               ;C - - - - - 0x002123 01:A113: DE C0 04
loc_01_A116:
	LDA objArr_0320+13              ;C - - - - - 0x002126 01:A116: AD 2D 03
	CMP #$6E                        ;C - - - - - 0x002129 01:A119: C9 6E
	BEQ loc_01_A123                 ;C - - - - - 0x00212B 01:A11B: F0 06
	JSR sub_01_A6D6                 ;C - - - - - 0x00212D 01:A11D: 20 D6 A6
	BCC loc_01_A129                 ;C - - - - - 0x002130 01:A120: 90 07
	RTS                             ;C - - - - - 0x002132 01:A122: 60
loc_01_A123:
	LDA #$01                        ;C - - - - - 0x002133 01:A123: A9 01
	STA objArr_04C0,X               ;C - - - - - 0x002135 01:A125: 9D C0 04
	RTS                             ;C - - - - - 0x002138 01:A128: 60
loc_01_A129:
	LDA objArr_0300,X               ;C - - - - - 0x002139 01:A129: BD 00 03
	AND #$0F                        ;C - - - - - 0x00213C 01:A12C: 29 0F
	TAY                             ;C - - - - - 0x00213E 01:A12E: A8
	LDA tbl_01_A6C4,Y               ;C - - - - - 0x00213F 01:A12F: B9 C4 A6
	STA ptr_00                      ;C - - - - - 0x002142 01:A132: 85 00
	LDA tbl_01_A6CD,Y               ;C - - - - - 0x002144 01:A134: B9 CD A6
	STA ptr_00+1                    ;C - - - - - 0x002147 01:A137: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x002149 01:A139: 6C 00 00
ofs_01_A13C:
	JSR sub_01_A090                 ;C - - J - - 0x00214C 01:A13C: 20 90 A0
	LDA objArr_0380,X               ;C - - - - - 0x00214F 01:A13F: BD 80 03
	CMP #$01                        ;C - - - - - 0x002152 01:A142: C9 01
	BEQ loc_01_A15B                 ;C - - - - - 0x002154 01:A144: F0 15
	LDA #$01                        ;c - - - - - 0x002156 01:A146: A9 01
	STA objArr_0460,X               ;c - - - - - 0x002158 01:A148: 9D 60 04
	LDA objArr_0380,X               ;c - - - - - 0x00215B 01:A14B: BD 80 03
	BEQ loc_01_A155                 ;c - - - - - 0x00215E 01:A14E: F0 05
	LDA #$02                        ;c - - - - - 0x002160 01:A150: A9 02
	STA objArr_0460,X               ;c - - - - - 0x002162 01:A152: 9D 60 04
loc_01_A155:
	LDA #$88                        ;c - - - - - 0x002165 01:A155: A9 88
	STA objArr_0300,X               ;c - - - - - 0x002167 01:A157: 9D 00 03
	RTS                             ;c - - - - - 0x00216A 01:A15A: 60
loc_01_A15B:
	LDA #$00                        ;C - - - - - 0x00216B 01:A15B: A9 00
	STA objArr_0500,X               ;C - - - - - 0x00216D 01:A15D: 9D 00 05
	LDA #$05                        ;C - - - - - 0x002170 01:A160: A9 05
	STA objArr_0550,X               ;C - - - - - 0x002172 01:A162: 9D 50 05
	INC objArr_0300,X               ;C - - - - - 0x002175 01:A165: FE 00 03
	RTS                             ;C - - - - - 0x002178 01:A168: 60
ofs_01_A169:
	LDA gameAction                  ;C - - J - - 0x002179 01:A169: A5 30
	CMP #$1F                        ;C - - - - - 0x00217B 01:A16B: C9 1F
	BEQ loc_01_A19A                 ;C - - - - - 0x00217D 01:A16D: F0 2B
	CMP #$06                        ;C - - - - - 0x00217F 01:A16F: C9 06
	BEQ loc_01_A19A                 ;C - - - - - 0x002181 01:A171: F0 27
	LDA objSpriteDown,X             ;C - - - - - 0x002183 01:A173: BD B0 05
	CMP #$07                        ;C - - - - - 0x002186 01:A176: C9 07
	BNE loc_01_A180                 ;C - - - - - 0x002188 01:A178: D0 06
	LDA #$1C                        ;C - - - - - 0x00218A 01:A17A: A9 1C
	LDY #$0A                        ;C - - - - - 0x00218C 01:A17C: A0 0A
	BNE loc_01_A184                 ;C - - - - - 0x00218E 01:A17E: D0 04
loc_01_A180:
	LDA #$24                        ;C - - - - - 0x002190 01:A180: A9 24
	LDY #$09                        ;C - - - - - 0x002192 01:A182: A0 09
loc_01_A184:
	JSR sub_0F_FB3E                 ;C - - - - - 0x002194 01:A184: 20 3E FB
	BCC loc_01_A19A                 ;C - - - - - 0x002197 01:A187: 90 11
	LDA objSpriteDown,X             ;C - - - - - 0x002199 01:A189: BD B0 05
	SBC #$07                        ;C - - - - - 0x00219C 01:A18C: E9 07
	STA objArr_0510,X               ;C - - - - - 0x00219E 01:A18E: 9D 10 05
	LDA #$00                        ;C - - - - - 0x0021A1 01:A191: A9 00
	STA objArr_0500,X               ;C - - - - - 0x0021A3 01:A193: 9D 00 05
	INC objArr_0300,X               ;C - - - - - 0x0021A6 01:A196: FE 00 03
	RTS                             ;C - - - - - 0x0021A9 01:A199: 60
loc_01_A19A:
	JSR sub_01_A882                 ;C - - - - - 0x0021AA 01:A19A: 20 82 A8
	LDA objArr_0500,X               ;C - - - - - 0x0021AD 01:A19D: BD 00 05
	BNE loc_01_A1BC                 ;C - - - - - 0x0021B0 01:A1A0: D0 1A
	LDA ram_00E4                    ;C - - - - - 0x0021B2 01:A1A2: A5 E4
	AND #$01                        ;C - - - - - 0x0021B4 01:A1A4: 29 01
	STA objArr_05F0,X               ;C - - - - - 0x0021B6 01:A1A6: 9D F0 05
	LDA #$04                        ;C - - - - - 0x0021B9 01:A1A9: A9 04
	STA objArr_0530,X               ;C - - - - - 0x0021BB 01:A1AB: 9D 30 05
	JSR sub_0F_F374                 ;C - - - - - 0x0021BE 01:A1AE: 20 74 F3
	BCC loc_01_A1B8                 ;C - - - - - 0x0021C1 01:A1B1: 90 05
	LDA #$0C                        ;C - - - - - 0x0021C3 01:A1B3: A9 0C
	STA objArr_0530,X               ;C - - - - - 0x0021C5 01:A1B5: 9D 30 05
loc_01_A1B8:
	INC objArr_0500,X               ;C - - - - - 0x0021C8 01:A1B8: FE 00 05
	RTS                             ;C - - - - - 0x0021CB 01:A1BB: 60
loc_01_A1BC:
	LDA objArr_0380,X               ;C - - - - - 0x0021CC 01:A1BC: BD 80 03
	CMP #$01                        ;C - - - - - 0x0021CF 01:A1BF: C9 01
	BEQ loc_01_A1D5                 ;C - - - - - 0x0021D1 01:A1C1: F0 12
	CMP #$02                        ;c - - - - - 0x0021D3 01:A1C3: C9 02
	BEQ loc_01_A1CB                 ;c - - - - - 0x0021D5 01:A1C5: F0 04
	LDA #$01                        ;c - - - - - 0x0021D7 01:A1C7: A9 01
	BNE loc_01_A1CD                 ;c - - - - - 0x0021D9 01:A1C9: D0 02
loc_01_A1CB:
	LDA #$FE                        ;c - - - - - 0x0021DB 01:A1CB: A9 FE
loc_01_A1CD:
	STA objX,X                      ;c - - - - - 0x0021DD 01:A1CD: 9D 60 03
	LDA #$01                        ;c - - - - - 0x0021E0 01:A1D0: A9 01
	STA objArr_0380,X               ;c - - - - - 0x0021E2 01:A1D2: 9D 80 03
loc_01_A1D5:
	LDA objArr_0530,X               ;C - - - - - 0x0021E5 01:A1D5: BD 30 05
	CMP #$04                        ;C - - - - - 0x0021E8 01:A1D8: C9 04
	BNE loc_01_A1E5                 ;C - - - - - 0x0021EA 01:A1DA: D0 09
	LDA objX,X                      ;C - - - - - 0x0021EC 01:A1DC: BD 60 03
	CMP #$F1                        ;C - - - - - 0x0021EF 01:A1DF: C9 F1
	BCS loc_01_A20C                 ;C - - - - - 0x0021F1 01:A1E1: B0 29
	BCC loc_01_A231                 ;C - - - - - 0x0021F3 01:A1E3: 90 4C
loc_01_A1E5:
	CMP #$0C                        ;C - - - - - 0x0021F5 01:A1E5: C9 0C
	BNE loc_01_A1F2                 ;C - - - - - 0x0021F7 01:A1E7: D0 09
	LDA objX,X                      ;C - - - - - 0x0021F9 01:A1E9: BD 60 03
	CMP #$18                        ;C - - - - - 0x0021FC 01:A1EC: C9 18
	BCC loc_01_A20C                 ;C - - - - - 0x0021FE 01:A1EE: 90 1C
	BCS loc_01_A231                 ;C - - - - - 0x002200 01:A1F0: B0 3F
loc_01_A1F2:
	CMP #$00                        ;C - - - - - 0x002202 01:A1F2: C9 00
	BNE loc_01_A1FF                 ;C - - - - - 0x002204 01:A1F4: D0 09
	LDA objY,X                      ;C - - - - - 0x002206 01:A1F6: BD C0 03
	CMP #$86                        ;C - - - - - 0x002209 01:A1F9: C9 86
	BCC loc_01_A20C                 ;C - - - - - 0x00220B 01:A1FB: 90 0F
	BCS loc_01_A231                 ;C - - - - - 0x00220D 01:A1FD: B0 32
loc_01_A1FF:
	CMP #$08                        ;C - - - - - 0x00220F 01:A1FF: C9 08
	BNE loc_01_A231                 ;C - - - - - 0x002211 01:A201: D0 2E
	LDA objY,X                      ;C - - - - - 0x002213 01:A203: BD C0 03
	CMP #$AE                        ;C - - - - - 0x002216 01:A206: C9 AE
	BCS loc_01_A20C                 ;C - - - - - 0x002218 01:A208: B0 02
	BCC loc_01_A231                 ;C - - - - - 0x00221A 01:A20A: 90 25
loc_01_A20C:
	LDA objArr_05F0,X               ;C - - - - - 0x00221C 01:A20C: BD F0 05
	BNE loc_01_A21F                 ;C - - - - - 0x00221F 01:A20F: D0 0E
	LDA objArr_0530,X               ;C - - - - - 0x002221 01:A211: BD 30 05
	CLC                             ;C - - - - - 0x002224 01:A214: 18
	ADC #$04                        ;C - - - - - 0x002225 01:A215: 69 04
	AND #$0F                        ;C - - - - - 0x002227 01:A217: 29 0F
	STA objArr_0530,X               ;C - - - - - 0x002229 01:A219: 9D 30 05
	JMP loc_01_A22A                 ;C - - - - - 0x00222C 01:A21C: 4C 2A A2
loc_01_A21F:
	LDA objArr_0530,X               ;C - - - - - 0x00222F 01:A21F: BD 30 05
	SEC                             ;C - - - - - 0x002232 01:A222: 38
	SBC #$04                        ;C - - - - - 0x002233 01:A223: E9 04
	AND #$0F                        ;C - - - - - 0x002235 01:A225: 29 0F
	STA objArr_0530,X               ;C - - - - - 0x002237 01:A227: 9D 30 05
loc_01_A22A:
	TAY                             ;C - - - - - 0x00223A 01:A22A: A8
	JSR sub_01_A7E1                 ;C - - - - - 0x00223B 01:A22B: 20 E1 A7
	JMP loc_01_A28B                 ;C - - - - - 0x00223E 01:A22E: 4C 8B A2
loc_01_A231:
	LDY objArr_0530,X               ;C - - - - - 0x002241 01:A231: BC 30 05
	JSR sub_01_A7E1                 ;C - - - - - 0x002244 01:A234: 20 E1 A7
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x002247 01:A237: B9 F0 FB
	STA objArr_0460,X               ;C - - - - - 0x00224A 01:A23A: 9D 60 04
	JSR sub_01_A031                 ;C - - - - - 0x00224D 01:A23D: 20 31 A0
	JSR sub_01_A090                 ;C - - - - - 0x002250 01:A240: 20 90 A0
	LDA objSpriteDown,X             ;C - - - - - 0x002253 01:A243: BD B0 05
	CMP #$07                        ;C - - - - - 0x002256 01:A246: C9 07
	BNE loc_01_A26E                 ;C - - - - - 0x002258 01:A248: D0 24
	LDA objArr_0460,X               ;C - - - - - 0x00225A 01:A24A: BD 60 04
	AND #$0C                        ;C - - - - - 0x00225D 01:A24D: 29 0C
	BEQ loc_01_A258                 ;C - - - - - 0x00225F 01:A24F: F0 07
	JSR sub_0F_FBD9                 ;C - - - - - 0x002261 01:A251: 20 D9 FB
	CMP #$02                        ;C - - - - - 0x002264 01:A254: C9 02
	BCC loc_01_A26F                 ;C - - - - - 0x002266 01:A256: 90 17
loc_01_A258:
	LDA objY,X                      ;C - - - - - 0x002268 01:A258: BD C0 03
	CMP #$90                        ;C - - - - - 0x00226B 01:A25B: C9 90
	BCC loc_01_A263                 ;C - - - - - 0x00226D 01:A25D: 90 04
	CMP #$98                        ;C - - - - - 0x00226F 01:A25F: C9 98
	BCC loc_01_A2CB                 ;C - - - - - 0x002271 01:A261: 90 68
loc_01_A263:
	LDA objX,X                      ;C - - - - - 0x002273 01:A263: BD 60 03
	CMP #$7C                        ;C - - - - - 0x002276 01:A266: C9 7C
	BCC loc_01_A26E                 ;C - - - - - 0x002278 01:A268: 90 04
	CMP #$84                        ;C - - - - - 0x00227A 01:A26A: C9 84
	BCC loc_01_A2CB                 ;C - - - - - 0x00227C 01:A26C: 90 5D
loc_01_A26E:
	RTS                             ;C - - - - - 0x00227E 01:A26E: 60
loc_01_A26F:
	LDA objArr_0550,X               ;C - - - - - 0x00227F 01:A26F: BD 50 05
	AND #$02                        ;C - - - - - 0x002282 01:A272: 29 02
	BNE loc_01_A28A                 ;C - - - - - 0x002284 01:A274: D0 14
	LDA #$03                        ;C - - - - - 0x002286 01:A276: A9 03
	STA objArr_0550,X               ;C - - - - - 0x002288 01:A278: 9D 50 05
	LDA ram_00E4                    ;C - - - - - 0x00228B 01:A27B: A5 E4
	AND #$0F                        ;C - - - - - 0x00228D 01:A27D: 29 0F
	CMP #$0C                        ;C - - - - - 0x00228F 01:A27F: C9 0C
	BCS loc_01_A28A                 ;C - - - - - 0x002291 01:A281: B0 07
	JSR sub_0F_F343                 ;C - - - - - 0x002293 01:A283: 20 43 F3
	LDA #$86                        ;C - - - - - 0x002296 01:A286: A9 86
	BNE loc_01_A2E4                 ;C - - - - - 0x002298 01:A288: D0 5A
loc_01_A28A:
	RTS                             ;C - - - - - 0x00229A 01:A28A: 60
loc_01_A28B:
	LDA objArr_0550,X               ;C - - - - - 0x00229B 01:A28B: BD 50 05
	LSR A                           ;C - - - - - 0x00229E 01:A28E: 4A
	BCS loc_01_A2AA                 ;C - - - - - 0x00229F 01:A28F: B0 19
	LDA objSpriteDown,X             ;C - - - - - 0x0022A1 01:A291: BD B0 05
	CMP #$08                        ;C - - - - - 0x0022A4 01:A294: C9 08
	BEQ loc_01_A2B3                 ;C - - - - - 0x0022A6 01:A296: F0 1B
	LDA #$00                        ;C - - - - - 0x0022A8 01:A298: A9 00
	STA objArr_0550,X               ;C - - - - - 0x0022AA 01:A29A: 9D 50 05
	LDA ram_00E4                    ;C - - - - - 0x0022AD 01:A29D: A5 E4
	AND #$0F                        ;C - - - - - 0x0022AF 01:A29F: 29 0F
	CMP #$08                        ;C - - - - - 0x0022B1 01:A2A1: C9 08
	BCS loc_01_A2A9                 ;C - - - - - 0x0022B3 01:A2A3: B0 04
	LDA #$85                        ;C - - - - - 0x0022B5 01:A2A5: A9 85
	BNE loc_01_A2E4                 ;C - - - - - 0x0022B7 01:A2A7: D0 3B
loc_01_A2A9:
	RTS                             ;C - - - - - 0x0022B9 01:A2A9: 60
loc_01_A2AA:
	LDA objArr_0550,X               ;C - - - - - 0x0022BA 01:A2AA: BD 50 05
	AND #$06                        ;C - - - - - 0x0022BD 01:A2AD: 29 06
	STA objArr_0550,X               ;C - - - - - 0x0022BF 01:A2AF: 9D 50 05
	RTS                             ;C - - - - - 0x0022C2 01:A2B2: 60
loc_01_A2B3:
	LDA #$00                        ;C - - - - - 0x0022C3 01:A2B3: A9 00
	STA objArr_0550,X               ;C - - - - - 0x0022C5 01:A2B5: 9D 50 05
	LDA ram_00E4                    ;C - - - - - 0x0022C8 01:A2B8: A5 E4
	AND #$0F                        ;C - - - - - 0x0022CA 01:A2BA: 29 0F
	CMP #$08                        ;C - - - - - 0x0022CC 01:A2BC: C9 08
	BCS loc_01_A2CA                 ;C - - - - - 0x0022CE 01:A2BE: B0 0A
	LDA gameAction                  ;C - - - - - 0x0022D0 01:A2C0: A5 30
	CMP #$06                        ;C - - - - - 0x0022D2 01:A2C2: C9 06
	BEQ loc_01_A2CA                 ;C - - - - - 0x0022D4 01:A2C4: F0 04
	LDA #$84                        ;C - - - - - 0x0022D6 01:A2C6: A9 84
	BNE loc_01_A2E4                 ;C - - - - - 0x0022D8 01:A2C8: D0 1A
loc_01_A2CA:
	RTS                             ;C - - - - - 0x0022DA 01:A2CA: 60
loc_01_A2CB:
	LDA objArr_0550,X               ;C - - - - - 0x0022DB 01:A2CB: BD 50 05
	AND #$04                        ;C - - - - - 0x0022DE 01:A2CE: 29 04
	BNE loc_01_A2E3                 ;C - - - - - 0x0022E0 01:A2D0: D0 11
	LDA #$05                        ;C - - - - - 0x0022E2 01:A2D2: A9 05
	STA objArr_0550,X               ;C - - - - - 0x0022E4 01:A2D4: 9D 50 05
	LDA ram_00E4                    ;C - - - - - 0x0022E7 01:A2D7: A5 E4
	AND #$0F                        ;C - - - - - 0x0022E9 01:A2D9: 29 0F
	CMP #$0A                        ;C - - - - - 0x0022EB 01:A2DB: C9 0A
	BCS loc_01_A2E3                 ;C - - - - - 0x0022ED 01:A2DD: B0 04
	LDA #$83                        ;C - - - - - 0x0022EF 01:A2DF: A9 83
	BNE loc_01_A2E4                 ;C - - - - - 0x0022F1 01:A2E1: D0 01
loc_01_A2E3:
	RTS                             ;C - - - - - 0x0022F3 01:A2E3: 60
loc_01_A2E4:
	STA objArr_0300,X               ;C - - - - - 0x0022F4 01:A2E4: 9D 00 03
	LDA #$00                        ;C - - - - - 0x0022F7 01:A2E7: A9 00
	STA objArr_0500,X               ;C - - - - - 0x0022F9 01:A2E9: 9D 00 05
	RTS                             ;C - - - - - 0x0022FC 01:A2EC: 60
ofs_01_A2ED:
	LDA objArr_0500,X               ;C - - J - - 0x0022FD 01:A2ED: BD 00 05
	BNE loc_01_A31F                 ;C - - - - - 0x002300 01:A2F0: D0 2D
	STA objArr_0540,X               ;C - - - - - 0x002302 01:A2F2: 9D 40 05
	JSR sub_0F_F343                 ;C - - - - - 0x002305 01:A2F5: 20 43 F3
	LDA objArr_0510,X               ;C - - - - - 0x002308 01:A2F8: BD 10 05
	BNE loc_01_A303                 ;C - - - - - 0x00230B 01:A2FB: D0 06
	LDA #$03                        ;C - - - - - 0x00230D 01:A2FD: A9 03
	LDY #$02                        ;C - - - - - 0x00230F 01:A2FF: A0 02
	BNE loc_01_A307                 ;C - - - - - 0x002311 01:A301: D0 04
loc_01_A303:
	LDA #$01                        ;C - - - - - 0x002313 01:A303: A9 01
	LDY #$00                        ;C - - - - - 0x002315 01:A305: A0 00
loc_01_A307:
	STA objArr_05E0,X               ;C - - - - - 0x002317 01:A307: 9D E0 05
	LDA gameAction                  ;C - - - - - 0x00231A 01:A30A: A5 30
	CMP #$01                        ;C - - - - - 0x00231C 01:A30C: C9 01
	BNE loc_01_A315                 ;C - - - - - 0x00231E 01:A30E: D0 05
	TYA                             ;C - - - - - 0x002320 01:A310: 98
	CLC                             ;C - - - - - 0x002321 01:A311: 18
	ADC #$0A                        ;C - - - - - 0x002322 01:A312: 69 0A
	TAY                             ;C - - - - - 0x002324 01:A314: A8
loc_01_A315:
	TYA                             ;C - - - - - 0x002325 01:A315: 98
	STA objArr_05D0,X               ;C - - - - - 0x002326 01:A316: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x002329 01:A319: FE 00 05
	JMP sub_01_A83A                 ;C - - - - - 0x00232C 01:A31C: 4C 3A A8
loc_01_A31F:
	LDA objArr_05D0,X               ;C - - - - - 0x00232F 01:A31F: BD D0 05
	BEQ loc_01_A330                 ;C - - - - - 0x002332 01:A322: F0 0C
	DEC objArr_05D0,X               ;C - - - - - 0x002334 01:A324: DE D0 05
	LDA #$00                        ;C - - - - - 0x002337 01:A327: A9 00
	STA objArr_0590,X               ;C - - - - - 0x002339 01:A329: 9D 90 05
	STA objArr_0570,X               ;C - - - - - 0x00233C 01:A32C: 9D 70 05
	RTS                             ;C - - - - - 0x00233F 01:A32F: 60
loc_01_A330:
	JSR sub_01_A8B7                 ;C - - - - - 0x002340 01:A330: 20 B7 A8
	LDA objArr_0510,X               ;C - - - - - 0x002343 01:A333: BD 10 05
	BEQ loc_01_A350                 ;C - - - - - 0x002346 01:A336: F0 18
	LDA objArr_0590,X               ;C - - - - - 0x002348 01:A338: BD 90 05
	ORA objArr_0570,X               ;C - - - - - 0x00234B 01:A33B: 1D 70 05
	BNE loc_01_A343                 ;C - - - - - 0x00234E 01:A33E: D0 03
	JMP loc_01_A3EA                 ;C - - - - - 0x002350 01:A340: 4C EA A3
loc_01_A343:
	LDA objArr_0570,X               ;C - - - - - 0x002353 01:A343: BD 70 05
	CMP #$04                        ;C - - - - - 0x002356 01:A346: C9 04
	BCC loc_01_A379                 ;C - - - - - 0x002358 01:A348: 90 2F
	CMP #$09                        ;C - - - - - 0x00235A 01:A34A: C9 09
	BCC loc_01_A36E                 ;C - - - - - 0x00235C 01:A34C: 90 20
	BCS loc_01_A3C5                 ;C - - - - - 0x00235E 01:A34E: B0 75
loc_01_A350:
	LDA objArr_0590,X               ;C - - - - - 0x002360 01:A350: BD 90 05
	BNE loc_01_A35F                 ;C - - - - - 0x002363 01:A353: D0 0A
	LDA objArr_0570,X               ;C - - - - - 0x002365 01:A355: BD 70 05
	CMP #$09                        ;C - - - - - 0x002368 01:A358: C9 09
	BNE loc_01_A35F                 ;C - - - - - 0x00236A 01:A35A: D0 03
	JMP loc_01_A3EA                 ;C - - - - - 0x00236C 01:A35C: 4C EA A3
loc_01_A35F:
	LDA objArr_0570,X               ;C - - - - - 0x00236F 01:A35F: BD 70 05
	CMP #$02                        ;C - - - - - 0x002372 01:A362: C9 02
	BCC loc_01_A379                 ;C - - - - - 0x002374 01:A364: 90 13
	CMP #$05                        ;C - - - - - 0x002376 01:A366: C9 05
	BCC loc_01_A3C5                 ;C - - - - - 0x002378 01:A368: 90 5B
	CMP #$07                        ;C - - - - - 0x00237A 01:A36A: C9 07
	BCS loc_01_A3C5                 ;C - - - - - 0x00237C 01:A36C: B0 57
loc_01_A36E:
	LDY objArr_0510,X               ;C - - - - - 0x00237E 01:A36E: BC 10 05
	LDA tbl_01_A413,Y               ;C - - - - - 0x002381 01:A371: B9 13 A4
	STA objArr_0440,X               ;C - - - - - 0x002384 01:A374: 9D 40 04
	BNE loc_01_A382                 ;C - - - - - 0x002387 01:A377: D0 09
loc_01_A379:
	LDY objArr_0510,X               ;C - - - - - 0x002389 01:A379: BC 10 05
	LDA tbl_01_A411,Y               ;C - - - - - 0x00238C 01:A37C: B9 11 A4
	STA objArr_0440,X               ;C - - - - - 0x00238F 01:A37F: 9D 40 04
loc_01_A382:
	LDA objArr_0510,X               ;C - - - - - 0x002392 01:A382: BD 10 05
	BNE loc_01_A399                 ;C - - - - - 0x002395 01:A385: D0 12
	LDA objArr_05E0,X               ;C - - - - - 0x002397 01:A387: BD E0 05
	CMP #$01                        ;C - - - - - 0x00239A 01:A38A: C9 01
	BNE loc_01_A395                 ;C - - - - - 0x00239C 01:A38C: D0 07
	LDA objArr_0570,X               ;C - - - - - 0x00239E 01:A38E: BD 70 05
	CMP #$05                        ;C - - - - - 0x0023A1 01:A391: C9 05
	BCS loc_01_A399                 ;C - - - - - 0x0023A3 01:A393: B0 04
loc_01_A395:
	LDA #$1E                        ;C - - - - - 0x0023A5 01:A395: A9 1E
	BNE loc_01_A3AF                 ;C - - - - - 0x0023A7 01:A397: D0 16
loc_01_A399:
	LDA gameAction                  ;C - - - - - 0x0023A9 01:A399: A5 30
	CMP #$01                        ;C - - - - - 0x0023AB 01:A39B: C9 01
	BEQ loc_01_A3A9                 ;C - - - - - 0x0023AD 01:A39D: F0 0A
	LDA stage                       ;C - - - - - 0x0023AF 01:A39F: A5 61
	CMP #$04                        ;C - - - - - 0x0023B1 01:A3A1: C9 04
	BNE loc_01_A3A9                 ;C - - - - - 0x0023B3 01:A3A3: D0 04
	LDA #$05                        ;C - - - - - 0x0023B5 01:A3A5: A9 05
	BNE loc_01_A3AF                 ;C - - - - - 0x0023B7 01:A3A7: D0 06
loc_01_A3A9:
	LDY objArr_0510,X               ;C - - - - - 0x0023B9 01:A3A9: BC 10 05
	LDA tbl_01_A415,Y               ;C - - - - - 0x0023BC 01:A3AC: B9 15 A4
loc_01_A3AF:
	STA objArr_0450,X               ;C - - - - - 0x0023BF 01:A3AF: 9D 50 04
	LDA objArr_04D0,X               ;C - - - - - 0x0023C2 01:A3B2: BD D0 04
	BEQ loc_01_A3C4                 ;C - - - - - 0x0023C5 01:A3B5: F0 0D
	LDA #$18                        ;C - - - - - 0x0023C7 01:A3B7: A9 18
	STA objArr_0540,X               ;C - - - - - 0x0023C9 01:A3B9: 9D 40 05
	JSR sub_0F_F34C                 ;C - - - - - 0x0023CC 01:A3BC: 20 4C F3
	LDA #$00                        ;C - - - - - 0x0023CF 01:A3BF: A9 00
	STA objArr_04D0,X               ;C - - - - - 0x0023D1 01:A3C1: 9D D0 04
loc_01_A3C4:
	RTS                             ;C - - - - - 0x0023D4 01:A3C4: 60
loc_01_A3C5:
	LDA objArr_0540,X               ;C - - - - - 0x0023D5 01:A3C5: BD 40 05
	BEQ loc_01_A3E9                 ;C - - - - - 0x0023D8 01:A3C8: F0 1F
	LDA stage                       ;C - - - - - 0x0023DA 01:A3CA: A5 61
	CMP #$04                        ;C - - - - - 0x0023DC 01:A3CC: C9 04
	BNE loc_01_A3E1                 ;C - - - - - 0x0023DE 01:A3CE: D0 11
	LDA gameAction                  ;C - - - - - 0x0023E0 01:A3D0: A5 30
	CMP #$06                        ;C - - - - - 0x0023E2 01:A3D2: C9 06
	BEQ loc_01_A3E9                 ;C - - - - - 0x0023E4 01:A3D4: F0 13
	LDA #$00                        ;C - - - - - 0x0023E6 01:A3D6: A9 00
	STA objArr_0500,X               ;C - - - - - 0x0023E8 01:A3D8: 9D 00 05
	LDA #$88                        ;C - - - - - 0x0023EB 01:A3DB: A9 88
	STA objArr_0300,X               ;C - - - - - 0x0023ED 01:A3DD: 9D 00 03
	RTS                             ;C - - - - - 0x0023F0 01:A3E0: 60
loc_01_A3E1:
	LDA #$22                        ;C - - - - - 0x0023F1 01:A3E1: A9 22
	CMP playerInvincible            ;C - - - - - 0x0023F3 01:A3E3: C5 3B
	BCS loc_01_A3E9                 ;C - - - - - 0x0023F5 01:A3E5: B0 02
	STA playerInvincible            ;C - - - - - 0x0023F7 01:A3E7: 85 3B
loc_01_A3E9:
	RTS                             ;C - - - - - 0x0023F9 01:A3E9: 60
loc_01_A3EA:
	JSR sub_0F_F343                 ;C - - - - - 0x0023FA 01:A3EA: 20 43 F3
	DEC objArr_05E0,X               ;C - - - - - 0x0023FD 01:A3ED: DE E0 05
	BEQ loc_01_A401                 ;C - - - - - 0x002400 01:A3F0: F0 0F
	LDA #$20                        ;C - - - - - 0x002402 01:A3F2: A9 20
	LDY #$0A                        ;C - - - - - 0x002404 01:A3F4: A0 0A
	JSR sub_0F_FB3E                 ;C - - - - - 0x002406 01:A3F6: 20 3E FB
	BCC loc_01_A401                 ;C - - - - - 0x002409 01:A3F9: 90 06
	LDA #$03                        ;C - - - - - 0x00240B 01:A3FB: A9 03
	STA objArr_05D0,X               ;C - - - - - 0x00240D 01:A3FD: 9D D0 05
	RTS                             ;C - - - - - 0x002410 01:A400: 60
loc_01_A401:
	LDA #$80                        ;C - - - - - 0x002411 01:A401: A9 80
	STA objArr_0300,X               ;C - - - - - 0x002413 01:A403: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002416 01:A406: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002418 01:A408: 9D 00 05
	LDA #$07                        ;C - - - - - 0x00241B 01:A40B: A9 07
	STA objArr_0550,X               ;C - - - - - 0x00241D 01:A40D: 9D 50 05
	RTS                             ;C - - - - - 0x002420 01:A410: 60
tbl_01_A411:
	.byte $91,$92                   ;- D 1 - - - 0x002421 01:A411:
tbl_01_A413:
	.byte $8D,$8E                   ;- D 1 - - - 0x002423 01:A413:
tbl_01_A415:
	.byte $1F,$27                   ;- D 1 - - - 0x002425 01:A415:
ofs_01_A417:
	LDA objArr_0500,X               ;C - - J - - 0x002427 01:A417: BD 00 05
	BNE loc_01_A42A                 ;C - - - - - 0x00242A 01:A41A: D0 0E
	LDA #$78                        ;C - - - - - 0x00242C 01:A41C: A9 78
	STA objArr_05D0,X               ;C - - - - - 0x00242E 01:A41E: 9D D0 05
	LDA #$01                        ;C - - - - - 0x002431 01:A421: A9 01
	STA objArr_05E0,X               ;C - - - - - 0x002433 01:A423: 9D E0 05
	INC objArr_0500,X               ;C - - - - - 0x002436 01:A426: FE 00 05
	RTS                             ;C - - - - - 0x002439 01:A429: 60
loc_01_A42A:
	LDA #$20                        ;C - - - - - 0x00243A 01:A42A: A9 20
	LDY #$0A                        ;C - - - - - 0x00243C 01:A42C: A0 0A
	JSR sub_0F_FB3E                 ;C - - - - - 0x00243E 01:A42E: 20 3E FB
	BCC loc_01_A441                 ;C - - - - - 0x002441 01:A431: 90 0E
	LDA #$82                        ;C - - - - - 0x002443 01:A433: A9 82
	STA objArr_0300,X               ;C - - - - - 0x002445 01:A435: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002448 01:A438: A9 00
	STA objArr_0500,X               ;C - - - - - 0x00244A 01:A43A: 9D 00 05
	STA objArr_0510,X               ;C - - - - - 0x00244D 01:A43D: 9D 10 05
	RTS                             ;C - - - - - 0x002450 01:A440: 60
loc_01_A441:
	DEC objArr_05E0,X               ;C - - - - - 0x002451 01:A441: DE E0 05
	BNE loc_01_A458                 ;C - - - - - 0x002454 01:A444: D0 12
	LDA #$08                        ;C - - - - - 0x002456 01:A446: A9 08
	STA objArr_05E0,X               ;C - - - - - 0x002458 01:A448: 9D E0 05
	JSR sub_0F_FB72                 ;C - - - - - 0x00245B 01:A44B: 20 72 FB
	TAY                             ;C - - - - - 0x00245E 01:A44E: A8
	JSR sub_01_A7E1                 ;C - - - - - 0x00245F 01:A44F: 20 E1 A7
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x002462 01:A452: B9 F0 FB
	STA objArr_0460,X               ;C - - - - - 0x002465 01:A455: 9D 60 04
loc_01_A458:
	DEC objArr_05D0,X               ;C - - - - - 0x002468 01:A458: DE D0 05
	BEQ loc_01_A463                 ;C - - - - - 0x00246B 01:A45B: F0 06
	JSR sub_01_A031                 ;C - - - - - 0x00246D 01:A45D: 20 31 A0
	JMP sub_01_A090                 ;C - - - - - 0x002470 01:A460: 4C 90 A0
loc_01_A463:
	LDA #$81                        ;c - - - - - 0x002473 01:A463: A9 81
	STA objArr_0300,X               ;c - - - - - 0x002475 01:A465: 9D 00 03
	LDA #$00                        ;c - - - - - 0x002478 01:A468: A9 00
	STA objArr_0500,X               ;c - - - - - 0x00247A 01:A46A: 9D 00 05
	LDA #$07                        ;c - - - - - 0x00247D 01:A46D: A9 07
	STA objArr_0550,X               ;c - - - - - 0x00247F 01:A46F: 9D 50 05
	RTS                             ;c - - - - - 0x002482 01:A472: 60
ofs_01_A473:
	LDA objArr_0500,X               ;C - - J - - 0x002483 01:A473: BD 00 05
	CMP #$01                        ;C - - - - - 0x002486 01:A476: C9 01
	BEQ loc_01_A49D                 ;C - - - - - 0x002488 01:A478: F0 23
	CMP #$02                        ;C - - - - - 0x00248A 01:A47A: C9 02
	BEQ loc_01_A4E2                 ;C - - - - - 0x00248C 01:A47C: F0 64
	CMP #$03                        ;C - - - - - 0x00248E 01:A47E: C9 03
	BNE loc_01_A485                 ;C - - - - - 0x002490 01:A480: D0 03
	JMP loc_01_A53B                 ;C - - - - - 0x002492 01:A482: 4C 3B A5
loc_01_A485:
	JSR sub_0F_F343                 ;C - - - - - 0x002495 01:A485: 20 43 F3
	JSR sub_01_A9CA                 ;C - - - - - 0x002498 01:A488: 20 CA A9
	JSR sub_01_A9F5                 ;C - - - - - 0x00249B 01:A48B: 20 F5 A9
	INC objArr_0500,X               ;C - - - - - 0x00249E 01:A48E: FE 00 05
	LDA #$F4                        ;C - - - - - 0x0024A1 01:A491: A9 F4
	LDY #$2C                        ;C - - - - - 0x0024A3 01:A493: A0 2C
	JSR sub_0F_F449                 ;C - - - - - 0x0024A5 01:A495: 20 49 F4
	LDA #$2E                        ;C - - - - - 0x0024A8 01:A498: A9 2E
	STA chrBankShadow+5             ;C - - - - - 0x0024AA 01:A49A: 85 ED
	RTS                             ;C - - - - - 0x0024AC 01:A49C: 60
loc_01_A49D:
	JSR sub_01_A031                 ;C - - - - - 0x0024AD 01:A49D: 20 31 A0
	LDA objArr_0460,X               ;C - - - - - 0x0024B0 01:A4A0: BD 60 04
	AND #$02                        ;C - - - - - 0x0024B3 01:A4A3: 29 02
	BNE loc_01_A4B1                 ;C - - - - - 0x0024B5 01:A4A5: D0 0A
	LDA objX,X                      ;C - - - - - 0x0024B7 01:A4A7: BD 60 03
	CMP #$F1                        ;C - - - - - 0x0024BA 01:A4AA: C9 F1
	BCC loc_01_A4B1                 ;C - - - - - 0x0024BC 01:A4AC: 90 03
	JMP loc_01_A54C                 ;c - - - - - 0x0024BE 01:A4AE: 4C 4C A5
loc_01_A4B1:
	LDA objArr_0460,X               ;C - - - - - 0x0024C1 01:A4B1: BD 60 04
	AND #$01                        ;C - - - - - 0x0024C4 01:A4B4: 29 01
	BNE loc_01_A4C2                 ;C - - - - - 0x0024C6 01:A4B6: D0 0A
	LDA objX,X                      ;C - - - - - 0x0024C8 01:A4B8: BD 60 03
	CMP #$18                        ;C - - - - - 0x0024CB 01:A4BB: C9 18
	BCS loc_01_A4C2                 ;C - - - - - 0x0024CD 01:A4BD: B0 03
	JMP loc_01_A54C                 ;c - - - - - 0x0024CF 01:A4BF: 4C 4C A5
loc_01_A4C2:
	JSR sub_0F_F374                 ;C - - - - - 0x0024D2 01:A4C2: 20 74 F3
	CMP #$30                        ;C - - - - - 0x0024D5 01:A4C5: C9 30
	BCS loc_01_A4E1                 ;C - - - - - 0x0024D7 01:A4C7: B0 18
	LDA #$F6                        ;C - - - - - 0x0024D9 01:A4C9: A9 F6
	LDY #$2F                        ;C - - - - - 0x0024DB 01:A4CB: A0 2F
	JSR sub_0F_F44F                 ;C - - - - - 0x0024DD 01:A4CD: 20 4F F4
	LDA objArr_05C0,X               ;C - - - - - 0x0024E0 01:A4D0: BD C0 05
	BEQ loc_01_A4D9                 ;C - - - - - 0x0024E3 01:A4D3: F0 04
	LDA #$2E                        ;C - - - - - 0x0024E5 01:A4D5: A9 2E
	BNE loc_01_A4DB                 ;C - - - - - 0x0024E7 01:A4D7: D0 02
loc_01_A4D9:
	LDA #$17                        ;C - - - - - 0x0024E9 01:A4D9: A9 17
loc_01_A4DB:
	STA objArr_0450,X               ;C - - - - - 0x0024EB 01:A4DB: 9D 50 04
	INC objArr_0500,X               ;C - - - - - 0x0024EE 01:A4DE: FE 00 05
loc_01_A4E1:
	RTS                             ;C - - - - - 0x0024F1 01:A4E1: 60
loc_01_A4E2:
	LDA objArr_0570,X               ;C - - - - - 0x0024F2 01:A4E2: BD 70 05
	CMP #$01                        ;C - - - - - 0x0024F5 01:A4E5: C9 01
	BNE loc_01_A4EE                 ;C - - - - - 0x0024F7 01:A4E7: D0 05
	LDA #$00                        ;C - - - - - 0x0024F9 01:A4E9: A9 00
	STA objArr_0590,X               ;C - - - - - 0x0024FB 01:A4EB: 9D 90 05
loc_01_A4EE:
	LDA objArr_0410,X               ;C - - - - - 0x0024FE 01:A4EE: BD 10 04
	BEQ loc_01_A4F8                 ;C - - - - - 0x002501 01:A4F1: F0 05
	LDA #$8B                        ;C - - - - - 0x002503 01:A4F3: A9 8B
	STA objArr_0440,X               ;C - - - - - 0x002505 01:A4F5: 9D 40 04
loc_01_A4F8:
	LDA objArr_0400,X               ;C - - - - - 0x002508 01:A4F8: BD 00 04
	SEC                             ;C - - - - - 0x00250B 01:A4FB: 38
	SBC objArr_0510,X               ;C - - - - - 0x00250C 01:A4FC: FD 10 05
	STA objArr_0400,X               ;C - - - - - 0x00250F 01:A4FF: 9D 00 04
	LDA objArr_0410,X               ;C - - - - - 0x002512 01:A502: BD 10 04
	SBC #$00                        ;C - - - - - 0x002515 01:A505: E9 00
	STA objArr_0410,X               ;C - - - - - 0x002517 01:A507: 9D 10 04
	LDA objArr_0420,X               ;C - - - - - 0x00251A 01:A50A: BD 20 04
	SEC                             ;C - - - - - 0x00251D 01:A50D: 38
	SBC objArr_0520,X               ;C - - - - - 0x00251E 01:A50E: FD 20 05
	STA objArr_0420,X               ;C - - - - - 0x002521 01:A511: 9D 20 04
	LDA objArr_0430,X               ;C - - - - - 0x002524 01:A514: BD 30 04
	SBC #$00                        ;C - - - - - 0x002527 01:A517: E9 00
	STA objArr_0430,X               ;C - - - - - 0x002529 01:A519: 9D 30 04
	LDA objArr_0410,X               ;C - - - - - 0x00252C 01:A51C: BD 10 04
	BMI loc_01_A529                 ;C - - - - - 0x00252F 01:A51F: 30 08
	LDA objArr_0430,X               ;C - - - - - 0x002531 01:A521: BD 30 04
	BMI loc_01_A529                 ;C - - - - - 0x002534 01:A524: 30 03
	JMP sub_01_A031                 ;C - - - - - 0x002536 01:A526: 4C 31 A0
loc_01_A529:
	INC objArr_0500,X               ;C - - - - - 0x002539 01:A529: FE 00 05
	LDA objArr_05C0,X               ;C - - - - - 0x00253C 01:A52C: BD C0 05
	BEQ loc_01_A535                 ;C - - - - - 0x00253F 01:A52F: F0 04
	LDA #$06                        ;C - - - - - 0x002541 01:A531: A9 06
	BNE loc_01_A537                 ;C - - - - - 0x002543 01:A533: D0 02
loc_01_A535:
	LDA #$0C                        ;C - - - - - 0x002545 01:A535: A9 0C
loc_01_A537:
	STA objArr_05D0,X               ;C - - - - - 0x002547 01:A537: 9D D0 05
	RTS                             ;C - - - - - 0x00254A 01:A53A: 60
loc_01_A53B:
	LDA objArr_05D0,X               ;C - - - - - 0x00254B 01:A53B: BD D0 05
	BEQ loc_01_A54C                 ;C - - - - - 0x00254E 01:A53E: F0 0C
	LDA #$00                        ;C - - - - - 0x002550 01:A540: A9 00
	STA objArr_0440,X               ;C - - - - - 0x002552 01:A542: 9D 40 04
	STA objArr_0590,X               ;C - - - - - 0x002555 01:A545: 9D 90 05
	DEC objArr_05D0,X               ;C - - - - - 0x002558 01:A548: DE D0 05
	RTS                             ;C - - - - - 0x00255B 01:A54B: 60
loc_01_A54C:
	LDA #$80                        ;C - - - - - 0x00255C 01:A54C: A9 80
	STA objArr_0300,X               ;C - - - - - 0x00255E 01:A54E: 9D 00 03
	LDA #$01                        ;C - - - - - 0x002561 01:A551: A9 01
	STA objArr_0550,X               ;C - - - - - 0x002563 01:A553: 9D 50 05
	RTS                             ;C - - - - - 0x002566 01:A556: 60
sub_01_A557:
	LDA objArr_0500,X               ;C - - J - - 0x002567 01:A557: BD 00 05
	LSR A                           ;C - - - - - 0x00256A 01:A55A: 4A
	BCS loc_01_A58A                 ;C - - - - - 0x00256B 01:A55B: B0 2D
	LDA objY,X                      ;C - - - - - 0x00256D 01:A55D: BD C0 03
	STA objArr_0520,X               ;C - - - - - 0x002570 01:A560: 9D 20 05
	LDA objArr_0300,X               ;C - - - - - 0x002573 01:A563: BD 00 03
	CMP #$86                        ;C - - - - - 0x002576 01:A566: C9 86
	BEQ loc_01_A576                 ;C - - - - - 0x002578 01:A568: F0 0C
	LDA #$E0                        ;C - - - - - 0x00257A 01:A56A: A9 E0
	STA objArr_0420,X               ;C - - - - - 0x00257C 01:A56C: 9D 20 04
	LDA #$04                        ;C - - - - - 0x00257F 01:A56F: A9 04
	STA objArr_0430,X               ;C - - - - - 0x002581 01:A571: 9D 30 04
	BNE loc_01_A580                 ;C - - - - - 0x002584 01:A574: D0 0A
loc_01_A576:
	LDA #$00                        ;C - - - - - 0x002586 01:A576: A9 00
	STA objArr_0420,X               ;C - - - - - 0x002588 01:A578: 9D 20 04
	LDA #$04                        ;C - - - - - 0x00258B 01:A57B: A9 04
	STA objArr_0430,X               ;C - - - - - 0x00258D 01:A57D: 9D 30 04
loc_01_A580:
	INC objArr_0500,X               ;C - - - - - 0x002590 01:A580: FE 00 05
	LDA #$E7                        ;C - - - - - 0x002593 01:A583: A9 E7
	LDY #$2A                        ;C - - - - - 0x002595 01:A585: A0 2A
	JMP sub_0F_F449                 ;C - - - - - 0x002597 01:A587: 4C 49 F4
loc_01_A58A:
	JSR sub_0F_F1FD                 ;C - - - - - 0x00259A 01:A58A: 20 FD F1
	LDA objArr_0430,X               ;C - - - - - 0x00259D 01:A58D: BD 30 04
	BPL loc_01_A5CE                 ;C - - - - - 0x0025A0 01:A590: 10 3C
	LDA #$01                        ;C - - - - - 0x0025A2 01:A592: A9 01
	STA objArr_0570,X               ;C - - - - - 0x0025A4 01:A594: 9D 70 05
	LDA #$8F                        ;C - - - - - 0x0025A7 01:A597: A9 8F
	STA objArr_0440,X               ;C - - - - - 0x0025A9 01:A599: 9D 40 04
	LDA #$16                        ;C - - - - - 0x0025AC 01:A59C: A9 16
	STA objArr_0450,X               ;C - - - - - 0x0025AE 01:A59E: 9D 50 04
	LDA objY,X                      ;C - - - - - 0x0025B1 01:A5A1: BD C0 03
	CMP objArr_0520,X               ;C - - - - - 0x0025B4 01:A5A4: DD 20 05
	BCC loc_01_A5CE                 ;C - - - - - 0x0025B7 01:A5A7: 90 25
	LDA objArr_0520,X               ;C - - - - - 0x0025B9 01:A5A9: BD 20 05
	STA objY,X                      ;C - - - - - 0x0025BC 01:A5AC: 9D C0 03
	INC objArr_0500,X               ;C - - - - - 0x0025BF 01:A5AF: FE 00 05
	LDA objArr_0500,X               ;C - - - - - 0x0025C2 01:A5B2: BD 00 05
	CMP #$04                        ;C - - - - - 0x0025C5 01:A5B5: C9 04
	BNE loc_01_A5CE                 ;C - - - - - 0x0025C7 01:A5B7: D0 15
	LDA #$00                        ;C - - - - - 0x0025C9 01:A5B9: A9 00
	STA objArr_0420,X               ;C - - - - - 0x0025CB 01:A5BB: 9D 20 04
	STA objArr_0430,X               ;C - - - - - 0x0025CE 01:A5BE: 9D 30 04
	STA objArr_0440,X               ;C - - - - - 0x0025D1 01:A5C1: 9D 40 04
	LDA #$01                        ;C - - - - - 0x0025D4 01:A5C4: A9 01
	STA objArr_0500,X               ;C - - - - - 0x0025D6 01:A5C6: 9D 00 05
	LDA #$81                        ;C - - - - - 0x0025D9 01:A5C9: A9 81
	STA objArr_0300,X               ;C - - - - - 0x0025DB 01:A5CB: 9D 00 03
loc_01_A5CE:
	RTS                             ;C - - - - - 0x0025DE 01:A5CE: 60
ofs_01_A5CF:
	LDA #$00                        ;C - - J - - 0x0025DF 01:A5CF: A9 00
	STA objArr_0400,X               ;C - - - - - 0x0025E1 01:A5D1: 9D 00 04
	LDA #$02                        ;C - - - - - 0x0025E4 01:A5D4: A9 02
	STA objArr_0410,X               ;C - - - - - 0x0025E6 01:A5D6: 9D 10 04
	JSR sub_01_A557                 ;C - - - - - 0x0025E9 01:A5D9: 20 57 A5
	LDA objArr_0300,X               ;C - - - - - 0x0025EC 01:A5DC: BD 00 03
	CMP #$81                        ;C - - - - - 0x0025EF 01:A5DF: C9 81
	BNE loc_01_A5E9                 ;C - - - - - 0x0025F1 01:A5E1: D0 06
	LDA #$80                        ;C - - - - - 0x0025F3 01:A5E3: A9 80
	STA objArr_0300,X               ;C - - - - - 0x0025F5 01:A5E5: 9D 00 03
	RTS                             ;C - - - - - 0x0025F8 01:A5E8: 60
loc_01_A5E9:
	LDA objArr_0500,X               ;C - - - - - 0x0025F9 01:A5E9: BD 00 05
	CMP #$03                        ;C - - - - - 0x0025FC 01:A5EC: C9 03
	BNE loc_01_A5F5                 ;C - - - - - 0x0025FE 01:A5EE: D0 05
	LDA #$01                        ;C - - - - - 0x002600 01:A5F0: A9 01
	STA objArr_0500,X               ;C - - - - - 0x002602 01:A5F2: 9D 00 05
loc_01_A5F5:
	LDA objArr_0460,X               ;C - - - - - 0x002605 01:A5F5: BD 60 04
	AND #$02                        ;C - - - - - 0x002608 01:A5F8: 29 02
	BEQ loc_01_A5FF                 ;C - - - - - 0x00260A 01:A5FA: F0 03
	JSR sub_0F_F1A1                 ;C - - - - - 0x00260C 01:A5FC: 20 A1 F1
loc_01_A5FF:
	LDA objArr_0460,X               ;C - - - - - 0x00260F 01:A5FF: BD 60 04
	AND #$01                        ;C - - - - - 0x002612 01:A602: 29 01
	BEQ loc_01_A609                 ;C - - - - - 0x002614 01:A604: F0 03
	JSR sub_0F_F183                 ;C - - - - - 0x002616 01:A606: 20 83 F1
loc_01_A609:
	LDA objArr_0460,X               ;C - - - - - 0x002619 01:A609: BD 60 04
	AND #$01                        ;C - - - - - 0x00261C 01:A60C: 29 01
	BNE loc_01_A61C                 ;C - - - - - 0x00261E 01:A60E: D0 0C
	LDA #$18                        ;C - - - - - 0x002620 01:A610: A9 18
	CMP objX,X                      ;C - - - - - 0x002622 01:A612: DD 60 03
	BCC loc_01_A61C                 ;C - - - - - 0x002625 01:A615: 90 05
	STA objX,X                      ;C - - - - - 0x002627 01:A617: 9D 60 03
	BNE loc_01_A62D                 ;C - - - - - 0x00262A 01:A61A: D0 11
loc_01_A61C:
	LDA objArr_0460,X               ;C - - - - - 0x00262C 01:A61C: BD 60 04
	AND #$02                        ;C - - - - - 0x00262F 01:A61F: 29 02
	BNE loc_01_A632                 ;C - - - - - 0x002631 01:A621: D0 0F
	LDA #$F1                        ;C - - - - - 0x002633 01:A623: A9 F1
	CMP objX,X                      ;C - - - - - 0x002635 01:A625: DD 60 03
	BCS loc_01_A632                 ;C - - - - - 0x002638 01:A628: B0 08
	STA objX,X                      ;C - - - - - 0x00263A 01:A62A: 9D 60 03
loc_01_A62D:
	LDA #$03                        ;C - - - - - 0x00263D 01:A62D: A9 03
	STA objArr_0500,X               ;C - - - - - 0x00263F 01:A62F: 9D 00 05
loc_01_A632:
	RTS                             ;C - - - - - 0x002642 01:A632: 60
ofs_01_A633:
	JSR sub_0F_F343                 ;C - - J - - 0x002643 01:A633: 20 43 F3
	DEC objArr_04E0,X               ;C - - - - - 0x002646 01:A636: DE E0 04
	BNE loc_01_A64B                 ;C - - - - - 0x002649 01:A639: D0 10
	LDA objSpriteDown,X             ;c - - - - - 0x00264B 01:A63B: BD B0 05
	AND #$08                        ;c - - - - - 0x00264E 01:A63E: 29 08
	BNE loc_01_A646                 ;c - - - - - 0x002650 01:A640: D0 04
	LDA #$80                        ;c - - - - - 0x002652 01:A642: A9 80
	BNE loc_01_A648                 ;c - - - - - 0x002654 01:A644: D0 02
loc_01_A646:
	LDA #$84                        ;c - - - - - 0x002656 01:A646: A9 84
loc_01_A648:
	STA objArr_0300,X               ;c - - - - - 0x002658 01:A648: 9D 00 03
loc_01_A64B:
	LDA #$00                        ;C - - - - - 0x00265B 01:A64B: A9 00
	STA objArr_0500,X               ;C - - - - - 0x00265D 01:A64D: 9D 00 05
	RTS                             ;C - - - - - 0x002660 01:A650: 60
ofs_01_A651:
	JSR sub_01_A882                 ;c - - - - - 0x002661 01:A651: 20 82 A8
	LDA objArr_0380,X               ;c - - - - - 0x002664 01:A654: BD 80 03
	CMP #$01                        ;c - - - - - 0x002667 01:A657: C9 01
	BNE loc_01_A684                 ;c - - - - - 0x002669 01:A659: D0 29
	LDA objSpriteDown,X             ;c - - - - - 0x00266B 01:A65B: BD B0 05
	CMP #$07                        ;c - - - - - 0x00266E 01:A65E: C9 07
	BNE loc_01_A668                 ;c - - - - - 0x002670 01:A660: D0 06
	LDA #$20                        ;c - - - - - 0x002672 01:A662: A9 20
	LDY #$0A                        ;c - - - - - 0x002674 01:A664: A0 0A
	BNE loc_01_A66C                 ;c - - - - - 0x002676 01:A666: D0 04
loc_01_A668:
	LDA #$24                        ;c - - - - - 0x002678 01:A668: A9 24
	LDY #$09                        ;c - - - - - 0x00267A 01:A66A: A0 09
loc_01_A66C:
	JSR sub_0F_FB3E                 ;c - - - - - 0x00267C 01:A66C: 20 3E FB
	BCC loc_01_A684                 ;c - - - - - 0x00267F 01:A66F: 90 13
	LDA objSpriteDown,X             ;c - - - - - 0x002681 01:A671: BD B0 05
	SBC #$07                        ;c - - - - - 0x002684 01:A674: E9 07
	STA objArr_0510,X               ;c - - - - - 0x002686 01:A676: 9D 10 05
	LDA #$82                        ;c - - - - - 0x002689 01:A679: A9 82
	STA objArr_0300,X               ;c - - - - - 0x00268B 01:A67B: 9D 00 03
	LDA #$00                        ;c - - - - - 0x00268E 01:A67E: A9 00
	STA objArr_0500,X               ;c - - - - - 0x002690 01:A680: 9D 00 05
	RTS                             ;c - - - - - 0x002693 01:A683: 60
loc_01_A684:
	LDY #$04                        ;c - - - - - 0x002694 01:A684: A0 04
	JSR sub_01_A7E1                 ;c - - - - - 0x002696 01:A686: 20 E1 A7
	LDA objArr_0460,X               ;c - - - - - 0x002699 01:A689: BD 60 04
	CMP #$01                        ;c - - - - - 0x00269C 01:A68C: C9 01
	BNE loc_01_A6A1                 ;c - - - - - 0x00269E 01:A68E: D0 11
	LDA objArr_0380,X               ;c - - - - - 0x0026A0 01:A690: BD 80 03
	CMP #$01                        ;c - - - - - 0x0026A3 01:A693: C9 01
	BNE loc_01_A69E                 ;c - - - - - 0x0026A5 01:A695: D0 07
	LDA objX,X                      ;c - - - - - 0x0026A7 01:A697: BD 60 03
	CMP #$18                        ;c - - - - - 0x0026AA 01:A69A: C9 18
	BCS loc_01_A6B2                 ;c - - - - - 0x0026AC 01:A69C: B0 14
loc_01_A69E:
	JMP sub_0F_F183                 ;c - - - - - 0x0026AE 01:A69E: 4C 83 F1
loc_01_A6A1:
	LDA objArr_0380,X               ;c - - - - - 0x0026B1 01:A6A1: BD 80 03
	CMP #$01                        ;c - - - - - 0x0026B4 01:A6A4: C9 01
	BNE loc_01_A6AF                 ;c - - - - - 0x0026B6 01:A6A6: D0 07
	LDA objX,X                      ;c - - - - - 0x0026B8 01:A6A8: BD 60 03
	CMP #$F2                        ;c - - - - - 0x0026BB 01:A6AB: C9 F2
	BCC loc_01_A6B2                 ;c - - - - - 0x0026BD 01:A6AD: 90 03
loc_01_A6AF:
	JMP sub_0F_F1A1                 ;c - - - - - 0x0026BF 01:A6AF: 4C A1 F1
loc_01_A6B2:
	LDA #$81                        ;c - - - - - 0x0026C2 01:A6B2: A9 81
	STA objArr_0300,X               ;c - - - - - 0x0026C4 01:A6B4: 9D 00 03
	LDA #$00                        ;c - - - - - 0x0026C7 01:A6B7: A9 00
	STA objArr_0500,X               ;c - - - - - 0x0026C9 01:A6B9: 9D 00 05
	LDA #$07                        ;c - - - - - 0x0026CC 01:A6BC: A9 07
	STA objArr_0550,X               ;c - - - - - 0x0026CE 01:A6BE: 9D 50 05
	JMP sub_0F_F343                 ;c - - - - - 0x0026D1 01:A6C1: 4C 43 F3
tbl_01_A6C4:
	.lobytes ofs_01_A13C, ofs_01_A169, ofs_01_A2ED, ofs_01_A417, ofs_01_A473, sub_01_A557, ofs_01_A5CF, ofs_01_A633;- D 1 - - - 0x0026D4 01:A6C4:
	.lobytes ofs_01_A651            ;- - - - - - 0x0026DC 01:A6CC:
tbl_01_A6CD:
	.hibytes ofs_01_A13C, ofs_01_A169, ofs_01_A2ED, ofs_01_A417, ofs_01_A473, sub_01_A557, ofs_01_A5CF, ofs_01_A633;- D 1 - - - 0x0026DD 01:A6CD:
	.hibytes ofs_01_A651            ;- - - - - - 0x0026E5 01:A6D5:
sub_01_A6D6:
	LDA objArr_03F0,X               ;C - - - - - 0x0026E6 01:A6D6: BD F0 03
	BEQ loc_01_A71C                 ;C - - - - - 0x0026E9 01:A6D9: F0 41
	CMP #$FF                        ;C - - - - - 0x0026EB 01:A6DB: C9 FF
	BEQ loc_01_A70B                 ;C - - - - - 0x0026ED 01:A6DD: F0 2C
	LDA gameAction                  ;C - - - - - 0x0026EF 01:A6DF: A5 30
	CMP #$04                        ;C - - - - - 0x0026F1 01:A6E1: C9 04
	BEQ loc_01_A6E9                 ;C - - - - - 0x0026F3 01:A6E3: F0 04
	CMP #$21                        ;C - - - - - 0x0026F5 01:A6E5: C9 21
	BNE loc_01_A71C                 ;C - - - - - 0x0026F7 01:A6E7: D0 33
loc_01_A6E9:
	CPX ram_0039                    ;C - - - - - 0x0026F9 01:A6E9: E4 39
	BNE loc_01_A71C                 ;C - - - - - 0x0026FB 01:A6EB: D0 2F
	LDA gameAction                  ;C - - - - - 0x0026FD 01:A6ED: A5 30
	CMP #$21                        ;C - - - - - 0x0026FF 01:A6EF: C9 21
	BNE loc_01_A6F9                 ;C - - - - - 0x002701 01:A6F1: D0 06
	JSR sub_01_A8EF                 ;C - - - - - 0x002703 01:A6F3: 20 EF A8
	JMP loc_01_A6FC                 ;C - - - - - 0x002706 01:A6F6: 4C FC A6
loc_01_A6F9:
	JSR sub_01_A83A                 ;C - - - - - 0x002709 01:A6F9: 20 3A A8
loc_01_A6FC:
	JSR sub_0F_F343                 ;C - - - - - 0x00270C 01:A6FC: 20 43 F3
	LDA #$80                        ;C - - - - - 0x00270F 01:A6FF: A9 80
	STA objArr_0300,X               ;C - - - - - 0x002711 01:A701: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002714 01:A704: A9 00
	STA objArr_04E0,X               ;C - - - - - 0x002716 01:A706: 9D E0 04
	SEC                             ;C - - - - - 0x002719 01:A709: 38
	RTS                             ;C - - - - - 0x00271A 01:A70A: 60
loc_01_A70B:
	LDA #$00                        ;c - - - - - 0x00271B 01:A70B: A9 00
	STA objArr_03F0,X               ;c - - - - - 0x00271D 01:A70D: 9D F0 03
	LDA playerId                    ;c - - - - - 0x002720 01:A710: A5 34
	CMP #$02                        ;c - - - - - 0x002722 01:A712: C9 02
	BNE loc_01_A71C                 ;c - - - - - 0x002724 01:A714: D0 06
	LDA objY                        ;c - - - - - 0x002726 01:A716: AD C0 03
	STA objY,X                      ;c - - - - - 0x002729 01:A719: 9D C0 03
loc_01_A71C:
	LDA objArr_04E0,X               ;C - - - - - 0x00272C 01:A71C: BD E0 04
	BEQ loc_01_A74C                 ;C - - - - - 0x00272F 01:A71F: F0 2B
	CMP #$1E                        ;C - - - - - 0x002731 01:A721: C9 1E
	BEQ loc_01_A72D                 ;C - - - - - 0x002733 01:A723: F0 08
	CMP #$1A                        ;C - - - - - 0x002735 01:A725: C9 1A
	BEQ loc_01_A733                 ;C - - - - - 0x002737 01:A727: F0 0A
	CMP #$10                        ;C - - - - - 0x002739 01:A729: C9 10
	BNE loc_01_A736                 ;C - - - - - 0x00273B 01:A72B: D0 09
loc_01_A72D:
	JSR sub_01_A83A                 ;C - - - - - 0x00273D 01:A72D: 20 3A A8
	JMP loc_01_A736                 ;C - - - - - 0x002740 01:A730: 4C 36 A7
loc_01_A733:
	JSR sub_01_A8EF                 ;C - - - - - 0x002743 01:A733: 20 EF A8
loc_01_A736:
	JSR sub_01_A090                 ;C - - - - - 0x002746 01:A736: 20 90 A0
	LDA #$87                        ;C - - - - - 0x002749 01:A739: A9 87
	STA objArr_0300,X               ;C - - - - - 0x00274B 01:A73B: 9D 00 03
	LDA objArr_05C0,X               ;C - - - - - 0x00274E 01:A73E: BD C0 05
	CMP #$02                        ;C - - - - - 0x002751 01:A741: C9 02
	BNE loc_01_A74A                 ;C - - - - - 0x002753 01:A743: D0 05
	LDA #$20                        ;C - - - - - 0x002755 01:A745: A9 20
	STA objArr_04C0,X               ;C - - - - - 0x002757 01:A747: 9D C0 04
loc_01_A74A:
	CLC                             ;C - - - - - 0x00275A 01:A74A: 18
	RTS                             ;C - - - - - 0x00275B 01:A74B: 60
loc_01_A74C:
	LDA gameAction                  ;C - - - - - 0x00275C 01:A74C: A5 30
	CMP #$0A                        ;C - - - - - 0x00275E 01:A74E: C9 0A
	BEQ loc_01_A75A                 ;C - - - - - 0x002760 01:A750: F0 08
	CMP #$0B                        ;C - - - - - 0x002762 01:A752: C9 0B
	BEQ loc_01_A75F                 ;C - - - - - 0x002764 01:A754: F0 09
	CMP #$19                        ;C - - - - - 0x002766 01:A756: C9 19
	BNE loc_01_A766                 ;C - - - - - 0x002768 01:A758: D0 0C
loc_01_A75A:
	JSR sub_01_A83A                 ;c - - - - - 0x00276A 01:A75A: 20 3A A8
	SEC                             ;c - - - - - 0x00276D 01:A75D: 38
	RTS                             ;c - - - - - 0x00276E 01:A75E: 60
loc_01_A75F:
	LDA #$00                        ;C - - - - - 0x00276F 01:A75F: A9 00
	STA objArr_04D0,X               ;C - - - - - 0x002771 01:A761: 9D D0 04
	CLC                             ;C - - - - - 0x002774 01:A764: 18
	RTS                             ;C - - - - - 0x002775 01:A765: 60
loc_01_A766:
	LDA objArr_05C0,X               ;C - - - - - 0x002776 01:A766: BD C0 05
	BNE loc_01_A794                 ;C - - - - - 0x002779 01:A769: D0 29
	LDA objArr_0300,X               ;C - - - - - 0x00277B 01:A76B: BD 00 03
	CMP #$81                        ;C - - - - - 0x00277E 01:A76E: C9 81
	BEQ loc_01_A794                 ;C - - - - - 0x002780 01:A770: F0 22
	LDA gameAction                  ;C - - - - - 0x002782 01:A772: A5 30
	CMP #$1F                        ;C - - - - - 0x002784 01:A774: C9 1F
	BNE loc_01_A794                 ;C - - - - - 0x002786 01:A776: D0 1C
	LDA objArr_0300,X               ;C - - - - - 0x002788 01:A778: BD 00 03
	CMP #$85                        ;C - - - - - 0x00278B 01:A77B: C9 85
	BEQ loc_01_A792                 ;C - - - - - 0x00278D 01:A77D: F0 13
	CMP #$86                        ;C - - - - - 0x00278F 01:A77F: C9 86
	BEQ loc_01_A792                 ;C - - - - - 0x002791 01:A781: F0 0F
	LDA #$07                        ;C - - - - - 0x002793 01:A783: A9 07
	STA objArr_0550,X               ;C - - - - - 0x002795 01:A785: 9D 50 05
	LDA #$80                        ;C - - - - - 0x002798 01:A788: A9 80
	STA objArr_0300,X               ;C - - - - - 0x00279A 01:A78A: 9D 00 03
	LDA #$00                        ;C - - - - - 0x00279D 01:A78D: A9 00
	STA objArr_0500,X               ;C - - - - - 0x00279F 01:A78F: 9D 00 05
loc_01_A792:
	CLC                             ;C - - - - - 0x0027A2 01:A792: 18
	RTS                             ;C - - - - - 0x0027A3 01:A793: 60
loc_01_A794:
	LDA gameAction                  ;C - - - - - 0x0027A4 01:A794: A5 30
	CMP #$25                        ;C - - - - - 0x0027A6 01:A796: C9 25
	BEQ loc_01_A79C                 ;C - - - - - 0x0027A8 01:A798: F0 02
	CLC                             ;C - - - - - 0x0027AA 01:A79A: 18
	RTS                             ;C - - - - - 0x0027AB 01:A79B: 60
loc_01_A79C:
	LDA objArr_05C0,X               ;C - - - - - 0x0027AC 01:A79C: BD C0 05
	BNE loc_01_A7B5                 ;C - - - - - 0x0027AF 01:A79F: D0 14
	LDA objArr_0300,X               ;C - - - - - 0x0027B1 01:A7A1: BD 00 03
	CMP #$85                        ;C - - - - - 0x0027B4 01:A7A4: C9 85
	BEQ loc_01_A7AC                 ;C - - - - - 0x0027B6 01:A7A6: F0 04
	CMP #$86                        ;C - - - - - 0x0027B8 01:A7A8: C9 86
	BNE loc_01_A7B5                 ;C - - - - - 0x0027BA 01:A7AA: D0 09
loc_01_A7AC:
	LDA objArr_0520,X               ;c - - - - - 0x0027BC 01:A7AC: BD 20 05
	STA objArr_0530,X               ;c - - - - - 0x0027BF 01:A7AF: 9D 30 05
	JMP loc_01_A7BB                 ;c - - - - - 0x0027C2 01:A7B2: 4C BB A7
loc_01_A7B5:
	LDA objY,X                      ;C - - - - - 0x0027C5 01:A7B5: BD C0 03
	STA objArr_0530,X               ;C - - - - - 0x0027C8 01:A7B8: 9D 30 05
loc_01_A7BB:
	LDA #$8E                        ;C - - - - - 0x0027CB 01:A7BB: A9 8E
	STA objArr_0420,X               ;C - - - - - 0x0027CD 01:A7BD: 9D 20 04
	LDA #$03                        ;C - - - - - 0x0027D0 01:A7C0: A9 03
	STA objArr_0430,X               ;C - - - - - 0x0027D2 01:A7C2: 9D 30 04
	LDA objArr_0320,X               ;C - - - - - 0x0027D5 01:A7C5: BD 20 03
	STA objId,X                     ;C - - - - - 0x0027D8 01:A7C8: 9D 30 03
	LDA #$05                        ;C - - - - - 0x0027DB 01:A7CB: A9 05
	STA objArr_0320,X               ;C - - - - - 0x0027DD 01:A7CD: 9D 20 03
	LDA #$00                        ;C - - - - - 0x0027E0 01:A7D0: A9 00
	STA objArr_0500,X               ;C - - - - - 0x0027E2 01:A7D2: 9D 00 05
	LDA #$80                        ;C - - - - - 0x0027E5 01:A7D5: A9 80
	STA objArr_0300,X               ;C - - - - - 0x0027E7 01:A7D7: 9D 00 03
	LDA #$FF                        ;C - - - - - 0x0027EA 01:A7DA: A9 FF
	STA objArr_04C0,X               ;C - - - - - 0x0027EC 01:A7DC: 9D C0 04
	SEC                             ;C - - - - - 0x0027EF 01:A7DF: 38
	RTS                             ;C - - - - - 0x0027F0 01:A7E0: 60
sub_01_A7E1:
	LDA tbl_01_A80A,Y               ;C - - - - - 0x0027F1 01:A7E1: B9 0A A8
	STA objArr_0400,X               ;C - - - - - 0x0027F4 01:A7E4: 9D 00 04
	LDA tbl_01_A7FA,Y               ;C - - - - - 0x0027F7 01:A7E7: B9 FA A7
	STA objArr_0410,X               ;C - - - - - 0x0027FA 01:A7EA: 9D 10 04
	LDA tbl_01_A82A,Y               ;C - - - - - 0x0027FD 01:A7ED: B9 2A A8
	STA objArr_0420,X               ;C - - - - - 0x002800 01:A7F0: 9D 20 04
	LDA tbl_01_A81A,Y               ;C - - - - - 0x002803 01:A7F3: B9 1A A8
	STA objArr_0430,X               ;C - - - - - 0x002806 01:A7F6: 9D 30 04
	RTS                             ;C - - - - - 0x002809 01:A7F9: 60
tbl_01_A7FA:
	.byte $00,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00,$01,$01,$01,$00;- D 1 - - - 0x00280A 01:A7FA:
	.byte $00                       ;- - - - - - 0x002819 01:A809:
tbl_01_A80A:
	.byte $00,$75,$D9,$1B,$33,$1B,$D9,$75,$00,$75,$D9,$1B,$33,$1B,$D9;- D 1 - - - 0x00281A 01:A80A:
	.byte $75                       ;- - - - - - 0x002829 01:A819:
tbl_01_A81A:
	.byte $01,$01,$00,$00,$00,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00;- D 1 - - - 0x00282A 01:A81A:
	.byte $01                       ;- - - - - - 0x002839 01:A829:
tbl_01_A82A:
	.byte $33,$1B,$D9,$75,$00,$75,$D9,$1B,$33,$1B,$D9,$75,$00,$75,$D9;- D 1 - - - 0x00283A 01:A82A:
	.byte $1B                       ;- - - - - - 0x002849 01:A839:
sub_01_A83A:
	LDA objArr_05C0,X               ;C - - - - - 0x00284A 01:A83A: BD C0 05
	CMP #$02                        ;C - - - - - 0x00284D 01:A83D: C9 02
	BCS loc_01_A876                 ;C - - - - - 0x00284F 01:A83F: B0 35
	LDA objSpriteDown,X             ;C - - - - - 0x002851 01:A841: BD B0 05
	SEC                             ;C - - - - - 0x002854 01:A844: 38
	SBC #$07                        ;C - - - - - 0x002855 01:A845: E9 07
	TAY                             ;C - - - - - 0x002857 01:A847: A8
	LDA tbl_01_A870,Y               ;C - - - - - 0x002858 01:A848: B9 70 A8
	CMP objArr_0580,X               ;C - - - - - 0x00285B 01:A84B: DD 80 05
	BEQ loc_01_A86F                 ;C - - - - - 0x00285E 01:A84E: F0 1F
	JSR sub_0F_F288                 ;C - - - - - 0x002860 01:A850: 20 88 F2
	LDA tbl_01_A872,Y               ;C - - - - - 0x002863 01:A853: B9 72 A8
	STA ptr_00                      ;C - - - - - 0x002866 01:A856: 85 00
	LDA tbl_01_A874,Y               ;C - - - - - 0x002868 01:A858: B9 74 A8
	STA ptr_00+1                    ;C - - - - - 0x00286B 01:A85B: 85 01
	LDA tbl_01_A914,Y               ;C - - - - - 0x00286D 01:A85D: B9 14 A9
	TAY                             ;C - - - - - 0x002870 01:A860: A8
	LDA ptr_00                      ;C - - - - - 0x002871 01:A861: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x002873 01:A863: 99 EB 00
	LDA tbl_01_A916,Y               ;C - - - - - 0x002876 01:A866: B9 16 A9
	TAY                             ;C - - - - - 0x002879 01:A869: A8
	LDA ptr_00+1                    ;C - - - - - 0x00287A 01:A86A: A5 01
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x00287C 01:A86C: 99 EB 00
loc_01_A86F:
	RTS                             ;C - - - - - 0x00287F 01:A86F: 60
tbl_01_A870:
	.byte $E4,$F0                   ;- D 1 - - - 0x002880 01:A870:
tbl_01_A872:
	.byte $28,$2C                   ;- D 1 - - - 0x002882 01:A872:
tbl_01_A874:
	.byte $28,$2E                   ;- D 1 - - - 0x002884 01:A874:
loc_01_A876:
	LDA #$EF                        ;C - - - - - 0x002886 01:A876: A9 EF
	LDY #$2C                        ;C - - - - - 0x002888 01:A878: A0 2C
	JSR sub_0F_F449                 ;C - - - - - 0x00288A 01:A87A: 20 49 F4
	LDA #$2E                        ;C - - - - - 0x00288D 01:A87D: A9 2E
	STA chrBankShadow+5             ;C - - - - - 0x00288F 01:A87F: 85 ED
	RTS                             ;C - - - - - 0x002891 01:A881: 60
sub_01_A882:
	LDA objSpriteDown,X             ;C - - - - - 0x002892 01:A882: BD B0 05
	SEC                             ;C - - - - - 0x002895 01:A885: 38
	SBC #$07                        ;C - - - - - 0x002896 01:A886: E9 07
	TAY                             ;C - - - - - 0x002898 01:A888: A8
	LDA tbl_01_A8B1,Y               ;C - - - - - 0x002899 01:A889: B9 B1 A8
	CMP objArr_0580,X               ;C - - - - - 0x00289C 01:A88C: DD 80 05
	BEQ loc_01_A8B0                 ;C - - - - - 0x00289F 01:A88F: F0 1F
	JSR sub_0F_F288                 ;C - - - - - 0x0028A1 01:A891: 20 88 F2
	LDA tbl_01_A8B3,Y               ;C - - - - - 0x0028A4 01:A894: B9 B3 A8
	STA ptr_00                      ;C - - - - - 0x0028A7 01:A897: 85 00
	LDA tbl_01_A8B5,Y               ;C - - - - - 0x0028A9 01:A899: B9 B5 A8
	STA ptr_00+1                    ;C - - - - - 0x0028AC 01:A89C: 85 01
	LDA tbl_01_A914,Y               ;C - - - - - 0x0028AE 01:A89E: B9 14 A9
	TAY                             ;C - - - - - 0x0028B1 01:A8A1: A8
	LDA ptr_00                      ;C - - - - - 0x0028B2 01:A8A2: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0028B4 01:A8A4: 99 EB 00
	LDA tbl_01_A916,Y               ;C - - - - - 0x0028B7 01:A8A7: B9 16 A9
	TAY                             ;C - - - - - 0x0028BA 01:A8AA: A8
	LDA ptr_00+1                    ;C - - - - - 0x0028BB 01:A8AB: A5 01
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0028BD 01:A8AD: 99 EB 00
loc_01_A8B0:
	RTS                             ;C - - - - - 0x0028C0 01:A8B0: 60
tbl_01_A8B1:
	.byte $E5,$F2                   ;- D 1 - - - 0x0028C1 01:A8B1:
tbl_01_A8B3:
	.byte $28,$2C                   ;- D 1 - - - 0x0028C3 01:A8B3:
tbl_01_A8B5:
	.byte $28,$2E                   ;- D 1 - - - 0x0028C5 01:A8B5:
sub_01_A8B7:
	LDA objSpriteDown,X             ;C - - - - - 0x0028C7 01:A8B7: BD B0 05
	SEC                             ;C - - - - - 0x0028CA 01:A8BA: 38
	SBC #$07                        ;C - - - - - 0x0028CB 01:A8BB: E9 07
	TAY                             ;C - - - - - 0x0028CD 01:A8BD: A8
	LDA tbl_01_A8E9,Y               ;C - - - - - 0x0028CE 01:A8BE: B9 E9 A8
	CMP objArr_0580,X               ;C - - - - - 0x0028D1 01:A8C1: DD 80 05
	BEQ loc_01_A8E8                 ;C - - - - - 0x0028D4 01:A8C4: F0 22
	JSR sub_0F_F288                 ;C - - - - - 0x0028D6 01:A8C6: 20 88 F2
	LDA tbl_01_A8EB,Y               ;C - - - - - 0x0028D9 01:A8C9: B9 EB A8
	STA ptr_00                      ;C - - - - - 0x0028DC 01:A8CC: 85 00
	LDA tbl_01_A8ED,Y               ;C - - - - - 0x0028DE 01:A8CE: B9 ED A8
	STA ptr_00+1                    ;C - - - - - 0x0028E1 01:A8D1: 85 01
	LDA tbl_01_A914,Y               ;C - - - - - 0x0028E3 01:A8D3: B9 14 A9
	TAY                             ;C - - - - - 0x0028E6 01:A8D6: A8
	LDA ptr_00                      ;C - - - - - 0x0028E7 01:A8D7: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0028E9 01:A8D9: 99 EB 00
	LDA tbl_01_A916,Y               ;C - - - - - 0x0028EC 01:A8DC: B9 16 A9
	TAY                             ;C - - - - - 0x0028EF 01:A8DF: A8
	LDA ptr_00+1                    ;C - - - - - 0x0028F0 01:A8E0: A5 01
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0028F2 01:A8E2: 99 EB 00
	INC objArr_0590,X               ;C - - - - - 0x0028F5 01:A8E5: FE 90 05
loc_01_A8E8:
	RTS                             ;C - - - - - 0x0028F8 01:A8E8: 60
tbl_01_A8E9:
	.byte $E9,$F5                   ;- D 1 - - - 0x0028F9 01:A8E9:
tbl_01_A8EB:
	.byte $29,$2C                   ;- D 1 - - - 0x0028FB 01:A8EB:
tbl_01_A8ED:
	.byte $29,$2E                   ;- D 1 - - - 0x0028FD 01:A8ED:
sub_01_A8EF:
	LDA objSpriteDown,X             ;C - - - - - 0x0028FF 01:A8EF: BD B0 05
	SEC                             ;C - - - - - 0x002902 01:A8F2: 38
	SBC #$07                        ;C - - - - - 0x002903 01:A8F3: E9 07
	TAY                             ;C - - - - - 0x002905 01:A8F5: A8
	LDA tbl_01_A910,Y               ;C - - - - - 0x002906 01:A8F6: B9 10 A9
	CMP objArr_0580,X               ;C - - - - - 0x002909 01:A8F9: DD 80 05
	BEQ loc_01_A90F                 ;C - - - - - 0x00290C 01:A8FC: F0 11
	JSR sub_0F_F288                 ;C - - - - - 0x00290E 01:A8FE: 20 88 F2
	LDA tbl_01_A912,Y               ;C - - - - - 0x002911 01:A901: B9 12 A9
	STA ptr_00                      ;C - - - - - 0x002914 01:A904: 85 00
	LDA tbl_01_A914,Y               ;C - - - - - 0x002916 01:A906: B9 14 A9
	TAY                             ;C - - - - - 0x002919 01:A909: A8
	LDA ptr_00                      ;C - - - - - 0x00291A 01:A90A: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x00291C 01:A90C: 99 EB 00
loc_01_A90F:
	RTS                             ;C - - - - - 0x00291F 01:A90F: 60
tbl_01_A910:
	.byte $EA,$F7                   ;- D 1 - - - 0x002920 01:A910:
tbl_01_A912:
	.byte $2B,$2D                   ;- D 1 - - - 0x002922 01:A912:
tbl_01_A914:
	.byte $01,$01                   ;- D 1 - - - 0x002924 01:A914:
tbl_01_A916:
	.byte $01                       ;- - - - - - 0x002926 01:A916:
	.byte $02                       ;- D 1 - - - 0x002927 01:A917:
sub_01_A918:
	LDA tbl_01_A941,Y               ;C - - - - - 0x002928 01:A918: B9 41 A9
	STA objArr_0400,X               ;C - - - - - 0x00292B 01:A91B: 9D 00 04
	LDA tbl_01_A931,Y               ;C - - - - - 0x00292E 01:A91E: B9 31 A9
	STA objArr_0410,X               ;C - - - - - 0x002931 01:A921: 9D 10 04
	LDA tbl_01_A961,Y               ;C - - - - - 0x002934 01:A924: B9 61 A9
	STA objArr_0420,X               ;C - - - - - 0x002937 01:A927: 9D 20 04
	LDA tbl_01_A951,Y               ;C - - - - - 0x00293A 01:A92A: B9 51 A9
	STA objArr_0430,X               ;C - - - - - 0x00293D 01:A92D: 9D 30 04
	RTS                             ;C - - - - - 0x002940 01:A930: 60
tbl_01_A931:
	.byte $00,$00,$01               ;- - - - - - 0x002941 01:A931:
	.byte $02,$02,$02,$01           ;- D 1 - - - 0x002944 01:A934:
	.byte $00,$00,$00,$01           ;- - - - - - 0x002948 01:A938:
	.byte $02,$02                   ;- D 1 - - - 0x00294C 01:A93C:
	.byte $02,$01,$00               ;- - - - - - 0x00294E 01:A93E:
tbl_01_A941:
	.byte $00,$E1,$A0               ;- - - - - - 0x002951 01:A941:
	.byte $1F,$4C,$1F,$A0           ;- D 1 - - - 0x002954 01:A944:
	.byte $E1,$00,$E1,$A0           ;- - - - - - 0x002958 01:A948:
	.byte $1F,$4C                   ;- D 1 - - - 0x00295C 01:A94C:
	.byte $1F,$A0,$E1               ;- - - - - - 0x00295E 01:A94E:
tbl_01_A951:
	.byte $02,$02,$01               ;- - - - - - 0x002961 01:A951:
	.byte $00,$00,$00,$01           ;- D 1 - - - 0x002964 01:A954:
	.byte $02,$02,$02,$01           ;- - - - - - 0x002968 01:A958:
	.byte $00,$00                   ;- D 1 - - - 0x00296C 01:A95C:
	.byte $00,$01,$02               ;- - - - - - 0x00296E 01:A95E:
tbl_01_A961:
	.byte $4C,$1F,$A0               ;- - - - - - 0x002971 01:A961:
	.byte $E1,$00,$E1,$A0           ;- D 1 - - - 0x002974 01:A964:
	.byte $1F,$4C,$1F,$A0           ;- - - - - - 0x002978 01:A968:
	.byte $E1,$00                   ;- D 1 - - - 0x00297C 01:A96C:
	.byte $E1,$A0,$1F               ;- - - - - - 0x00297E 01:A96E:
sub_01_A971:
	LDA tbl_01_A99A,Y               ;C - - - - - 0x002981 01:A971: B9 9A A9
	STA objArr_0400,X               ;C - - - - - 0x002984 01:A974: 9D 00 04
	LDA tbl_01_A98A,Y               ;C - - - - - 0x002987 01:A977: B9 8A A9
	STA objArr_0410,X               ;C - - - - - 0x00298A 01:A97A: 9D 10 04
	LDA tbl_01_A9BA,Y               ;C - - - - - 0x00298D 01:A97D: B9 BA A9
	STA objArr_0420,X               ;C - - - - - 0x002990 01:A980: 9D 20 04
	LDA tbl_01_A9AA,Y               ;C - - - - - 0x002993 01:A983: B9 AA A9
	STA objArr_0430,X               ;C - - - - - 0x002996 01:A986: 9D 30 04
	RTS                             ;C - - - - - 0x002999 01:A989: 60
tbl_01_A98A:
	.byte $00,$01                   ;- - - - - - 0x00299A 01:A98A:
	.byte $02,$02,$03               ;- D 1 - - - 0x00299C 01:A98C:
	.byte $02                       ;- - - - - - 0x00299F 01:A98F:
	.byte $02                       ;- D 1 - - - 0x0029A0 01:A990:
	.byte $01,$00,$01               ;- - - - - - 0x0029A1 01:A991:
	.byte $02,$02,$03               ;- D 1 - - - 0x0029A4 01:A994:
	.byte $02                       ;- - - - - - 0x0029A7 01:A997:
	.byte $02                       ;- D 1 - - - 0x0029A8 01:A998:
	.byte $01                       ;- - - - - - 0x0029A9 01:A999:
tbl_01_A99A:
	.byte $00,$25                   ;- - - - - - 0x0029AA 01:A99A:
	.byte $1F,$C5,$00               ;- D 1 - - - 0x0029AC 01:A99C:
	.byte $C5                       ;- - - - - - 0x0029AF 01:A99F:
	.byte $1F                       ;- D 1 - - - 0x0029B0 01:A9A0:
	.byte $25,$00,$25               ;- - - - - - 0x0029B1 01:A9A1:
	.byte $1F,$C5,$00               ;- D 1 - - - 0x0029B4 01:A9A4:
	.byte $C5                       ;- - - - - - 0x0029B7 01:A9A7:
	.byte $1F                       ;- D 1 - - - 0x0029B8 01:A9A8:
	.byte $25                       ;- - - - - - 0x0029B9 01:A9A9:
tbl_01_A9AA:
	.byte $03,$02                   ;- - - - - - 0x0029BA 01:A9AA:
	.byte $02,$01,$00               ;- D 1 - - - 0x0029BC 01:A9AC:
	.byte $01                       ;- - - - - - 0x0029BF 01:A9AF:
	.byte $02                       ;- D 1 - - - 0x0029C0 01:A9B0:
	.byte $02,$03,$02               ;- - - - - - 0x0029C1 01:A9B1:
	.byte $02,$01,$00               ;- D 1 - - - 0x0029C4 01:A9B4:
	.byte $01                       ;- - - - - - 0x0029C7 01:A9B7:
	.byte $02                       ;- D 1 - - - 0x0029C8 01:A9B8:
	.byte $02                       ;- - - - - - 0x0029C9 01:A9B9:
tbl_01_A9BA:
	.byte $00,$C5                   ;- - - - - - 0x0029CA 01:A9BA:
	.byte $1F,$25,$00               ;- D 1 - - - 0x0029CC 01:A9BC:
	.byte $25                       ;- - - - - - 0x0029CF 01:A9BF:
	.byte $1F                       ;- D 1 - - - 0x0029D0 01:A9C0:
	.byte $C5,$00,$C5               ;- - - - - - 0x0029D1 01:A9C1:
	.byte $1F,$25,$00               ;- D 1 - - - 0x0029D4 01:A9C4:
	.byte $25                       ;- - - - - - 0x0029D7 01:A9C7:
	.byte $1F                       ;- D 1 - - - 0x0029D8 01:A9C8:
	.byte $C5                       ;- - - - - - 0x0029D9 01:A9C9:
sub_01_A9CA:
	JSR sub_0F_FB5B                 ;C - - - - - 0x0029DA 01:A9CA: 20 5B FB
	TAY                             ;C - - - - - 0x0029DD 01:A9CD: A8
	AND #$07                        ;C - - - - - 0x0029DE 01:A9CE: 29 07
	BNE loc_01_A9EA                 ;C - - - - - 0x0029E0 01:A9D0: D0 18
	TYA                             ;C - - - - - 0x0029E2 01:A9D2: 98
	BNE loc_01_A9D9                 ;C - - - - - 0x0029E3 01:A9D3: D0 04
	INY                             ;C - - - - - 0x0029E5 01:A9D5: C8
	INY                             ;C - - - - - 0x0029E6 01:A9D6: C8
	BNE loc_01_A9DB                 ;C - - - - - 0x0029E7 01:A9D7: D0 02
loc_01_A9D9:
	DEY                             ;C - - - - - 0x0029E9 01:A9D9: 88
	DEY                             ;C - - - - - 0x0029EA 01:A9DA: 88
loc_01_A9DB:
	JSR sub_0F_F374                 ;C - - - - - 0x0029EB 01:A9DB: 20 74 F3
	BCS loc_01_A9EE                 ;C - - - - - 0x0029EE 01:A9DE: B0 0E
	TYA                             ;C - - - - - 0x0029F0 01:A9E0: 98
	EOR #$FF                        ;C - - - - - 0x0029F1 01:A9E1: 49 FF
	ADC #$01                        ;C - - - - - 0x0029F3 01:A9E3: 69 01
	AND #$0F                        ;C - - - - - 0x0029F5 01:A9E5: 29 0F
	TAY                             ;C - - - - - 0x0029F7 01:A9E7: A8
	BNE loc_01_A9EE                 ;C - - - - - 0x0029F8 01:A9E8: D0 04
loc_01_A9EA:
	LDA tbl_01_AA23,Y               ;C - - - - - 0x0029FA 01:A9EA: B9 23 AA
	TAY                             ;C - - - - - 0x0029FD 01:A9ED: A8
loc_01_A9EE:
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x0029FE 01:A9EE: B9 F0 FB
	STA objArr_0460,X               ;C - - - - - 0x002A01 01:A9F1: 9D 60 04
	RTS                             ;C - - - - - 0x002A04 01:A9F4: 60
sub_01_A9F5:
	JSR sub_01_A918                 ;C - - - - - 0x002A05 01:A9F5: 20 18 A9
	TYA                             ;C - - - - - 0x002A08 01:A9F8: 98
	AND #$01                        ;C - - - - - 0x002A09 01:A9F9: 29 01
	BEQ loc_01_AA09                 ;C - - - - - 0x002A0B 01:A9FB: F0 0C
	LDA #$12                        ;C - - - - - 0x002A0D 01:A9FD: A9 12
	STA objArr_0510,X               ;C - - - - - 0x002A0F 01:A9FF: 9D 10 05
	LDA #$07                        ;C - - - - - 0x002A12 01:AA02: A9 07
	STA objArr_0520,X               ;C - - - - - 0x002A14 01:AA04: 9D 20 05
	BNE loc_01_AA22                 ;C - - - - - 0x002A17 01:AA07: D0 19
loc_01_AA09:
	TYA                             ;C - - - - - 0x002A19 01:AA09: 98
	LSR A                           ;C - - - - - 0x002A1A 01:AA0A: 4A
	LSR A                           ;C - - - - - 0x002A1B 01:AA0B: 4A
	BCC loc_01_AA18                 ;C - - - - - 0x002A1C 01:AA0C: 90 0A
	LDA #$0E                        ;C - - - - - 0x002A1E 01:AA0E: A9 0E
	STA objArr_0510,X               ;C - - - - - 0x002A20 01:AA10: 9D 10 05
	STA objArr_0520,X               ;C - - - - - 0x002A23 01:AA13: 9D 20 05
	BNE loc_01_AA22                 ;C - - - - - 0x002A26 01:AA16: D0 0A
loc_01_AA18:
	LDA #$14                        ;C - - - - - 0x002A28 01:AA18: A9 14
	STA objArr_0510,X               ;C - - - - - 0x002A2A 01:AA1A: 9D 10 05
	LDA #$00                        ;C - - - - - 0x002A2D 01:AA1D: A9 00
	STA objArr_0520,X               ;C - - - - - 0x002A2F 01:AA1F: 9D 20 05
loc_01_AA22:
	RTS                             ;C - - - - - 0x002A32 01:AA22: 60
tbl_01_AA23:
	.byte $02                       ;- - - - - - 0x002A33 01:AA23:
	.byte $02                       ;- D 1 - - - 0x002A34 01:AA24:
	.byte $02                       ;- - - - - - 0x002A35 01:AA25:
	.byte $03,$04,$05,$06,$06       ;- D 1 - - - 0x002A36 01:AA26:
	.byte $0A,$0A,$0A               ;- - - - - - 0x002A3B 01:AA2B:
	.byte $0B,$0C                   ;- D 1 - - - 0x002A3E 01:AA2E:
	.byte $0D,$0E                   ;- - - - - - 0x002A40 01:AA30:
	.byte $0E                       ;- D 1 - - - 0x002A42 01:AA32:
loc_01_AA33:
	LDA objLife,X                   ;C - - - - - 0x002A43 01:AA33: BD 90 04
	CMP #$30                        ;C - - - - - 0x002A46 01:AA36: C9 30
	BCS loc_01_AA45                 ;C - - - - - 0x002A48 01:AA38: B0 0B
	LDA objArr_05C0,X               ;C - - - - - 0x002A4A 01:AA3A: BD C0 05
	CMP #$01                        ;C - - - - - 0x002A4D 01:AA3D: C9 01
	BNE loc_01_AA4A                 ;C - - - - - 0x002A4F 01:AA3F: D0 09
	LDA #$02                        ;C - - - - - 0x002A51 01:AA41: A9 02
	BNE loc_01_AA47                 ;C - - - - - 0x002A53 01:AA43: D0 02
loc_01_AA45:
	LDA #$01                        ;C - - - - - 0x002A55 01:AA45: A9 01
loc_01_AA47:
	STA objArr_05C0,X               ;C - - - - - 0x002A57 01:AA47: 9D C0 05
loc_01_AA4A:
	LDA #$08                        ;C - - - - - 0x002A5A 01:AA4A: A9 08
	STA objSpriteDown,X             ;C - - - - - 0x002A5C 01:AA4C: 9D B0 05
	LDA #$00                        ;C - - - - - 0x002A5F 01:AA4F: A9 00
	STA objArr_0440,X               ;C - - - - - 0x002A61 01:AA51: 9D 40 04
	LDA objArr_04C0,X               ;C - - - - - 0x002A64 01:AA54: BD C0 04
	BEQ loc_01_AA5C                 ;C - - - - - 0x002A67 01:AA57: F0 03
	DEC objArr_04C0,X               ;C - - - - - 0x002A69 01:AA59: DE C0 04
loc_01_AA5C:
	LDA objArr_0320+13              ;C - - - - - 0x002A6C 01:AA5C: AD 2D 03
	CMP #$6E                        ;C - - - - - 0x002A6F 01:AA5F: C9 6E
	BEQ loc_01_AA69                 ;C - - - - - 0x002A71 01:AA61: F0 06
	JSR sub_01_A6D6                 ;C - - - - - 0x002A73 01:AA63: 20 D6 A6
	BCC loc_01_AA6F                 ;C - - - - - 0x002A76 01:AA66: 90 07
	RTS                             ;C - - - - - 0x002A78 01:AA68: 60
loc_01_AA69:
	LDA #$01                        ;C - - - - - 0x002A79 01:AA69: A9 01
	STA objArr_04C0,X               ;C - - - - - 0x002A7B 01:AA6B: 9D C0 04
	RTS                             ;C - - - - - 0x002A7E 01:AA6E: 60
loc_01_AA6F:
	LDA gameAction                  ;C - - - - - 0x002A7F 01:AA6F: A5 30
	CMP #$1F                        ;C - - - - - 0x002A81 01:AA71: C9 1F
	BNE loc_01_AAB3                 ;C - - - - - 0x002A83 01:AA73: D0 3E
	LDA objArr_05C0,X               ;C - - - - - 0x002A85 01:AA75: BD C0 05
	CMP #$03                        ;C - - - - - 0x002A88 01:AA78: C9 03
	BNE loc_01_AA9B                 ;C - - - - - 0x002A8A 01:AA7A: D0 1F
	LDA objArr_0300,X               ;C - - - - - 0x002A8C 01:AA7C: BD 00 03
	CMP #$83                        ;C - - - - - 0x002A8F 01:AA7F: C9 83
	BNE loc_01_AA8A                 ;C - - - - - 0x002A91 01:AA81: D0 07
	LDA objArr_0500,X               ;C - - - - - 0x002A93 01:AA83: BD 00 05
	CMP #$01                        ;C - - - - - 0x002A96 01:AA86: C9 01
	BEQ loc_01_AAB3                 ;C - - - - - 0x002A98 01:AA88: F0 29
loc_01_AA8A:
	LDA #$83                        ;C - - - - - 0x002A9A 01:AA8A: A9 83
	STA objArr_0300,X               ;C - - - - - 0x002A9C 01:AA8C: 9D 00 03
	LDA #$02                        ;C - - - - - 0x002A9F 01:AA8F: A9 02
	STA objArr_0500,X               ;C - - - - - 0x002AA1 01:AA91: 9D 00 05
	LDA #$20                        ;C - - - - - 0x002AA4 01:AA94: A9 20
	STA objArr_05D0,X               ;C - - - - - 0x002AA6 01:AA96: 9D D0 05
	BNE loc_01_AAB0                 ;C - - - - - 0x002AA9 01:AA99: D0 15
loc_01_AA9B:
	LDA objArr_0300,X               ;C - - - - - 0x002AAB 01:AA9B: BD 00 03
	CMP #$86                        ;C - - - - - 0x002AAE 01:AA9E: C9 86
	BEQ loc_01_AAB0                 ;C - - - - - 0x002AB0 01:AAA0: F0 0E
	CMP #$85                        ;C - - - - - 0x002AB2 01:AAA2: C9 85
	BEQ loc_01_AAB3                 ;C - - - - - 0x002AB4 01:AAA4: F0 0D
	LDA #$85                        ;C - - - - - 0x002AB6 01:AAA6: A9 85
	STA objArr_0300,X               ;C - - - - - 0x002AB8 01:AAA8: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002ABB 01:AAAB: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002ABD 01:AAAD: 9D 00 05
loc_01_AAB0:
	JMP sub_01_A83A                 ;C - - - - - 0x002AC0 01:AAB0: 4C 3A A8
loc_01_AAB3:
	LDA objArr_0300,X               ;C - - - - - 0x002AC3 01:AAB3: BD 00 03
	AND #$0F                        ;C - - - - - 0x002AC6 01:AAB6: 29 0F
	TAY                             ;C - - - - - 0x002AC8 01:AAB8: A8
	LDA tbl_01_AAC6,Y               ;C - - - - - 0x002AC9 01:AAB9: B9 C6 AA
	STA ptr_00                      ;C - - - - - 0x002ACC 01:AABC: 85 00
	LDA tbl_01_AACF,Y               ;C - - - - - 0x002ACE 01:AABE: B9 CF AA
	STA ptr_00+1                    ;C - - - - - 0x002AD1 01:AAC1: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x002AD3 01:AAC3: 6C 00 00
tbl_01_AAC6:
	.lobytes ofs_01_AAD8, ofs_01_AB0A, ofs_01_A2ED, ofs_01_AC4E, ofs_01_A473, ofs_01_ABB6, ofs_01_ADBA, ofs_01_AD8C;- D 1 - - - 0x002AD6 01:AAC6:
	.lobytes ofs_01_AE19            ;- D 1 - - - 0x002ADE 01:AACE:
tbl_01_AACF:
	.hibytes ofs_01_AAD8, ofs_01_AB0A, ofs_01_A2ED, ofs_01_AC4E, ofs_01_A473, ofs_01_ABB6, ofs_01_ADBA, ofs_01_AD8C;- D 1 - - - 0x002ADF 01:AACF:
	.hibytes ofs_01_AE19            ;- D 1 - - - 0x002AE7 01:AAD7:
ofs_01_AAD8:
	LDA objArr_05C0,X               ;C - - J - - 0x002AE8 01:AAD8: BD C0 05
	CMP #$03                        ;C - - - - - 0x002AEB 01:AADB: C9 03
	BEQ loc_01_AAF4                 ;C - - - - - 0x002AED 01:AADD: F0 15
	CMP #$02                        ;C - - - - - 0x002AEF 01:AADF: C9 02
	BNE loc_01_AAFF                 ;C - - - - - 0x002AF1 01:AAE1: D0 1C
	LDA #$7C                        ;C - - - - - 0x002AF3 01:AAE3: A9 7C
	STA objArr_04C0,X               ;C - - - - - 0x002AF5 01:AAE5: 9D C0 04
	LDA #$74                        ;C - - - - - 0x002AF8 01:AAE8: A9 74
	STA objArr_05D0,X               ;C - - - - - 0x002AFA 01:AAEA: 9D D0 05
	INC objArr_05C0,X               ;C - - - - - 0x002AFD 01:AAED: FE C0 05
	LDA #$03                        ;C - - - - - 0x002B00 01:AAF0: A9 03
	BNE loc_01_AAF6                 ;C - - - - - 0x002B02 01:AAF2: D0 02
loc_01_AAF4:
	LDA #$00                        ;C - - - - - 0x002B04 01:AAF4: A9 00
loc_01_AAF6:
	STA objArr_0500,X               ;C - - - - - 0x002B06 01:AAF6: 9D 00 05
	LDA #$83                        ;C - - - - - 0x002B09 01:AAF9: A9 83
	STA objArr_0300,X               ;C - - - - - 0x002B0B 01:AAFB: 9D 00 03
	RTS                             ;C - - - - - 0x002B0E 01:AAFE: 60
loc_01_AAFF:
	LDA #$00                        ;C - - - - - 0x002B0F 01:AAFF: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002B11 01:AB01: 9D 00 05
	INC objArr_0300,X               ;C - - - - - 0x002B14 01:AB04: FE 00 03
	JMP sub_01_A83A                 ;C - - - - - 0x002B17 01:AB07: 4C 3A A8
ofs_01_AB0A:
	LDA #$24                        ;C - - J - - 0x002B1A 01:AB0A: A9 24
	LDY #$09                        ;C - - - - - 0x002B1C 01:AB0C: A0 09
	JSR sub_0F_FB3E                 ;C - - - - - 0x002B1E 01:AB0E: 20 3E FB
	BCC loc_01_AB23                 ;C - - - - - 0x002B21 01:AB11: 90 10
	LDA #$82                        ;C - - - - - 0x002B23 01:AB13: A9 82
	STA objArr_0300,X               ;C - - - - - 0x002B25 01:AB15: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002B28 01:AB18: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002B2A 01:AB1A: 9D 00 05
	LDA #$01                        ;C - - - - - 0x002B2D 01:AB1D: A9 01
	STA objArr_0510,X               ;C - - - - - 0x002B2F 01:AB1F: 9D 10 05
	RTS                             ;C - - - - - 0x002B32 01:AB22: 60
loc_01_AB23:
	JSR sub_01_A882                 ;C - - - - - 0x002B33 01:AB23: 20 82 A8
	LDA objArr_0500,X               ;C - - - - - 0x002B36 01:AB26: BD 00 05
	BEQ loc_01_AB2E                 ;C - - - - - 0x002B39 01:AB29: F0 03
	JMP loc_01_AB93                 ;C - - - - - 0x002B3B 01:AB2B: 4C 93 AB
loc_01_AB2E:
	LDA #$30                        ;C - - - - - 0x002B3E 01:AB2E: A9 30
	LDY #$10                        ;C - - - - - 0x002B40 01:AB30: A0 10
	JSR sub_0F_FB3E                 ;C - - - - - 0x002B42 01:AB32: 20 3E FB
	BCC loc_01_AB5A                 ;C - - - - - 0x002B45 01:AB35: 90 23
	LDA gameAction                  ;C - - - - - 0x002B47 01:AB37: A5 30
	CMP #$06                        ;C - - - - - 0x002B49 01:AB39: C9 06
	BEQ loc_01_AB46                 ;C - - - - - 0x002B4B 01:AB3B: F0 09
	CMP #$1F                        ;C - - - - - 0x002B4D 01:AB3D: C9 1F
	BEQ loc_01_AB46                 ;C - - - - - 0x002B4F 01:AB3F: F0 05
	LDA ram_00E4                    ;C - - - - - 0x002B51 01:AB41: A5 E4
	LSR A                           ;C - - - - - 0x002B53 01:AB43: 4A
	BCS loc_01_AB51                 ;C - - - - - 0x002B54 01:AB44: B0 0B
loc_01_AB46:
	LDA #$00                        ;C - - - - - 0x002B56 01:AB46: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002B58 01:AB48: 9D 00 05
	LDA #$85                        ;C - - - - - 0x002B5B 01:AB4B: A9 85
	STA objArr_0300,X               ;C - - - - - 0x002B5D 01:AB4D: 9D 00 03
	RTS                             ;C - - - - - 0x002B60 01:AB50: 60
loc_01_AB51:
	LDA #$00                        ;C - - - - - 0x002B61 01:AB51: A9 00
	STA objArr_05D0,X               ;C - - - - - 0x002B63 01:AB53: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x002B66 01:AB56: FE 00 05
	RTS                             ;C - - - - - 0x002B69 01:AB59: 60
loc_01_AB5A:
	JSR sub_0F_FBD9                 ;C - - - - - 0x002B6A 01:AB5A: 20 D9 FB
	CMP #$08                        ;C - - - - - 0x002B6D 01:AB5D: C9 08
	BCC loc_01_AB7A                 ;C - - - - - 0x002B6F 01:AB5F: 90 19
	LDY #$00                        ;C - - - - - 0x002B71 01:AB61: A0 00
	JSR sub_01_A7E1                 ;C - - - - - 0x002B73 01:AB63: 20 E1 A7
	JSR sub_0F_FBD9                 ;C - - - - - 0x002B76 01:AB66: 20 D9 FB
	BCS loc_01_AB6F                 ;C - - - - - 0x002B79 01:AB69: B0 04
	LDA #$08                        ;C - - - - - 0x002B7B 01:AB6B: A9 08
	BNE loc_01_AB71                 ;C - - - - - 0x002B7D 01:AB6D: D0 02
loc_01_AB6F:
	LDA #$04                        ;C - - - - - 0x002B7F 01:AB6F: A9 04
loc_01_AB71:
	STA objArr_0460,X               ;C - - - - - 0x002B81 01:AB71: 9D 60 04
	JSR sub_01_A031                 ;C - - - - - 0x002B84 01:AB74: 20 31 A0
	JMP sub_01_A090                 ;C - - - - - 0x002B87 01:AB77: 4C 90 A0
loc_01_AB7A:
	LDY #$04                        ;C - - - - - 0x002B8A 01:AB7A: A0 04
	JSR sub_01_A7E1                 ;C - - - - - 0x002B8C 01:AB7C: 20 E1 A7
	JSR sub_0F_F374                 ;C - - - - - 0x002B8F 01:AB7F: 20 74 F3
	BCS loc_01_AB88                 ;C - - - - - 0x002B92 01:AB82: B0 04
	LDA #$02                        ;C - - - - - 0x002B94 01:AB84: A9 02
	BNE loc_01_AB8A                 ;C - - - - - 0x002B96 01:AB86: D0 02
loc_01_AB88:
	LDA #$01                        ;C - - - - - 0x002B98 01:AB88: A9 01
loc_01_AB8A:
	STA objArr_0460,X               ;C - - - - - 0x002B9A 01:AB8A: 9D 60 04
	JSR sub_01_A031                 ;C - - - - - 0x002B9D 01:AB8D: 20 31 A0
	JMP sub_01_A090                 ;C - - - - - 0x002BA0 01:AB90: 4C 90 A0
loc_01_AB93:
	LDA objArr_05D0,X               ;C - - - - - 0x002BA3 01:AB93: BD D0 05
	BEQ loc_01_AB9E                 ;C - - - - - 0x002BA6 01:AB96: F0 06
	DEC objArr_05D0,X               ;C - - - - - 0x002BA8 01:AB98: DE D0 05
	JMP loc_01_ABB0                 ;C - - - - - 0x002BAB 01:AB9B: 4C B0 AB
loc_01_AB9E:
	LDA #$08                        ;C - - - - - 0x002BAE 01:AB9E: A9 08
	STA objArr_05D0,X               ;C - - - - - 0x002BB0 01:ABA0: 9D D0 05
	JSR sub_0F_FB72                 ;C - - - - - 0x002BB3 01:ABA3: 20 72 FB
	TAY                             ;C - - - - - 0x002BB6 01:ABA6: A8
	JSR sub_01_A7E1                 ;C - - - - - 0x002BB7 01:ABA7: 20 E1 A7
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x002BBA 01:ABAA: B9 F0 FB
	STA objArr_0460,X               ;C - - - - - 0x002BBD 01:ABAD: 9D 60 04
loc_01_ABB0:
	JSR sub_01_A031                 ;C - - - - - 0x002BC0 01:ABB0: 20 31 A0
	JMP sub_01_A090                 ;C - - - - - 0x002BC3 01:ABB3: 4C 90 A0
ofs_01_ABB6:
	JSR sub_01_A882                 ;C - - J - - 0x002BC6 01:ABB6: 20 82 A8
	LDA gameAction                  ;C - - - - - 0x002BC9 01:ABB9: A5 30
	CMP #$01                        ;C - - - - - 0x002BCB 01:ABBB: C9 01
	BNE loc_01_ABD8                 ;C - - - - - 0x002BCD 01:ABBD: D0 19
	LDA #$20                        ;C - - - - - 0x002BCF 01:ABBF: A9 20
	LDY #$09                        ;C - - - - - 0x002BD1 01:ABC1: A0 09
	JSR sub_0F_FB3E                 ;C - - - - - 0x002BD3 01:ABC3: 20 3E FB
	BCC loc_01_ABD8                 ;C - - - - - 0x002BD6 01:ABC6: 90 10
	LDA #$82                        ;c - - - - - 0x002BD8 01:ABC8: A9 82
	STA objArr_0300,X               ;c - - - - - 0x002BDA 01:ABCA: 9D 00 03
	LDA #$00                        ;c - - - - - 0x002BDD 01:ABCD: A9 00
	STA objArr_0500,X               ;c - - - - - 0x002BDF 01:ABCF: 9D 00 05
	LDA #$01                        ;c - - - - - 0x002BE2 01:ABD2: A9 01
	STA objArr_0510,X               ;c - - - - - 0x002BE4 01:ABD4: 9D 10 05
	RTS                             ;c - - - - - 0x002BE7 01:ABD7: 60
loc_01_ABD8:
	LDA objArr_0500,X               ;C - - - - - 0x002BE8 01:ABD8: BD 00 05
	BNE loc_01_AC28                 ;C - - - - - 0x002BEB 01:ABDB: D0 4B
	LDA ram_00E4                    ;C - - - - - 0x002BED 01:ABDD: A5 E4
	AND #$0F                        ;C - - - - - 0x002BEF 01:ABDF: 29 0F
	CMP #$08                        ;C - - - - - 0x002BF1 01:ABE1: C9 08
	BCS loc_01_ABEC                 ;C - - - - - 0x002BF3 01:ABE3: B0 07
	LDA #$03                        ;C - - - - - 0x002BF5 01:ABE5: A9 03
	STA objArr_0460,X               ;C - - - - - 0x002BF7 01:ABE7: 9D 60 04
	BNE loc_01_AC01                 ;C - - - - - 0x002BFA 01:ABEA: D0 15
loc_01_ABEC:
	CMP #$0D                        ;C - - - - - 0x002BFC 01:ABEC: C9 0D
	BCS loc_01_ABFC                 ;C - - - - - 0x002BFE 01:ABEE: B0 0C
	LDY #$04                        ;C - - - - - 0x002C00 01:ABF0: A0 04
	JSR sub_01_A7E1                 ;C - - - - - 0x002C02 01:ABF2: 20 E1 A7
	LDA #$04                        ;C - - - - - 0x002C05 01:ABF5: A9 04
	STA objArr_0460,X               ;C - - - - - 0x002C07 01:ABF7: 9D 60 04
	BNE loc_01_AC06                 ;C - - - - - 0x002C0A 01:ABFA: D0 0A
loc_01_ABFC:
	LDA #$05                        ;c - - - - - 0x002C0C 01:ABFC: A9 05
	STA objArr_0460,X               ;c - - - - - 0x002C0E 01:ABFE: 9D 60 04
loc_01_AC01:
	LDY #$05                        ;C - - - - - 0x002C11 01:AC01: A0 05
	JSR sub_01_A7E1                 ;C - - - - - 0x002C13 01:AC03: 20 E1 A7
loc_01_AC06:
	JSR sub_0F_F374                 ;C - - - - - 0x002C16 01:AC06: 20 74 F3
	BCC loc_01_AC16                 ;C - - - - - 0x002C19 01:AC09: 90 0B
	LDA objArr_0460,X               ;C - - - - - 0x002C1B 01:AC0B: BD 60 04
	EOR #$0F                        ;C - - - - - 0x002C1E 01:AC0E: 49 0F
	STA objArr_0460,X               ;C - - - - - 0x002C20 01:AC10: 9D 60 04
	INC objArr_0460,X               ;C - - - - - 0x002C23 01:AC13: FE 60 04
loc_01_AC16:
	LDY objArr_0460,X               ;C - - - - - 0x002C26 01:AC16: BC 60 04
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x002C29 01:AC19: B9 F0 FB
	STA objArr_0460,X               ;C - - - - - 0x002C2C 01:AC1C: 9D 60 04
	LDA #$64                        ;C - - - - - 0x002C2F 01:AC1F: A9 64
	STA objArr_05D0,X               ;C - - - - - 0x002C31 01:AC21: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x002C34 01:AC24: FE 00 05
	RTS                             ;C - - - - - 0x002C37 01:AC27: 60
loc_01_AC28:
	DEC objArr_05D0,X               ;C - - - - - 0x002C38 01:AC28: DE D0 05
	BEQ loc_01_AC43                 ;C - - - - - 0x002C3B 01:AC2B: F0 16
	JSR sub_01_A031                 ;C - - - - - 0x002C3D 01:AC2D: 20 31 A0
	JSR sub_01_A090                 ;C - - - - - 0x002C40 01:AC30: 20 90 A0
	LDA ptr_0E+1                    ;C - - - - - 0x002C43 01:AC33: A5 0F
	BNE loc_01_AC43                 ;C - - - - - 0x002C45 01:AC35: D0 0C
	LDA objX,X                      ;C - - - - - 0x002C47 01:AC37: BD 60 03
	CMP #$F1                        ;C - - - - - 0x002C4A 01:AC3A: C9 F1
	BCS loc_01_AC43                 ;C - - - - - 0x002C4C 01:AC3C: B0 05
	CMP #$18                        ;C - - - - - 0x002C4E 01:AC3E: C9 18
	BCC loc_01_AC43                 ;C - - - - - 0x002C50 01:AC40: 90 01
	RTS                             ;C - - - - - 0x002C52 01:AC42: 60
loc_01_AC43:
	LDA #$00                        ;C - - - - - 0x002C53 01:AC43: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002C55 01:AC45: 9D 00 05
	LDA #$86                        ;C - - - - - 0x002C58 01:AC48: A9 86
	STA objArr_0300,X               ;C - - - - - 0x002C5A 01:AC4A: 9D 00 03
	RTS                             ;C - - - - - 0x002C5D 01:AC4D: 60
ofs_01_AC4E:
	LDA objArr_0500,X               ;C - - J - - 0x002C5E 01:AC4E: BD 00 05
	BEQ loc_01_AC61                 ;C - - - - - 0x002C61 01:AC51: F0 0E
	CMP #$01                        ;C - - - - - 0x002C63 01:AC53: C9 01
	BEQ loc_01_AC87                 ;C - - - - - 0x002C65 01:AC55: F0 30
	CMP #$02                        ;C - - - - - 0x002C67 01:AC57: C9 02
	BNE loc_01_AC5E                 ;C - - - - - 0x002C69 01:AC59: D0 03
	JMP loc_01_AD50                 ;C - - - - - 0x002C6B 01:AC5B: 4C 50 AD
loc_01_AC5E:
	JMP loc_01_AD5E                 ;C - - - - - 0x002C6E 01:AC5E: 4C 5E AD
loc_01_AC61:
	JSR sub_01_A9CA                 ;C - - - - - 0x002C71 01:AC61: 20 CA A9
	TYA                             ;C - - - - - 0x002C74 01:AC64: 98
	STA objArr_0540,X               ;C - - - - - 0x002C75 01:AC65: 9D 40 05
	JSR sub_01_A971                 ;C - - - - - 0x002C78 01:AC68: 20 71 A9
	JSR sub_0F_F32E                 ;C - - - - - 0x002C7B 01:AC6B: 20 2E F3
	LDA #$00                        ;C - - - - - 0x002C7E 01:AC6E: A9 00
	STA objArr_05D0,X               ;C - - - - - 0x002C80 01:AC70: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x002C83 01:AC73: FE 00 05
	LDA #$17                        ;C - - - - - 0x002C86 01:AC76: A9 17
	STA objArr_0450,X               ;C - - - - - 0x002C88 01:AC78: 9D 50 04
	LDA #$F3                        ;C - - - - - 0x002C8B 01:AC7B: A9 F3
	LDY #$2C                        ;C - - - - - 0x002C8D 01:AC7D: A0 2C
	JSR sub_0F_F449                 ;C - - - - - 0x002C8F 01:AC7F: 20 49 F4
	LDA #$2E                        ;C - - - - - 0x002C92 01:AC82: A9 2E
	STA chrBankShadow+5             ;C - - - - - 0x002C94 01:AC84: 85 ED
	RTS                             ;C - - - - - 0x002C96 01:AC86: 60
loc_01_AC87:
	LDA #$90                        ;C - - - - - 0x002C97 01:AC87: A9 90
	STA objArr_0440,X               ;C - - - - - 0x002C99 01:AC89: 9D 40 04
	LDA #$17                        ;C - - - - - 0x002C9C 01:AC8C: A9 17
	LDY objArr_05D0,X               ;C - - - - - 0x002C9E 01:AC8E: BC D0 05
	LDA objArr_0460,X               ;C - - - - - 0x002CA1 01:AC91: BD 60 04
	EOR objArr_05D0,X               ;C - - - - - 0x002CA4 01:AC94: 5D D0 05
	LSR A                           ;C - - - - - 0x002CA7 01:AC97: 4A
	BCC loc_01_ACAF                 ;C - - - - - 0x002CA8 01:AC98: 90 15
	LDA objX,X                      ;C - - - - - 0x002CAA 01:AC9A: BD 60 03
	CLC                             ;C - - - - - 0x002CAD 01:AC9D: 18
	ADC tbl_01_AD80,Y               ;C - - - - - 0x002CAE 01:AC9E: 79 80 AD
	STA objX,X                      ;C - - - - - 0x002CB1 01:ACA1: 9D 60 03
	LDA objArr_0380,X               ;C - - - - - 0x002CB4 01:ACA4: BD 80 03
	ADC #$00                        ;C - - - - - 0x002CB7 01:ACA7: 69 00
	STA objArr_0380,X               ;C - - - - - 0x002CB9 01:ACA9: 9D 80 03
	JMP loc_01_ACC1                 ;C - - - - - 0x002CBC 01:ACAC: 4C C1 AC
loc_01_ACAF:
	LDA objX,X                      ;C - - - - - 0x002CBF 01:ACAF: BD 60 03
	SEC                             ;C - - - - - 0x002CC2 01:ACB2: 38
	SBC tbl_01_AD80,Y               ;C - - - - - 0x002CC3 01:ACB3: F9 80 AD
	STA objX,X                      ;C - - - - - 0x002CC6 01:ACB6: 9D 60 03
	LDA objArr_0380,X               ;C - - - - - 0x002CC9 01:ACB9: BD 80 03
	SBC #$00                        ;C - - - - - 0x002CCC 01:ACBC: E9 00
	STA objArr_0380,X               ;C - - - - - 0x002CCE 01:ACBE: 9D 80 03
loc_01_ACC1:
	LDA objArr_0540,X               ;C - - - - - 0x002CD1 01:ACC1: BD 40 05
	AND #$07                        ;C - - - - - 0x002CD4 01:ACC4: 29 07
	CMP #$04                        ;C - - - - - 0x002CD6 01:ACC6: C9 04
	BEQ loc_01_AD0B                 ;C - - - - - 0x002CD8 01:ACC8: F0 41
	LDA objArr_0540,X               ;C - - - - - 0x002CDA 01:ACCA: BD 40 05
	LSR A                           ;C - - - - - 0x002CDD 01:ACCD: 4A
	BCS loc_01_ACD5                 ;C - - - - - 0x002CDE 01:ACCE: B0 05
	LDA tbl_01_AD84,Y               ;C - - - - - 0x002CE0 01:ACD0: B9 84 AD
	BNE loc_01_ACD8                 ;C - - - - - 0x002CE3 01:ACD3: D0 03
loc_01_ACD5:
	LDA tbl_01_AD88,Y               ;C - - - - - 0x002CE5 01:ACD5: B9 88 AD
loc_01_ACD8:
	STA ptr_00+1                    ;C - - - - - 0x002CE8 01:ACD8: 85 01
	LDA objArr_0460,X               ;C - - - - - 0x002CEA 01:ACDA: BD 60 04
	LSR A                           ;C - - - - - 0x002CED 01:ACDD: 4A
	LSR A                           ;C - - - - - 0x002CEE 01:ACDE: 4A
	LSR A                           ;C - - - - - 0x002CEF 01:ACDF: 4A
	EOR objArr_05D0,X               ;C - - - - - 0x002CF0 01:ACE0: 5D D0 05
	LSR A                           ;C - - - - - 0x002CF3 01:ACE3: 4A
	BCC loc_01_ACFA                 ;C - - - - - 0x002CF4 01:ACE4: 90 14
	LDA objY,X                      ;C - - - - - 0x002CF6 01:ACE6: BD C0 03
	SEC                             ;C - - - - - 0x002CF9 01:ACE9: 38
	SBC ptr_00+1                    ;C - - - - - 0x002CFA 01:ACEA: E5 01
	STA objY,X                      ;C - - - - - 0x002CFC 01:ACEC: 9D C0 03
	LDA objArr_03E0,X               ;C - - - - - 0x002CFF 01:ACEF: BD E0 03
	SBC #$00                        ;C - - - - - 0x002D02 01:ACF2: E9 00
	STA objArr_03E0,X               ;C - - - - - 0x002D04 01:ACF4: 9D E0 03
	JMP loc_01_AD0B                 ;C - - - - - 0x002D07 01:ACF7: 4C 0B AD
loc_01_ACFA:
	LDA objY,X                      ;C - - - - - 0x002D0A 01:ACFA: BD C0 03
	CLC                             ;C - - - - - 0x002D0D 01:ACFD: 18
	ADC ptr_00+1                    ;C - - - - - 0x002D0E 01:ACFE: 65 01
	STA objY,X                      ;C - - - - - 0x002D10 01:AD00: 9D C0 03
	LDA objArr_03E0,X               ;C - - - - - 0x002D13 01:AD03: BD E0 03
	ADC #$00                        ;C - - - - - 0x002D16 01:AD06: 69 00
	STA objArr_03E0,X               ;C - - - - - 0x002D18 01:AD08: 9D E0 03
loc_01_AD0B:
	INC objArr_05D0,X               ;C - - - - - 0x002D1B 01:AD0B: FE D0 05
	LDA objArr_05D0,X               ;C - - - - - 0x002D1E 01:AD0E: BD D0 05
	AND #$03                        ;C - - - - - 0x002D21 01:AD11: 29 03
	STA objArr_05D0,X               ;C - - - - - 0x002D23 01:AD13: 9D D0 05
	JSR sub_01_A031                 ;C - - - - - 0x002D26 01:AD16: 20 31 A0
	LDA ptr_0E+1                    ;C - - - - - 0x002D29 01:AD19: A5 0F
	BNE loc_01_AD42                 ;C - - - - - 0x002D2B 01:AD1B: D0 25
	LDA objArr_0380,X               ;C - - - - - 0x002D2D 01:AD1D: BD 80 03
	CMP objArr_0380                 ;C - - - - - 0x002D30 01:AD20: CD 80 03
	BNE loc_01_AD41                 ;C - - - - - 0x002D33 01:AD23: D0 1C
	LDA objArr_0460,X               ;C - - - - - 0x002D35 01:AD25: BD 60 04
	AND #$01                        ;C - - - - - 0x002D38 01:AD28: 29 01
	BNE loc_01_AD33                 ;C - - - - - 0x002D3A 01:AD2A: D0 07
	LDA objX,X                      ;C - - - - - 0x002D3C 01:AD2C: BD 60 03
	CMP #$18                        ;C - - - - - 0x002D3F 01:AD2F: C9 18
	BCC loc_01_AD42                 ;C - - - - - 0x002D41 01:AD31: 90 0F
loc_01_AD33:
	LDA objArr_0460,X               ;C - - - - - 0x002D43 01:AD33: BD 60 04
	AND #$02                        ;C - - - - - 0x002D46 01:AD36: 29 02
	BNE loc_01_AD41                 ;C - - - - - 0x002D48 01:AD38: D0 07
	LDA objX,X                      ;C - - - - - 0x002D4A 01:AD3A: BD 60 03
	CMP #$F1                        ;C - - - - - 0x002D4D 01:AD3D: C9 F1
	BCS loc_01_AD42                 ;C - - - - - 0x002D4F 01:AD3F: B0 01
loc_01_AD41:
	RTS                             ;C - - - - - 0x002D51 01:AD41: 60
loc_01_AD42:
	INC objArr_0500,X               ;C - - - - - 0x002D52 01:AD42: FE 00 05
	LDA #$00                        ;C - - - - - 0x002D55 01:AD45: A9 00
	STA objArr_0440,X               ;C - - - - - 0x002D57 01:AD47: 9D 40 04
	LDA #$48                        ;C - - - - - 0x002D5A 01:AD4A: A9 48
	STA objArr_05D0,X               ;C - - - - - 0x002D5C 01:AD4C: 9D D0 05
	RTS                             ;C - - - - - 0x002D5F 01:AD4F: 60
loc_01_AD50:
	JSR sub_01_A83A                 ;C - - - - - 0x002D60 01:AD50: 20 3A A8
	DEC objArr_05D0,X               ;C - - - - - 0x002D63 01:AD53: DE D0 05
	BNE loc_01_AD5D                 ;C - - - - - 0x002D66 01:AD56: D0 05
	LDA #$00                        ;C - - - - - 0x002D68 01:AD58: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002D6A 01:AD5A: 9D 00 05
loc_01_AD5D:
	RTS                             ;C - - - - - 0x002D6D 01:AD5D: 60
loc_01_AD5E:
	LDA objArr_05D0,X               ;C - - - - - 0x002D6E 01:AD5E: BD D0 05
	CMP #$40                        ;C - - - - - 0x002D71 01:AD61: C9 40
	BCC loc_01_AD6B                 ;C - - - - - 0x002D73 01:AD63: 90 06
	LDA #$FA                        ;C - - - - - 0x002D75 01:AD65: A9 FA
	LDY #$2E                        ;C - - - - - 0x002D77 01:AD67: A0 2E
	BNE loc_01_AD72                 ;C - - - - - 0x002D79 01:AD69: D0 07
loc_01_AD6B:
	JSR sub_0F_F099                 ;C - - - - - 0x002D7B 01:AD6B: 20 99 F0
	LDA #$F1                        ;C - - - - - 0x002D7E 01:AD6E: A9 F1
	LDY #$31                        ;C - - - - - 0x002D80 01:AD70: A0 31
loc_01_AD72:
	JSR sub_0F_F449                 ;C - - - - - 0x002D82 01:AD72: 20 49 F4
	DEC objArr_05D0,X               ;C - - - - - 0x002D85 01:AD75: DE D0 05
	BNE loc_01_AD7F                 ;C - - - - - 0x002D88 01:AD78: D0 05
	LDA #$00                        ;C - - - - - 0x002D8A 01:AD7A: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002D8C 01:AD7C: 9D 00 05
loc_01_AD7F:
	RTS                             ;C - - - - - 0x002D8F 01:AD7F: 60
tbl_01_AD80:
	.byte $10,$08,$08,$10           ;- D 1 - - - 0x002D90 01:AD80:
tbl_01_AD84:
	.byte $10,$08,$08,$10           ;- D 1 - - - 0x002D94 01:AD84:
tbl_01_AD88:
	.byte $08,$04,$04,$08           ;- D 1 - - - 0x002D98 01:AD88:
ofs_01_AD8C:
	JSR sub_0F_F343                 ;C - - J - - 0x002D9C 01:AD8C: 20 43 F3
	DEC objArr_04E0,X               ;C - - - - - 0x002D9F 01:AD8F: DE E0 04
	BNE loc_01_ADB9                 ;C - - - - - 0x002DA2 01:AD92: D0 25
	LDA objArr_05C0,X               ;C - - - - - 0x002DA4 01:AD94: BD C0 05
	CMP #$01                        ;C - - - - - 0x002DA7 01:AD97: C9 01
	BEQ loc_01_ADA3                 ;C - - - - - 0x002DA9 01:AD99: F0 08
	CMP #$02                        ;C - - - - - 0x002DAB 01:AD9B: C9 02
	BEQ loc_01_ADAB                 ;C - - - - - 0x002DAD 01:AD9D: F0 0C
	CMP #$03                        ;C - - - - - 0x002DAF 01:AD9F: C9 03
	BEQ loc_01_ADAF                 ;C - - - - - 0x002DB1 01:ADA1: F0 0C
loc_01_ADA3:
	CMP #$02                        ;c - - - - - 0x002DB3 01:ADA3: C9 02
	BCS loc_01_ADAF                 ;c - - - - - 0x002DB5 01:ADA5: B0 08
	LDA #$84                        ;c - - - - - 0x002DB7 01:ADA7: A9 84
	BNE loc_01_ADB1                 ;c - - - - - 0x002DB9 01:ADA9: D0 06
loc_01_ADAB:
	LDA #$80                        ;C - - - - - 0x002DBB 01:ADAB: A9 80
	BNE loc_01_ADB1                 ;C - - - - - 0x002DBD 01:ADAD: D0 02
loc_01_ADAF:
	LDA #$83                        ;C - - - - - 0x002DBF 01:ADAF: A9 83
loc_01_ADB1:
	STA objArr_0300,X               ;C - - - - - 0x002DC1 01:ADB1: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002DC4 01:ADB4: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002DC6 01:ADB6: 9D 00 05
loc_01_ADB9:
	RTS                             ;C - - - - - 0x002DC9 01:ADB9: 60
ofs_01_ADBA:
	LDA objArr_0500,X               ;C - - J - - 0x002DCA 01:ADBA: BD 00 05
	BNE loc_01_ADCA                 ;C - - - - - 0x002DCD 01:ADBD: D0 0B
	LDA #$18                        ;C - - - - - 0x002DCF 01:ADBF: A9 18
	STA objArr_05D0,X               ;C - - - - - 0x002DD1 01:ADC1: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x002DD4 01:ADC4: FE 00 05
	JMP sub_01_A83A                 ;C - - - - - 0x002DD7 01:ADC7: 4C 3A A8
loc_01_ADCA:
	LDA objArr_05D0,X               ;C - - - - - 0x002DDA 01:ADCA: BD D0 05
	BEQ loc_01_ADD3                 ;C - - - - - 0x002DDD 01:ADCD: F0 04
	DEC objArr_05D0,X               ;C - - - - - 0x002DDF 01:ADCF: DE D0 05
	RTS                             ;C - - - - - 0x002DE2 01:ADD2: 60
loc_01_ADD3:
	JSR sub_0F_F374                 ;C - - - - - 0x002DE3 01:ADD3: 20 74 F3
	CMP #$28                        ;C - - - - - 0x002DE6 01:ADD6: C9 28
	BCS loc_01_ADEE                 ;C - - - - - 0x002DE8 01:ADD8: B0 14
	LDA #$00                        ;c - - - - - 0x002DEA 01:ADDA: A9 00
	BEQ loc_01_AE00                 ;c - - - - - 0x002DEC 01:ADDC: F0 22
	CMP #$3C                        ;c - - - - - 0x002DEE 01:ADDE: C9 3C
	BCS loc_01_ADE6                 ;c - - - - - 0x002DF0 01:ADE0: B0 04
	LDA #$0A                        ;c - - - - - 0x002DF2 01:ADE2: A9 0A
	BNE loc_01_AE00                 ;c - - - - - 0x002DF4 01:ADE4: D0 1A
loc_01_ADE6:
	CMP #$50                        ;c - - - - - 0x002DF6 01:ADE6: C9 50
	BCS loc_01_ADEE                 ;c - - - - - 0x002DF8 01:ADE8: B0 04
	LDA #$0B                        ;c - - - - - 0x002DFA 01:ADEA: A9 0B
	BNE loc_01_AE00                 ;c - - - - - 0x002DFC 01:ADEC: D0 12
loc_01_ADEE:
	CMP #$64                        ;C - - - - - 0x002DFE 01:ADEE: C9 64
	BCS loc_01_ADF6                 ;C - - - - - 0x002E00 01:ADF0: B0 04
	LDA #$0C                        ;C - - - - - 0x002E02 01:ADF2: A9 0C
	BNE loc_01_AE00                 ;C - - - - - 0x002E04 01:ADF4: D0 0A
loc_01_ADF6:
	CMP #$78                        ;C - - - - - 0x002E06 01:ADF6: C9 78
	BCS loc_01_ADFE                 ;C - - - - - 0x002E08 01:ADF8: B0 04
	LDA #$0D                        ;C - - - - - 0x002E0A 01:ADFA: A9 0D
	BNE loc_01_AE00                 ;C - - - - - 0x002E0C 01:ADFC: D0 02
loc_01_ADFE:
	LDA #$0E                        ;C - - - - - 0x002E0E 01:ADFE: A9 0E
loc_01_AE00:
	STA ptr_00                      ;C - - - - - 0x002E10 01:AE00: 85 00
	LDA ram_00E4                    ;C - - - - - 0x002E12 01:AE02: A5 E4
	AND #$0F                        ;C - - - - - 0x002E14 01:AE04: 29 0F
	CMP ptr_00                      ;C - - - - - 0x002E16 01:AE06: C5 00
	BCS loc_01_AE15                 ;C - - - - - 0x002E18 01:AE08: B0 0B
	LDA #$84                        ;C - - - - - 0x002E1A 01:AE0A: A9 84
loc_01_AE0C:
	STA objArr_0300,X               ;C - - - - - 0x002E1C 01:AE0C: 9D 00 03
	LDA #$00                        ;C - - - - - 0x002E1F 01:AE0F: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002E21 01:AE11: 9D 00 05
	RTS                             ;C - - - - - 0x002E24 01:AE14: 60
loc_01_AE15:
	LDA #$81                        ;C - - - - - 0x002E25 01:AE15: A9 81
	BNE loc_01_AE0C                 ;C - - - - - 0x002E27 01:AE17: D0 F3
ofs_01_AE19:
	LDA objArr_0500,X               ;C - - J - - 0x002E29 01:AE19: BD 00 05
	BNE loc_01_AE31                 ;C - - - - - 0x002E2C 01:AE1C: D0 13
	LDA #$20                        ;C - - - - - 0x002E2E 01:AE1E: A9 20
	STA playerInvincible            ;C - - - - - 0x002E30 01:AE20: 85 3B
	INC objArr_0500,X               ;C - - - - - 0x002E32 01:AE22: FE 00 05
	LDA #$27                        ;C - - - - - 0x002E35 01:AE25: A9 27
	STA objArr_0450,X               ;C - - - - - 0x002E37 01:AE27: 9D 50 04
	LDA #$F6                        ;C - - - - - 0x002E3A 01:AE2A: A9 F6
	LDY #$2F                        ;C - - - - - 0x002E3C 01:AE2C: A0 2F
	JMP sub_0F_F44F                 ;C - - - - - 0x002E3E 01:AE2E: 4C 4F F4
loc_01_AE31:
	LDA #$98                        ;C - - - - - 0x002E41 01:AE31: A9 98
	STA objArr_0440,X               ;C - - - - - 0x002E43 01:AE33: 9D 40 04
	LDA objArr_0570,X               ;C - - - - - 0x002E46 01:AE36: BD 70 05
	CMP #$09                        ;C - - - - - 0x002E49 01:AE39: C9 09
	BCC loc_01_AE4A                 ;C - - - - - 0x002E4B 01:AE3B: 90 0D
	LDA #$00                        ;C - - - - - 0x002E4D 01:AE3D: A9 00
	STA objArr_0500,X               ;C - - - - - 0x002E4F 01:AE3F: 9D 00 05
	STA objArr_04D0,X               ;C - - - - - 0x002E52 01:AE42: 9D D0 04
	LDA #$81                        ;C - - - - - 0x002E55 01:AE45: A9 81
	STA objArr_0300,X               ;C - - - - - 0x002E57 01:AE47: 9D 00 03
loc_01_AE4A:
	RTS                             ;C - - - - - 0x002E5A 01:AE4A: 60
	.byte $58,$71,$01,$80,$50,$17,$44,$F0,$01,$2D,$54,$61,$05,$8B,$15,$8E;- - - - - - 0x002E5B 01:AE4B:
	.byte $04,$0F,$11,$06,$45       ;- - - - - - 0x002E6B 01:AE5B:
	.byte $00,$01,$02,$03,$5B       ;- D 1 - - - 0x002E70 01:AE60:
	.byte $51,$38,$45               ;- - - - - - 0x002E75 01:AE65:
	.byte $23                       ;- D 1 - - - 0x002E78 01:AE68:
	.byte $00,$18,$51,$16,$10,$11,$54;- - - - - - 0x002E79 01:AE69:
	.byte $00,$00                   ;- D 1 - - - 0x002E80 01:AE70:
	.byte $4E,$14,$01,$01,$80,$15   ;- - - - - - 0x002E82 01:AE72:
	.byte $40,$42                   ;- D 1 - - - 0x002E88 01:AE78:
	.byte $C0,$44                   ;- - - - - - 0x002E8A 01:AE7A:
	.byte $0F,$20,$10,$1B,$0F,$37,$27,$17,$0F,$31,$21,$11,$0F,$05,$23,$15;- D 1 - - - 0x002E8C 01:AE7C:
	.byte $00,$00,$00,$83,$04,$05,$06,$07,$C6;- D 1 - - - 0x002E9C 01:AE8C:
	.byte $15,$C9,$11               ;- - - - - - 0x002EA5 01:AE95:
	.byte $23                       ;- D 1 - - - 0x002EA8 01:AE98:
	.byte $00,$CD,$11,$49,$75,$F4,$15;- - - - - - 0x002EA9 01:AE99:
	.byte $10,$00                   ;- D 1 - - - 0x002EB0 01:AEA0:
	.byte $00,$00,$04,$01,$47,$41   ;- - - - - - 0x002EB2 01:AEA2:
	.byte $44,$46                   ;- D 1 - - - 0x002EB8 01:AEA8:
	.byte $13,$01                   ;- - - - - - 0x002EBA 01:AEAA:
	.byte $0F,$20,$10,$17,$0F,$3B,$2B,$1C,$0F,$32,$22,$12,$0F,$15,$27,$05;- D 1 - - - 0x002EBC 01:AEAC:
	.byte $00,$00,$00,$84,$08,$09,$C5;- D 1 - - - 0x002ECC 01:AEBC:
	.byte $04,$8E,$55,$63,$00       ;- - - - - - 0x002ED3 01:AEC3:
	.byte $21                       ;- D 1 - - - 0x002ED8 01:AEC8:
	.byte $00,$93,$10,$0E,$00,$64,$54;- - - - - - 0x002ED9 01:AEC9:
	.byte $05,$00                   ;- D 1 - - - 0x002EE0 01:AED0:
	.byte $72,$10,$21,$00,$79,$40   ;- - - - - - 0x002EE2 01:AED2:
	.byte $40,$42                   ;- D 1 - - - 0x002EE8 01:AED8:
	.byte $16,$04                   ;- - - - - - 0x002EEA 01:AEDA:
	.res 16, $0F                    ;- D 1 - - - 0x002EEC 01:AEDC: fill 16 bytes
	.byte $00,$00,$00,$00           ;- D 1 - - - 0x002EFC 01:AEEC:
	.byte $C0,$44,$F0,$11,$1D,$10,$2E,$40,$42,$01,$01,$40,$27,$04,$E6,$84;- - - - - - 0x002F00 01:AEF0:
	.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F;- D 1 - I - 0x002F10 01:AF00:
	.byte $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F;- D 1 - I - 0x002F20 01:AF10:
	.byte $20,$21,$21,$21,$21,$21,$21,$21;- D 1 - I - 0x002F30 01:AF20:
	.byte $22,$22,$22,$22,$22,$22   ;- - - - - - 0x002F38 01:AF28:
	.byte $22,$22                   ;- D 1 - I - 0x002F3E 01:AF2E:
	.res 16, $23                    ;- - - - - - 0x002F40 01:AF30: fill 16 bytes
	.byte $24,$24,$25,$26,$27,$28,$29,$2A,$2B,$2B,$2C,$2D,$2E,$2F,$30,$31;- D 1 - I - 0x002F50 01:AF40:
	.byte $32,$32,$33,$34,$35,$36,$37,$38,$39,$39,$3A,$3B,$3C,$3D,$3E,$3F;- D 1 - I - 0x002F60 01:AF50:
	.byte $20,$21,$21,$21,$40,$21,$21,$21,$22,$22,$22,$22,$22,$22,$22,$22;- D 1 - I - 0x002F70 01:AF60:
	.res 16, $23                    ;- - - - - - 0x002F80 01:AF70: fill 16 bytes
	.byte $41,$02,$03,$41,$42,$43,$44,$45,$46,$0A,$0B,$47,$48,$49,$4A,$4B;- D 1 - I - 0x002F90 01:AF80:
	.byte $4C,$4D,$4E,$4F,$14,$50,$51,$52,$53,$54,$55,$56,$1C,$57,$1C,$1D;- D 1 - I - 0x002FA0 01:AF90:
	.byte $21,$20,$21,$21,$21,$21,$21,$21,$22,$22,$22,$22,$22,$22,$22,$22;- D 1 - I - 0x002FB0 01:AFA0:
	.res 16, $23                    ;- - - - - - 0x002FC0 01:AFB0: fill 16 bytes
	.byte $06,$07,$24,$25,$28,$29,$58,$59,$0E,$0F,$2B,$2C,$5A,$5B,$5C,$5D;- D 1 - I - 0x002FD0 01:AFC0:
	.byte $16,$17,$32,$5E,$34,$5F,$60,$61,$1E,$1F,$39,$62,$63,$64,$65,$66;- D 1 - I - 0x002FE0 01:AFD0:
	.byte $21,$21,$20,$21,$21,$21,$21,$21,$22,$22,$22,$22,$22,$22,$22;- D 1 - I - 0x002FF0 01:AFE0:
	.byte $22,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23;- - - - - - 0x002FFF 01:AFEF:
	.byte $23                       ;- - - - - - 0x00300F 01:AFFF:
	.byte $67,$68,$69,$6A,$6B,$6C,$6C,$6D,$6E,$6F,$70,$71,$72,$73,$74,$75;- D 1 - I - 0x003010 01:B000:
	.byte $76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,$80,$81,$81,$82,$83,$84;- D 1 - I - 0x003020 01:B010:
	.byte $85,$86,$87,$87,$87,$87,$87,$87;- D 1 - I - 0x003030 01:B020:
	.res 8, $22                     ;- - - - - - 0x003038 01:B028: fill 8 bytes
	.res 15, $23                    ;- - - - - - 0x003040 01:B030: fill 15 bytes
	.word $8823, $8988, $8A69, $8C8B, $8E8D, $908F, $9170, $9392;W 0x00304F 01:B03F:
	.word $9594, $9796, $9898, $9A99, $829B, $8181, $8481, $8382;W 0x00305F 01:B04F:
	.word $8784                     ;W 0x00306F 01:B05F:
	.byte $87,$87,$86,$87,$87,$87,$87;- D 1 - I - 0x003071 01:B061:
	.res 8, $22                     ;- - - - - - 0x003078 01:B068: fill 8 bytes
	.res 16, $23                    ;- - - - - - 0x003080 01:B070: fill 16 bytes
	.byte $9C,$9D,$88,$88,$6C,$6C,$6C,$6B,$9E,$9F,$A0,$8F,$A1,$A2,$A3,$A4;- D 1 - I - 0x003090 01:B080:
	.byte $9B,$A5,$A6,$96,$A7,$A8,$A9,$AA,$81,$81,$83,$81,$84,$82,$81,$84;- D 1 - I - 0x0030A0 01:B090:
	.byte $87,$87,$87,$87,$87,$87,$86,$87;- D 1 - I - 0x0030B0 01:B0A0:
	.res 8, $22                     ;- - - - - - 0x0030B8 01:B0A8: fill 8 bytes
	.res 16, $23                    ;- - - - - - 0x0030C0 01:B0B0: fill 16 bytes
	.byte $6C,$6C,$AB,$AC,$69,$8A,$8A,$AD,$73,$74,$AE,$90,$70,$91,$91,$AF;- D 1 - I - 0x0030D0 01:B0C0:
	.byte $B0,$B1,$B2,$B3,$B4,$B5,$B5,$B6,$B7,$B8,$B9,$21,$21,$21,$21,$21;- D 1 - I - 0x0030E0 01:B0D0:
	.byte $87,$BA,$BB,$BB,$BB,$BB,$BB,$BB;- D 1 - I - 0x0030F0 01:B0E0:
	.res 8, $22                     ;- - - - - - 0x0030F8 01:B0E8: fill 8 bytes
	.res 16, $23                    ;- - - - - - 0x003100 01:B0F0: fill 16 bytes
	.byte $BC,$BD,$BE,$BF,$BE,$BF,$BE,$BF,$C0,$C1,$C2,$C3,$C2,$C3,$C2,$C3;- D 1 - I - 0x003110 01:B100:
	.byte $C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3;- D 1 - I - 0x003120 01:B110:
	.res 8, $21                     ;- D 1 - I - 0x003130 01:B120: fill 8 bytes
	.res 8, $22                     ;- - - - - - 0x003138 01:B128: fill 8 bytes
	.res 16, $23                    ;- - - - - - 0x003140 01:B130: fill 16 bytes
	.byte $BC,$BD,$D4,$D5,$D6,$D7,$D8,$D9,$C0,$C1,$DA,$DB,$DC,$DD,$DE,$DF;- D 1 - I - 0x003150 01:B140:
	.byte $C8,$C9,$CA,$E0,$E1,$E2,$E3,$E4,$D0,$D1,$E5,$CC,$E6,$E7,$E7,$E8;- D 1 - I - 0x003160 01:B150:
	.res 8, $21                     ;- D 1 - I - 0x003170 01:B160: fill 8 bytes
	.res 8, $22                     ;- D 1 - I - 0x003178 01:B168: fill 8 bytes
	.res 1424, $23                  ;- - - - - - 0x003180 01:B170: fill 1424 bytes
	.byte $CD,$CD,$72,$73,$75,$01,$7D,$02,$01,$01,$02,$03,$01,$01,$02,$02;- D 1 - I - 0x003710 01:B700:
	.byte $01,$01,$06,$07,$2A,$43,$A4,$43,$4C,$36,$37,$36,$36,$36,$36,$36;- D 1 - I - 0x003720 01:B710:
	.byte $74,$74,$CD,$CD,$76,$08,$7E,$10,$0A,$0B,$12,$13,$0C,$0D,$14,$15;- D 1 - I - 0x003730 01:B720:
	.byte $0E,$0F,$16,$17,$2A,$33,$2A,$3B,$34,$34,$3C,$3D,$34,$34,$36,$36;- D 1 - I - 0x003740 01:B730:
	.byte $65,$65,$20,$20,$23,$23,$20,$21,$1A,$1B,$22,$24,$1C,$1D,$20,$25;- D 1 - I - 0x003750 01:B740:
	.byte $1E,$1F,$26,$27,$F8,$F5,$A4,$4B,$44,$45,$4C,$4D,$3E,$3F,$46,$47;- D 1 - I - 0x003760 01:B750:
	.byte $28,$28,$30,$D9,$28,$29,$30,$D9,$78,$2C,$30,$30,$28,$2D,$30,$30;- D 1 - I - 0x003770 01:B760:
	.byte $2E,$2F,$30,$30,$A4,$43,$64,$30,$37,$E0,$30,$30,$4E,$4F,$30,$30;- D 1 - I - 0x003780 01:B770:
	.byte $38,$E1,$31,$31,$38,$38,$31,$31,$2B,$2B;- D 1 - I - 0x003790 01:B780:
	.byte $00,$00,$00,$00,$00,$00   ;- - - - - - 0x00379A 01:B78A:
	.byte $36,$4C,$36,$37,$36,$2A,$36,$A4,$60,$44,$60,$4C,$79,$79,$7A,$7A;- D 1 - I - 0x0037A0 01:B790:
	.byte $7B,$00,$77,$50,$7C,$2A,$7F,$2A,$00,$09,$00,$11,$34,$34,$36,$3C;- D 1 - I - 0x0037B0 01:B7A0:
	.byte $34,$2A,$36,$2A,$60,$52,$5A,$5B,$52,$52,$5B,$5B,$58,$59,$5B,$5B;- D 1 - I - 0x0037C0 01:B7B0:
	.byte $51,$2A,$5B,$A4,$00,$11,$00,$11,$F9,$79,$36,$7A,$45,$F8,$4D,$A4;- D 1 - I - 0x0037D0 01:B7C0:
	.byte $6F,$54,$6E,$57,$54,$F8,$57,$A4,$62,$63,$6A,$6B,$6C,$F8,$6D,$2A;- D 1 - I - 0x0037E0 01:B7D0:
	.byte $23,$19,$5C,$5D,$56,$37,$30,$D9,$E0,$A4,$30,$64,$6E,$55,$30,$D9;- D 1 - I - 0x0037F0 01:B7E0:
	.byte $55,$2A,$D9,$64,$6A,$6B,$30,$30,$6D,$2A,$30,$64,$43,$4D,$30,$30;- D 1 - I - 0x003800 01:B7F0:
	.byte $E1,$38,$31,$31,$01,$01,$09,$02,$01,$75,$02,$7D,$CD,$CD,$CD,$72;- D 1 - I - 0x003810 01:B800:
	.byte $CD,$CD,$73,$CD,$2A,$43,$2A,$43,$11,$08,$19,$10,$11,$08,$11,$10;- D 1 - I - 0x003820 01:B810:
	.byte $0A,$76,$12,$7E,$CD,$74,$65,$65,$74,$CD,$65,$65,$A4,$33,$2A,$3B;- D 1 - I - 0x003830 01:B820:
	.byte $FD,$23,$5D,$5D,$32,$1B,$5F,$AC,$1C,$23,$00,$00,$19,$1D,$24,$25;- D 1 - I - 0x003840 01:B830:
	.byte $18,$D1,$04,$49,$1F,$18,$26,$27,$F8,$F5,$2A,$4B,$4D,$66,$30,$30;- D 1 - I - 0x003850 01:B840:
	.byte $67,$48,$30,$D9,$41,$00,$30,$D9,$2C,$2D,$30,$30,$4A,$4A,$30,$30;- D 1 - I - 0x003860 01:B850:
	.byte $60,$42,$60,$D0,$2A,$60,$2A,$60,$58,$59,$5A,$5B,$51,$2A,$5B,$2A;- D 1 - I - 0x003870 01:B860:
	.byte $60,$D8,$5A,$5B,$A4,$60,$2A,$60,$F9,$F8,$36,$A4,$54,$F8,$57,$2A;- D 1 - I - 0x003880 01:B870:
	.byte $71,$69,$68,$61,$F8,$EC,$2A,$60,$56,$A4,$30,$64,$6E,$55,$30,$30;- D 1 - I - 0x003890 01:B880:
	.byte $55,$A4,$30,$64,$70,$61,$30,$30,$2A,$60,$64,$30,$42,$42,$42,$42;- D 1 - I - 0x0038A0 01:B890:
	.byte $85,$36,$85,$36           ;- D 1 - I - 0x0038B0 01:B8A0:
	.word $8C8C, $97B7              ;W 0x0038B4 01:B8A4:
	.byte $86,$01,$86,$08,$01,$01,$01,$BB,$01,$01,$BB,$BB,$01,$01,$BB,$01;- D 1 - I - 0x0038B8 01:B8A8:
	.byte $42,$42,$81,$82,$85,$36,$83,$A5,$BF,$8D,$94,$94,$86,$10,$A3,$E2;- D 1 - I - 0x0038C8 01:B8B8:
	.byte $08,$B4,$9D,$BC,$B5,$B5,$C0,$C1,$B5,$B5,$C2,$C3,$B6,$02,$BC,$E2;- D 1 - I - 0x0038D8 01:B8C8:
	.byte $89,$8A,$89,$8A,$8B,$B3,$84,$80,$B3,$B3,$BA,$80,$95,$AA,$80,$80;- D 1 - I - 0x0038E8 01:B8D8:
	.byte $AD,$BE,$80,$80,$C8,$C9,$80,$BA,$CA,$CB,$80,$80,$BE,$AA,$80,$80;- D 1 - I - 0x0038F8 01:B8E8:
	.byte $89,$8A,$89,$A2,$9B,$30,$38,$38,$DA,$30,$38,$39,$30,$30,$38,$38;- D 1 - I - 0x003908 01:B8F8:
	.byte $30,$DA,$38,$38,$DA,$30,$38,$38,$30,$30,$38,$39,$A9,$31,$A1,$A1;- D 1 - I - 0x003918 01:B908:
	.byte $31,$31,$9E,$A1,$31,$31,$A1,$A1,$01,$01,$01,$01,$01,$86,$01,$86;- D 1 - I - 0x003928 01:B918:
	.byte $B7,$97,$BF,$8D,$36,$36,$36,$A5,$86,$00,$86,$B2,$90,$91,$98,$99;- D 1 - I - 0x003938 01:B928:
	.byte $02,$03,$9D,$0B,$02,$02,$0C,$0D,$93,$86,$1D,$A3,$94,$94,$F9,$F9;- D 1 - I - 0x003948 01:B938:
	.byte $36,$36,$A5,$A5,$86,$AB,$A3,$A0,$88,$A8,$A7,$A7,$AD,$14,$80,$BA;- D 1 - I - 0x003958 01:B948:
	.byte $14,$D5,$80,$80,$9A,$95,$80,$80,$B3,$B3,$80,$80,$B3,$B3,$80,$BA;- D 1 - I - 0x003968 01:B958:
	.byte $95,$00,$80,$80,$00,$00,$80,$80,$00,$00,$B2,$B2,$86,$87,$86,$8F;- D 1 - I - 0x003978 01:B968:
	.byte $AB,$AB,$A7               ;- D 1 - I - 0x003988 01:B978:
	.word $86A7, $A387              ;W 0x00398B 01:B97B:
	.byte $8E,$08,$03,$10,$0B,$B4,$B5,$BC,$C0,$B5,$B5,$C1,$C2,$B5,$B6,$C3;- D 1 - I - 0x00398F 01:B97F:
	.byte $BC,$01,$B4,$E2,$BC,$95,$96,$80,$80,$00,$12,$BA,$80,$BE,$C8,$80;- D 1 - I - 0x00399F 01:B98F:
	.byte $80,$C9,$CA,$80,$BA,$CB,$BE,$80,$80,$AA,$BE,$80,$80,$01,$01,$BB;- D 1 - I - 0x0039AF 01:B99F:
	.byte $08,$08,$86,$10,$86,$86,$36,$86,$36,$B6,$10,$BC,$E2,$86,$36,$A3;- D 1 - I - 0x0039BF 01:B9AF:
	.byte $A5,$C8,$C9,$80,$AF,$CA,$CB,$AF,$AF,$BE,$AA,$AF,$80,$9A,$05,$B0;- D 1 - I - 0x0039CF 01:B9BF:
	.byte $9C,$AF,$B3,$9F,$B9,$B3,$B3,$B9,$B9,$95,$B3,$B9,$B9,$30,$9F,$38;- D 1 - I - 0x0039DF 01:B9CF:
	.byte $38,$9F,$9F,$AE,$AE,$9F,$B1,$B8,$31,$9C,$9C,$A1,$A1,$A1,$A1,$A1;- D 1 - I - 0x0039EF 01:B9DF:
	.byte $A1,$F2,$F3,$F2,$F3,$F4,$CC,$F4,$CC,$43,$36,$43,$36,$36,$CC,$36;- D 1 - I - 0x0039FF 01:B9EF:
	.byte $CC,$FA,$FB,$D7,$D7,$FC,$CC,$D7,$C4,$43,$56,$D7,$D7,$56,$CC,$D7;- D 1 - I - 0x003A0F 01:B9FF:
	.byte $C4,$23,$DF,$CF,$E7,$DF,$EA,$DE,$CC,$E8,$E9,$F0,$F1,$E9,$EA,$F1;- D 1 - I - 0x003A1F 01:BA0F:
	.byte $CC,$23,$23,$20,$C6,$23,$EA,$20,$CC,$23,$23,$21,$00,$23,$EA,$24;- D 1 - I - 0x003A2F 01:BA1F:
	.byte $CC,$CF,$CF,$30,$30,$E7,$C7,$30,$30,$F0,$F1,$30,$30,$F1,$C7,$30;- D 1 - I - 0x003A3F 01:BA2F:
	.byte $30,$28,$28,$30,$30,$28,$C7,$30,$30,$29,$78,$30,$30,$2C,$C7,$30;- D 1 - I - 0x003A4F 01:BA3F:
	.byte $30,$DE,$00,$DE,$00,$D2,$D3,$00,$DB,$D4,$00,$DC,$DD,$00,$DE,$00;- D 1 - I - 0x003A5F 01:BA4F:
	.byte $E7,$DE,$FE,$DE,$F6,$FF,$CC,$F7,$CC,$DE,$00,$E7,$00,$00,$E3,$00;- D 1 - I - 0x003A6F 01:BA5F:
	.byte $00,$E4,$E5,$00,$D2,$E6,$00,$D3,$F6,$DE,$FE,$F7,$F6,$FF,$CC,$F7;- D 1 - I - 0x003A7F 01:BA6F:
	.byte $C4,$23,$EB,$CF,$CF,$EB,$23,$CF,$F6,$DB,$EE,$F7,$F6,$EF,$EE,$F7;- D 1 - I - 0x003A8F 01:BA7F:
	.byte $F6,$EF,$EA,$F7,$CC,$29,$CF,$30,$30,$CF,$FE,$30,$30,$FF,$FE,$30;- D 1 - I - 0x003A9F 01:BA8F:
	.byte $30,$FF,$C7,$30,$30       ;- D 1 - I - 0x003AAF 01:BA9F:
	.res 28, $00                    ;- - - - - - 0x003AB4 01:BAA4: fill 28 bytes
	.byte $00,$00,$00,$00           ;- D 1 - I - 0x003AD0 01:BAC0:
	.res 8, $00                     ;- - - - - - 0x003AD4 01:BAC4: fill 8 bytes
	.res 8, $00                     ;- D 1 - I - 0x003ADC 01:BACC: fill 8 bytes
	.res 40, $00                    ;- - - - - - 0x003AE4 01:BAD4: fill 40 bytes
	.byte $00,$00,$00,$00,$00,$21,$21,$21,$AB,$55,$29,$29,$C6,$C6,$D8,$CA;- D 1 - I - 0x003B0C 01:BAFC:
	.byte $DC,$D8,$39,$2A,$D7,$D7,$EA,$27,$29,$29,$39,$2A,$E7,$D7,$FA,$37;- D 1 - - - 0x003B1C 01:BB0C:
	.byte $2A,$E6,$E7,$E7,$00,$00,$45,$00,$00,$F6,$9C,$6B,$F5,$F5,$43;- D 1 - - - 0x003B2C 01:BB1C:
	.byte $00                       ;- - - - - - 0x003B3B 01:BB2B:
	.byte $5E,$3E,$6D,$5B,$CF,$21,$FA,$EC,$ED;- D 1 - - - 0x003B3C 01:BB2C:
	.byte $21                       ;- - - - - - 0x003B45 01:BB35:
	.byte $21,$95,$21,$21           ;- D 1 - - - 0x003B46 01:BB36:
	.byte $81                       ;- - - - - - 0x003B4A 01:BB3A:
	.byte $53,$21,$21,$48,$49       ;- D 1 - - - 0x003B4B 01:BB3B:
	.byte $00                       ;- - - - - - 0x003B50 01:BB40:
	.byte $3C,$21,$53,$E8,$21,$68,$6A,$EE,$21,$3F,$53,$F8,$E2,$68,$6A,$00;- D 1 - - - 0x003B51 01:BB41:
	.byte $35,$95                   ;- D 1 - - - 0x003B61 01:BB51:
	.byte $20                       ;- - - - - - 0x003B63 01:BB53:
	.byte $9A,$A9,$21,$BA,$4F,$26,$EC,$ED,$7C,$7C;- D 1 - - - 0x003B64 01:BB54:
	.byte $7C                       ;- - - - - - 0x003B6E 01:BB5E:
	.byte $7D,$53,$A1,$00,$00,$96,$BF,$21,$9D,$A0,$00,$7E,$8F,$00,$8F,$00;- D 1 - - - 0x003B6F 01:BB5F:
	.byte $00,$C0,$00,$30,$32,$50,$66,$64,$4F,$87,$E8,$D4,$4F,$00,$62,$66;- D 1 - - - 0x003B7F 01:BB6F:
	.byte $00,$4C,$21,$21,$2F,$37,$21,$76,$7E,$A4,$21,$35,$37,$21,$85,$00;- D 1 - - - 0x003B8F 01:BB7F:
	.byte $9E,$00,$C1               ;- D 1 - - - 0x003B9F 01:BB8F:
	.byte $D7                       ;- - - - - - 0x003BA2 01:BB92:
	.byte $E4,$52,$40,$9D,$D4,$C0,$C2,$A0,$37,$65,$ED,$C4,$75,$AE,$22,$35;- D 1 - - - 0x003BA3 01:BB93:
	.byte $76,$28,$A6               ;- D 1 - - - 0x003BB3 01:BBA3:
	.byte $D7                       ;- - - - - - 0x003BB6 01:BBA6:
	.byte $AE,$83,$21,$00,$D3,$00,$F8,$21,$55,$4C,$CF,$00,$21,$47,$48,$48;- D 1 - - - 0x003BB7 01:BBA7:
	.byte $E0,$21,$9C,$B5,$21,$57   ;- D 1 - - - 0x003BC7 01:BBB7:
	.byte $31                       ;- - - - - - 0x003BCD 01:BBBD:
	.byte $69,$54,$1E,$78,$67,$E2,$B2;- D 1 - - - 0x003BCE 01:BBBE:
	.byte $A4                       ;- - - - - - 0x003BD5 01:BBC5:
	.byte $A5,$A2,$BB,$E3,$EF,$EE,$A2,$BF;- D 1 - - - 0x003BD6 01:BBC6:
	.byte $53                       ;- - - - - - 0x003BDE 01:BBCE:
	.byte $E0,$56,$E7,$AD,$C1,$00,$31;- D 1 - - - 0x003BDF 01:BBCF:
	.byte $80                       ;- - - - - - 0x003BE6 01:BBD6:
	.byte $B5,$F2,$CF,$2D,$B1,$9B,$00,$A4,$A4,$86,$CC,$EC,$00,$BE,$D2,$00;- D 1 - - - 0x003BE7 01:BBD7:
	.byte $A7,$00,$00,$A2,$E0,$53   ;- D 1 - - - 0x003BF7 01:BBE7:
	.byte $00                       ;- - - - - - 0x003BFD 01:BBED:
	.byte $77,$7F,$60,$61,$4F,$1D,$03,$53,$80,$81,$43,$21,$4F,$26,$35,$00;- D 1 - - - 0x003BFE 01:BBEE:
	.byte $77,$7F,$00,$21,$21,$21,$21,$56,$29,$29,$C7,$C7,$D8,$DB,$D8,$CA;- D 1 - - - 0x003C0E 01:BBFE:
	.byte $2A,$2A,$23,$23,$EB,$DB,$29,$3A,$2A,$3B,$E7,$23,$FB,$38,$3B,$E7;- D 1 - - - 0x003C1E 01:BC0E:
	.byte $2C,$E7,$00,$00,$46,$00,$00,$21,$6B,$6C,$F5,$5D,$44;- D 1 - - - 0x003C2E 01:BC1E:
	.byte $00                       ;- - - - - - 0x003C3B 01:BC2B:
	.byte $F5,$3F,$5B,$5C,$CF,$21,$FB,$ED,$ED;- D 1 - - - 0x003C3C 01:BC2C:
	.byte $21                       ;- - - - - - 0x003C45 01:BC35:
	.byte $21,$95,$21,$21           ;- D 1 - - - 0x003C46 01:BC36:
	.byte $83                       ;- - - - - - 0x003C4A 01:BC3A:
	.byte $21,$21,$21,$49,$4A       ;- D 1 - - - 0x003C4B 01:BC3B:
	.byte $00                       ;- - - - - - 0x003C50 01:BC40:
	.byte $24,$21,$21,$E9,$21,$69,$68,$EF,$21,$3F,$56,$F9,$E3,$69,$68,$00;- D 1 - - - 0x003C51 01:BC41:
	.byte $5F,$95                   ;- D 1 - - - 0x003C61 01:BC51:
	.byte $20                       ;- - - - - - 0x003C63 01:BC53:
	.byte $9A,$AA,$21,$BB,$25,$35,$ED,$ED,$7C,$7C;- D 1 - - - 0x003C64 01:BC54:
	.byte $7C                       ;- - - - - - 0x003C6E 01:BC5E:
	.byte $00,$21,$A1,$00,$00,$97,$BF,$9D,$9E,$A1,$00,$8F,$8F,$00,$AF,$20;- D 1 - - - 0x003C6F 01:BC5F:
	.byte $9A,$A1,$00,$31,$33,$50,$67,$65,$03,$88,$E9,$D5,$00,$5F,$63,$67;- D 1 - - - 0x003C7F 01:BC6F:
	.byte $5F,$24,$21,$2E,$30,$32,$30,$CC,$7F,$A5,$43,$36,$42,$21,$41,$AA;- D 1 - - - 0x003C8F 01:BC7F:
	.byte $9F,$C0,$C2               ;- D 1 - - - 0x003C9F 01:BC8F:
	.byte $C7                       ;- - - - - - 0x003CA2 01:BC92:
	.byte $E5,$52,$3D,$00,$D5,$C1,$00,$A1,$60,$66,$FD,$C5,$FC,$AE,$22,$72;- D 1 - - - 0x003CA3 01:BC93:
	.byte $CC,$AC,$A7               ;- D 1 - - - 0x003CB3 01:BCA3:
	.byte $C7                       ;- - - - - - 0x003CB6 01:BCA6:
	.byte $AE,$84,$90,$DD,$3C,$00,$DE,$21,$56,$8D,$7D,$00,$21,$48,$48,$49;- D 1 - - - 0x003CB7 01:BCA7:
	.byte $E1,$5D,$9C,$24,$21,$4A   ;- D 1 - - - 0x003CC7 01:BCB7:
	.byte $DB                       ;- - - - - - 0x003CCD 01:BCBD:
	.byte $59,$62,$77,$79,$00,$F2,$B3;- D 1 - - - 0x003CCE 01:BCBE:
	.byte $A4                       ;- - - - - - 0x003CD5 01:BCC5:
	.byte $A6,$A3,$BB,$EE,$E3,$EF,$A3,$BF;- D 1 - - - 0x003CD6 01:BCC6:
	.byte $21                       ;- - - - - - 0x003CDE 01:BCCE:
	.byte $E1,$56,$E7,$AE,$C2,$00,$38;- D 1 - - - 0x003CDF 01:BCCF:
	.byte $81                       ;- - - - - - 0x003CE6 01:BCD6:
	.byte $B5,$F2,$CF,$6F,$C3,$BC,$00,$A4,$A4,$86,$21,$ED,$BD,$D1,$D3,$00;- D 1 - - - 0x003CE7 01:BCD7:
	.byte $A8,$00,$00,$A3,$E1,$21   ;- D 1 - - - 0x003CF7 01:BCE7:
	.byte $21                       ;- - - - - - 0x003CFD 01:BCED:
	.byte $7F,$9F,$61,$61,$1C,$08,$5F,$21,$81,$83,$44,$21,$25,$35,$5F,$82;- D 1 - - - 0x003CFE 01:BCEE:
	.byte $7F,$9F,$00,$21,$C8,$C8,$8C,$55,$39,$2A,$D7,$D7,$C9,$DA,$CD,$D9;- D 1 - - - 0x003D0E 01:BCFE:
	.byte $39,$2A,$D6,$D7,$FA,$37,$2A,$3B,$39,$3B,$7B,$D6,$FA,$00,$3B,$F6;- D 1 - - - 0x003D1E 01:BD0E:
	.byte $2B,$2E,$E5,$E5,$00,$00,$4E,$8B,$3D,$4B,$F5,$F5,$43;- D 1 - - - 0x003D2E 01:BD1E:
	.byte $00                       ;- - - - - - 0x003D3B 01:BD2B:
	.byte $5E,$3E,$6D,$5B,$21,$DF,$45,$FC,$FD;- D 1 - - - 0x003D3C 01:BD2C:
	.byte $21                       ;- - - - - - 0x003D45 01:BD35:
	.byte $21,$21,$21,$2B           ;- D 1 - - - 0x003D46 01:BD36:
	.byte $97                       ;- - - - - - 0x003D4A 01:BD3A:
	.byte $53,$54,$57,$58,$5A       ;- D 1 - - - 0x003D4B 01:BD3B:
	.byte $96                       ;- - - - - - 0x003D50 01:BD40:
	.byte $3C,$21,$53,$F8,$56,$68,$7A,$FE,$8C,$3F,$53,$84,$F2,$68,$8A,$01;- D 1 - - - 0x003D51 01:BD41:
	.byte $76,$21                   ;- D 1 - - - 0x003D61 01:BD51:
	.byte $20                       ;- - - - - - 0x003D63 01:BD53:
	.byte $20,$B9,$92,$20,$6E,$76,$FC,$FD,$53,$56;- D 1 - - - 0x003D64 01:BD54:
	.byte $21                       ;- - - - - - 0x003D6E 01:BD5E:
	.byte $8D,$53,$A1,$7E,$8F,$21,$51,$8D,$9D,$B0,$A1,$7E,$8F,$8F,$8F,$00;- D 1 - - - 0x003D6F 01:BD5F:
	.byte $00,$D0,$00,$40,$42,$BF,$70,$74,$4F,$00,$C4,$84,$4F,$00,$72,$00;- D 1 - - - 0x003D7F 01:BD6F:
	.byte $1E,$34,$21,$25,$27,$37,$21,$76,$8E,$B4,$21,$35,$37,$51,$95,$00;- D 1 - - - 0x003D8F 01:BD7F:
	.byte $7E,$00,$D1               ;- D 1 - - - 0x003D9F 01:BD8F:
	.byte $D6                       ;- - - - - - 0x003DA2 01:BD92:
	.byte $F4,$21,$4B,$AD,$B3,$93,$73,$B0,$63,$75,$F8,$C4,$21,$AB,$22,$81;- D 1 - - - 0x003DA3 01:BD93:
	.byte $76,$43,$53               ;- D 1 - - - 0x003DB3 01:BDA3:
	.byte $D7                       ;- - - - - - 0x003DB6 01:BDA6:
	.byte $E9,$BC,$61,$00,$BC,$98,$F8,$BD,$65,$8C,$6D,$C3,$F9,$57,$58,$5B;- D 1 - - - 0x003DB7 01:BDA7:
	.byte $F0,$5C,$21,$B9,$3E,$57   ;- D 1 - - - 0x003DC7 01:BDB7:
	.byte $44                       ;- - - - - - 0x003DCD 01:BDBD:
	.byte $69,$70,$A8,$82,$A2,$00,$B2;- D 1 - - - 0x003DCE 01:BDBE:
	.byte $B4                       ;- - - - - - 0x003DD5 01:BDC5:
	.byte $E5,$D0,$00,$F3,$FF,$FE,$A2,$BF;- D 1 - - - 0x003DD6 01:BDC6:
	.byte $53                       ;- - - - - - 0x003DDE 01:BDCE:
	.byte $F0,$E2,$21,$BD,$D1,$D3,$44;- D 1 - - - 0x003DDF 01:BDCF:
	.byte $77                       ;- - - - - - 0x003DE6 01:BDD6:
	.byte $B6,$86,$B4,$21,$00,$AE,$C2,$A4,$A4,$92,$21,$00,$00,$00,$C3,$BC;- D 1 - - - 0x003DE7 01:BDD7:
	.byte $B7,$60,$61,$A2,$F0,$53   ;- D 1 - - - 0x003DF7 01:BDE7:
	.byte $00                       ;- - - - - - 0x003DFD 01:BDED:
	.byte $36,$CE,$60,$61,$4F,$00,$00,$53,$77,$59,$43,$21,$6E,$76,$76,$90;- D 1 - - - 0x003DFE 01:BDEE:
	.byte $36,$CE,$00,$21,$C8,$CB,$8C,$56,$2A,$2A,$23,$23,$D9,$DB,$C9,$DA;- D 1 - - - 0x003E0E 01:BDFE:
	.byte $2A,$2A,$00,$23,$FB,$22,$2A,$00,$2A,$00,$21,$00,$FB,$38,$00,$F7;- D 1 - - - 0x003E1E 01:BE0E:
	.byte $2D,$2F,$E5,$4D,$00,$00,$E5,$8C,$4B,$4C,$F5,$5D,$44;- D 1 - - - 0x003E2E 01:BE1E:
	.byte $00                       ;- - - - - - 0x003E3B 01:BE2B:
	.byte $F5,$3F,$5B,$5C,$21,$DF,$46,$FD,$FD;- D 1 - - - 0x003E3C 01:BE2C:
	.byte $21                       ;- - - - - - 0x003E45 01:BE35:
	.byte $21,$21,$21,$2C           ;- D 1 - - - 0x003E46 01:BE36:
	.byte $9F                       ;- - - - - - 0x003E4A 01:BE3A:
	.byte $47,$55,$21,$5A,$58       ;- D 1 - - - 0x003E4B 01:BE3B:
	.byte $97                       ;- - - - - - 0x003E50 01:BE40:
	.byte $34,$21,$21,$F9,$56,$79,$68,$FF,$8C,$3F;- D 1 - - - 0x003E51 01:BE41:
	.word $8586, $89F2              ;W 0x003E5B 01:BE4B:
	.byte $68,$01,$6F,$21           ;- D 1 - - - 0x003E5F 01:BE4F:
	.byte $20                       ;- - - - - - 0x003E63 01:BE53:
	.byte $20,$20,$93,$20,$76,$76,$FD,$FD,$21,$56;- D 1 - - - 0x003E64 01:BE54:
	.byte $21                       ;- - - - - - 0x003E6E 01:BE5E:
	.byte $8E,$21,$A1,$8F,$8F,$21,$51,$9D,$8E,$A1,$A1,$8F,$8F,$AF,$AF,$20;- D 1 - - - 0x003E6F 01:BE5F:
	.byte $20,$A1,$D0,$41,$52,$BF,$71,$75,$1C,$00,$C5,$85,$00,$5F,$73,$00;- D 1 - - - 0x003E7F 01:BE6F:
	.byte $5F,$34,$33,$26,$32,$42,$30,$CC,$8F,$BC,$43,$36,$30,$51,$B6,$BA;- D 1 - - - 0x003E8F 01:BE7F:
	.byte $21,$D0,$D2               ;- D 1 - - - 0x003E9F 01:BE8F:
	.byte $00                       ;- - - - - - 0x003EA2 01:BE92:
	.byte $F5,$21,$4D,$00,$50,$94,$74,$B1,$21,$FC,$DE,$C5,$21,$E9,$22,$21;- D 1 - - - 0x003EA3 01:BE93:
	.byte $CC,$44,$6C               ;- D 1 - - - 0x003EB3 01:BEA3:
	.byte $C7                       ;- - - - - - 0x003EB6 01:BEA6:
	.byte $E9,$BC,$DF,$DD,$BC,$99,$DE,$BE,$66,$21,$21,$B2,$F9,$5A,$58,$59;- D 1 - - - 0x003EB7 01:BEA7:
	.byte $F1,$DF,$21,$34,$3F,$4A   ;- D 1 - - - 0x003EC7 01:BEB7:
	.byte $22                       ;- - - - - - 0x003ECD 01:BEBD:
	.byte $59,$91,$A9,$92,$00,$00,$B3;- D 1 - - - 0x003ECE 01:BEBE:
	.byte $B4                       ;- - - - - - 0x003ED5 01:BEC5:
	.byte $E5,$A1,$00,$FE,$F3,$FF,$A3,$BF;- D 1 - - - 0x003ED6 01:BEC6:
	.byte $21                       ;- - - - - - 0x003EDE 01:BECE:
	.byte $F1,$E3,$AB,$BE,$D2,$00,$38;- D 1 - - - 0x003EDF 01:BECF:
	.byte $96                       ;- - - - - - 0x003EE6 01:BED6:
	.byte $B6,$86,$CC,$21,$AD,$C1,$00,$A4,$A4,$93,$21,$F8,$00,$B1,$9B,$00;- D 1 - - - 0x003EE7 01:BED7:
	.byte $B8,$61,$61,$A3,$F1,$21   ;- D 1 - - - 0x003EF7 01:BEE7:
	.byte $21                       ;- - - - - - 0x003EFD 01:BEED:
	.byte $CE,$F3,$61,$61,$00,$00,$5F,$21,$94,$9F,$44,$21,$76,$76,$6F,$91;- D 1 - - - 0x003EFE 01:BEEE:
	.byte $CE,$F3,$00,$02,$02,$02,$03,$00,$00,$00,$31,$00,$32,$32,$32,$32;- D 1 - - - 0x003F0E 01:BEFE:
	.byte $30,$30,$31,$30,$02,$02,$01,$01,$00,$00,$33,$30,$32,$32,$31,$33;- D 1 - - - 0x003F1E 01:BF0E:
	.byte $33,$33,$03,$03,$02,$30,$03,$03,$03,$03,$03,$03,$00,$10,$03,$03;- D 1 - - - 0x003F2E 01:BF1E:
	.byte $03,$03,$20,$20,$32,$01,$01;- D 1 - - - 0x003F3E 01:BF2E:
	.byte $03                       ;- - - - - - 0x003F45 01:BF35:
	.byte $01,$01,$20,$20           ;- D 1 - - - 0x003F46 01:BF36:
	.byte $00                       ;- - - - - - 0x003F4A 01:BF3A:
	.byte $01,$01,$01,$31,$31       ;- D 1 - - - 0x003F4B 01:BF3B:
	.byte $02                       ;- - - - - - 0x003F50 01:BF40:
	.byte $03,$00,$01,$32,$31,$01,$01,$02,$03,$03,$01,$02,$01,$01,$01,$03;- D 1 - - - 0x003F51 01:BF41:
	.byte $03,$00                   ;- D 1 - - - 0x003F61 01:BF51:
	.byte $03                       ;- - - - - - 0x003F63 01:BF53:
	.byte $33,$03,$01,$03,$03,$03,$00,$00,$01,$01;- D 1 - - - 0x003F64 01:BF54:
	.byte $01                       ;- - - - - - 0x003F6E 01:BF5E:
	.byte $01,$00,$02,$33,$33,$20,$30,$01,$01,$02,$32,$03,$03,$33,$03,$03;- D 1 - - - 0x003F6F 01:BF5F:
	.byte $33,$02,$32,$03,$03,$00,$03,$03,$03,$03,$32,$02,$03,$03,$03,$03;- D 1 - - - 0x003F7F 01:BF6F:
	.byte $03,$00,$30,$30,$30,$00,$00,$01,$02,$02,$00,$00,$00,$01,$31,$32;- D 1 - - - 0x003F8F 01:BF7F:
	.byte $02,$02,$02               ;- D 1 - - - 0x003F9F 01:BF8F:
	.byte $01                       ;- - - - - - 0x003FA2 01:BF92:
	.byte $03,$31,$01,$02,$01,$02,$02,$03,$20,$00,$31,$10,$00,$32,$10,$20;- D 1 - - - 0x003FA3 01:BF93:
	.byte $31,$00,$31               ;- D 1 - - - 0x003FB3 01:BFA3:
	.byte $01                       ;- - - - - - 0x003FB6 01:BFA6:
	.byte $32,$02,$20,$01,$02,$02,$01,$00,$00,$20,$20,$02,$01,$03,$03,$03;- D 1 - - - 0x003FB7 01:BFA7:
	.byte $01,$20,$20,$00,$02,$33   ;- D 1 - - - 0x003FC7 01:BFB7:
	.byte $02                       ;- - - - - - 0x003FCD 01:BFBD:
	.byte $03,$31,$32,$32,$32,$33,$00;- D 1 - - - 0x003FCE 01:BFBE:
	.byte $00                       ;- - - - - - 0x003FD5 01:BFC5:
	.byte $03,$00,$02,$00,$00,$00,$00,$00;- D 1 - - - 0x003FD6 01:BFC6:
	.byte $31                       ;- - - - - - 0x003FDE 01:BFCE:
	.byte $00,$00,$33,$02,$02,$02,$02;- D 1 - - - 0x003FDF 01:BFCF:
	.byte $00                       ;- - - - - - 0x003FE6 01:BFD6:
	.byte $00,$00,$20,$20,$32,$02,$02,$01,$31,$01,$20,$31,$02,$02,$02,$02;- D 1 - - - 0x003FE7 01:BFD7:
	.byte $01,$31,$31,$30,$30,$30   ;- D 1 - - - 0x003FF7 01:BFE7:
	.byte $31                       ;- - - - - - 0x003FFD 01:BFED:
	.byte $30,$30,$01,$01,$01,$01,$01,$31,$00,$00,$30,$31,$01,$01,$01,$32;- D 1 - - - 0x003FFE 01:BFEE:
	.byte $00,$00                   ;- D 1 - - - 0x00400E 01:BFFE:
