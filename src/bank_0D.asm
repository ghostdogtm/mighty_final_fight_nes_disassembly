.segment "BANK_0D"
; 0x01A010-0x01C00F  CPU $A000-$BFFF

	.byte $44                       ;C - - - - - 0x01A010 0D:A000: operand of the instruction at 0C:9FFF
	LDA stage                       ;C - - - - - 0x01A011 0D:A001: A5 61
	BNE loc_0D_A00B                 ;C - - - - - 0x01A013 0D:A003: D0 06
	LDA ram_0060                    ;C - - - - - 0x01A015 0D:A005: A5 60
	CMP #$01                        ;C - - - - - 0x01A017 0D:A007: C9 01
	BEQ loc_0D_A017                 ;C - - - - - 0x01A019 0D:A009: F0 0C
loc_0D_A00B:
	LDA stage                       ;C - - - - - 0x01A01B 0D:A00B: A5 61
	CMP #$03                        ;C - - - - - 0x01A01D 0D:A00D: C9 03
	BNE loc_0D_A01B                 ;C - - - - - 0x01A01F 0D:A00F: D0 0A
	LDA ram_0060                    ;C - - - - - 0x01A021 0D:A011: A5 60
	CMP #$01                        ;C - - - - - 0x01A023 0D:A013: C9 01
	BNE loc_0D_A01B                 ;C - - - - - 0x01A025 0D:A015: D0 04
loc_0D_A017:
	LDY #$01                        ;C - - - - - 0x01A027 0D:A017: A0 01
	BNE loc_0D_A02D                 ;C - - - - - 0x01A029 0D:A019: D0 12
loc_0D_A01B:
	LDA stage                       ;C - - - - - 0x01A02B 0D:A01B: A5 61
	CMP #$01                        ;C - - - - - 0x01A02D 0D:A01D: C9 01
	BNE loc_0D_A02B                 ;C - - - - - 0x01A02F 0D:A01F: D0 0A
	LDA ram_0060                    ;C - - - - - 0x01A031 0D:A021: A5 60
	CMP #$01                        ;C - - - - - 0x01A033 0D:A023: C9 01
	BNE loc_0D_A02B                 ;C - - - - - 0x01A035 0D:A025: D0 04
	LDY #$02                        ;C - - - - - 0x01A037 0D:A027: A0 02
	BNE loc_0D_A02D                 ;C - - - - - 0x01A039 0D:A029: D0 02
loc_0D_A02B:
	LDY #$00                        ;C - - - - - 0x01A03B 0D:A02B: A0 00
loc_0D_A02D:
	LDA tbl_0D_A046,Y               ;C - - - - - 0x01A03D 0D:A02D: B9 46 A0
	CMP objY,X                      ;C - - - - - 0x01A040 0D:A030: DD C0 03
	BCC loc_0D_A03A                 ;C - - - - - 0x01A043 0D:A033: 90 05
	ADC #$00                        ;C - - - - - 0x01A045 0D:A035: 69 00
	STA objY,X                      ;C - - - - - 0x01A047 0D:A037: 9D C0 03
loc_0D_A03A:
	LDA tbl_0D_A049,Y               ;C - - - - - 0x01A04A 0D:A03A: B9 49 A0
	CMP objY,X                      ;C - - - - - 0x01A04D 0D:A03D: DD C0 03
	BCS loc_0D_A045                 ;C - - - - - 0x01A050 0D:A040: B0 03
	STA objY,X                      ;c - - - - - 0x01A052 0D:A042: 9D C0 03
loc_0D_A045:
	RTS                             ;C - - - - - 0x01A055 0D:A045: 60
tbl_0D_A046:
	.lobytes tbl_0D_B081-1, ofs_0D_A071-1, tbl_0D_B091-1;- D 1 - - - 0x01A056 0D:A046:
tbl_0D_A049:
	.hibytes tbl_0D_B081-1, ofs_0D_A071-1, tbl_0D_B091-1;- D 1 - - - 0x01A059 0D:A049:
ofs_0D_A04C:
	LDA #$00                        ;C - - J - - 0x01A05C 0D:A04C: A9 00
	STA objArr_05D0,X               ;C - - - - - 0x01A05E 0D:A04E: 9D D0 05
	STA objArr_05E0,X               ;C - - - - - 0x01A061 0D:A051: 9D E0 05
	STA objArr_05F0,X               ;C - - - - - 0x01A064 0D:A054: 9D F0 05
	STA objArr_0540,X               ;C - - - - - 0x01A067 0D:A057: 9D 40 05
	INC objActive,X                 ;C - - - - - 0x01A06A 0D:A05A: FE 00 03
	JMP sub_0D_AAAE                 ;C - - - - - 0x01A06D 0D:A05D: 4C AE AA
ofs_0D_A060:
	LDA objArr_03D0,X               ;C - - J - - 0x01A070 0D:A060: BD D0 03
	BNE loc_0D_A095                 ;C - - - - - 0x01A073 0D:A063: D0 30
	JSR sub_0D_AAD7                 ;C - - - - - 0x01A075 0D:A065: 20 D7 AA
	LDA #$38                        ;C - - - - - 0x01A078 0D:A068: A9 38
	LDY #$18                        ;C - - - - - 0x01A07A 0D:A06A: A0 18
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A07C 0D:A06C: 20 3E FB
	BCS loc_0D_A07A                 ;C - - - - - 0x01A07F 0D:A06F: B0 09
ofs_0D_A071:
	LDA #$18                        ;C - - - - - 0x01A081 0D:A071: A9 18
	LDY #$28                        ;C - - - - - 0x01A083 0D:A073: A0 28
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A085 0D:A075: 20 3E FB
	BCC loc_0D_A085                 ;C - - - - - 0x01A088 0D:A078: 90 0B
loc_0D_A07A:
	INC objActive,X                 ;C - - - - - 0x01A08A 0D:A07A: FE 00 03
	LDA ram_00E4                    ;C - - - - - 0x01A08D 0D:A07D: A5 E4
	AND #$01                        ;C - - - - - 0x01A08F 0D:A07F: 29 01
	STA objArr_05F0,X               ;C - - - - - 0x01A091 0D:A081: 9D F0 05
	RTS                             ;C - - - - - 0x01A094 0D:A084: 60
loc_0D_A085:
	JSR sub_0F_FB5B                 ;C - - - - - 0x01A095 0D:A085: 20 5B FB
loc_0D_A088:
	TAY                             ;C - - - - - 0x01A098 0D:A088: A8
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x01A099 0D:A089: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x01A09C 0D:A08C: 9D 60 04
	JSR sub_0D_AC34                 ;C - - - - - 0x01A09F 0D:A08F: 20 34 AC
	JMP sub_0D_A953                 ;C - - - - - 0x01A0A2 0D:A092: 4C 53 A9
loc_0D_A095:
	JSR FaceToPlayerFlag            ;C - - - - - 0x01A0A5 0D:A095: 20 43 F3
	LDA objArr_03D0,X               ;C - - - - - 0x01A0A8 0D:A098: BD D0 03
	LSR A                           ;C - - - - - 0x01A0AB 0D:A09B: 4A
	BCC loc_0D_A0B7                 ;C - - - - - 0x01A0AC 0D:A09C: 90 19
	LDY #$00                        ;C - - - - - 0x01A0AE 0D:A09E: A0 00
	JSR sub_0D_AC34                 ;C - - - - - 0x01A0B0 0D:A0A0: 20 34 AC
	LDA #$08                        ;C - - - - - 0x01A0B3 0D:A0A3: A9 08
	STA objFacing,X                 ;C - - - - - 0x01A0B5 0D:A0A5: 9D 60 04
	LDY #$01                        ;C - - - - - 0x01A0B8 0D:A0A8: A0 01
	JSR sub_0F_F0F7                 ;C - - - - - 0x01A0BA 0D:A0AA: 20 F7 F0
	BCS loc_0D_A0B7                 ;C - - - - - 0x01A0BD 0D:A0AD: B0 08
	LDA objY,X                      ;C - - - - - 0x01A0BF 0D:A0AF: BD C0 03
	CMP #$88                        ;C - - - - - 0x01A0C2 0D:A0B2: C9 88
	BCC loc_0D_A0E0                 ;C - - - - - 0x01A0C4 0D:A0B4: 90 2A
loc_0D_A0B6:
	RTS                             ;C - - - - - 0x01A0C6 0D:A0B6: 60
loc_0D_A0B7:
	LDY #$04                        ;C - - - - - 0x01A0C7 0D:A0B7: A0 04
	JSR sub_0D_AC34                 ;C - - - - - 0x01A0C9 0D:A0B9: 20 34 AC
	LDA objFacing,X                 ;C - - - - - 0x01A0CC 0D:A0BC: BD 60 04
	AND #$01                        ;C - - - - - 0x01A0CF 0D:A0BF: 29 01
	BEQ loc_0D_A0D2                 ;C - - - - - 0x01A0D1 0D:A0C1: F0 0F
	JSR ApplyVelXAdd                ;C - - - - - 0x01A0D3 0D:A0C3: 20 83 F1
	LDY #$07                        ;C - - - - - 0x01A0D6 0D:A0C6: A0 07
	JSR sub_0F_ECCF                 ;C - - - - - 0x01A0D8 0D:A0C8: 20 CF EC
	LDA ram_0010                    ;C - - - - - 0x01A0DB 0D:A0CB: A5 10
	AND #$40                        ;C - - - - - 0x01A0DD 0D:A0CD: 29 40
	BEQ loc_0D_A0E0                 ;C - - - - - 0x01A0DF 0D:A0CF: F0 0F
	RTS                             ;C - - - - - 0x01A0E1 0D:A0D1: 60
loc_0D_A0D2:
	JSR ApplyVelXSub                ;C - - - - - 0x01A0E2 0D:A0D2: 20 A1 F1
	LDY #$08                        ;C - - - - - 0x01A0E5 0D:A0D5: A0 08
	JSR sub_0F_ECCF                 ;C - - - - - 0x01A0E7 0D:A0D7: 20 CF EC
	LDA ram_0010                    ;C - - - - - 0x01A0EA 0D:A0DA: A5 10
	AND #$40                        ;C - - - - - 0x01A0EC 0D:A0DC: 29 40
	BNE loc_0D_A0B6                 ;C - - - - - 0x01A0EE 0D:A0DE: D0 D6
loc_0D_A0E0:
	LDA #$00                        ;C - - - - - 0x01A0F0 0D:A0E0: A9 00
	STA objArr_03D0,X               ;C - - - - - 0x01A0F2 0D:A0E2: 9D D0 03
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A0F5 0D:A0E5: 4C E8 A8
ofs_0D_A0E8:
	DEC objArr_05D0,X               ;C - - J - - 0x01A0F8 0D:A0E8: DE D0 05
	BMI loc_0D_A0F0                 ;C - - - - - 0x01A0FB 0D:A0EB: 30 03
	JMP loc_0D_A18B                 ;C - - - - - 0x01A0FD 0D:A0ED: 4C 8B A1
loc_0D_A0F0:
	JSR sub_0F_FB5B                 ;C - - - - - 0x01A100 0D:A0F0: 20 5B FB
	TAY                             ;C - - - - - 0x01A103 0D:A0F3: A8
	LDA objArr_05F0,X               ;C - - - - - 0x01A104 0D:A0F4: BD F0 05
	BNE loc_0D_A0FF                 ;C - - - - - 0x01A107 0D:A0F7: D0 06
	LDA tbl_0D_AD66,Y               ;C - - - - - 0x01A109 0D:A0F9: B9 66 AD
	JMP loc_0D_A102                 ;C - - - - - 0x01A10C 0D:A0FC: 4C 02 A1
loc_0D_A0FF:
	LDA tbl_0D_AD76,Y               ;C - - - - - 0x01A10F 0D:A0FF: B9 76 AD
loc_0D_A102:
	STA objArr_0500,X               ;C - - - - - 0x01A112 0D:A102: 9D 00 05
	AND #$F0                        ;C - - - - - 0x01A115 0D:A105: 29 F0
	BEQ loc_0D_A176                 ;C - - - - - 0x01A117 0D:A107: F0 6D
	LDA objSpriteDown,X             ;C - - - - - 0x01A119 0D:A109: BD B0 05
	ASL A                           ;C - - - - - 0x01A11C 0D:A10C: 0A
	ASL A                           ;C - - - - - 0x01A11D 0D:A10D: 0A
	ASL A                           ;C - - - - - 0x01A11E 0D:A10E: 0A
	STA ptr_00                      ;C - - - - - 0x01A11F 0D:A10F: 85 00
	LDA ram_00E4                    ;C - - - - - 0x01A121 0D:A111: A5 E4
	AND #$07                        ;C - - - - - 0x01A123 0D:A113: 29 07
	CLC                             ;C - - - - - 0x01A125 0D:A115: 18
	ADC ptr_00                      ;C - - - - - 0x01A126 0D:A116: 65 00
	TAY                             ;C - - - - - 0x01A128 0D:A118: A8
	LDA tbl_0D_ADFC,Y               ;C - - - - - 0x01A129 0D:A119: B9 FC AD
	BEQ loc_0D_A162                 ;C - - - - - 0x01A12C 0D:A11C: F0 44
	LSR A                           ;C - - - - - 0x01A12E 0D:A11E: 4A
	LSR A                           ;C - - - - - 0x01A12F 0D:A11F: 4A
	LSR A                           ;C - - - - - 0x01A130 0D:A120: 4A
	LSR A                           ;C - - - - - 0x01A131 0D:A121: 4A
	CMP #$01                        ;C - - - - - 0x01A132 0D:A122: C9 01
	BEQ loc_0D_A139                 ;C - - - - - 0x01A134 0D:A124: F0 13
	TAY                             ;C - - - - - 0x01A136 0D:A126: A8
	LDA tbl_0D_A133,Y               ;C - - - - - 0x01A137 0D:A127: B9 33 A1
	STA objActive,X                 ;C - - - - - 0x01A13A 0D:A12A: 9D 00 03
	LDA #$00                        ;C - - - - - 0x01A13D 0D:A12D: A9 00
	STA objArr_0500,X               ;C - - - - - 0x01A13F 0D:A12F: 9D 00 05
	RTS                             ;C - - - - - 0x01A142 0D:A132: 60
tbl_0D_A133:
	.byte $84,$84                   ;- - - - - - 0x01A143 0D:A133:
	.byte $86,$8B,$8A,$8E           ;- D 1 - - - 0x01A145 0D:A135:
loc_0D_A139:
	LDY objSpriteDown,X             ;C - - - - - 0x01A149 0D:A139: BC B0 05
	LDA ram_00E5                    ;C - - - - - 0x01A14C 0D:A13C: A5 E5
	AND #$0F                        ;C - - - - - 0x01A14E 0D:A13E: 29 0F
	CMP tbl_0D_AE32,Y               ;C - - - - - 0x01A150 0D:A140: D9 32 AE
	BCS loc_0D_A14A                 ;C - - - - - 0x01A153 0D:A143: B0 05
	LDA tbl_0D_AE38,Y               ;C - - - - - 0x01A155 0D:A145: B9 38 AE
	BNE loc_0D_A14C                 ;C - - - - - 0x01A158 0D:A148: D0 02
loc_0D_A14A:
	LDA #$00                        ;C - - - - - 0x01A15A 0D:A14A: A9 00
loc_0D_A14C:
	STA objArr_05D0,X               ;C - - - - - 0x01A15C 0D:A14C: 9D D0 05
	LDA objKind,X                   ;C - - - - - 0x01A15F 0D:A14F: BD 20 03
	SEC                             ;C - - - - - 0x01A162 0D:A152: 38
	SBC #$20                        ;C - - - - - 0x01A163 0D:A153: E9 20
	TAY                             ;C - - - - - 0x01A165 0D:A155: A8
	LDA tbl_0D_A3DF,Y               ;C - - - - - 0x01A166 0D:A156: B9 DF A3
	STA objArr_05E0,X               ;C - - - - - 0x01A169 0D:A159: 9D E0 05
	LDA #$84                        ;C - - - - - 0x01A16C 0D:A15C: A9 84
	STA objActive,X                 ;C - - - - - 0x01A16E 0D:A15E: 9D 00 03
	RTS                             ;C - - - - - 0x01A171 0D:A161: 60
loc_0D_A162:
	LDA objArr_0500,X               ;C - - - - - 0x01A172 0D:A162: BD 00 05
	AND #$30                        ;C - - - - - 0x01A175 0D:A165: 29 30
	BEQ loc_0D_A176                 ;C - - - - - 0x01A177 0D:A167: F0 0D
	LDA #$40                        ;C - - - - - 0x01A179 0D:A169: A9 40
	LDY #$F0                        ;C - - - - - 0x01A17B 0D:A16B: A0 F0
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A17D 0D:A16D: 20 3E FB
	BCS loc_0D_A176                 ;C - - - - - 0x01A180 0D:A170: B0 04
	DEC objActive,X                 ;C - - - - - 0x01A182 0D:A172: DE 00 03
	RTS                             ;C - - - - - 0x01A185 0D:A175: 60
loc_0D_A176:
	LDA objArr_0500,X               ;C - - - - - 0x01A186 0D:A176: BD 00 05
	AND #$0F                        ;C - - - - - 0x01A189 0D:A179: 29 0F
	TAY                             ;C - - - - - 0x01A18B 0D:A17B: A8
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x01A18C 0D:A17C: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x01A18F 0D:A17F: 9D 60 04
	JSR sub_0D_AC34                 ;C - - - - - 0x01A192 0D:A182: 20 34 AC
	JSR sub_0D_ACB3                 ;C - - - - - 0x01A195 0D:A185: 20 B3 AC
	STA objArr_05D0,X               ;C - - - - - 0x01A198 0D:A188: 9D D0 05
loc_0D_A18B:
	JMP sub_0D_A953                 ;C - - - - - 0x01A19B 0D:A18B: 4C 53 A9
ofs_0D_A18E:
	LDA objArr_0500,X               ;C - - J - - 0x01A19E 0D:A18E: BD 00 05
	CMP #$01                        ;C - - - - - 0x01A1A1 0D:A191: C9 01
	BEQ loc_0D_A1C2                 ;C - - - - - 0x01A1A3 0D:A193: F0 2D
	CMP #$02                        ;C - - - - - 0x01A1A5 0D:A195: C9 02
	BEQ loc_0D_A1EF                 ;C - - - - - 0x01A1A7 0D:A197: F0 56
	JSR sub_0D_AAAE                 ;C - - - - - 0x01A1A9 0D:A199: 20 AE AA
	LDA objFlags,X                  ;C - - - - - 0x01A1AC 0D:A19C: BD 60 05
	AND #$40                        ;C - - - - - 0x01A1AF 0D:A19F: 29 40
	BNE loc_0D_A1A7                 ;C - - - - - 0x01A1B1 0D:A1A1: D0 04
	LDA #$01                        ;C - - - - - 0x01A1B3 0D:A1A3: A9 01
	BNE loc_0D_A1A9                 ;C - - - - - 0x01A1B5 0D:A1A5: D0 02
loc_0D_A1A7:
	LDA #$02                        ;C - - - - - 0x01A1B7 0D:A1A7: A9 02
loc_0D_A1A9:
	STA objFacing,X                 ;C - - - - - 0x01A1B9 0D:A1A9: 9D 60 04
	LDA #$02                        ;C - - - - - 0x01A1BC 0D:A1AC: A9 02
	STA objVelXHi,X                 ;C - - - - - 0x01A1BE 0D:A1AE: 9D 10 04
	LDA #$E0                        ;C - - - - - 0x01A1C1 0D:A1B1: A9 E0
	STA objVelXLo,X                 ;C - - - - - 0x01A1C3 0D:A1B3: 9D 00 04
	LDA #$00                        ;C - - - - - 0x01A1C6 0D:A1B6: A9 00
	STA objVelYHi,X                 ;C - - - - - 0x01A1C8 0D:A1B8: 9D 30 04
	STA objVelYLo,X                 ;C - - - - - 0x01A1CB 0D:A1BB: 9D 20 04
	INC objArr_0500,X               ;C - - - - - 0x01A1CE 0D:A1BE: FE 00 05
	RTS                             ;C - - - - - 0x01A1D1 0D:A1C1: 60
loc_0D_A1C2:
	LDA #$9D                        ;C - - - - - 0x01A1D2 0D:A1C2: A9 9D
	LDY #$3D                        ;C - - - - - 0x01A1D4 0D:A1C4: A0 3D
	JSR SetAnimXChr4                ;C - - - - - 0x01A1D6 0D:A1C6: 20 49 F4
	JSR sub_0D_A9F6                 ;C - - - - - 0x01A1D9 0D:A1C9: 20 F6 A9
	BCC loc_0D_A1D4                 ;C - - - - - 0x01A1DC 0D:A1CC: 90 06
	LDA #$00                        ;c - - - - - 0x01A1DE 0D:A1CE: A9 00
	STA objArr_03D0,X               ;c - - - - - 0x01A1E0 0D:A1D0: 9D D0 03
	RTS                             ;c - - - - - 0x01A1E3 0D:A1D3: 60
loc_0D_A1D4:
	DEC objArr_05D0,X               ;C - - - - - 0x01A1E4 0D:A1D4: DE D0 05
	BEQ loc_0D_A1E6                 ;C - - - - - 0x01A1E7 0D:A1D7: F0 0D
	LDA objFacing,X                 ;C - - - - - 0x01A1E9 0D:A1D9: BD 60 04
	AND #$01                        ;C - - - - - 0x01A1EC 0D:A1DC: 29 01
	BEQ loc_0D_A1E3                 ;C - - - - - 0x01A1EE 0D:A1DE: F0 03
	JMP ApplyVelXAdd                ;C - - - - - 0x01A1F0 0D:A1E0: 4C 83 F1
loc_0D_A1E3:
	JMP ApplyVelXSub                ;C - - - - - 0x01A1F3 0D:A1E3: 4C A1 F1
loc_0D_A1E6:
	LDA #$20                        ;C - - - - - 0x01A1F6 0D:A1E6: A9 20
	STA objArr_05D0,X               ;C - - - - - 0x01A1F8 0D:A1E8: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x01A1FB 0D:A1EB: FE 00 05
loc_0D_A1EE:
	RTS                             ;C - - - - - 0x01A1FE 0D:A1EE: 60
loc_0D_A1EF:
	DEC objArr_05D0,X               ;C - - - - - 0x01A1FF 0D:A1EF: DE D0 05
	BNE loc_0D_A1EE                 ;C - - - - - 0x01A202 0D:A1F2: D0 FA
	LDA ram_00E4                    ;C - - - - - 0x01A204 0D:A1F4: A5 E4
	LSR A                           ;C - - - - - 0x01A206 0D:A1F6: 4A
	BCC loc_0D_A1FD                 ;C - - - - - 0x01A207 0D:A1F7: 90 04
	LDA #$84                        ;C - - - - - 0x01A209 0D:A1F9: A9 84
	BNE loc_0D_A1FF                 ;C - - - - - 0x01A20B 0D:A1FB: D0 02
loc_0D_A1FD:
	LDA #$81                        ;C - - - - - 0x01A20D 0D:A1FD: A9 81
loc_0D_A1FF:
	STA objActive,X                 ;C - - - - - 0x01A20F 0D:A1FF: 9D 00 03
	LDA #$00                        ;C - - - - - 0x01A212 0D:A202: A9 00
	STA objArr_0500,X               ;C - - - - - 0x01A214 0D:A204: 9D 00 05
	STA objVelXLo,X                 ;C - - - - - 0x01A217 0D:A207: 9D 00 04
	STA objVelXHi,X                 ;C - - - - - 0x01A21A 0D:A20A: 9D 10 04
	JMP sub_0D_AA1D                 ;C - - - - - 0x01A21D 0D:A20D: 4C 1D AA
ofs_0D_A210:
	JSR sub_0D_A9EB                 ;C - - J - - 0x01A220 0D:A210: 20 EB A9
	LDA objArr_05D0,X               ;C - - - - - 0x01A223 0D:A213: BD D0 05
	BEQ loc_0D_A21B                 ;C - - - - - 0x01A226 0D:A216: F0 03
	JMP loc_0D_A2A6                 ;C - - - - - 0x01A228 0D:A218: 4C A6 A2
loc_0D_A21B:
	LDY objSpriteDown,X             ;C - - - - - 0x01A22B 0D:A21B: BC B0 05
	LDA tbl_0D_A3A7,Y               ;C - - - - - 0x01A22E 0D:A21E: B9 A7 A3
	STA ptr_00                      ;C - - - - - 0x01A231 0D:A221: 85 00
	LDA tbl_0D_A3AD,Y               ;C - - - - - 0x01A233 0D:A223: B9 AD A3
	TAY                             ;C - - - - - 0x01A236 0D:A226: A8
	LDA ptr_00                      ;C - - - - - 0x01A237 0D:A227: A5 00
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A239 0D:A229: 20 3E FB
	BCS loc_0D_A23C                 ;C - - - - - 0x01A23C 0D:A22C: B0 0E
	DEC objArr_05E0,X               ;C - - - - - 0x01A23E 0D:A22E: DE E0 05
	BEQ loc_0D_A239                 ;C - - - - - 0x01A241 0D:A231: F0 06
	JSR sub_0F_FB72                 ;C - - - - - 0x01A243 0D:A233: 20 72 FB
	JMP loc_0D_A088                 ;C - - - - - 0x01A246 0D:A236: 4C 88 A0
loc_0D_A239:
	JMP loc_0D_A8E4                 ;C - - - - - 0x01A249 0D:A239: 4C E4 A8
loc_0D_A23C:
	LDY objSpriteDown,X             ;C - - - - - 0x01A24C 0D:A23C: BC B0 05
	CPY #$03                        ;C - - - - - 0x01A24F 0D:A23F: C0 03
	BNE loc_0D_A24C                 ;C - - - - - 0x01A251 0D:A241: D0 09
	LDA gameAction                  ;C - - - - - 0x01A253 0D:A243: A5 30
	CMP #$01                        ;C - - - - - 0x01A255 0D:A245: C9 01
	BNE loc_0D_A24C                 ;C - - - - - 0x01A257 0D:A247: D0 03
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A259 0D:A249: 4C E8 A8
loc_0D_A24C:
	LDA ram_00E4                    ;C - - - - - 0x01A25C 0D:A24C: A5 E4
	AND #$0F                        ;C - - - - - 0x01A25E 0D:A24E: 29 0F
	CMP tbl_0D_A2BD,Y               ;C - - - - - 0x01A260 0D:A250: D9 BD A2
	BCC loc_0D_A2B2                 ;C - - - - - 0x01A263 0D:A253: 90 5D
	LDA #$00                        ;C - - - - - 0x01A265 0D:A255: A9 00
	STA objArr_05E0,X               ;C - - - - - 0x01A267 0D:A257: 9D E0 05
	LDY objSpriteDown,X             ;C - - - - - 0x01A26A 0D:A25A: BC B0 05
	LDA tbl_0D_A2AC,Y               ;C - - - - - 0x01A26D 0D:A25D: B9 AC A2
	BEQ loc_0D_A267                 ;C - - - - - 0x01A270 0D:A260: F0 05
	STA objArr_05E0,X               ;C - - - - - 0x01A272 0D:A262: 9D E0 05
	BNE loc_0D_A290                 ;C - - - - - 0x01A275 0D:A265: D0 29
loc_0D_A267:
	LDA objSpriteDown,X             ;C - - - - - 0x01A277 0D:A267: BD B0 05
	BEQ loc_0D_A26E                 ;C - - - - - 0x01A27A 0D:A26A: F0 02
	LDA #$03                        ;C - - - - - 0x01A27C 0D:A26C: A9 03
loc_0D_A26E:
	STA ptr_00                      ;C - - - - - 0x01A27E 0D:A26E: 85 00
	LDY objArr_05C0,X               ;C - - - - - 0x01A280 0D:A270: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - 0x01A283 0D:A273: B9 97 A8
	CLC                             ;C - - - - - 0x01A286 0D:A276: 18
	ADC ptr_00                      ;C - - - - - 0x01A287 0D:A277: 65 00
	TAY                             ;C - - - - - 0x01A289 0D:A279: A8
	LDA tbl_0D_AE2C,Y               ;C - - - - - 0x01A28A 0D:A27A: B9 2C AE
	STA ptr_00                      ;C - - - - - 0x01A28D 0D:A27D: 85 00
	LDA ram_00E4                    ;C - - - - - 0x01A28F 0D:A27F: A5 E4
	AND #$0F                        ;C - - - - - 0x01A291 0D:A281: 29 0F
	CMP ptr_00                      ;C - - - - - 0x01A293 0D:A283: C5 00
	BCC loc_0D_A28D                 ;C - - - - - 0x01A295 0D:A285: 90 06
	INC objArr_05E0,X               ;C - - - - - 0x01A297 0D:A287: FE E0 05
	INC objArr_05E0,X               ;C - - - - - 0x01A29A 0D:A28A: FE E0 05
loc_0D_A28D:
	INC objArr_05E0,X               ;C - - - - - 0x01A29D 0D:A28D: FE E0 05
loc_0D_A290:
	LDA #$00                        ;C - - - - - 0x01A2A0 0D:A290: A9 00
	STA objArr_05D0,X               ;C - - - - - 0x01A2A2 0D:A292: 9D D0 05
	JSR FaceToPlayerFlag            ;C - - - - - 0x01A2A5 0D:A295: 20 43 F3
	LDA #$FF                        ;C - - - - - 0x01A2A8 0D:A298: A9 FF
	STA objArr_0540,X               ;C - - - - - 0x01A2AA 0D:A29A: 9D 40 05
	STA objArr_0530,X               ;C - - - - - 0x01A2AD 0D:A29D: 9D 30 05
	LDA #$85                        ;C - - - - - 0x01A2B0 0D:A2A0: A9 85
	STA objActive,X                 ;C - - - - - 0x01A2B2 0D:A2A2: 9D 00 03
	RTS                             ;C - - - - - 0x01A2B5 0D:A2A5: 60
loc_0D_A2A6:
	DEC objArr_05D0,X               ;C - - - - - 0x01A2B6 0D:A2A6: DE D0 05
	JMP sub_0D_AAAE                 ;C - - - - - 0x01A2B9 0D:A2A9: 4C AE AA
tbl_0D_A2AC:
	.byte $03,$01,$00,$01,$01,$00   ;- D 1 - - - 0x01A2BC 0D:A2AC:
loc_0D_A2B2:
	LDA #$1E                        ;C - - - - - 0x01A2C2 0D:A2B2: A9 1E
	STA objArr_05D0,X               ;C - - - - - 0x01A2C4 0D:A2B4: 9D D0 05
	LDA #$87                        ;C - - - - - 0x01A2C7 0D:A2B7: A9 87
	STA objActive,X                 ;C - - - - - 0x01A2C9 0D:A2B9: 9D 00 03
	RTS                             ;C - - - - - 0x01A2CC 0D:A2BC: 60
tbl_0D_A2BD:
	.byte $04,$04,$06,$04,$09,$08   ;- D 1 - - - 0x01A2CD 0D:A2BD:
ofs_0D_A2C3:
	LDA objArr_05D0,X               ;C - - J - - 0x01A2D3 0D:A2C3: BD D0 05
	BEQ loc_0D_A2CE                 ;C - - - - - 0x01A2D6 0D:A2C6: F0 06
	DEC objArr_05D0,X               ;C - - - - - 0x01A2D8 0D:A2C8: DE D0 05
	JMP sub_0D_AAAE                 ;C - - - - - 0x01A2DB 0D:A2CB: 4C AE AA
loc_0D_A2CE:
	JSR sub_0D_AB00                 ;C - - - - - 0x01A2DE 0D:A2CE: 20 00 AB
	LDA objSpriteDown,X             ;C - - - - - 0x01A2E1 0D:A2D1: BD B0 05
	CMP #$05                        ;C - - - - - 0x01A2E4 0D:A2D4: C9 05
	BNE loc_0D_A2E6                 ;C - - - - - 0x01A2E6 0D:A2D6: D0 0E
	LDA objAnimFrame,X              ;C - - - - - 0x01A2E8 0D:A2D8: BD 70 05
	CMP #$06                        ;C - - - - - 0x01A2EB 0D:A2DB: C9 06
	BNE loc_0D_A2F7                 ;C - - - - - 0x01A2ED 0D:A2DD: D0 18
	LDA objAnimFlags,X              ;C - - - - - 0x01A2EF 0D:A2DF: BD 90 05
	BNE loc_0D_A2F7                 ;C - - - - - 0x01A2F2 0D:A2E2: D0 13
	BEQ loc_0D_A34D                 ;C - - - - - 0x01A2F4 0D:A2E4: F0 67
loc_0D_A2E6:
	LDA objAnimFlags,X              ;C - - - - - 0x01A2F6 0D:A2E6: BD 90 05
	ORA objAnimFrame,X              ;C - - - - - 0x01A2F9 0D:A2E9: 1D 70 05
	BNE loc_0D_A2F7                 ;C - - - - - 0x01A2FC 0D:A2EC: D0 09
	LDA objArr_0540,X               ;C - - - - - 0x01A2FE 0D:A2EE: BD 40 05
	BEQ loc_0D_A34D                 ;C - - - - - 0x01A301 0D:A2F1: F0 5A
	INC objArr_0540,X               ;C - - - - - 0x01A303 0D:A2F3: FE 40 05
	RTS                             ;C - - - - - 0x01A306 0D:A2F6: 60
loc_0D_A2F7:
	LDA objAnimFlags,X              ;C - - - - - 0x01A307 0D:A2F7: BD 90 05
	CMP #$01                        ;C - - - - - 0x01A30A 0D:A2FA: C9 01
	BNE loc_0D_A309                 ;C - - - - - 0x01A30C 0D:A2FC: D0 0B
	LDY objSpriteDown,X             ;C - - - - - 0x01A30E 0D:A2FE: BC B0 05
	LDA tbl_0D_A3A1,Y               ;C - - - - - 0x01A311 0D:A301: B9 A1 A3
	CMP objAnimFrame,X              ;C - - - - - 0x01A314 0D:A304: DD 70 05
	BEQ loc_0D_A324                 ;C - - - - - 0x01A317 0D:A307: F0 1B
loc_0D_A309:
	LDA objArr_04D0,X               ;C - - - - - 0x01A319 0D:A309: BD D0 04
	BEQ loc_0D_A323                 ;C - - - - - 0x01A31C 0D:A30C: F0 15
	LDA objSpriteDown,X             ;C - - - - - 0x01A31E 0D:A30E: BD B0 05
	CMP #$04                        ;C - - - - - 0x01A321 0D:A311: C9 04
	BNE loc_0D_A319                 ;C - - - - - 0x01A323 0D:A313: D0 04
	LDA #$1F                        ;C - - - - - 0x01A325 0D:A315: A9 1F
	BNE loc_0D_A31B                 ;C - - - - - 0x01A327 0D:A317: D0 02
loc_0D_A319:
	LDA #$18                        ;C - - - - - 0x01A329 0D:A319: A9 18
loc_0D_A31B:
	JSR QueueSound                  ;C - - - - - 0x01A32B 0D:A31B: 20 4C F3
	LDA #$00                        ;C - - - - - 0x01A32E 0D:A31E: A9 00
	STA objArr_04D0,X               ;C - - - - - 0x01A330 0D:A320: 9D D0 04
loc_0D_A323:
	RTS                             ;C - - - - - 0x01A333 0D:A323: 60
loc_0D_A324:
	LDA objKind,X                   ;C - - - - - 0x01A334 0D:A324: BD 20 03
	SEC                             ;C - - - - - 0x01A337 0D:A327: 38
	SBC #$20                        ;C - - - - - 0x01A338 0D:A328: E9 20
	TAY                             ;C - - - - - 0x01A33A 0D:A32A: A8
	LDA objSpriteDown,X             ;C - - - - - 0x01A33B 0D:A32B: BD B0 05
	CMP #$03                        ;C - - - - - 0x01A33E 0D:A32E: C9 03
	BEQ loc_0D_A337                 ;C - - - - - 0x01A340 0D:A330: F0 05
	LDA objArr_0530,X               ;C - - - - - 0x01A342 0D:A332: BD 30 05
	BNE loc_0D_A33D                 ;C - - - - - 0x01A345 0D:A335: D0 06
loc_0D_A337:
	LDA tbl_0D_A3C9,Y               ;C - - - - - 0x01A347 0D:A337: B9 C9 A3
	JMP loc_0D_A340                 ;C - - - - - 0x01A34A 0D:A33A: 4C 40 A3
loc_0D_A33D:
	LDA tbl_0D_A3B3,Y               ;C - - - - - 0x01A34D 0D:A33D: B9 B3 A3
loc_0D_A340:
	STA objArr_0450,X               ;C - - - - - 0x01A350 0D:A340: 9D 50 04
	LDA objSpriteDown,X             ;C - - - - - 0x01A353 0D:A343: BD B0 05
	CLC                             ;C - - - - - 0x01A356 0D:A346: 18
	ADC #$80                        ;C - - - - - 0x01A357 0D:A347: 69 80
	STA objArr_0440,X               ;C - - - - - 0x01A359 0D:A349: 9D 40 04
	RTS                             ;C - - - - - 0x01A35C 0D:A34C: 60
loc_0D_A34D:
	DEC objArr_05E0,X               ;C - - - - - 0x01A35D 0D:A34D: DE E0 05
	BNE loc_0D_A365                 ;C - - - - - 0x01A360 0D:A350: D0 13
	LDA #$00                        ;C - - - - - 0x01A362 0D:A352: A9 00
	STA objArr_0530,X               ;C - - - - - 0x01A364 0D:A354: 9D 30 05
	STA objArr_0540,X               ;C - - - - - 0x01A367 0D:A357: 9D 40 05
	LDA #$0F                        ;C - - - - - 0x01A36A 0D:A35A: A9 0F
	STA objArr_05D0,X               ;C - - - - - 0x01A36C 0D:A35C: 9D D0 05
	LDA #$87                        ;C - - - - - 0x01A36F 0D:A35F: A9 87
	STA objActive,X                 ;C - - - - - 0x01A371 0D:A361: 9D 00 03
	RTS                             ;C - - - - - 0x01A374 0D:A364: 60
loc_0D_A365:
	LDY objSpriteDown,X             ;C - - - - - 0x01A375 0D:A365: BC B0 05
	LDA tbl_0D_A3A7,Y               ;C - - - - - 0x01A378 0D:A368: B9 A7 A3
	STA ptr_00                      ;C - - - - - 0x01A37B 0D:A36B: 85 00
	LDA tbl_0D_A3AD,Y               ;C - - - - - 0x01A37D 0D:A36D: B9 AD A3
	TAY                             ;C - - - - - 0x01A380 0D:A370: A8
	LDA ptr_00                      ;C - - - - - 0x01A381 0D:A371: A5 00
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A383 0D:A373: 20 3E FB
	BCS loc_0D_A383                 ;C - - - - - 0x01A386 0D:A376: B0 0B
loc_0D_A378:
	LDA #$00                        ;C - - - - - 0x01A388 0D:A378: A9 00
	STA objArr_0530,X               ;C - - - - - 0x01A38A 0D:A37A: 9D 30 05
	STA objArr_0540,X               ;C - - - - - 0x01A38D 0D:A37D: 9D 40 05
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A390 0D:A380: 4C E8 A8
loc_0D_A383:
	LDA gameAction                  ;C - - - - - 0x01A393 0D:A383: A5 30
	CMP #$06                        ;C - - - - - 0x01A395 0D:A385: C9 06
	BEQ loc_0D_A378                 ;C - - - - - 0x01A397 0D:A387: F0 EF
	CMP #$1F                        ;C - - - - - 0x01A399 0D:A389: C9 1F
	BEQ loc_0D_A378                 ;C - - - - - 0x01A39B 0D:A38B: F0 EB
	JSR FaceToPlayerFlag            ;C - - - - - 0x01A39D 0D:A38D: 20 43 F3
	JSR sub_0D_AAA0                 ;C - - - - - 0x01A3A0 0D:A390: 20 A0 AA
	DEC objArr_0540,X               ;C - - - - - 0x01A3A3 0D:A393: DE 40 05
	LDA objArr_05E0,X               ;C - - - - - 0x01A3A6 0D:A396: BD E0 05
	CMP #$01                        ;C - - - - - 0x01A3A9 0D:A399: C9 01
	BNE loc_0D_A3A0                 ;C - - - - - 0x01A3AB 0D:A39B: D0 03
	INC objArr_0530,X               ;C - - - - - 0x01A3AD 0D:A39D: FE 30 05
loc_0D_A3A0:
	RTS                             ;C - - - - - 0x01A3B0 0D:A3A0: 60
tbl_0D_A3A1:
	.byte $02,$00,$02,$01,$01,$03   ;- D 1 - - - 0x01A3B1 0D:A3A1:
tbl_0D_A3A7:
	.byte $1C,$16,$19,$1C,$1C,$1F   ;- D 1 - - - 0x01A3B7 0D:A3A7:
tbl_0D_A3AD:
	.byte $04,$04,$04,$04,$04,$04   ;- D 1 - - - 0x01A3BD 0D:A3AD:
tbl_0D_A3B3:
	.byte $00,$01,$02               ;- D 1 - - - 0x01A3C3 0D:A3B3:
	.byte $03                       ;- - - - - - 0x01A3C6 0D:A3B6:
	.byte $04,$05,$10,$11,$12       ;- D 1 - - - 0x01A3C7 0D:A3B7:
	.byte $13                       ;- - - - - - 0x01A3CC 0D:A3BC:
	.byte $14,$15                   ;- D 1 - - - 0x01A3CD 0D:A3BD:
	.byte $00,$00,$00,$00           ;- - - - - - 0x01A3CF 0D:A3BF:
	.byte $20,$21,$22               ;- D 1 - - - 0x01A3D3 0D:A3C3:
	.byte $23                       ;- - - - - - 0x01A3D6 0D:A3C6:
	.byte $24,$25                   ;- D 1 - - - 0x01A3D7 0D:A3C7:
tbl_0D_A3C9:
	.byte $08,$09                   ;- - - - - - 0x01A3D9 0D:A3C9:
	.byte $0A,$0B                   ;- D 1 - - - 0x01A3DB 0D:A3CB:
	.byte $0C,$0D,$18,$19,$1A       ;- - - - - - 0x01A3DD 0D:A3CD:
	.byte $1B                       ;- D 1 - - - 0x01A3E2 0D:A3D2:
	.byte $1C,$1D,$00,$00,$00,$00   ;- - - - - - 0x01A3E3 0D:A3D3:
	.byte $28                       ;- D 1 - - - 0x01A3E9 0D:A3D9:
	.byte $29,$2A                   ;- - - - - - 0x01A3EA 0D:A3DA:
	.byte $2B                       ;- D 1 - - - 0x01A3EC 0D:A3DC:
	.byte $2C,$2D                   ;- - - - - - 0x01A3ED 0D:A3DD:
tbl_0D_A3DF:
	.byte $B4,$96,$78,$78,$B4,$F0,$B4,$78,$3C,$78,$A0,$B8;- D 1 - - - 0x01A3EF 0D:A3DF:
	.byte $00,$00,$00,$00           ;- - - - - - 0x01A3FB 0D:A3EB:
	.byte $5A,$3C,$1E,$B4,$78,$3C   ;- D 1 - - - 0x01A3FF 0D:A3EF:
ofs_0D_A3F5:
	DEC objArr_05D0,X               ;C - - J - - 0x01A405 0D:A3F5: DE D0 05
	BMI loc_0D_A40E                 ;C - - - - - 0x01A408 0D:A3F8: 30 14
	JSR sub_0F_FB5B                 ;C - - - - - 0x01A40A 0D:A3FA: 20 5B FB
	TAY                             ;C - - - - - 0x01A40D 0D:A3FD: A8
	LDA tbl_0D_AE3E,Y               ;C - - - - - 0x01A40E 0D:A3FE: B9 3E AE
	TAY                             ;C - - - - - 0x01A411 0D:A401: A8
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x01A412 0D:A402: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x01A415 0D:A405: 9D 60 04
	JSR sub_0D_AC34                 ;C - - - - - 0x01A418 0D:A408: 20 34 AC
	JMP sub_0D_A953                 ;C - - - - - 0x01A41B 0D:A40B: 4C 53 A9
loc_0D_A40E:
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A41E 0D:A40E: 4C E8 A8
ofs_0D_A411:
	JSR FaceToPlayerFlag            ;C - - J - - 0x01A421 0D:A411: 20 43 F3
	DEC objArr_04E0,X               ;C - - - - - 0x01A424 0D:A414: DE E0 04
	BNE loc_0D_A41C                 ;C - - - - - 0x01A427 0D:A417: D0 03
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A429 0D:A419: 4C E8 A8
loc_0D_A41C:
	RTS                             ;C - - - - - 0x01A42C 0D:A41C: 60
ofs_0D_A41D:
	LDA objSpriteDown,X             ;C - - J - - 0x01A42D 0D:A41D: BD B0 05
	BNE loc_0D_A428                 ;C - - - - - 0x01A430 0D:A420: D0 06
	LDA #$16                        ;C - - - - - 0x01A432 0D:A422: A9 16
	LDY #$08                        ;C - - - - - 0x01A434 0D:A424: A0 08
	BNE loc_0D_A42C                 ;C - - - - - 0x01A436 0D:A426: D0 04
loc_0D_A428:
	LDA #$37                        ;C - - - - - 0x01A438 0D:A428: A9 37
	LDY #$08                        ;C - - - - - 0x01A43A 0D:A42A: A0 08
loc_0D_A42C:
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A43C 0D:A42C: 20 3E FB
	BCS loc_0D_A434                 ;C - - - - - 0x01A43F 0D:A42F: B0 03
	JMP loc_0D_A085                 ;C - - - - - 0x01A441 0D:A431: 4C 85 A0
loc_0D_A434:
	JSR FaceToPlayerFlag            ;C - - - - - 0x01A444 0D:A434: 20 43 F3
	LDA objY,X                      ;C - - - - - 0x01A447 0D:A437: BD C0 03
	STA objArr_0520,X               ;C - - - - - 0x01A44A 0D:A43A: 9D 20 05
	LDA objSpriteDown,X             ;C - - - - - 0x01A44D 0D:A43D: BD B0 05
	BNE loc_0D_A469                 ;C - - - - - 0x01A450 0D:A440: D0 27
	LDA #$00                        ;C - - - - - 0x01A452 0D:A442: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x01A454 0D:A444: 9D 00 04
	LDA #$01                        ;C - - - - - 0x01A457 0D:A447: A9 01
	STA objVelXHi,X                 ;C - - - - - 0x01A459 0D:A449: 9D 10 04
	LDA #$00                        ;C - - - - - 0x01A45C 0D:A44C: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x01A45E 0D:A44E: 9D 20 04
	LDA #$04                        ;C - - - - - 0x01A461 0D:A451: A9 04
	STA objVelYHi,X                 ;C - - - - - 0x01A463 0D:A453: 9D 30 04
	LDY objArr_05C0,X               ;C - - - - - 0x01A466 0D:A456: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - 0x01A469 0D:A459: B9 97 A8
	CLC                             ;C - - - - - 0x01A46C 0D:A45C: 18
	ADC #$36                        ;C - - - - - 0x01A46D 0D:A45D: 69 36
	STA objArr_0450,X               ;C - - - - - 0x01A46F 0D:A45F: 9D 50 04
	LDA #$08                        ;C - - - - - 0x01A472 0D:A462: A9 08
	STA objArr_05D0,X               ;C - - - - - 0x01A474 0D:A464: 9D D0 05
	BNE loc_0D_A48E                 ;C - - - - - 0x01A477 0D:A467: D0 25
loc_0D_A469:
	LDA #$00                        ;C - - - - - 0x01A479 0D:A469: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x01A47B 0D:A46B: 9D 00 04
	LDA #$03                        ;C - - - - - 0x01A47E 0D:A46E: A9 03
	STA objVelXHi,X                 ;C - - - - - 0x01A480 0D:A470: 9D 10 04
	LDA #$80                        ;C - - - - - 0x01A483 0D:A473: A9 80
	STA objVelYLo,X                 ;C - - - - - 0x01A485 0D:A475: 9D 20 04
	LDA #$03                        ;C - - - - - 0x01A488 0D:A478: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x01A48A 0D:A47A: 9D 30 04
	LDY objArr_05C0,X               ;C - - - - - 0x01A48D 0D:A47D: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - 0x01A490 0D:A480: B9 97 A8
	CLC                             ;C - - - - - 0x01A493 0D:A483: 18
	ADC #$39                        ;C - - - - - 0x01A494 0D:A484: 69 39
	STA objArr_0450,X               ;C - - - - - 0x01A496 0D:A486: 9D 50 04
	LDA #$10                        ;C - - - - - 0x01A499 0D:A489: A9 10
	STA objArr_05D0,X               ;C - - - - - 0x01A49B 0D:A48B: 9D D0 05
loc_0D_A48E:
	LDA #$89                        ;C - - - - - 0x01A49E 0D:A48E: A9 89
	STA objActive,X                 ;C - - - - - 0x01A4A0 0D:A490: 9D 00 03
	RTS                             ;C - - - - - 0x01A4A3 0D:A493: 60
ofs_0D_A494:
	LDA objArr_0500,X               ;C - - J - - 0x01A4A4 0D:A494: BD 00 05
	BNE loc_0D_A4C6                 ;C - - - - - 0x01A4A7 0D:A497: D0 2D
	LDA objArr_05D0,X               ;C - - - - - 0x01A4A9 0D:A499: BD D0 05
	BEQ loc_0D_A4B0                 ;C - - - - - 0x01A4AC 0D:A49C: F0 12
	DEC objArr_05D0,X               ;C - - - - - 0x01A4AE 0D:A49E: DE D0 05
	LDA objSpriteDown,X             ;C - - - - - 0x01A4B1 0D:A4A1: BD B0 05
	BNE loc_0D_A4AD                 ;C - - - - - 0x01A4B4 0D:A4A4: D0 07
	LDA #$E8                        ;C - - - - - 0x01A4B6 0D:A4A6: A9 E8
	LDY #$18                        ;C - - - - - 0x01A4B8 0D:A4A8: A0 18
	JMP SetAnimXChr4                ;C - - - - - 0x01A4BA 0D:A4AA: 4C 49 F4
loc_0D_A4AD:
	JMP sub_0C_9CAD                 ;C - - - - - bank=0C 0x01A4BD 0D:A4AD: 4C AD 9C
loc_0D_A4B0:
	INC objArr_0500,X               ;C - - - - - 0x01A4C0 0D:A4B0: FE 00 05
	LDA objSpriteDown,X             ;C - - - - - 0x01A4C3 0D:A4B3: BD B0 05
	BNE loc_0D_A4BF                 ;C - - - - - 0x01A4C6 0D:A4B6: D0 07
	LDA #$84                        ;C - - - - - 0x01A4C8 0D:A4B8: A9 84
	LDY #$1A                        ;C - - - - - 0x01A4CA 0D:A4BA: A0 1A
	JMP SetAnimXChr4                ;C - - - - - 0x01A4CC 0D:A4BC: 4C 49 F4
loc_0D_A4BF:
	LDA #$AC                        ;C - - - - - 0x01A4CF 0D:A4BF: A9 AC
	LDY #$22                        ;C - - - - - 0x01A4D1 0D:A4C1: A0 22
	JMP sub_0F_F44F                 ;C - - - - - 0x01A4D3 0D:A4C3: 4C 4F F4
loc_0D_A4C6:
	JSR ApplyVelY                   ;C - - - - - 0x01A4D6 0D:A4C6: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x01A4D9 0D:A4C9: BD C0 03
	CMP objArr_0520,X               ;C - - - - - 0x01A4DC 0D:A4CC: DD 20 05
	BCC loc_0D_A4FB                 ;C - - - - - 0x01A4DF 0D:A4CF: 90 2A
	LDA objArr_0520,X               ;C - - - - - 0x01A4E1 0D:A4D1: BD 20 05
	STA objY,X                      ;C - - - - - 0x01A4E4 0D:A4D4: 9D C0 03
	JSR sub_0D_A9F6                 ;C - - - - - 0x01A4E7 0D:A4D7: 20 F6 A9
	BCC loc_0D_A4E3                 ;C - - - - - 0x01A4EA 0D:A4DA: 90 07
	LDA objSpriteDown,X             ;c - - - - - 0x01A4EC 0D:A4DC: BD B0 05
	STA objArr_03D0,X               ;c - - - - - 0x01A4EF 0D:A4DF: 9D D0 03
	RTS                             ;c - - - - - 0x01A4F2 0D:A4E2: 60
loc_0D_A4E3:
	LDA #$00                        ;C - - - - - 0x01A4F3 0D:A4E3: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x01A4F5 0D:A4E5: 9D 20 04
	STA objVelYHi,X                 ;C - - - - - 0x01A4F8 0D:A4E8: 9D 30 04
	STA objArr_0440,X               ;C - - - - - 0x01A4FB 0D:A4EB: 9D 40 04
	LDA #$8C                        ;C - - - - - 0x01A4FE 0D:A4EE: A9 8C
	STA objActive,X                 ;C - - - - - 0x01A500 0D:A4F0: 9D 00 03
	LDA #$08                        ;C - - - - - 0x01A503 0D:A4F3: A9 08
	STA objArr_05D0,X               ;C - - - - - 0x01A505 0D:A4F5: 9D D0 05
	JMP sub_0C_9CAD                 ;C - - - - - bank=0C 0x01A508 0D:A4F8: 4C AD 9C
loc_0D_A4FB:
	LDA objFacing,X                 ;C - - - - - 0x01A50B 0D:A4FB: BD 60 04
	LDY objSpriteDown,X             ;C - - - - - 0x01A50E 0D:A4FE: BC B0 05
	BNE loc_0D_A505                 ;C - - - - - 0x01A511 0D:A501: D0 02
	EOR #$FF                        ;C - - - - - 0x01A513 0D:A503: 49 FF
loc_0D_A505:
	AND #$01                        ;C - - - - - 0x01A515 0D:A505: 29 01
	BEQ loc_0D_A50F                 ;C - - - - - 0x01A517 0D:A507: F0 06
	JSR ApplyVelXAdd                ;C - - - - - 0x01A519 0D:A509: 20 83 F1
	JMP loc_0D_A512                 ;C - - - - - 0x01A51C 0D:A50C: 4C 12 A5
loc_0D_A50F:
	JSR ApplyVelXSub                ;C - - - - - 0x01A51F 0D:A50F: 20 A1 F1
loc_0D_A512:
	LDA stage                       ;C - - - - - 0x01A522 0D:A512: A5 61
	CMP #$03                        ;C - - - - - 0x01A524 0D:A514: C9 03
	BNE loc_0D_A532                 ;C - - - - - 0x01A526 0D:A516: D0 1A
	LDA ram_0060                    ;C - - - - - 0x01A528 0D:A518: A5 60
	CMP #$01                        ;C - - - - - 0x01A52A 0D:A51A: C9 01
	BNE loc_0D_A532                 ;C - - - - - 0x01A52C 0D:A51C: D0 14
	LDA #$08                        ;C - - - - - 0x01A52E 0D:A51E: A9 08
	CMP objX,X                      ;C - - - - - 0x01A530 0D:A520: DD 60 03
	BCC loc_0D_A528                 ;C - - - - - 0x01A533 0D:A523: 90 03
	STA objX,X                      ;c - - - - - 0x01A535 0D:A525: 9D 60 03
loc_0D_A528:
	LDA #$F8                        ;C - - - - - 0x01A538 0D:A528: A9 F8
	CMP objX,X                      ;C - - - - - 0x01A53A 0D:A52A: DD 60 03
	BCS loc_0D_A532                 ;C - - - - - 0x01A53D 0D:A52D: B0 03
	STA objX,X                      ;c - - - - - 0x01A53F 0D:A52F: 9D 60 03
loc_0D_A532:
	LDA objSpriteDown,X             ;C - - - - - 0x01A542 0D:A532: BD B0 05
	BNE loc_0D_A542                 ;C - - - - - 0x01A545 0D:A535: D0 0B
	LDA objAnimFrame,X              ;C - - - - - 0x01A547 0D:A537: BD 70 05
	CMP #$07                        ;C - - - - - 0x01A54A 0D:A53A: C9 07
	BEQ loc_0D_A548                 ;C - - - - - 0x01A54C 0D:A53C: F0 0A
	LDA #$89                        ;C - - - - - 0x01A54E 0D:A53E: A9 89
	BNE loc_0D_A544                 ;C - - - - - 0x01A550 0D:A540: D0 02
loc_0D_A542:
	LDA #$8A                        ;C - - - - - 0x01A552 0D:A542: A9 8A
loc_0D_A544:
	STA objArr_0440,X               ;C - - - - - 0x01A554 0D:A544: 9D 40 04
	RTS                             ;C - - - - - 0x01A557 0D:A547: 60
loc_0D_A548:
	LDA #$00                        ;C - - - - - 0x01A558 0D:A548: A9 00
	STA objAnimFlags,X              ;C - - - - - 0x01A55A 0D:A54A: 9D 90 05
	BEQ loc_0D_A544                 ;C - - - - - 0x01A55D 0D:A54D: F0 F5
ofs_0D_A54F:
	LDA objArr_0500,X               ;C - - J - - 0x01A55F 0D:A54F: BD 00 05
	CMP #$01                        ;C - - - - - 0x01A562 0D:A552: C9 01
	BEQ loc_0D_A593                 ;C - - - - - 0x01A564 0D:A554: F0 3D
	CMP #$02                        ;C - - - - - 0x01A566 0D:A556: C9 02
	BEQ loc_0D_A5CD                 ;C - - - - - 0x01A568 0D:A558: F0 73
	LDA playerGroundY               ;C - - - - - 0x01A56A 0D:A55A: A5 36
	CMP objY,X                      ;C - - - - - 0x01A56C 0D:A55C: DD C0 03
	BCS loc_0D_A565                 ;C - - - - - 0x01A56F 0D:A55F: B0 04
	LDA #$08                        ;C - - - - - 0x01A571 0D:A561: A9 08
	BNE loc_0D_A567                 ;C - - - - - 0x01A573 0D:A563: D0 02
loc_0D_A565:
	LDA #$04                        ;C - - - - - 0x01A575 0D:A565: A9 04
loc_0D_A567:
	STA objFacing,X                 ;C - - - - - 0x01A577 0D:A567: 9D 60 04
	LDA objFlags,X                  ;C - - - - - 0x01A57A 0D:A56A: BD 60 05
	AND #$40                        ;C - - - - - 0x01A57D 0D:A56D: 29 40
	BNE loc_0D_A578                 ;C - - - - - 0x01A57F 0D:A56F: D0 07
	LDA objFacing,X                 ;C - - - - - 0x01A581 0D:A571: BD 60 04
	ORA #$01                        ;C - - - - - 0x01A584 0D:A574: 09 01
	BNE loc_0D_A57D                 ;C - - - - - 0x01A586 0D:A576: D0 05
loc_0D_A578:
	LDA objFacing,X                 ;C - - - - - 0x01A588 0D:A578: BD 60 04
	ORA #$02                        ;C - - - - - 0x01A58B 0D:A57B: 09 02
loc_0D_A57D:
	STA objFacing,X                 ;C - - - - - 0x01A58D 0D:A57D: 9D 60 04
	LDY #$02                        ;C - - - - - 0x01A590 0D:A580: A0 02
	JSR sub_0D_AC34                 ;C - - - - - 0x01A592 0D:A582: 20 34 AC
	JSR sub_0D_A953                 ;C - - - - - 0x01A595 0D:A585: 20 53 A9
	JSR sub_0F_FBD9                 ;C - - - - - 0x01A598 0D:A588: 20 D9 FB
	CMP #$08                        ;C - - - - - 0x01A59B 0D:A58B: C9 08
	BCS loc_0D_A592                 ;C - - - - - 0x01A59D 0D:A58D: B0 03
	INC objArr_0500,X               ;C - - - - - 0x01A59F 0D:A58F: FE 00 05
loc_0D_A592:
	RTS                             ;C - - - - - 0x01A5A2 0D:A592: 60
loc_0D_A593:
	LDA #$A7                        ;C - - - - - 0x01A5A3 0D:A593: A9 A7
	CMP objAnim,X                   ;C - - - - - 0x01A5A5 0D:A595: DD 80 05
	BEQ loc_0D_A5A2                 ;C - - - - - 0x01A5A8 0D:A598: F0 08
	LDY #$20                        ;C - - - - - 0x01A5AA 0D:A59A: A0 20
	JSR sub_0F_F44F                 ;C - - - - - 0x01A5AC 0D:A59C: 20 4F F4
	INC objAnimFlags,X              ;C - - - - - 0x01A5AF 0D:A59F: FE 90 05
loc_0D_A5A2:
	LDA objAnimFrame,X              ;C - - - - - 0x01A5B2 0D:A5A2: BD 70 05
	CMP #$04                        ;C - - - - - 0x01A5B5 0D:A5A5: C9 04
	BNE loc_0D_A5B4                 ;C - - - - - 0x01A5B7 0D:A5A7: D0 0B
	LDA objAnimFlags,X              ;C - - - - - 0x01A5B9 0D:A5A9: BD 90 05
	BNE loc_0D_A5B4                 ;C - - - - - 0x01A5BC 0D:A5AC: D0 06
	INC objAnimFlags,X              ;C - - - - - 0x01A5BE 0D:A5AE: FE 90 05
	JMP loc_0D_A5DA                 ;C - - - - - 0x01A5C1 0D:A5B1: 4C DA A5
loc_0D_A5B4:
	LDA objAnimFrame,X              ;C - - - - - 0x01A5C4 0D:A5B4: BD 70 05
	CMP #$05                        ;C - - - - - 0x01A5C7 0D:A5B7: C9 05
	BNE loc_0D_A592                 ;C - - - - - 0x01A5C9 0D:A5B9: D0 D7
	LDA objAnimFlags,X              ;C - - - - - 0x01A5CB 0D:A5BB: BD 90 05
	CMP #$04                        ;C - - - - - 0x01A5CE 0D:A5BE: C9 04
	BNE loc_0D_A592                 ;C - - - - - 0x01A5D0 0D:A5C0: D0 D0
	INC objArr_0500,X               ;C - - - - - 0x01A5D2 0D:A5C2: FE 00 05
	LDA #$30                        ;C - - - - - 0x01A5D5 0D:A5C5: A9 30
	STA objArr_05D0,X               ;C - - - - - 0x01A5D7 0D:A5C7: 9D D0 05
	JMP sub_0D_AAAE                 ;C - - - - - 0x01A5DA 0D:A5CA: 4C AE AA
loc_0D_A5CD:
	DEC objArr_05D0,X               ;C - - - - - 0x01A5DD 0D:A5CD: DE D0 05
	BNE loc_0D_A592                 ;C - - - - - 0x01A5E0 0D:A5D0: D0 C0
	LDA #$00                        ;C - - - - - 0x01A5E2 0D:A5D2: A9 00
	STA objArr_0500,X               ;C - - - - - 0x01A5E4 0D:A5D4: 9D 00 05
	JMP loc_0D_A8E4                 ;C - - - - - 0x01A5E7 0D:A5D7: 4C E4 A8
loc_0D_A5DA:
	JSR sub_0F_F71A                 ;C - - - - - 0x01A5EA 0D:A5DA: 20 1A F7
	BCS loc_0D_A592                 ;C - - - - - 0x01A5ED 0D:A5DD: B0 B3
	STY ptr_00                      ;C - - - - - 0x01A5EF 0D:A5DF: 84 00
	LDA objFlags,X                  ;C - - - - - 0x01A5F1 0D:A5E1: BD 60 05
	AND #$40                        ;C - - - - - 0x01A5F4 0D:A5E4: 29 40
	BNE loc_0D_A5EC                 ;C - - - - - 0x01A5F6 0D:A5E6: D0 04
	LDA #$02                        ;C - - - - - 0x01A5F8 0D:A5E8: A9 02
	BNE loc_0D_A5EE                 ;C - - - - - 0x01A5FA 0D:A5EA: D0 02
loc_0D_A5EC:
	LDA #$01                        ;C - - - - - 0x01A5FC 0D:A5EC: A9 01
loc_0D_A5EE:
	STA objFacing,Y                 ;C - - - - - 0x01A5FE 0D:A5EE: 99 60 04
	AND #$02                        ;C - - - - - 0x01A601 0D:A5F1: 29 02
	TAY                             ;C - - - - - 0x01A603 0D:A5F3: A8
	LDA objX,X                      ;C - - - - - 0x01A604 0D:A5F4: BD 60 03
	CLC                             ;C - - - - - 0x01A607 0D:A5F7: 18
	ADC tbl_0D_A64E,Y               ;C - - - - - 0x01A608 0D:A5F8: 79 4E A6
	PHA                             ;C - - - - - 0x01A60B 0D:A5FB: 48
	LDA objXPage,X                  ;C - - - - - 0x01A60C 0D:A5FC: BD 80 03
	ADC tbl_0D_A64F,Y               ;C - - - - - 0x01A60F 0D:A5FF: 79 4F A6
	LDY ptr_00                      ;C - - - - - 0x01A612 0D:A602: A4 00
	STA objXPage,Y                  ;C - - - - - 0x01A614 0D:A604: 99 80 03
	PLA                             ;C - - - - - 0x01A617 0D:A607: 68
	STA objX,Y                      ;C - - - - - 0x01A618 0D:A608: 99 60 03
	LDA objY,X                      ;C - - - - - 0x01A61B 0D:A60B: BD C0 03
	CLC                             ;C - - - - - 0x01A61E 0D:A60E: 18
	ADC #$03                        ;C - - - - - 0x01A61F 0D:A60F: 69 03
	STA objY,Y                      ;C - - - - - 0x01A621 0D:A611: 99 C0 03
	LDA objYPage,X                  ;C - - - - - 0x01A624 0D:A614: BD E0 03
	STA objYPage,Y                  ;C - - - - - 0x01A627 0D:A617: 99 E0 03
	LDA #$00                        ;C - - - - - 0x01A62A 0D:A61A: A9 00
	STA objLife,Y                   ;C - - - - - 0x01A62C 0D:A61C: 99 90 04
	STA objArr_04A0,Y               ;C - - - - - 0x01A62F 0D:A61F: 99 A0 04
	LDA #$30                        ;C - - - - - 0x01A632 0D:A622: A9 30
	STA objVelXLo,Y                 ;C - - - - - 0x01A634 0D:A624: 99 00 04
	LDA #$03                        ;C - - - - - 0x01A637 0D:A627: A9 03
	STA objVelXHi,Y                 ;C - - - - - 0x01A639 0D:A629: 99 10 04
	LDA #$BB                        ;C - - - - - 0x01A63C 0D:A62C: A9 BB
	JSR SetAnimY                    ;C - - - - - 0x01A63E 0D:A62E: 20 A0 F2
	LDA #$1B                        ;C - - - - - 0x01A641 0D:A631: A9 1B
	JSR QueueSound                  ;C - - - - - 0x01A643 0D:A633: 20 4C F3
	LDA #$87                        ;C - - - - - 0x01A646 0D:A636: A9 87
	STA objArr_0440,Y               ;C - - - - - 0x01A648 0D:A638: 99 40 04
	LDA #$06                        ;C - - - - - 0x01A64B 0D:A63B: A9 06
	STA objArr_0450,Y               ;C - - - - - 0x01A64D 0D:A63D: 99 50 04
	LDA #$2E                        ;C - - - - - 0x01A650 0D:A640: A9 2E
	STA objKind,Y                   ;C - - - - - 0x01A652 0D:A642: 99 20 03
	STA objId,Y                     ;C - - - - - 0x01A655 0D:A645: 99 30 03
	LDA #$06                        ;C - - - - - 0x01A658 0D:A648: A9 06
	STA objSpriteDown,Y             ;C - - - - - 0x01A65A 0D:A64A: 99 B0 05
	RTS                             ;C - - - - - 0x01A65D 0D:A64D: 60
tbl_0D_A64E:
	.byte $12                       ;- D 1 - - - 0x01A65E 0D:A64E:
tbl_0D_A64F:
	.byte $00,$EE,$FF               ;- D 1 - - - 0x01A65F 0D:A64F:
ofs_0D_A652:
	LDA objArr_0500,X               ;C - - J - - 0x01A662 0D:A652: BD 00 05
	CMP #$01                        ;C - - - - - 0x01A665 0D:A655: C9 01
	BEQ loc_0D_A677                 ;C - - - - - 0x01A667 0D:A657: F0 1E
	CMP #$02                        ;C - - - - - 0x01A669 0D:A659: C9 02
	BEQ loc_0D_A6B1                 ;C - - - - - 0x01A66B 0D:A65B: F0 54
	LDA #$37                        ;C - - - - - 0x01A66D 0D:A65D: A9 37
	LDY #$06                        ;C - - - - - 0x01A66F 0D:A65F: A0 06
	JSR sub_0F_FB3E                 ;C - - - - - 0x01A671 0D:A661: 20 3E FB
	BCS loc_0D_A669                 ;C - - - - - 0x01A674 0D:A664: B0 03
	JMP loc_0D_A085                 ;C - - - - - 0x01A676 0D:A666: 4C 85 A0
loc_0D_A669:
	JSR sub_0C_9CAD                 ;C - - - - - bank=0C 0x01A679 0D:A669: 20 AD 9C
	LDA #$18                        ;C - - - - - 0x01A67C 0D:A66C: A9 18
	STA objArr_05D0,X               ;C - - - - - 0x01A67E 0D:A66E: 9D D0 05
	INC objArr_0500,X               ;C - - - - - 0x01A681 0D:A671: FE 00 05
	JMP FaceToPlayerFlag            ;C - - - - - 0x01A684 0D:A674: 4C 43 F3
loc_0D_A677:
	DEC objArr_05D0,X               ;C - - - - - 0x01A687 0D:A677: DE D0 05
	BNE loc_0D_A6B0                 ;C - - - - - 0x01A68A 0D:A67A: D0 34
	LDA #$03                        ;C - - - - - 0x01A68C 0D:A67C: A9 03
	STA objArr_05D0,X               ;C - - - - - 0x01A68E 0D:A67E: 9D D0 05
	LDA #$0E                        ;C - - - - - 0x01A691 0D:A681: A9 0E
	STA objArr_05E0,X               ;C - - - - - 0x01A693 0D:A683: 9D E0 05
	LDA #$00                        ;C - - - - - 0x01A696 0D:A686: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x01A698 0D:A688: 9D 20 04
	STA objVelYHi,X                 ;C - - - - - 0x01A69B 0D:A68B: 9D 30 04
	LDA #$A6                        ;C - - - - - 0x01A69E 0D:A68E: A9 A6
	LDY #$21                        ;C - - - - - 0x01A6A0 0D:A690: A0 21
	JSR sub_0F_F44F                 ;C - - - - - 0x01A6A2 0D:A692: 20 4F F4
	LDA dat_0D_A707                 ;C - - - - - 0x01A6A5 0D:A695: AD 07 A7
	STA objVelXLo,X                 ;C - - - - - 0x01A6A8 0D:A698: 9D 00 04
	LDA dat_0D_A716                 ;C - - - - - 0x01A6AB 0D:A69B: AD 16 A7
	STA objVelXHi,X                 ;C - - - - - 0x01A6AE 0D:A69E: 9D 10 04
	LDY objArr_05C0,X               ;C - - - - - 0x01A6B1 0D:A6A1: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - 0x01A6B4 0D:A6A4: B9 97 A8
	CLC                             ;C - - - - - 0x01A6B7 0D:A6A7: 18
	ADC #$30                        ;C - - - - - 0x01A6B8 0D:A6A8: 69 30
	STA objArr_0450,X               ;C - - - - - 0x01A6BA 0D:A6AA: 9D 50 04
	INC objArr_0500,X               ;C - - - - - 0x01A6BD 0D:A6AD: FE 00 05
loc_0D_A6B0:
	RTS                             ;C - - - - - 0x01A6C0 0D:A6B0: 60
loc_0D_A6B1:
	LDA #$86                        ;C - - - - - 0x01A6C1 0D:A6B1: A9 86
	STA objArr_0440,X               ;C - - - - - 0x01A6C3 0D:A6B3: 9D 40 04
	DEC objArr_05D0,X               ;C - - - - - 0x01A6C6 0D:A6B6: DE D0 05
	BNE loc_0D_A6EC                 ;C - - - - - 0x01A6C9 0D:A6B9: D0 31
	LDA #$03                        ;C - - - - - 0x01A6CB 0D:A6BB: A9 03
	STA objArr_05D0,X               ;C - - - - - 0x01A6CD 0D:A6BD: 9D D0 05
	DEC objArr_05E0,X               ;C - - - - - 0x01A6D0 0D:A6C0: DE E0 05
	BNE loc_0D_A6D8                 ;C - - - - - 0x01A6D3 0D:A6C3: D0 13
	LDA #$08                        ;C - - - - - 0x01A6D5 0D:A6C5: A9 08
	STA objArr_05D0,X               ;C - - - - - 0x01A6D7 0D:A6C7: 9D D0 05
	INC objActive,X                 ;C - - - - - 0x01A6DA 0D:A6CA: FE 00 03
loc_0D_A6CD:
	LDA #$00                        ;C - - - - - 0x01A6DD 0D:A6CD: A9 00
	STA objArr_0440,X               ;C - - - - - 0x01A6DF 0D:A6CF: 9D 40 04
	STA objArr_0500,X               ;C - - - - - 0x01A6E2 0D:A6D2: 9D 00 05
	JMP sub_0C_9CAD                 ;C - - - - - bank=0C 0x01A6E5 0D:A6D5: 4C AD 9C
loc_0D_A6D8:
	JSR sub_0D_A9F6                 ;C - - - - - 0x01A6E8 0D:A6D8: 20 F6 A9
	BCS loc_0D_A6CD                 ;C - - - - - 0x01A6EB 0D:A6DB: B0 F0
	LDY objArr_05E0,X               ;C - - - - - 0x01A6ED 0D:A6DD: BC E0 05
	LDA tbl_0D_A6F9,Y               ;C - - - - - 0x01A6F0 0D:A6E0: B9 F9 A6
	STA objVelXLo,X                 ;C - - - - - 0x01A6F3 0D:A6E3: 9D 00 04
	LDA tbl_0D_A708,Y               ;C - - - - - 0x01A6F6 0D:A6E6: B9 08 A7
	STA objVelXHi,X                 ;C - - - - - 0x01A6F9 0D:A6E9: 9D 10 04
loc_0D_A6EC:
	LDA objFacing,X                 ;C - - - - - 0x01A6FC 0D:A6EC: BD 60 04
	AND #$01                        ;C - - - - - 0x01A6FF 0D:A6EF: 29 01
	BEQ loc_0D_A6F6                 ;C - - - - - 0x01A701 0D:A6F1: F0 03
	JMP ApplyVelXAdd                ;C - - - - - 0x01A703 0D:A6F3: 4C 83 F1
loc_0D_A6F6:
	JMP ApplyVelXSub                ;C - - - - - 0x01A706 0D:A6F6: 4C A1 F1
tbl_0D_A6F9:
	.byte $19                       ;- - - - - - 0x01A709 0D:A6F9:
	.byte $33,$4C                   ;- D 1 - - - 0x01A70A 0D:A6FA:
	.word $8066, tbl_0D_B399        ;W 0x01A70C 0D:A6FC:
	.byte $CC,$E6,$00,$19,$33,$4C,$66;- D 1 - - - 0x01A710 0D:A700:
dat_0D_A707:
	.byte $80                       ;- D 1 - - - 0x01A717 0D:A707:
tbl_0D_A708:
	.byte $01                       ;- - - - - - 0x01A718 0D:A708:
	.res 8, $01                     ;- D 1 - - - 0x01A719 0D:A709: fill 8 bytes
	.byte $02,$02,$02,$02,$02       ;- D 1 - - - 0x01A721 0D:A711:
dat_0D_A716:
	.byte $02                       ;- D 1 - - - 0x01A726 0D:A716:
ofs_0D_A717:
	DEC objArr_05D0,X               ;C - - J - - 0x01A727 0D:A717: DE D0 05
	BNE loc_0D_A731                 ;C - - - - - 0x01A72A 0D:A71A: D0 15
	JSR sub_0D_AAAE                 ;C - - - - - 0x01A72C 0D:A71C: 20 AE AA
	JSR sub_0D_AA1D                 ;C - - - - - 0x01A72F 0D:A71F: 20 1D AA
	LDA objArr_03D0,X               ;C - - - - - 0x01A732 0D:A722: BD D0 03
	BNE loc_0D_A731                 ;C - - - - - 0x01A735 0D:A725: D0 0A
	LDA #$1E                        ;C - - - - - 0x01A737 0D:A727: A9 1E
	STA objArr_05D0,X               ;C - - - - - 0x01A739 0D:A729: 9D D0 05
	LDA #$87                        ;C - - - - - 0x01A73C 0D:A72C: A9 87
	STA objActive,X                 ;C - - - - - 0x01A73E 0D:A72E: 9D 00 03
loc_0D_A731:
	RTS                             ;C - - - - - 0x01A741 0D:A731: 60
ofs_0D_A732:
	DEC objArr_05D0,X               ;C - - J - - 0x01A742 0D:A732: DE D0 05
	BNE loc_0D_A731                 ;C - - - - - 0x01A745 0D:A735: D0 FA
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A747 0D:A737: 4C E8 A8
ofs_0D_A73A:
	LDA objArr_0500,X               ;C - - J - - 0x01A74A 0D:A73A: BD 00 05
	BNE loc_0D_A76F                 ;C - - - - - 0x01A74D 0D:A73D: D0 30
	JSR DistanceXToPlayer           ;C - - - - - 0x01A74F 0D:A73F: 20 74 F3
	BCS loc_0D_A748                 ;C - - - - - 0x01A752 0D:A742: B0 04
	LDA #$01                        ;C - - - - - 0x01A754 0D:A744: A9 01
	BNE loc_0D_A74A                 ;C - - - - - 0x01A756 0D:A746: D0 02
loc_0D_A748:
	LDA #$02                        ;C - - - - - 0x01A758 0D:A748: A9 02
loc_0D_A74A:
	LDY #$0C                        ;C - - - - - 0x01A75A 0D:A74A: A0 0C
	STA objFacing,X                 ;C - - - - - 0x01A75C 0D:A74C: 9D 60 04
	JSR sub_0D_AC34                 ;C - - - - - 0x01A75F 0D:A74F: 20 34 AC
	LDY objArr_05C0,X               ;C - - - - - 0x01A762 0D:A752: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - 0x01A765 0D:A755: B9 97 A8
	TAY                             ;C - - - - - 0x01A768 0D:A758: A8
	LDA tbl_0D_A88E,Y               ;C - - - - - 0x01A769 0D:A759: B9 8E A8
	STA objArr_05D0,X               ;C - - - - - 0x01A76C 0D:A75C: 9D D0 05
	LDA tbl_0D_A894,Y               ;C - - - - - 0x01A76F 0D:A75F: B9 94 A8
	STA objArr_0520,X               ;C - - - - - 0x01A772 0D:A762: 9D 20 05
	LDA tbl_0D_A891,Y               ;C - - - - - 0x01A775 0D:A765: B9 91 A8
	STA objArr_05E0,X               ;C - - - - - 0x01A778 0D:A768: 9D E0 05
	INC objArr_0500,X               ;C - - - - - 0x01A77B 0D:A76B: FE 00 05
	RTS                             ;C - - - - - 0x01A77E 0D:A76E: 60
loc_0D_A76F:
	LDY objArr_0500,X               ;C - - - - - 0x01A77F 0D:A76F: BC 00 05
	DEY                             ;C - - - - - 0x01A782 0D:A772: 88
	LDA tbl_0D_A878,Y               ;C - - - - - 0x01A783 0D:A773: B9 78 A8
	STA ptr_00                      ;C - - - - - 0x01A786 0D:A776: 85 00
	LDA tbl_0D_A87B,Y               ;C - - - - - 0x01A788 0D:A778: B9 7B A8
	STA ptr_00+1                    ;C - - - - - 0x01A78B 0D:A77B: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x01A78D 0D:A77D: 6C 00 00
ofs_0D_A780:
	DEC objArr_05D0,X               ;C - - J - - 0x01A790 0D:A780: DE D0 05
	BEQ loc_0D_A7A9                 ;C - - - - - 0x01A793 0D:A783: F0 24
	JSR sub_0D_A953                 ;C - - - - - 0x01A795 0D:A785: 20 53 A9
	JSR sub_0D_A9EB                 ;C - - - - - 0x01A798 0D:A788: 20 EB A9
	LDA objArr_05D0,X               ;C - - - - - 0x01A79B 0D:A78B: BD D0 05
	CMP objArr_05E0,X               ;C - - - - - 0x01A79E 0D:A78E: DD E0 05
	BCS loc_0D_A7AC                 ;C - - - - - 0x01A7A1 0D:A791: B0 19
	LDA objArr_05D0,X               ;C - - - - - 0x01A7A3 0D:A793: BD D0 05
	AND objArr_0520,X               ;C - - - - - 0x01A7A6 0D:A796: 3D 20 05
	EOR objArr_0520,X               ;C - - - - - 0x01A7A9 0D:A799: 5D 20 05
	BNE loc_0D_A7AC                 ;C - - - - - 0x01A7AC 0D:A79C: D0 0E
	LDA ram_00E4                    ;C - - - - - 0x01A7AE 0D:A79E: A5 E4
	AND #$03                        ;C - - - - - 0x01A7B0 0D:A7A0: 29 03
	BEQ loc_0D_A7AC                 ;C - - - - - 0x01A7B2 0D:A7A2: F0 08
	LDA #$00                        ;C - - - - - 0x01A7B4 0D:A7A4: A9 00
	STA objArr_05D0,X               ;C - - - - - 0x01A7B6 0D:A7A6: 9D D0 05
loc_0D_A7A9:
	INC objArr_0500,X               ;C - - - - - 0x01A7B9 0D:A7A9: FE 00 05
loc_0D_A7AC:
	RTS                             ;C - - - - - 0x01A7BC 0D:A7AC: 60
ofs_0D_A7AD:
	LDA objArr_05D0,X               ;C - - J - - 0x01A7BD 0D:A7AD: BD D0 05
	BNE loc_0D_A7B7                 ;C - - - - - 0x01A7C0 0D:A7B0: D0 05
	LDA #$04                        ;C - - - - - 0x01A7C2 0D:A7B2: A9 04
	STA objArr_05D0,X               ;C - - - - - 0x01A7C4 0D:A7B4: 9D D0 05
loc_0D_A7B7:
	JSR sub_0D_AAAE                 ;C - - - - - 0x01A7C7 0D:A7B7: 20 AE AA
	DEC objArr_05D0,X               ;C - - - - - 0x01A7CA 0D:A7BA: DE D0 05
	BNE loc_0D_A828                 ;C - - - - - 0x01A7CD 0D:A7BD: D0 69
	LDA ram_00E4                    ;C - - - - - 0x01A7CF 0D:A7BF: A5 E4
	AND #$0F                        ;C - - - - - 0x01A7D1 0D:A7C1: 29 0F
	STA ptr_00                      ;C - - - - - 0x01A7D3 0D:A7C3: 85 00
	LDA objFlags                    ;C - - - - - 0x01A7D5 0D:A7C5: AD 60 05
	EOR objFlags,X                  ;C - - - - - 0x01A7D8 0D:A7C8: 5D 60 05
	BEQ loc_0D_A7D1                 ;C - - - - - 0x01A7DB 0D:A7CB: F0 04
	LDA #$0C                        ;C - - - - - 0x01A7DD 0D:A7CD: A9 0C
	BNE loc_0D_A7D3                 ;C - - - - - 0x01A7DF 0D:A7CF: D0 02
loc_0D_A7D1:
	LDA #$0F                        ;C - - - - - 0x01A7E1 0D:A7D1: A9 0F
loc_0D_A7D3:
	CMP ptr_00                      ;C - - - - - 0x01A7E3 0D:A7D3: C5 00
	BCC loc_0D_A829                 ;C - - - - - 0x01A7E5 0D:A7D5: 90 52
	JSR sub_0F_FB5B                 ;C - - - - - 0x01A7E7 0D:A7D7: 20 5B FB
	TAY                             ;C - - - - - 0x01A7EA 0D:A7DA: A8
	LDA tbl_0D_A87E,Y               ;C - - - - - 0x01A7EB 0D:A7DB: B9 7E A8
	STA objFacing,X                 ;C - - - - - 0x01A7EE 0D:A7DE: 9D 60 04
	AND #$0C                        ;C - - - - - 0x01A7F1 0D:A7E1: 29 0C
	BNE loc_0D_A7F9                 ;C - - - - - 0x01A7F3 0D:A7E3: D0 14
	LDA #$4C                        ;C - - - - - 0x01A7F5 0D:A7E5: A9 4C
	STA objVelXLo,X                 ;C - - - - - 0x01A7F7 0D:A7E7: 9D 00 04
	LDA #$02                        ;C - - - - - 0x01A7FA 0D:A7EA: A9 02
	STA objVelXHi,X                 ;C - - - - - 0x01A7FC 0D:A7EC: 9D 10 04
	LDA #$00                        ;C - - - - - 0x01A7FF 0D:A7EF: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x01A801 0D:A7F1: 9D 20 04
	STA objVelYHi,X                 ;C - - - - - 0x01A804 0D:A7F4: 9D 30 04
	BEQ loc_0D_A80D                 ;C - - - - - 0x01A807 0D:A7F7: F0 14
loc_0D_A7F9:
	LDA #$1F                        ;C - - - - - 0x01A809 0D:A7F9: A9 1F
	STA objVelXLo,X                 ;C - - - - - 0x01A80B 0D:A7FB: 9D 00 04
	LDA #$02                        ;C - - - - - 0x01A80E 0D:A7FE: A9 02
	STA objVelXHi,X                 ;C - - - - - 0x01A810 0D:A800: 9D 10 04
	LDA #$E1                        ;C - - - - - 0x01A813 0D:A803: A9 E1
	STA objVelYLo,X                 ;C - - - - - 0x01A815 0D:A805: 9D 20 04
	LDA #$00                        ;C - - - - - 0x01A818 0D:A808: A9 00
	STA objVelYHi,X                 ;C - - - - - 0x01A81A 0D:A80A: 9D 30 04
loc_0D_A80D:
	LDA #$D2                        ;C - - - - - 0x01A81D 0D:A80D: A9 D2
	LDY #$24                        ;C - - - - - 0x01A81F 0D:A80F: A0 24
	JSR SetAnimXChr3                ;C - - - - - 0x01A821 0D:A811: 20 43 F4
	LDY objArr_05C0,X               ;C - - - - - 0x01A824 0D:A814: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - 0x01A827 0D:A817: B9 97 A8
	CLC                             ;C - - - - - 0x01A82A 0D:A81A: 18
	ADC #$33                        ;C - - - - - 0x01A82B 0D:A81B: 69 33
	STA objArr_0450,X               ;C - - - - - 0x01A82D 0D:A81D: 9D 50 04
	LDA #$01                        ;C - - - - - 0x01A830 0D:A820: A9 01
	STA objArr_05E0,X               ;C - - - - - 0x01A832 0D:A822: 9D E0 05
	INC objArr_0500,X               ;C - - - - - 0x01A835 0D:A825: FE 00 05
loc_0D_A828:
	RTS                             ;C - - - - - 0x01A838 0D:A828: 60
loc_0D_A829:
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A839 0D:A829: 4C E8 A8
ofs_0D_A82C:
	JSR DistanceXToPlayer           ;C - - J - - 0x01A83C 0D:A82C: 20 74 F3
	CMP #$30                        ;C - - - - - 0x01A83F 0D:A82F: C9 30
	BCS loc_0D_A83A                 ;C - - - - - 0x01A841 0D:A831: B0 07
	LDA #$9A                        ;C - - - - - 0x01A843 0D:A833: A9 9A
	LDY #$3E                        ;C - - - - - 0x01A845 0D:A835: A0 3E
	JSR SetAnimXChr3                ;C - - - - - 0x01A847 0D:A837: 20 43 F4
loc_0D_A83A:
	LDA #$88                        ;C - - - - - 0x01A84A 0D:A83A: A9 88
	STA objArr_0440,X               ;C - - - - - 0x01A84C 0D:A83C: 9D 40 04
	JSR sub_0D_A953                 ;C - - - - - 0x01A84F 0D:A83F: 20 53 A9
	LDA ptr_0E+1                    ;C - - - - - 0x01A852 0D:A842: A5 0F
	BNE loc_0D_A86C                 ;C - - - - - 0x01A854 0D:A844: D0 26
	DEC objArr_05E0,X               ;C - - - - - 0x01A856 0D:A846: DE E0 05
	BNE loc_0D_A855                 ;C - - - - - 0x01A859 0D:A849: D0 0A
	LDA #$2A                        ;C - - - - - 0x01A85B 0D:A84B: A9 2A
	JSR QueueSound                  ;C - - - - - 0x01A85D 0D:A84D: 20 4C F3
	LDA #$10                        ;C - - - - - 0x01A860 0D:A850: A9 10
	STA objArr_05E0,X               ;C - - - - - 0x01A862 0D:A852: 9D E0 05
loc_0D_A855:
	JSR DistanceXToPlayer           ;C - - - - - 0x01A865 0D:A855: 20 74 F3
	LDA objFlags,X                  ;C - - - - - 0x01A868 0D:A858: BD 60 05
	AND #$40                        ;C - - - - - 0x01A86B 0D:A85B: 29 40
	BNE loc_0D_A863                 ;C - - - - - 0x01A86D 0D:A85D: D0 04
	BCC loc_0D_A877                 ;C - - - - - 0x01A86F 0D:A85F: 90 16
	BCS loc_0D_A865                 ;C - - - - - 0x01A871 0D:A861: B0 02
loc_0D_A863:
	BCS loc_0D_A877                 ;C - - - - - 0x01A873 0D:A863: B0 12
loc_0D_A865:
	JSR DistanceXToPlayer           ;C - - - - - 0x01A875 0D:A865: 20 74 F3
	CMP #$30                        ;C - - - - - 0x01A878 0D:A868: C9 30
	BCC loc_0D_A877                 ;C - - - - - 0x01A87A 0D:A86A: 90 0B
loc_0D_A86C:
	LDA #$00                        ;C - - - - - 0x01A87C 0D:A86C: A9 00
	STA objArr_0440,X               ;C - - - - - 0x01A87E 0D:A86E: 9D 40 04
	STA objArr_0500,X               ;C - - - - - 0x01A881 0D:A871: 9D 00 05
	JMP sub_0D_A8E8                 ;C - - - - - 0x01A884 0D:A874: 4C E8 A8
loc_0D_A877:
	RTS                             ;C - - - - - 0x01A887 0D:A877: 60
tbl_0D_A878:
	.lobytes ofs_0D_A780, ofs_0D_A7AD, ofs_0D_A82C;- D 1 - - - 0x01A888 0D:A878:
tbl_0D_A87B:
	.hibytes ofs_0D_A780, ofs_0D_A7AD, ofs_0D_A82C;- D 1 - - - 0x01A88B 0D:A87B:
tbl_0D_A87E:
	.byte $09,$09,$09,$09           ;- - - - - - 0x01A88E 0D:A87E:
	.byte $01,$05,$05,$05           ;- D 1 - - - 0x01A892 0D:A882:
	.byte $06,$06                   ;- - - - - - 0x01A896 0D:A886:
	.byte $06,$06,$02,$0A           ;- D 1 - - - 0x01A898 0D:A888:
	.byte $0A,$0A                   ;- - - - - - 0x01A89C 0D:A88C:
tbl_0D_A88E:
	.byte $78,$64,$3C               ;- D 1 - - - 0x01A89E 0D:A88E:
tbl_0D_A891:
	.byte $58,$4C,$2C               ;- D 1 - - - 0x01A8A1 0D:A891:
tbl_0D_A894:
	.byte $07,$03,$01               ;- D 1 - - - 0x01A8A4 0D:A894:
tbl_0D_A897:
	.byte $00                       ;- - - - - - 0x01A8A7 0D:A897:
	.byte $00,$01                   ;- D 1 - - - 0x01A8A8 0D:A898:
	.byte $00                       ;- - - - - - 0x01A8AA 0D:A89A:
	.byte $02                       ;- D 1 - - - 0x01A8AB 0D:A89B:
ofs_0D_A89C:
	LDY objSpriteDown,X             ;C - - J - - 0x01A8AC 0D:A89C: BC B0 05
	LDA tbl_0D_A8DF,Y               ;C - - - - - 0x01A8AF 0D:A89F: B9 DF A8
	STA objArr_0440,X               ;C - - - - - 0x01A8B2 0D:A8A2: 9D 40 04
	JSR ApplyVelY                   ;C - - - - - 0x01A8B5 0D:A8A5: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x01A8B8 0D:A8A8: BD C0 03
	CMP objArr_0520,X               ;C - - - - - 0x01A8BB 0D:A8AB: DD 20 05
	BCC loc_0D_A8D6                 ;C - - - - - 0x01A8BE 0D:A8AE: 90 26
	LDA objArr_0520,X               ;C - - - - - 0x01A8C0 0D:A8B0: BD 20 05
	STA objY,X                      ;C - - - - - 0x01A8C3 0D:A8B3: 9D C0 03
	LDA #$00                        ;C - - - - - 0x01A8C6 0D:A8B6: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x01A8C8 0D:A8B8: 9D 20 04
	STA objVelYHi,X                 ;C - - - - - 0x01A8CB 0D:A8BB: 9D 30 04
	STA objArr_0440,X               ;C - - - - - 0x01A8CE 0D:A8BE: 9D 40 04
	STA objArr_0540,X               ;C - - - - - 0x01A8D1 0D:A8C1: 9D 40 05
	LDA #$08                        ;C - - - - - 0x01A8D4 0D:A8C4: A9 08
	STA objArr_05D0,X               ;C - - - - - 0x01A8D6 0D:A8C6: 9D D0 05
	LDA #$00                        ;C - - - - - 0x01A8D9 0D:A8C9: A9 00
	STA objArr_0500,X               ;C - - - - - 0x01A8DB 0D:A8CB: 9D 00 05
	LDA #$8C                        ;C - - - - - 0x01A8DE 0D:A8CE: A9 8C
	STA objActive,X                 ;C - - - - - 0x01A8E0 0D:A8D0: 9D 00 03
	JMP sub_0C_9CAD                 ;C - - - - - bank=0C 0x01A8E3 0D:A8D3: 4C AD 9C
loc_0D_A8D6:
	LDA objSpriteDown,X             ;C - - - - - 0x01A8E6 0D:A8D6: BD B0 05
	BNE loc_0D_A8DE                 ;C - - - - - 0x01A8E9 0D:A8D9: D0 03
	STA objAnimFlags,X              ;C - - - - - 0x01A8EB 0D:A8DB: 9D 90 05
loc_0D_A8DE:
	RTS                             ;C - - - - - 0x01A8EE 0D:A8DE: 60
tbl_0D_A8DF:
	.byte $94                       ;- D 1 - - - 0x01A8EF 0D:A8DF:
	.byte $00,$00                   ;- - - - - - 0x01A8F0 0D:A8E0:
	.byte $00,$8A                   ;- D 1 - - - 0x01A8F2 0D:A8E2:
loc_0D_A8E4:
	LDA #$08                        ;C - - - - - 0x01A8F4 0D:A8E4: A9 08
	BNE loc_0D_A8EA                 ;C - - - - - 0x01A8F6 0D:A8E6: D0 02
sub_0D_A8E8:
	LDA #$00                        ;C - - - - - 0x01A8F8 0D:A8E8: A9 00
loc_0D_A8EA:
	STA objArr_05D0,X               ;C - - - - - 0x01A8FA 0D:A8EA: 9D D0 05
	LDA #$81                        ;C - - - - - 0x01A8FD 0D:A8ED: A9 81
	STA objActive,X                 ;C - - - - - 0x01A8FF 0D:A8EF: 9D 00 03
	RTS                             ;C - - - - - 0x01A902 0D:A8F2: 60
loc_0D_A8F3:
	LDA ptr_0E                      ;C - - - - - 0x01A903 0D:A8F3: A5 0E
	AND #$40                        ;C - - - - - 0x01A905 0D:A8F5: 29 40
	BNE loc_0D_A90C                 ;C - - - - - 0x01A907 0D:A8F7: D0 13
	LDA objFacing,X                 ;C - - - - - 0x01A909 0D:A8F9: BD 60 04
	CMP #$08                        ;C - - - - - 0x01A90C 0D:A8FC: C9 08
	BEQ loc_0D_A944                 ;C - - - - - 0x01A90E 0D:A8FE: F0 44
	CMP #$04                        ;C - - - - - 0x01A910 0D:A900: C9 04
	BEQ loc_0D_A944                 ;C - - - - - 0x01A912 0D:A902: F0 40
	LDY #$0C                        ;C - - - - - 0x01A914 0D:A904: A0 0C
	JSR sub_0D_AC34                 ;C - - - - - 0x01A916 0D:A906: 20 34 AC
	JMP loc_0D_A995                 ;C - - - - - 0x01A919 0D:A909: 4C 95 A9
loc_0D_A90C:
	LDA objActive,X                 ;C - - - - - 0x01A91C 0D:A90C: BD 00 03
	CMP #$82                        ;C - - - - - 0x01A91F 0D:A90F: C9 82
	BEQ loc_0D_A918                 ;C - - - - - 0x01A921 0D:A911: F0 05
	LDA #$81                        ;C - - - - - 0x01A923 0D:A913: A9 81
	STA objActive,X                 ;C - - - - - 0x01A925 0D:A915: 9D 00 03
loc_0D_A918:
	LDA objArr_05F0,X               ;C - - - - - 0x01A928 0D:A918: BD F0 05
	EOR #$01                        ;C - - - - - 0x01A92B 0D:A91B: 49 01
	STA objArr_05F0,X               ;C - - - - - 0x01A92D 0D:A91D: 9D F0 05
	LDY #$0C                        ;C - - - - - 0x01A930 0D:A920: A0 0C
	JSR sub_0D_AC34                 ;C - - - - - 0x01A932 0D:A922: 20 34 AC
	JSR DistanceXToPlayer           ;C - - - - - 0x01A935 0D:A925: 20 74 F3
	BCS loc_0D_A937                 ;C - - - - - 0x01A938 0D:A928: B0 0D
	LDA #$02                        ;C - - - - - 0x01A93A 0D:A92A: A9 02
	STA objFacing,X                 ;C - - - - - 0x01A93C 0D:A92C: 9D 60 04
	LDY #$00                        ;C - - - - - 0x01A93F 0D:A92F: A0 00
	JSR sub_0F_F051                 ;C - - - - - 0x01A941 0D:A931: 20 51 F0
	JMP loc_0D_A9E3                 ;C - - - - - 0x01A944 0D:A934: 4C E3 A9
loc_0D_A937:
	LDA #$01                        ;C - - - - - 0x01A947 0D:A937: A9 01
	STA objFacing,X                 ;C - - - - - 0x01A949 0D:A939: 9D 60 04
	LDY #$01                        ;C - - - - - 0x01A94C 0D:A93C: A0 01
	JSR sub_0F_F000                 ;C - - - - - 0x01A94E 0D:A93E: 20 00 F0
	JMP loc_0D_A9E3                 ;C - - - - - 0x01A951 0D:A941: 4C E3 A9
loc_0D_A944:
	LDA objArr_05F0,X               ;C - - - - - 0x01A954 0D:A944: BD F0 05
	EOR #$01                        ;C - - - - - 0x01A957 0D:A947: 49 01
	STA objArr_05F0,X               ;C - - - - - 0x01A959 0D:A949: 9D F0 05
	LDA #$00                        ;C - - - - - 0x01A95C 0D:A94C: A9 00
	STA objArr_05D0,X               ;C - - - - - 0x01A95E 0D:A94E: 9D D0 05
	BEQ loc_0D_A995                 ;C - - - - - 0x01A961 0D:A951: F0 42
sub_0D_A953:
	LDA #$00                        ;C - - - - - 0x01A963 0D:A953: A9 00
	STA ptr_0E                      ;C - - - - - 0x01A965 0D:A955: 85 0E
	STA ptr_0E+1                    ;C - - - - - 0x01A967 0D:A957: 85 0F
	LDA objFacing,X                 ;C - - - - - 0x01A969 0D:A959: BD 60 04
	AND #$08                        ;C - - - - - 0x01A96C 0D:A95C: 29 08
	BEQ loc_0D_A976                 ;C - - - - - 0x01A96E 0D:A95E: F0 16
	LDY #$0A                        ;C - - - - - 0x01A970 0D:A960: A0 0A
	JSR sub_0F_F0F7                 ;C - - - - - 0x01A972 0D:A962: 20 F7 F0
	BCC loc_0D_A995                 ;C - - - - - 0x01A975 0D:A965: 90 2E
	LDA ram_0010                    ;C - - - - - 0x01A977 0D:A967: A5 10
	STA ptr_0E                      ;C - - - - - 0x01A979 0D:A969: 85 0E
	AND #$50                        ;C - - - - - 0x01A97B 0D:A96B: 29 50
	BEQ loc_0D_A995                 ;C - - - - - 0x01A97D 0D:A96D: F0 26
	LDA #$08                        ;C - - - - - 0x01A97F 0D:A96F: A9 08
	STA ptr_0E+1                    ;C - - - - - 0x01A981 0D:A971: 85 0F
	JMP loc_0D_A8F3                 ;C - - - - - 0x01A983 0D:A973: 4C F3 A8
loc_0D_A976:
	LDA objFacing,X                 ;C - - - - - 0x01A986 0D:A976: BD 60 04
	AND #$04                        ;C - - - - - 0x01A989 0D:A979: 29 04
	BEQ loc_0D_A995                 ;C - - - - - 0x01A98B 0D:A97B: F0 18
	LDY #$09                        ;C - - - - - 0x01A98D 0D:A97D: A0 09
	JSR sub_0F_F0A2                 ;C - - - - - 0x01A98F 0D:A97F: 20 A2 F0
	BCC loc_0D_A995                 ;C - - - - - 0x01A992 0D:A982: 90 11
	LDA ram_0010                    ;C - - - - - 0x01A994 0D:A984: A5 10
	ORA ptr_0E                      ;C - - - - - 0x01A996 0D:A986: 05 0E
	STA ptr_0E                      ;C - - - - - 0x01A998 0D:A988: 85 0E
	AND #$50                        ;C - - - - - 0x01A99A 0D:A98A: 29 50
	BEQ loc_0D_A995                 ;C - - - - - 0x01A99C 0D:A98C: F0 07
	LDA #$04                        ;C - - - - - 0x01A99E 0D:A98E: A9 04
	STA ptr_0E+1                    ;C - - - - - 0x01A9A0 0D:A990: 85 0F
	JMP loc_0D_A8F3                 ;C - - - - - 0x01A9A2 0D:A992: 4C F3 A8
loc_0D_A995:
	LDA objFacing,X                 ;C - - - - - 0x01A9A5 0D:A995: BD 60 04
	AND #$01                        ;C - - - - - 0x01A9A8 0D:A998: 29 01
	BEQ loc_0D_A9B5                 ;C - - - - - 0x01A9AA 0D:A99A: F0 19
	LDY #$08                        ;C - - - - - 0x01A9AC 0D:A99C: A0 08
	JSR sub_0F_F000                 ;C - - - - - 0x01A9AE 0D:A99E: 20 00 F0
	BCC loc_0D_A9B5                 ;C - - - - - 0x01A9B1 0D:A9A1: 90 12
	LDA ram_0010                    ;C - - - - - 0x01A9B3 0D:A9A3: A5 10
	ORA ptr_0E                      ;C - - - - - 0x01A9B5 0D:A9A5: 05 0E
	STA ptr_0E                      ;C - - - - - 0x01A9B7 0D:A9A7: 85 0E
	AND #$50                        ;C - - - - - 0x01A9B9 0D:A9A9: 29 50
	BEQ loc_0D_A9D3                 ;C - - - - - 0x01A9BB 0D:A9AB: F0 26
	LDA #$01                        ;C - - - - - 0x01A9BD 0D:A9AD: A9 01
	ORA ptr_0E+1                    ;C - - - - - 0x01A9BF 0D:A9AF: 05 0F
	STA ptr_0E+1                    ;C - - - - - 0x01A9C1 0D:A9B1: 85 0F
	BNE loc_0D_A9D3                 ;C - - - - - 0x01A9C3 0D:A9B3: D0 1E
loc_0D_A9B5:
	LDA objFacing,X                 ;C - - - - - 0x01A9C5 0D:A9B5: BD 60 04
	AND #$02                        ;C - - - - - 0x01A9C8 0D:A9B8: 29 02
	BEQ loc_0D_A9D3                 ;C - - - - - 0x01A9CA 0D:A9BA: F0 17
	LDY #$09                        ;C - - - - - 0x01A9CC 0D:A9BC: A0 09
	JSR sub_0F_F051                 ;C - - - - - 0x01A9CE 0D:A9BE: 20 51 F0
	BCC loc_0D_A9D3                 ;C - - - - - 0x01A9D1 0D:A9C1: 90 10
	LDA ram_0010                    ;C - - - - - 0x01A9D3 0D:A9C3: A5 10
	ORA ptr_0E                      ;C - - - - - 0x01A9D5 0D:A9C5: 05 0E
	STA ptr_0E                      ;C - - - - - 0x01A9D7 0D:A9C7: 85 0E
	AND #$50                        ;C - - - - - 0x01A9D9 0D:A9C9: 29 50
	BEQ loc_0D_A9D3                 ;C - - - - - 0x01A9DB 0D:A9CB: F0 06
	LDA #$02                        ;C - - - - - 0x01A9DD 0D:A9CD: A9 02
	ORA ptr_0E+1                    ;C - - - - - 0x01A9DF 0D:A9CF: 05 0F
	STA ptr_0E+1                    ;C - - - - - 0x01A9E1 0D:A9D1: 85 0F
loc_0D_A9D3:
	LDA ptr_0E                      ;C - - - - - 0x01A9E3 0D:A9D3: A5 0E
	AND #$40                        ;C - - - - - 0x01A9E5 0D:A9D5: 29 40
	BEQ loc_0D_A9E3                 ;C - - - - - 0x01A9E7 0D:A9D7: F0 0A
	LDA #$01                        ;C - - - - - 0x01A9E9 0D:A9D9: A9 01
	STA objArr_03D0,X               ;C - - - - - 0x01A9EB 0D:A9DB: 9D D0 03
	LDA #$81                        ;C - - - - - 0x01A9EE 0D:A9DE: A9 81
	STA objActive,X                 ;C - - - - - 0x01A9F0 0D:A9E0: 9D 00 03
loc_0D_A9E3:
	LDA objActive,X                 ;C - - - - - 0x01A9F3 0D:A9E3: BD 00 03
	CMP #$8E                        ;C - - - - - 0x01A9F6 0D:A9E6: C9 8E
	BNE sub_0D_A9EB                 ;C - - - - - 0x01A9F8 0D:A9E8: D0 01
	RTS                             ;C - - - - - 0x01A9FA 0D:A9EA: 60
sub_0D_A9EB:
	JSR DistanceXToPlayer           ;C - - - - - 0x01A9FB 0D:A9EB: 20 74 F3
	BCS loc_0D_A9F3                 ;C - - - - - 0x01A9FE 0D:A9EE: B0 03
	JMP sub_0F_F099                 ;C - - - - - 0x01AA00 0D:A9F0: 4C 99 F0
loc_0D_A9F3:
	JMP SetObjFlag40                ;C - - - - - 0x01AA03 0D:A9F3: 4C 90 F0
sub_0D_A9F6:
	JSR sub_0C_9BE1                 ;C - - - - - bank=0C 0x01AA06 0D:A9F6: 20 E1 9B
	LDY #$06                        ;C - - - - - 0x01AA09 0D:A9F9: A0 06
	JSR sub_0F_ECCF                 ;C - - - - - 0x01AA0B 0D:A9FB: 20 CF EC
	LDA ram_0010                    ;C - - - - - 0x01AA0E 0D:A9FE: A5 10
	AND #$40                        ;C - - - - - 0x01AA10 0D:AA00: 29 40
	BEQ loc_0D_AA1B                 ;C - - - - - 0x01AA12 0D:AA02: F0 17
	LDA objKind,X                   ;C - - - - - 0x01AA14 0D:AA04: BD 20 03
	STA objId,X                     ;C - - - - - 0x01AA17 0D:AA07: 9D 30 03
	LDA #$1F                        ;C - - - - - 0x01AA1A 0D:AA0A: A9 1F
	STA objKind,X                   ;C - - - - - 0x01AA1C 0D:AA0C: 9D 20 03
	LDA #$00                        ;C - - - - - 0x01AA1F 0D:AA0F: A9 00
	STA objArr_0500,X               ;C - - - - - 0x01AA21 0D:AA11: 9D 00 05
	LDA #$FF                        ;C - - - - - 0x01AA24 0D:AA14: A9 FF
	STA objArr_04C0,X               ;C - - - - - 0x01AA26 0D:AA16: 9D C0 04
	SEC                             ;C - - - - - 0x01AA29 0D:AA19: 38
	RTS                             ;C - - - - - 0x01AA2A 0D:AA1A: 60
loc_0D_AA1B:
	CLC                             ;C - - - - - 0x01AA2B 0D:AA1B: 18
	RTS                             ;C - - - - - 0x01AA2C 0D:AA1C: 60
sub_0D_AA1D:
	JSR sub_0C_9BE1                 ;C - - - - - bank=0C 0x01AA2D 0D:AA1D: 20 E1 9B
	LDY #$07                        ;C - - - - - 0x01AA30 0D:AA20: A0 07
	JSR sub_0F_ECCF                 ;C - - - - - 0x01AA32 0D:AA22: 20 CF EC
	LDA ram_0010                    ;C - - - - - 0x01AA35 0D:AA25: A5 10
	AND #$40                        ;C - - - - - 0x01AA37 0D:AA27: 29 40
	BNE loc_0D_AA49                 ;C - - - - - 0x01AA39 0D:AA29: D0 1E
	LDY #$08                        ;C - - - - - 0x01AA3B 0D:AA2B: A0 08
	JSR sub_0F_EDBA                 ;C - - - - - 0x01AA3D 0D:AA2D: 20 BA ED
	LDA ram_0010                    ;C - - - - - 0x01AA40 0D:AA30: A5 10
	AND #$40                        ;C - - - - - 0x01AA42 0D:AA32: 29 40
	BNE loc_0D_AA45                 ;C - - - - - 0x01AA44 0D:AA34: D0 0F
	LDY #$09                        ;C - - - - - 0x01AA46 0D:AA36: A0 09
	JSR sub_0F_ECCF                 ;C - - - - - 0x01AA48 0D:AA38: 20 CF EC
	LDA ram_0010                    ;C - - - - - 0x01AA4B 0D:AA3B: A5 10
	AND #$40                        ;C - - - - - 0x01AA4D 0D:AA3D: 29 40
	BNE loc_0D_AA55                 ;C - - - - - 0x01AA4F 0D:AA3F: D0 14
	STA objArr_03D0,X               ;C - - - - - 0x01AA51 0D:AA41: 9D D0 03
	RTS                             ;C - - - - - 0x01AA54 0D:AA44: 60
loc_0D_AA45:
	LDA #$02                        ;C - - - - - 0x01AA55 0D:AA45: A9 02
	BNE loc_0D_AA4B                 ;C - - - - - 0x01AA57 0D:AA47: D0 02
loc_0D_AA49:
	LDA #$01                        ;C - - - - - 0x01AA59 0D:AA49: A9 01
loc_0D_AA4B:
	STA objFacing,X                 ;C - - - - - 0x01AA5B 0D:AA4B: 9D 60 04
	LDA #$02                        ;C - - - - - 0x01AA5E 0D:AA4E: A9 02
	STA objArr_03D0,X               ;C - - - - - 0x01AA60 0D:AA50: 9D D0 03
	BNE loc_0D_AA5A                 ;C - - - - - 0x01AA63 0D:AA53: D0 05
loc_0D_AA55:
	LDA #$01                        ;C - - - - - 0x01AA65 0D:AA55: A9 01
	STA objArr_03D0,X               ;C - - - - - 0x01AA67 0D:AA57: 9D D0 03
loc_0D_AA5A:
	LDA #$81                        ;C - - - - - 0x01AA6A 0D:AA5A: A9 81
	STA objActive,X                 ;C - - - - - 0x01AA6C 0D:AA5C: 9D 00 03
	RTS                             ;C - - - - - 0x01AA6F 0D:AA5F: 60
sub_0D_AA60:
	JSR FaceToPlayerFlag            ;C - - - - - 0x01AA70 0D:AA60: 20 43 F3
	LDY objSpriteDown,X             ;C - - - - - 0x01AA73 0D:AA63: BC B0 05
	CPY #$02                        ;C - - - - - 0x01AA76 0D:AA66: C0 02
	BEQ loc_0D_AA7F                 ;C - - - - - 0x01AA78 0D:AA68: F0 15
loc_0D_AA6A:
	LDA tbl_0F_FC5B,Y               ;C - - - - - 0x01AA7A 0D:AA6A: B9 5B FC
	JSR SetAnimX                    ;C - - - - - 0x01AA7D 0D:AA6D: 20 88 F2
	LDA tbl_0F_FC75,Y               ;C - - - - - 0x01AA80 0D:AA70: B9 75 FC
	STA ptr_00                      ;C - - - - - 0x01AA83 0D:AA73: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x01AA85 0D:AA75: B9 33 FC
	TAY                             ;C - - - - - 0x01AA88 0D:AA78: A8
	LDA ptr_00                      ;C - - - - - 0x01AA89 0D:AA79: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x01AA8B 0D:AA7B: 99 EB 00
	RTS                             ;C - - - - - 0x01AA8E 0D:AA7E: 60
loc_0D_AA7F:
	LDA objAnim                     ;C - - - - - 0x01AA8F 0D:AA7F: AD 80 05
	CMP #$0D                        ;C - - - - - 0x01AA92 0D:AA82: C9 0D
	BEQ loc_0D_AA96                 ;C - - - - - 0x01AA94 0D:AA84: F0 10
	CMP #$16                        ;C - - - - - 0x01AA96 0D:AA86: C9 16
	BEQ loc_0D_AA96                 ;C - - - - - 0x01AA98 0D:AA88: F0 0C
	CMP #$0E                        ;C - - - - - 0x01AA9A 0D:AA8A: C9 0E
	BEQ loc_0D_AA96                 ;C - - - - - 0x01AA9C 0D:AA8C: F0 08
	CMP #$17                        ;C - - - - - 0x01AA9E 0D:AA8E: C9 17
	BEQ loc_0D_AA96                 ;C - - - - - 0x01AAA0 0D:AA90: F0 04
	CMP #$12                        ;C - - - - - 0x01AAA2 0D:AA92: C9 12
	BNE loc_0D_AA6A                 ;C - - - - - 0x01AAA4 0D:AA94: D0 D4
loc_0D_AA96:
	LDA #$94                        ;C - - - - - 0x01AAA6 0D:AA96: A9 94
	JSR SetAnimX                    ;C - - - - - 0x01AAA8 0D:AA98: 20 88 F2
	LDA #$1D                        ;C - - - - - 0x01AAAB 0D:AA9B: A9 1D
	STA chrBankShadow+3             ;C - - - - - 0x01AAAD 0D:AA9D: 85 EB
	RTS                             ;C - - - - - 0x01AAAF 0D:AA9F: 60
sub_0D_AAA0:
	LDA objKind,X                   ;C - - - - - 0x01AAB0 0D:AAA0: BD 20 03
	SEC                             ;C - - - - - 0x01AAB3 0D:AAA3: 38
	SBC #$20                        ;C - - - - - 0x01AAB4 0D:AAA4: E9 20
	TAY                             ;C - - - - - 0x01AAB6 0D:AAA6: A8
	LDA tbl_0D_AD86,Y               ;C - - - - - 0x01AAB7 0D:AAA7: B9 86 AD
	STA objArr_05D0,X               ;C - - - - - 0x01AABA 0D:AAAA: 9D D0 05
	RTS                             ;C - - - - - 0x01AABD 0D:AAAD: 60
sub_0D_AAAE:
	LDY objSpriteDown,X             ;C - - - - - 0x01AABE 0D:AAAE: BC B0 05
	LDA tbl_0D_AACB,Y               ;C - - - - - 0x01AAC1 0D:AAB1: B9 CB AA
	CMP objAnim,X                   ;C - - - - - 0x01AAC4 0D:AAB4: DD 80 05
	BEQ loc_0D_AABC                 ;C - - - - - 0x01AAC7 0D:AAB7: F0 03
	JSR SetAnimX                    ;C - - - - - 0x01AAC9 0D:AAB9: 20 88 F2
loc_0D_AABC:
	LDA tbl_0D_AAD1,Y               ;C - - - - - 0x01AACC 0D:AABC: B9 D1 AA
	STA ptr_00                      ;C - - - - - 0x01AACF 0D:AABF: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x01AAD1 0D:AAC1: B9 33 FC
	TAY                             ;C - - - - - 0x01AAD4 0D:AAC4: A8
	LDA ptr_00                      ;C - - - - - 0x01AAD5 0D:AAC5: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x01AAD7 0D:AAC7: 99 EB 00
	RTS                             ;C - - - - - 0x01AADA 0D:AACA: 60
tbl_0D_AACB:
	.byte $80,$88,$8F,$98,$A1,$B7   ;- D 1 - - - 0x01AADB 0D:AACB:
tbl_0D_AAD1:
	.byte $18,$1B,$1D,$1F,$20,$24   ;- D 1 - - - 0x01AAE1 0D:AAD1:
sub_0D_AAD7:
	LDY objSpriteDown,X             ;C - - - - - 0x01AAE7 0D:AAD7: BC B0 05
	LDA tbl_0D_AAF4,Y               ;C - - - - - 0x01AAEA 0D:AADA: B9 F4 AA
	CMP objAnim,X                   ;C - - - - - 0x01AAED 0D:AADD: DD 80 05
	BEQ loc_0D_AAE5                 ;C - - - - - 0x01AAF0 0D:AAE0: F0 03
	JSR SetAnimX                    ;C - - - - - 0x01AAF2 0D:AAE2: 20 88 F2
loc_0D_AAE5:
	LDA tbl_0D_AAFA,Y               ;C - - - - - 0x01AAF5 0D:AAE5: B9 FA AA
	STA ptr_00                      ;C - - - - - 0x01AAF8 0D:AAE8: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x01AAFA 0D:AAEA: B9 33 FC
	TAY                             ;C - - - - - 0x01AAFD 0D:AAED: A8
	LDA ptr_00                      ;C - - - - - 0x01AAFE 0D:AAEE: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x01AB00 0D:AAF0: 99 EB 00
	RTS                             ;C - - - - - 0x01AB03 0D:AAF3: 60
tbl_0D_AAF4:
	.word $8981, $9990, ofs_0E_D1A5-1;W 0x01AB04 0D:AAF4:
tbl_0D_AAFA:
	.byte $18,$1B,$1D,$1F,$20,$24   ;- D 1 - - - 0x01AB0A 0D:AAFA:
sub_0D_AB00:
	LDY objSpriteDown,X             ;C - - - - - 0x01AB10 0D:AB00: BC B0 05
	LDA tbl_0D_AB1D,Y               ;C - - - - - 0x01AB13 0D:AB03: B9 1D AB
	CMP objAnim,X                   ;C - - - - - 0x01AB16 0D:AB06: DD 80 05
	BEQ loc_0D_AB0E                 ;C - - - - - 0x01AB19 0D:AB09: F0 03
	JSR SetAnimX                    ;C - - - - - 0x01AB1B 0D:AB0B: 20 88 F2
loc_0D_AB0E:
	LDA tbl_0D_AB23,Y               ;C - - - - - 0x01AB1E 0D:AB0E: B9 23 AB
	STA ptr_00                      ;C - - - - - 0x01AB21 0D:AB11: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x01AB23 0D:AB13: B9 33 FC
	TAY                             ;C - - - - - 0x01AB26 0D:AB16: A8
	LDA ptr_00                      ;C - - - - - 0x01AB27 0D:AB17: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x01AB29 0D:AB19: 99 EB 00
	RTS                             ;C - - - - - 0x01AB2C 0D:AB1C: 60
tbl_0D_AB1D:
	.byte $83,$8A,$92,$9B,$A8,$D3   ;- D 1 - - - 0x01AB2D 0D:AB1D:
tbl_0D_AB23:
	.byte $18,$1B,$1D,$1F,$20,$25   ;- D 1 - - - 0x01AB33 0D:AB23:
sub_0D_AB29:
	LDA objArr_03F0,X               ;C - - - - - 0x01AB39 0D:AB29: BD F0 03
	BEQ loc_0D_AB82                 ;C - - - - - 0x01AB3C 0D:AB2C: F0 54
	CMP #$FF                        ;C - - - - - 0x01AB3E 0D:AB2E: C9 FF
	BEQ loc_0D_AB5C                 ;C - - - - - 0x01AB40 0D:AB30: F0 2A
	LDA gameAction                  ;C - - - - - 0x01AB42 0D:AB32: A5 30
	CMP #$04                        ;C - - - - - 0x01AB44 0D:AB34: C9 04
	BEQ loc_0D_AB3C                 ;C - - - - - 0x01AB46 0D:AB36: F0 04
	CMP #$21                        ;C - - - - - 0x01AB48 0D:AB38: C9 21
	BNE loc_0D_AB82                 ;C - - - - - 0x01AB4A 0D:AB3A: D0 46
loc_0D_AB3C:
	CPX ram_0039                    ;C - - - - - 0x01AB4C 0D:AB3C: E4 39
	BNE loc_0D_AB82                 ;C - - - - - 0x01AB4E 0D:AB3E: D0 42
	LDA gameAction                  ;C - - - - - 0x01AB50 0D:AB40: A5 30
	CMP #$21                        ;C - - - - - 0x01AB52 0D:AB42: C9 21
	BNE loc_0D_AB4C                 ;C - - - - - 0x01AB54 0D:AB44: D0 06
	JSR sub_0D_AA60                 ;C - - - - - 0x01AB56 0D:AB46: 20 60 AA
	JMP loc_0D_AB4F                 ;C - - - - - 0x01AB59 0D:AB49: 4C 4F AB
loc_0D_AB4C:
	JSR sub_0D_AAAE                 ;C - - - - - 0x01AB5C 0D:AB4C: 20 AE AA
loc_0D_AB4F:
	LDA #$00                        ;C - - - - - 0x01AB5F 0D:AB4F: A9 00
	STA objArr_04E0,X               ;C - - - - - 0x01AB61 0D:AB51: 9D E0 04
	JSR sub_0D_A8E8                 ;C - - - - - 0x01AB64 0D:AB54: 20 E8 A8
	JSR FaceToPlayerFlag            ;C - - - - - 0x01AB67 0D:AB57: 20 43 F3
	SEC                             ;C - - - - - 0x01AB6A 0D:AB5A: 38
	RTS                             ;C - - - - - 0x01AB6B 0D:AB5B: 60
loc_0D_AB5C:
	LDA objY,X                      ;C - - - - - 0x01AB6C 0D:AB5C: BD C0 03
	STA ptr_0E+1                    ;C - - - - - 0x01AB6F 0D:AB5F: 85 0F
	LDA playerGroundY               ;C - - - - - 0x01AB71 0D:AB61: A5 36
	STA objY,X                      ;C - - - - - 0x01AB73 0D:AB63: 9D C0 03
	JSR sub_0D_A9F6                 ;C - - - - - 0x01AB76 0D:AB66: 20 F6 A9
	BCC loc_0D_AB7A                 ;C - - - - - 0x01AB79 0D:AB69: 90 0F
	LDA ptr_0E+1                    ;c - - - - - 0x01AB7B 0D:AB6B: A5 0F
	STA objY,X                      ;c - - - - - 0x01AB7D 0D:AB6D: 9D C0 03
	LDA #$00                        ;c - - - - - 0x01AB80 0D:AB70: A9 00
	STA objVelYLo,X                 ;c - - - - - 0x01AB82 0D:AB72: 9D 20 04
	STA objVelYHi,X                 ;c - - - - - 0x01AB85 0D:AB75: 9D 30 04
	SEC                             ;c - - - - - 0x01AB88 0D:AB78: 38
	RTS                             ;c - - - - - 0x01AB89 0D:AB79: 60
loc_0D_AB7A:
	LDA #$00                        ;C - - - - - 0x01AB8A 0D:AB7A: A9 00
	STA objArr_03F0,X               ;C - - - - - 0x01AB8C 0D:AB7C: 9D F0 03
	JSR sub_0D_AA1D                 ;C - - - - - 0x01AB8F 0D:AB7F: 20 1D AA
loc_0D_AB82:
	LDA objArr_04E0,X               ;C - - - - - 0x01AB92 0D:AB82: BD E0 04
	BEQ loc_0D_ABA9                 ;C - - - - - 0x01AB95 0D:AB85: F0 22
	LDA objArr_04E0,X               ;C - - - - - 0x01AB97 0D:AB87: BD E0 04
	CMP #$1E                        ;C - - - - - 0x01AB9A 0D:AB8A: C9 1E
	BEQ loc_0D_AB96                 ;C - - - - - 0x01AB9C 0D:AB8C: F0 08
	CMP #$1C                        ;C - - - - - 0x01AB9E 0D:AB8E: C9 1C
	BEQ loc_0D_AB9C                 ;C - - - - - 0x01ABA0 0D:AB90: F0 0A
	CMP #$10                        ;C - - - - - 0x01ABA2 0D:AB92: C9 10
	BNE loc_0D_AB9F                 ;C - - - - - 0x01ABA4 0D:AB94: D0 09
loc_0D_AB96:
	JSR sub_0D_AAAE                 ;C - - - - - 0x01ABA6 0D:AB96: 20 AE AA
	JMP loc_0D_AB9F                 ;C - - - - - 0x01ABA9 0D:AB99: 4C 9F AB
loc_0D_AB9C:
	JSR sub_0D_AA60                 ;C - - - - - 0x01ABAC 0D:AB9C: 20 60 AA
loc_0D_AB9F:
	JSR FaceToPlayerFlag            ;C - - - - - 0x01ABAF 0D:AB9F: 20 43 F3
	LDA #$88                        ;C - - - - - 0x01ABB2 0D:ABA2: A9 88
	STA objActive,X                 ;C - - - - - 0x01ABB4 0D:ABA4: 9D 00 03
	CLC                             ;C - - - - - 0x01ABB7 0D:ABA7: 18
	RTS                             ;C - - - - - 0x01ABB8 0D:ABA8: 60
loc_0D_ABA9:
	LDA gameAction                  ;C - - - - - 0x01ABB9 0D:ABA9: A5 30
	CMP #$0A                        ;C - - - - - 0x01ABBB 0D:ABAB: C9 0A
	BEQ loc_0D_ABB7                 ;C - - - - - 0x01ABBD 0D:ABAD: F0 08
	CMP #$0B                        ;C - - - - - 0x01ABBF 0D:ABAF: C9 0B
	BEQ loc_0D_ABB9                 ;C - - - - - 0x01ABC1 0D:ABB1: F0 06
	CMP #$19                        ;C - - - - - 0x01ABC3 0D:ABB3: C9 19
	BNE loc_0D_ABC0                 ;C - - - - - 0x01ABC5 0D:ABB5: D0 09
loc_0D_ABB7:
	SEC                             ;c - - - - - 0x01ABC7 0D:ABB7: 38
	RTS                             ;c - - - - - 0x01ABC8 0D:ABB8: 60
loc_0D_ABB9:
	LDA #$00                        ;C - - - - - 0x01ABC9 0D:ABB9: A9 00
	STA objArr_04D0,X               ;C - - - - - 0x01ABCB 0D:ABBB: 9D D0 04
	CLC                             ;C - - - - - 0x01ABCE 0D:ABBE: 18
	RTS                             ;C - - - - - 0x01ABCF 0D:ABBF: 60
loc_0D_ABC0:
	LDA objActive,X                 ;C - - - - - 0x01ABD0 0D:ABC0: BD 00 03
	CMP #$81                        ;C - - - - - 0x01ABD3 0D:ABC3: C9 81
	BEQ loc_0D_ABD3                 ;C - - - - - 0x01ABD5 0D:ABC5: F0 0C
	CMP #$82                        ;C - - - - - 0x01ABD7 0D:ABC7: C9 82
	BEQ loc_0D_ABD3                 ;C - - - - - 0x01ABD9 0D:ABC9: F0 08
	CMP #$84                        ;C - - - - - 0x01ABDB 0D:ABCB: C9 84
	BEQ loc_0D_ABD3                 ;C - - - - - 0x01ABDD 0D:ABCD: F0 04
	CMP #$86                        ;C - - - - - 0x01ABDF 0D:ABCF: C9 86
	BNE loc_0D_ABEE                 ;C - - - - - 0x01ABE1 0D:ABD1: D0 1B
loc_0D_ABD3:
	LDA gameAction                  ;C - - - - - 0x01ABE3 0D:ABD3: A5 30
	CMP #$06                        ;C - - - - - 0x01ABE5 0D:ABD5: C9 06
	BEQ loc_0D_ABE1                 ;C - - - - - 0x01ABE7 0D:ABD7: F0 08
	CMP #$24                        ;C - - - - - 0x01ABE9 0D:ABD9: C9 24
	BEQ loc_0D_ABE1                 ;C - - - - - 0x01ABEB 0D:ABDB: F0 04
	CMP #$1F                        ;C - - - - - 0x01ABED 0D:ABDD: C9 1F
	BNE loc_0D_ABEE                 ;C - - - - - 0x01ABEF 0D:ABDF: D0 0D
loc_0D_ABE1:
	LDA #$00                        ;C - - - - - 0x01ABF1 0D:ABE1: A9 00
	STA objArr_04D0,X               ;C - - - - - 0x01ABF3 0D:ABE3: 9D D0 04
	JSR sub_0D_AAAE                 ;C - - - - - 0x01ABF6 0D:ABE6: 20 AE AA
	JSR sub_0D_A8E8                 ;C - - - - - 0x01ABF9 0D:ABE9: 20 E8 A8
	SEC                             ;C - - - - - 0x01ABFC 0D:ABEC: 38
	RTS                             ;C - - - - - 0x01ABFD 0D:ABED: 60
loc_0D_ABEE:
	LDA objActive,X                 ;C - - - - - 0x01ABFE 0D:ABEE: BD 00 03
	CMP #$8F                        ;C - - - - - 0x01AC01 0D:ABF1: C9 8F
	BEQ loc_0D_ABFB                 ;C - - - - - 0x01AC03 0D:ABF3: F0 06
	LDA gameAction                  ;C - - - - - 0x01AC05 0D:ABF5: A5 30
	CMP #$25                        ;C - - - - - 0x01AC07 0D:ABF7: C9 25
	BEQ loc_0D_ABFD                 ;C - - - - - 0x01AC09 0D:ABF9: F0 02
loc_0D_ABFB:
	CLC                             ;C - - - - - 0x01AC0B 0D:ABFB: 18
	RTS                             ;C - - - - - 0x01AC0C 0D:ABFC: 60
loc_0D_ABFD:
	LDA objActive,X                 ;C - - - - - 0x01AC0D 0D:ABFD: BD 00 03
	CMP #$89                        ;C - - - - - 0x01AC10 0D:AC00: C9 89
	BNE loc_0D_AC0D                 ;C - - - - - 0x01AC12 0D:AC02: D0 09
	LDA objArr_0520,X               ;c - - - - - 0x01AC14 0D:AC04: BD 20 05
	STA objArr_0530,X               ;c - - - - - 0x01AC17 0D:AC07: 9D 30 05
	JMP loc_0D_AC13                 ;c - - - - - 0x01AC1A 0D:AC0A: 4C 13 AC
loc_0D_AC0D:
	LDA objY,X                      ;C - - - - - 0x01AC1D 0D:AC0D: BD C0 03
	STA objArr_0530,X               ;C - - - - - 0x01AC20 0D:AC10: 9D 30 05
loc_0D_AC13:
	LDA #$8E                        ;C - - - - - 0x01AC23 0D:AC13: A9 8E
	STA objVelYLo,X                 ;C - - - - - 0x01AC25 0D:AC15: 9D 20 04
	LDA #$03                        ;C - - - - - 0x01AC28 0D:AC18: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x01AC2A 0D:AC1A: 9D 30 04
	LDA objKind,X                   ;C - - - - - 0x01AC2D 0D:AC1D: BD 20 03
	STA objId,X                     ;C - - - - - 0x01AC30 0D:AC20: 9D 30 03
	LDA #$05                        ;C - - - - - 0x01AC33 0D:AC23: A9 05
	STA objKind,X                   ;C - - - - - 0x01AC35 0D:AC25: 9D 20 03
	LDA #$80                        ;C - - - - - 0x01AC38 0D:AC28: A9 80
	STA objActive,X                 ;C - - - - - 0x01AC3A 0D:AC2A: 9D 00 03
	LDA #$FF                        ;C - - - - - 0x01AC3D 0D:AC2D: A9 FF
	STA objArr_04C0,X               ;C - - - - - 0x01AC3F 0D:AC2F: 9D C0 04
	SEC                             ;C - - - - - 0x01AC42 0D:AC32: 38
	RTS                             ;C - - - - - 0x01AC43 0D:AC33: 60
sub_0D_AC34:
	STY ptr_02                      ;C - - - - - 0x01AC44 0D:AC34: 84 02
	JSR sub_0D_AAD7                 ;C - - - - - 0x01AC46 0D:AC36: 20 D7 AA
	LDY objSpriteDown,X             ;C - - - - - 0x01AC49 0D:AC39: BC B0 05
	LDA tbl_0D_ACA7,Y               ;C - - - - - 0x01AC4C 0D:AC3C: B9 A7 AC
	STA ptr_00                      ;C - - - - - 0x01AC4F 0D:AC3F: 85 00
	LDA tbl_0D_ACAD,Y               ;C - - - - - 0x01AC51 0D:AC41: B9 AD AC
	STA ptr_00+1                    ;C - - - - - 0x01AC54 0D:AC44: 85 01
	LDY ptr_02                      ;C - - - - - 0x01AC56 0D:AC46: A4 02
	JMP (ptr_00)                    ;C - - - - - 0x01AC58 0D:AC48: 6C 00 00
ofs_0D_AC4B:
	LDA tbl_0D_ACC6,Y               ;C - - J - - 0x01AC5B 0D:AC4B: B9 C6 AC
	STA objVelXLo,X                 ;C - - - - - 0x01AC5E 0D:AC4E: 9D 00 04
	LDA tbl_0D_ACD6,Y               ;C - - - - - 0x01AC61 0D:AC51: B9 D6 AC
	STA objVelYLo,X                 ;C - - - - - 0x01AC64 0D:AC54: 9D 20 04
	LDA #$00                        ;C - - - - - 0x01AC67 0D:AC57: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x01AC69 0D:AC59: 9D 10 04
	STA objVelYHi,X                 ;C - - - - - 0x01AC6C 0D:AC5C: 9D 30 04
	RTS                             ;C - - - - - 0x01AC6F 0D:AC5F: 60
ofs_0D_AC60:
	LDA tbl_0D_ACE6,Y               ;C - - J - - 0x01AC70 0D:AC60: B9 E6 AC
	STA objVelXLo,X                 ;C - - - - - 0x01AC73 0D:AC63: 9D 00 04
	LDA tbl_0D_ACF6,Y               ;C - - - - - 0x01AC76 0D:AC66: B9 F6 AC
	STA objVelYLo,X                 ;C - - - - - 0x01AC79 0D:AC69: 9D 20 04
	LDA #$00                        ;C - - - - - 0x01AC7C 0D:AC6C: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x01AC7E 0D:AC6E: 9D 10 04
	STA objVelYHi,X                 ;C - - - - - 0x01AC81 0D:AC71: 9D 30 04
	RTS                             ;C - - - - - 0x01AC84 0D:AC74: 60
ofs_0D_AC75:
	LDA tbl_0D_AD26,Y               ;C - - J - - 0x01AC85 0D:AC75: B9 26 AD
	STA objVelXLo,X                 ;C - - - - - 0x01AC88 0D:AC78: 9D 00 04
	LDA tbl_0D_AD06,Y               ;C - - - - - 0x01AC8B 0D:AC7B: B9 06 AD
	STA objVelXHi,X                 ;C - - - - - 0x01AC8E 0D:AC7E: 9D 10 04
	LDA tbl_0D_AD36,Y               ;C - - - - - 0x01AC91 0D:AC81: B9 36 AD
	STA objVelYLo,X                 ;C - - - - - 0x01AC94 0D:AC84: 9D 20 04
	LDA tbl_0D_AD16,Y               ;C - - - - - 0x01AC97 0D:AC87: B9 16 AD
	STA objVelYHi,X                 ;C - - - - - 0x01AC9A 0D:AC8A: 9D 30 04
	RTS                             ;C - - - - - 0x01AC9D 0D:AC8D: 60
ofs_0D_AC8E:
	LDA tbl_0D_AD46,Y               ;C - - J - - 0x01AC9E 0D:AC8E: B9 46 AD
	STA objVelXLo,X                 ;C - - - - - 0x01ACA1 0D:AC91: 9D 00 04
	LDA tbl_0D_AD06,Y               ;C - - - - - 0x01ACA4 0D:AC94: B9 06 AD
	STA objVelXHi,X                 ;C - - - - - 0x01ACA7 0D:AC97: 9D 10 04
	LDA tbl_0D_AD56,Y               ;C - - - - - 0x01ACAA 0D:AC9A: B9 56 AD
	STA objVelYLo,X                 ;C - - - - - 0x01ACAD 0D:AC9D: 9D 20 04
	LDA tbl_0D_AD16,Y               ;C - - - - - 0x01ACB0 0D:ACA0: B9 16 AD
	STA objVelYHi,X                 ;C - - - - - 0x01ACB3 0D:ACA3: 9D 30 04
	RTS                             ;C - - - - - 0x01ACB6 0D:ACA6: 60
tbl_0D_ACA7:
	.lobytes ofs_0D_AC75, ofs_0D_AC8E, ofs_0D_AC4B, ofs_0D_AC60, ofs_0D_AC8E, ofs_0D_AC60;- D 1 - - - 0x01ACB7 0D:ACA7:
tbl_0D_ACAD:
	.hibytes ofs_0D_AC75, ofs_0D_AC8E, ofs_0D_AC4B, ofs_0D_AC60, ofs_0D_AC8E, ofs_0D_AC60;- D 1 - - - 0x01ACBD 0D:ACAD:
sub_0D_ACB3:
	STY ptr_0E+1                    ;C - - - - - 0x01ACC3 0D:ACB3: 84 0F
	LDA objSpriteDown,X             ;C - - - - - 0x01ACC5 0D:ACB5: BD B0 05
	ASL A                           ;C - - - - - 0x01ACC8 0D:ACB8: 0A
	ASL A                           ;C - - - - - 0x01ACC9 0D:ACB9: 0A
	ASL A                           ;C - - - - - 0x01ACCA 0D:ACBA: 0A
	ASL A                           ;C - - - - - 0x01ACCB 0D:ACBB: 0A
	CLC                             ;C - - - - - 0x01ACCC 0D:ACBC: 18
	ADC ptr_0E+1                    ;C - - - - - 0x01ACCD 0D:ACBD: 65 0F
	TAY                             ;C - - - - - 0x01ACCF 0D:ACBF: A8
	LDA tbl_0D_AD9C,Y               ;C - - - - - 0x01ACD0 0D:ACC0: B9 9C AD
	LDY ptr_0E+1                    ;C - - - - - 0x01ACD3 0D:ACC3: A4 0F
	RTS                             ;C - - - - - 0x01ACD5 0D:ACC5: 60
tbl_0D_ACC6:
	.byte $00,$4E,$90,$BD,$CC,$BD,$90,$4E,$00,$4E,$90,$BD,$CC,$BD,$90,$4E;- D 1 - - - 0x01ACD6 0D:ACC6:
tbl_0D_ACD6:
	.byte $CC,$BD,$90,$4E,$00,$4E,$90,$BD,$CC,$BD,$90,$4E,$00,$4E,$90,$BD;- D 1 - - - 0x01ACE6 0D:ACD6:
tbl_0D_ACE6:
	.byte $00,$58,$A2,$D4,$E6,$D4,$A2,$58,$00,$58,$A2,$D4,$E6,$D4,$A2,$58;- D 1 - - - 0x01ACF6 0D:ACE6:
tbl_0D_ACF6:
	.byte $E6,$D4,$A2,$58,$00,$58,$A2,$D4,$E6,$D4,$A2,$58,$00,$58,$A2,$D4;- D 1 - - - 0x01AD06 0D:ACF6:
tbl_0D_AD06:
	.byte $00,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00,$01,$01,$01,$00,$00;- D 1 - - - 0x01AD16 0D:AD06:
tbl_0D_AD16:
	.byte $01,$01,$00,$00,$00,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00,$01;- D 1 - - - 0x01AD26 0D:AD16:
tbl_0D_AD26:
	.byte $00,$75,$D9,$1B,$33,$1B,$D9,$75,$00,$75,$D9,$1B,$33,$1B,$D9,$75;- D 1 - - - 0x01AD36 0D:AD26:
tbl_0D_AD36:
	.byte $33,$1B,$D9,$75,$00,$75,$D9,$1B,$33,$1B,$D9,$75,$00,$75,$D9,$1B;- D 1 - - - 0x01AD46 0D:AD36:
tbl_0D_AD46:
	.byte $00,$89,$FD,$4B,$66,$4B,$FD,$89,$00,$89,$FD,$4B,$66,$4B,$FD,$89;- D 1 - - - 0x01AD56 0D:AD46:
tbl_0D_AD56:
	.byte $66,$4B,$FD,$89,$00,$89,$FD,$4B,$66,$4B,$FD,$89,$00,$89,$FD,$4B;- D 1 - - - 0x01AD66 0D:AD56:
tbl_0D_AD66:
	.byte $04,$05,$06,$17,$38,$19,$0A,$0B,$0C,$0D,$0E,$1F,$30,$11,$02,$03;- D 1 - - - 0x01AD76 0D:AD66:
tbl_0D_AD76:
	.byte $0C,$0D,$0E,$1F,$30,$11,$02,$03,$04,$05,$06,$17,$38,$19,$0A,$0B;- D 1 - - - 0x01AD86 0D:AD76:
tbl_0D_AD86:
	.byte $0A                       ;- D 1 - - - 0x01AD96 0D:AD86:
	.byte $09                       ;- - - - - - 0x01AD97 0D:AD87:
	.byte $1C                       ;- D 1 - - - 0x01AD98 0D:AD88:
	.byte $1E,$1E                   ;- - - - - - 0x01AD99 0D:AD89:
	.byte $19,$09                   ;- D 1 - - - 0x01AD9B 0D:AD8B:
	.byte $07                       ;- - - - - - 0x01AD9D 0D:AD8D:
	.byte $1A                       ;- D 1 - - - 0x01AD9E 0D:AD8E:
	.byte $1C,$1C                   ;- - - - - - 0x01AD9F 0D:AD8F:
	.byte $17                       ;- D 1 - - - 0x01ADA1 0D:AD91:
	.byte $00,$00,$00,$00           ;- - - - - - 0x01ADA2 0D:AD92:
	.byte $08                       ;- D 1 - - - 0x01ADA6 0D:AD96:
	.byte $05                       ;- - - - - - 0x01ADA7 0D:AD97:
	.byte $18                       ;- D 1 - - - 0x01ADA8 0D:AD98:
	.byte $1A,$1A                   ;- - - - - - 0x01ADA9 0D:AD99:
	.byte $15                       ;- D 1 - - - 0x01ADAB 0D:AD9B:
tbl_0D_AD9C:
	.byte $07,$17,$17,$17,$07,$17,$17,$17,$07,$17,$17,$17,$07;- D 1 - - - 0x01ADAC 0D:AD9C:
	.byte $17                       ;- - - - - - 0x01ADB9 0D:ADA9:
	.byte $17,$17,$05,$0C,$0A,$0C,$05,$0C,$0A,$0C,$05,$0C,$0A,$0C,$05,$0C;- D 1 - - - 0x01ADBA 0D:ADAA:
	.byte $0A,$0C,$10,$25,$20,$25,$10,$25,$20,$25,$10,$25,$20,$25,$10,$25;- D 1 - - - 0x01ADCA 0D:ADBA:
	.byte $20,$25,$08,$20,$16,$20,$08,$20,$16,$20,$08,$20,$16,$20,$08,$20;- D 1 - - - 0x01ADDA 0D:ADCA:
	.byte $16,$20,$07,$17,$17,$17,$07,$17,$17,$17,$07,$17,$17,$17,$07,$17;- D 1 - - - 0x01ADEA 0D:ADDA:
	.byte $17,$17,$10,$25,$20,$25,$10,$25,$20,$25,$10,$25,$20,$25,$10,$25;- D 1 - - - 0x01ADFA 0D:ADEA:
	.byte $20,$25                   ;- D 1 - - - 0x01AE0A 0D:ADFA:
tbl_0D_ADFC:
	.byte $11,$00,$11,$21,$00,$21,$00,$11,$11,$00,$11,$00,$11,$00,$11,$11;- D 1 - - - 0x01AE0C 0D:ADFC:
	.byte $11,$00,$11,$00,$11,$00,$11,$00,$11,$11,$00,$11,$11,$00,$00,$11;- D 1 - - - 0x01AE1C 0D:AE0C:
	.byte $11,$11,$21,$31,$41,$41,$00,$00,$11,$11,$11,$11,$51,$51,$00,$00;- D 1 - - - 0x01AE2C 0D:AE1C:
tbl_0D_AE2C:
	.byte $0C,$08,$02               ;- - - - - - 0x01AE3C 0D:AE2C:
	.byte $08,$06,$04               ;- D 1 - - - 0x01AE3F 0D:AE2F:
tbl_0D_AE32:
	.byte $04,$02,$08,$06,$06,$04   ;- D 1 - - - 0x01AE42 0D:AE32:
tbl_0D_AE38:
	.byte $32,$24,$56,$56,$32,$32   ;- D 1 - - - 0x01AE48 0D:AE38:
tbl_0D_AE3E:
	.byte $04,$0C,$0A,$0B,$0C,$0D,$0E,$0C,$04,$04,$02,$03,$04,$05,$06,$04;- D 1 - - - 0x01AE4E 0D:AE3E:
	.byte $12,$24,$00,$04,$80,$00,$A8,$00,$14,$40,$88,$00,$61,$10,$40,$00;- - - - - - 0x01AE5E 0D:AE4E:
	.byte $94,$00                   ;- - - - - - 0x01AE6E 0D:AE5E:
	.byte $00,$01,$02,$03,$72       ;- D 1 - - - 0x01AE70 0D:AE60:
	.byte $11,$84,$13               ;- - - - - - 0x01AE75 0D:AE65:
	.byte $23                       ;- D 1 - - - 0x01AE78 0D:AE68:
	.byte $00,$20,$00,$62,$01,$03,$50;- - - - - - 0x01AE79 0D:AE69:
	.byte $18,$00                   ;- D 1 - - - 0x01AE80 0D:AE70:
	.byte $39,$00,$00,$40,$01,$00   ;- - - - - - 0x01AE82 0D:AE72:
	.byte $6C,$6E                   ;- D 1 - - - 0x01AE88 0D:AE78:
	.byte $40,$60                   ;- - - - - - 0x01AE8A 0D:AE7A:
	.byte $0F,$20,$27,$23,$0F,$31,$21,$11,$0F,$31,$10,$19,$0F,$31,$21,$15;- D 1 - - - 0x01AE8C 0D:AE7C:
	.byte $00,$00,$00,$00,$04,$05,$06,$07,$00;- D 1 - - - 0x01AE9C 0D:AE8C:
	.byte $05,$02,$00               ;- - - - - - 0x01AEA5 0D:AE95:
	.byte $23                       ;- D 1 - - - 0x01AEA8 0D:AE98:
	.byte $00,$10,$00,$00,$00,$03,$00;- - - - - - 0x01AEA9 0D:AE99:
	.byte $1C,$00                   ;- D 1 - - - 0x01AEB0 0D:AEA0:
	.byte $08,$00,$00,$10,$E0,$04   ;- - - - - - 0x01AEB2 0D:AEA2:
	.byte $70,$72                   ;- D 1 - - - 0x01AEB8 0D:AEA8:
	.byte $88,$00                   ;- - - - - - 0x01AEBA 0D:AEAA:
	.byte $0F,$20,$27,$22,$0F,$32,$22,$12,$0F,$20,$10,$19,$0F,$2C,$19,$15;- D 1 - - - 0x01AEBC 0D:AEAC:
	.byte $00,$00,$00,$00,$08,$09,$0A,$00;- D 1 - - - 0x01AECC 0D:AEBC:
	.byte $25,$01,$02,$41           ;- - - - - - 0x01AED4 0D:AEC4:
	.byte $22                       ;- D 1 - - - 0x01AED8 0D:AEC8:
	.byte $00,$00,$01,$22,$00,$11,$04;- - - - - - 0x01AED9 0D:AEC9:
	.byte $1C,$00                   ;- D 1 - - - 0x01AEE0 0D:AED0:
	.byte $10,$40,$00,$01,$00,$00   ;- - - - - - 0x01AEE2 0D:AED2:
	.byte $6C,$6E                   ;- D 1 - - - 0x01AEE8 0D:AED8:
	.byte $40,$01                   ;- - - - - - 0x01AEEA 0D:AEDA:
	.byte $0F,$20,$27,$17,$0F,$32,$22,$12,$0F,$20,$10,$1B,$0F,$20,$16,$06;- D 1 - - - 0x01AEEC 0D:AEDC:
	.byte $00,$00,$00,$00           ;- D 1 - - - 0x01AEFC 0D:AEEC:
	.byte $C4,$44,$E5,$04,$7A,$81,$11,$44,$06,$01,$62,$41,$A9,$01,$15,$01;- - - - - - 0x01AF00 0D:AEF0:
	.byte $00,$01,$00,$00,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D;- D 1 - I - 0x01AF10 0D:AF00:
	.byte $0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D;- D 1 - I - 0x01AF20 0D:AF10:
	.res 8, $1E                     ;- D 1 - I - 0x01AF30 0D:AF20: fill 8 bytes
	.byte $1F,$1F,$1F,$1F,$1F,$1F,$1F;- - - - - - 0x01AF38 0D:AF28:
	.byte $1F                       ;- D 1 - I - 0x01AF3F 0D:AF2F:
	.res 16, $20                    ;- - - - - - 0x01AF40 0D:AF30: fill 16 bytes
	.byte $05,$05,$05,$05,$21,$22,$21,$22,$0D,$0D,$0D,$23,$24,$25,$26,$0D;- D 1 - I - 0x01AF50 0D:AF40:
	.byte $27,$28,$29,$2A,$2B,$2C,$15,$2D,$2E,$2E,$2E,$2F,$30,$31,$1D,$2E;- D 1 - I - 0x01AF60 0D:AF50:
	.res 8, $1E                     ;- D 1 - I - 0x01AF70 0D:AF60: fill 8 bytes
	.res 8, $1F                     ;- D 1 - I - 0x01AF78 0D:AF68: fill 8 bytes
	.res 16, $20                    ;- - - - - - 0x01AF80 0D:AF70: fill 16 bytes
	.byte $05,$05,$05,$05,$21,$22,$32,$33,$34,$25,$35,$0D,$26,$0D,$36,$37;- D 1 - I - 0x01AF90 0D:AF80:
	.byte $38,$2C,$39,$27,$28,$3A,$3B,$10,$3C,$31,$3D,$2E,$2E,$1D,$3E,$1B;- D 1 - I - 0x01AFA0 0D:AF90:
	.res 8, $1E                     ;- D 1 - I - 0x01AFB0 0D:AFA0: fill 8 bytes
	.res 8, $1F                     ;- D 1 - I - 0x01AFB8 0D:AFA8: fill 8 bytes
	.res 16, $20                    ;- - - - - - 0x01AFC0 0D:AFB0: fill 16 bytes
	.byte $00,$02,$03,$04,$21,$05,$05,$05,$3F,$0A,$0B,$0C,$26,$0D,$0D,$0D;- D 1 - I - 0x01AFD0 0D:AFC0:
	.byte $11,$12,$13,$14,$28,$29,$40,$28,$19,$1A,$18,$1C,$41,$2E,$42,$2E;- D 1 - I - 0x01AFE0 0D:AFD0:
	.res 8, $1E                     ;- D 1 - I - 0x01AFF0 0D:AFE0: fill 8 bytes
	.res 8, $1F                     ;- D 1 - I - 0x01AFF8 0D:AFE8: fill 8 bytes
	.res 16, $20                    ;- - - - - - 0x01B000 0D:AFF0: fill 16 bytes
	.byte $05,$05,$05,$32,$01,$00,$01,$00,$0D,$26,$26,$36,$43,$44,$45,$46;- D 1 - I - 0x01B010 0D:B000:
	.byte $27,$28,$3A,$47,$48,$49,$4A,$4B,$4C,$4C,$4D,$4E,$4F,$50,$51,$52;- D 1 - I - 0x01B020 0D:B010:
	.res 8, $1E                     ;- D 1 - I - 0x01B030 0D:B020: fill 8 bytes
	.byte $1F,$1F,$1F,$1F,$1F,$1F,$1F;- - - - - - 0x01B038 0D:B028:
	.byte $1F                       ;- D 1 - I - 0x01B03F 0D:B02F:
	.res 16, $20                    ;- - - - - - 0x01B040 0D:B030: fill 16 bytes
	.byte $01,$00,$00,$01,$00,$00,$53,$00,$54,$55,$56,$57,$55,$58,$59,$5A;- D 1 - I - 0x01B050 0D:B040:
	.byte $5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A;- D 1 - I - 0x01B060 0D:B050:
	.res 8, $1E                     ;- D 1 - I - 0x01B070 0D:B060: fill 8 bytes
	.res 8, $1F                     ;- D 1 - I - 0x01B078 0D:B068: fill 8 bytes
	.res 16, $20                    ;- - - - - - 0x01B080 0D:B070: fill 16 bytes
	.byte $6B                       ;- D 1 - I - 0x01B090 0D:B080:
tbl_0D_B081:
	.byte $53,$6C,$00,$33,$01,$00,$00,$6D,$6E,$6F,$70,$71,$72,$73,$74,$75;- D 1 - I - 0x01B091 0D:B081:
tbl_0D_B091:
	.byte $76,$77,$60,$78,$79,$7A,$7B,$7C,$7D,$69,$7E,$7F,$80,$7E,$1B,$1E;- D 1 - I - 0x01B0A1 0D:B091:
	.byte $1E,$1E,$1E,$1E,$1E,$1E,$1E,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F;- D 1 - I - 0x01B0B1 0D:B0A1:
	.res 16, $20                    ;- - - - - - 0x01B0C0 0D:B0B0: fill 16 bytes
	.byte $00,$6B,$6C,$04,$21,$05,$05,$05,$81,$82,$83,$84,$26,$0D,$0D,$0D;- D 1 - I - 0x01B0D0 0D:B0C0:
	.byte $85,$75,$77,$86,$87,$29,$40,$28,$88,$89,$8A,$8B,$4D,$4C,$42,$4C;- D 1 - I - 0x01B0E0 0D:B0D0:
	.res 8, $1E                     ;- D 1 - I - 0x01B0F0 0D:B0E0: fill 8 bytes
	.byte $1F,$1F,$1F,$1F,$1F,$1F,$1F;- D 1 - I - 0x01B0F8 0D:B0E8:
	.byte $1F,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20;- - - - - - 0x01B0FF 0D:B0EF:
	.byte $20                       ;- - - - - - 0x01B10F 0D:B0FF:
	.word $8D8C, $8F8E, $9190, $9291;W 0x01B110 0D:B100:
	.byte $8C,$93,$8E,$8F,$90,$94,$95,$96,$97,$98,$99,$9A,$9B,$06,$9C,$9D;- D 1 - I - 0x01B118 0D:B108:
	.byte $9E,$9F,$A0,$A1,$A2,$A3,$A4,$A5,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E;- D 1 - I - 0x01B128 0D:B118:
	.res 8, $1F                     ;- - - - - - 0x01B138 0D:B128: fill 8 bytes
	.res 16, $20                    ;- - - - - - 0x01B140 0D:B130: fill 16 bytes
	.byte $91,$91,$91,$91,$92,$91,$91,$91,$94,$A6,$94,$95,$96,$A6,$94,$A6;- D 1 - I - 0x01B150 0D:B140:
	.byte $A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$A3,$A4,$A3,$A4,$A5,$A3,$A4,$A3;- D 1 - I - 0x01B160 0D:B150:
	.res 8, $1E                     ;- D 1 - I - 0x01B170 0D:B160: fill 8 bytes
	.res 8, $1F                     ;- - - - - - 0x01B178 0D:B168: fill 8 bytes
	.res 16, $20                    ;- - - - - - 0x01B180 0D:B170: fill 16 bytes
	.byte $91,$AF,$B0,$91,$91,$91,$AF,$B0,$94,$B1,$A6,$94,$94,$B2,$B1,$94;- D 1 - I - 0x01B190 0D:B180:
	.byte $B3,$B4,$AC,$06,$B5,$B6,$B7,$B8,$A4,$B9,$BA,$BB,$BA,$BB,$B9,$BA;- D 1 - I - 0x01B1A0 0D:B190:
	.res 8, $1E                     ;- D 1 - I - 0x01B1B0 0D:B1A0: fill 8 bytes
	.res 8, $1F                     ;- D 1 - I - 0x01B1B8 0D:B1A8: fill 8 bytes
	.res 208, $20                   ;- - - - - - 0x01B1C0 0D:B1B0: fill 208 bytes
	.byte $BC,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20;- - - - - - 0x01B290 0D:B280:
	.res 265, $20                   ;- - - - - - 0x01B2A0 0D:B290: fill 265 bytes
tbl_0D_B399:
	.res 871, $20                   ;- - - - - - 0x01B3A9 0D:B399: fill 871 bytes
	.byte $01,$01,$08,$08,$01,$01,$08,$09,$04,$B7,$0E,$BF,$1D,$1E,$25,$26;- D 1 - I - 0x01B710 0D:B700:
	.byte $34,$35,$34,$35,$43,$36,$4B,$36,$70,$10,$78,$79,$10,$11,$18,$19;- D 1 - I - 0x01B720 0D:B710:
	.byte $12,$13,$1A,$1B,$13,$14,$1B,$1C,$16,$17,$1F,$40,$2D,$2E,$40,$06;- D 1 - I - 0x01B730 0D:B720:
	.byte $3C,$3D,$07,$3F,$3E,$3E,$51,$15,$B1,$B1,$E6,$E7,$20,$21,$B4,$29;- D 1 - I - 0x01B740 0D:B730:
	.byte $22,$2B,$B5,$2A,$23,$24,$B5,$2A,$27,$48,$50,$58,$48,$48,$58,$58;- D 1 - I - 0x01B750 0D:B740:
	.byte $0F,$93,$76,$0D,$4C,$4C,$61,$2F,$EE,$EF,$0A,$0A,$B6,$B6,$0A,$0A;- D 1 - I - 0x01B760 0D:B750:
	.byte $E3,$E4,$0A,$0A,$32,$30,$0A,$0A,$31,$7E,$0A,$0A,$30,$31,$0A,$0A;- D 1 - I - 0x01B770 0D:B760:
	.byte $7E,$0D,$0A,$0B,$2C,$2C,$0B,$0B,$03,$03,$05,$05,$FF,$FF,$00;- D 1 - I - 0x01B780 0D:B770:
	.byte $00                       ;- - - - - - 0x01B78F 0D:B77F:
	.byte $00,$00,$00,$00,$35,$35,$35,$35,$36,$36,$36,$36,$3E,$3E,$51,$3A;- D 1 - I - 0x01B790 0D:B780:
	.byte $3D,$3D,$5A,$59,$3E,$3E,$5A,$5C,$3D,$3D,$51,$15,$41,$42,$49,$4A;- D 1 - I - 0x01B7A0 0D:B790:
	.byte $4C,$41,$2F,$49,$42,$4C,$4A,$2F,$4C,$94,$2F,$3B,$FE,$FE,$00,$56;- D 1 - I - 0x01B7B0 0D:B7A0:
	.byte $95,$5F,$5E,$4F,$60,$4C,$68,$2F,$37,$37,$0B,$0B,$2C,$3B,$0B,$0B;- D 1 - I - 0x01B7C0 0D:B7B0:
	.byte $5D,$5E,$0B,$0B,$52,$53,$0B,$0B,$35,$38,$35,$38,$01,$01,$09,$08;- D 1 - I - 0x01B7D0 0D:B7C0:
	.byte $3E,$3E,$5B,$59,$3E,$3E,$3F,$15,$3D,$39,$3A,$18,$11,$12,$1A,$1B;- D 1 - I - 0x01B7E0 0D:B7D0:
	.byte $96,$FE,$55,$56,$93,$4C,$0D,$2F,$42,$4C,$4A,$61,$94,$21,$3B,$29;- D 1 - I - 0x01B7F0 0D:B7E0:
	.byte $62,$5E,$0B,$0B,$0D,$2C,$0B,$0B,$3B,$32,$0B,$0A,$14,$13,$1C,$1B;- D 1 - I - 0x01B800 0D:B7F0:
	.byte $47,$57,$45,$46,$2C,$37,$0B,$0B,$4D,$4E,$0B,$0B,$10,$11,$D0,$18;- D 1 - I - 0x01B810 0D:B800:
	.byte $12,$CC,$A0,$D4,$10,$11,$18,$D0,$12,$13,$0C,$D0,$94,$9C,$3B,$A9;- D 1 - I - 0x01B820 0D:B810:
	.byte $99,$9A,$AA,$A3,$C6,$DC,$A4,$A3,$9C,$AB,$A4,$B3,$AC,$9C,$A3,$E8;- D 1 - I - 0x01B830 0D:B820:
	.byte $2F,$2F,$0B,$0B,$A1,$A1,$0B,$0B,$3B,$A7,$AD,$0A,$CD,$CE,$E0,$E1;- D 1 - I - 0x01B840 0D:B830:
	.byte $A7,$30,$E1,$E2,$31,$A6,$0A,$0A,$A6,$F0,$0A,$0A,$01,$01,$08,$C8;- D 1 - I - 0x01B850 0D:B840:
	.byte $CC,$11,$D4,$A0,$12,$13,$A0,$D0,$13,$CC,$18,$D4,$13,$11,$18,$A0;- D 1 - I - 0x01B860 0D:B850:
	.byte $10,$CB,$0C,$D3,$B8,$B9,$C0,$C3,$BA,$BB,$C3,$C3,$DC,$C6,$E9,$EB;- D 1 - I - 0x01B870 0D:B860:
	.byte $C6,$9C,$EA,$EB,$9B,$DC   ;- D 1 - I - 0x01B880 0D:B870:
	.word tbl_0F_EBEC-1, ofs_0D_A89C-1, tbl_0F_EBEC-1, $9CC6, ofs_0F_EDED-1, ofs_0E_C5AC-1;W 0x01B886 0D:B876:
	.byte $B3,$A3,$99,$C9,$9D,$D1,$CA,$CF,$F8,$D2,$F1,$F2,$E0,$E1,$F2,$F2;- D 1 - I - 0x01B892 0D:B882:
	.byte $E1,$E2,$F2,$F2,$0A,$0A,$F2,$F3,$0A,$0A,$F4,$DA,$E0,$E1,$A5,$A6;- D 1 - I - 0x01B8A2 0D:B892:
	.byte $E1,$E2,$A6,$D9,$0A,$0A,$F9,$FA,$FB,$0A,$01,$01,$C8,$08,$D6,$01;- D 1 - I - 0x01B8B2 0D:B8A2:
	.byte $D5,$08,$B9,$BB,$C3,$C1,$BA,$B9,$C3,$C2,$DD,$BB,$C1,$C3,$BC,$CB;- D 1 - I - 0x01B8C2 0D:B8B2:
	.byte $C4,$D3,$11,$12,$A0,$A0,$13,$11,$D0,$A0,$12,$CC,$0C,$D4,$B8,$BA;- D 1 - I - 0x01B8D2 0D:B8C2:
	.byte $C0,$C3,$C9,$CA,$D1,$D2,$CF,$CA,$D2,$D2,$CF,$C9,$D2,$D1,$C6,$C6;- D 1 - I - 0x01B8E2 0D:B8D2:
	.byte $E8,$E9,$9B,$A8,$EA,$EC,$9B,$DC,$ED,$A9,$99,$C9,$AA,$D1,$D9,$A6;- D 1 - I - 0x01B8F2 0D:B8E2:
	.byte $E0,$E1,$A6,$A6,$E1,$E2,$A6,$A6,$0A,$0A,$F0,$F1,$E0,$E1,$F3,$F4;- D 1 - I - 0x01B902 0D:B8F2:
	.byte $E1,$E2,$BA,$BB,$C2,$C1,$B9,$BB,$C3,$C2,$DD,$BB,$C3,$C3,$3C,$3D;- D 1 - I - 0x01B912 0D:B902:
	.byte $C4,$3F,$CA,$CF,$D2,$D2,$9A,$93,$A9,$0D,$4C,$41,$61,$49,$A7,$30;- D 1 - I - 0x01B922 0D:B912:
	.byte $E0,$E1,$31,$A7,$E1,$E2,$CD,$CE,$0A,$0A,$A7,$0D,$0A;- D 1 - I - 0x01B932 0D:B922:
	.word $86AE, $8686, $8486, $8486, $8486, $8484, $8584, $8586;W 0x01B93F 0D:B92F:
	.word $8686, $8669              ;W 0x01B94F 0D:B93F:
	.byte $69,$01,$01,$01,$01,$01,$65,$6C,$6D,$84,$86,$8C,$8E,$75,$75,$08;- D 1 - I - 0x01B953 0D:B943:
	.byte $08,$75,$75,$08,$09,$74,$75,$81,$08,$86,$86,$8E,$8F,$47,$57,$67;- D 1 - I - 0x01B963 0D:B953:
	.byte $6F                       ;- D 1 - I - 0x01B973 0D:B963:
	.word $8484, $8C87, $8682, $8E8D, $8B86;W 0x01B974 0D:B964:
	.byte $8F,$69,$13,$11,$B2,$18,$66,$13,$6E,$B2,$83,$8A,$0B,$0B,$67,$6F;- D 1 - I - 0x01B97E 0D:B96E:
	.byte $0B,$0B,$89,$83,$0B,$0B,$83,$83,$0B,$0B,$8A,$64,$0B,$0B,$7D,$92;- D 1 - I - 0x01B98E 0D:B97E:
	.byte $0B,$0B,$90,$7D,$0B,$0B,$77,$7D,$0B,$0B,$75,$75,$09,$08,$13,$10;- D 1 - I - 0x01B99E 0D:B98E:
	.byte $B2,$18,$11,$12,$B2,$18,$10,$13,$18,$72,$10,$11,$B2,$18,$66,$13;- D 1 - I - 0x01B9AE 0D:B99E:
	.byte $6E,$71,$7B,$12,$78,$78,$10,$10,$79,$18,$11,$12,$B2,$72,$01,$01;- D 1 - I - 0x01B9BE 0D:B9AE:
	.byte $01,$6C,$65,$01,$6D,$01,$75,$74,$09,$81,$75,$75,$08,$63,$13,$10;- D 1 - I - 0x01B9CE 0D:B9BE:
	.byte $B2,$72,$11,$66,$71,$7A,$10,$13,$B2,$18,$13,$6B,$B2,$73,$11,$66;- D 1 - I - 0x01B9DE 0D:B9CE:
	.byte $B2,$6E,$10,$13,$B2,$72,$7D,$77,$0B,$0B,$7D,$7D,$0B,$0B,$92,$90;- D 1 - I - 0x01B9EE 0D:B9DE:
	.byte $0B,$0B                   ;- D 1 - I - 0x01B9FE 0D:B9EE:
	.byte $DD,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x01BA00 0D:B9F0:
	.res 136, $00                   ;- - - - - - 0x01BA10 0D:BA00: fill 136 bytes
	.byte $00,$00,$00,$00           ;- D 1 - I - 0x01BA98 0D:BA88:
	.res 116, $00                   ;- - - - - - 0x01BA9C 0D:BA8C: fill 116 bytes
	.byte $00,$21                   ;- D 1 - - - 0x01BB10 0D:BB00:
	.byte $22                       ;- - - - - - 0x01BB12 0D:BB02:
	.byte $21,$21,$21,$80,$91,$21,$21,$61,$62,$53,$4A,$21,$B1,$30,$32,$34;- D 1 - - - 0x01BB13 0D:BB03:
	.byte $31,$45,$C7,$31,$31,$53,$52,$54,$51,$65,$B2,$20,$A1,$56,$56,$58;- D 1 - - - 0x01BB23 0D:BB13:
	.byte $6A,$6C,$93,$99,$B2       ;- D 1 - - - 0x01BB33 0D:BB23:
	.byte $5F                       ;- - - - - - 0x01BB38 0D:BB28:
	.byte $76,$78,$59,$29,$B3,$B3,$20,$3B,$3C,$7C;- D 1 - - - 0x01BB39 0D:BB29:
	.byte $63                       ;- - - - - - 0x01BB43 0D:BB33:
	.byte $A8,$20,$20,$28,$A9,$88,$C7,$AE,$87,$A7,$A7,$C7,$80,$CC,$CE,$A5;- D 1 - - - 0x01BB44 0D:BB34:
	.byte $7C                       ;- - - - - - 0x01BB54 0D:BB44:
	.byte $EA,$EB,$E8,$20,$EC,$EE,$B5,$21,$EA,$FB,$00,$84,$C8,$00,$CA;- D 1 - - - 0x01BB55 0D:BB45:
	.byte $28                       ;- - - - - - 0x01BB64 0D:BB54:
	.byte $BF,$00,$D8,$94,$C7,$C8,$C8,$C7,$00,$BB,$AC,$C0,$20,$BF,$C6,$38;- D 1 - - - 0x01BB65 0D:BB55:
	.byte $D2,$34,$EA,$D0,$38       ;- D 1 - - - 0x01BB75 0D:BB65:
	.byte $21                       ;- - - - - - 0x01BB7A 0D:BB6A:
	.byte $D4,$21,$D3,$54,$00,$31,$52,$3E,$F4,$D6,$D6,$96,$86,$70,$F0,$70;- D 1 - - - 0x01BB7B 0D:BB6B:
	.byte $32                       ;- D 1 - - - 0x01BB8B 0D:BB7B:
	.word $8621, $8D8D              ;W 0x01BB8C 0D:BB7C:
	.byte $A5                       ;- - - - - - 0x01BB90 0D:BB80:
	.byte $21,$63,$21,$79,$21,$21,$79;- D 1 - - - 0x01BB91 0D:BB81:
	.byte $B5                       ;- - - - - - 0x01BB98 0D:BB88:
	.byte $79,$21,$38,$79,$21,$21,$21,$B7;- D 1 - - - 0x01BB99 0D:BB89:
	.byte $86                       ;- - - - - - 0x01BBA1 0D:BB91:
	.byte $86,$4A,$AE,$00,$BF       ;- D 1 - - - 0x01BBA2 0D:BB92:
	.byte $34,$66                   ;- - - - - - 0x01BBA7 0D:BB97:
	.byte $57,$58,$55,$56,$60       ;- D 1 - - - 0x01BBA9 0D:BB99:
	.byte $60,$27                   ;- - - - - - 0x01BBAE 0D:BB9E:
	.byte $51,$29                   ;- D 1 - - - 0x01BBB0 0D:BBA0:
	.byte $1E                       ;- - - - - - 0x01BBB2 0D:BBA2:
	.byte $6C,$6D,$80,$80,$80,$66,$82,$84,$C4,$C6,$62,$86;- D 1 - - - 0x01BBB3 0D:BBA3:
	.byte $80,$1E                   ;- - - - - - 0x01BBBF 0D:BBAF:
	.byte $56,$52,$67,$69,$78,$7C,$21,$31,$33,$31,$32,$32;- D 1 - - - 0x01BBC1 0D:BBB1:
	.byte $01,$01                   ;- - - - - - 0x01BBCD 0D:BBBD:
	.byte $2D,$51,$C2,$C0,$D0,$B1,$C6,$E6;- D 1 - - - 0x01BBCF 0D:BBBF:
	.byte $01                       ;- - - - - - 0x01BBD7 0D:BBC7:
	.byte $21,$E0,$A4,$30,$31,$3B,$C3,$A4,$52,$E2,$00,$53,$C9,$21,$21;- D 1 - - - 0x01BBD8 0D:BBC8:
	.byte $01,$01                   ;- - - - - - 0x01BBE7 0D:BBD7:
	.byte $F2,$6B                   ;- D 1 - - - 0x01BBE9 0D:BBD9:
	.byte $56                       ;- - - - - - 0x01BBEB 0D:BBDB:
	.byte $BA,$E4                   ;- D 1 - - - 0x01BBEC 0D:BBDC:
	.byte $01,$01                   ;- - - - - - 0x01BBEE 0D:BBDE:
	.byte $38,$48,$48,$3B,$C3       ;- D 1 - - - 0x01BBF0 0D:BBE0:
	.byte $01                       ;- - - - - - 0x01BBF5 0D:BBE5:
	.byte $69,$69,$67,$5E,$5C,$5D,$5D,$7E,$AB,$35,$AC,$AA,$20,$20,$96;- D 1 - - - 0x01BBF6 0D:BBE6:
	.byte $01,$01,$01               ;- - - - - - 0x01BC05 0D:BBF5:
	.byte $2B,$2F,$80,$25           ;- D 1 - - - 0x01BC08 0D:BBF8:
	.byte $01,$01                   ;- - - - - - 0x01BC0C 0D:BBFC:
	.byte $00                       ;- D 1 - - - 0x01BC0E 0D:BBFE:
	.byte $00                       ;- - - - - - 0x01BC0F 0D:BBFF:
	.byte $00,$21                   ;- D 1 - - - 0x01BC10 0D:BC00:
	.byte $22                       ;- - - - - - 0x01BC12 0D:BC02:
	.byte $21,$2B,$21,$90,$00,$21,$21,$61,$62,$51,$36,$2B,$00,$31,$33,$30;- D 1 - - - 0x01BC13 0D:BC03:
	.byte $32,$30,$C7,$7F,$32,$51,$53,$53,$52,$53,$21,$8A,$92,$7E,$57,$59;- D 1 - - - 0x01BC23 0D:BC13:
	.byte $6B,$6D,$A2,$99,$21       ;- D 1 - - - 0x01BC33 0D:BC23:
	.byte $69                       ;- - - - - - 0x01BC38 0D:BC28:
	.byte $77,$78,$59,$2A,$B4,$B4,$20,$3C,$3D,$7C;- D 1 - - - 0x01BC39 0D:BC29:
	.byte $64                       ;- - - - - - 0x01BC43 0D:BC33:
	.byte $A9,$8A,$20,$28,$B8,$8B,$C7,$9F,$88,$A7,$A7,$C7,$80,$CD,$CF,$A6;- D 1 - - - 0x01BC44 0D:BC34:
	.byte $28                       ;- - - - - - 0x01BC54 0D:BC44:
	.byte $00,$F7,$D8,$20,$ED,$EF,$B6,$21,$EB,$F7,$BF,$00,$C7,$CA,$BF;- D 1 - - - 0x01BC55 0D:BC45:
	.byte $7C                       ;- - - - - - 0x01BC64 0D:BC54:
	.byte $00,$BD,$E9,$94,$C7,$C7,$C7,$C7,$00,$BC,$BF,$C1,$20,$00,$21,$49;- D 1 - - - 0x01BC65 0D:BC55:
	.byte $D3,$E6,$00,$D1,$49       ;- D 1 - - - 0x01BC75 0D:BC65:
	.byte $21                       ;- - - - - - 0x01BC7A 0D:BC6A:
	.byte $D5,$D2,$21,$E6,$E7,$32,$C9,$3F,$F5,$D7,$D6,$00,$9E,$70,$54,$E6;- D 1 - - - 0x01BC7B 0D:BC6B:
	.byte $33                       ;- D 1 - - - 0x01BC8B 0D:BC7B:
	.word $86E6, $8D8D, ofs_0F_E6A6 ;W 0x01BC8C 0D:BC7C:
	.byte $63,$21,$21,$21,$6F,$21   ;- D 1 - - - 0x01BC92 0D:BC82:
	.byte $B6                       ;- - - - - - 0x01BC98 0D:BC88:
	.byte $21,$6F,$49,$21,$21,$6F   ;- D 1 - - - 0x01BC99 0D:BC89:
	.word $866F, loc_0E_CB86, $9F36 ;W 0x01BC9F 0D:BC8F:
	.byte $BD,$00                   ;- D 1 - - - 0x01BCA5 0D:BC95:
	.byte $31,$56                   ;- - - - - - 0x01BCA7 0D:BC97:
	.byte $22,$55,$64,$65,$63       ;- D 1 - - - 0x01BCA9 0D:BC99:
	.byte $60,$28                   ;- - - - - - 0x01BCAE 0D:BC9E:
	.byte $52,$2A                   ;- D 1 - - - 0x01BCB0 0D:BCA0:
	.byte $1E                       ;- - - - - - 0x01BCB2 0D:BCA2:
	.byte $69,$68,$81,$80,$81,$6A,$83,$85,$C5,$55,$50,$62;- D 1 - - - 0x01BCB3 0D:BCA3:
	.byte $8D,$84                   ;- - - - - - 0x01BCBF 0D:BCAF:
	.byte $7E,$53,$E5,$69,$78,$7C,$21,$32,$34,$32,$31,$31;- D 1 - - - 0x01BCC1 0D:BCB1:
	.byte $01,$01                   ;- - - - - - 0x01BCCD 0D:BCBD:
	.byte $21,$B0,$C3,$C1,$D0,$52,$BB,$6A;- D 1 - - - 0x01BCCF 0D:BCBF:
	.byte $01                       ;- - - - - - 0x01BCD7 0D:BCC7:
	.byte $21,$E1,$A4,$31,$32,$C2,$3D,$00,$53,$D3,$D2,$C9,$52,$CB,$F6;- D 1 - - - 0x01BCD8 0D:BCC8:
	.byte $01,$01                   ;- - - - - - 0x01BCE7 0D:BCD7:
	.byte $81,$6B                   ;- D 1 - - - 0x01BCE9 0D:BCD9:
	.byte $BA                       ;- - - - - - 0x01BCEB 0D:BCDB:
	.byte $65,$DA                   ;- D 1 - - - 0x01BCEC 0D:BCDC:
	.byte $01,$01                   ;- - - - - - 0x01BCEE 0D:BCDE:
	.byte $48,$48,$49,$C2,$3D       ;- D 1 - - - 0x01BCF0 0D:BCE0:
	.byte $01                       ;- - - - - - 0x01BCF5 0D:BCE5:
	.byte $69,$5F,$67,$5F,$5D,$5D,$7D,$67,$AB,$7C,$AD,$20,$20,$9A,$9C;- D 1 - - - 0x01BCF6 0D:BCE6:
	.byte $01,$01,$01               ;- - - - - - 0x01BD05 0D:BCF5:
	.byte $2C,$3F,$80,$25           ;- D 1 - - - 0x01BD08 0D:BCF8:
	.byte $01,$01                   ;- - - - - - 0x01BD0C 0D:BCFC:
	.byte $00                       ;- D 1 - - - 0x01BD0E 0D:BCFE:
	.byte $00                       ;- - - - - - 0x01BD0F 0D:BCFF:
	.byte $00,$21                   ;- D 1 - - - 0x01BD10 0D:BD00:
	.byte $22                       ;- - - - - - 0x01BD12 0D:BD02:
	.byte $21,$21,$72,$20,$21,$24,$24,$21,$21,$D1,$4A,$24,$B0,$40,$42,$44;- D 1 - - - 0x01BD13 0D:BD03:
	.byte $41,$55,$47,$81,$82,$43,$43,$48,$56,$75,$B2,$A7,$B2,$00,$BD,$68;- D 1 - - - 0x01BD23 0D:BD13:
	.byte $7A,$7B,$A3,$A3,$93       ;- D 1 - - - 0x01BD33 0D:BD23:
	.byte $AF                       ;- - - - - - 0x01BD38 0D:BD28:
	.byte $AF,$AF,$20,$39,$82,$82,$20,$4B,$4C,$4E;- D 1 - - - 0x01BD39 0D:BD29:
	.byte $73                       ;- - - - - - 0x01BD43 0D:BD33:
	.byte $A8,$20,$20,$20,$A9,$98,$8E,$AE,$97,$99,$99,$4A,$20,$DC,$DE;- D 1 - - - 0x01BD44 0D:BD34:
	.word $8CA5, $FBEA, $99EA       ;W 0x01BD53 0D:BD43:
	.byte $FC,$FE,$20,$37,$FA,$FB,$00,$85,$47,$CA,$CA;- D 1 - - - 0x01BD59 0D:BD49:
	.byte $20                       ;- - - - - - 0x01BD64 0D:BD54:
	.byte $BF,$BD,$00,$94,$00,$00,$AA,$00,$00,$BA,$BA,$D0,$C2,$BF,$C4,$9A;- D 1 - - - 0x01BD65 0D:BD55:
	.byte $E2,$44,$EA,$E0,$38       ;- D 1 - - - 0x01BD75 0D:BD65:
	.byte $21                       ;- - - - - - 0x01BD7A 0D:BD6A:
	.byte $E4,$21,$E3,$43,$00,$5B,$D9,$5D,$F2,$21,$21,$96,$22,$27,$27,$27;- D 1 - - - 0x01BD7B 0D:BD6B:
	.byte $42                       ;- D 1 - - - 0x01BD8B 0D:BD7B:
	.byte $24                       ;- - - - - - 0x01BD8C 0D:BD7C:
	.byte $22,$4E                   ;- D 1 - - - 0x01BD8D 0D:BD7D:
	.byte $8D,$A5                   ;- - - - - - 0x01BD8F 0D:BD7F:
	.byte $24,$73,$66,$79,$21,$21,$79;- D 1 - - - 0x01BD91 0D:BD81:
	.byte $20                       ;- - - - - - 0x01BD98 0D:BD88:
	.byte $89,$66,$38,$50,$F6,$F6,$21,$DA;- D 1 - - - 0x01BD99 0D:BD89:
	.byte $22                       ;- - - - - - 0x01BDA1 0D:BD91:
	.byte $64,$4A,$AE,$BD,$BF       ;- D 1 - - - 0x01BDA2 0D:BD92:
	.byte $82,$00                   ;- - - - - - 0x01BDA7 0D:BD97:
	.byte $00,$00,$73,$73,$70       ;- D 1 - - - 0x01BDA9 0D:BD99:
	.byte $71,$20                   ;- - - - - - 0x01BDAE 0D:BD9E:
	.byte $59,$39                   ;- D 1 - - - 0x01BDB0 0D:BDA0:
	.byte $5F                       ;- - - - - - 0x01BDB2 0D:BDA2:
	.byte $7A,$77,$90,$90,$4E,$00,$92,$94,$D4,$D6,$21,$21;- D 1 - - - 0x01BDB3 0D:BDA3:
	.byte $AB,$1E                   ;- - - - - - 0x01BDBF 0D:BDAF:
	.byte $5E,$43,$76,$8C,$8C,$22,$2C,$41,$F0,$F3,$F0,$A1;- D 1 - - - 0x01BDC1 0D:BDB1:
	.byte $01,$01                   ;- - - - - - 0x01BDCD 0D:BDBD:
	.byte $2E,$43,$B2,$B2,$B2,$A3,$D6,$00;- D 1 - - - 0x01BDCF 0D:BDBF:
	.byte $01                       ;- - - - - - 0x01BDD7 0D:BDC7:
	.byte $23,$E2,$B4,$40,$B9,$4B,$4C,$B4,$43,$E2,$77,$43,$D9,$24,$21;- D 1 - - - 0x01BDD8 0D:BDC8:
	.byte $01,$01                   ;- - - - - - 0x01BDE7 0D:BDD7:
	.byte $90,$7B                   ;- D 1 - - - 0x01BDE9 0D:BDD9:
	.byte $00                       ;- - - - - - 0x01BDEB 0D:BDDB:
	.byte $73,$F4                   ;- D 1 - - - 0x01BDEC 0D:BDDC:
	.byte $01,$01                   ;- - - - - - 0x01BDEE 0D:BDDE:
	.byte $61,$61,$61,$4B,$4C       ;- D 1 - - - 0x01BDF0 0D:BDE0:
	.byte $01                       ;- - - - - - 0x01BDF5 0D:BDE5:
	.byte $2F,$25,$76,$6E,$BE,$8F,$89,$9E,$22,$22,$BC,$BD,$BD,$BD,$B7;- D 1 - - - 0x01BDF6 0D:BDE6:
	.byte $01,$01,$01               ;- - - - - - 0x01BE05 0D:BDF5:
	.byte $2D,$45,$35,$21           ;- D 1 - - - 0x01BE08 0D:BDF8:
	.byte $01,$01                   ;- - - - - - 0x01BE0C 0D:BDFC:
	.byte $00                       ;- D 1 - - - 0x01BE0E 0D:BDFE:
	.byte $00                       ;- - - - - - 0x01BE0F 0D:BDFF:
	.byte $00,$21                   ;- D 1 - - - 0x01BE10 0D:BE00:
	.byte $22                       ;- - - - - - 0x01BE12 0D:BE02:
	.byte $21,$2B,$72,$A0,$00,$24,$23,$21,$21,$D7,$36,$9D,$00,$41,$33,$40;- D 1 - - - 0x01BE13 0D:BE03:
	.byte $42,$40,$47,$81,$82,$43,$43,$56,$56,$56,$21,$A7,$21,$00,$67,$20;- D 1 - - - 0x01BE23 0D:BE13:
	.byte $7B,$7B,$A4,$A4,$A2       ;- D 1 - - - 0x01BE33 0D:BE23:
	.byte $AF                       ;- - - - - - 0x01BE38 0D:BE28:
	.byte $AF,$AF,$20,$3A,$82,$83,$20,$4C,$4D,$4F;- D 1 - - - 0x01BE39 0D:BE29:
	.byte $21                       ;- - - - - - 0x01BE43 0D:BE33:
	.byte $A9,$8A,$20,$20,$B8,$9B,$9F,$9F,$98,$99,$99,$26,$20,$DD,$DF,$A6;- D 1 - - - 0x01BE44 0D:BE34:
	.byte $20                       ;- - - - - - 0x01BE54 0D:BE44:
	.byte $F9,$F7,$00,$99,$FD,$FF,$20,$37,$FB,$F7,$BF,$00,$47,$CA,$BF;- D 1 - - - 0x01BE55 0D:BE45:
	.byte $8C                       ;- - - - - - 0x01BE64 0D:BE54:
	.byte $00,$BE,$E7,$94,$00,$00,$00,$AA,$B9,$00,$BF,$D1,$C3,$B9,$C5,$9C;- D 1 - - - 0x01BE65 0D:BE55:
	.byte $E3,$E6,$00,$E1,$49       ;- D 1 - - - 0x01BE75 0D:BE65:
	.byte $21                       ;- - - - - - 0x01BE7A 0D:BE6A:
	.byte $E5,$E2,$21,$E6,$E7,$5C,$27,$6E,$F3,$E6,$21,$00,$95,$27,$F1,$E6;- D 1 - - - 0x01BE7B 0D:BE6B:
	.byte $74                       ;- D 1 - - - 0x01BE8B 0D:BE7B:
	.byte $E6                       ;- - - - - - 0x01BE8C 0D:BE7C:
	.byte $22,$4F                   ;- D 1 - - - 0x01BE8D 0D:BE7D:
	.byte $8D,$A6                   ;- - - - - - 0x01BE8F 0D:BE7F:
	.byte $71,$73,$66,$21,$21,$6F,$21;- D 1 - - - 0x01BE91 0D:BE81:
	.byte $20                       ;- - - - - - 0x01BE98 0D:BE88:
	.byte $66,$8F,$49,$F6,$F6,$46,$6F,$60;- D 1 - - - 0x01BE99 0D:BE89:
	.byte $22                       ;- - - - - - 0x01BEA1 0D:BE91:
	.byte $DB,$36,$9F,$BE,$00       ;- D 1 - - - 0x01BEA2 0D:BE92:
	.byte $82,$00                   ;- - - - - - 0x01BEA7 0D:BE97:
	.byte $00,$00,$74,$75,$71       ;- D 1 - - - 0x01BEA9 0D:BE99:
	.byte $71,$20                   ;- - - - - - 0x01BEAE 0D:BE9E:
	.byte $5A,$3A                   ;- D 1 - - - 0x01BEB0 0D:BEA0:
	.byte $1E                       ;- - - - - - 0x01BEB2 0D:BEA2:
	.byte $79,$78,$91,$90,$4F,$5B,$93,$95,$D5,$00,$21,$21;- D 1 - - - 0x01BEB3 0D:BEA3:
	.byte $AD,$1E                   ;- - - - - - 0x01BEBF 0D:BEAF:
	.byte $5E,$43,$F5,$AF,$AF,$22,$21,$A0,$F1,$F1,$F1,$41;- D 1 - - - 0x01BEC1 0D:BEB1:
	.byte $01,$01                   ;- - - - - - 0x01BECD 0D:BEBD:
	.byte $24,$A2,$B2,$B2,$B2,$43,$00,$5B;- D 1 - - - 0x01BECF 0D:BEBF:
	.byte $01                       ;- - - - - - 0x01BED7 0D:BEC7:
	.byte $24,$D3,$B4,$B9,$42,$4C,$4D,$00,$43,$E3,$78,$D9,$43,$DB,$F6;- D 1 - - - 0x01BED8 0D:BEC8:
	.byte $01,$01                   ;- - - - - - 0x01BEE7 0D:BED7:
	.byte $91,$7B                   ;- D 1 - - - 0x01BEE9 0D:BED9:
	.byte $00                       ;- - - - - - 0x01BEEB 0D:BEDB:
	.byte $75,$F1                   ;- D 1 - - - 0x01BEEC 0D:BEDC:
	.byte $01,$01                   ;- - - - - - 0x01BEEE 0D:BEDE:
	.byte $61,$61,$3E,$4C,$4D       ;- D 1 - - - 0x01BEF0 0D:BEE0:
	.byte $01                       ;- - - - - - 0x01BEF5 0D:BEE5:
	.byte $2F,$7D,$9D,$6F,$8F,$8F,$8D,$76,$22,$22,$BD,$BD,$BD,$B3,$7B;- D 1 - - - 0x01BEF6 0D:BEE6:
	.byte $01,$01,$01               ;- - - - - - 0x01BF05 0D:BEF5:
	.byte $2E,$46,$90,$21           ;- D 1 - - - 0x01BF08 0D:BEF8:
	.byte $01,$01                   ;- - - - - - 0x01BF0C 0D:BEFC:
	.byte $00                       ;- D 1 - - - 0x01BF0E 0D:BEFE:
	.byte $00                       ;- - - - - - 0x01BF0F 0D:BEFF:
	.byte $01,$01                   ;- D 1 - - - 0x01BF10 0D:BF00:
	.byte $02                       ;- - - - - - 0x01BF12 0D:BF02:
	.byte $22,$01,$22,$01,$01,$01,$01,$22,$22,$01,$01,$01,$31,$31,$31,$31;- D 1 - - - 0x01BF13 0D:BF03:
	.byte $31,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$31,$31,$31;- D 1 - - - 0x01BF23 0D:BF13:
	.byte $30,$30,$01,$01,$31       ;- D 1 - - - 0x01BF33 0D:BF23:
	.byte $02                       ;- - - - - - 0x01BF38 0D:BF28:
	.byte $02,$02,$31,$03,$01,$01,$01,$02,$02,$02;- D 1 - - - 0x01BF39 0D:BF29:
	.byte $02                       ;- - - - - - 0x01BF43 0D:BF33:
	.byte $00,$00,$00,$01,$00,$00,$01,$01,$00,$00,$00,$01,$01,$31,$31,$00;- D 1 - - - 0x01BF44 0D:BF34:
	.byte $03                       ;- - - - - - 0x01BF54 0D:BF44:
	.byte $01,$01,$31,$31,$01,$01,$00,$31,$01,$01,$02,$02,$01,$02,$02;- D 1 - - - 0x01BF55 0D:BF45:
	.byte $03                       ;- - - - - - 0x01BF64 0D:BF54:
	.byte $02,$02,$31,$03,$01,$01,$01,$01,$02,$02,$32,$30,$01,$02,$01,$00;- D 1 - - - 0x01BF65 0D:BF55:
	.byte $01,$31,$01,$00,$00       ;- D 1 - - - 0x01BF75 0D:BF65:
	.byte $00                       ;- - - - - - 0x01BF7A 0D:BF6A:
	.byte $31,$01,$01,$01,$01,$31,$01,$01,$01,$01,$01,$03,$03,$01,$01,$01;- D 1 - - - 0x01BF7B 0D:BF6B:
	.byte $31                       ;- D 1 - - - 0x01BF8B 0D:BF7B:
	.byte $01                       ;- - - - - - 0x01BF8C 0D:BF7C:
	.byte $03,$02                   ;- D 1 - - - 0x01BF8D 0D:BF7D:
	.byte $31,$01                   ;- - - - - - 0x01BF8F 0D:BF7F:
	.byte $01,$30,$00,$30,$30,$30,$00;- D 1 - - - 0x01BF91 0D:BF81:
	.byte $01                       ;- - - - - - 0x01BF98 0D:BF88:
	.byte $00,$00,$30,$00,$00,$00,$00,$03;- D 1 - - - 0x01BF99 0D:BF89:
	.byte $03                       ;- - - - - - 0x01BFA1 0D:BF91:
	.byte $03,$31,$31,$32,$32       ;- D 1 - - - 0x01BFA2 0D:BF92:
	.byte $31,$31                   ;- - - - - - 0x01BFA7 0D:BF97:
	.byte $30,$30,$30,$31,$02       ;- D 1 - - - 0x01BFA9 0D:BF99:
	.byte $02,$03                   ;- - - - - - 0x01BFAE 0D:BF9E:
	.byte $01,$01                   ;- D 1 - - - 0x01BFB0 0D:BFA0:
	.byte $01                       ;- - - - - - 0x01BFB2 0D:BFA2:
	.byte $02,$03,$02,$02,$02,$31,$02,$02,$30,$30,$22,$22;- D 1 - - - 0x01BFB3 0D:BFA3:
	.byte $01,$01                   ;- - - - - - 0x01BFBF 0D:BFAF:
	.byte $33,$01,$03,$02,$02,$02,$03,$01,$01,$01,$01,$01;- D 1 - - - 0x01BFC1 0D:BFB1:
	.byte $01,$01                   ;- - - - - - 0x01BFCD 0D:BFBD:
	.byte $03,$01,$00,$00,$00,$01,$30,$31;- D 1 - - - 0x01BFCF 0D:BFBF:
	.byte $01                       ;- - - - - - 0x01BFD7 0D:BFC7:
	.byte $01,$32,$31,$31,$31,$02,$02,$31,$01,$02,$03,$01,$01,$01,$01;- D 1 - - - 0x01BFD8 0D:BFC8:
	.byte $01,$01                   ;- - - - - - 0x01BFE7 0D:BFD7:
	.byte $02,$03                   ;- D 1 - - - 0x01BFE9 0D:BFD9:
	.byte $31                       ;- - - - - - 0x01BFEB 0D:BFDB:
	.byte $31,$01                   ;- D 1 - - - 0x01BFEC 0D:BFDC:
	.byte $01,$01                   ;- - - - - - 0x01BFEE 0D:BFDE:
	.byte $22,$22,$22,$02,$02       ;- D 1 - - - 0x01BFF0 0D:BFE0:
	.byte $01                       ;- - - - - - 0x01BFF5 0D:BFE5:
	.byte $02,$02,$03,$03,$03,$03,$03,$03,$02,$02,$03,$03,$03,$03,$03;- D 1 - - - 0x01BFF6 0D:BFE6:
	.byte $31,$31,$01               ;- - - - - - 0x01C005 0D:BFF5:
	.byte $00,$00,$02,$22           ;- D 1 - - - 0x01C008 0D:BFF8:
	.byte $01,$01                   ;- - - - - - 0x01C00C 0D:BFFC:
	.byte $30,$10                   ;- D 1 - - - 0x01C00E 0D:BFFE:
