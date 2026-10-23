.segment "BANK_00"
; 0x000010-0x00200F  CPU $8000-$9FFF

; jump table by gameAction (banks 0/1 half)
GameActionDispatch00:
	LDX #$00                        ;C D 0 - - - 0x000010 00:8000: A2 00
	LDY gameAction                  ;C - - - - - 0x000012 00:8002: A4 30
	LDA GameActionDispatch00Tbl_8011,Y;C - - - - - 0x000014 00:8004: B9 11 80
	STA ptr_00                      ;C - - - - - 0x000017 00:8007: 85 00
	LDA GameActionDispatch00Tbl_803B,Y;C - - - - - 0x000019 00:8009: B9 3B 80
	STA ptr_00+1                    ;C - - - - - 0x00001C 00:800C: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x00001E 00:800E: 6C 00 00
GameActionDispatch00Tbl_8011:
	.lobytes GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00;- D 0 - - - 0x000021 00:8011:
	.lobytes GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_0F;- - - - - - 0x000029 00:8019:
	.lobytes GameActionDispatch00Tbl_8011_10, GameActionDispatch00Tbl_8011_11, GameActionDispatch00Tbl_8011_12, GameActionDispatch00Tbl_8011_13, GameActionDispatch00Tbl_8011_14, GameActionDispatch00Tbl_8011_15, GameActionDispatch00Tbl_8011_16, GameActionDispatch00Tbl_8011_17;- D 0 - - - 0x000031 00:8021:
	.lobytes GameActionDispatch00Tbl_8011_18, GameActionDispatch00Tbl_8011_19, GameActionDispatch00Tbl_8011_1A, GameActionDispatch00Tbl_8011_1B, GameActionDispatch00Tbl_8011_1C, GameActionDispatch00Tbl_8011_1D, GameActionDispatch00Tbl_8011_1E, GameActionDispatch00Tbl_8011_1F;- D 0 - - - 0x000039 00:8029:
	.lobytes GameActionDispatch00Tbl_8011_20, GameActionDispatch00Tbl_8011_21, GameActionDispatch00Tbl_8011_22, GameActionDispatch00Tbl_8011_23, GameActionDispatch00Tbl_8011_24, GameActionDispatch00Tbl_8011_25, GameActionDispatch00Tbl_8011_26, GameActionDispatch00Tbl_8011_27;- D 0 - - - 0x000041 00:8031:
	.lobytes GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_29;- D 0 - - - 0x000049 00:8039:
GameActionDispatch00Tbl_803B:
	.hibytes GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00;- D 0 - - - 0x00004B 00:803B:
	.hibytes GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_0F;- - - - - - 0x000053 00:8043:
	.hibytes GameActionDispatch00Tbl_8011_10, GameActionDispatch00Tbl_8011_11, GameActionDispatch00Tbl_8011_12, GameActionDispatch00Tbl_8011_13, GameActionDispatch00Tbl_8011_14, GameActionDispatch00Tbl_8011_15, GameActionDispatch00Tbl_8011_16, GameActionDispatch00Tbl_8011_17;- D 0 - - - 0x00005B 00:804B:
	.hibytes GameActionDispatch00Tbl_8011_18, GameActionDispatch00Tbl_8011_19, GameActionDispatch00Tbl_8011_1A, GameActionDispatch00Tbl_8011_1B, GameActionDispatch00Tbl_8011_1C, GameActionDispatch00Tbl_8011_1D, GameActionDispatch00Tbl_8011_1E, GameActionDispatch00Tbl_8011_1F;- D 0 - - - 0x000063 00:8053:
	.hibytes GameActionDispatch00Tbl_8011_20, GameActionDispatch00Tbl_8011_21, GameActionDispatch00Tbl_8011_22, GameActionDispatch00Tbl_8011_23, GameActionDispatch00Tbl_8011_24, GameActionDispatch00Tbl_8011_25, GameActionDispatch00Tbl_8011_26, GameActionDispatch00Tbl_8011_27;- D 0 - - - 0x00006B 00:805B:
	.hibytes GameActionDispatch00Tbl_8011_00, GameActionDispatch00Tbl_8011_29;- D 0 - - - 0x000073 00:8063:
GameActionDispatch00Tbl_8011_00:
	RTS                             ;C - - J - - 0x000075 00:8065: 60
GameActionDispatch00Tbl_8011_0F:
	LDA objStep                     ;C - - J - - 0x000076 00:8066: AD 00 05
	AND #$01                        ;C - - - - - 0x000079 00:8069: 29 01
	BNE loc_00_8077                 ;C - - - - - 0x00007B 00:806B: D0 0A
	LDA scrollY                     ;C - - - - - 0x00007D 00:806D: A5 FA
	SEC                             ;C - - - - - 0x00007F 00:806F: 38
	SBC #$01                        ;C - - - - - 0x000080 00:8070: E9 01
	STA scrollY                     ;C - - - - - 0x000082 00:8072: 85 FA
	JMP loc_00_807E                 ;C - - - - - 0x000084 00:8074: 4C 7E 80
loc_00_8077:
	LDA scrollY                     ;C - - - - - 0x000087 00:8077: A5 FA
	CLC                             ;C - - - - - 0x000089 00:8079: 18
	ADC #$01                        ;C - - - - - 0x00008A 00:807A: 69 01
	STA scrollY                     ;C - - - - - 0x00008C 00:807C: 85 FA
loc_00_807E:
	DEC objStep                     ;C - - - - - 0x00008E 00:807E: CE 00 05
	LDA playerFacing                ;C - - - - - 0x000091 00:8081: A5 31
	AND #$01                        ;C - - - - - 0x000093 00:8083: 29 01
	BEQ loc_00_808D                 ;C - - - - - 0x000095 00:8085: F0 06
	JSR ApplyVelXSub                ;C - - - - - 0x000097 00:8087: 20 A1 F1
	JMP loc_00_8090                 ;C - - - - - 0x00009A 00:808A: 4C 90 80
loc_00_808D:
	JSR ApplyVelXAdd                ;C - - - - - 0x00009D 00:808D: 20 83 F1
loc_00_8090:
	LDY #$02                        ;C - - - - - 0x0000A0 00:8090: A0 02
	JSR MoveYGravityCheck           ;C - - - - - 0x0000A2 00:8092: 20 19 F1
	BCC loc_00_809A                 ;C - - - - - 0x0000A5 00:8095: 90 03
	JMP loc_00_80AE                 ;C - - - - - 0x0000A7 00:8097: 4C AE 80
loc_00_809A:
	LDA objVelYHi                   ;C - - - - - 0x0000AA 00:809A: AD 30 04
	BPL loc_00_80C4                 ;C - - - - - 0x0000AD 00:809D: 10 25
	LDA playerGroundY               ;C - - - - - 0x0000AF 00:809F: A5 36
	CLC                             ;C - - - - - 0x0000B1 00:80A1: 18
	ADC #$02                        ;C - - - - - 0x0000B2 00:80A2: 69 02
	CMP objY                        ;C - - - - - 0x0000B4 00:80A4: CD C0 03
	BCS loc_00_80C4                 ;C - - - - - 0x0000B7 00:80A7: B0 1B
	LDA playerGroundY               ;C - - - - - 0x0000B9 00:80A9: A5 36
	STA objY                        ;C - - - - - 0x0000BB 00:80AB: 8D C0 03
loc_00_80AE:
	LDA #$1C                        ;C - - - - - 0x0000BE 00:80AE: A9 1C
	JSR QueueSound                  ;C - - - - - 0x0000C0 00:80B0: 20 4C F3
	LDA #$00                        ;C - - - - - 0x0000C3 00:80B3: A9 00
	STA scrollY                     ;C - - - - - 0x0000C5 00:80B5: 85 FA
	STA actionStep                  ;C - - - - - 0x0000C7 00:80B7: 85 35
	LDA #$02                        ;C - - - - - 0x0000C9 00:80B9: A9 02
	STA gameAction                  ;C - - - - - 0x0000CB 00:80BB: 85 30
	LDA #$03                        ;C - - - - - 0x0000CD 00:80BD: A9 03
	STA actionTimer                 ;C - - - - - 0x0000CF 00:80BF: 85 37
	JSR ResetPlayerStand            ;C - - - - - 0x0000D1 00:80C1: 20 AA CE
loc_00_80C4:
	RTS                             ;C - - - - - 0x0000D4 00:80C4: 60
GameActionDispatch00Tbl_8011_10:
	LDA #$00                        ;C - - J - - 0x0000D5 00:80C5: A9 00
	STA timerA3                     ;C - - - - - 0x0000D7 00:80C7: 85 A3
	LDA objActive                   ;C - - - - - 0x0000D9 00:80C9: AD 00 03
	AND #$0F                        ;C - - - - - 0x0000DC 00:80CC: 29 0F
	BNE loc_00_810E                 ;C - - - - - 0x0000DE 00:80CE: D0 3E
	LDA #$18                        ;C - - - - - 0x0000E0 00:80D0: A9 18
	STA objStep                     ;C - - - - - 0x0000E2 00:80D2: 8D 00 05
	LDY playerLevel                 ;C - - - - - 0x0000E5 00:80D5: A4 6B
	LDA GameActionDispatch00Tbl_817A,Y;C - - - - - 0x0000E7 00:80D7: B9 7A 81
	STA objStep+1                   ;C - - - - - 0x0000EA 00:80DA: 8D 01 05
	LDA #$30                        ;C - - - - - 0x0000ED 00:80DD: A9 30
	CMP objAnim                     ;C - - - - - 0x0000EF 00:80DF: CD 80 05
	BEQ loc_00_810E                 ;C - - - - - 0x0000F2 00:80E2: F0 2A
	JSR SetPlayerAnim               ;C - - - - - 0x0000F4 00:80E4: 20 94 F2
	LDA #$0B                        ;C - - - - - 0x0000F7 00:80E7: A9 0B
	JSR SetChrBank2                 ;C - - - - - 0x0000F9 00:80E9: 20 40 F4
	INC objActive                   ;C - - - - - 0x0000FC 00:80EC: EE 00 03
	LDA #$00                        ;C - - - - - 0x0000FF 00:80EF: A9 00
	STA objVelXLo                   ;C - - - - - 0x000101 00:80F1: 8D 00 04
	LDA #$03                        ;C - - - - - 0x000104 00:80F4: A9 03
	STA objVelXHi                   ;C - - - - - 0x000106 00:80F6: 8D 10 04
	LDA playerFacing                ;C - - - - - 0x000109 00:80F9: A5 31
	AND #$01                        ;C - - - - - 0x00010B 00:80FB: 29 01
	BEQ loc_00_8106                 ;C - - - - - 0x00010D 00:80FD: F0 07
	JSR ClearPlayerFlag40           ;C - - - - - 0x00010F 00:80FF: 20 48 F0
	LDA #$02                        ;C - - - - - 0x000112 00:8102: A9 02
	BNE loc_00_810B                 ;C - - - - - 0x000114 00:8104: D0 05
loc_00_8106:
	JSR SetPlayerFlag40             ;C - - - - - 0x000116 00:8106: 20 3F F0
	LDA #$01                        ;C - - - - - 0x000119 00:8109: A9 01
loc_00_810B:
	STA objFacing                   ;C - - - - - 0x00011B 00:810B: 8D 60 04
loc_00_810E:
	LDA objStep                     ;C - - - - - 0x00011E 00:810E: AD 00 05
	BEQ loc_00_8117                 ;C - - - - - 0x000121 00:8111: F0 04
	DEC objStep                     ;C - - - - - 0x000123 00:8113: CE 00 05
	RTS                             ;C - - - - - 0x000126 00:8116: 60
loc_00_8117:
	LDA #$3D                        ;C - - - - - 0x000127 00:8117: A9 3D
	CMP objAnim                     ;C - - - - - 0x000129 00:8119: CD 80 05
	BEQ loc_00_8132                 ;C - - - - - 0x00012C 00:811C: F0 14
	JSR SetPlayerAnim               ;C - - - - - 0x00012E 00:811E: 20 94 F2
	LDA #$0A                        ;C - - - - - 0x000131 00:8121: A9 0A
	JSR SetChrBank2                 ;C - - - - - 0x000133 00:8123: 20 40 F4
	LDA #$2C                        ;C - - - - - 0x000136 00:8126: A9 2C
	JSR QueueSound                  ;C - - - - - 0x000138 00:8128: 20 4C F3
	LDA #$1A                        ;C - - - - - 0x00013B 00:812B: A9 1A
	STA attackType                  ;C - - - - - 0x00013D 00:812D: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x00013F 00:812F: 20 3B F4
loc_00_8132:
	LDA objFacing                   ;C - - - - - 0x000142 00:8132: AD 60 04
	AND #$01                        ;C - - - - - 0x000145 00:8135: 29 01
	BNE loc_00_814B                 ;C - - - - - 0x000147 00:8137: D0 12
	LDY #$00                        ;C - - - - - 0x000149 00:8139: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x00014B 00:813B: 20 00 F0
	LDA objX                        ;C - - - - - 0x00014E 00:813E: AD 60 03
	SEC                             ;C - - - - - 0x000151 00:8141: 38
	SBC scrollX                     ;C - - - - - 0x000152 00:8142: E5 FC
	CMP #$F0                        ;C - - - - - 0x000154 00:8144: C9 F0
	BCC loc_00_815A                 ;C - - - - - 0x000156 00:8146: 90 12
	JMP loc_00_8177                 ;C - - - - - 0x000158 00:8148: 4C 77 81
loc_00_814B:
	LDY #$01                        ;C - - - - - 0x00015B 00:814B: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x00015D 00:814D: 20 51 F0
	LDA objX                        ;C - - - - - 0x000160 00:8150: AD 60 03
	SEC                             ;C - - - - - 0x000163 00:8153: 38
	SBC scrollX                     ;C - - - - - 0x000164 00:8154: E5 FC
	CMP #$18                        ;C - - - - - 0x000166 00:8156: C9 18
	BCC loc_00_8177                 ;C - - - - - 0x000168 00:8158: 90 1D
loc_00_815A:
	LDA objStep+1                   ;C - - - - - 0x00016A 00:815A: AD 01 05
	BEQ loc_00_8177                 ;C - - - - - 0x00016D 00:815D: F0 18
	DEC objStep+1                   ;C - - - - - 0x00016F 00:815F: CE 01 05
	LDA objActive+15                ;C - - - - - 0x000172 00:8162: AD 0F 03
	BPL loc_00_8176                 ;C - - - - - 0x000175 00:8165: 10 0F
	LDA objAnim+15                  ;C - - - - - 0x000177 00:8167: AD 8F 05
	CMP #$7E                        ;C - - - - - 0x00017A 00:816A: C9 7E
	BNE loc_00_8176                 ;C - - - - - 0x00017C 00:816C: D0 08
	LDA #$00                        ;C - - - - - 0x00017E 00:816E: A9 00
	STA objStep+1                   ;C - - - - - 0x000180 00:8170: 8D 01 05
	JSR ClearTimerA4                ;C - - - - - 0x000183 00:8173: 20 36 F4
loc_00_8176:
	RTS                             ;C - - - - - 0x000186 00:8176: 60
loc_00_8177:
	JMP loc_00_8F82                 ;C - - - - - 0x000187 00:8177: 4C 82 8F
GameActionDispatch00Tbl_817A:
	.byte $18                       ;- - - - - - 0x00018A 00:817A:
	.byte $16,$1A,$20               ;- D 0 - - - 0x00018B 00:817B:
GameActionDispatch00Tbl_8011_11:
	LDY playerId                    ;C - - J - - 0x00018E 00:817E: A4 34
	LDA GameActionDispatch00Tbl_818D,Y;C - - - - - 0x000190 00:8180: B9 8D 81
	STA ptr_00                      ;C - - - - - 0x000193 00:8183: 85 00
	LDA GameActionDispatch00Tbl_8190,Y;C - - - - - 0x000195 00:8185: B9 90 81
	STA ptr_00+1                    ;C - - - - - 0x000198 00:8188: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x00019A 00:818A: 6C 00 00
GameActionDispatch00Tbl_818D:
	.lobytes GameActionDispatch00Tbl_818D_00, GameActionDispatch00Tbl_818D_01, GameActionDispatch00Tbl_818D_02;- D 0 - - - 0x00019D 00:818D:
GameActionDispatch00Tbl_8190:
	.hibytes GameActionDispatch00Tbl_818D_00, GameActionDispatch00Tbl_818D_01, GameActionDispatch00Tbl_818D_02;- D 0 - - - 0x0001A0 00:8190:
GameActionDispatch00Tbl_818D_00:
	LDA objAnimFrame                ;C - - J - - 0x0001A3 00:8193: AD 70 05
	CMP #$02                        ;C - - - - - 0x0001A6 00:8196: C9 02
	BNE loc_00_81FA                 ;C - - - - - 0x0001A8 00:8198: D0 60
	LDA objAnimFlags                ;C - - - - - 0x0001AA 00:819A: AD 90 05
	BNE loc_00_81FA                 ;C - - - - - 0x0001AD 00:819D: D0 5B
	LDY #$02                        ;C - - - - - 0x0001AF 00:819F: A0 02
loc_00_81A1:
	LDA objActive,Y                 ;C - - - - - 0x0001B1 00:81A1: B9 00 03
	BPL loc_00_81AC                 ;C - - - - - 0x0001B4 00:81A4: 10 06
	DEY                             ;c - - - - - 0x0001B6 00:81A6: 88
	CPY #$00                        ;c - - - - - 0x0001B7 00:81A7: C0 00
	BNE loc_00_81A1                 ;c - - - - - 0x0001B9 00:81A9: D0 F6
	RTS                             ;c - - - - - 0x0001BB 00:81AB: 60
loc_00_81AC:
	STY ptr_0E+1                    ;C - - - - - 0x0001BC 00:81AC: 84 0F
	LDA playerFacing                ;C - - - - - 0x0001BE 00:81AE: A5 31
	STA objFacing,Y                 ;C - - - - - 0x0001C0 00:81B0: 99 60 04
	AND #$02                        ;C - - - - - 0x0001C3 00:81B3: 29 02
	TAY                             ;C - - - - - 0x0001C5 00:81B5: A8
	LDA objX                        ;C - - - - - 0x0001C6 00:81B6: AD 60 03
	CLC                             ;C - - - - - 0x0001C9 00:81B9: 18
	ADC GameActionDispatch00Tbl_8219,Y;C - - - - - 0x0001CA 00:81BA: 79 19 82
	PHA                             ;C - - - - - 0x0001CD 00:81BD: 48
	LDA objXPage                    ;C - - - - - 0x0001CE 00:81BE: AD 80 03
	ADC GameActionDispatch00Tbl_821A,Y;C - - - - - 0x0001D1 00:81C1: 79 1A 82
	LDY ptr_0E+1                    ;C - - - - - 0x0001D4 00:81C4: A4 0F
	STA objXPage,Y                  ;C - - - - - 0x0001D6 00:81C6: 99 80 03
	PLA                             ;C - - - - - 0x0001D9 00:81C9: 68
	STA objX,Y                      ;C - - - - - 0x0001DA 00:81CA: 99 60 03
	LDA objY                        ;C - - - - - 0x0001DD 00:81CD: AD C0 03
	CLC                             ;C - - - - - 0x0001E0 00:81D0: 18
	ADC #$04                        ;C - - - - - 0x0001E1 00:81D1: 69 04
	STA objY,Y                      ;C - - - - - 0x0001E3 00:81D3: 99 C0 03
	LDA objYPage                    ;C - - - - - 0x0001E6 00:81D6: AD E0 03
	STA objYPage,Y                  ;C - - - - - 0x0001E9 00:81D9: 99 E0 03
	LDA #$1B                        ;C - - - - - 0x0001EC 00:81DC: A9 1B
	JSR QueueSound                  ;C - - - - - 0x0001EE 00:81DE: 20 4C F3
	LDA #$4D                        ;C - - - - - 0x0001F1 00:81E1: A9 4D
	JSR SetAnimY                    ;C - - - - - 0x0001F3 00:81E3: 20 A0 F2
	LDA #$6C                        ;C - - - - - 0x0001F6 00:81E6: A9 6C
	STA objKind,Y                   ;C - - - - - 0x0001F8 00:81E8: 99 20 03
	STA objId,Y                     ;C - - - - - 0x0001FB 00:81EB: 99 30 03
	LDA #$0A                        ;C - - - - - 0x0001FE 00:81EE: A9 0A
	STA attackType                  ;C - - - - - 0x000200 00:81F0: 85 A7
	LDA #$00                        ;C - - - - - 0x000202 00:81F2: A9 00
	STA objAtkBox,Y                 ;C - - - - - 0x000204 00:81F4: 99 40 04
	STA objMoveMode,Y               ;C - - - - - 0x000207 00:81F7: 99 70 04
loc_00_81FA:
	LDA objAnimFrame                ;C - - - - - 0x00020A 00:81FA: AD 70 05
	CMP #$09                        ;C - - - - - 0x00020D 00:81FD: C9 09
	BNE loc_00_8218                 ;C - - - - - 0x00020F 00:81FF: D0 17
	LDA objAnimFlags                ;C - - - - - 0x000211 00:8201: AD 90 05
	CMP #$02                        ;C - - - - - 0x000214 00:8204: C9 02
	BNE loc_00_8218                 ;C - - - - - 0x000216 00:8206: D0 10
	LDA #$00                        ;C - - - - - 0x000218 00:8208: A9 00
	STA weaponHeld                  ;C - - - - - 0x00021A 00:820A: 85 A9
	STA gameAction                  ;C - - - - - 0x00021C 00:820C: 85 30
	LDY playerId                    ;C - - - - - 0x00021E 00:820E: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000220 00:8210: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000223 00:8213: 85 6F
	JSR ResetPlayerStand            ;C - - - - - 0x000225 00:8215: 20 AA CE
loc_00_8218:
	RTS                             ;C - - - - - 0x000228 00:8218: 60
GameActionDispatch00Tbl_8219:
	.byte $12                       ;- D 0 - - - 0x000229 00:8219:
GameActionDispatch00Tbl_821A:
	.byte $00                       ;- D 0 - - - 0x00022A 00:821A:
	.byte $EE,$FF                   ;- - - - - - 0x00022B 00:821B:
GameActionDispatch00Tbl_818D_01:
	LDA objAnimFrame                ;C - - J - - 0x00022D 00:821D: AD 70 05
	CMP #$02                        ;C - - - - - 0x000230 00:8220: C9 02
	BNE loc_00_8284                 ;C - - - - - 0x000232 00:8222: D0 60
	LDA objAnimFlags                ;C - - - - - 0x000234 00:8224: AD 90 05
	BNE loc_00_8284                 ;C - - - - - 0x000237 00:8227: D0 5B
	LDY #$02                        ;C - - - - - 0x000239 00:8229: A0 02
loc_00_822B:
	LDA objActive,Y                 ;C - - - - - 0x00023B 00:822B: B9 00 03
	BPL loc_00_8236                 ;C - - - - - 0x00023E 00:822E: 10 06
	DEY                             ;c - - - - - 0x000240 00:8230: 88
	CPY #$00                        ;c - - - - - 0x000241 00:8231: C0 00
	BNE loc_00_822B                 ;c - - - - - 0x000243 00:8233: D0 F6
	RTS                             ;c - - - - - 0x000245 00:8235: 60
loc_00_8236:
	STY ptr_0E+1                    ;C - - - - - 0x000246 00:8236: 84 0F
	LDA playerFacing                ;C - - - - - 0x000248 00:8238: A5 31
	STA objFacing,Y                 ;C - - - - - 0x00024A 00:823A: 99 60 04
	AND #$02                        ;C - - - - - 0x00024D 00:823D: 29 02
	TAY                             ;C - - - - - 0x00024F 00:823F: A8
	LDA objX                        ;C - - - - - 0x000250 00:8240: AD 60 03
	CLC                             ;C - - - - - 0x000253 00:8243: 18
	ADC GameActionDispatch00Tbl_82AB,Y;C - - - - - 0x000254 00:8244: 79 AB 82
	PHA                             ;C - - - - - 0x000257 00:8247: 48
	LDA objXPage                    ;C - - - - - 0x000258 00:8248: AD 80 03
	ADC GameActionDispatch00Tbl_82AC,Y;C - - - - - 0x00025B 00:824B: 79 AC 82
	LDY ptr_0E+1                    ;C - - - - - 0x00025E 00:824E: A4 0F
	STA objXPage,Y                  ;C - - - - - 0x000260 00:8250: 99 80 03
	PLA                             ;C - - - - - 0x000263 00:8253: 68
	STA objX,Y                      ;C - - - - - 0x000264 00:8254: 99 60 03
	LDA objY                        ;C - - - - - 0x000267 00:8257: AD C0 03
	CLC                             ;C - - - - - 0x00026A 00:825A: 18
	ADC #$04                        ;C - - - - - 0x00026B 00:825B: 69 04
	STA objY,Y                      ;C - - - - - 0x00026D 00:825D: 99 C0 03
	LDA objYPage                    ;C - - - - - 0x000270 00:8260: AD E0 03
	STA objYPage,Y                  ;C - - - - - 0x000273 00:8263: 99 E0 03
	LDA #$1B                        ;C - - - - - 0x000276 00:8266: A9 1B
	JSR QueueSound                  ;C - - - - - 0x000278 00:8268: 20 4C F3
	LDA #$5F                        ;C - - - - - 0x00027B 00:826B: A9 5F
	JSR SetAnimY                    ;C - - - - - 0x00027D 00:826D: 20 A0 F2
	LDA #$6D                        ;C - - - - - 0x000280 00:8270: A9 6D
	STA objKind,Y                   ;C - - - - - 0x000282 00:8272: 99 20 03
	STA objId,Y                     ;C - - - - - 0x000285 00:8275: 99 30 03
	LDA #$0A                        ;C - - - - - 0x000288 00:8278: A9 0A
	STA attackType                  ;C - - - - - 0x00028A 00:827A: 85 A7
	LDA #$00                        ;C - - - - - 0x00028C 00:827C: A9 00
	STA objAtkBox,Y                 ;C - - - - - 0x00028E 00:827E: 99 40 04
	STA objMoveMode,Y               ;C - - - - - 0x000291 00:8281: 99 70 04
loc_00_8284:
	LDA objAnimFrame                ;C - - - - - 0x000294 00:8284: AD 70 05
	CMP #$09                        ;C - - - - - 0x000297 00:8287: C9 09
	BNE loc_00_82AA                 ;C - - - - - 0x000299 00:8289: D0 1F
	LDA objAnimFlags                ;C - - - - - 0x00029B 00:828B: AD 90 05
	CMP #$02                        ;C - - - - - 0x00029E 00:828E: C9 02
	BNE loc_00_82AA                 ;C - - - - - 0x0002A0 00:8290: D0 18
	DEC ram_00AD                    ;C - - - - - 0x0002A2 00:8292: C6 AD
	LDA ram_00AD                    ;C - - - - - 0x0002A4 00:8294: A5 AD
	BPL loc_00_829C                 ;C - - - - - 0x0002A6 00:8296: 10 04
	LDA #$00                        ;C - - - - - 0x0002A8 00:8298: A9 00
	STA weaponHeld                  ;C - - - - - 0x0002AA 00:829A: 85 A9
loc_00_829C:
	LDA #$00                        ;C - - - - - 0x0002AC 00:829C: A9 00
	STA gameAction                  ;C - - - - - 0x0002AE 00:829E: 85 30
	LDY playerId                    ;C - - - - - 0x0002B0 00:82A0: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x0002B2 00:82A2: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x0002B5 00:82A5: 85 6F
	JSR ResetPlayerStand            ;C - - - - - 0x0002B7 00:82A7: 20 AA CE
loc_00_82AA:
	RTS                             ;C - - - - - 0x0002BA 00:82AA: 60
GameActionDispatch00Tbl_82AB:
	.byte $08                       ;- D 0 - - - 0x0002BB 00:82AB:
GameActionDispatch00Tbl_82AC:
	.byte $00,$F8,$FF               ;- D 0 - - - 0x0002BC 00:82AC:
GameActionDispatch00Tbl_818D_02:
	LDA objAnimFrame                ;C - - J - - 0x0002BF 00:82AF: AD 70 05
	BNE loc_00_82B9                 ;C - - - - - 0x0002C2 00:82B2: D0 05
	LDA #$1D                        ;C - - - - - 0x0002C4 00:82B4: A9 1D
	JSR QueueSound                  ;C - - - - - 0x0002C6 00:82B6: 20 4C F3
loc_00_82B9:
	LDA objAnimFrame                ;C - - - - - 0x0002C9 00:82B9: AD 70 05
	CMP #$06                        ;C - - - - - 0x0002CC 00:82BC: C9 06
	BNE loc_00_82CC                 ;C - - - - - 0x0002CE 00:82BE: D0 0C
	LDA objAnimFlags                ;C - - - - - 0x0002D0 00:82C0: AD 90 05
	BNE loc_00_82CC                 ;C - - - - - 0x0002D3 00:82C3: D0 07
	LDA #$0E                        ;C - - - - - 0x0002D5 00:82C5: A9 0E
	STA attackType                  ;C - - - - - 0x0002D7 00:82C7: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x0002D9 00:82C9: 20 3B F4
loc_00_82CC:
	LDA objAnimFrame                ;C - - - - - 0x0002DC 00:82CC: AD 70 05
	CMP #$09                        ;C - - - - - 0x0002DF 00:82CF: C9 09
	BNE loc_00_82DB                 ;C - - - - - 0x0002E1 00:82D1: D0 08
	LDA objAnimFlags                ;C - - - - - 0x0002E3 00:82D3: AD 90 05
	BNE loc_00_82DB                 ;C - - - - - 0x0002E6 00:82D6: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x0002E8 00:82D8: 20 36 F4
loc_00_82DB:
	LDA objAnimFrame                ;C - - - - - 0x0002EB 00:82DB: AD 70 05
	CMP #$0C                        ;C - - - - - 0x0002EE 00:82DE: C9 0C
	BNE loc_00_82FF                 ;C - - - - - 0x0002F0 00:82E0: D0 1D
	LDA #$00                        ;C - - - - - 0x0002F2 00:82E2: A9 00
	STA gameAction                  ;C - - - - - 0x0002F4 00:82E4: 85 30
	LDY playerId                    ;C - - - - - 0x0002F6 00:82E6: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x0002F8 00:82E8: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x0002FB 00:82EB: 85 6F
	LDA weaponHeld                  ;C - - - - - 0x0002FD 00:82ED: A5 A9
	BNE loc_00_82F5                 ;C - - - - - 0x0002FF 00:82EF: D0 04
	LDA #$03                        ;c - - - - - 0x000301 00:82F1: A9 03
	BNE loc_00_82F7                 ;c - - - - - 0x000303 00:82F3: D0 02
loc_00_82F5:
	LDA #$44                        ;C - - - - - 0x000305 00:82F5: A9 44
loc_00_82F7:
	JSR SetPlayerAnim               ;C - - - - - 0x000307 00:82F7: 20 94 F2
	LDA #$08                        ;C - - - - - 0x00030A 00:82FA: A9 08
	JSR SetChrBank2                 ;C - - - - - 0x00030C 00:82FC: 20 40 F4
loc_00_82FF:
	RTS                             ;C - - - - - 0x00030F 00:82FF: 60
GameActionDispatch00Tbl_8011_12:
	LDA #$00                        ;C - - J - - 0x000310 00:8300: A9 00
	STA objAnimFlags                ;C - - - - - 0x000312 00:8302: 8D 90 05
	STA objAnimFrame                ;C - - - - - 0x000315 00:8305: 8D 70 05
	LDA objVelYHi                   ;C - - - - - 0x000318 00:8308: AD 30 04
	BMI loc_00_8314                 ;C - - - - - 0x00031B 00:830B: 30 07
	LDA gameAction                  ;C - - - - - 0x00031D 00:830D: A5 30
	BNE loc_00_8314                 ;C - - - - - 0x00031F 00:830F: D0 03
	JSR SetHopVelY                  ;c - - - - - 0x000321 00:8311: 20 6E F2
loc_00_8314:
	LDX #$00                        ;C - - - - - 0x000324 00:8314: A2 00
	LDY #$02                        ;C - - - - - 0x000326 00:8316: A0 02
	JSR MoveYGravityCheck           ;C - - - - - 0x000328 00:8318: 20 19 F1
	BCS loc_00_833B                 ;C - - - - - 0x00032B 00:831B: B0 1E
	LDA objVelYHi                   ;C - - - - - 0x00032D 00:831D: AD 30 04
	BMI loc_00_8325                 ;C - - - - - 0x000330 00:8320: 30 03
	JMP loc_00_83A1                 ;C - - - - - 0x000332 00:8322: 4C A1 83
loc_00_8325:
	LDA objY                        ;C - - - - - 0x000335 00:8325: AD C0 03
	CLC                             ;C - - - - - 0x000338 00:8328: 18
	ADC #$02                        ;C - - - - - 0x000339 00:8329: 69 02
	CMP playerGroundY               ;C - - - - - 0x00033B 00:832B: C5 36
	BCC loc_00_83A1                 ;C - - - - - 0x00033D 00:832D: 90 72
	BEQ loc_00_8338                 ;C - - - - - 0x00033F 00:832F: F0 07
	SBC #$03                        ;C - - - - - 0x000341 00:8331: E9 03
	STA objY                        ;C - - - - - 0x000343 00:8333: 8D C0 03
	BNE loc_00_833B                 ;C - - - - - 0x000346 00:8336: D0 03
loc_00_8338:
	STA objY                        ;C - - - - - 0x000348 00:8338: 8D C0 03
loc_00_833B:
	LDA objAnim                     ;C - - - - - 0x00034B 00:833B: AD 80 05
	CMP #$48                        ;C - - - - - 0x00034E 00:833E: C9 48
	BEQ loc_00_8374                 ;C - - - - - 0x000350 00:8340: F0 32
	LDA #$1C                        ;c - - - - - 0x000352 00:8342: A9 1C
	JSR QueueSound                  ;c - - - - - 0x000354 00:8344: 20 4C F3
	LDA #$02                        ;c - - - - - 0x000357 00:8347: A9 02
	STA gameAction                  ;c - - - - - 0x000359 00:8349: 85 30
	LDA #$03                        ;c - - - - - 0x00035B 00:834B: A9 03
	STA actionTimer                 ;c - - - - - 0x00035D 00:834D: 85 37
	JSR ClearTimerA4                ;c - - - - - 0x00035F 00:834F: 20 36 F4
	JSR ResetPlayerStand            ;c - - - - - 0x000362 00:8352: 20 AA CE
	LDY grabbedSlot                 ;c - - - - - 0x000365 00:8355: A4 39
	LDA objId,Y                     ;c - - - - - 0x000367 00:8357: B9 30 03
	STA objKind,Y                   ;c - - - - - 0x00036A 00:835A: 99 20 03
	LDA #$FF                        ;c - - - - - 0x00036D 00:835D: A9 FF
	STA objGrabState,Y              ;c - - - - - 0x00036F 00:835F: 99 F0 03
	LDA objState,Y                  ;c - - - - - 0x000372 00:8362: B9 10 03
	STA objActive,Y                 ;c - - - - - 0x000375 00:8365: 99 00 03
	LDA #$00                        ;c - - - - - 0x000378 00:8368: A9 00
	STA objMoveMode,Y               ;c - - - - - 0x00037A 00:836A: 99 70 04
	LDA objY                        ;c - - - - - 0x00037D 00:836D: AD C0 03
	STA objY,Y                      ;c - - - - - 0x000380 00:8370: 99 C0 03
	RTS                             ;c - - - - - 0x000383 00:8373: 60
loc_00_8374:
	LDA #$0A                        ;C - - - - - 0x000384 00:8374: A9 0A
	JSR SetChrBank2                 ;C - - - - - 0x000386 00:8376: 20 40 F4
	LDA #$49                        ;C - - - - - 0x000389 00:8379: A9 49
	JSR SetPlayerAnim               ;C - - - - - 0x00038B 00:837B: 20 94 F2
	LDA #$20                        ;C - - - - - 0x00038E 00:837E: A9 20
	JSR QueueSound                  ;C - - - - - 0x000390 00:8380: 20 4C F3
	LDA #$0F                        ;C - - - - - 0x000393 00:8383: A9 0F
	STA gameAction                  ;C - - - - - 0x000395 00:8385: 85 30
	LDA #$48                        ;C - - - - - 0x000397 00:8387: A9 48
	STA objVelYLo                   ;C - - - - - 0x000399 00:8389: 8D 20 04
	LDA #$02                        ;C - - - - - 0x00039C 00:838C: A9 02
	STA objVelYHi                   ;C - - - - - 0x00039E 00:838E: 8D 30 04
	LDA #$00                        ;C - - - - - 0x0003A1 00:8391: A9 00
	STA objVelXLo                   ;C - - - - - 0x0003A3 00:8393: 8D 00 04
	LDA #$01                        ;C - - - - - 0x0003A6 00:8396: A9 01
	STA objVelXLo                   ;C - - - - - 0x0003A8 00:8398: 8D 00 04
	LDA #$10                        ;C - - - - - 0x0003AB 00:839B: A9 10
	STA objStep                     ;C - - - - - 0x0003AD 00:839D: 8D 00 05
	RTS                             ;C - - - - - 0x0003B0 00:83A0: 60
loc_00_83A1:
	LDA objVelYHi                   ;C - - - - - 0x0003B1 00:83A1: AD 30 04
	BMI loc_00_83BE                 ;C - - - - - 0x0003B4 00:83A4: 30 18
	LDA padPressed                  ;C - - - - - 0x0003B6 00:83A6: A5 14
	CMP #$40                        ;C - - - - - 0x0003B8 00:83A8: C9 40
	BNE loc_00_83BE                 ;C - - - - - 0x0003BA 00:83AA: D0 12
	LDA #$0A                        ;C - - - - - 0x0003BC 00:83AC: A9 0A
	JSR SetChrBank2                 ;C - - - - - 0x0003BE 00:83AE: 20 40 F4
	LDA #$48                        ;C - - - - - 0x0003C1 00:83B1: A9 48
	JSR SetPlayerAnim               ;C - - - - - 0x0003C3 00:83B3: 20 94 F2
	LDA #$FF                        ;C - - - - - 0x0003C6 00:83B6: A9 FF
	STA playerBusy                  ;C - - - - - 0x0003C8 00:83B8: 85 6E
	LDA #$09                        ;C - - - - - 0x0003CA 00:83BA: A9 09
	STA attackType                  ;C - - - - - 0x0003CC 00:83BC: 85 A7
loc_00_83BE:
	LDY grabbedSlot                 ;C - - - - - 0x0003CE 00:83BE: A4 39
	LDA objAnim                     ;C - - - - - 0x0003D0 00:83C0: AD 80 05
	CMP #$48                        ;C - - - - - 0x0003D3 00:83C3: C9 48
	BNE loc_00_83D3                 ;C - - - - - 0x0003D5 00:83C5: D0 0C
	LDA objY                        ;C - - - - - 0x0003D7 00:83C7: AD C0 03
	CLC                             ;C - - - - - 0x0003DA 00:83CA: 18
	ADC #$04                        ;C - - - - - 0x0003DB 00:83CB: 69 04
	STA objY,Y                      ;C - - - - - 0x0003DD 00:83CD: 99 C0 03
	JMP loc_00_83DC                 ;C - - - - - 0x0003E0 00:83D0: 4C DC 83
loc_00_83D3:
	LDA objY                        ;C - - - - - 0x0003E3 00:83D3: AD C0 03
	SEC                             ;C - - - - - 0x0003E6 00:83D6: 38
	SBC #$0C                        ;C - - - - - 0x0003E7 00:83D7: E9 0C
	STA objY,Y                      ;C - - - - - 0x0003E9 00:83D9: 99 C0 03
loc_00_83DC:
	LDA #$0E                        ;C - - - - - 0x0003EC 00:83DC: A9 0E
	STA objKind,Y                   ;C - - - - - 0x0003EE 00:83DE: 99 20 03
	LDA actionStep                  ;C - - - - - 0x0003F1 00:83E1: A5 35
	BNE loc_00_83F1                 ;C - - - - - 0x0003F3 00:83E3: D0 0C
	LDX #$00                        ;C - - - - - 0x0003F5 00:83E5: A2 00
	LDA padHeld                     ;C - - - - - 0x0003F7 00:83E7: A5 16
	AND #$03                        ;C - - - - - 0x0003F9 00:83E9: 29 03
	BEQ loc_00_8446                 ;C - - - - - 0x0003FB 00:83EB: F0 59
	INC actionStep                  ;C - - - - - 0x0003FD 00:83ED: E6 35
	STA ram_0032                    ;C - - - - - 0x0003FF 00:83EF: 85 32
loc_00_83F1:
	LDA ram_0032                    ;C - - - - - 0x000401 00:83F1: A5 32
	AND #$01                        ;C - - - - - 0x000403 00:83F3: 29 01
	BEQ loc_00_8447                 ;C - - - - - 0x000405 00:83F5: F0 50
	LDA objX                        ;C - - - - - 0x000407 00:83F7: AD 60 03
	SEC                             ;C - - - - - 0x00040A 00:83FA: 38
	SBC scrollX                     ;C - - - - - 0x00040B 00:83FB: E5 FC
	CMP #$F1                        ;C - - - - - 0x00040D 00:83FD: C9 F1
	BEQ loc_00_8446                 ;C - - - - - 0x00040F 00:83FF: F0 45
	BCS loc_00_8446                 ;C - - - - - 0x000411 00:8401: B0 43
	JSR ApplyVelXAdd                ;C - - - - - 0x000413 00:8403: 20 83 F1
	LDY grabbedSlot                 ;C - - - - - 0x000416 00:8406: A4 39
	LDA playerFacing                ;C - - - - - 0x000418 00:8408: A5 31
	CMP #$01                        ;C - - - - - 0x00041A 00:840A: C9 01
	BEQ loc_00_841D                 ;C - - - - - 0x00041C 00:840C: F0 0F
	LDA objX                        ;C - - - - - 0x00041E 00:840E: AD 60 03
	SEC                             ;C - - - - - 0x000421 00:8411: 38
	SBC scrollX                     ;C - - - - - 0x000422 00:8412: E5 FC
	CMP #$F1                        ;C - - - - - 0x000424 00:8414: C9 F1
	BEQ loc_00_8446                 ;C - - - - - 0x000426 00:8416: F0 2E
	BCS loc_00_8446                 ;C - - - - - 0x000428 00:8418: B0 2C
	JMP loc_00_8429                 ;C - - - - - 0x00042A 00:841A: 4C 29 84
loc_00_841D:
	LDA objX,Y                      ;C - - - - - 0x00042D 00:841D: B9 60 03
	SEC                             ;C - - - - - 0x000430 00:8420: 38
	SBC scrollX                     ;C - - - - - 0x000431 00:8421: E5 FC
	CMP #$F9                        ;C - - - - - 0x000433 00:8423: C9 F9
	BEQ loc_00_8446                 ;C - - - - - 0x000435 00:8425: F0 1F
	BCS loc_00_8446                 ;C - - - - - 0x000437 00:8427: B0 1D
loc_00_8429:
	LDA objXFrac,Y                  ;C - - - - - 0x000439 00:8429: B9 40 03
	CLC                             ;C - - - - - 0x00043C 00:842C: 18
	ADC objVelXLo                   ;C - - - - - 0x00043D 00:842D: 6D 00 04
	STA objXFrac,Y                  ;C - - - - - 0x000440 00:8430: 99 40 03
	LDA objX,Y                      ;C - - - - - 0x000443 00:8433: B9 60 03
	ADC objVelXHi                   ;C - - - - - 0x000446 00:8436: 6D 10 04
	STA objX,Y                      ;C - - - - - 0x000449 00:8439: 99 60 03
	BCC loc_00_8446                 ;C - - - - - 0x00044C 00:843C: 90 08
	LDA objXPage,Y                  ;C - - - - - 0x00044E 00:843E: B9 80 03
	ADC #$00                        ;C - - - - - 0x000451 00:8441: 69 00
	STA objXPage,Y                  ;C - - - - - 0x000453 00:8443: 99 80 03
loc_00_8446:
	RTS                             ;C - - - - - 0x000456 00:8446: 60
loc_00_8447:
	LDA objX                        ;C - - - - - 0x000457 00:8447: AD 60 03
	SEC                             ;C - - - - - 0x00045A 00:844A: 38
	SBC scrollX                     ;C - - - - - 0x00045B 00:844B: E5 FC
	CMP #$19                        ;C - - - - - 0x00045D 00:844D: C9 19
	BEQ loc_00_8496                 ;C - - - - - 0x00045F 00:844F: F0 45
	BCC loc_00_8496                 ;C - - - - - 0x000461 00:8451: 90 43
	JSR ApplyVelXSub                ;C - - - - - 0x000463 00:8453: 20 A1 F1
	LDY grabbedSlot                 ;C - - - - - 0x000466 00:8456: A4 39
	LDA playerFacing                ;C - - - - - 0x000468 00:8458: A5 31
	CMP #$01                        ;C - - - - - 0x00046A 00:845A: C9 01
	BEQ loc_00_846D                 ;C - - - - - 0x00046C 00:845C: F0 0F
	LDA objX,Y                      ;C - - - - - 0x00046E 00:845E: B9 60 03
	SEC                             ;C - - - - - 0x000471 00:8461: 38
	SBC scrollX                     ;C - - - - - 0x000472 00:8462: E5 FC
	CMP #$11                        ;C - - - - - 0x000474 00:8464: C9 11
	BEQ loc_00_8496                 ;C - - - - - 0x000476 00:8466: F0 2E
	BCC loc_00_8496                 ;C - - - - - 0x000478 00:8468: 90 2C
	JMP loc_00_8479                 ;C - - - - - 0x00047A 00:846A: 4C 79 84
loc_00_846D:
	LDA objX                        ;C - - - - - 0x00047D 00:846D: AD 60 03
	SEC                             ;C - - - - - 0x000480 00:8470: 38
	SBC scrollX                     ;C - - - - - 0x000481 00:8471: E5 FC
	CMP #$19                        ;C - - - - - 0x000483 00:8473: C9 19
	BEQ loc_00_8496                 ;C - - - - - 0x000485 00:8475: F0 1F
	BCC loc_00_8496                 ;C - - - - - 0x000487 00:8477: 90 1D
loc_00_8479:
	LDA objXFrac,Y                  ;C - - - - - 0x000489 00:8479: B9 40 03
	SEC                             ;C - - - - - 0x00048C 00:847C: 38
	SBC objVelXLo                   ;C - - - - - 0x00048D 00:847D: ED 00 04
	STA objXFrac,Y                  ;C - - - - - 0x000490 00:8480: 99 40 03
	LDA objX,Y                      ;C - - - - - 0x000493 00:8483: B9 60 03
	SBC objVelXHi                   ;C - - - - - 0x000496 00:8486: ED 10 04
	STA objX,Y                      ;C - - - - - 0x000499 00:8489: 99 60 03
	BCS loc_00_8496                 ;C - - - - - 0x00049C 00:848C: B0 08
	LDA objXPage,Y                  ;C - - - - - 0x00049E 00:848E: B9 80 03
	SBC #$00                        ;C - - - - - 0x0004A1 00:8491: E9 00
	STA objXPage,Y                  ;C - - - - - 0x0004A3 00:8493: 99 80 03
loc_00_8496:
	RTS                             ;C - - - - - 0x0004A6 00:8496: 60
loc_00_8497:
	LDA #$21                        ;C - - - - - 0x0004A7 00:8497: A9 21
	STA gameAction                  ;C - - - - - 0x0004A9 00:8499: 85 30
	RTS                             ;C - - - - - 0x0004AB 00:849B: 60
GameActionDispatch00Tbl_8011_13:
	LDA objActive                   ;C - - J - - 0x0004AC 00:849C: AD 00 03
	AND #$0F                        ;C - - - - - 0x0004AF 00:849F: 29 0F
	BNE loc_00_8511                 ;C - - - - - 0x0004B1 00:84A1: D0 6E
	LDA padHeld                     ;C - - - - - 0x0004B3 00:84A3: A5 16
	AND #$0F                        ;C - - - - - 0x0004B5 00:84A5: 29 0F
	BEQ loc_00_8497                 ;C - - - - - 0x0004B7 00:84A7: F0 EE
	CMP playerFacing                ;C - - - - - 0x0004B9 00:84A9: C5 31
	BEQ loc_00_84CB                 ;C - - - - - 0x0004BB 00:84AB: F0 1E
	LDA #$33                        ;C - - - - - 0x0004BD 00:84AD: A9 33
	JSR QueueSound                  ;C - - - - - 0x0004BF 00:84AF: 20 4C F3
	LDA #$80                        ;C - - - - - 0x0004C2 00:84B2: A9 80
	STA playerBusy                  ;C - - - - - 0x0004C4 00:84B4: 85 6E
	LDY grabbedSlot                 ;C - - - - - 0x0004C6 00:84B6: A4 39
	LDA objFacing,Y                 ;C - - - - - 0x0004C8 00:84B8: B9 60 04
	AND #$03                        ;C - - - - - 0x0004CB 00:84BB: 29 03
	CMP playerFacing                ;C - - - - - 0x0004CD 00:84BD: C5 31
	BEQ loc_00_84E2                 ;C - - - - - 0x0004CF 00:84BF: F0 21
	LDA objFacing,Y                 ;C - - - - - 0x0004D1 00:84C1: B9 60 04
	EOR #$03                        ;C - - - - - 0x0004D4 00:84C4: 49 03
	STA objFacing,Y                 ;C - - - - - 0x0004D6 00:84C6: 99 60 04
	BNE loc_00_84E2                 ;C - - - - - 0x0004D9 00:84C9: D0 17
loc_00_84CB:
	LDA #$FF                        ;C - - - - - 0x0004DB 00:84CB: A9 FF
	STA objMoveMode,Y               ;C - - - - - 0x0004DD 00:84CD: 99 70 04
	LDA playerFacing                ;C - - - - - 0x0004E0 00:84D0: A5 31
	AND #$01                        ;C - - - - - 0x0004E2 00:84D2: 29 01
	BEQ loc_00_84DD                 ;C - - - - - 0x0004E4 00:84D4: F0 07
	JSR ClearPlayerFlag40           ;C - - - - - 0x0004E6 00:84D6: 20 48 F0
	LDA #$02                        ;C - - - - - 0x0004E9 00:84D9: A9 02
	BNE loc_00_84E2                 ;C - - - - - 0x0004EB 00:84DB: D0 05
loc_00_84DD:
	JSR SetPlayerFlag40             ;C - - - - - 0x0004ED 00:84DD: 20 3F F0
	LDA #$01                        ;C - - - - - 0x0004F0 00:84E0: A9 01
loc_00_84E2:
	STA playerFacing                ;C - - - - - 0x0004F2 00:84E2: 85 31
	LDA #$35                        ;C - - - - - 0x0004F4 00:84E4: A9 35
	JSR SetPlayerAnim               ;C - - - - - 0x0004F6 00:84E6: 20 94 F2
	LDY grabbedSlot                 ;C - - - - - 0x0004F9 00:84E9: A4 39
	LDA #$0F                        ;C - - - - - 0x0004FB 00:84EB: A9 0F
	STA objKind,Y                   ;C - - - - - 0x0004FD 00:84ED: 99 20 03
	LDA #$80                        ;C - - - - - 0x000500 00:84F0: A9 80
	STA objActive,Y                 ;C - - - - - 0x000502 00:84F2: 99 00 03
	LDA objFacing,Y                 ;C - - - - - 0x000505 00:84F5: B9 60 04
	AND #$01                        ;C - - - - - 0x000508 00:84F8: 29 01
	BEQ loc_00_8506                 ;C - - - - - 0x00050A 00:84FA: F0 0A
	LDA objFlags,Y                  ;C - - - - - 0x00050C 00:84FC: B9 60 05
	AND #$BF                        ;C - - - - - 0x00050F 00:84FF: 29 BF
	STA objFlags,Y                  ;C - - - - - 0x000511 00:8501: 99 60 05
	BNE loc_00_850E                 ;C - - - - - 0x000514 00:8504: D0 08
loc_00_8506:
	LDA objFlags,Y                  ;C - - - - - 0x000516 00:8506: B9 60 05
	ORA #$40                        ;C - - - - - 0x000519 00:8509: 09 40
	STA objFlags,Y                  ;C - - - - - 0x00051B 00:850B: 99 60 05
loc_00_850E:
	INC objActive                   ;C - - - - - 0x00051E 00:850E: EE 00 03
loc_00_8511:
	LDA objAnim                     ;C - - - - - 0x000521 00:8511: AD 80 05
	CMP #$5C                        ;C - - - - - 0x000524 00:8514: C9 5C
	BEQ loc_00_8532                 ;C - - - - - 0x000526 00:8516: F0 1A
	LDA objAnimFrame                ;C - - - - - 0x000528 00:8518: AD 70 05
	CMP #$0C                        ;C - - - - - 0x00052B 00:851B: C9 0C
	BNE loc_00_8531                 ;C - - - - - 0x00052D 00:851D: D0 12
	LDA #$5C                        ;C - - - - - 0x00052F 00:851F: A9 5C
	JSR SetPlayerAnim               ;C - - - - - 0x000531 00:8521: 20 94 F2
	LDA #$05                        ;C - - - - - 0x000534 00:8524: A9 05
	JSR SetChrBank2                 ;C - - - - - 0x000536 00:8526: 20 40 F4
	LDA #$00                        ;C - - - - - 0x000539 00:8529: A9 00
	STA objStep                     ;C - - - - - 0x00053B 00:852B: 8D 00 05
	STA objParamA                   ;C - - - - - 0x00053E 00:852E: 8D 10 05
loc_00_8531:
	RTS                             ;C - - - - - 0x000541 00:8531: 60
loc_00_8532:
	LDA #$00                        ;C - - - - - 0x000542 00:8532: A9 00
	STA timerA4                     ;C - - - - - 0x000544 00:8534: 85 A4
	STA timerA3                     ;C - - - - - 0x000546 00:8536: 85 A3
	LDA #$09                        ;C - - - - - 0x000548 00:8538: A9 09
	STA actionTimer                 ;C - - - - - 0x00054A 00:853A: 85 37
	LDA #$0B                        ;C - - - - - 0x00054C 00:853C: A9 0B
	STA gameAction                  ;C - - - - - 0x00054E 00:853E: 85 30
loc_00_8540:
	RTS                             ;C - - - - - 0x000550 00:8540: 60
GameActionDispatch00Tbl_8011_14:
	LDA objAnim                     ;C - - J - - 0x000551 00:8541: AD 80 05
	CMP #$3E                        ;C - - - - - 0x000554 00:8544: C9 3E
	BEQ loc_00_8559                 ;C - - - - - 0x000556 00:8546: F0 11
	LDA #$07                        ;C - - - - - 0x000558 00:8548: A9 07
	STA attackType                  ;C - - - - - 0x00055A 00:854A: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x00055C 00:854C: 20 3B F4
	LDA #$89                        ;C - - - - - 0x00055F 00:854F: A9 89
	STA objVelXLo                   ;C - - - - - 0x000561 00:8551: 8D 00 04
	LDA #$06                        ;C - - - - - 0x000564 00:8554: A9 06
	STA objVelXHi                   ;C - - - - - 0x000566 00:8556: 8D 10 04
loc_00_8559:
	LDA objActive                   ;C - - - - - 0x000569 00:8559: AD 00 03
	AND #$0F                        ;C - - - - - 0x00056C 00:855C: 29 0F
	BNE loc_00_8579                 ;C - - - - - 0x00056E 00:855E: D0 19
	LDA objAnimFrame                ;C - - - - - 0x000570 00:8560: AD 70 05
	CMP #$04                        ;C - - - - - 0x000573 00:8563: C9 04
	BNE loc_00_8540                 ;C - - - - - 0x000575 00:8565: D0 D9
	LDA objAnimFlags                ;C - - - - - 0x000577 00:8567: AD 90 05
	CMP #$01                        ;C - - - - - 0x00057A 00:856A: C9 01
	BNE loc_00_8540                 ;C - - - - - 0x00057C 00:856C: D0 D2
	INC objActive                   ;C - - - - - 0x00057E 00:856E: EE 00 03
	LDA #$00                        ;C - - - - - 0x000581 00:8571: A9 00
	STA objStep                     ;C - - - - - 0x000583 00:8573: 8D 00 05
	STA objParamA                   ;C - - - - - 0x000586 00:8576: 8D 10 05
loc_00_8579:
	LDA objAnimFrame                ;C - - - - - 0x000589 00:8579: AD 70 05
	CMP #$06                        ;C - - - - - 0x00058C 00:857C: C9 06
	BCS loc_00_85A2                 ;C - - - - - 0x00058E 00:857E: B0 22
	LDA objAnim                     ;C - - - - - 0x000590 00:8580: AD 80 05
	CMP #$3E                        ;C - - - - - 0x000593 00:8583: C9 3E
	BEQ loc_00_85A2                 ;C - - - - - 0x000595 00:8585: F0 1B
	LDA #$38                        ;C - - - - - 0x000597 00:8587: A9 38
	STA objVelYLo                   ;C - - - - - 0x000599 00:8589: 8D 20 04
	LDA #$04                        ;C - - - - - 0x00059C 00:858C: A9 04
	STA objVelYHi                   ;C - - - - - 0x00059E 00:858E: 8D 30 04
	LDA objVelYHi                   ;C - - - - - 0x0005A1 00:8591: AD 30 04
	CMP #$03                        ;C - - - - - 0x0005A4 00:8594: C9 03
	BCC loc_00_85A2                 ;C - - - - - 0x0005A6 00:8596: 90 0A
	JSR ArmTimerA4                  ;C - - - - - 0x0005A8 00:8598: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x0005AB 00:859B: A5 36
	STA jumpBaseY                   ;C - - - - - 0x0005AD 00:859D: 85 A6
	JMP loc_00_85AA                 ;C - - - - - 0x0005AF 00:859F: 4C AA 85
loc_00_85A2:
	LDA #$00                        ;C - - - - - 0x0005B2 00:85A2: A9 00
	STA objVelXLo                   ;C - - - - - 0x0005B4 00:85A4: 8D 00 04
	STA objVelXHi                   ;C - - - - - 0x0005B7 00:85A7: 8D 10 04
loc_00_85AA:
	LDA playerFacing                ;C - - - - - 0x0005BA 00:85AA: A5 31
	AND #$02                        ;C - - - - - 0x0005BC 00:85AC: 29 02
	BNE loc_00_85B9                 ;C - - - - - 0x0005BE 00:85AE: D0 09
	JSR SetObjFlag40                ;C - - - - - 0x0005C0 00:85B0: 20 90 F0
	JSR ApplyVelXAdd                ;C - - - - - 0x0005C3 00:85B3: 20 83 F1
	JMP loc_00_85BF                 ;C - - - - - 0x0005C6 00:85B6: 4C BF 85
loc_00_85B9:
	JSR ClearObjFlag40              ;C - - - - - 0x0005C9 00:85B9: 20 99 F0
	JSR ApplyVelXSub                ;C - - - - - 0x0005CC 00:85BC: 20 A1 F1
loc_00_85BF:
	LDY #$00                        ;C - - - - - 0x0005CF 00:85BF: A0 00
	JSR MoveYGravityCheck           ;C - - - - - 0x0005D1 00:85C1: 20 19 F1
	BCC loc_00_85C9                 ;C - - - - - 0x0005D4 00:85C4: 90 03
	JMP loc_00_85FE                 ;C - - - - - 0x0005D6 00:85C6: 4C FE 85
loc_00_85C9:
	LDA objVelYHi                   ;C - - - - - 0x0005D9 00:85C9: AD 30 04
	BPL loc_00_862C                 ;C - - - - - 0x0005DC 00:85CC: 10 5E
	JSR ClearTimerA4                ;C - - - - - 0x0005DE 00:85CE: 20 36 F4
	LDA objActive                   ;C - - - - - 0x0005E1 00:85D1: AD 00 03
	AND #$02                        ;C - - - - - 0x0005E4 00:85D4: 29 02
	BNE loc_00_85EA                 ;C - - - - - 0x0005E6 00:85D6: D0 12
	LDA #$3E                        ;C - - - - - 0x0005E8 00:85D8: A9 3E
	CMP objAnim                     ;C - - - - - 0x0005EA 00:85DA: CD 80 05
	BEQ loc_00_85EA                 ;C - - - - - 0x0005ED 00:85DD: F0 0B
	JSR SetPlayerAnim               ;C - - - - - 0x0005EF 00:85DF: 20 94 F2
	LDA #$01                        ;C - - - - - 0x0005F2 00:85E2: A9 01
	JSR SetChrBank2                 ;C - - - - - 0x0005F4 00:85E4: 20 40 F4
	INC objActive                   ;C - - - - - 0x0005F7 00:85E7: EE 00 03
loc_00_85EA:
	LDA playerGroundY               ;C - - - - - 0x0005FA 00:85EA: A5 36
	CLC                             ;C - - - - - 0x0005FC 00:85EC: 18
	ADC #$02                        ;C - - - - - 0x0005FD 00:85ED: 69 02
	CMP objY                        ;C - - - - - 0x0005FF 00:85EF: CD C0 03
	BCS loc_00_863D                 ;C - - - - - 0x000602 00:85F2: B0 49
	BEQ loc_00_85F9                 ;C - - - - - 0x000604 00:85F4: F0 03
	JMP loc_00_85F9                 ;C - - - - - 0x000606 00:85F6: 4C F9 85
loc_00_85F9:
	LDA playerGroundY               ;C - - - - - 0x000609 00:85F9: A5 36
	STA objY                        ;C - - - - - 0x00060B 00:85FB: 8D C0 03
loc_00_85FE:
	LDA #$02                        ;C - - - - - 0x00060E 00:85FE: A9 02
	STA gameAction                  ;C - - - - - 0x000610 00:8600: 85 30
	LDA #$00                        ;C - - - - - 0x000612 00:8602: A9 00
	STA ram_00B3                    ;C - - - - - 0x000614 00:8604: 85 B3
	STA playerBusy                  ;C - - - - - 0x000616 00:8606: 85 6E
	STA timerA3                     ;C - - - - - 0x000618 00:8608: 85 A3
	LDA #$C0                        ;C - - - - - 0x00061A 00:860A: A9 C0
	STA objVelYLo                   ;C - - - - - 0x00061C 00:860C: 8D 20 04
	LDA #$FF                        ;C - - - - - 0x00061F 00:860F: A9 FF
	STA objVelYHi                   ;C - - - - - 0x000621 00:8611: 8D 30 04
	LDA #$33                        ;C - - - - - 0x000624 00:8614: A9 33
	STA objVelXLo                   ;C - - - - - 0x000626 00:8616: 8D 00 04
	LDA #$01                        ;C - - - - - 0x000629 00:8619: A9 01
	STA objVelXHi                   ;C - - - - - 0x00062B 00:861B: 8D 10 04
	LDA #$00                        ;C - - - - - 0x00062E 00:861E: A9 00
	STA objStep                     ;C - - - - - 0x000630 00:8620: 8D 00 05
	STA objParamA                   ;C - - - - - 0x000633 00:8623: 8D 10 05
	LDA #$80                        ;C - - - - - 0x000636 00:8626: A9 80
	STA objActive                   ;C - - - - - 0x000638 00:8628: 8D 00 03
	RTS                             ;C - - - - - 0x00063B 00:862B: 60
loc_00_862C:
	LDA objAnimFrame                ;C - - - - - 0x00063C 00:862C: AD 70 05
	CMP #$09                        ;C - - - - - 0x00063F 00:862F: C9 09
	BNE loc_00_863D                 ;C - - - - - 0x000641 00:8631: D0 0A
	LDA #$09                        ;C - - - - - 0x000643 00:8633: A9 09
	STA objAnimFrame                ;C - - - - - 0x000645 00:8635: 8D 70 05
	LDA #$00                        ;C - - - - - 0x000648 00:8638: A9 00
	STA objAnimFlags                ;C - - - - - 0x00064A 00:863A: 8D 90 05
loc_00_863D:
	RTS                             ;C - - - - - 0x00064D 00:863D: 60
loc_00_863E:
	LDA #$21                        ;C - - - - - 0x00064E 00:863E: A9 21
	STA gameAction                  ;C - - - - - 0x000650 00:8640: 85 30
	RTS                             ;C - - - - - 0x000652 00:8642: 60
GameActionDispatch00Tbl_8011_15:
	LDA objActive                   ;C - - J - - 0x000653 00:8643: AD 00 03
	AND #$0F                        ;C - - - - - 0x000656 00:8646: 29 0F
	BNE loc_00_86B8                 ;C - - - - - 0x000658 00:8648: D0 6E
	LDA #$80                        ;C - - - - - 0x00065A 00:864A: A9 80
	STA playerBusy                  ;C - - - - - 0x00065C 00:864C: 85 6E
	LDY grabbedSlot                 ;C - - - - - 0x00065E 00:864E: A4 39
	LDA padHeld                     ;C - - - - - 0x000660 00:8650: A5 16
	AND #$0F                        ;C - - - - - 0x000662 00:8652: 29 0F
	BEQ loc_00_863E                 ;C - - - - - 0x000664 00:8654: F0 E8
	CMP playerFacing                ;C - - - - - 0x000666 00:8656: C5 31
	BEQ loc_00_866D                 ;C - - - - - 0x000668 00:8658: F0 13
	LDA objFacing,Y                 ;C - - - - - 0x00066A 00:865A: B9 60 04
	AND #$03                        ;C - - - - - 0x00066D 00:865D: 29 03
	CMP playerFacing                ;C - - - - - 0x00066F 00:865F: C5 31
	BEQ loc_00_8684                 ;C - - - - - 0x000671 00:8661: F0 21
	LDA objFacing,Y                 ;C - - - - - 0x000673 00:8663: B9 60 04
	EOR #$03                        ;C - - - - - 0x000676 00:8666: 49 03
	STA objFacing,Y                 ;C - - - - - 0x000678 00:8668: 99 60 04
	BNE loc_00_8684                 ;C - - - - - 0x00067B 00:866B: D0 17
loc_00_866D:
	LDA #$FF                        ;C - - - - - 0x00067D 00:866D: A9 FF
	STA objMoveMode,Y               ;C - - - - - 0x00067F 00:866F: 99 70 04
	LDA playerFacing                ;C - - - - - 0x000682 00:8672: A5 31
	AND #$01                        ;C - - - - - 0x000684 00:8674: 29 01
	BEQ loc_00_867F                 ;C - - - - - 0x000686 00:8676: F0 07
	JSR ClearPlayerFlag40           ;C - - - - - 0x000688 00:8678: 20 48 F0
	LDA #$02                        ;C - - - - - 0x00068B 00:867B: A9 02
	BNE loc_00_8684                 ;C - - - - - 0x00068D 00:867D: D0 05
loc_00_867F:
	JSR SetPlayerFlag40             ;C - - - - - 0x00068F 00:867F: 20 3F F0
	LDA #$01                        ;C - - - - - 0x000692 00:8682: A9 01
loc_00_8684:
	STA playerFacing                ;C - - - - - 0x000694 00:8684: 85 31
	LDA #$36                        ;C - - - - - 0x000696 00:8686: A9 36
	JSR SetPlayerAnim               ;C - - - - - 0x000698 00:8688: 20 94 F2
	LDA #$0A                        ;C - - - - - 0x00069B 00:868B: A9 0A
	JSR SetChrBank2                 ;C - - - - - 0x00069D 00:868D: 20 40 F4
	LDY grabbedSlot                 ;C - - - - - 0x0006A0 00:8690: A4 39
	LDA #$08                        ;C - - - - - 0x0006A2 00:8692: A9 08
	STA objKind,Y                   ;C - - - - - 0x0006A4 00:8694: 99 20 03
	LDA #$80                        ;C - - - - - 0x0006A7 00:8697: A9 80
	STA objActive,Y                 ;C - - - - - 0x0006A9 00:8699: 99 00 03
	LDA objFacing,Y                 ;C - - - - - 0x0006AC 00:869C: B9 60 04
	AND #$01                        ;C - - - - - 0x0006AF 00:869F: 29 01
	BEQ loc_00_86AD                 ;C - - - - - 0x0006B1 00:86A1: F0 0A
	LDA objFlags,Y                  ;C - - - - - 0x0006B3 00:86A3: B9 60 05
	AND #$BF                        ;C - - - - - 0x0006B6 00:86A6: 29 BF
	STA objFlags,Y                  ;C - - - - - 0x0006B8 00:86A8: 99 60 05
	BNE loc_00_86B5                 ;C - - - - - 0x0006BB 00:86AB: D0 08
loc_00_86AD:
	LDA objFlags,Y                  ;C - - - - - 0x0006BD 00:86AD: B9 60 05
	ORA #$40                        ;C - - - - - 0x0006C0 00:86B0: 09 40
	STA objFlags,Y                  ;C - - - - - 0x0006C2 00:86B2: 99 60 05
loc_00_86B5:
	INC objActive                   ;C - - - - - 0x0006C5 00:86B5: EE 00 03
loc_00_86B8:
	LDA objAnim                     ;C - - - - - 0x0006C8 00:86B8: AD 80 05
	CMP #$36                        ;C - - - - - 0x0006CB 00:86BB: C9 36
	BNE loc_00_86D0                 ;C - - - - - 0x0006CD 00:86BD: D0 11
	LDA objAnimFlags                ;C - - - - - 0x0006CF 00:86BF: AD 90 05
	CMP #$04                        ;C - - - - - 0x0006D2 00:86C2: C9 04
	BNE loc_00_86D0                 ;C - - - - - 0x0006D4 00:86C4: D0 0A
	LDA #$52                        ;C - - - - - 0x0006D6 00:86C6: A9 52
	JSR SetPlayerAnim               ;C - - - - - 0x0006D8 00:86C8: 20 94 F2
	LDA #$0B                        ;C - - - - - 0x0006DB 00:86CB: A9 0B
	JSR SetChrBank2                 ;C - - - - - 0x0006DD 00:86CD: 20 40 F4
loc_00_86D0:
	LDA objAnim                     ;C - - - - - 0x0006E0 00:86D0: AD 80 05
	CMP #$52                        ;C - - - - - 0x0006E3 00:86D3: C9 52
	BNE loc_00_86EF                 ;C - - - - - 0x0006E5 00:86D5: D0 18
	LDA objAnimFrame                ;C - - - - - 0x0006E7 00:86D7: AD 70 05
	CMP #$12                        ;C - - - - - 0x0006EA 00:86DA: C9 12
	BNE loc_00_86EF                 ;C - - - - - 0x0006EC 00:86DC: D0 11
	LDA objAnimFlags                ;C - - - - - 0x0006EE 00:86DE: AD 90 05
	CMP #$02                        ;C - - - - - 0x0006F1 00:86E1: C9 02
	BNE loc_00_86EF                 ;C - - - - - 0x0006F3 00:86E3: D0 0A
	LDA #$4C                        ;C - - - - - 0x0006F5 00:86E5: A9 4C
	JSR SetPlayerAnim               ;C - - - - - 0x0006F7 00:86E7: 20 94 F2
	LDA #$0A                        ;C - - - - - 0x0006FA 00:86EA: A9 0A
	JSR SetChrBank2                 ;C - - - - - 0x0006FC 00:86EC: 20 40 F4
loc_00_86EF:
	LDA objAnim                     ;C - - - - - 0x0006FF 00:86EF: AD 80 05
	CMP #$4C                        ;C - - - - - 0x000702 00:86F2: C9 4C
	BNE loc_00_86FE                 ;C - - - - - 0x000704 00:86F4: D0 08
	LDA #$02                        ;C - - - - - 0x000706 00:86F6: A9 02
	STA actionTimer                 ;C - - - - - 0x000708 00:86F8: 85 37
	LDA #$0B                        ;C - - - - - 0x00070A 00:86FA: A9 0B
	STA gameAction                  ;C - - - - - 0x00070C 00:86FC: 85 30
loc_00_86FE:
	RTS                             ;C - - - - - 0x00070E 00:86FE: 60
GameActionDispatch00Tbl_8011_16:
	LDA objActive                   ;C - - J - - 0x00070F 00:86FF: AD 00 03
	AND #$0F                        ;C - - - - - 0x000712 00:8702: 29 0F
	BNE loc_00_8711                 ;C - - - - - 0x000714 00:8704: D0 0B
	STA objVelXLo                   ;C - - - - - 0x000716 00:8706: 8D 00 04
	LDA #$01                        ;C - - - - - 0x000719 00:8709: A9 01
	STA objVelXHi                   ;C - - - - - 0x00071B 00:870B: 8D 10 04
	INC objActive                   ;C - - - - - 0x00071E 00:870E: EE 00 03
loc_00_8711:
	LDA objAnimFrame                ;C - - - - - 0x000721 00:8711: AD 70 05
	CMP #$06                        ;C - - - - - 0x000724 00:8714: C9 06
	BCC loc_00_8728                 ;C - - - - - 0x000726 00:8716: 90 10
	LDA padHeld                     ;C - - - - - 0x000728 00:8718: A5 16
	CMP #$40                        ;C - - - - - 0x00072A 00:871A: C9 40
	BNE loc_00_8728                 ;C - - - - - 0x00072C 00:871C: D0 0A
	LDA #$33                        ;C - - - - - 0x00072E 00:871E: A9 33
	STA objVelXLo                   ;C - - - - - 0x000730 00:8720: 8D 00 04
	LDA #$02                        ;C - - - - - 0x000733 00:8723: A9 02
	STA objVelXHi                   ;C - - - - - 0x000735 00:8725: 8D 10 04
loc_00_8728:
	LDA objAnimFrame                ;C - - - - - 0x000738 00:8728: AD 70 05
	TAY                             ;C - - - - - 0x00073B 00:872B: A8
	LDA GameActionDispatch00Tbl_8903,Y;C - - - - - 0x00073C 00:872C: B9 03 89
	STA attackType                  ;C - - - - - 0x00073F 00:872F: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x000741 00:8731: 20 3B F4
	LDA drawOrderToggle             ;C - - - - - 0x000744 00:8734: A5 95
	AND #$07                        ;C - - - - - 0x000746 00:8736: 29 07
	BNE loc_00_873F                 ;C - - - - - 0x000748 00:8738: D0 05
	LDA #$13                        ;C - - - - - 0x00074A 00:873A: A9 13
	JSR QueueSound                  ;C - - - - - 0x00074C 00:873C: 20 4C F3
loc_00_873F:
	LDA playerGroundY               ;C - - - - - 0x00074F 00:873F: A5 36
	STA jumpBaseY                   ;C - - - - - 0x000751 00:8741: 85 A6
	LDA objAnimFlags                ;C - - - - - 0x000753 00:8743: AD 90 05
	CMP #$02                        ;C - - - - - 0x000756 00:8746: C9 02
	BCC loc_00_874D                 ;C - - - - - 0x000758 00:8748: 90 03
	JSR ClearTimerA4                ;C - - - - - 0x00075A 00:874A: 20 36 F4
loc_00_874D:
	LDA objAnimFrame                ;C - - - - - 0x00075D 00:874D: AD 70 05
	CMP #$13                        ;C - - - - - 0x000760 00:8750: C9 13
	BNE loc_00_8790                 ;C - - - - - 0x000762 00:8752: D0 3C
	LDA objAnimFlags                ;C - - - - - 0x000764 00:8754: AD 90 05
	CMP #$04                        ;C - - - - - 0x000767 00:8757: C9 04
	BNE loc_00_8790                 ;C - - - - - 0x000769 00:8759: D0 35
	LDA #$00                        ;C - - - - - 0x00076B 00:875B: A9 00
	STA gameAction                  ;C - - - - - 0x00076D 00:875D: 85 30
	STA timerA4                     ;C - - - - - 0x00076F 00:875F: 85 A4
	STA timerA3                     ;C - - - - - 0x000771 00:8761: 85 A3
	LDA #$80                        ;C - - - - - 0x000773 00:8763: A9 80
	STA objActive                   ;C - - - - - 0x000775 00:8765: 8D 00 03
	LDY playerId                    ;C - - - - - 0x000778 00:8768: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x00077A 00:876A: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x00077D 00:876D: 85 6F
	JSR ResetPlayerStand            ;C - - - - - 0x00077F 00:876F: 20 AA CE
	LDA ram_00BF                    ;C - - - - - 0x000782 00:8772: A5 BF
	BEQ loc_00_8783                 ;C - - - - - 0x000784 00:8774: F0 0D
	LDA playerHealth                ;C - - - - - 0x000786 00:8776: A5 3A
	SEC                             ;C - - - - - 0x000788 00:8778: 38
	SBC #$06                        ;C - - - - - 0x000789 00:8779: E9 06
	STA playerHealth                ;C - - - - - 0x00078B 00:877B: 85 3A
	BPL loc_00_8783                 ;C - - - - - 0x00078D 00:877D: 10 04
	LDA #$00                        ;C - - - - - 0x00078F 00:877F: A9 00
	STA playerHealth                ;C - - - - - 0x000791 00:8781: 85 3A
loc_00_8783:
	LDA #$00                        ;C - - - - - 0x000793 00:8783: A9 00
	STA ram_00BF                    ;C - - - - - 0x000795 00:8785: 85 BF
	STA objVelXLo                   ;C - - - - - 0x000797 00:8787: 8D 00 04
	LDA #$01                        ;C - - - - - 0x00079A 00:878A: A9 01
	STA objVelXHi                   ;C - - - - - 0x00079C 00:878C: 8D 10 04
	RTS                             ;C - - - - - 0x00079F 00:878F: 60
loc_00_8790:
	LDA objActive                   ;C - - - - - 0x0007A0 00:8790: AD 00 03
	AND #$02                        ;C - - - - - 0x0007A3 00:8793: 29 02
	BNE loc_00_87B8                 ;C - - - - - 0x0007A5 00:8795: D0 21
	LDA playerFacing                ;C - - - - - 0x0007A7 00:8797: A5 31
	AND #$01                        ;C - - - - - 0x0007A9 00:8799: 29 01
	BEQ loc_00_87A5                 ;C - - - - - 0x0007AB 00:879B: F0 08
	LDY #$00                        ;C - - - - - 0x0007AD 00:879D: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x0007AF 00:879F: 20 00 F0
	JMP loc_00_87AA                 ;C - - - - - 0x0007B2 00:87A2: 4C AA 87
loc_00_87A5:
	LDY #$01                        ;C - - - - - 0x0007B5 00:87A5: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x0007B7 00:87A7: 20 51 F0
loc_00_87AA:
	LDA gameAction                  ;C - - - - - 0x0007BA 00:87AA: A5 30
	CMP #$16                        ;C - - - - - 0x0007BC 00:87AC: C9 16
	BNE loc_00_87B7                 ;C - - - - - 0x0007BE 00:87AE: D0 07
	LDA padHeld                     ;C - - - - - 0x0007C0 00:87B0: A5 16
	BEQ loc_00_87B7                 ;C - - - - - 0x0007C2 00:87B2: F0 03
	INC objActive                   ;C - - - - - 0x0007C4 00:87B4: EE 00 03
loc_00_87B7:
	RTS                             ;C - - - - - 0x0007C7 00:87B7: 60
loc_00_87B8:
	LDA padHeld                     ;C - - - - - 0x0007C8 00:87B8: A5 16
	AND #$03                        ;C - - - - - 0x0007CA 00:87BA: 29 03
	BEQ loc_00_87D0                 ;C - - - - - 0x0007CC 00:87BC: F0 12
	STA playerFacing                ;C - - - - - 0x0007CE 00:87BE: 85 31
	AND #$01                        ;C - - - - - 0x0007D0 00:87C0: 29 01
	BEQ loc_00_87CA                 ;C - - - - - 0x0007D2 00:87C2: F0 06
	LDY #$00                        ;C - - - - - 0x0007D4 00:87C4: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x0007D6 00:87C6: 20 00 F0
	RTS                             ;C - - - - - 0x0007D9 00:87C9: 60
loc_00_87CA:
	LDY #$01                        ;C - - - - - 0x0007DA 00:87CA: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x0007DC 00:87CC: 20 51 F0
	RTS                             ;C - - - - - 0x0007DF 00:87CF: 60
loc_00_87D0:
	LDA playerFacing                ;C - - - - - 0x0007E0 00:87D0: A5 31
	AND #$01                        ;C - - - - - 0x0007E2 00:87D2: 29 01
	BEQ loc_00_87DC                 ;C - - - - - 0x0007E4 00:87D4: F0 06
	LDY #$00                        ;C - - - - - 0x0007E6 00:87D6: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x0007E8 00:87D8: 20 00 F0
	RTS                             ;C - - - - - 0x0007EB 00:87DB: 60
loc_00_87DC:
	LDY #$01                        ;C - - - - - 0x0007EC 00:87DC: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x0007EE 00:87DE: 20 51 F0
	RTS                             ;C - - - - - 0x0007F1 00:87E1: 60
GameActionDispatch00Tbl_8011_17:
	LDY playerId                    ;C - - J - - 0x0007F2 00:87E2: A4 34
	LDA GameActionDispatch00Tbl_87F1,Y;C - - - - - 0x0007F4 00:87E4: B9 F1 87
	STA ptr_00                      ;C - - - - - 0x0007F7 00:87E7: 85 00
	LDA GameActionDispatch00Tbl_87F4,Y;C - - - - - 0x0007F9 00:87E9: B9 F4 87
	STA ptr_00+1                    ;C - - - - - 0x0007FC 00:87EC: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x0007FE 00:87EE: 6C 00 00
GameActionDispatch00Tbl_87F1:
	.lobytes GameActionDispatch00Tbl_87F1_00, GameActionDispatch00Tbl_87F1_01, GameActionDispatch00Tbl_87F1_02;- D 0 - - - 0x000801 00:87F1:
GameActionDispatch00Tbl_87F4:
	.hibytes GameActionDispatch00Tbl_87F1_00, GameActionDispatch00Tbl_87F1_01, GameActionDispatch00Tbl_87F1_02;- D 0 - - - 0x000804 00:87F4:
GameActionDispatch00Tbl_87F1_00:
	LDA objAnimFrame                ;C - - J - - 0x000807 00:87F7: AD 70 05
	TAY                             ;C - - - - - 0x00080A 00:87FA: A8
	LDA GameActionDispatch00Tbl_88A6,Y;C - - - - - 0x00080B 00:87FB: B9 A6 88
	STA attackType                  ;C - - - - - 0x00080E 00:87FE: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x000810 00:8800: 20 3B F4
	LDA drawOrderToggle             ;C - - - - - 0x000813 00:8803: A5 95
	AND #$07                        ;C - - - - - 0x000815 00:8805: 29 07
	BNE loc_00_880E                 ;C - - - - - 0x000817 00:8807: D0 05
	LDA #$25                        ;C - - - - - 0x000819 00:8809: A9 25
	JSR QueueSound                  ;C - - - - - 0x00081B 00:880B: 20 4C F3
loc_00_880E:
	LDA playerGroundY               ;C - - - - - 0x00081E 00:880E: A5 36
	STA jumpBaseY                   ;C - - - - - 0x000820 00:8810: 85 A6
	LDY #$00                        ;C - - - - - 0x000822 00:8812: A0 00
	JSR MoveYGravityCheck           ;C - - - - - 0x000824 00:8814: 20 19 F1
	LDA objVelYHi                   ;C - - - - - 0x000827 00:8817: AD 30 04
	BPL loc_00_884E                 ;C - - - - - 0x00082A 00:881A: 10 32
	LDA objY                        ;C - - - - - 0x00082C 00:881C: AD C0 03
	CLC                             ;C - - - - - 0x00082F 00:881F: 18
	ADC #$02                        ;C - - - - - 0x000830 00:8820: 69 02
	CMP playerGroundY               ;C - - - - - 0x000832 00:8822: C5 36
	BCC loc_00_884E                 ;C - - - - - 0x000834 00:8824: 90 28
	BEQ loc_00_882F                 ;C - - - - - 0x000836 00:8826: F0 07
	SBC #$03                        ;C - - - - - 0x000838 00:8828: E9 03
	STA objY                        ;C - - - - - 0x00083A 00:882A: 8D C0 03
	BNE loc_00_8832                 ;C - - - - - 0x00083D 00:882D: D0 03
loc_00_882F:
	STA objY                        ;C - - - - - 0x00083F 00:882F: 8D C0 03
loc_00_8832:
	LDA #$00                        ;C - - - - - 0x000842 00:8832: A9 00
	STA gameAction                  ;C - - - - - 0x000844 00:8834: 85 30
	STA timerA4                     ;C - - - - - 0x000846 00:8836: 85 A4
	STA ram_00B3                    ;C - - - - - 0x000848 00:8838: 85 B3
	LDA #$C0                        ;C - - - - - 0x00084A 00:883A: A9 C0
	STA objVelYLo                   ;C - - - - - 0x00084C 00:883C: 8D 20 04
	LDA #$FF                        ;C - - - - - 0x00084F 00:883F: A9 FF
	STA objVelYHi                   ;C - - - - - 0x000851 00:8841: 8D 30 04
	LDY playerId                    ;C - - - - - 0x000854 00:8844: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000856 00:8846: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000859 00:8849: 85 6F
	JSR ResetPlayerStand            ;C - - - - - 0x00085B 00:884B: 20 AA CE
loc_00_884E:
	LDA ram_00BF                    ;C - - - - - 0x00085E 00:884E: A5 BF
	BEQ loc_00_885F                 ;C - - - - - 0x000860 00:8850: F0 0D
	LDA playerHealth                ;C - - - - - 0x000862 00:8852: A5 3A
	SEC                             ;C - - - - - 0x000864 00:8854: 38
	SBC #$06                        ;C - - - - - 0x000865 00:8855: E9 06
	STA playerHealth                ;C - - - - - 0x000867 00:8857: 85 3A
	BPL loc_00_885F                 ;C - - - - - 0x000869 00:8859: 10 04
	LDA #$00                        ;C - - - - - 0x00086B 00:885B: A9 00
	STA playerHealth                ;C - - - - - 0x00086D 00:885D: 85 3A
loc_00_885F:
	LDA #$00                        ;C - - - - - 0x00086F 00:885F: A9 00
	STA ram_00BF                    ;C - - - - - 0x000871 00:8861: 85 BF
	RTS                             ;C - - - - - 0x000873 00:8863: 60
GameActionDispatch00Tbl_87F1_01:
	LDA objAnimFrame                ;C - - J - - 0x000874 00:8864: AD 70 05
	TAY                             ;C - - - - - 0x000877 00:8867: A8
	LDA GameActionDispatch00Tbl_88A6,Y;C - - - - - 0x000878 00:8868: B9 A6 88
	STA attackType                  ;C - - - - - 0x00087B 00:886B: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x00087D 00:886D: 20 3B F4
	LDA drawOrderToggle             ;C - - - - - 0x000880 00:8870: A5 95
	AND #$07                        ;C - - - - - 0x000882 00:8872: 29 07
	BNE loc_00_887B                 ;C - - - - - 0x000884 00:8874: D0 05
	LDA #$25                        ;C - - - - - 0x000886 00:8876: A9 25
	JSR QueueSound                  ;C - - - - - 0x000888 00:8878: 20 4C F3
loc_00_887B:
	LDA playerGroundY               ;C - - - - - 0x00088B 00:887B: A5 36
	STA jumpBaseY                   ;C - - - - - 0x00088D 00:887D: 85 A6
	LDY #$00                        ;C - - - - - 0x00088F 00:887F: A0 00
	JSR MoveYGravityCheck           ;C - - - - - 0x000891 00:8881: 20 19 F1
	LDA objVelYHi                   ;C - - - - - 0x000894 00:8884: AD 30 04
	BPL loc_00_88A2                 ;C - - - - - 0x000897 00:8887: 10 19
	LDA objY                        ;C - - - - - 0x000899 00:8889: AD C0 03
	CLC                             ;C - - - - - 0x00089C 00:888C: 18
	ADC #$02                        ;C - - - - - 0x00089D 00:888D: 69 02
	CMP playerGroundY               ;C - - - - - 0x00089F 00:888F: C5 36
	BCC loc_00_88A2                 ;C - - - - - 0x0008A1 00:8891: 90 0F
	BEQ loc_00_889C                 ;C - - - - - 0x0008A3 00:8893: F0 07
	SBC #$03                        ;C - - - - - 0x0008A5 00:8895: E9 03
	STA objY                        ;C - - - - - 0x0008A7 00:8897: 8D C0 03
	BNE loc_00_889F                 ;C - - - - - 0x0008AA 00:889A: D0 03
loc_00_889C:
	STA objY                        ;C - - - - - 0x0008AC 00:889C: 8D C0 03
loc_00_889F:
	JMP loc_00_8832                 ;C - - - - - 0x0008AF 00:889F: 4C 32 88
loc_00_88A2:
	JMP loc_00_884E                 ;C - - - - - 0x0008B2 00:88A2: 4C 4E 88
	.byte $60                       ;- - - - - - 0x0008B5 00:88A5:
GameActionDispatch00Tbl_88A6:
	.byte $14,$15,$16,$17           ;- D 0 - - - 0x0008B6 00:88A6:
GameActionDispatch00Tbl_87F1_02:
	LDA padHeld                     ;C - - J - - 0x0008BA 00:88AA: A5 16
	CMP #$C1                        ;C - - - - - 0x0008BC 00:88AC: C9 C1
	BEQ loc_00_88B6                 ;C - - - - - 0x0008BE 00:88AE: F0 06
	CMP #$C2                        ;C - - - - - 0x0008C0 00:88B0: C9 C2
	BEQ loc_00_88B6                 ;C - - - - - 0x0008C2 00:88B2: F0 02
	BNE loc_00_88C5                 ;C - - - - - 0x0008C4 00:88B4: D0 0F
loc_00_88B6:
	LDA #$80                        ;C - - - - - 0x0008C6 00:88B6: A9 80
	STA objActive                   ;C - - - - - 0x0008C8 00:88B8: 8D 00 03
	LDA #$16                        ;C - - - - - 0x0008CB 00:88BB: A9 16
	STA gameAction                  ;C - - - - - 0x0008CD 00:88BD: 85 30
	LDA #$4B                        ;C - - - - - 0x0008CF 00:88BF: A9 4B
	JSR SetPlayerAnim               ;C - - - - - 0x0008D1 00:88C1: 20 94 F2
	RTS                             ;C - - - - - 0x0008D4 00:88C4: 60
loc_00_88C5:
	LDA objAnimFrame                ;C - - - - - 0x0008D5 00:88C5: AD 70 05
	CMP #$07                        ;C - - - - - 0x0008D8 00:88C8: C9 07
	BNE loc_00_88D5                 ;C - - - - - 0x0008DA 00:88CA: D0 09
	LDA objAnimFlags                ;C - - - - - 0x0008DC 00:88CC: AD 90 05
	CMP #$06                        ;C - - - - - 0x0008DF 00:88CF: C9 06
	BNE loc_00_88D5                 ;C - - - - - 0x0008E1 00:88D1: D0 02
	BEQ loc_00_889F                 ;C - - - - - 0x0008E3 00:88D3: F0 CA
loc_00_88D5:
	LDA objAnimFrame                ;C - - - - - 0x0008E5 00:88D5: AD 70 05
	TAY                             ;C - - - - - 0x0008E8 00:88D8: A8
	LDA GameActionDispatch00Tbl_8903,Y;C - - - - - 0x0008E9 00:88D9: B9 03 89
	STA attackType                  ;C - - - - - 0x0008EC 00:88DC: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x0008EE 00:88DE: 20 3B F4
	LDA objFacing                   ;C - - - - - 0x0008F1 00:88E1: AD 60 04
	EOR #$03                        ;C - - - - - 0x0008F4 00:88E4: 49 03
	STA objFacing                   ;C - - - - - 0x0008F6 00:88E6: 8D 60 04
	LDA drawOrderToggle             ;C - - - - - 0x0008F9 00:88E9: A5 95
	AND #$07                        ;C - - - - - 0x0008FB 00:88EB: 29 07
	BNE loc_00_88F4                 ;C - - - - - 0x0008FD 00:88ED: D0 05
	LDA #$13                        ;C - - - - - 0x0008FF 00:88EF: A9 13
	JSR QueueSound                  ;C - - - - - 0x000901 00:88F1: 20 4C F3
loc_00_88F4:
	LDA playerGroundY               ;C - - - - - 0x000904 00:88F4: A5 36
	STA jumpBaseY                   ;C - - - - - 0x000906 00:88F6: 85 A6
	LDA objAnimFlags                ;C - - - - - 0x000908 00:88F8: AD 90 05
	CMP #$03                        ;C - - - - - 0x00090B 00:88FB: C9 03
	BCC loc_00_8902                 ;C - - - - - 0x00090D 00:88FD: 90 03
	JSR ClearTimerA4                ;C - - - - - 0x00090F 00:88FF: 20 36 F4
loc_00_8902:
	RTS                             ;C - - - - - 0x000912 00:8902: 60
GameActionDispatch00Tbl_8903:
	.byte $0F,$10,$11,$12,$0F,$10,$11,$12,$0F,$10,$11,$12,$0F,$10,$11,$12;- D 0 - - - 0x000913 00:8903:
	.byte $0F,$10,$11,$12           ;- D 0 - - - 0x000923 00:8913:
	.byte $0F,$10,$11,$12           ;- - - - - - 0x000927 00:8917:
GameActionDispatch00Tbl_8011_18:
	LDA objActive                   ;C - - J - - 0x00092B 00:891B: AD 00 03
	AND #$0F                        ;C - - - - - 0x00092E 00:891E: 29 0F
	BNE loc_00_894A                 ;C - - - - - 0x000930 00:8920: D0 28
	STA objVelYLo                   ;C - - - - - 0x000932 00:8922: 8D 20 04
	STA objVelXHi                   ;C - - - - - 0x000935 00:8925: 8D 10 04
	LDA #$03                        ;C - - - - - 0x000938 00:8928: A9 03
	STA objVelYHi                   ;C - - - - - 0x00093A 00:892A: 8D 30 04
	LDA #$E6                        ;C - - - - - 0x00093D 00:892D: A9 E6
	STA objVelXLo                   ;C - - - - - 0x00093F 00:892F: 8D 00 04
	LDA #$1A                        ;C - - - - - 0x000942 00:8932: A9 1A
	JSR SetPlayerAnim               ;C - - - - - 0x000944 00:8934: 20 94 F2
	LDA #$06                        ;C - - - - - 0x000947 00:8937: A9 06
	JSR SetChrBank2                 ;C - - - - - 0x000949 00:8939: 20 40 F4
	LDA #$07                        ;C - - - - - 0x00094C 00:893C: A9 07
	STA objStep                     ;C - - - - - 0x00094E 00:893E: 8D 00 05
	LDA objY                        ;C - - - - - 0x000951 00:8941: AD C0 03
	STA objParamA                   ;C - - - - - 0x000954 00:8944: 8D 10 05
	INC objActive                   ;C - - - - - 0x000957 00:8947: EE 00 03
loc_00_894A:
	LDA objActive                   ;C - - - - - 0x00095A 00:894A: AD 00 03
	AND #$02                        ;C - - - - - 0x00095D 00:894D: 29 02
	BNE loc_00_89B9                 ;C - - - - - 0x00095F 00:894F: D0 68
	LDA objAnim                     ;C - - - - - 0x000961 00:8951: AD 80 05
	CMP #$69                        ;C - - - - - 0x000964 00:8954: C9 69
	BEQ loc_00_897F                 ;C - - - - - 0x000966 00:8956: F0 27
	JSR ApplyVelY                   ;C - - - - - 0x000968 00:8958: 20 FD F1
	LDA objVelYHi                   ;C - - - - - 0x00096B 00:895B: AD 30 04
	BNE loc_00_897F                 ;C - - - - - 0x00096E 00:895E: D0 1F
	LDA #$18                        ;C - - - - - 0x000970 00:8960: A9 18
	STA attackType                  ;C - - - - - 0x000972 00:8962: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x000974 00:8964: 20 3B F4
	LDA playerGroundY               ;C - - - - - 0x000977 00:8967: A5 36
	STA jumpBaseY                   ;C - - - - - 0x000979 00:8969: 85 A6
	LDA #$34                        ;C - - - - - 0x00097B 00:896B: A9 34
	JSR QueueSound                  ;C - - - - - 0x00097D 00:896D: 20 4C F3
	LDA #$69                        ;C - - - - - 0x000980 00:8970: A9 69
	JSR SetPlayerAnim               ;C - - - - - 0x000982 00:8972: 20 94 F2
	LDA #$00                        ;C - - - - - 0x000985 00:8975: A9 00
	STA objVelXLo                   ;C - - - - - 0x000987 00:8977: 8D 00 04
	LDA #$05                        ;C - - - - - 0x00098A 00:897A: A9 05
	STA objVelXHi                   ;C - - - - - 0x00098C 00:897C: 8D 10 04
loc_00_897F:
	LDA playerFacing                ;C - - - - - 0x00098F 00:897F: A5 31
	AND #$01                        ;C - - - - - 0x000991 00:8981: 29 01
	BEQ loc_00_898D                 ;C - - - - - 0x000993 00:8983: F0 08
	LDY #$00                        ;C - - - - - 0x000995 00:8985: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x000997 00:8987: 20 00 F0
	JMP loc_00_8992                 ;C - - - - - 0x00099A 00:898A: 4C 92 89
loc_00_898D:
	LDY #$01                        ;C - - - - - 0x00099D 00:898D: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x00099F 00:898F: 20 51 F0
loc_00_8992:
	LDA objAnim                     ;C - - - - - 0x0009A2 00:8992: AD 80 05
	CMP #$69                        ;C - - - - - 0x0009A5 00:8995: C9 69
	BNE loc_00_89F5                 ;C - - - - - 0x0009A7 00:8997: D0 5C
	LDA objStep                     ;C - - - - - 0x0009A9 00:8999: AD 00 05
	BEQ loc_00_89A2                 ;C - - - - - 0x0009AC 00:899C: F0 04
	DEC objStep                     ;C - - - - - 0x0009AE 00:899E: CE 00 05
	RTS                             ;C - - - - - 0x0009B1 00:89A1: 60
loc_00_89A2:
	INC objActive                   ;C - - - - - 0x0009B2 00:89A2: EE 00 03
	LDA #$00                        ;C - - - - - 0x0009B5 00:89A5: A9 00
	STA objVelXLo                   ;C - - - - - 0x0009B7 00:89A7: 8D 00 04
	LDA #$03                        ;C - - - - - 0x0009BA 00:89AA: A9 03
	STA objVelXHi                   ;C - - - - - 0x0009BC 00:89AC: 8D 10 04
	LDA #$C0                        ;C - - - - - 0x0009BF 00:89AF: A9 C0
	STA objVelYLo                   ;C - - - - - 0x0009C1 00:89B1: 8D 20 04
	LDA #$FF                        ;C - - - - - 0x0009C4 00:89B4: A9 FF
	STA objVelYHi                   ;C - - - - - 0x0009C6 00:89B6: 8D 30 04
loc_00_89B9:
	LDA objParamA                   ;C - - - - - 0x0009C9 00:89B9: AD 10 05
	CLC                             ;C - - - - - 0x0009CC 00:89BC: 18
	ADC #$02                        ;C - - - - - 0x0009CD 00:89BD: 69 02
	CMP objY                        ;C - - - - - 0x0009CF 00:89BF: CD C0 03
	BCS loc_00_89C9                 ;C - - - - - 0x0009D2 00:89C2: B0 05
	BEQ loc_00_89F6                 ;C - - - - - 0x0009D4 00:89C4: F0 30
	JMP loc_00_89F6                 ;C - - - - - 0x0009D6 00:89C6: 4C F6 89
loc_00_89C9:
	LDY #$00                        ;C - - - - - 0x0009D9 00:89C9: A0 00
	JSR MoveYGravityCheck           ;C - - - - - 0x0009DB 00:89CB: 20 19 F1
	BCC loc_00_89D3                 ;C - - - - - 0x0009DE 00:89CE: 90 03
	JMP loc_00_89F6                 ;C - - - - - 0x0009E0 00:89D0: 4C F6 89
loc_00_89D3:
	LDA objVelYHi                   ;C - - - - - 0x0009E3 00:89D3: AD 30 04
	CMP #$FD                        ;C - - - - - 0x0009E6 00:89D6: C9 FD
	BNE loc_00_89E4                 ;C - - - - - 0x0009E8 00:89D8: D0 0A
	LDA #$38                        ;C - - - - - 0x0009EA 00:89DA: A9 38
	JSR SetPlayerAnim               ;C - - - - - 0x0009EC 00:89DC: 20 94 F2
	LDA #$05                        ;C - - - - - 0x0009EF 00:89DF: A9 05
	JSR SetChrBank2                 ;C - - - - - 0x0009F1 00:89E1: 20 40 F4
loc_00_89E4:
	LDA playerFacing                ;C - - - - - 0x0009F4 00:89E4: A5 31
	AND #$01                        ;C - - - - - 0x0009F6 00:89E6: 29 01
	BEQ loc_00_89F0                 ;C - - - - - 0x0009F8 00:89E8: F0 06
	LDY #$00                        ;C - - - - - 0x0009FA 00:89EA: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x0009FC 00:89EC: 20 00 F0
	RTS                             ;C - - - - - 0x0009FF 00:89EF: 60
loc_00_89F0:
	LDY #$01                        ;C - - - - - 0x000A00 00:89F0: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x000A02 00:89F2: 20 51 F0
loc_00_89F5:
	RTS                             ;C - - - - - 0x000A05 00:89F5: 60
loc_00_89F6:
	LDA objParamA                   ;C - - - - - 0x000A06 00:89F6: AD 10 05
	STA objY                        ;C - - - - - 0x000A09 00:89F9: 8D C0 03
	LDA #$2F                        ;C - - - - - 0x000A0C 00:89FC: A9 2F
	JSR SetPlayerAnim               ;C - - - - - 0x000A0E 00:89FE: 20 94 F2
	LDA #$04                        ;C - - - - - 0x000A11 00:8A01: A9 04
	JSR SetChrBank2                 ;C - - - - - 0x000A13 00:8A03: 20 40 F4
	LDA #$C0                        ;C - - - - - 0x000A16 00:8A06: A9 C0
	STA objVelYLo                   ;C - - - - - 0x000A18 00:8A08: 8D 20 04
	LDA #$FF                        ;C - - - - - 0x000A1B 00:8A0B: A9 FF
	STA objVelYHi                   ;C - - - - - 0x000A1D 00:8A0D: 8D 30 04
	LDA #$33                        ;C - - - - - 0x000A20 00:8A10: A9 33
	STA objVelXLo                   ;C - - - - - 0x000A22 00:8A12: 8D 00 04
	LDA #$01                        ;C - - - - - 0x000A25 00:8A15: A9 01
	STA objVelXHi                   ;C - - - - - 0x000A27 00:8A17: 8D 10 04
	LDA #$00                        ;C - - - - - 0x000A2A 00:8A1A: A9 00
	STA ram_00B3                    ;C - - - - - 0x000A2C 00:8A1C: 85 B3
	STA playerBusy                  ;C - - - - - 0x000A2E 00:8A1E: 85 6E
	JSR ClearTimerA4                ;C - - - - - 0x000A30 00:8A20: 20 36 F4
	LDA #$22                        ;C - - - - - 0x000A33 00:8A23: A9 22
	STA gameAction                  ;C - - - - - 0x000A35 00:8A25: 85 30
	LDA #$1E                        ;C - - - - - 0x000A37 00:8A27: A9 1E
	STA actionTimer                 ;C - - - - - 0x000A39 00:8A29: 85 37
	LDA #$80                        ;C - - - - - 0x000A3B 00:8A2B: A9 80
	STA objActive                   ;C - - - - - 0x000A3D 00:8A2D: 8D 00 03
	RTS                             ;C - - - - - 0x000A40 00:8A30: 60
GameActionDispatch00Tbl_8011_22:
	LDA objActive                   ;C - - J - - 0x000A41 00:8A31: AD 00 03
	AND #$0F                        ;C - - - - - 0x000A44 00:8A34: 29 0F
	BNE loc_00_8A71                 ;C - - - - - 0x000A46 00:8A36: D0 39
	LDA actionTimer                 ;C - - - - - 0x000A48 00:8A38: A5 37
	BEQ loc_00_8A6E                 ;C - - - - - 0x000A4A 00:8A3A: F0 32
	DEC actionTimer                 ;C - - - - - 0x000A4C 00:8A3C: C6 37
	LDA padHeld                     ;C - - - - - 0x000A4E 00:8A3E: A5 16
	AND #$04                        ;C - - - - - 0x000A50 00:8A40: 29 04
	BEQ loc_00_8A46                 ;C - - - - - 0x000A52 00:8A42: F0 02
	INC ram_00B3                    ;C - - - - - 0x000A54 00:8A44: E6 B3
loc_00_8A46:
	LDA ram_00B3                    ;C - - - - - 0x000A56 00:8A46: A5 B3
	CMP #$10                        ;C - - - - - 0x000A58 00:8A48: C9 10
	BCC loc_00_8A6D                 ;C - - - - - 0x000A5A 00:8A4A: 90 21
	LDA padHeld                     ;c - - - - - 0x000A5C 00:8A4C: A5 16
	CMP #$48                        ;c - - - - - 0x000A5E 00:8A4E: C9 48
	BNE loc_00_8A6D                 ;c - - - - - 0x000A60 00:8A50: D0 1B
	INC objActive                   ;c - - - - - 0x000A62 00:8A52: EE 00 03
loc_00_8A55:
	LDA #$14                        ;c - - - - - 0x000A65 00:8A55: A9 14
	JSR SetPlayerAnim               ;c - - - - - 0x000A67 00:8A57: 20 94 F2
	LDA #$07                        ;c - - - - - 0x000A6A 00:8A5A: A9 07
	JSR SetChrBank2                 ;c - - - - - 0x000A6C 00:8A5C: 20 40 F4
	LDA #$33                        ;c - - - - - 0x000A6F 00:8A5F: A9 33
	STA objVelYLo                   ;c - - - - - 0x000A71 00:8A61: 8D 20 04
	LDA #$01                        ;c - - - - - 0x000A74 00:8A64: A9 01
	STA objVelYHi                   ;c - - - - - 0x000A76 00:8A66: 8D 30 04
	LDA #$FF                        ;c - - - - - 0x000A79 00:8A69: A9 FF
	STA playerBusy                  ;c - - - - - 0x000A7B 00:8A6B: 85 6E
loc_00_8A6D:
	RTS                             ;C - - - - - 0x000A7D 00:8A6D: 60
loc_00_8A6E:
	JMP loc_00_8AD3                 ;C - - - - - 0x000A7E 00:8A6E: 4C D3 8A
loc_00_8A71:
	LDA objActive                   ;c - - - - - 0x000A81 00:8A71: AD 00 03
	AND #$02                        ;c - - - - - 0x000A84 00:8A74: 29 02
	BNE loc_00_8AB3                 ;c - - - - - 0x000A86 00:8A76: D0 3B
	LDA objAnimFrame                ;c - - - - - 0x000A88 00:8A78: AD 70 05
	CMP #$04                        ;c - - - - - 0x000A8B 00:8A7B: C9 04
	BNE loc_00_8A8E                 ;c - - - - - 0x000A8D 00:8A7D: D0 0F
	LDA objAnimFlags                ;c - - - - - 0x000A8F 00:8A7F: AD 90 05
	BNE loc_00_8A8E                 ;c - - - - - 0x000A92 00:8A82: D0 0A
	JSR ArmTimerA4                  ;c - - - - - 0x000A94 00:8A84: 20 3B F4
	LDA #$01                        ;c - - - - - 0x000A97 00:8A87: A9 01
	STA attackType                  ;c - - - - - 0x000A99 00:8A89: 85 A7
	JSR PlayHitSound                ;c - - - - - 0x000A9B 00:8A8B: 20 30 F4
loc_00_8A8E:
	LDA objAnimFrame                ;c - - - - - 0x000A9E 00:8A8E: AD 70 05
	CMP #$06                        ;c - - - - - 0x000AA1 00:8A91: C9 06
	BNE loc_00_8A6D                 ;c - - - - - 0x000AA3 00:8A93: D0 D8
	JSR ClearTimerA4                ;c - - - - - 0x000AA5 00:8A95: 20 36 F4
	LDA #$5B                        ;c - - - - - 0x000AA8 00:8A98: A9 5B
	JSR SetPlayerAnim               ;c - - - - - 0x000AAA 00:8A9A: 20 94 F2
	LDA #$05                        ;c - - - - - 0x000AAD 00:8A9D: A9 05
	JSR SetChrBank2                 ;c - - - - - 0x000AAF 00:8A9F: 20 40 F4
	LDA objY                        ;c - - - - - 0x000AB2 00:8AA2: AD C0 03
	STA playerGroundY               ;c - - - - - 0x000AB5 00:8AA5: 85 36
	LDA objY                        ;c - - - - - 0x000AB7 00:8AA7: AD C0 03
	SEC                             ;c - - - - - 0x000ABA 00:8AAA: 38
	SBC #$20                        ;c - - - - - 0x000ABB 00:8AAB: E9 20
	STA objY                        ;c - - - - - 0x000ABD 00:8AAD: 8D C0 03
	INC objActive                   ;c - - - - - 0x000AC0 00:8AB0: EE 00 03
loc_00_8AB3:
	LDY #$00                        ;c - - - - - 0x000AC3 00:8AB3: A0 00
	JSR MoveYGravityCheck           ;c - - - - - 0x000AC5 00:8AB5: 20 19 F1
	LDA objVelYHi                   ;c - - - - - 0x000AC8 00:8AB8: AD 30 04
	BPL loc_00_8AFF                 ;c - - - - - 0x000ACB 00:8ABB: 10 42
	LDA objY                        ;c - - - - - 0x000ACD 00:8ABD: AD C0 03
	CLC                             ;c - - - - - 0x000AD0 00:8AC0: 18
	ADC #$02                        ;c - - - - - 0x000AD1 00:8AC1: 69 02
	CMP playerGroundY               ;c - - - - - 0x000AD3 00:8AC3: C5 36
	BCC loc_00_8AFF                 ;c - - - - - 0x000AD5 00:8AC5: 90 38
	BEQ loc_00_8AD0                 ;c - - - - - 0x000AD7 00:8AC7: F0 07
	SBC #$01                        ;c - - - - - 0x000AD9 00:8AC9: E9 01
	STA objY                        ;c - - - - - 0x000ADB 00:8ACB: 8D C0 03
	BNE loc_00_8AD3                 ;c - - - - - 0x000ADE 00:8ACE: D0 03
loc_00_8AD0:
	STA objY                        ;c - - - - - 0x000AE0 00:8AD0: 8D C0 03
loc_00_8AD3:
	LDA #$C0                        ;C - - - - - 0x000AE3 00:8AD3: A9 C0
	STA objVelYLo                   ;C - - - - - 0x000AE5 00:8AD5: 8D 20 04
	LDA #$FF                        ;C - - - - - 0x000AE8 00:8AD8: A9 FF
	STA objVelYHi                   ;C - - - - - 0x000AEA 00:8ADA: 8D 30 04
	LDA #$80                        ;C - - - - - 0x000AED 00:8ADD: A9 80
	STA objVelXLo                   ;C - - - - - 0x000AEF 00:8ADF: 8D 00 04
	LDA #$01                        ;C - - - - - 0x000AF2 00:8AE2: A9 01
	STA objVelXHi                   ;C - - - - - 0x000AF4 00:8AE4: 8D 10 04
	LDA #$00                        ;C - - - - - 0x000AF7 00:8AE7: A9 00
	STA gameAction                  ;C - - - - - 0x000AF9 00:8AE9: 85 30
	STA actionStep                  ;C - - - - - 0x000AFB 00:8AEB: 85 35
	STA timerA3                     ;C - - - - - 0x000AFD 00:8AED: 85 A3
	STA timerA4                     ;C - - - - - 0x000AFF 00:8AEF: 85 A4
	STA playerInvincible            ;C - - - - - 0x000B01 00:8AF1: 85 3B
	STA ram_00B3                    ;C - - - - - 0x000B03 00:8AF3: 85 B3
	JSR ResetPlayerStand            ;C - - - - - 0x000B05 00:8AF5: 20 AA CE
	LDY playerId                    ;C - - - - - 0x000B08 00:8AF8: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000B0A 00:8AFA: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000B0D 00:8AFD: 85 6F
loc_00_8AFF:
	RTS                             ;C - - - - - 0x000B0F 00:8AFF: 60
GameActionDispatch00Tbl_8011_21:
	LDY playerId                    ;C - - J - - 0x000B10 00:8B00: A4 34
	LDA GameActionDispatch00Tbl_8B0F,Y;C - - - - - 0x000B12 00:8B02: B9 0F 8B
	STA ptr_00                      ;C - - - - - 0x000B15 00:8B05: 85 00
	LDA GameActionDispatch00Tbl_8B12,Y;C - - - - - 0x000B17 00:8B07: B9 12 8B
	STA ptr_00+1                    ;C - - - - - 0x000B1A 00:8B0A: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x000B1C 00:8B0C: 6C 00 00
GameActionDispatch00Tbl_8B0F:
	.lobytes GameActionDispatch00Tbl_8B0F_00, GameActionDispatch00Tbl_8B0F_01, GameActionDispatch00Tbl_8B0F_02;- D 0 - - - 0x000B1F 00:8B0F:
GameActionDispatch00Tbl_8B12:
	.hibytes GameActionDispatch00Tbl_8B0F_00, GameActionDispatch00Tbl_8B0F_01, GameActionDispatch00Tbl_8B0F_02;- D 0 - - - 0x000B22 00:8B12:
GameActionDispatch00Tbl_8B0F_00:
	LDY grabbedSlot                 ;C - - J - - 0x000B25 00:8B15: A4 39
	LDA objFlags,Y                  ;C - - - - - 0x000B27 00:8B17: B9 60 05
	BPL loc_00_8B98                 ;C - - - - - 0x000B2A 00:8B1A: 10 7C
	LDY playerId                    ;C - - - - - 0x000B2C 00:8B1C: A4 34
	LDA #$75                        ;C - - - - - 0x000B2E 00:8B1E: A9 75
	CMP objAnim                     ;C - - - - - 0x000B30 00:8B20: CD 80 05
	BEQ loc_00_8B2E                 ;C - - - - - 0x000B33 00:8B23: F0 09
	JSR SetPlayerAnim               ;C - - - - - 0x000B35 00:8B25: 20 94 F2
	LDA GameActionDispatch00Tbl_8CBE,Y;C - - - - - 0x000B38 00:8B28: B9 BE 8C
	JSR SetChrBank2                 ;C - - - - - 0x000B3B 00:8B2B: 20 40 F4
loc_00_8B2E:
	LDA objAnimFlags                ;C - - - - - 0x000B3E 00:8B2E: AD 90 05
	BNE loc_00_8B4A                 ;C - - - - - 0x000B41 00:8B31: D0 17
	LDY ram_00BA                    ;C - - - - - 0x000B43 00:8B33: A4 BA
	CPY #$03                        ;C - - - - - 0x000B45 00:8B35: C0 03
	BEQ loc_00_8B98                 ;C - - - - - 0x000B47 00:8B37: F0 5F
	LDA GameActionDispatch00Tbl_8CC1,Y;C - - - - - 0x000B49 00:8B39: B9 C1 8C
	STA attackType                  ;C - - - - - 0x000B4C 00:8B3C: 85 A7
	LDY grabbedSlot                 ;C - - - - - 0x000B4E 00:8B3E: A4 39
	LDA #$1C                        ;C - - - - - 0x000B50 00:8B40: A9 1C
	STA objHitTimer,Y               ;C - - - - - 0x000B52 00:8B42: 99 E0 04
	JSR ArmTimerA4                  ;C - - - - - 0x000B55 00:8B45: 20 3B F4
	INC ram_00BA                    ;C - - - - - 0x000B58 00:8B48: E6 BA
loc_00_8B4A:
	LDA objAnimFlags                ;C - - - - - 0x000B5A 00:8B4A: AD 90 05
	CMP #$03                        ;C - - - - - 0x000B5D 00:8B4D: C9 03
	BNE loc_00_8B54                 ;C - - - - - 0x000B5F 00:8B4F: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x000B61 00:8B51: 20 36 F4
loc_00_8B54:
	LDA objAnimFlags                ;C - - - - - 0x000B64 00:8B54: AD 90 05
	CMP #$10                        ;C - - - - - 0x000B67 00:8B57: C9 10
	BNE loc_00_8B97                 ;C - - - - - 0x000B69 00:8B59: D0 3C
	LDY grabbedSlot                 ;C - - - - - 0x000B6B 00:8B5B: A4 39
	LDA objKind,Y                   ;C - - - - - 0x000B6D 00:8B5D: B9 20 03
	CMP #$05                        ;C - - - - - 0x000B70 00:8B60: C9 05
	BEQ loc_00_8B98                 ;C - - - - - 0x000B72 00:8B62: F0 34
	CMP #$06                        ;C - - - - - 0x000B74 00:8B64: C9 06
	BEQ loc_00_8B98                 ;C - - - - - 0x000B76 00:8B66: F0 30
	CMP #$07                        ;C - - - - - 0x000B78 00:8B68: C9 07
	BEQ loc_00_8B98                 ;C - - - - - 0x000B7A 00:8B6A: F0 2C
	CMP #$02                        ;C - - - - - 0x000B7C 00:8B6C: C9 02
	BEQ loc_00_8B98                 ;C - - - - - 0x000B7E 00:8B6E: F0 28
	LDA #$04                        ;C - - - - - 0x000B80 00:8B70: A9 04
	STA gameAction                  ;C - - - - - 0x000B82 00:8B72: 85 30
	LDY playerId                    ;C - - - - - 0x000B84 00:8B74: A4 34
	LDA GameActionDispatch00Tbl_E213,Y;C - - - - - 0x000B86 00:8B76: B9 13 E2
	JSR SetPlayerAnim               ;C - - - - - 0x000B89 00:8B79: 20 94 F2
	LDA GameActionDispatch00Tbl_E25B,Y;C - - - - - 0x000B8C 00:8B7C: B9 5B E2
	JSR SetChrBank2                 ;C - - - - - 0x000B8F 00:8B7F: 20 40 F4
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000B92 00:8B82: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000B95 00:8B85: 85 6F
	LDA #$3C                        ;C - - - - - 0x000B97 00:8B87: A9 3C
	STA ram_0038                    ;C - - - - - 0x000B99 00:8B89: 85 38
	LDY grabbedSlot                 ;C - - - - - 0x000B9B 00:8B8B: A4 39
	LDA #$00                        ;C - - - - - 0x000B9D 00:8B8D: A9 00
	STA objHitTimer,Y               ;C - - - - - 0x000B9F 00:8B8F: 99 E0 04
	LDA #$80                        ;C - - - - - 0x000BA2 00:8B92: A9 80
	STA objActive                   ;C - - - - - 0x000BA4 00:8B94: 8D 00 03
loc_00_8B97:
	RTS                             ;C - - - - - 0x000BA7 00:8B97: 60
loc_00_8B98:
	LDA #$00                        ;C - - - - - 0x000BA8 00:8B98: A9 00
	STA gameAction                  ;C - - - - - 0x000BAA 00:8B9A: 85 30
	STA ram_00BA                    ;C - - - - - 0x000BAC 00:8B9C: 85 BA
	JSR ClearTimerA4                ;C - - - - - 0x000BAE 00:8B9E: 20 36 F4
	LDA #$80                        ;C - - - - - 0x000BB1 00:8BA1: A9 80
	STA objActive                   ;C - - - - - 0x000BB3 00:8BA3: 8D 00 03
	LDY playerId                    ;C - - - - - 0x000BB6 00:8BA6: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000BB8 00:8BA8: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000BBB 00:8BAB: 85 6F
	JSR ResetPlayerStand            ;C - - - - - 0x000BBD 00:8BAD: 20 AA CE
	RTS                             ;C - - - - - 0x000BC0 00:8BB0: 60
GameActionDispatch00Tbl_8B0F_01:
	LDY grabbedSlot                 ;C - - J - - 0x000BC1 00:8BB1: A4 39
	LDA objFlags,Y                  ;C - - - - - 0x000BC3 00:8BB3: B9 60 05
	BPL loc_00_8B98                 ;C - - - - - 0x000BC6 00:8BB6: 10 E0
	LDY playerId                    ;C - - - - - 0x000BC8 00:8BB8: A4 34
	LDA #$76                        ;C - - - - - 0x000BCA 00:8BBA: A9 76
	CMP objAnim                     ;C - - - - - 0x000BCC 00:8BBC: CD 80 05
	BEQ loc_00_8BCA                 ;C - - - - - 0x000BCF 00:8BBF: F0 09
	JSR SetPlayerAnim               ;C - - - - - 0x000BD1 00:8BC1: 20 94 F2
	LDA GameActionDispatch00Tbl_8CBE,Y;C - - - - - 0x000BD4 00:8BC4: B9 BE 8C
	JSR SetChrBank2                 ;C - - - - - 0x000BD7 00:8BC7: 20 40 F4
loc_00_8BCA:
	LDA objAnimFlags                ;C - - - - - 0x000BDA 00:8BCA: AD 90 05
	BNE loc_00_8BE6                 ;C - - - - - 0x000BDD 00:8BCD: D0 17
	LDY ram_00BA                    ;C - - - - - 0x000BDF 00:8BCF: A4 BA
	CPY #$03                        ;C - - - - - 0x000BE1 00:8BD1: C0 03
	BEQ loc_00_8B98                 ;C - - - - - 0x000BE3 00:8BD3: F0 C3
	LDA GameActionDispatch00Tbl_8CC1,Y;C - - - - - 0x000BE5 00:8BD5: B9 C1 8C
	STA attackType                  ;C - - - - - 0x000BE8 00:8BD8: 85 A7
	LDY grabbedSlot                 ;C - - - - - 0x000BEA 00:8BDA: A4 39
	LDA #$1C                        ;C - - - - - 0x000BEC 00:8BDC: A9 1C
	STA objHitTimer,Y               ;C - - - - - 0x000BEE 00:8BDE: 99 E0 04
	JSR ArmTimerA4                  ;C - - - - - 0x000BF1 00:8BE1: 20 3B F4
	INC ram_00BA                    ;C - - - - - 0x000BF4 00:8BE4: E6 BA
loc_00_8BE6:
	LDA objAnimFlags                ;C - - - - - 0x000BF6 00:8BE6: AD 90 05
	CMP #$03                        ;C - - - - - 0x000BF9 00:8BE9: C9 03
	BNE loc_00_8BF0                 ;C - - - - - 0x000BFB 00:8BEB: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x000BFD 00:8BED: 20 36 F4
loc_00_8BF0:
	LDA objAnimFlags                ;C - - - - - 0x000C00 00:8BF0: AD 90 05
	CMP #$10                        ;C - - - - - 0x000C03 00:8BF3: C9 10
	BNE loc_00_8C37                 ;C - - - - - 0x000C05 00:8BF5: D0 40
	LDY grabbedSlot                 ;C - - - - - 0x000C07 00:8BF7: A4 39
	LDA objKind,Y                   ;C - - - - - 0x000C09 00:8BF9: B9 20 03
	CMP #$05                        ;C - - - - - 0x000C0C 00:8BFC: C9 05
	BEQ loc_00_8B98                 ;C - - - - - 0x000C0E 00:8BFE: F0 98
	CMP #$06                        ;C - - - - - 0x000C10 00:8C00: C9 06
	BEQ loc_00_8B98                 ;C - - - - - 0x000C12 00:8C02: F0 94
	CMP #$07                        ;C - - - - - 0x000C14 00:8C04: C9 07
	BEQ loc_00_8B98                 ;C - - - - - 0x000C16 00:8C06: F0 90
	CMP #$02                        ;C - - - - - 0x000C18 00:8C08: C9 02
	BEQ loc_00_8B98                 ;C - - - - - 0x000C1A 00:8C0A: F0 8C
	LDA #$04                        ;C - - - - - 0x000C1C 00:8C0C: A9 04
	STA gameAction                  ;C - - - - - 0x000C1E 00:8C0E: 85 30
	LDY playerId                    ;C - - - - - 0x000C20 00:8C10: A4 34
	LDA GameActionDispatch00Tbl_E213,Y;C - - - - - 0x000C22 00:8C12: B9 13 E2
	JSR SetPlayerAnim               ;C - - - - - 0x000C25 00:8C15: 20 94 F2
	LDA GameActionDispatch00Tbl_E25B,Y;C - - - - - 0x000C28 00:8C18: B9 5B E2
	JSR SetChrBank2                 ;C - - - - - 0x000C2B 00:8C1B: 20 40 F4
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000C2E 00:8C1E: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000C31 00:8C21: 85 6F
	LDA #$3C                        ;C - - - - - 0x000C33 00:8C23: A9 3C
	STA ram_0038                    ;C - - - - - 0x000C35 00:8C25: 85 38
	LDY grabbedSlot                 ;C - - - - - 0x000C37 00:8C27: A4 39
	LDA #$00                        ;C - - - - - 0x000C39 00:8C29: A9 00
	STA objHitTimer,Y               ;C - - - - - 0x000C3B 00:8C2B: 99 E0 04
	LDA #$80                        ;C - - - - - 0x000C3E 00:8C2E: A9 80
	STA objActive                   ;C - - - - - 0x000C40 00:8C30: 8D 00 03
	LDA #$0E                        ;C - - - - - 0x000C43 00:8C33: A9 0E
	STA playerStandAnim             ;C - - - - - 0x000C45 00:8C35: 85 6F
loc_00_8C37:
	RTS                             ;C - - - - - 0x000C47 00:8C37: 60
GameActionDispatch00Tbl_8B0F_02:
	LDY playerId                    ;C - - J - - 0x000C48 00:8C38: A4 34
	LDA #$77                        ;C - - - - - 0x000C4A 00:8C3A: A9 77
	CMP objAnim                     ;C - - - - - 0x000C4C 00:8C3C: CD 80 05
	BEQ loc_00_8C4A                 ;C - - - - - 0x000C4F 00:8C3F: F0 09
	JSR SetPlayerAnim               ;C - - - - - 0x000C51 00:8C41: 20 94 F2
	LDA GameActionDispatch00Tbl_8CBE,Y;C - - - - - 0x000C54 00:8C44: B9 BE 8C
	JSR SetChrBank2                 ;C - - - - - 0x000C57 00:8C47: 20 40 F4
loc_00_8C4A:
	LDA objAnimFlags                ;C - - - - - 0x000C5A 00:8C4A: AD 90 05
	BNE loc_00_8C66                 ;C - - - - - 0x000C5D 00:8C4D: D0 17
	LDY ram_00BA                    ;C - - - - - 0x000C5F 00:8C4F: A4 BA
	CPY #$03                        ;C - - - - - 0x000C61 00:8C51: C0 03
	BEQ loc_00_8CB8                 ;C - - - - - 0x000C63 00:8C53: F0 63
	LDA GameActionDispatch00Tbl_8CC1,Y;C - - - - - 0x000C65 00:8C55: B9 C1 8C
	STA attackType                  ;C - - - - - 0x000C68 00:8C58: 85 A7
	LDY grabbedSlot                 ;C - - - - - 0x000C6A 00:8C5A: A4 39
	LDA #$1C                        ;C - - - - - 0x000C6C 00:8C5C: A9 1C
	STA objHitTimer,Y               ;C - - - - - 0x000C6E 00:8C5E: 99 E0 04
	JSR ArmTimerA4                  ;C - - - - - 0x000C71 00:8C61: 20 3B F4
	INC ram_00BA                    ;C - - - - - 0x000C74 00:8C64: E6 BA
loc_00_8C66:
	LDA objAnimFlags                ;C - - - - - 0x000C76 00:8C66: AD 90 05
	CMP #$03                        ;C - - - - - 0x000C79 00:8C69: C9 03
	BNE loc_00_8C70                 ;C - - - - - 0x000C7B 00:8C6B: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x000C7D 00:8C6D: 20 36 F4
loc_00_8C70:
	LDA objAnimFlags                ;C - - - - - 0x000C80 00:8C70: AD 90 05
	CMP #$10                        ;C - - - - - 0x000C83 00:8C73: C9 10
	BNE loc_00_8CB7                 ;C - - - - - 0x000C85 00:8C75: D0 40
	LDY grabbedSlot                 ;C - - - - - 0x000C87 00:8C77: A4 39
	LDA objKind,Y                   ;C - - - - - 0x000C89 00:8C79: B9 20 03
	CMP #$05                        ;C - - - - - 0x000C8C 00:8C7C: C9 05
	BEQ loc_00_8CB8                 ;C - - - - - 0x000C8E 00:8C7E: F0 38
	CMP #$06                        ;C - - - - - 0x000C90 00:8C80: C9 06
	BEQ loc_00_8CB8                 ;C - - - - - 0x000C92 00:8C82: F0 34
	CMP #$07                        ;C - - - - - 0x000C94 00:8C84: C9 07
	BEQ loc_00_8CB8                 ;C - - - - - 0x000C96 00:8C86: F0 30
	CMP #$02                        ;C - - - - - 0x000C98 00:8C88: C9 02
	BEQ loc_00_8CB8                 ;C - - - - - 0x000C9A 00:8C8A: F0 2C
	LDA #$04                        ;C - - - - - 0x000C9C 00:8C8C: A9 04
	STA gameAction                  ;C - - - - - 0x000C9E 00:8C8E: 85 30
	LDY playerId                    ;C - - - - - 0x000CA0 00:8C90: A4 34
	LDA GameActionDispatch00Tbl_E213,Y;C - - - - - 0x000CA2 00:8C92: B9 13 E2
	JSR SetPlayerAnim               ;C - - - - - 0x000CA5 00:8C95: 20 94 F2
	LDA GameActionDispatch00Tbl_E25B,Y;C - - - - - 0x000CA8 00:8C98: B9 5B E2
	JSR SetChrBank2                 ;C - - - - - 0x000CAB 00:8C9B: 20 40 F4
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000CAE 00:8C9E: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000CB1 00:8CA1: 85 6F
	LDA #$3C                        ;C - - - - - 0x000CB3 00:8CA3: A9 3C
	STA ram_0038                    ;C - - - - - 0x000CB5 00:8CA5: 85 38
	LDY grabbedSlot                 ;C - - - - - 0x000CB7 00:8CA7: A4 39
	LDA #$00                        ;C - - - - - 0x000CB9 00:8CA9: A9 00
	STA objHitTimer,Y               ;C - - - - - 0x000CBB 00:8CAB: 99 E0 04
	LDA #$80                        ;C - - - - - 0x000CBE 00:8CAE: A9 80
	STA objActive                   ;C - - - - - 0x000CC0 00:8CB0: 8D 00 03
	LDA #$0F                        ;C - - - - - 0x000CC3 00:8CB3: A9 0F
	STA playerStandAnim             ;C - - - - - 0x000CC5 00:8CB5: 85 6F
loc_00_8CB7:
	RTS                             ;C - - - - - 0x000CC7 00:8CB7: 60
loc_00_8CB8:
	JMP loc_00_8B98                 ;C - - - - - 0x000CC8 00:8CB8: 4C 98 8B
	.byte $75,$76,$77               ;- - - - - - 0x000CCB 00:8CBB:
GameActionDispatch00Tbl_8CBE:
	.byte $0C,$16,$13               ;- D 0 - - - 0x000CCE 00:8CBE:
GameActionDispatch00Tbl_8CC1:
	.byte $1B,$1C,$1D               ;- D 0 - - - 0x000CD1 00:8CC1:
GameActionDispatch00Tbl_8011_23:
	LDA #$00                        ;C - - J - - 0x000CD4 00:8CC4: A9 00
	STA timerA3                     ;C - - - - - 0x000CD6 00:8CC6: 85 A3
	JSR ClearTimerA4                ;C - - - - - 0x000CD8 00:8CC8: 20 36 F4
	LDA #$73                        ;C - - - - - 0x000CDB 00:8CCB: A9 73
	CMP objAnim                     ;C - - - - - 0x000CDD 00:8CCD: CD 80 05
	BEQ loc_00_8CDF                 ;C - - - - - 0x000CE0 00:8CD0: F0 0D
	JSR SetPlayerAnim               ;C - - - - - 0x000CE2 00:8CD2: 20 94 F2
	LDA #$3F                        ;C - - - - - 0x000CE5 00:8CD5: A9 3F
	JSR SetChrBank2                 ;C - - - - - 0x000CE7 00:8CD7: 20 40 F4
	LDA #$16                        ;C - - - - - 0x000CEA 00:8CDA: A9 16
	JSR QueueSound                  ;C - - - - - 0x000CEC 00:8CDC: 20 4C F3
loc_00_8CDF:
	LDA objAnimFrame                ;C - - - - - 0x000CEF 00:8CDF: AD 70 05
	CMP #$05                        ;C - - - - - 0x000CF2 00:8CE2: C9 05
	BCS loc_00_8D0B                 ;C - - - - - 0x000CF4 00:8CE4: B0 25
	LDA padHeld                     ;C - - - - - 0x000CF6 00:8CE6: A5 16
	CMP #$48                        ;C - - - - - 0x000CF8 00:8CE8: C9 48
	BNE loc_00_8D0B                 ;C - - - - - 0x000CFA 00:8CEA: D0 1F
	LDA #$13                        ;C - - - - - 0x000CFC 00:8CEC: A9 13
	JSR SetPlayerAnim               ;C - - - - - 0x000CFE 00:8CEE: 20 94 F2
	LDA #$03                        ;C - - - - - 0x000D01 00:8CF1: A9 03
	JSR SetChrBank2                 ;C - - - - - 0x000D03 00:8CF3: 20 40 F4
	LDA #$14                        ;C - - - - - 0x000D06 00:8CF6: A9 14
	STA gameAction                  ;C - - - - - 0x000D08 00:8CF8: 85 30
	LDA #$00                        ;C - - - - - 0x000D0A 00:8CFA: A9 00
	STA actionTimer                 ;C - - - - - 0x000D0C 00:8CFC: 85 37
	LDA #$80                        ;C - - - - - 0x000D0E 00:8CFE: A9 80
	STA objActive                   ;C - - - - - 0x000D10 00:8D00: 8D 00 03
	STA playerBusy                  ;C - - - - - 0x000D13 00:8D03: 85 6E
	LDA objY                        ;C - - - - - 0x000D15 00:8D05: AD C0 03
	STA playerGroundY               ;C - - - - - 0x000D18 00:8D08: 85 36
	RTS                             ;C - - - - - 0x000D1A 00:8D0A: 60
loc_00_8D0B:
	LDA objAnimFrame                ;C - - - - - 0x000D1B 00:8D0B: AD 70 05
	CMP #$10                        ;C - - - - - 0x000D1E 00:8D0E: C9 10
	BNE loc_00_8D6F                 ;C - - - - - 0x000D20 00:8D10: D0 5D
	LDA objAnimFlags                ;C - - - - - 0x000D22 00:8D12: AD 90 05
	BNE loc_00_8D6F                 ;C - - - - - 0x000D25 00:8D15: D0 58
	LDY #$02                        ;C - - - - - 0x000D27 00:8D17: A0 02
loc_00_8D19:
	LDA objActive,Y                 ;C - - - - - 0x000D29 00:8D19: B9 00 03
	BPL loc_00_8D24                 ;C - - - - - 0x000D2C 00:8D1C: 10 06
	DEY                             ;c - - - - - 0x000D2E 00:8D1E: 88
	CPY #$00                        ;c - - - - - 0x000D2F 00:8D1F: C0 00
	BNE loc_00_8D19                 ;c - - - - - 0x000D31 00:8D21: D0 F6
	RTS                             ;c - - - - - 0x000D33 00:8D23: 60
loc_00_8D24:
	STY ptr_0E+1                    ;C - - - - - 0x000D34 00:8D24: 84 0F
	LDA playerFacing                ;C - - - - - 0x000D36 00:8D26: A5 31
	STA objFacing,Y                 ;C - - - - - 0x000D38 00:8D28: 99 60 04
	AND #$02                        ;C - - - - - 0x000D3B 00:8D2B: 29 02
	TAY                             ;C - - - - - 0x000D3D 00:8D2D: A8
	LDA objX                        ;C - - - - - 0x000D3E 00:8D2E: AD 60 03
	CLC                             ;C - - - - - 0x000D41 00:8D31: 18
	ADC GameActionDispatch00Tbl_8D89,Y;C - - - - - 0x000D42 00:8D32: 79 89 8D
	PHA                             ;C - - - - - 0x000D45 00:8D35: 48
	LDA objXPage                    ;C - - - - - 0x000D46 00:8D36: AD 80 03
	ADC GameActionDispatch00Tbl_8D8A,Y;C - - - - - 0x000D49 00:8D39: 79 8A 8D
	LDY ptr_0E+1                    ;C - - - - - 0x000D4C 00:8D3C: A4 0F
	STA objXPage,Y                  ;C - - - - - 0x000D4E 00:8D3E: 99 80 03
	PLA                             ;C - - - - - 0x000D51 00:8D41: 68
	STA objX,Y                      ;C - - - - - 0x000D52 00:8D42: 99 60 03
	LDA objY                        ;C - - - - - 0x000D55 00:8D45: AD C0 03
	CLC                             ;C - - - - - 0x000D58 00:8D48: 18
	ADC #$04                        ;C - - - - - 0x000D59 00:8D49: 69 04
	STA objY,Y                      ;C - - - - - 0x000D5B 00:8D4B: 99 C0 03
	LDA objYPage                    ;C - - - - - 0x000D5E 00:8D4E: AD E0 03
	STA objYPage,Y                  ;C - - - - - 0x000D61 00:8D51: 99 E0 03
	LDA #$74                        ;C - - - - - 0x000D64 00:8D54: A9 74
	JSR SetAnimY                    ;C - - - - - 0x000D66 00:8D56: 20 A0 F2
	LDA #$6C                        ;C - - - - - 0x000D69 00:8D59: A9 6C
	STA objKind,Y                   ;C - - - - - 0x000D6B 00:8D5B: 99 20 03
	STA objId,Y                     ;C - - - - - 0x000D6E 00:8D5E: 99 30 03
	LDA #$22                        ;C - - - - - 0x000D71 00:8D61: A9 22
	STA attackType                  ;C - - - - - 0x000D73 00:8D63: 85 A7
	LDA #$01                        ;C - - - - - 0x000D75 00:8D65: A9 01
	STA objAtkBox,Y                 ;C - - - - - 0x000D77 00:8D67: 99 40 04
	LDA #$00                        ;C - - - - - 0x000D7A 00:8D6A: A9 00
	STA objMoveMode,Y               ;C - - - - - 0x000D7C 00:8D6C: 99 70 04
loc_00_8D6F:
	LDA objAnimFrame                ;C - - - - - 0x000D7F 00:8D6F: AD 70 05
	CMP #$1B                        ;C - - - - - 0x000D82 00:8D72: C9 1B
	BNE loc_00_8D88                 ;C - - - - - 0x000D84 00:8D74: D0 12
	LDA #$00                        ;C - - - - - 0x000D86 00:8D76: A9 00
	STA gameAction                  ;C - - - - - 0x000D88 00:8D78: 85 30
	STA ram_00B3                    ;C - - - - - 0x000D8A 00:8D7A: 85 B3
	STA actionStep                  ;C - - - - - 0x000D8C 00:8D7C: 85 35
	LDY playerId                    ;C - - - - - 0x000D8E 00:8D7E: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000D90 00:8D80: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000D93 00:8D83: 85 6F
	JSR ResetPlayerStand            ;C - - - - - 0x000D95 00:8D85: 20 AA CE
loc_00_8D88:
	RTS                             ;C - - - - - 0x000D98 00:8D88: 60
GameActionDispatch00Tbl_8D89:
	.byte $0C                       ;- D 0 - - - 0x000D99 00:8D89:
GameActionDispatch00Tbl_8D8A:
	.byte $00,$F4,$FF               ;- D 0 - - - 0x000D9A 00:8D8A:
GameActionDispatch00Tbl_8011_24:
	LDA objActive                   ;C - - J - - 0x000D9D 00:8D8D: AD 00 03
	AND #$0F                        ;C - - - - - 0x000DA0 00:8D90: 29 0F
	BNE loc_00_8DC1                 ;C - - - - - 0x000DA2 00:8D92: D0 2D
	LDA stage                       ;C - - - - - 0x000DA4 00:8D94: A5 61
	CMP #$03                        ;C - - - - - 0x000DA6 00:8D96: C9 03
	BNE loc_00_8DD1                 ;C - - - - - 0x000DA8 00:8D98: D0 37
	LDA stageSection                ;C - - - - - 0x000DAA 00:8D9A: A5 60
	CMP #$01                        ;C - - - - - 0x000DAC 00:8D9C: C9 01
	BNE loc_00_8DD1                 ;C - - - - - 0x000DAE 00:8D9E: D0 31
	LDA objX                        ;C - - - - - 0x000DB0 00:8DA0: AD 60 03
	CMP #$80                        ;C - - - - - 0x000DB3 00:8DA3: C9 80
	BCS loc_00_8DAB                 ;C - - - - - 0x000DB5 00:8DA5: B0 04
	LDA #$02                        ;C - - - - - 0x000DB7 00:8DA7: A9 02
	BNE loc_00_8DAD                 ;C - - - - - 0x000DB9 00:8DA9: D0 02
loc_00_8DAB:
	LDA #$01                        ;c - - - - - 0x000DBB 00:8DAB: A9 01
loc_00_8DAD:
	STA objFacing                   ;C - - - - - 0x000DBD 00:8DAD: 8D 60 04
	LDY playerId                    ;C - - - - - 0x000DC0 00:8DB0: A4 34
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x000DC2 00:8DB2: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x000DC5 00:8DB5: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x000DC8 00:8DB8: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x000DCB 00:8DBB: 8D 10 04
	INC objActive                   ;C - - - - - 0x000DCE 00:8DBE: EE 00 03
loc_00_8DC1:
	LDA objFacing                   ;C - - - - - 0x000DD1 00:8DC1: AD 60 04
	AND #$01                        ;C - - - - - 0x000DD4 00:8DC4: 29 01
	BEQ loc_00_8DCE                 ;C - - - - - 0x000DD6 00:8DC6: F0 06
	JSR ApplyVelXAdd                ;c - - - - - 0x000DD8 00:8DC8: 20 83 F1
	JMP loc_00_8DD1                 ;c - - - - - 0x000DDB 00:8DCB: 4C D1 8D
loc_00_8DCE:
	JSR ApplyVelXSub                ;C - - - - - 0x000DDE 00:8DCE: 20 A1 F1
loc_00_8DD1:
	JSR ApplyVelY                   ;C - - - - - 0x000DE1 00:8DD1: 20 FD F1
	LDA ram_00BE                    ;C - - - - - 0x000DE4 00:8DD4: A5 BE
	CMP #$04                        ;C - - - - - 0x000DE6 00:8DD6: C9 04
	BNE loc_00_8DE0                 ;C - - - - - 0x000DE8 00:8DD8: D0 06
	LDA playerId                    ;c - - - - - 0x000DEA 00:8DDA: A5 34
	CMP #$02                        ;c - - - - - 0x000DEC 00:8DDC: C9 02
	BNE loc_00_8DE0                 ;c - - - - - 0x000DEE 00:8DDE: D0 00
loc_00_8DE0:
	LDY playerId                    ;C - - - - - 0x000DF0 00:8DE0: A4 34
	LDA tbl_0F_E219,Y               ;C - - - - - 0x000DF2 00:8DE2: B9 19 E2
	JSR SetPlayerAnim               ;C - - - - - 0x000DF5 00:8DE5: 20 94 F2
	LDA tbl_0F_E22E,Y               ;C - - - - - 0x000DF8 00:8DE8: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x000DFB 00:8DEB: 20 40 F4
	LDA objY                        ;C - - - - - 0x000DFE 00:8DEE: AD C0 03
	CMP #$A8                        ;C - - - - - 0x000E01 00:8DF1: C9 A8
	BCC loc_00_8E02                 ;C - - - - - 0x000E03 00:8DF3: 90 0D
	LDA #$28                        ;C - - - - - 0x000E05 00:8DF5: A9 28
	JSR QueueSound                  ;C - - - - - 0x000E07 00:8DF7: 20 4C F3
	LDA objFlags                    ;C - - - - - 0x000E0A 00:8DFA: AD 60 05
	ORA #$04                        ;C - - - - - 0x000E0D 00:8DFD: 09 04
	STA objFlags                    ;C - - - - - 0x000E0F 00:8DFF: 8D 60 05
loc_00_8E02:
	LDA #$00                        ;C - - - - - 0x000E12 00:8E02: A9 00
	STA ram_00B3                    ;C - - - - - 0x000E14 00:8E04: 85 B3
	STA scrollY                     ;C - - - - - 0x000E16 00:8E06: 85 FA
	STA actionStep                  ;C - - - - - 0x000E18 00:8E08: 85 35
	STA timerA3                     ;C - - - - - 0x000E1A 00:8E0A: 85 A3
	STA timerA4                     ;C - - - - - 0x000E1C 00:8E0C: 85 A4
	STA playerInvincible            ;C - - - - - 0x000E1E 00:8E0E: 85 3B
	STA objStep                     ;C - - - - - 0x000E20 00:8E10: 8D 00 05
	STA objParamA                   ;C - - - - - 0x000E23 00:8E13: 8D 10 05
	STA objParamB                   ;C - - - - - 0x000E26 00:8E16: 8D 20 05
	JSR ClearTimerA4                ;C - - - - - 0x000E29 00:8E19: 20 36 F4
	LDA objY                        ;C - - - - - 0x000E2C 00:8E1C: AD C0 03
	CMP #$E4                        ;C - - - - - 0x000E2F 00:8E1F: C9 E4
	BCC loc_00_8E3D                 ;C - - - - - 0x000E31 00:8E21: 90 1A
	LDA #$80                        ;C - - - - - 0x000E33 00:8E23: A9 80
	STA objActive                   ;C - - - - - 0x000E35 00:8E25: 8D 00 03
	DEC lives                       ;C - - - - - 0x000E38 00:8E28: C6 3E
	LDA lives                       ;C - - - - - 0x000E3A 00:8E2A: A5 3E
	BPL loc_00_8E39                 ;C - - - - - 0x000E3C 00:8E2C: 10 0B
	LDA #$00                        ;c - - - - - 0x000E3E 00:8E2E: A9 00
	STA gameOverFlag                ;c - - - - - 0x000E40 00:8E30: 85 62
	LDA #$09                        ;c - - - - - 0x000E42 00:8E32: A9 09
	STA gameAction                  ;c - - - - - 0x000E44 00:8E34: 85 30
	JMP Act09_Continue              ;c - - - - - 0x000E46 00:8E36: 4C 6C DC
loc_00_8E39:
	LDA #$25                        ;C - - - - - 0x000E49 00:8E39: A9 25
	STA gameAction                  ;C - - - - - 0x000E4B 00:8E3B: 85 30
loc_00_8E3D:
	RTS                             ;C - - - - - 0x000E4D 00:8E3D: 60
GameActionDispatch00Tbl_8011_25:
	LDA objActive                   ;C - - J - - 0x000E4E 00:8E3E: AD 00 03
	AND #$0F                        ;C - - - - - 0x000E51 00:8E41: 29 0F
	BNE loc_00_8E8F                 ;C - - - - - 0x000E53 00:8E43: D0 4A
	LDA scrollX                     ;C - - - - - 0x000E55 00:8E45: A5 FC
	BNE loc_00_8E50                 ;C - - - - - 0x000E57 00:8E47: D0 07
	LDA #$38                        ;C - - - - - 0x000E59 00:8E49: A9 38
	STA objX                        ;C - - - - - 0x000E5B 00:8E4B: 8D 60 03
	BNE loc_00_8E5F                 ;C - - - - - 0x000E5E 00:8E4E: D0 0F
loc_00_8E50:
	LDA scrollX                     ;C - - - - - 0x000E60 00:8E50: A5 FC
	CLC                             ;C - - - - - 0x000E62 00:8E52: 18
	ADC #$38                        ;C - - - - - 0x000E63 00:8E53: 69 38
	STA objX                        ;C - - - - - 0x000E65 00:8E55: 8D 60 03
	LDA scrollXPage                 ;C - - - - - 0x000E68 00:8E58: A5 F9
	ADC #$00                        ;C - - - - - 0x000E6A 00:8E5A: 69 00
	STA objXPage                    ;C - - - - - 0x000E6C 00:8E5C: 8D 80 03
loc_00_8E5F:
	LDA #$10                        ;C - - - - - 0x000E6F 00:8E5F: A9 10
	STA objY                        ;C - - - - - 0x000E71 00:8E61: 8D C0 03
	LDA #$00                        ;C - - - - - 0x000E74 00:8E64: A9 00
	STA objYPage                    ;C - - - - - 0x000E76 00:8E66: 8D E0 03
	STA objKind                     ;C - - - - - 0x000E79 00:8E69: 8D 20 03
	JSR LoadPlayerHealthByLevel     ;C - - - - - 0x000E7C 00:8E6C: 20 33 DE
	LDY playerId                    ;C - - - - - 0x000E7F 00:8E6F: A4 34
	LDA tbl_0F_E219,Y               ;C - - - - - 0x000E81 00:8E71: B9 19 E2
	JSR SetPlayerAnim               ;C - - - - - 0x000E84 00:8E74: 20 94 F2
	LDA tbl_0F_E22E,Y               ;C - - - - - 0x000E87 00:8E77: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x000E8A 00:8E7A: 20 40 F4
	INC objActive                   ;C - - - - - 0x000E8D 00:8E7D: EE 00 03
	LDA #$80                        ;C - - - - - 0x000E90 00:8E80: A9 80
	STA objVelYLo                   ;C - - - - - 0x000E92 00:8E82: 8D 20 04
	LDA #$05                        ;C - - - - - 0x000E95 00:8E85: A9 05
	STA objVelYHi                   ;C - - - - - 0x000E97 00:8E87: 8D 30 04
	LDA #$D0                        ;C - - - - - 0x000E9A 00:8E8A: A9 D0
	STA objFlags                    ;C - - - - - 0x000E9C 00:8E8C: 8D 60 05
loc_00_8E8F:
	JSR ApplyVelYAdd                ;C - - - - - 0x000E9F 00:8E8F: 20 BF F1
	LDA stage                       ;C - - - - - 0x000EA2 00:8E92: A5 61
	CMP #$01                        ;C - - - - - 0x000EA4 00:8E94: C9 01
	BNE loc_00_8E9C                 ;C - - - - - 0x000EA6 00:8E96: D0 04
	LDA #$98                        ;c - - - - - 0x000EA8 00:8E98: A9 98
	BNE loc_00_8E9E                 ;c - - - - - 0x000EAA 00:8E9A: D0 02
loc_00_8E9C:
	LDA #$88                        ;C - - - - - 0x000EAC 00:8E9C: A9 88
loc_00_8E9E:
	STA ptr_00                      ;C - - - - - 0x000EAE 00:8E9E: 85 00
	LDA objY                        ;C - - - - - 0x000EB0 00:8EA0: AD C0 03
	CMP ptr_00                      ;C - - - - - 0x000EB3 00:8EA3: C5 00
	BCC loc_00_8EE9                 ;C - - - - - 0x000EB5 00:8EA5: 90 42
	LDA #$01                        ;C - - - - - 0x000EB7 00:8EA7: A9 01
	STA playerFacing                ;C - - - - - 0x000EB9 00:8EA9: 85 31
	LDA #$B6                        ;C - - - - - 0x000EBB 00:8EAB: A9 B6
	STA flashTimerA                 ;C - - - - - 0x000EBD 00:8EAD: 85 69
	LDA #$1E                        ;C - - - - - 0x000EBF 00:8EAF: A9 1E
	STA flashTimerB                 ;C - - - - - 0x000EC1 00:8EB1: 85 6A
	LDA #$80                        ;C - - - - - 0x000EC3 00:8EB3: A9 80
	STA objActive                   ;C - - - - - 0x000EC5 00:8EB5: 8D 00 03
	STA playerBusy                  ;C - - - - - 0x000EC8 00:8EB8: 85 6E
	LDA #$00                        ;C - - - - - 0x000ECA 00:8EBA: A9 00
	STA gameAction                  ;C - - - - - 0x000ECC 00:8EBC: 85 30
	STA actionStep                  ;C - - - - - 0x000ECE 00:8EBE: 85 35
	STA scrollY                     ;C - - - - - 0x000ED0 00:8EC0: 85 FA
	STA objStep                     ;C - - - - - 0x000ED2 00:8EC2: 8D 00 05
	STA objParamA                   ;C - - - - - 0x000ED5 00:8EC5: 8D 10 05
	STA ram_00BA                    ;C - - - - - 0x000ED8 00:8EC8: 85 BA
	STA timerA4                     ;C - - - - - 0x000EDA 00:8ECA: 85 A4
	STA weaponHeld                  ;C - - - - - 0x000EDC 00:8ECC: 85 A9
	STA timerA3                     ;C - - - - - 0x000EDE 00:8ECE: 85 A3
	STA ram_00AD                    ;C - - - - - 0x000EE0 00:8ED0: 85 AD
	STA ram_00B3                    ;C - - - - - 0x000EE2 00:8ED2: 85 B3
	JSR ResetPlayerStand            ;C - - - - - 0x000EE4 00:8ED4: 20 AA CE
	JSR SetHopVelY                  ;C - - - - - 0x000EE7 00:8ED7: 20 6E F2
	LDY playerId                    ;C - - - - - 0x000EEA 00:8EDA: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000EEC 00:8EDC: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000EEF 00:8EDF: 85 6F
	LDA gameOverFlag                ;C - - - - - 0x000EF1 00:8EE1: A5 62
	CMP #$B5                        ;C - - - - - 0x000EF3 00:8EE3: C9 B5
	BNE loc_00_8EE9                 ;C - - - - - 0x000EF5 00:8EE5: D0 02
	INC gameOverFlag                ;c - - - - - 0x000EF7 00:8EE7: E6 62
loc_00_8EE9:
	RTS                             ;C - - - - - 0x000EF9 00:8EE9: 60
GameActionDispatch00Tbl_8011_27:
	LDA #$00                        ;C - - J - - 0x000EFA 00:8EEA: A9 00
	STA timerA3                     ;C - - - - - 0x000EFC 00:8EEC: 85 A3
	LDA objActive                   ;C - - - - - 0x000EFE 00:8EEE: AD 00 03
	AND #$0F                        ;C - - - - - 0x000F01 00:8EF1: 29 0F
	BNE loc_00_8F0E                 ;C - - - - - 0x000F03 00:8EF3: D0 19
	STA ram_00B3                    ;C - - - - - 0x000F05 00:8EF5: 85 B3
	LDA #$24                        ;C - - - - - 0x000F07 00:8EF7: A9 24
	CMP objAnim                     ;C - - - - - 0x000F09 00:8EF9: CD 80 05
	BEQ loc_00_8F0E                 ;C - - - - - 0x000F0C 00:8EFC: F0 10
	JSR SetPlayerAnim               ;C - - - - - 0x000F0E 00:8EFE: 20 94 F2
	LDA #$32                        ;C - - - - - 0x000F11 00:8F01: A9 32
	JSR SetChrBank2                 ;C - - - - - 0x000F13 00:8F03: 20 40 F4
	INC objActive                   ;C - - - - - 0x000F16 00:8F06: EE 00 03
	LDA #$1B                        ;C - - - - - 0x000F19 00:8F09: A9 1B
	JSR QueueSound                  ;C - - - - - 0x000F1B 00:8F0B: 20 4C F3
loc_00_8F0E:
	LDA padHeld                     ;C - - - - - 0x000F1E 00:8F0E: A5 16
	CMP #$08                        ;C - - - - - 0x000F20 00:8F10: C9 08
	BNE loc_00_8F16                 ;C - - - - - 0x000F22 00:8F12: D0 02
	INC ram_00B3                    ;C - - - - - 0x000F24 00:8F14: E6 B3
loc_00_8F16:
	LDA objAnimFrame                ;C - - - - - 0x000F26 00:8F16: AD 70 05
	CMP #$04                        ;C - - - - - 0x000F29 00:8F19: C9 04
	BNE loc_00_8F24                 ;C - - - - - 0x000F2B 00:8F1B: D0 07
	LDA #$06                        ;C - - - - - 0x000F2D 00:8F1D: A9 06
	STA attackType                  ;C - - - - - 0x000F2F 00:8F1F: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x000F31 00:8F21: 20 3B F4
loc_00_8F24:
	LDA objAnimFrame                ;C - - - - - 0x000F34 00:8F24: AD 70 05
	CMP #$06                        ;C - - - - - 0x000F37 00:8F27: C9 06
	BNE loc_00_8F2E                 ;C - - - - - 0x000F39 00:8F29: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x000F3B 00:8F2B: 20 36 F4
loc_00_8F2E:
	LDA objAnimFrame                ;C - - - - - 0x000F3E 00:8F2E: AD 70 05
	CMP #$0B                        ;C - - - - - 0x000F41 00:8F31: C9 0B
	BNE loc_00_8F46                 ;C - - - - - 0x000F43 00:8F33: D0 11
	LDA #$03                        ;C - - - - - 0x000F45 00:8F35: A9 03
	STA attackType                  ;C - - - - - 0x000F47 00:8F37: 85 A7
	JSR ArmTimerA4                  ;C - - - - - 0x000F49 00:8F39: 20 3B F4
	LDA objY                        ;C - - - - - 0x000F4C 00:8F3C: AD C0 03
	STA jumpBaseY                   ;C - - - - - 0x000F4F 00:8F3F: 85 A6
	LDA #$34                        ;C - - - - - 0x000F51 00:8F41: A9 34
	JSR QueueSound                  ;C - - - - - 0x000F53 00:8F43: 20 4C F3
loc_00_8F46:
	LDA objAnimFrame                ;C - - - - - 0x000F56 00:8F46: AD 70 05
	CMP #$11                        ;C - - - - - 0x000F59 00:8F49: C9 11
	BNE loc_00_8F50                 ;C - - - - - 0x000F5B 00:8F4B: D0 03
	JSR ClearTimerA4                ;C - - - - - 0x000F5D 00:8F4D: 20 36 F4
loc_00_8F50:
	LDA objAnimFrame                ;C - - - - - 0x000F60 00:8F50: AD 70 05
	CMP #$13                        ;C - - - - - 0x000F63 00:8F53: C9 13
	BNE loc_00_8FAE                 ;C - - - - - 0x000F65 00:8F55: D0 57
	LDA ram_00B3                    ;C - - - - - 0x000F67 00:8F57: A5 B3
	CMP #$28                        ;C - - - - - 0x000F69 00:8F59: C9 28
	BCC loc_00_8F82                 ;C - - - - - 0x000F6B 00:8F5B: 90 25
	LDA #$81                        ;c - - - - - 0x000F6D 00:8F5D: A9 81
	STA objActive                   ;c - - - - - 0x000F6F 00:8F5F: 8D 00 03
	STA playerBusy                  ;c - - - - - 0x000F72 00:8F62: 85 6E
	LDA playerFacing                ;c - - - - - 0x000F74 00:8F64: A5 31
	AND #$01                        ;c - - - - - 0x000F76 00:8F66: 29 01
	BEQ loc_00_8F6F                 ;c - - - - - 0x000F78 00:8F68: F0 05
	JSR ClearPlayerFlag40           ;c - - - - - 0x000F7A 00:8F6A: 20 48 F0
	BNE loc_00_8F72                 ;c - - - - - 0x000F7D 00:8F6D: D0 03
loc_00_8F6F:
	JSR SetPlayerFlag40             ;c - - - - - 0x000F7F 00:8F6F: 20 3F F0
loc_00_8F72:
	LDA playerFacing                ;c - - - - - 0x000F82 00:8F72: A5 31
	EOR #$03                        ;c - - - - - 0x000F84 00:8F74: 49 03
	STA playerFacing                ;c - - - - - 0x000F86 00:8F76: 85 31
	JSR ClearTimerA4                ;c - - - - - 0x000F88 00:8F78: 20 36 F4
	LDA #$22                        ;c - - - - - 0x000F8B 00:8F7B: A9 22
	STA gameAction                  ;c - - - - - 0x000F8D 00:8F7D: 85 30
	JMP loc_00_8A55                 ;c - - - - - 0x000F8F 00:8F7F: 4C 55 8A
loc_00_8F82:
	JSR ClearTimerA4                ;C - - - - - 0x000F92 00:8F82: 20 36 F4
	LDA #$00                        ;C - - - - - 0x000F95 00:8F85: A9 00
	STA gameAction                  ;C - - - - - 0x000F97 00:8F87: 85 30
	STA ram_00B3                    ;C - - - - - 0x000F99 00:8F89: 85 B3
	STA actionStep                  ;C - - - - - 0x000F9B 00:8F8B: 85 35
	STA objStep                     ;C - - - - - 0x000F9D 00:8F8D: 8D 00 05
	STA objStep+1                   ;C - - - - - 0x000FA0 00:8F90: 8D 01 05
	LDA #$80                        ;C - - - - - 0x000FA3 00:8F93: A9 80
	STA objActive                   ;C - - - - - 0x000FA5 00:8F95: 8D 00 03
	LDY playerId                    ;C - - - - - 0x000FA8 00:8F98: A4 34
	LDA tbl_0F_E288,Y               ;C - - - - - 0x000FAA 00:8F9A: B9 88 E2
	STA playerStandAnim             ;C - - - - - 0x000FAD 00:8F9D: 85 6F
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x000FAF 00:8F9F: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x000FB2 00:8FA2: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x000FB5 00:8FA5: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x000FB8 00:8FA8: 8D 10 04
	JSR ResetPlayerStand            ;C - - - - - 0x000FBB 00:8FAB: 20 AA CE
loc_00_8FAE:
	RTS                             ;C - - - - - 0x000FBE 00:8FAE: 60
GameActionDispatch00Tbl_8011_1D:
	LDA scrollX                     ;C - - J - - 0x000FBF 00:8FAF: A5 FC
	CMP #$28                        ;C - - - - - 0x000FC1 00:8FB1: C9 28
	BCS loc_00_8FB6                 ;C - - - - - 0x000FC3 00:8FB3: B0 01
	RTS                             ;C - - - - - 0x000FC5 00:8FB5: 60
loc_00_8FB6:
	LDA stage                       ;C - - - - - 0x000FC6 00:8FB6: A5 61
	BNE loc_00_8FC7                 ;C - - - - - 0x000FC8 00:8FB8: D0 0D
	LDA stageSection                ;C - - - - - 0x000FCA 00:8FBA: A5 60
	CMP #$01                        ;C - - - - - 0x000FCC 00:8FBC: C9 01
	BNE loc_00_8FC7                 ;C - - - - - 0x000FCE 00:8FBE: D0 07
	LDA worldXPage                  ;C - - - - - 0x000FD0 00:8FC0: A5 2D
	CMP #$02                        ;C - - - - - 0x000FD2 00:8FC2: C9 02
	BNE loc_00_8FC7                 ;C - - - - - 0x000FD4 00:8FC4: D0 01
	RTS                             ;C - - - - - 0x000FD6 00:8FC6: 60
loc_00_8FC7:
	LDA stage                       ;C - - - - - 0x000FD7 00:8FC7: A5 61
	CMP #$03                        ;C - - - - - 0x000FD9 00:8FC9: C9 03
	BNE loc_00_8FD8                 ;C - - - - - 0x000FDB 00:8FCB: D0 0B
	LDA stageSection                ;C - - - - - 0x000FDD 00:8FCD: A5 60
	BNE loc_00_8FD8                 ;C - - - - - 0x000FDF 00:8FCF: D0 07
	LDA worldXPage                  ;C - - - - - 0x000FE1 00:8FD1: A5 2D
	CMP #$02                        ;C - - - - - 0x000FE3 00:8FD3: C9 02
	BNE loc_00_8FD8                 ;C - - - - - 0x000FE5 00:8FD5: D0 01
	RTS                             ;C - - - - - 0x000FE7 00:8FD7: 60
loc_00_8FD8:
	LDA objFlags                    ;C - - - - - 0x000FE8 00:8FD8: AD 60 05
	CMP #$90                        ;C - - - - - 0x000FEB 00:8FDB: C9 90
	BNE loc_00_8FE3                 ;C - - - - - 0x000FED 00:8FDD: D0 04
	LDA #$02                        ;c - - - - - 0x000FEF 00:8FDF: A9 02
	BNE loc_00_8FE5                 ;c - - - - - 0x000FF1 00:8FE1: D0 02
loc_00_8FE3:
	LDA #$01                        ;C - - - - - 0x000FF3 00:8FE3: A9 01
loc_00_8FE5:
	STA playerFacing                ;C - - - - - 0x000FF5 00:8FE5: 85 31
	JSR ResetPlayerStand            ;C - - - - - 0x000FF7 00:8FE7: 20 AA CE
	LDA #$00                        ;C - - - - - 0x000FFA 00:8FEA: A9 00
	STA gameAction                  ;C - - - - - 0x000FFC 00:8FEC: 85 30
	STA ram_00BB                    ;C - - - - - 0x000FFE 00:8FEE: 85 BB
	STA actionStep                  ;C - - - - - 0x001000 00:8FF0: 85 35
	LDA #$80                        ;C - - - - - 0x001002 00:8FF2: A9 80
	STA objActive                   ;C - - - - - 0x001004 00:8FF4: 8D 00 03
	RTS                             ;C - - - - - 0x001007 00:8FF7: 60
GameActionDispatch00Tbl_8011_1E:
	LDA objActive                   ;C - - J - - 0x001008 00:8FF8: AD 00 03
	AND #$0F                        ;C - - - - - 0x00100B 00:8FFB: 29 0F
	BNE loc_00_9073                 ;C - - - - - 0x00100D 00:8FFD: D0 74
	LDA #$00                        ;C - - - - - 0x00100F 00:8FFF: A9 00
	STA ram_00BB                    ;C - - - - - 0x001011 00:9001: 85 BB
	LDY playerId                    ;C - - - - - 0x001013 00:9003: A4 34
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x001015 00:9005: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x001018 00:9008: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x00101B 00:900B: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x00101E 00:900E: 8D 10 04
	LDA tbl_0F_E1C7,Y               ;C - - - - - 0x001021 00:9011: B9 C7 E1
	STA objVelYLo                   ;C - - - - - 0x001024 00:9014: 8D 20 04
	LDA tbl_0F_E1CA,Y               ;C - - - - - 0x001027 00:9017: B9 CA E1
	STA objVelYHi                   ;C - - - - - 0x00102A 00:901A: 8D 30 04
	JSR SetPlayerFlag40             ;C - - - - - 0x00102D 00:901D: 20 3F F0
	LDA weaponHeld                  ;C - - - - - 0x001030 00:9020: A5 A9
	BNE loc_00_9035                 ;C - - - - - 0x001032 00:9022: D0 11
	LDA objAnim                     ;C - - - - - 0x001034 00:9024: AD 80 05
	CMP tbl_0F_E273,Y               ;C - - - - - 0x001037 00:9027: D9 73 E2
	BEQ loc_00_9049                 ;C - - - - - 0x00103A 00:902A: F0 1D
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x00103C 00:902C: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x00103F 00:902F: 20 94 F2
	JMP loc_00_9043                 ;C - - - - - 0x001042 00:9032: 4C 43 90
loc_00_9035:
	LDA objAnim                     ;c - - - - - 0x001045 00:9035: AD 80 05
	CMP GameActionDispatch00Tbl_E29A,Y;c - - - - - 0x001048 00:9038: D9 9A E2
	BEQ loc_00_9049                 ;c - - - - - 0x00104B 00:903B: F0 0C
	LDA GameActionDispatch00Tbl_E204,Y;c - - - - - 0x00104D 00:903D: B9 04 E2
	JSR SetPlayerAnim               ;c - - - - - 0x001050 00:9040: 20 94 F2
loc_00_9043:
	LDA tbl_0F_E22B,Y               ;C - - - - - 0x001053 00:9043: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x001056 00:9046: 20 40 F4
loc_00_9049:
	LDA objY                        ;C - - - - - 0x001059 00:9049: AD C0 03
	CMP #$7C                        ;C - - - - - 0x00105C 00:904C: C9 7C
	BCS loc_00_9054                 ;C - - - - - 0x00105E 00:904E: B0 04
	JSR ApplyVelYAdd                ;c - - - - - 0x001060 00:9050: 20 BF F1
	RTS                             ;c - - - - - 0x001063 00:9053: 60
loc_00_9054:
	LDA objY                        ;C - - - - - 0x001064 00:9054: AD C0 03
	CMP #$80                        ;C - - - - - 0x001067 00:9057: C9 80
	BCC loc_00_905F                 ;C - - - - - 0x001069 00:9059: 90 04
	JSR ApplyVelYUpAlt              ;C - - - - - 0x00106B 00:905B: 20 DF F1
	RTS                             ;C - - - - - 0x00106E 00:905E: 60
loc_00_905F:
	JSR ApplyVelXAdd                ;C - - - - - 0x00106F 00:905F: 20 83 F1
	JSR SetPlayerFlag40             ;C - - - - - 0x001072 00:9062: 20 3F F0
	INC objActive                   ;C - - - - - 0x001075 00:9065: EE 00 03
	LDA #$38                        ;C - - - - - 0x001078 00:9068: A9 38
	STA objVelYLo                   ;C - - - - - 0x00107A 00:906A: 8D 20 04
	LDA #$04                        ;C - - - - - 0x00107D 00:906D: A9 04
	STA objVelYHi                   ;C - - - - - 0x00107F 00:906F: 8D 30 04
loc_00_9072:
	RTS                             ;C - - - - - 0x001082 00:9072: 60
loc_00_9073:
	LDA objActive                   ;C - - - - - 0x001083 00:9073: AD 00 03
	AND #$02                        ;C - - - - - 0x001086 00:9076: 29 02
	BNE loc_00_90C1                 ;C - - - - - 0x001088 00:9078: D0 47
	LDA objXPage                    ;C - - - - - 0x00108A 00:907A: AD 80 03
	CMP #$03                        ;C - - - - - 0x00108D 00:907D: C9 03
	BNE loc_00_90BD                 ;C - - - - - 0x00108F 00:907F: D0 3C
	LDA objX                        ;C - - - - - 0x001091 00:9081: AD 60 03
	CMP #$40                        ;C - - - - - 0x001094 00:9084: C9 40
	BCC loc_00_90BD                 ;C - - - - - 0x001096 00:9086: 90 35
	LDA objVelYHi                   ;C - - - - - 0x001098 00:9088: AD 30 04
	BMI loc_00_909E                 ;C - - - - - 0x00109B 00:908B: 30 11
	LDY playerId                    ;C - - - - - 0x00109D 00:908D: A4 34
	LDA tbl_0F_E1E9,Y               ;C - - - - - 0x00109F 00:908F: B9 E9 E1
	JSR SetPlayerAnim               ;C - - - - - 0x0010A2 00:9092: 20 94 F2
	LDA tbl_0F_E22E,Y               ;C - - - - - 0x0010A5 00:9095: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x0010A8 00:9098: 20 40 F4
	JMP loc_00_90AC                 ;C - - - - - 0x0010AB 00:909B: 4C AC 90
loc_00_909E:
	LDY playerId                    ;C - - - - - 0x0010AE 00:909E: A4 34
	LDA tbl_0F_E219,Y               ;C - - - - - 0x0010B0 00:90A0: B9 19 E2
	JSR SetPlayerAnim               ;C - - - - - 0x0010B3 00:90A3: 20 94 F2
	LDA tbl_0F_E22E,Y               ;C - - - - - 0x0010B6 00:90A6: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x0010B9 00:90A9: 20 40 F4
loc_00_90AC:
	JSR ApplyVelXAdd                ;C - - - - - 0x0010BC 00:90AC: 20 83 F1
	JSR ApplyVelY                   ;C - - - - - 0x0010BF 00:90AF: 20 FD F1
	LDA objY                        ;C - - - - - 0x0010C2 00:90B2: AD C0 03
	CMP #$7C                        ;C - - - - - 0x0010C5 00:90B5: C9 7C
	BCC loc_00_9072                 ;C - - - - - 0x0010C7 00:90B7: 90 B9
	INC objActive                   ;C - - - - - 0x0010C9 00:90B9: EE 00 03
	RTS                             ;C - - - - - 0x0010CC 00:90BC: 60
loc_00_90BD:
	JSR ApplyVelXAdd                ;C - - - - - 0x0010CD 00:90BD: 20 83 F1
	RTS                             ;C - - - - - 0x0010D0 00:90C0: 60
loc_00_90C1:
	LDA #$19                        ;C - - - - - 0x0010D1 00:90C1: A9 19
	STA gameAction                  ;C - - - - - 0x0010D3 00:90C3: 85 30
	LDA #$80                        ;C - - - - - 0x0010D5 00:90C5: A9 80
	STA objActive                   ;C - - - - - 0x0010D7 00:90C7: 8D 00 03
	RTS                             ;C - - - - - 0x0010DA 00:90CA: 60
GameActionDispatch00Tbl_8011_1F:
	LDA actionTimer                 ;C - - J - - 0x0010DB 00:90CB: A5 37
	BNE loc_00_9103                 ;C - - - - - 0x0010DD 00:90CD: D0 34
loc_00_90CF:
	LDY playerId                    ;C - - - - - 0x0010DF 00:90CF: A4 34
	LDA tbl_0F_E210,Y               ;C - - - - - 0x0010E1 00:90D1: B9 10 E2
	JSR SetPlayerAnim               ;C - - - - - 0x0010E4 00:90D4: 20 94 F2
	LDA tbl_0F_E258,Y               ;C - - - - - 0x0010E7 00:90D7: B9 58 E2
	JSR SetChrBank2                 ;C - - - - - 0x0010EA 00:90DA: 20 40 F4
	LDA objFlags                    ;C - - - - - 0x0010ED 00:90DD: AD 60 05
	CMP #$D0                        ;C - - - - - 0x0010F0 00:90E0: C9 D0
	BNE loc_00_90E8                 ;C - - - - - 0x0010F2 00:90E2: D0 04
	LDA #$01                        ;C - - - - - 0x0010F4 00:90E4: A9 01
	BNE loc_00_90EA                 ;C - - - - - 0x0010F6 00:90E6: D0 02
loc_00_90E8:
	LDA #$02                        ;C - - - - - 0x0010F8 00:90E8: A9 02
loc_00_90EA:
	STA playerFacing                ;C - - - - - 0x0010FA 00:90EA: 85 31
	LDA #$02                        ;C - - - - - 0x0010FC 00:90EC: A9 02
	STA gameAction                  ;C - - - - - 0x0010FE 00:90EE: 85 30
	LDA #$08                        ;C - - - - - 0x001100 00:90F0: A9 08
	STA actionTimer                 ;C - - - - - 0x001102 00:90F2: 85 37
	LDA #$00                        ;C - - - - - 0x001104 00:90F4: A9 00
	STA ram_00B3                    ;C - - - - - 0x001106 00:90F6: 85 B3
	STA jumpBaseY                   ;C - - - - - 0x001108 00:90F8: 85 A6
	STA actionStep                  ;C - - - - - 0x00110A 00:90FA: 85 35
	STA objStep                     ;C - - - - - 0x00110C 00:90FC: 8D 00 05
	STA objParamA                   ;C - - - - - 0x00110F 00:90FF: 8D 10 05
	RTS                             ;C - - - - - 0x001112 00:9102: 60
loc_00_9103:
	LDA playerHealth                ;C - - - - - 0x001113 00:9103: A5 3A
	BPL loc_00_9114                 ;C - - - - - 0x001115 00:9105: 10 0D
	LDA #$80                        ;C - - - - - 0x001117 00:9107: A9 80
	STA playerBusy                  ;C - - - - - 0x001119 00:9109: 85 6E
	LDA #$0B                        ;C - - - - - 0x00111B 00:910B: A9 0B
	STA gameAction                  ;C - - - - - 0x00111D 00:910D: 85 30
	LDA #$78                        ;C - - - - - 0x00111F 00:910F: A9 78
	STA actionTimer                 ;C - - - - - 0x001121 00:9111: 85 37
	RTS                             ;C - - - - - 0x001123 00:9113: 60
loc_00_9114:
	LDA padPressed                  ;C - - - - - 0x001124 00:9114: A5 14
	CMP #$01                        ;C - - - - - 0x001126 00:9116: C9 01
	BEQ loc_00_9139                 ;C - - - - - 0x001128 00:9118: F0 1F
	CMP #$02                        ;C - - - - - 0x00112A 00:911A: C9 02
	BEQ loc_00_9139                 ;C - - - - - 0x00112C 00:911C: F0 1B
	CMP #$08                        ;C - - - - - 0x00112E 00:911E: C9 08
	BEQ loc_00_9139                 ;C - - - - - 0x001130 00:9120: F0 17
	CMP #$04                        ;C - - - - - 0x001132 00:9122: C9 04
	BEQ loc_00_9139                 ;C - - - - - 0x001134 00:9124: F0 13
	CMP #$09                        ;C - - - - - 0x001136 00:9126: C9 09
	BEQ loc_00_9139                 ;C - - - - - 0x001138 00:9128: F0 0F
	CMP #$0A                        ;C - - - - - 0x00113A 00:912A: C9 0A
	BEQ loc_00_9139                 ;C - - - - - 0x00113C 00:912C: F0 0B
	CMP #$05                        ;C - - - - - 0x00113E 00:912E: C9 05
	BEQ loc_00_9139                 ;C - - - - - 0x001140 00:9130: F0 07
	CMP #$06                        ;C - - - - - 0x001142 00:9132: C9 06
	BEQ loc_00_9139                 ;C - - - - - 0x001144 00:9134: F0 03
	DEC actionTimer                 ;C - - - - - 0x001146 00:9136: C6 37
	RTS                             ;C - - - - - 0x001148 00:9138: 60
loc_00_9139:
	INC objStep                     ;C - - - - - 0x001149 00:9139: EE 00 05
	LDA objStep                     ;C - - - - - 0x00114C 00:913C: AD 00 05
	LDY playerLevel                 ;C - - - - - 0x00114F 00:913F: A4 6B
	CMP GameActionDispatch00Tbl_9147,Y;C - - - - - 0x001151 00:9141: D9 47 91
	BEQ loc_00_90CF                 ;C - - - - - 0x001154 00:9144: F0 89
	RTS                             ;C - - - - - 0x001156 00:9146: 60
GameActionDispatch00Tbl_9147:
	.byte $14,$12,$10,$0E,$0C,$0A   ;- D 0 - - - 0x001157 00:9147:
GameActionDispatch00Tbl_8011_1A:
	LDA objActive                   ;C - - J - - 0x00115D 00:914D: AD 00 03
	AND #$0F                        ;C - - - - - 0x001160 00:9150: 29 0F
	BNE loc_00_9171                 ;C - - - - - 0x001162 00:9152: D0 1D
	LDA objX                        ;C - - - - - 0x001164 00:9154: AD 60 03
	CMP #$80                        ;C - - - - - 0x001167 00:9157: C9 80
	BCS loc_00_9166                 ;C - - - - - 0x001169 00:9159: B0 0B
	JSR SetPlayerFlag40             ;C - - - - - 0x00116B 00:915B: 20 3F F0
	LDA #$01                        ;C - - - - - 0x00116E 00:915E: A9 01
	STA objFacing                   ;C - - - - - 0x001170 00:9160: 8D 60 04
	JMP loc_00_916E                 ;C - - - - - 0x001173 00:9163: 4C 6E 91
loc_00_9166:
	JSR ClearPlayerFlag40           ;C - - - - - 0x001176 00:9166: 20 48 F0
	LDA #$02                        ;C - - - - - 0x001179 00:9169: A9 02
	STA objFacing                   ;C - - - - - 0x00117B 00:916B: 8D 60 04
loc_00_916E:
	INC objActive                   ;C - - - - - 0x00117E 00:916E: EE 00 03
loc_00_9171:
	LDA objActive                   ;C - - - - - 0x001181 00:9171: AD 00 03
	AND #$02                        ;C - - - - - 0x001184 00:9174: 29 02
	BNE loc_00_91B3                 ;C - - - - - 0x001186 00:9176: D0 3B
	LDA objY                        ;C - - - - - 0x001188 00:9178: AD C0 03
	CMP #$82                        ;C - - - - - 0x00118B 00:917B: C9 82
	BCS loc_00_9183                 ;C - - - - - 0x00118D 00:917D: B0 04
	JSR ApplyVelYAdd                ;c - - - - - 0x00118F 00:917F: 20 BF F1
	RTS                             ;c - - - - - 0x001192 00:9182: 60
loc_00_9183:
	LDA objY                        ;C - - - - - 0x001193 00:9183: AD C0 03
	CMP #$84                        ;C - - - - - 0x001196 00:9186: C9 84
	BCC loc_00_918E                 ;C - - - - - 0x001198 00:9188: 90 04
	JSR ApplyVelYUpAlt              ;C - - - - - 0x00119A 00:918A: 20 DF F1
	RTS                             ;C - - - - - 0x00119D 00:918D: 60
loc_00_918E:
	LDA objFacing                   ;C - - - - - 0x00119E 00:918E: AD 60 04
	AND #$01                        ;C - - - - - 0x0011A1 00:9191: 29 01
	BEQ loc_00_91A5                 ;C - - - - - 0x0011A3 00:9193: F0 10
	JSR ApplyVelXAdd                ;C - - - - - 0x0011A5 00:9195: 20 83 F1
	LDA objX                        ;C - - - - - 0x0011A8 00:9198: AD 60 03
	CMP #$80                        ;C - - - - - 0x0011AB 00:919B: C9 80
	BCC loc_00_91B2                 ;C - - - - - 0x0011AD 00:919D: 90 13
	INC objActive                   ;C - - - - - 0x0011AF 00:919F: EE 00 03
	JMP loc_00_91B2                 ;C - - - - - 0x0011B2 00:91A2: 4C B2 91
loc_00_91A5:
	JSR ApplyVelXSub                ;C - - - - - 0x0011B5 00:91A5: 20 A1 F1
	LDA objX                        ;C - - - - - 0x0011B8 00:91A8: AD 60 03
	CMP #$80                        ;C - - - - - 0x0011BB 00:91AB: C9 80
	BCS loc_00_91B2                 ;C - - - - - 0x0011BD 00:91AD: B0 03
	INC objActive                   ;C - - - - - 0x0011BF 00:91AF: EE 00 03
loc_00_91B2:
	RTS                             ;C - - - - - 0x0011C2 00:91B2: 60
loc_00_91B3:
	LDA #$40                        ;C - - - - - 0x0011C3 00:91B3: A9 40
	STA padPressed                  ;C - - - - - 0x0011C5 00:91B5: 85 14
	LDA #$00                        ;C - - - - - 0x0011C7 00:91B7: A9 00
	STA actionStep                  ;C - - - - - 0x0011C9 00:91B9: 85 35
	STA timerA3                     ;C - - - - - 0x0011CB 00:91BB: 85 A3
	RTS                             ;C - - - - - 0x0011CD 00:91BD: 60
GameActionDispatch00Tbl_8011_26:
	LDA objActive                   ;C - - J - - 0x0011CE 00:91BE: AD 00 03
	AND #$0F                        ;C - - - - - 0x0011D1 00:91C1: 29 0F
	BNE loc_00_9227                 ;C - - - - - 0x0011D3 00:91C3: D0 62
	LDA #$00                        ;C - - - - - 0x0011D5 00:91C5: A9 00
	STA ram_00BB                    ;C - - - - - 0x0011D7 00:91C7: 85 BB
	JSR ClearTimerA4                ;C - - - - - 0x0011D9 00:91C9: 20 36 F4
	LDY playerId                    ;C - - - - - 0x0011DC 00:91CC: A4 34
	LDA objAnim                     ;C - - - - - 0x0011DE 00:91CE: AD 80 05
	CMP tbl_0F_E273,Y               ;C - - - - - 0x0011E1 00:91D1: D9 73 E2
	BEQ loc_00_91FD                 ;C - - - - - 0x0011E4 00:91D4: F0 27
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x0011E6 00:91D6: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x0011E9 00:91D9: 20 94 F2
	LDA tbl_0F_E22B,Y               ;C - - - - - 0x0011EC 00:91DC: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x0011EF 00:91DF: 20 40 F4
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x0011F2 00:91E2: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x0011F5 00:91E5: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x0011F8 00:91E8: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x0011FB 00:91EB: 8D 10 04
	LDA tbl_0F_E1C7,Y               ;C - - - - - 0x0011FE 00:91EE: B9 C7 E1
	STA objVelYLo                   ;C - - - - - 0x001201 00:91F1: 8D 20 04
	LDA tbl_0F_E1CA,Y               ;C - - - - - 0x001204 00:91F4: B9 CA E1
	STA objVelYHi                   ;C - - - - - 0x001207 00:91F7: 8D 30 04
	JSR SetPlayerFlag40             ;C - - - - - 0x00120A 00:91FA: 20 3F F0
loc_00_91FD:
	LDA objY                        ;C - - - - - 0x00120D 00:91FD: AD C0 03
	CMP #$90                        ;C - - - - - 0x001210 00:9200: C9 90
	BCS loc_00_9208                 ;C - - - - - 0x001212 00:9202: B0 04
	JSR ApplyVelYAdd                ;C - - - - - 0x001214 00:9204: 20 BF F1
	RTS                             ;C - - - - - 0x001217 00:9207: 60
loc_00_9208:
	LDA objY                        ;C - - - - - 0x001218 00:9208: AD C0 03
	CMP #$9C                        ;C - - - - - 0x00121B 00:920B: C9 9C
	BCC loc_00_9213                 ;C - - - - - 0x00121D 00:920D: 90 04
	JSR ApplyVelYUpAlt              ;c - - - - - 0x00121F 00:920F: 20 DF F1
	RTS                             ;c - - - - - 0x001222 00:9212: 60
loc_00_9213:
	JSR ApplyVelXAdd                ;C - - - - - 0x001223 00:9213: 20 83 F1
	JSR SetPlayerFlag40             ;C - - - - - 0x001226 00:9216: 20 3F F0
	INC objActive                   ;C - - - - - 0x001229 00:9219: EE 00 03
	LDA #$38                        ;C - - - - - 0x00122C 00:921C: A9 38
	STA objVelYLo                   ;C - - - - - 0x00122E 00:921E: 8D 20 04
	LDA #$04                        ;C - - - - - 0x001231 00:9221: A9 04
	STA objVelYHi                   ;C - - - - - 0x001233 00:9223: 8D 30 04
	RTS                             ;C - - - - - 0x001236 00:9226: 60
loc_00_9227:
	LDA objActive                   ;C - - - - - 0x001237 00:9227: AD 00 03
	AND #$0F                        ;C - - - - - 0x00123A 00:922A: 29 0F
	CMP #$02                        ;C - - - - - 0x00123C 00:922C: C9 02
	BEQ loc_00_9249                 ;C - - - - - 0x00123E 00:922E: F0 19
	CMP #$03                        ;C - - - - - 0x001240 00:9230: C9 03
	BEQ loc_00_9268                 ;C - - - - - 0x001242 00:9232: F0 34
	LDA objXPage                    ;C - - - - - 0x001244 00:9234: AD 80 03
	CMP #$03                        ;C - - - - - 0x001247 00:9237: C9 03
	BNE loc_00_9245                 ;C - - - - - 0x001249 00:9239: D0 0A
	LDA objX                        ;C - - - - - 0x00124B 00:923B: AD 60 03
	CMP #$88                        ;C - - - - - 0x00124E 00:923E: C9 88
	BCC loc_00_9245                 ;C - - - - - 0x001250 00:9240: 90 03
	INC objActive                   ;C - - - - - 0x001252 00:9242: EE 00 03
loc_00_9245:
	JSR ApplyVelXAdd                ;C - - - - - 0x001255 00:9245: 20 83 F1
	RTS                             ;C - - - - - 0x001258 00:9248: 60
loc_00_9249:
	LDY playerId                    ;C - - - - - 0x001259 00:9249: A4 34
	LDA tbl_0F_E210,Y               ;C - - - - - 0x00125B 00:924B: B9 10 E2
	JSR SetPlayerAnim               ;C - - - - - 0x00125E 00:924E: 20 94 F2
	LDA tbl_0F_E258,Y               ;C - - - - - 0x001261 00:9251: B9 58 E2
	JSR SetChrBank2                 ;C - - - - - 0x001264 00:9254: 20 40 F4
	INC objActive                   ;C - - - - - 0x001267 00:9257: EE 00 03
	LDA #$6E                        ;C - - - - - 0x00126A 00:925A: A9 6E
	STA objVelYLo                   ;C - - - - - 0x00126C 00:925C: 8D 20 04
	LDA #$04                        ;C - - - - - 0x00126F 00:925F: A9 04
	STA objVelYHi                   ;C - - - - - 0x001271 00:9261: 8D 30 04
	JSR SpawnObj6B                  ;C - - - - - 0x001274 00:9264: 20 97 92
	RTS                             ;C - - - - - 0x001277 00:9267: 60
loc_00_9268:
	LDY playerId                    ;C - - - - - 0x001278 00:9268: A4 34
	LDA objAnim                     ;C - - - - - 0x00127A 00:926A: AD 80 05
	CMP GameActionDispatch00Tbl_9294,Y;C - - - - - 0x00127D 00:926D: D9 94 92
	BEQ loc_00_9273                 ;C - - - - - 0x001280 00:9270: F0 01
	RTS                             ;C - - - - - 0x001282 00:9272: 60
loc_00_9273:
	JSR ApplyVelY                   ;C - - - - - 0x001283 00:9273: 20 FD F1
	JSR ApplyVelXAdd                ;C - - - - - 0x001286 00:9276: 20 83 F1
	LDA objY                        ;C - - - - - 0x001289 00:9279: AD C0 03
	CMP #$A8                        ;C - - - - - 0x00128C 00:927C: C9 A8
	BCC loc_00_9293                 ;C - - - - - 0x00128E 00:927E: 90 13
	LDA objFlags                    ;C - - - - - 0x001290 00:9280: AD 60 05
	ORA #$20                        ;C - - - - - 0x001293 00:9283: 09 20
	STA objFlags                    ;C - - - - - 0x001295 00:9285: 8D 60 05
	LDA objY                        ;C - - - - - 0x001298 00:9288: AD C0 03
	CMP #$B0                        ;C - - - - - 0x00129B 00:928B: C9 B0
	BCC loc_00_9293                 ;C - - - - - 0x00129D 00:928D: 90 04
	LDA #$0E                        ;C - - - - - 0x00129F 00:928F: A9 0E
	STA gameAction                  ;C - - - - - 0x0012A1 00:9291: 85 30
loc_00_9293:
	RTS                             ;C - - - - - 0x0012A3 00:9293: 60
GameActionDispatch00Tbl_9294:
	.byte $28,$29,$2A               ;- D 0 - - - 0x0012A4 00:9294:
SpawnObj6B:
	LDA #$00                        ;C - - - - - 0x0012A7 00:9297: A9 00
	STA objX+13                     ;C - - - - - 0x0012A9 00:9299: 8D 6D 03
	LDA #$90                        ;C - - - - - 0x0012AC 00:929C: A9 90
	STA objY+13                     ;C - - - - - 0x0012AE 00:929E: 8D CD 03
	LDA objXPage                    ;C - - - - - 0x0012B1 00:92A1: AD 80 03
	STA objXPage+13                 ;C - - - - - 0x0012B4 00:92A4: 8D 8D 03
	LDA objYPage                    ;C - - - - - 0x0012B7 00:92A7: AD E0 03
	STA objYPage+13                 ;C - - - - - 0x0012BA 00:92AA: 8D ED 03
	LDY #$0D                        ;C - - - - - 0x0012BD 00:92AD: A0 0D
	LDA #$B7                        ;C - - - - - 0x0012BF 00:92AF: A9 B7
	JSR SetAnimY                    ;C - - - - - 0x0012C1 00:92B1: 20 A0 F2
	LDA #$6B                        ;C - - - - - 0x0012C4 00:92B4: A9 6B
	STA objKind+13                  ;C - - - - - 0x0012C6 00:92B6: 8D 2D 03
	RTS                             ;C - - - - - 0x0012C9 00:92B9: 60
GameActionDispatch00Tbl_8011_29:
	LDA actionTimer                 ;C - - J - - 0x0012CA 00:92BA: A5 37
	BMI loc_00_92C1                 ;C - - - - - 0x0012CC 00:92BC: 30 03
	DEC actionTimer                 ;C - - - - - 0x0012CE 00:92BE: C6 37
	RTS                             ;C - - - - - 0x0012D0 00:92C0: 60
loc_00_92C1:
	LDA objActive                   ;C - - - - - 0x0012D1 00:92C1: AD 00 03
	AND #$0F                        ;C - - - - - 0x0012D4 00:92C4: 29 0F
	BNE loc_00_92D3                 ;C - - - - - 0x0012D6 00:92C6: D0 0B
	JSR ResetPlayerStand            ;C - - - - - 0x0012D8 00:92C8: 20 AA CE
	LDA #$10                        ;C - - - - - 0x0012DB 00:92CB: A9 10
	STA objStep                     ;C - - - - - 0x0012DD 00:92CD: 8D 00 05
	INC objActive                   ;C - - - - - 0x0012E0 00:92D0: EE 00 03
loc_00_92D3:
	LDA objStep                     ;C - - - - - 0x0012E3 00:92D3: AD 00 05
	BMI loc_00_92DC                 ;C - - - - - 0x0012E6 00:92D6: 30 04
	DEC objStep                     ;C - - - - - 0x0012E8 00:92D8: CE 00 05
	RTS                             ;C - - - - - 0x0012EB 00:92DB: 60
loc_00_92DC:
	LDA #$0E                        ;C - - - - - 0x0012EC 00:92DC: A9 0E
	STA gameAction                  ;C - - - - - 0x0012EE 00:92DE: 85 30
	RTS                             ;C - - - - - 0x0012F0 00:92E0: 60
GameActionDispatch00Tbl_8011_19:
	LDA objActive                   ;C - - J - - 0x0012F1 00:92E1: AD 00 03
	AND #$0F                        ;C - - - - - 0x0012F4 00:92E4: 29 0F
	BNE loc_00_9352                 ;C - - - - - 0x0012F6 00:92E6: D0 6A
	LDA ram_005C                    ;C - - - - - 0x0012F8 00:92E8: A5 5C
	BEQ loc_00_9307                 ;C - - - - - 0x0012FA 00:92EA: F0 1B
	LDA stage                       ;C - - - - - 0x0012FC 00:92EC: A5 61
	CMP #$04                        ;C - - - - - 0x0012FE 00:92EE: C9 04
	BEQ loc_00_92F6                 ;C - - - - - 0x001300 00:92F0: F0 04
	LDA #$0E                        ;C - - - - - 0x001302 00:92F2: A9 0E
	BNE loc_00_92F8                 ;C - - - - - 0x001304 00:92F4: D0 02
loc_00_92F6:
	LDA #$0F                        ;c - - - - - 0x001306 00:92F6: A9 0F
loc_00_92F8:
	JSR QueueSoundSaved             ;C - - - - - 0x001308 00:92F8: 20 4A F3
	LDA #$FF                        ;C - - - - - 0x00130B 00:92FB: A9 FF
	STA gameOverFlag                ;C - - - - - 0x00130D 00:92FD: 85 62
	LDA #$00                        ;C - - - - - 0x00130F 00:92FF: A9 00
	STA ram_005C                    ;C - - - - - 0x001311 00:9301: 85 5C
	LDA #$D8                        ;C - - - - - 0x001313 00:9303: A9 D8
	BNE loc_00_9309                 ;C - - - - - 0x001315 00:9305: D0 02
loc_00_9307:
	LDA #$3C                        ;C - - - - - 0x001317 00:9307: A9 3C
loc_00_9309:
	STA actionTimer                 ;C - - - - - 0x001319 00:9309: 85 37
	LDA stage                       ;C - - - - - 0x00131B 00:930B: A5 61
	BNE loc_00_9319                 ;C - - - - - 0x00131D 00:930D: D0 0A
	LDA stageSection                ;C - - - - - 0x00131F 00:930F: A5 60
	CMP #$01                        ;C - - - - - 0x001321 00:9311: C9 01
	BNE loc_00_9319                 ;C - - - - - 0x001323 00:9313: D0 04
	LDA #$0F                        ;C - - - - - 0x001325 00:9315: A9 0F
	STA actionTimer                 ;C - - - - - 0x001327 00:9317: 85 37
loc_00_9319:
	JSR ClearTimerA4                ;C - - - - - 0x001329 00:9319: 20 36 F4
	LDA weaponHeld                  ;C - - - - - 0x00132C 00:931C: A5 A9
	BEQ loc_00_9327                 ;C - - - - - 0x00132E 00:931E: F0 07
	JSR InitSlot1Follower67         ;C - - - - - 0x001330 00:9320: 20 AF 93
	LDA #$00                        ;C - - - - - 0x001333 00:9323: A9 00
	STA weaponHeld                  ;C - - - - - 0x001335 00:9325: 85 A9
loc_00_9327:
	LDY playerId                    ;C - - - - - 0x001337 00:9327: A4 34
	LDA tbl_0F_E1E3,Y               ;C - - - - - 0x001339 00:9329: B9 E3 E1
	JSR SetPlayerAnim               ;C - - - - - 0x00133C 00:932C: 20 94 F2
	LDA tbl_0F_E22B,Y               ;C - - - - - 0x00133F 00:932F: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x001342 00:9332: 20 40 F4
	LDY playerId                    ;C - - - - - 0x001345 00:9335: A4 34
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x001347 00:9337: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x00134A 00:933A: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x00134D 00:933D: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x001350 00:9340: 8D 10 04
	LDA tbl_0F_E1C7,Y               ;C - - - - - 0x001353 00:9343: B9 C7 E1
	STA objVelYLo                   ;C - - - - - 0x001356 00:9346: 8D 20 04
	LDA tbl_0F_E1CA,Y               ;C - - - - - 0x001359 00:9349: B9 CA E1
	STA objVelYHi                   ;C - - - - - 0x00135C 00:934C: 8D 30 04
	INC objActive                   ;C - - - - - 0x00135F 00:934F: EE 00 03
loc_00_9352:
	LDA actionTimer                 ;C - - - - - 0x001362 00:9352: A5 37
	BEQ loc_00_9359                 ;C - - - - - 0x001364 00:9354: F0 03
	DEC actionTimer                 ;C - - - - - 0x001366 00:9356: C6 37
	RTS                             ;C - - - - - 0x001368 00:9358: 60
loc_00_9359:
	LDY stage                       ;C - - - - - 0x001369 00:9359: A4 61
	LDA SpawnObj6BTbl_9378,Y        ;C - - - - - 0x00136B 00:935B: B9 78 93
	STA ptr_02                      ;C - - - - - 0x00136E 00:935E: 85 02
	LDA SpawnObj6BTbl_937D,Y        ;C - - - - - 0x001370 00:9360: B9 7D 93
	STA ptr_02+1                    ;C - - - - - 0x001373 00:9363: 85 03
	LDA stageSection                ;C - - - - - 0x001375 00:9365: A5 60
	TAY                             ;C - - - - - 0x001377 00:9367: A8
	LDA (ptr_02),Y                  ;C - - - - - 0x001378 00:9368: B1 02
	TAY                             ;C - - - - - 0x00137A 00:936A: A8
	LDA SpawnObj6BTbl_9391,Y        ;C - - - - - 0x00137B 00:936B: B9 91 93
	STA ptr_04                      ;C - - - - - 0x00137E 00:936E: 85 04
	LDA SpawnObj6BTbl_93A0,Y        ;C - - - - - 0x001380 00:9370: B9 A0 93
	STA ptr_04+1                    ;C - - - - - 0x001383 00:9373: 85 05
	JMP (ptr_04)                    ;C - - - - - 0x001385 00:9375: 6C 04 00
SpawnObj6BTbl_9378:
	.lobytes SpawnObj6BTbl_9378_00, SpawnObj6BTbl_9378_01, SpawnObj6BTbl_9378_02, SpawnObj6BTbl_9378_03, SpawnObj6BTbl_9378_04;- D 0 - - - 0x001388 00:9378:
SpawnObj6BTbl_937D:
	.hibytes SpawnObj6BTbl_9378_00, SpawnObj6BTbl_9378_01, SpawnObj6BTbl_9378_02, SpawnObj6BTbl_9378_03, SpawnObj6BTbl_9378_04;- D 0 - - - 0x00138D 00:937D:
SpawnObj6BTbl_9378_00:
	.byte $00,$01,$02               ;- D 0 - I - 0x001392 00:9382:
SpawnObj6BTbl_9378_01:
	.byte $03,$04,$05               ;- D 0 - I - 0x001395 00:9385:
SpawnObj6BTbl_9378_02:
	.byte $06,$07,$08               ;- D 0 - I - 0x001398 00:9388:
SpawnObj6BTbl_9378_03:
	.byte $09                       ;- - - - - - 0x00139B 00:938B:
	.byte $0A,$0B                   ;- D 0 - I - 0x00139C 00:938C:
SpawnObj6BTbl_9378_04:
	.byte $0C,$0D                   ;- D 0 - I - 0x00139E 00:938E:
	.byte $0E                       ;- - - - - - 0x0013A0 00:9390:
SpawnObj6BTbl_9391:
	.lobytes SpawnObj6BTbl_9391_00, SpawnObj6BTbl_9391_01, SpawnObj6BTbl_9391_02, SpawnObj6BTbl_9391_03, SpawnObj6BTbl_9391_03, SpawnObj6BTbl_9391_05, SpawnObj6BTbl_9391_03, SpawnObj6BTbl_9391_07;- D 0 - - - 0x0013A1 00:9391:
	.lobytes SpawnObj6BTbl_9391_02, SpawnObj6BTbl_9391_09, SpawnObj6BTbl_9391_0A, SpawnObj6BTbl_9391_05, SpawnObj6BTbl_9391_0C, SpawnObj6BTbl_9391_0C, SpawnObj6BTbl_9391_0E;- D 0 - - - 0x0013A9 00:9399:
SpawnObj6BTbl_93A0:
	.hibytes SpawnObj6BTbl_9391_00, SpawnObj6BTbl_9391_01, SpawnObj6BTbl_9391_02, SpawnObj6BTbl_9391_03, SpawnObj6BTbl_9391_03, SpawnObj6BTbl_9391_05, SpawnObj6BTbl_9391_03, SpawnObj6BTbl_9391_07;- D 0 - - - 0x0013B0 00:93A0:
	.hibytes SpawnObj6BTbl_9391_02, SpawnObj6BTbl_9391_09, SpawnObj6BTbl_9391_0A, SpawnObj6BTbl_9391_05, SpawnObj6BTbl_9391_0C, SpawnObj6BTbl_9391_0C, SpawnObj6BTbl_9391_0E;- D 0 - - - 0x0013B8 00:93A8:
InitSlot1Follower67:
	LDA #$80                        ;C - - - - - 0x0013BF 00:93AF: A9 80
	STA objActive+1                 ;C - - - - - 0x0013C1 00:93B1: 8D 01 03
	LDA #$90                        ;C - - - - - 0x0013C4 00:93B4: A9 90
	STA objFlags+1                  ;C - - - - - 0x0013C6 00:93B6: 8D 61 05
	LDA objX                        ;C - - - - - 0x0013C9 00:93B9: AD 60 03
	STA objX+1                      ;C - - - - - 0x0013CC 00:93BC: 8D 61 03
	LDA objY                        ;C - - - - - 0x0013CF 00:93BF: AD C0 03
	STA objY+1                      ;C - - - - - 0x0013D2 00:93C2: 8D C1 03
	LDA objXPage                    ;C - - - - - 0x0013D5 00:93C5: AD 80 03
	STA objXPage+1                  ;C - - - - - 0x0013D8 00:93C8: 8D 81 03
	LDA objYPage                    ;C - - - - - 0x0013DB 00:93CB: AD E0 03
	STA objYPage+1                  ;C - - - - - 0x0013DE 00:93CE: 8D E1 03
	LDY playerId                    ;C - - - - - 0x0013E1 00:93D1: A4 34
	LDA InitSlot1Follower67Tbl_93EC,Y;C - - - - - 0x0013E3 00:93D3: B9 EC 93
	STA objAnim+1                   ;C - - - - - 0x0013E6 00:93D6: 8D 81 05
	LDA #$00                        ;C - - - - - 0x0013E9 00:93D9: A9 00
	STA objAnimFlags+1              ;C - - - - - 0x0013EB 00:93DB: 8D 91 05
	STA objAnimFrame+1              ;C - - - - - 0x0013EE 00:93DE: 8D 71 05
	LDA playerFacing                ;C - - - - - 0x0013F1 00:93E1: A5 31
	STA objFacing+1                 ;C - - - - - 0x0013F3 00:93E3: 8D 61 04
	LDA #$67                        ;C - - - - - 0x0013F6 00:93E6: A9 67
	STA objKind+1                   ;C - - - - - 0x0013F8 00:93E8: 8D 21 03
	RTS                             ;C - - - - - 0x0013FB 00:93EB: 60
InitSlot1Follower67Tbl_93EC:
	.byte $41                       ;- - - - - - 0x0013FC 00:93EC:
	.byte $5F                       ;- D 0 - - - 0x0013FD 00:93ED:
	.byte $51                       ;- - - - - - 0x0013FE 00:93EE:
SpawnObj6BTbl_9391_00:
	LDA objActive                   ;C - - J - - 0x0013FF 00:93EF: AD 00 03
	AND #$0F                        ;C - - - - - 0x001402 00:93F2: 29 0F
	CMP #$02                        ;C - - - - - 0x001404 00:93F4: C9 02
	BEQ loc_00_9413                 ;C - - - - - 0x001406 00:93F6: F0 1B
	LDY playerId                    ;C - - - - - 0x001408 00:93F8: A4 34
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x00140A 00:93FA: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x00140D 00:93FD: 20 94 F2
	LDA objX                        ;C - - - - - 0x001410 00:9400: AD 60 03
	CMP #$E0                        ;C - - - - - 0x001413 00:9403: C9 E0
	BCS loc_00_940D                 ;C - - - - - 0x001415 00:9405: B0 06
	JSR SetPlayerFlag40             ;C - - - - - 0x001417 00:9407: 20 3F F0
	JMP loc_00_9410                 ;C - - - - - 0x00141A 00:940A: 4C 10 94
loc_00_940D:
	JSR ClearPlayerFlag40           ;c - - - - - 0x00141D 00:940D: 20 48 F0
loc_00_9410:
	INC objActive                   ;C - - - - - 0x001420 00:9410: EE 00 03
loc_00_9413:
	LDA objY                        ;C - - - - - 0x001423 00:9413: AD C0 03
	CMP #$82                        ;C - - - - - 0x001426 00:9416: C9 82
	BCS loc_00_941E                 ;C - - - - - 0x001428 00:9418: B0 04
	JSR ApplyVelYAdd                ;c - - - - - 0x00142A 00:941A: 20 BF F1
	RTS                             ;c - - - - - 0x00142D 00:941D: 60
loc_00_941E:
	LDA objY                        ;C - - - - - 0x00142E 00:941E: AD C0 03
	CMP #$84                        ;C - - - - - 0x001431 00:9421: C9 84
	BCC loc_00_9429                 ;C - - - - - 0x001433 00:9423: 90 04
	JSR ApplyVelYUpAlt              ;C - - - - - 0x001435 00:9425: 20 DF F1
	RTS                             ;C - - - - - 0x001438 00:9428: 60
loc_00_9429:
	LDA objX                        ;C - - - - - 0x001439 00:9429: AD 60 03
	CMP #$E0                        ;C - - - - - 0x00143C 00:942C: C9 E0
	BCC loc_00_9439                 ;C - - - - - 0x00143E 00:942E: 90 09
	JSR ApplyVelXSub                ;c - - - - - 0x001440 00:9430: 20 A1 F1
	JSR ClearPlayerFlag40           ;c - - - - - 0x001443 00:9433: 20 48 F0
	JMP loc_00_943F                 ;c - - - - - 0x001446 00:9436: 4C 3F 94
loc_00_9439:
	JSR ApplyVelXAdd                ;C - - - - - 0x001449 00:9439: 20 83 F1
	JSR SetPlayerFlag40             ;C - - - - - 0x00144C 00:943C: 20 3F F0
loc_00_943F:
	LDA objActive                   ;C - - - - - 0x00144F 00:943F: AD 00 03
	AND #$0F                        ;C - - - - - 0x001452 00:9442: 29 0F
	CMP #$03                        ;C - - - - - 0x001454 00:9444: C9 03
	BEQ loc_00_9452                 ;C - - - - - 0x001456 00:9446: F0 0A
	LDA objX                        ;C - - - - - 0x001458 00:9448: AD 60 03
	CMP #$D0                        ;C - - - - - 0x00145B 00:944B: C9 D0
	BCC loc_00_945D                 ;C - - - - - 0x00145D 00:944D: 90 0E
	INC objActive                   ;C - - - - - 0x00145F 00:944F: EE 00 03
loc_00_9452:
	LDA objX                        ;C - - - - - 0x001462 00:9452: AD 60 03
	CMP #$E0                        ;C - - - - - 0x001465 00:9455: C9 E0
	BCC loc_00_945D                 ;C - - - - - 0x001467 00:9457: 90 04
	LDA #$0E                        ;C - - - - - 0x001469 00:9459: A9 0E
	STA gameAction                  ;C - - - - - 0x00146B 00:945B: 85 30
loc_00_945D:
	RTS                             ;C - - - - - 0x00146D 00:945D: 60
SpawnObj6BTbl_9391_01:
	LDA objActive                   ;C - - J - - 0x00146E 00:945E: AD 00 03
	AND #$0F                        ;C - - - - - 0x001471 00:9461: 29 0F
	CMP #$02                        ;C - - - - - 0x001473 00:9463: C9 02
	BEQ loc_00_9496                 ;C - - - - - 0x001475 00:9465: F0 2F
	CMP #$03                        ;C - - - - - 0x001477 00:9467: C9 03
	BEQ loc_00_94C5                 ;C - - - - - 0x001479 00:9469: F0 5A
	LDY playerId                    ;C - - - - - 0x00147B 00:946B: A4 34
	LDA objAnim                     ;C - - - - - 0x00147D 00:946D: AD 80 05
	CMP tbl_0F_E273,Y               ;C - - - - - 0x001480 00:9470: D9 73 E2
	BEQ loc_00_9481                 ;C - - - - - 0x001483 00:9473: F0 0C
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x001485 00:9475: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x001488 00:9478: 20 94 F2
	LDA tbl_0F_E22B,Y               ;C - - - - - 0x00148B 00:947B: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x00148E 00:947E: 20 40 F4
loc_00_9481:
	JSR ApplyVelXAdd                ;C - - - - - 0x001491 00:9481: 20 83 F1
	CMP #$B0                        ;C - - - - - 0x001494 00:9484: C9 B0
	BCC loc_00_94C4                 ;C - - - - - 0x001496 00:9486: 90 3C
	LDY #$01                        ;C - - - - - 0x001498 00:9488: A0 01
	JSR QueueVram128                ;C - - - - - 0x00149A 00:948A: 20 7A 98
	INC objActive                   ;C - - - - - 0x00149D 00:948D: EE 00 03
	LDA #$01                        ;C - - - - - 0x0014A0 00:9490: A9 01
	STA objStep                     ;C - - - - - 0x0014A2 00:9492: 8D 00 05
	RTS                             ;C - - - - - 0x0014A5 00:9495: 60
loc_00_9496:
	LDA objStep                     ;C - - - - - 0x0014A6 00:9496: AD 00 05
	BNE loc_00_94C1                 ;C - - - - - 0x0014A9 00:9499: D0 26
	LDY #$02                        ;C - - - - - 0x0014AB 00:949B: A0 02
	JSR QueueVram128                ;C - - - - - 0x0014AD 00:949D: 20 7A 98
	LDY playerId                    ;C - - - - - 0x0014B0 00:94A0: A4 34
	LDA tbl_0F_E219,Y               ;C - - - - - 0x0014B2 00:94A2: B9 19 E2
	JSR SetPlayerAnim               ;C - - - - - 0x0014B5 00:94A5: 20 94 F2
	LDA tbl_0F_E22E,Y               ;C - - - - - 0x0014B8 00:94A8: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x0014BB 00:94AB: 20 40 F4
	INC objActive                   ;C - - - - - 0x0014BE 00:94AE: EE 00 03
	LDA #$00                        ;C - - - - - 0x0014C1 00:94B1: A9 00
	STA objVelYLo                   ;C - - - - - 0x0014C3 00:94B3: 8D 20 04
	LDA #$02                        ;C - - - - - 0x0014C6 00:94B6: A9 02
	STA objVelYHi                   ;C - - - - - 0x0014C8 00:94B8: 8D 30 04
	LDA #$24                        ;C - - - - - 0x0014CB 00:94BB: A9 24
	JSR QueueSound                  ;C - - - - - 0x0014CD 00:94BD: 20 4C F3
	RTS                             ;C - - - - - 0x0014D0 00:94C0: 60
loc_00_94C1:
	DEC objStep                     ;C - - - - - 0x0014D1 00:94C1: CE 00 05
loc_00_94C4:
	RTS                             ;C - - - - - 0x0014D4 00:94C4: 60
loc_00_94C5:
	JSR ApplyVelYAdd                ;C - - - - - 0x0014D5 00:94C5: 20 BF F1
	LDA objY                        ;C - - - - - 0x0014D8 00:94C8: AD C0 03
	CMP #$88                        ;C - - - - - 0x0014DB 00:94CB: C9 88
	BCC loc_00_94D7                 ;C - - - - - 0x0014DD 00:94CD: 90 08
	LDA objFlags                    ;C - - - - - 0x0014DF 00:94CF: AD 60 05
	ORA #$20                        ;C - - - - - 0x0014E2 00:94D2: 09 20
	STA objFlags                    ;C - - - - - 0x0014E4 00:94D4: 8D 60 05
loc_00_94D7:
	LDA objY                        ;C - - - - - 0x0014E7 00:94D7: AD C0 03
	CMP #$AC                        ;C - - - - - 0x0014EA 00:94DA: C9 AC
	BCC loc_00_94C4                 ;C - - - - - 0x0014EC 00:94DC: 90 E6
	LDA #$F4                        ;C - - - - - 0x0014EE 00:94DE: A9 F4
	STA objFlags                    ;C - - - - - 0x0014F0 00:94E0: 8D 60 05
	LDA objY                        ;C - - - - - 0x0014F3 00:94E3: AD C0 03
	CMP #$E8                        ;C - - - - - 0x0014F6 00:94E6: C9 E8
	BCC loc_00_94C4                 ;C - - - - - 0x0014F8 00:94E8: 90 DA
	LDA #$0E                        ;C - - - - - 0x0014FA 00:94EA: A9 0E
	STA gameAction                  ;C - - - - - 0x0014FC 00:94EC: 85 30
	RTS                             ;C - - - - - 0x0014FE 00:94EE: 60
	.byte $05,$08,$07               ;- - - - - - 0x0014FF 00:94EF:
SpawnObj6BTbl_9391_02:
	LDA #$0E                        ;C - - J - - 0x001502 00:94F2: A9 0E
	STA gameAction                  ;C - - - - - 0x001504 00:94F4: 85 30
	RTS                             ;C - - - - - 0x001506 00:94F6: 60
SpawnObj6BTbl_9391_05:
	LDA #$FF                        ;C - - J - - 0x001507 00:94F7: A9 FF
	STA ram_00B2                    ;C - - - - - 0x001509 00:94F9: 85 B2
	LDA #$7F                        ;C - - - - - 0x00150B 00:94FB: A9 7F
	STA ram_003F                    ;C - - - - - 0x00150D 00:94FD: 85 3F
	LDA #$FD                        ;C - - - - - 0x00150F 00:94FF: A9 FD
	STA gameOverFlag                ;C - - - - - 0x001511 00:9501: 85 62
	LDA #$23                        ;C - - - - - 0x001513 00:9503: A9 23
	STA chrBankShadow+3             ;C - - - - - 0x001515 00:9505: 85 EB
	STA chrBankShadow+4             ;C - - - - - 0x001517 00:9507: 85 EC
	LDA #$35                        ;C - - - - - 0x001519 00:9509: A9 35
	STA chrBankShadow+5             ;C - - - - - 0x00151B 00:950B: 85 ED
	LDX #$00                        ;C - - - - - 0x00151D 00:950D: A2 00
loc_00_950F:
	LDA InitSlot1Follower67Tbl_955D,X;C - - - - - 0x00151F 00:950F: BD 5D 95
	STA palBuffer+24,X              ;C - - - - - 0x001522 00:9512: 9D 18 06
	STA palBase+24,X                ;C - - - - - 0x001525 00:9515: 9D 38 06
	INX                             ;C - - - - - 0x001528 00:9518: E8
	CPX #$08                        ;C - - - - - 0x001529 00:9519: E0 08
	BNE loc_00_950F                 ;C - - - - - 0x00152B 00:951B: D0 F2
	LDX #$FF                        ;C - - - - - 0x00152D 00:951D: A2 FF
	STX palUpdateFlag               ;C - - - - - 0x00152F 00:951F: 86 18
	LDA #$00                        ;C - - - - - 0x001531 00:9521: A9 00
	STA gameAction                  ;C - - - - - 0x001533 00:9523: 85 30
	STA actionStep                  ;C - - - - - 0x001535 00:9525: 85 35
	STA timerA3                     ;C - - - - - 0x001537 00:9527: 85 A3
	STA timerA4                     ;C - - - - - 0x001539 00:9529: 85 A4
	STA playerInvincible            ;C - - - - - 0x00153B 00:952B: 85 3B
	STA ram_00B3                    ;C - - - - - 0x00153D 00:952D: 85 B3
	JSR ResetPlayerStand            ;C - - - - - 0x00153F 00:952F: 20 AA CE
	LDA #$80                        ;C - - - - - 0x001542 00:9532: A9 80
	STA objActive+15                ;C - - - - - 0x001544 00:9534: 8D 0F 03
	STA objFlags+15                 ;C - - - - - 0x001547 00:9537: 8D 6F 05
	LDA #$00                        ;C - - - - - 0x00154A 00:953A: A9 00
	STA objX+15                     ;C - - - - - 0x00154C 00:953C: 8D 6F 03
	STA objY+15                     ;C - - - - - 0x00154F 00:953F: 8D CF 03
	STA objAnim+15                  ;C - - - - - 0x001552 00:9542: 8D 8F 05
	STA objAnimFlags+15             ;C - - - - - 0x001555 00:9545: 8D 9F 05
	STA objAnimFrame+15             ;C - - - - - 0x001558 00:9548: 8D 7F 05
	LDA objXPage                    ;C - - - - - 0x00155B 00:954B: AD 80 03
	STA objXPage+15                 ;C - - - - - 0x00155E 00:954E: 8D 8F 03
	LDA objYPage                    ;C - - - - - 0x001561 00:9551: AD E0 03
	STA objYPage+15                 ;C - - - - - 0x001564 00:9554: 8D EF 03
	LDA #$70                        ;C - - - - - 0x001567 00:9557: A9 70
	STA objKind+15                  ;C - - - - - 0x001569 00:9559: 8D 2F 03
	RTS                             ;C - - - - - 0x00156C 00:955C: 60
InitSlot1Follower67Tbl_955D:
	.byte $0F,$0F,$27,$17,$0F,$0F,$30,$25;- D 0 - - - 0x00156D 00:955D:
SpawnObj6BTbl_9391_03:
	LDA objActive                   ;C - - J - - 0x001575 00:9565: AD 00 03
	AND #$0F                        ;C - - - - - 0x001578 00:9568: 29 0F
	CMP #$02                        ;C - - - - - 0x00157A 00:956A: C9 02
	BEQ loc_00_957C                 ;C - - - - - 0x00157C 00:956C: F0 0E
	INC objActive                   ;C - - - - - 0x00157E 00:956E: EE 00 03
	LDY playerId                    ;C - - - - - 0x001581 00:9571: A4 34
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x001583 00:9573: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x001586 00:9576: 20 94 F2
	JSR SetPlayerFlag40             ;C - - - - - 0x001589 00:9579: 20 3F F0
loc_00_957C:
	JSR ApplyVelXAdd                ;C - - - - - 0x00158C 00:957C: 20 83 F1
	LDA objX                        ;C - - - - - 0x00158F 00:957F: AD 60 03
	CMP #$FC                        ;C - - - - - 0x001592 00:9582: C9 FC
	BCC loc_00_958A                 ;C - - - - - 0x001594 00:9584: 90 04
	LDA #$0E                        ;C - - - - - 0x001596 00:9586: A9 0E
	STA gameAction                  ;C - - - - - 0x001598 00:9588: 85 30
loc_00_958A:
	RTS                             ;C - - - - - 0x00159A 00:958A: 60
SpawnObj6BTbl_9391_07:
	LDA objActive                   ;C - - J - - 0x00159B 00:958B: AD 00 03
	AND #$0F                        ;C - - - - - 0x00159E 00:958E: 29 0F
	CMP #$02                        ;C - - - - - 0x0015A0 00:9590: C9 02
	BEQ loc_00_95BD                 ;C - - - - - 0x0015A2 00:9592: F0 29
	CMP #$03                        ;C - - - - - 0x0015A4 00:9594: C9 03
	BEQ loc_00_960B                 ;C - - - - - 0x0015A6 00:9596: F0 73
	LDY #$03                        ;C - - - - - 0x0015A8 00:9598: A0 03
	JSR QueueVram128                ;C - - - - - 0x0015AA 00:959A: 20 7A 98
	LDA #$21                        ;C - - - - - 0x0015AD 00:959D: A9 21
	JSR QueueSound                  ;C - - - - - 0x0015AF 00:959F: 20 4C F3
	LDY playerId                    ;C - - - - - 0x0015B2 00:95A2: A4 34
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x0015B4 00:95A4: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x0015B7 00:95A7: 20 94 F2
	LDA objX                        ;C - - - - - 0x0015BA 00:95AA: AD 60 03
	CMP #$E0                        ;C - - - - - 0x0015BD 00:95AD: C9 E0
	BCC loc_00_95B7                 ;C - - - - - 0x0015BF 00:95AF: 90 06
	JSR ClearPlayerFlag40           ;c - - - - - 0x0015C1 00:95B1: 20 48 F0
	JMP loc_00_95BA                 ;c - - - - - 0x0015C4 00:95B4: 4C BA 95
loc_00_95B7:
	JSR SetPlayerFlag40             ;C - - - - - 0x0015C7 00:95B7: 20 3F F0
loc_00_95BA:
	INC objActive                   ;C - - - - - 0x0015CA 00:95BA: EE 00 03
loc_00_95BD:
	LDA objY                        ;C - - - - - 0x0015CD 00:95BD: AD C0 03
	CMP #$9C                        ;C - - - - - 0x0015D0 00:95C0: C9 9C
	BCS loc_00_95C8                 ;C - - - - - 0x0015D2 00:95C2: B0 04
	JSR ApplyVelYAdd                ;C - - - - - 0x0015D4 00:95C4: 20 BF F1
	RTS                             ;C - - - - - 0x0015D7 00:95C7: 60
loc_00_95C8:
	LDA objY                        ;C - - - - - 0x0015D8 00:95C8: AD C0 03
	CMP #$A4                        ;C - - - - - 0x0015DB 00:95CB: C9 A4
	BCC loc_00_95D3                 ;C - - - - - 0x0015DD 00:95CD: 90 04
	JSR ApplyVelYUpAlt              ;c - - - - - 0x0015DF 00:95CF: 20 DF F1
	RTS                             ;c - - - - - 0x0015E2 00:95D2: 60
loc_00_95D3:
	LDA objActive                   ;C - - - - - 0x0015E3 00:95D3: AD 00 03
	AND #$0F                        ;C - - - - - 0x0015E6 00:95D6: 29 0F
	CMP #$03                        ;C - - - - - 0x0015E8 00:95D8: C9 03
	BEQ loc_00_960F                 ;C - - - - - 0x0015EA 00:95DA: F0 33
	LDA objFlags                    ;C - - - - - 0x0015EC 00:95DC: AD 60 05
	CMP #$90                        ;C - - - - - 0x0015EF 00:95DF: C9 90
	BNE loc_00_95F0                 ;C - - - - - 0x0015F1 00:95E1: D0 0D
	JSR ApplyVelXSub                ;c - - - - - 0x0015F3 00:95E3: 20 A1 F1
	LDA objX                        ;c - - - - - 0x0015F6 00:95E6: AD 60 03
	CMP #$C8                        ;c - - - - - 0x0015F9 00:95E9: C9 C8
	BCS loc_00_960F                 ;c - - - - - 0x0015FB 00:95EB: B0 22
	JMP loc_00_95FA                 ;c - - - - - 0x0015FD 00:95ED: 4C FA 95
loc_00_95F0:
	JSR ApplyVelXAdd                ;C - - - - - 0x001600 00:95F0: 20 83 F1
	LDA objX                        ;C - - - - - 0x001603 00:95F3: AD 60 03
	CMP #$C8                        ;C - - - - - 0x001606 00:95F6: C9 C8
	BCC loc_00_960F                 ;C - - - - - 0x001608 00:95F8: 90 15
loc_00_95FA:
	LDY playerId                    ;C - - - - - 0x00160A 00:95FA: A4 34
	LDA tbl_0F_E219,Y               ;C - - - - - 0x00160C 00:95FC: B9 19 E2
	JSR SetPlayerAnim               ;C - - - - - 0x00160F 00:95FF: 20 94 F2
	LDA tbl_0F_E22E,Y               ;C - - - - - 0x001612 00:9602: B9 2E E2
	JSR SetChrBank2                 ;C - - - - - 0x001615 00:9605: 20 40 F4
	INC objActive                   ;C - - - - - 0x001618 00:9608: EE 00 03
loc_00_960B:
	LDA #$0E                        ;C - - - - - 0x00161B 00:960B: A9 0E
	STA gameAction                  ;C - - - - - 0x00161D 00:960D: 85 30
loc_00_960F:
	RTS                             ;C - - - - - 0x00161F 00:960F: 60
SpawnObj6BTbl_9391_09:
	LDA #$0E                        ;c - - - - - 0x001620 00:9610: A9 0E
	STA gameAction                  ;c - - - - - 0x001622 00:9612: 85 30
	RTS                             ;c - - - - - 0x001624 00:9614: 60
SpawnObj6BTbl_9391_0A:
	LDA #$0E                        ;C - - J - - 0x001625 00:9615: A9 0E
	STA gameAction                  ;C - - - - - 0x001627 00:9617: 85 30
	RTS                             ;C - - - - - 0x001629 00:9619: 60
SpawnObj6BTbl_9391_0C:
	LDA #$0E                        ;C - - J - - 0x00162A 00:961A: A9 0E
	STA gameAction                  ;C - - - - - 0x00162C 00:961C: 85 30
	RTS                             ;C - - - - - 0x00162E 00:961E: 60
SpawnObj6BTbl_9391_0E:
	LDA objActive                   ;c - - - - - 0x00162F 00:961F: AD 00 03
	AND #$0F                        ;c - - - - - 0x001632 00:9622: 29 0F
	CMP #$02                        ;c - - - - - 0x001634 00:9624: C9 02
	BNE loc_00_9630                 ;c - - - - - 0x001636 00:9626: D0 08
	LDA #$B4                        ;c - - - - - 0x001638 00:9628: A9 B4
	STA objStep                     ;c - - - - - 0x00163A 00:962A: 8D 00 05
	INC objActive                   ;c - - - - - 0x00163D 00:962D: EE 00 03
loc_00_9630:
	DEC objStep                     ;c - - - - - 0x001640 00:9630: CE 00 05
	LDA objStep                     ;c - - - - - 0x001643 00:9633: AD 00 05
	BNE loc_00_963C                 ;c - - - - - 0x001646 00:9636: D0 04
	LDA #$0E                        ;c - - - - - 0x001648 00:9638: A9 0E
	STA gameAction                  ;c - - - - - 0x00164A 00:963A: 85 30
loc_00_963C:
	RTS                             ;c - - - - - 0x00164C 00:963C: 60
GameActionDispatch00Tbl_8011_1B:
	LDA objActive                   ;C - - J - - 0x00164D 00:963D: AD 00 03
	AND #$0F                        ;C - - - - - 0x001650 00:9640: 29 0F
	BNE loc_00_9662                 ;C - - - - - 0x001652 00:9642: D0 1E
	STA objVelXLo                   ;C - - - - - 0x001654 00:9644: 8D 00 04
	LDA #$01                        ;C - - - - - 0x001657 00:9647: A9 01
	STA objVelXHi                   ;C - - - - - 0x001659 00:9649: 8D 10 04
	INC objActive                   ;C - - - - - 0x00165C 00:964C: EE 00 03
	LDA #$1E                        ;C - - - - - 0x00165F 00:964F: A9 1E
	STA objStep                     ;C - - - - - 0x001661 00:9651: 8D 00 05
	LDY playerId                    ;C - - - - - 0x001664 00:9654: A4 34
	LDA InitSlot1Follower67Tbl_E1F2,Y;C - - - - - 0x001666 00:9656: B9 F2 E1
	JSR SetPlayerAnim               ;C - - - - - 0x001669 00:9659: 20 94 F2
	LDA InitSlot1Follower67Tbl_E23A,Y;C - - - - - 0x00166C 00:965C: B9 3A E2
	JSR SetChrBank2                 ;C - - - - - 0x00166F 00:965F: 20 40 F4
loc_00_9662:
	LDA objActive                   ;C - - - - - 0x001672 00:9662: AD 00 03
	AND #$02                        ;C - - - - - 0x001675 00:9665: 29 02
	BNE loc_00_9686                 ;C - - - - - 0x001677 00:9667: D0 1D
	LDA objAnimFrame                ;C - - - - - 0x001679 00:9669: AD 70 05
	CMP #$03                        ;C - - - - - 0x00167C 00:966C: C9 03
	BNE loc_00_9685                 ;C - - - - - 0x00167E 00:966E: D0 15
	LDA objAnimFlags                ;C - - - - - 0x001680 00:9670: AD 90 05
	BNE loc_00_9685                 ;C - - - - - 0x001683 00:9673: D0 10
	LDA #$21                        ;C - - - - - 0x001685 00:9675: A9 21
	JSR QueueSound                  ;C - - - - - 0x001687 00:9677: 20 4C F3
	LDY #$00                        ;C - - - - - 0x00168A 00:967A: A0 00
	JSR QueueVram128                ;C - - - - - 0x00168C 00:967C: 20 7A 98
	INC objActive                   ;C - - - - - 0x00168F 00:967F: EE 00 03
	JSR ResetPlayerStand            ;C - - - - - 0x001692 00:9682: 20 AA CE
loc_00_9685:
	RTS                             ;C - - - - - 0x001695 00:9685: 60
loc_00_9686:
	LDA objStep                     ;C - - - - - 0x001696 00:9686: AD 00 05
	BEQ loc_00_968F                 ;C - - - - - 0x001699 00:9689: F0 04
	DEC objStep                     ;C - - - - - 0x00169B 00:968B: CE 00 05
	RTS                             ;C - - - - - 0x00169E 00:968E: 60
loc_00_968F:
	LDY playerId                    ;C - - - - - 0x00169F 00:968F: A4 34
	LDA objAnim                     ;C - - - - - 0x0016A1 00:9691: AD 80 05
	CMP tbl_0F_E273,Y               ;C - - - - - 0x0016A4 00:9694: D9 73 E2
	BEQ loc_00_96A5                 ;C - - - - - 0x0016A7 00:9697: F0 0C
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x0016A9 00:9699: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x0016AC 00:969C: 20 94 F2
	LDA tbl_0F_E22B,Y               ;C - - - - - 0x0016AF 00:969F: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x0016B2 00:96A2: 20 40 F4
loc_00_96A5:
	JSR ApplyVelXAdd                ;C - - - - - 0x0016B5 00:96A5: 20 83 F1
	LDA objX                        ;C - - - - - 0x0016B8 00:96A8: AD 60 03
	CMP #$1C                        ;C - - - - - 0x0016BB 00:96AB: C9 1C
	BCC loc_00_96DB                 ;C - - - - - 0x0016BD 00:96AD: 90 2C
	LDA objFlags                    ;C - - - - - 0x0016BF 00:96AF: AD 60 05
	AND #$DF                        ;C - - - - - 0x0016C2 00:96B2: 29 DF
	STA objFlags                    ;C - - - - - 0x0016C4 00:96B4: 8D 60 05
	LDA objX                        ;C - - - - - 0x0016C7 00:96B7: AD 60 03
	CMP #$30                        ;C - - - - - 0x0016CA 00:96BA: C9 30
	BCC loc_00_96DB                 ;C - - - - - 0x0016CC 00:96BC: 90 1D
	LDA #$80                        ;C - - - - - 0x0016CE 00:96BE: A9 80
	STA objActive                   ;C - - - - - 0x0016D0 00:96C0: 8D 00 03
	LDA #$00                        ;C - - - - - 0x0016D3 00:96C3: A9 00
	STA gameAction                  ;C - - - - - 0x0016D5 00:96C5: 85 30
	STA objStep                     ;C - - - - - 0x0016D7 00:96C7: 8D 00 05
	LDA stage                       ;C - - - - - 0x0016DA 00:96CA: A5 61
	BNE loc_00_96DB                 ;C - - - - - 0x0016DC 00:96CC: D0 0D
	LDA stageSection                ;C - - - - - 0x0016DE 00:96CE: A5 60
	CMP #$01                        ;C - - - - - 0x0016E0 00:96D0: C9 01
	BEQ loc_00_96DC                 ;C - - - - - 0x0016E2 00:96D2: F0 08
	CMP #$03                        ;c - - - - - 0x0016E4 00:96D4: C9 03
	BEQ loc_00_96DC                 ;c - - - - - 0x0016E6 00:96D6: F0 04
	JSR ResetPlayerStand            ;c - - - - - 0x0016E8 00:96D8: 20 AA CE
loc_00_96DB:
	RTS                             ;C - - - - - 0x0016EB 00:96DB: 60
loc_00_96DC:
	LDA #$20                        ;C - - - - - 0x0016EC 00:96DC: A9 20
	STA gameAction                  ;C - - - - - 0x0016EE 00:96DE: 85 30
	LDY playerId                    ;C - - - - - 0x0016F0 00:96E0: A4 34
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x0016F2 00:96E2: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x0016F5 00:96E5: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x0016F8 00:96E8: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x0016FB 00:96EB: 8D 10 04
	RTS                             ;C - - - - - 0x0016FE 00:96EE: 60
GameActionDispatch00Tbl_8011_1C:
	LDA objActive                   ;C - - J - - 0x0016FF 00:96EF: AD 00 03
	AND #$0F                        ;C - - - - - 0x001702 00:96F2: 29 0F
	BNE loc_00_970F                 ;C - - - - - 0x001704 00:96F4: D0 19
	STA objVelYLo                   ;C - - - - - 0x001706 00:96F6: 8D 20 04
	LDA #$05                        ;C - - - - - 0x001709 00:96F9: A9 05
	STA objVelYHi                   ;C - - - - - 0x00170B 00:96FB: 8D 30 04
	LDY playerId                    ;C - - - - - 0x00170E 00:96FE: A4 34
	LDA tbl_0F_E20A,Y               ;C - - - - - 0x001710 00:9700: B9 0A E2
	JSR SetPlayerAnim               ;C - - - - - 0x001713 00:9703: 20 94 F2
	LDA tbl_0F_E252,Y               ;C - - - - - 0x001716 00:9706: B9 52 E2
	JSR SetChrBank2                 ;C - - - - - 0x001719 00:9709: 20 40 F4
	INC objActive                   ;C - - - - - 0x00171C 00:970C: EE 00 03
loc_00_970F:
	LDA objActive                   ;C - - - - - 0x00171F 00:970F: AD 00 03
	AND #$0F                        ;C - - - - - 0x001722 00:9712: 29 0F
	CMP #$02                        ;C - - - - - 0x001724 00:9714: C9 02
	BEQ loc_00_974A                 ;C - - - - - 0x001726 00:9716: F0 32
	CMP #$03                        ;C - - - - - 0x001728 00:9718: C9 03
	BEQ loc_00_9779                 ;C - - - - - 0x00172A 00:971A: F0 5D
	CMP #$04                        ;C - - - - - 0x00172C 00:971C: C9 04
	BNE loc_00_9723                 ;C - - - - - 0x00172E 00:971E: D0 03
	JMP loc_00_97A9                 ;C - - - - - 0x001730 00:9720: 4C A9 97
loc_00_9723:
	JSR ApplyVelYAdd                ;C - - - - - 0x001733 00:9723: 20 BF F1
	LDA objY                        ;C - - - - - 0x001736 00:9726: AD C0 03
	CMP #$98                        ;C - - - - - 0x001739 00:9729: C9 98
	BCC loc_00_9749                 ;C - - - - - 0x00173B 00:972B: 90 1C
	LDA #$05                        ;C - - - - - 0x00173D 00:972D: A9 05
	JSR QueueSoundSaved             ;C - - - - - 0x00173F 00:972F: 20 4A F3
	LDA #$E6                        ;C - - - - - 0x001742 00:9732: A9 E6
	STA objVelXLo                   ;C - - - - - 0x001744 00:9734: 8D 00 04
	LDA #$00                        ;C - - - - - 0x001747 00:9737: A9 00
	STA objVelXHi                   ;C - - - - - 0x001749 00:9739: 8D 10 04
	LDA #$E8                        ;C - - - - - 0x00174C 00:973C: A9 E8
	STA objVelYLo                   ;C - - - - - 0x00174E 00:973E: 8D 20 04
	LDA #$03                        ;C - - - - - 0x001751 00:9741: A9 03
	STA objVelYHi                   ;C - - - - - 0x001753 00:9743: 8D 30 04
	INC objActive                   ;C - - - - - 0x001756 00:9746: EE 00 03
loc_00_9749:
	RTS                             ;C - - - - - 0x001759 00:9749: 60
loc_00_974A:
	JSR ApplyVelY                   ;C - - - - - 0x00175A 00:974A: 20 FD F1
	JSR ApplyVelXAdd                ;C - - - - - 0x00175D 00:974D: 20 83 F1
	LDA objY                        ;C - - - - - 0x001760 00:9750: AD C0 03
	CMP #$A0                        ;C - - - - - 0x001763 00:9753: C9 A0
	BCC loc_00_9749                 ;C - - - - - 0x001765 00:9755: 90 F2
	INC objActive                   ;C - - - - - 0x001767 00:9757: EE 00 03
	LDY playerId                    ;C - - - - - 0x00176A 00:975A: A4 34
	LDA tbl_0F_E20D,Y               ;C - - - - - 0x00176C 00:975C: B9 0D E2
	JSR SetPlayerAnim               ;C - - - - - 0x00176F 00:975F: 20 94 F2
	LDA tbl_0F_E255,Y               ;C - - - - - 0x001772 00:9762: B9 55 E2
	JSR SetChrBank2                 ;C - - - - - 0x001775 00:9765: 20 40 F4
	LDY #$0F                        ;C - - - - - 0x001778 00:9768: A0 0F
	LDA InitSlot1Follower67Tbl_97F9,Y;C - - - - - 0x00177A 00:976A: B9 F9 97
	STA palBuffer,Y                 ;C - - - - - 0x00177D 00:976D: 99 00 06
	STA palBase,Y                   ;C - - - - - 0x001780 00:9770: 99 20 06
	DEY                             ;C - - - - - 0x001783 00:9773: 88
	BPL loc_00_979A                 ;C - - - - - 0x001784 00:9774: 10 24
	STY palUpdateFlag               ;c - - - - - 0x001786 00:9776: 84 18
	RTS                             ;c - - - - - 0x001788 00:9778: 60
loc_00_9779:
	LDA objAnimFrame                ;C - - - - - 0x001789 00:9779: AD 70 05
	CMP #$06                        ;C - - - - - 0x00178C 00:977C: C9 06
	BNE loc_00_97A8                 ;C - - - - - 0x00178E 00:977E: D0 28
	LDA objAnimFlags                ;C - - - - - 0x001790 00:9780: AD 90 05
	CMP #$0A                        ;C - - - - - 0x001793 00:9783: C9 0A
	BNE loc_00_97A8                 ;C - - - - - 0x001795 00:9785: D0 21
	LDY playerId                    ;C - - - - - 0x001797 00:9787: A4 34
	LDA tbl_0F_E210,Y               ;C - - - - - 0x001799 00:9789: B9 10 E2
	JSR SetPlayerAnim               ;C - - - - - 0x00179C 00:978C: 20 94 F2
	LDA tbl_0F_E258,Y               ;C - - - - - 0x00179F 00:978F: B9 58 E2
	JSR SetChrBank2                 ;C - - - - - 0x0017A2 00:9792: 20 40 F4
	INC objActive                   ;C - - - - - 0x0017A5 00:9795: EE 00 03
	LDY #$0F                        ;C - - - - - 0x0017A8 00:9798: A0 0F
loc_00_979A:
	LDA InitSlot1Follower67Tbl_97F9,Y;C - - - - - 0x0017AA 00:979A: B9 F9 97
	STA palBuffer,Y                 ;C - - - - - 0x0017AD 00:979D: 99 00 06
	STA palBase,Y                   ;C - - - - - 0x0017B0 00:97A0: 99 20 06
	DEY                             ;C - - - - - 0x0017B3 00:97A3: 88
	BPL loc_00_979A                 ;C - - - - - 0x0017B4 00:97A4: 10 F4
	STY palUpdateFlag               ;C - - - - - 0x0017B6 00:97A6: 84 18
loc_00_97A8:
	RTS                             ;C - - - - - 0x0017B8 00:97A8: 60
loc_00_97A9:
	LDA objAnimFlags                ;C - - - - - 0x0017B9 00:97A9: AD 90 05
	CMP #$08                        ;C - - - - - 0x0017BC 00:97AC: C9 08
	BNE loc_00_97A8                 ;C - - - - - 0x0017BE 00:97AE: D0 F8
	LDY #$0F                        ;C - - - - - 0x0017C0 00:97B0: A0 0F
loc_00_97B2:
	LDA InitSlot1Follower67Tbl_9809,Y;C - - - - - 0x0017C2 00:97B2: B9 09 98
	STA palBuffer,Y                 ;C - - - - - 0x0017C5 00:97B5: 99 00 06
	STA palBase,Y                   ;C - - - - - 0x0017C8 00:97B8: 99 20 06
	DEY                             ;C - - - - - 0x0017CB 00:97BB: 88
	BPL loc_00_97B2                 ;C - - - - - 0x0017CC 00:97BC: 10 F4
	STY palUpdateFlag               ;C - - - - - 0x0017CE 00:97BE: 84 18
	JSR InitPaletteAnimSlots        ;C - - - - - 0x0017D0 00:97C0: 20 C8 97
	LDA #$20                        ;C - - - - - 0x0017D3 00:97C3: A9 20
	STA gameAction                  ;C - - - - - 0x0017D5 00:97C5: 85 30
	RTS                             ;C - - - - - 0x0017D7 00:97C7: 60
InitPaletteAnimSlots:
	LDA #$80                        ;C - - - - - 0x0017D8 00:97C8: A9 80
	STA palAnimActive+2             ;C - - - - - 0x0017DA 00:97CA: 8D 02 01
	STA palAnimActive+3             ;C - - - - - 0x0017DD 00:97CD: 8D 03 01
	LDA #$05                        ;C - - - - - 0x0017E0 00:97D0: A9 05
	STA palAnimType+2               ;C - - - - - 0x0017E2 00:97D2: 8D 0A 01
	LDA #$06                        ;C - - - - - 0x0017E5 00:97D5: A9 06
	STA palAnimType+3               ;C - - - - - 0x0017E7 00:97D7: 8D 0B 01
	LDA #$00                        ;C - - - - - 0x0017EA 00:97DA: A9 00
	STA palAnimStep+2               ;C - - - - - 0x0017EC 00:97DC: 8D 06 01
	STA palAnimTimer+2              ;C - - - - - 0x0017EF 00:97DF: 8D 0E 01
	STA palAnimStep+3               ;C - - - - - 0x0017F2 00:97E2: 8D 07 01
	STA palAnimTimer+3              ;C - - - - - 0x0017F5 00:97E5: 8D 0F 01
	RTS                             ;C - - - - - 0x0017F8 00:97E8: 60
	.byte $0F,$00,$0F,$0F,$0F,$0F,$0C,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$07;- - - - - - 0x0017F9 00:97E9:
InitSlot1Follower67Tbl_97F9:
	.byte $0F,$10,$00,$0B,$0F,$05,$1C,$0C,$0F,$07,$0F,$0F,$0F,$05,$07,$17;- D 0 - - - 0x001809 00:97F9:
InitSlot1Follower67Tbl_9809:
	.byte $0F,$20,$10,$1B,$0F,$15,$2C,$1C,$0F,$17,$07,$0F,$0F,$15,$17,$27;- D 0 - - - 0x001819 00:9809:
GameActionDispatch00Tbl_8011_20:
	LDY playerId                    ;C - - J - - 0x001829 00:9819: A4 34
	LDA objAnim                     ;C - - - - - 0x00182B 00:981B: AD 80 05
	CMP tbl_0F_E273,Y               ;C - - - - - 0x00182E 00:981E: D9 73 E2
	BEQ loc_00_983B                 ;C - - - - - 0x001831 00:9821: F0 18
	LDA tbl_0F_E1E6,Y               ;C - - - - - 0x001833 00:9823: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x001836 00:9826: 20 94 F2
	LDA tbl_0F_E22B,Y               ;C - - - - - 0x001839 00:9829: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x00183C 00:982C: 20 40 F4
	LDA tbl_0F_E1C1,Y               ;C - - - - - 0x00183F 00:982F: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x001842 00:9832: 8D 00 04
	LDA tbl_0F_E1C4,Y               ;C - - - - - 0x001845 00:9835: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x001848 00:9838: 8D 10 04
loc_00_983B:
	JSR ApplyVelXAdd                ;C - - - - - 0x00184B 00:983B: 20 83 F1
	LDA stage                       ;C - - - - - 0x00184E 00:983E: A5 61
	BNE loc_00_985F                 ;C - - - - - 0x001850 00:9840: D0 1D
	LDA stageSection                ;C - - - - - 0x001852 00:9842: A5 60
	CMP #$01                        ;C - - - - - 0x001854 00:9844: C9 01
	BNE loc_00_985E                 ;C - - - - - 0x001856 00:9846: D0 16
	LDA objX                        ;C - - - - - 0x001858 00:9848: AD 60 03
	CMP #$B0                        ;C - - - - - 0x00185B 00:984B: C9 B0
	BCC loc_00_985E                 ;C - - - - - 0x00185D 00:984D: 90 0F
loc_00_984F:
	LDA #$80                        ;C - - - - - 0x00185F 00:984F: A9 80
	STA objActive                   ;C - - - - - 0x001861 00:9851: 8D 00 03
	LDA #$00                        ;C - - - - - 0x001864 00:9854: A9 00
	STA gameAction                  ;C - - - - - 0x001866 00:9856: 85 30
	STA objStep                     ;C - - - - - 0x001868 00:9858: 8D 00 05
	JSR ResetPlayerStand            ;C - - - - - 0x00186B 00:985B: 20 AA CE
loc_00_985E:
	RTS                             ;C - - - - - 0x00186E 00:985E: 60
loc_00_985F:
	LDA stage                       ;C - - - - - 0x00186F 00:985F: A5 61
	CMP #$04                        ;C - - - - - 0x001871 00:9861: C9 04
	BNE loc_00_985E                 ;C - - - - - 0x001873 00:9863: D0 F9
	LDA stageSection                ;C - - - - - 0x001875 00:9865: A5 60
	CMP #$02                        ;C - - - - - 0x001877 00:9867: C9 02
	BNE loc_00_985E                 ;C - - - - - 0x001879 00:9869: D0 F3
	LDA objXPage                    ;C - - - - - 0x00187B 00:986B: AD 80 03
	BEQ loc_00_985E                 ;C - - - - - 0x00187E 00:986E: F0 EE
	LDA objX                        ;C - - - - - 0x001880 00:9870: AD 60 03
	CMP #$80                        ;C - - - - - 0x001883 00:9873: C9 80
	BCC loc_00_985E                 ;C - - - - - 0x001885 00:9875: 90 E7
	JMP loc_00_984F                 ;C - - - - - 0x001887 00:9877: 4C 4F 98
; copies 128 bytes from a table to vramQueue
QueueVram128:
	STX ptr_0E+1                    ;C - - - - - 0x00188A 00:987A: 86 0F
	LDA QueueVram128Tbl_989A,Y      ;C - - - - - 0x00188C 00:987C: B9 9A 98
	STA ptr_00                      ;C - - - - - 0x00188F 00:987F: 85 00
	LDA QueueVram128Tbl_989E,Y      ;C - - - - - 0x001891 00:9881: B9 9E 98
	STA ptr_00+1                    ;C - - - - - 0x001894 00:9884: 85 01
	LDA #$00                        ;C - - - - - 0x001896 00:9886: A9 00
	TAX                             ;C - - - - - 0x001898 00:9888: AA
	TAY                             ;C - - - - - 0x001899 00:9889: A8
loc_00_988A:
	LDA (ptr_00),Y                  ;C - - - - - 0x00189A 00:988A: B1 00
	STA vramQueue,X                 ;C - - - - - 0x00189C 00:988C: 9D 80 07
	INX                             ;C - - - - - 0x00189F 00:988F: E8
	INY                             ;C - - - - - 0x0018A0 00:9890: C8
	CPY #$80                        ;C - - - - - 0x0018A1 00:9891: C0 80
	BNE loc_00_988A                 ;C - - - - - 0x0018A3 00:9893: D0 F5
	STY vramUpdateFlag0             ;C - - - - - 0x0018A5 00:9895: 84 19
	LDX ptr_0E+1                    ;C - - - - - 0x0018A7 00:9897: A6 0F
	RTS                             ;C - - - - - 0x0018A9 00:9899: 60
QueueVram128Tbl_989A:
	.lobytes QueueVram128Tbl_989A_00, QueueVram128Tbl_989A_01, QueueVram128Tbl_989A_02, QueueVram128Tbl_989A_03;- D 0 - - - 0x0018AA 00:989A:
QueueVram128Tbl_989E:
	.hibytes QueueVram128Tbl_989A_00, QueueVram128Tbl_989A_01, QueueVram128Tbl_989A_02, QueueVram128Tbl_989A_03;- D 0 - - - 0x0018AE 00:989E:
QueueVram128Tbl_989A_00:
	.byte $21,$44,$00,$2F,$21,$62,$02,$25,$26,$27,$21,$82,$02,$35,$6B,$7A;- D 0 - I - 0x0018B2 00:98A2:
	.byte $21,$A2,$02,$6A,$00,$5F,$21,$C2,$02,$00,$00,$5F,$21,$E2,$02,$00;- D 0 - I - 0x0018C2 00:98B2:
	.byte $00,$5F,$22,$02,$02,$00,$00,$5F,$22,$22,$02,$00,$00,$7B,$22,$42;- D 0 - I - 0x0018D2 00:98C2:
	.byte $01,$4E,$4F,$22,$62,$00,$5E,$FF;- D 0 - I - 0x0018E2 00:98D2:
QueueVram128Tbl_989A_01:
	.byte $21,$F4,$09,$87,$88,$89,$8A,$89,$8A,$87,$88,$89,$8A,$22,$11,$0C;- D 0 - I - 0x0018EA 00:98DA:
	.byte $87,$88,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$99,$22,$30,$0C;- D 0 - I - 0x0018FA 00:98EA:
	.byte $86,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9A,$22,$50,$0C;- D 0 - I - 0x00190A 00:98FA:
	.byte $96,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$99,$FF;- D 0 - I - 0x00191A 00:990A:
QueueVram128Tbl_989A_02:
	.byte $22,$71,$0A,$97,$98,$97,$98,$98,$98,$97,$98,$98,$98,$97,$FF;- D 0 - I - 0x001928 00:9918:
QueueVram128Tbl_989A_03:
	.byte $22,$B6,$04,$E8,$E9,$E9,$E9,$3F,$22,$D6,$05,$20,$F9,$DB,$DB,$6F;- D 0 - I - 0x001937 00:9927:
	.byte $4F,$FF,$F0,$38,$78,$8A,$90,$03,$9A,$82,$8C,$22,$07,$A0,$BE,$88;- D 0 - I - 0x001947 00:9937:
	.byte $D6,$52,$6B,$2C,$BA,$22,$EF,$A4,$EE,$88,$34,$24,$F9,$00,$42,$28;- D 0 - I - 0x001957 00:9947:
	.byte $30,$82,$8A,$20,$2A,$0A,$C9,$02,$E6,$AA,$28,$80,$AC,$8A,$16,$A0;- D 0 - I - 0x001967 00:9957:
	.byte $0D,$38,$A0,$AA,$D4,$8F,$B8,$8C,$05,$0A,$F5,$A3,$45,$AA,$5E,$AA;- D 0 - I - 0x001977 00:9967:
	.byte $54,$86,$6B,$AE,$FE,$AB,$CD,$CE,$C5,$1A,$08,$83,$EC,$A0,$BC,$9F;- D 0 - I - 0x001987 00:9977:
	.byte $26,$82,$EF,$02,$CE,$48,$FD,$09,$2C,$20,$AC,$2A,$E8,$0A,$51,$08;- D 0 - I - 0x001997 00:9987:
	.byte $64,$8A,$CF,$28,$D9,$88,$12,$0A,$C0,$82,$81,$81,$6A,$2A,$AA,$08;- D 0 - I - 0x0019A7 00:9997:
	.byte $F2,$2C,$48,$28,$2E,$01,$F2,$A0,$CC,$00,$1C,$A0,$A3,$CC,$DD,$D8;- - - - - - 0x0019B7 00:99A7:
	.byte $84,$92,$4D,$08,$77,$DE,$FC,$A8,$49,$A0,$70,$80,$B2,$43,$C7,$0D;- - - - - - 0x0019C7 00:99B7:
	.byte $50,$0A,$B0,$28,$A8,$9A,$BD,$3C,$DA,$2A,$82,$28,$DA,$42,$CB,$A2;- - - - - - 0x0019D7 00:99C7:
	.byte $3B,$02,$B9,$08,$0B,$C5,$6C,$E8,$54,$89,$08,$00,$01,$29,$60,$C2;- - - - - - 0x0019E7 00:99D7:
	.byte $BE,$10,$75,$2A,$FB,$EA,$A2,$A0,$63,$E2,$DD,$A8,$5B,$A9,$D6,$AB;- - - - - - 0x0019F7 00:99E7:
	.byte $54,$C6,$AA,$9B,$F4,$98,$D3,$AA,$ED;- - - - - - 0x001A07 00:99F7:
; types text from the script into the VRAM queue
RunTextScript_00:
	JSR ClearTextQueueRows_00       ;C - - - - - 0x001A10 00:9A00: 20 C0 9A
	LDY textScriptIdx               ;C - - - - - 0x001A13 00:9A03: A4 B8
	LDA RunTextScript_00Tbl_9B2C,Y  ;C - - - - - 0x001A15 00:9A05: B9 2C 9B
	STA ptr_0C                      ;C - - - - - 0x001A18 00:9A08: 85 0C
	LDA RunTextScript_00Tbl_9B33,Y  ;C - - - - - 0x001A1A 00:9A0A: B9 33 9B
	STA ptr_0C+1                    ;C - - - - - 0x001A1D 00:9A0D: 85 0D
	LDA #$00                        ;C - - - - - 0x001A1F 00:9A0F: A9 00
	STA ptr_0E                      ;C - - - - - 0x001A21 00:9A11: 85 0E
loc_00_9A13:
	LDA #$00                        ;C - - - - - 0x001A23 00:9A13: A9 00
	STA spriteFlipMask              ;C - - - - - 0x001A25 00:9A15: 85 10
	STA spriteBaseY                 ;C - - - - - 0x001A27 00:9A17: 85 12
loc_00_9A19:
	LDA #$00                        ;C - - - - - 0x001A29 00:9A19: A9 00
	STA spritePriorityBit           ;C - - - - - 0x001A2B 00:9A1B: 85 11
loc_00_9A1D:
	LDA padPressed                  ;C - - - - - 0x001A2D 00:9A1D: A5 14
	AND #$F0                        ;C - - - - - 0x001A2F 00:9A1F: 29 F0
	BNE loc_00_9A91                 ;C - - - - - 0x001A31 00:9A21: D0 6E
	LDX spriteFlipMask              ;C - - - - - 0x001A33 00:9A23: A6 10
	LDA RunTextScript_00Tbl_9A92,X  ;C - - - - - 0x001A35 00:9A25: BD 92 9A
	STA vramQueue                   ;C - - - - - 0x001A38 00:9A28: 8D 80 07
	LDA RunTextScript_00Tbl_9A95,X  ;C - - - - - 0x001A3B 00:9A2B: BD 95 9A
	CLC                             ;C - - - - - 0x001A3E 00:9A2E: 18
	ADC spritePriorityBit           ;C - - - - - 0x001A3F 00:9A2F: 65 11
	STA vramQueue+1                 ;C - - - - - 0x001A41 00:9A31: 8D 81 07
	LDA #$00                        ;C - - - - - 0x001A44 00:9A34: A9 00
	STA vramQueue+2                 ;C - - - - - 0x001A46 00:9A36: 8D 82 07
	LDY ptr_0E                      ;C - - - - - 0x001A49 00:9A39: A4 0E
	INC ptr_0E                      ;C - - - - - 0x001A4B 00:9A3B: E6 0E
	LDA (ptr_0C),Y                  ;C - - - - - 0x001A4D 00:9A3D: B1 0C
	CMP #$FF                        ;C - - - - - 0x001A4F 00:9A3F: C9 FF
	BEQ loc_00_9A8E                 ;C - - - - - 0x001A51 00:9A41: F0 4B
	CMP #$FE                        ;C - - - - - 0x001A53 00:9A43: C9 FE
	BEQ loc_00_9A7D                 ;C - - - - - 0x001A55 00:9A45: F0 36
	STA vramQueue+3                 ;C - - - - - 0x001A57 00:9A47: 8D 83 07
	LDA #$FF                        ;C - - - - - 0x001A5A 00:9A4A: A9 FF
	STA vramQueue+4                 ;C - - - - - 0x001A5C 00:9A4C: 8D 84 07
	STA vramUpdateFlag0             ;C - - - - - 0x001A5F 00:9A4F: 85 19
	LDA spriteFlipMask              ;C - - - - - 0x001A61 00:9A51: A5 10
	PHA                             ;C - - - - - 0x001A63 00:9A53: 48
	LDA spritePriorityBit           ;C - - - - - 0x001A64 00:9A54: A5 11
	PHA                             ;C - - - - - 0x001A66 00:9A56: 48
	JSR SetTextPortraitFrame        ;C - - - - - 0x001A67 00:9A57: 20 98 9A
	JSR RedrawAndWaitFrame          ;C - - - - - 0x001A6A 00:9A5A: 20 06 F4
	JSR WaitFrame                   ;C - - - - - 0x001A6D 00:9A5D: 20 31 FF
	JSR WaitFrame                   ;C - - - - - 0x001A70 00:9A60: 20 31 FF
	PLA                             ;C - - - - - 0x001A73 00:9A63: 68
	STA spritePriorityBit           ;C - - - - - 0x001A74 00:9A64: 85 11
	PLA                             ;C - - - - - 0x001A76 00:9A66: 68
	STA spriteFlipMask              ;C - - - - - 0x001A77 00:9A67: 85 10
	INC spritePriorityBit           ;C - - - - - 0x001A79 00:9A69: E6 11
	LDA frameCounter                ;C - - - - - 0x001A7B 00:9A6B: A5 92
	AND #$01                        ;C - - - - - 0x001A7D 00:9A6D: 29 01
	BNE loc_00_9A7A                 ;C - - - - - 0x001A7F 00:9A6F: D0 09
	LDA textScriptIdx               ;C - - - - - 0x001A81 00:9A71: A5 B8
	BNE loc_00_9A7A                 ;C - - - - - 0x001A83 00:9A73: D0 05
	LDA #$2B                        ;C - - - - - 0x001A85 00:9A75: A9 2B
	JSR QueueSound                  ;C - - - - - 0x001A87 00:9A77: 20 4C F3
loc_00_9A7A:
	JMP loc_00_9A1D                 ;C - - - - - 0x001A8A 00:9A7A: 4C 1D 9A
loc_00_9A7D:
	INC spriteFlipMask              ;C - - - - - 0x001A8D 00:9A7D: E6 10
	LDA spriteFlipMask              ;C - - - - - 0x001A8F 00:9A7F: A5 10
	CMP #$03                        ;C - - - - - 0x001A91 00:9A81: C9 03
	BNE loc_00_9A19                 ;C - - - - - 0x001A93 00:9A83: D0 94
	JSR WaitAfterText               ;C - - - - - 0x001A95 00:9A85: 20 16 9B
	JSR ClearTextQueueRows_00       ;C - - - - - 0x001A98 00:9A88: 20 C0 9A
	JMP loc_00_9A13                 ;C - - - - - 0x001A9B 00:9A8B: 4C 13 9A
loc_00_9A8E:
	JMP WaitAfterText               ;C - - - - - 0x001A9E 00:9A8E: 4C 16 9B
loc_00_9A91:
	RTS                             ;C - - - - - 0x001AA1 00:9A91: 60
RunTextScript_00Tbl_9A92:
	.byte $22,$22,$23               ;- D 0 - - - 0x001AA2 00:9A92:
RunTextScript_00Tbl_9A95:
	.byte $A7,$E7,$27               ;- D 0 - - - 0x001AA5 00:9A95:
SetTextPortraitFrame:
	LDA textScriptIdx               ;C - - - - - 0x001AA8 00:9A98: A5 B8
	CMP #$01                        ;C - - - - - 0x001AAA 00:9A9A: C9 01
	BEQ loc_00_9AA7                 ;C - - - - - 0x001AAC 00:9A9C: F0 09
	CMP #$05                        ;C - - - - - 0x001AAE 00:9A9E: C9 05
	BEQ loc_00_9AAE                 ;C - - - - - 0x001AB0 00:9AA0: F0 0C
	CMP #$06                        ;C - - - - - 0x001AB2 00:9AA2: C9 06
	BEQ loc_00_9AB5                 ;C - - - - - 0x001AB4 00:9AA4: F0 0F
	RTS                             ;C - - - - - 0x001AB6 00:9AA6: 60
loc_00_9AA7:
	LDA #$02                        ;C - - - - - 0x001AB7 00:9AA7: A9 02
	STA objAnimFrame                ;C - - - - - 0x001AB9 00:9AA9: 8D 70 05
	BNE loc_00_9ABA                 ;C - - - - - 0x001ABC 00:9AAC: D0 0C
loc_00_9AAE:
	LDA #$01                        ;C - - - - - 0x001ABE 00:9AAE: A9 01
	STA objAnimFrame                ;C - - - - - 0x001AC0 00:9AB0: 8D 70 05
	BNE loc_00_9ABA                 ;C - - - - - 0x001AC3 00:9AB3: D0 05
loc_00_9AB5:
	LDA #$00                        ;C - - - - - 0x001AC5 00:9AB5: A9 00
	STA objAnimFrame                ;C - - - - - 0x001AC7 00:9AB7: 8D 70 05
loc_00_9ABA:
	LDA #$00                        ;C - - - - - 0x001ACA 00:9ABA: A9 00
	STA objAnimFlags                ;C - - - - - 0x001ACC 00:9ABC: 8D 90 05
	RTS                             ;C - - - - - 0x001ACF 00:9ABF: 60
ClearTextQueueRows_00:
	LDA #$23                        ;C - - - - - 0x001AD0 00:9AC0: A9 23
	STA vramQueue                   ;C - - - - - 0x001AD2 00:9AC2: 8D 80 07
	LDA #$79                        ;C - - - - - 0x001AD5 00:9AC5: A9 79
	STA vramQueue+1                 ;C - - - - - 0x001AD7 00:9AC7: 8D 81 07
	LDA #$00                        ;C - - - - - 0x001ADA 00:9ACA: A9 00
	STA vramQueue+2                 ;C - - - - - 0x001ADC 00:9ACC: 8D 82 07
	LDA #$00                        ;C - - - - - 0x001ADF 00:9ACF: A9 00
	STA vramQueue+3                 ;C - - - - - 0x001AE1 00:9AD1: 8D 83 07
	LDA #$23                        ;C - - - - - 0x001AE4 00:9AD4: A9 23
	STA vramQueue+4                 ;C - - - - - 0x001AE6 00:9AD6: 8D 84 07
	LDA #$22                        ;C - - - - - 0x001AE9 00:9AD9: A9 22
	STA vramQueue+48                ;C - - - - - 0x001AEB 00:9ADB: 8D B0 07
	STA vramQueue+26                ;C - - - - - 0x001AEE 00:9ADE: 8D 9A 07
	LDA #$27                        ;C - - - - - 0x001AF1 00:9AE1: A9 27
	STA vramQueue+5                 ;C - - - - - 0x001AF3 00:9AE3: 8D 85 07
	LDA #$E7                        ;C - - - - - 0x001AF6 00:9AE6: A9 E7
	STA vramQueue+27                ;C - - - - - 0x001AF8 00:9AE8: 8D 9B 07
	LDA #$A7                        ;C - - - - - 0x001AFB 00:9AEB: A9 A7
	STA vramQueue+49                ;C - - - - - 0x001AFD 00:9AED: 8D B1 07
	LDX #$12                        ;C - - - - - 0x001B00 00:9AF0: A2 12
	STX vramQueue+6                 ;C - - - - - 0x001B02 00:9AF2: 8E 86 07
	STX vramQueue+28                ;C - - - - - 0x001B05 00:9AF5: 8E 9C 07
	STX vramQueue+50                ;C - - - - - 0x001B08 00:9AF8: 8E B2 07
	LDY #$00                        ;C - - - - - 0x001B0B 00:9AFB: A0 00
	LDA #$00                        ;C - - - - - 0x001B0D 00:9AFD: A9 00
loc_00_9AFF:
	STA vramQueue+7,Y               ;C - - - - - 0x001B0F 00:9AFF: 99 87 07
	STA vramQueue+29,Y              ;C - - - - - 0x001B12 00:9B02: 99 9D 07
	STA vramQueue+51,Y              ;C - - - - - 0x001B15 00:9B05: 99 B3 07
	INY                             ;C - - - - - 0x001B18 00:9B08: C8
	DEX                             ;C - - - - - 0x001B19 00:9B09: CA
	BPL loc_00_9AFF                 ;C - - - - - 0x001B1A 00:9B0A: 10 F3
	LDA #$FF                        ;C - - - - - 0x001B1C 00:9B0C: A9 FF
	STA vramQueue+70                ;C - - - - - 0x001B1E 00:9B0E: 8D C6 07
	STA vramUpdateFlag0             ;C - - - - - 0x001B21 00:9B11: 85 19
	JMP WaitFrame                   ;C - - - - - 0x001B23 00:9B13: 4C 31 FF
WaitAfterText:
	LDA textScriptIdx               ;C - - - - - 0x001B26 00:9B16: A5 B8
	CMP #$05                        ;C - - - - - 0x001B28 00:9B18: C9 05
	BEQ loc_00_9B26                 ;C - - - - - 0x001B2A 00:9B1A: F0 0A
	CMP #$06                        ;C - - - - - 0x001B2C 00:9B1C: C9 06
	BEQ loc_00_9B26                 ;C - - - - - 0x001B2E 00:9B1E: F0 06
	LDX #$B7                        ;C - - - - - 0x001B30 00:9B20: A2 B7
	JSR WaitFrames                  ;C - - - - - 0x001B32 00:9B22: 20 2A FF
	RTS                             ;C - - - - - 0x001B35 00:9B25: 60
loc_00_9B26:
	LDX #$60                        ;C - - - - - 0x001B36 00:9B26: A2 60
	JSR WaitFrames                  ;C - - - - - 0x001B38 00:9B28: 20 2A FF
	RTS                             ;C - - - - - 0x001B3B 00:9B2B: 60
RunTextScript_00Tbl_9B2C:
	.lobytes RunTextScript_00Tbl_9B2C_00, RunTextScript_00Tbl_9B2C_01, RunTextScript_00Tbl_9B2C_02, RunTextScript_00Tbl_9B2C_03, RunTextScript_00Tbl_9B2C_04, RunTextScript_00Tbl_9B2C_05, RunTextScript_00Tbl_9B2C_06;- D 0 - - - 0x001B3C 00:9B2C:
RunTextScript_00Tbl_9B33:
	.hibytes RunTextScript_00Tbl_9B2C_00, RunTextScript_00Tbl_9B2C_01, RunTextScript_00Tbl_9B2C_02, RunTextScript_00Tbl_9B2C_03, RunTextScript_00Tbl_9B2C_04, RunTextScript_00Tbl_9B2C_05, RunTextScript_00Tbl_9B2C_06;- D 0 - - - 0x001B43 00:9B33:
RunTextScript_00Tbl_9B2C_00:
	.byte $23,$17,$18,$22,$00,$18,$22,$00,$1C,$14,$23,$21,$1E,$00,$12,$18,$23,$28,$2B,$FE;- D 0 - I - 0x001B4A 00:9B3A: "THIS IS METRO CITY./"
	.byte $26,$18,$23,$17,$18,$1D,$00,$23,$17,$14,$00,$26,$10,$1B,$1B,$22,$FE;- D 0 - I - 0x001B5E 00:9B4E: "WITHIN THE WALLS/"
	.byte $1E,$15,$00,$23,$17,$14,$00,$12,$18,$23,$28,$00,$1B,$18,$25,$14,$22,$FE;- D 0 - I - 0x001B6F 00:9B5F: "OF THE CITY LIVES/"
	.byte $23,$17,$14,$00,$13,$10,$24,$16,$17,$23,$14,$21,$00,$1E,$15,$FE;- D 0 - I - 0x001B81 00:9B71: "THE DAUGHTER OF/"
	.byte $23,$17,$14,$00,$1C,$10,$28,$1E,$21,$2C,$00,$19,$14,$22,$22,$18,$12,$10,$2B,$FE;- D 0 - I - 0x001B91 00:9B81: "THE MAYOR, JESSICA./"
	.byte $17,$14,$21,$00,$11,$14,$10,$24,$23,$28,$00,$21,$10,$13,$18,$78,$FE;- D 0 - I - 0x001BA5 00:9B95: "HER BEAUTY RADI-/"
	.byte $10,$23,$14,$22,$00,$23,$17,$21,$1E,$24,$16,$17,$1E,$24,$23,$FE;- D 0 - I - 0x001BB6 00:9BA6: "ATES THROUGHOUT/"
	.byte $23,$17,$14,$00,$12,$18,$23,$28,$00,$10,$1D,$13,$00,$16,$18,$25,$14,$22,$FE;- D 0 - I - 0x001BC6 00:9BB6: "THE CITY AND GIVES/"
	.byte $23,$17,$14,$00,$12,$18,$23,$18,$29,$14,$1D,$22,$00,$23,$17,$14,$FE;- D 0 - I - 0x001BD9 00:9BC9: "THE CITIZENS THE/"
	.byte $1F,$1E,$26,$14,$21,$00,$23,$1E,$00,$22,$24,$21,$25,$18,$25,$14,$2B,$FE;- D 0 - I - 0x001BEA 00:9BDA: "POWER TO SURVIVE./"
	.byte $11,$24,$23,$00,$1D,$1E,$26,$00,$10,$00,$25,$18,$1B,$1B,$10,$18,$1D,$FE;- D 0 - I - 0x001BFC 00:9BEC: "BUT NOW A VILLAIN/"
	.byte $10,$23,$23,$14,$1C,$1F,$23,$22,$00,$23,$1E,$00,$17,$10,$25,$14,$FE;- D 0 - I - 0x001C0E 00:9BFE: "ATTEMPTS TO HAVE/"
	.byte $23,$17,$18,$22,$00,$11,$14,$10,$12,$1E,$1D,$00,$1E,$15,$FE;- D 0 - I - 0x001C1F 00:9C0F: "THIS BEACON OF/"
	.byte $1B,$18,$16,$17,$23,$00,$10,$1B,$1B,$00,$23,$1E,$FE;- D 0 - I - 0x001C2E 00:9C1E: "LIGHT ALL TO/"
	.byte $17,$18,$1C,$22,$14,$1B,$15,$2B,$FF;- D 0 - I - 0x001C3B 00:9C2B: "HIMSELF.$"
RunTextScript_00Tbl_9B2C_01:
	.byte $18,$00,$12,$10,$1D,$2A,$23,$00,$11,$14,$1B,$18,$14,$25,$14,$FE;- D 0 - I - 0x001C44 00:9C34: "I CAN'T BELIEVE/"
	.byte $23,$17,$10,$23,$00,$18,$2A,$25,$14,$00,$10,$12,$23,$24,$10,$1B,$1B,$28,$FE;- D 0 - I - 0x001C54 00:9C44: "THAT I'VE ACTUALLY/"
	.byte $15,$10,$1B,$1B,$14,$1D,$00,$18,$1D,$00,$1B,$1E,$25,$14,$FE;- D 0 - I - 0x001C67 00:9C57: "FALLEN IN LOVE/"
	.byte $26,$18,$23,$17,$00,$23,$17,$14,$00,$16,$18,$21,$1B,$2B,$FE;- D 0 - I - 0x001C76 00:9C66: "WITH THE GIRL./"
	.byte $22,$17,$14,$00,$26,$18,$1B,$1B,$00,$11,$14,$00,$1C,$18,$1D,$14,$2B,$2B,$FE;- D 0 - I - 0x001C85 00:9C75: "SHE WILL BE MINE../"
	.byte $2B,$2B,$2B,$FF           ;- D 0 - I - 0x001C98 00:9C88: "...$"
RunTextScript_00Tbl_9B2C_02:
	.byte $10,$00,$12,$1E,$24,$1F,$1B,$14,$00,$13,$10,$28,$22,$FE;- D 0 - I - 0x001C9C 00:9C8C: "A COUPLE DAYS/"
	.byte $1B,$10,$23,$14,$21,$2B,$2B,$2B,$FF;- D 0 - I - 0x001CAA 00:9C9A: "LATER...$"
RunTextScript_00Tbl_9B2C_03:
	.byte $26,$17,$10,$23,$75,$76,$00,$19,$14,$22,$22,$18,$12,$10,$2B,$2B,$2B,$FE;- D 0 - I - 0x001CB3 00:9CA3: "WHAT?! JESSICA.../"
	.byte $1A,$18,$13,$1D,$10,$1F,$1F,$14,$13,$2B,$2B,$2B,$76,$75,$76,$FE;- D 0 - I - 0x001CC5 00:9CB5: "KIDNAPPED...!?!/"
	.byte $FE                       ;- D 0 - I - 0x001CD5 00:9CC5: "/"
	.byte $26,$17,$10,$23,$00,$17,$10,$25,$14,$00,$28,$1E,$24,$00,$13,$1E,$1D,$14,$FE;- D 0 - I - 0x001CD6 00:9CC6: "WHAT HAVE YOU DONE/"
	.byte $23,$1E,$00,$17,$14,$21,$2C,$00,$12,$1E,$13,$28,$75,$FE;- D 0 - I - 0x001CE9 00:9CD9: "TO HER, CODY?/"
	.byte $FE                       ;- D 0 - I - 0x001CF7 00:9CE7: "/"
	.byte $1C,$14,$75,$76,$76,$00,$23,$17,$18,$22,$00,$18,$22,$00,$23,$17,$14,$FE;- D 0 - I - 0x001CF8 00:9CE8: "ME?!! THIS IS THE/"
	.byte $26,$1E,$21,$1A,$00,$1E,$15,$00,$23,$17,$14,$00,$1C,$10,$13,$FE;- D 0 - I - 0x001D0A 00:9CFA: "WORK OF THE MAD/"
	.byte $16,$14,$10,$21,$00,$16,$10,$1D,$16,$2B,$FE;- D 0 - I - 0x001D1A 00:9D0A: "GEAR GANG./"
	.byte $26,$17,$10,$23,$00,$13,$1E,$00,$28,$1E,$24,$00,$23,$17,$18,$1D,$1A,$2C,$FE;- D 0 - I - 0x001D25 00:9D15: "WHAT DO YOU THINK,/"
	.byte $16,$24,$28,$75,$FE       ;- D 0 - I - 0x001D38 00:9D28: "GUY?/"
	.byte $FF                       ;- D 0 - I - 0x001D3D 00:9D2D: "$"
RunTextScript_00Tbl_9B2C_04:
	.byte $28,$14,$22,$2B,$00,$23,$17,$14,$21,$14,$2A,$22,$00,$1D,$1E,$23,$00,$10,$FE;- D 0 - I - 0x001D3E 00:9D2E: "YES. THERE'S NOT A/"
	.byte $1C,$1E,$1C,$14,$1D,$23,$00,$23,$1E,$00,$22,$1F,$10,$21,$14,$2B,$FE;- D 0 - I - 0x001D51 00:9D41: "MOMENT TO SPARE./"
	.byte $1B,$14,$23,$2A,$22,$00,$16,$1E,$76,$FF;- D 0 - I - 0x001D62 00:9D52: "LET'S GO!$"
RunTextScript_00Tbl_9B2C_05:
	.byte $13,$10,$13,$2C,$00,$18,$23,$2A,$22,$00,$10,$11,$1E,$24,$23,$FE;- D 0 - I - 0x001D6C 00:9D5C: "DAD, IT'S ABOUT/"
	.byte $23,$18,$1C,$14,$00,$28,$1E,$24,$00,$16,$1E,$23,$00,$17,$14,$21,$14,$2B,$FE;- D 0 - I - 0x001D7C 00:9D6C: "TIME YOU GOT HERE./"
	.byte $FE                       ;- D 0 - I - 0x001D8F 00:9D7F: "/"
	.byte $22,$1E,$21,$21,$28,$00,$1F,$21,$18,$1D,$12,$14,$22,$22,$2C,$FE;- D 0 - I - 0x001D90 00:9D80: "SORRY PRINCESS,/"
	.byte $11,$24,$23,$00,$18,$00,$1D,$14,$14,$13,$14,$13,$00,$23,$1E,$FE;- D 0 - I - 0x001DA0 00:9D90: "BUT I NEEDED TO/"
	.byte $23,$10,$1A,$14,$00,$1E,$24,$23,$00,$23,$17,$14,$00,$23,$21,$10,$22,$17,$2B,$FE;- D 0 - I - 0x001DB0 00:9DA0: "TAKE OUT THE TRASH./"
	.byte $13,$10,$13,$2C,$00,$26,$17,$14,$21,$14,$2A,$22,$00,$12,$1E,$13,$28,$75,$FE;- D 0 - I - 0x001DC4 00:9DB4: "DAD, WHERE'S CODY?/"
	.byte $FE                       ;- D 0 - I - 0x001DD7 00:9DC7: "/"
	.byte $FE                       ;- D 0 - I - 0x001DD8 00:9DC8: "/"
	.byte $12,$1E,$13,$28,$75,$00,$18,$00,$1B,$1E,$22,$23,$00,$22,$18,$16,$17,$23,$FE;- D 0 - I - 0x001DD9 00:9DC9: "CODY? I LOST SIGHT/"
	.byte $1E,$15,$00,$17,$18,$1C,$00,$1E,$1D,$00,$23,$17,$14,$00,$26,$10,$28,$FE;- D 0 - I - 0x001DEC 00:9DDC: "OF HIM ON THE WAY/"
	.byte $17,$14,$21,$14,$2B,$FE   ;- D 0 - I - 0x001DFE 00:9DEE: "HERE./"
	.byte $1E,$17,$2C,$00,$26,$10,$28,$00,$23,$1E,$00,$16,$1E,$00,$13,$10,$13,$76,$FF;- D 0 - I - 0x001E04 00:9DF4: "OH, WAY TO GO DAD!$"
RunTextScript_00Tbl_9B2C_06:
	.byte $1B,$14,$23,$00,$16,$1E,$00,$1E,$15,$00,$1C,$14,$2C,$00,$16,$24,$28,$76,$FE;- D 0 - I - 0x001E17 00:9E07: "LET GO OF ME, GUY!/"
	.byte $26,$18,$23,$17,$1E,$24,$23,$00,$1C,$28,$00,$17,$14,$1B,$1F,$2C,$FE;- D 0 - I - 0x001E2A 00:9E1A: "WITHOUT MY HELP,/"
	.byte $22,$17,$14,$00,$26,$1E,$24,$1B,$13,$00,$11,$14,$2B,$2B,$2B,$FE;- D 0 - I - 0x001E3B 00:9E2B: "SHE WOULD BE.../"
	.byte $12,$1E,$1D,$23,$21,$1E,$1B,$00,$28,$1E,$24,$21,$22,$14,$1B,$15,$2B,$FE;- D 0 - I - 0x001E4B 00:9E3B: "CONTROL YOURSELF./"
	.byte $1B,$14,$23,$00,$23,$17,$14,$00,$1C,$10,$28,$1E,$21,$00,$10,$1D,$13,$FE;- D 0 - I - 0x001E5D 00:9E4D: "LET THE MAYOR AND/"
	.byte $19,$14,$22,$22,$18,$12,$10,$00,$23,$10,$1B,$1A,$2B,$FE;- D 0 - I - 0x001E6F 00:9E5F: "JESSICA TALK./"
	.byte $15,$1E,$21,$00,$1E,$1D,$12,$14,$00,$18,$1D,$00,$28,$1E,$24,$21,$FE;- D 0 - I - 0x001E7D 00:9E6D: "FOR ONCE IN YOUR/"
	.byte $1B,$18,$15,$14,$2C,$00,$23,$17,$18,$1D,$1A,$00,$1E,$15,$FE;- D 0 - I - 0x001E8E 00:9E7E: "LIFE, THINK OF/"
	.byte $22,$1E,$1C,$14,$1E,$1D,$14,$00,$14,$1B,$22,$14,$FE;- D 0 - I - 0x001E9D 00:9E8D: "SOMEONE ELSE/"
	.byte $11,$14,$22,$18,$13,$14,$22,$00,$28,$1E,$24,$21,$22,$14,$1B,$15,$2B,$FE;- D 0 - I - 0x001EAA 00:9E9A: "BESIDES YOURSELF./"
	.byte $1B,$14,$23,$00,$16,$1E,$00,$1E,$15,$00,$1C,$14,$76,$FE;- D 0 - I - 0x001EBC 00:9EAC: "LET GO OF ME!/"
	.byte $FE                       ;- D 0 - I - 0x001ECA 00:9EBA: "/"
	.byte $00,$00,$00,$00,$00,$14,$00,$00,$00,$1D,$00,$00,$00,$13,$00,$00,$00,$FF;- D 0 - I - 0x001ECB 00:9EBB: "     E   N   D   $"
	.byte $11                       ;- - - - - - 0x001EDD 00:9ECD: "B"
	.byte $3A,$44,$38,$01,$48,$11,$64,$51,$A2,$11,$32,$54,$25,$04,$A7,$54;- - - - - - 0x001EDE 00:9ECE:
	.byte $B2,$44,$E1,$10,$84,$51,$E7,$05,$31,$00,$19,$45,$3B,$40,$20,$00;- - - - - - 0x001EEE 00:9EDE:
	.byte $03,$04,$08,$00,$E9,$40,$D3,$01,$0B,$00,$C0,$00,$10,$01,$80,$70;- - - - - - 0x001EFE 00:9EEE:
	.byte $50,$10,$DC,$44,$27,$54,$3C,$91,$75,$20,$73,$11,$D8,$44,$A7,$C5;- - - - - - 0x001F0E 00:9EFE:
	.byte $DE,$50,$06,$54,$7C,$11,$EF,$15,$3E,$50,$09,$15,$6B,$80,$F8,$55;- - - - - - 0x001F1E 00:9F0E:
	.byte $75,$11,$78,$40,$1F,$04,$56,$08,$0C,$00,$25,$14,$04,$10,$B9,$00;- - - - - - 0x001F2E 00:9F1E:
	.byte $F2,$14,$B9,$11,$18,$01,$A3,$55,$F0,$10,$5B,$10,$80,$10,$5A,$10;- - - - - - 0x001F3E 00:9F2E:
	.byte $00,$04,$50,$51,$4A,$00,$10,$C1,$7B,$54,$2F,$10,$10,$14,$C2,$00;- - - - - - 0x001F4E 00:9F3E:
	.byte $B0,$00,$CB,$84,$82,$00,$85,$44,$DF,$11,$E6,$44,$84,$FD,$0B,$41;- - - - - - 0x001F5E 00:9F4E:
	.byte $2F,$E1,$0C,$11,$B6,$04,$34,$11,$D4,$10,$E0,$1C,$90,$10,$C6,$55;- - - - - - 0x001F6E 00:9F5E:
	.byte $82,$00,$BA,$00,$10,$40,$21,$04,$5F,$04,$0E,$50,$B6,$00,$86,$10;- - - - - - 0x001F7E 00:9F6E:
	.byte $82,$01,$32,$40,$34,$14,$47,$45,$94,$D5,$D4,$00,$41,$41,$66,$45;- - - - - - 0x001F8E 00:9F7E:
	.byte $C5,$D1,$E2,$54,$C0,$04,$07,$1C,$E8,$49,$EB,$54,$BE,$55,$F2,$50;- - - - - - 0x001F9E 00:9F8E:
	.byte $A9,$10,$F1,$04,$02,$44,$AB,$40,$18,$10,$22,$14,$62,$44,$41,$01;- - - - - - 0x001FAE 00:9F9E:
	.byte $A5,$00,$05,$05,$29,$01,$68,$44,$B1,$00,$05,$10,$01,$01,$61,$C0;- - - - - - 0x001FBE 00:9FAE:
	.byte $82,$00,$35,$10,$E0,$01,$CB,$25,$08,$50,$42,$05,$13,$00,$26,$04;- - - - - - 0x001FCE 00:9FBE:
	.byte $84,$01,$C0,$01,$A1,$40,$23,$45,$03,$16,$12,$41,$D8,$61,$B4,$00;- - - - - - 0x001FDE 00:9FCE:
	.byte $49,$04,$44,$44,$99,$01,$11,$00,$A3,$14,$75,$00,$3A,$10,$62,$45;- - - - - - 0x001FEE 00:9FDE:
	.byte $E4,$40,$A7,$14,$08,$01,$24,$50,$09,$34,$5C,$84,$81,$01,$00,$40;- - - - - - 0x001FFE 00:9FEE:
	.byte $09,$00                   ;- - - - - - 0x00200E 00:9FFE:
