.segment "BANK_0C"
; 0x018010-0x01A00F  CPU $8000-$9FFF

UpdateEnemiesEntry:
	JMP UpdateEnemies               ;C D 0 - - - 0x018010 0C:8000: 4C 03 80
; slots 1-15: per-object countdown (objArr_04B0), then AI handler = enemyAIPtr[objKind]; handler returns to the loop via a pushed address
UpdateEnemies:
	LDA #$38                        ;C - - - - - 0x018013 0C:8003: A9 38
	STA gravity                     ;C - - - - - 0x018015 0C:8005: 85 99
	LDX #$01                        ;C - - - - - 0x018017 0C:8007: A2 01
	STX ram_00EF                    ;C - - - - - 0x018019 0C:8009: 86 EF
loc_0C_800B:
	LDA objActive,X                 ;C - - - - - 0x01801B 0C:800B: BD 00 03
	BPL loc_0C_805E                 ;C - - - - - 0x01801E 0C:800E: 10 4E
	LDY #$0D                        ;C - - - - - 0x018020 0C:8010: A0 0D
	LDA objKind,X                   ;C - - - - - 0x018022 0C:8012: BD 20 03
	CMP #$60                        ;C - - - - - 0x018025 0C:8015: C9 60
	BCC loc_0C_802F                 ;C - - - - - 0x018027 0C:8017: 90 16
	LDY #$05                        ;C - - - - - 0x018029 0C:8019: A0 05
	CMP #$70                        ;C - - - - - 0x01802B 0C:801B: C9 70
	BCC loc_0C_803B                 ;C - - - - - 0x01802D 0C:801D: 90 1C
	LDY #$0B                        ;C - - - - - 0x01802F 0C:801F: A0 0B
	CMP #$80                        ;C - - - - - 0x018031 0C:8021: C9 80
	BCC loc_0C_803B                 ;C - - - - - 0x018033 0C:8023: 90 16
	LDY #$01                        ;C - - - - - 0x018035 0C:8025: A0 01
	CMP #$90                        ;C - - - - - 0x018037 0C:8027: C9 90
	BCC loc_0C_803B                 ;C - - - - - 0x018039 0C:8029: 90 10
	LDY #$03                        ;C - - - - - 0x01803B 0C:802B: A0 03
	BNE loc_0C_803B                 ;C - - - - - 0x01803D 0C:802D: D0 0C
loc_0C_802F:
	LSR A                           ;C - - - - - 0x01803F 0C:802F: 4A
	LSR A                           ;C - - - - - 0x018040 0C:8030: 4A
	LSR A                           ;C - - - - - 0x018041 0C:8031: 4A
	LSR A                           ;C - - - - - 0x018042 0C:8032: 4A
	CMP #$0A                        ;C - - - - - 0x018043 0C:8033: C9 0A
	BCC loc_0C_803B                 ;C - - - - - 0x018045 0C:8035: 90 04
	SEC                             ;c - - - - - 0x018047 0C:8037: 38
	SBC #$06                        ;c - - - - - 0x018048 0C:8038: E9 06
	TAY                             ;c - - - - - 0x01804A 0C:803A: A8
loc_0C_803B:
	CPY prgBankA000                 ;C - - - - - 0x01804B 0C:803B: C4 F5
	BEQ loc_0C_8048                 ;C - - - - - 0x01804D 0C:803D: F0 09
	STY prgBankA000                 ;C - - - - - 0x01804F 0C:803F: 84 F5
	TXA                             ;C - - - - - 0x018051 0C:8041: 8A
	PHA                             ;C - - - - - 0x018052 0C:8042: 48
	JSR SetPrgBanks                 ;C - - - - - 0x018053 0C:8043: 20 4D FF
	PLA                             ;C - - - - - 0x018056 0C:8046: 68
	TAX                             ;C - - - - - 0x018057 0C:8047: AA
loc_0C_8048:
	LDY objKind,X                   ;C - - - - - 0x018058 0C:8048: BC 20 03
	LDA enemyAILo,Y                 ;C - - - - - 0x01805B 0C:804B: B9 AF 83
	STA ptr_00                      ;C - - - - - 0x01805E 0C:804E: 85 00
	LDA enemyAIHi,Y                 ;C - - - - - 0x018060 0C:8050: B9 4F 84
	STA ptr_00+1                    ;C - - - - - 0x018063 0C:8053: 85 01
	LDA #$80                        ;C - - - - - 0x018065 0C:8055: A9 80
	PHA                             ;C - - - - - 0x018067 0C:8057: 48
	LDA #$5D                        ;C - - - - - 0x018068 0C:8058: A9 5D
	PHA                             ;C - - - - - 0x01806A 0C:805A: 48
	JMP (ptr_00)                    ;C - - - - - 0x01806B 0C:805B: 6C 00 00
loc_0C_805E:
	INC ram_00EF                    ;C - - - - - 0x01806E 0C:805E: E6 EF
	LDX ram_00EF                    ;C - - - - - 0x018070 0C:8060: A6 EF
	CPX #$10                        ;C - - - - - 0x018072 0C:8062: E0 10
	BNE loc_0C_8067                 ;C - - - - - 0x018074 0C:8064: D0 01
	RTS                             ;C - - - - - 0x018076 0C:8066: 60
loc_0C_8067:
	LDA objStunTimer,X              ;C - - - - - 0x018077 0C:8067: BD B0 04
	BEQ loc_0C_8072                 ;C - - - - - 0x01807A 0C:806A: F0 06
	DEC objStunTimer,X              ;C - - - - - 0x01807C 0C:806C: DE B0 04
	JMP loc_0C_81F0                 ;C - - - - - 0x01807F 0C:806F: 4C F0 81
loc_0C_8072:
	LDA objKind,X                   ;C - - - - - 0x018082 0C:8072: BD 20 03
	CMP #$04                        ;C - - - - - 0x018085 0C:8075: C9 04
	BEQ loc_0C_808D                 ;C - - - - - 0x018087 0C:8077: F0 14
	CMP #$08                        ;C - - - - - 0x018089 0C:8079: C9 08
	BEQ loc_0C_808D                 ;C - - - - - 0x01808B 0C:807B: F0 10
	CMP #$0F                        ;C - - - - - 0x01808D 0C:807D: C9 0F
	BEQ loc_0C_808D                 ;C - - - - - 0x01808F 0C:807F: F0 0C
	CMP #$0E                        ;C - - - - - 0x018091 0C:8081: C9 0E
	BNE loc_0C_8090                 ;C - - - - - 0x018093 0C:8083: D0 0B
	LDA attackType                  ;C - - - - - 0x018095 0C:8085: A5 A7
	CMP #$09                        ;C - - - - - 0x018097 0C:8087: C9 09
	BEQ loc_0C_808D                 ;C - - - - - 0x018099 0C:8089: F0 02
	BNE loc_0C_8090                 ;C - - - - - 0x01809B 0C:808B: D0 03
loc_0C_808D:
	JSR EnemyPreAttackCheck         ;C - - - - - 0x01809D 0C:808D: 20 44 82
loc_0C_8090:
	JSR CheckObjContact             ;C - - - - - 0x0180A0 0C:8090: 20 E5 F9
	BCS loc_0C_80C0                 ;C - - - - - 0x0180A3 0C:8093: B0 2B
	LDY ptr_0E+1                    ;C - - - - - 0x0180A5 0C:8095: A4 0F
	LDA objAnim,Y                   ;C - - - - - 0x0180A7 0C:8097: B9 80 05
	CMP #$74                        ;C - - - - - 0x0180AA 0C:809A: C9 74
	BEQ loc_0C_80AF                 ;C - - - - - 0x0180AC 0C:809C: F0 11
	LDA #$00                        ;C - - - - - 0x0180AE 0C:809E: A9 00
	STA objActive,Y                 ;C - - - - - 0x0180B0 0C:80A0: 99 00 03
	STA objState,Y                  ;C - - - - - 0x0180B3 0C:80A3: 99 10 03
	STA objFlags,Y                  ;C - - - - - 0x0180B6 0C:80A6: 99 60 05
	STA objKind,Y                   ;C - - - - - 0x0180B9 0C:80A9: 99 20 03
loc_0C_80AC:
	JMP loc_0C_80D3                 ;C - - - - - 0x0180BC 0C:80AC: 4C D3 80
loc_0C_80AF:
	LDA #$00                        ;C - - - - - 0x0180BF 0C:80AF: A9 00
	STA objAnimFlags,Y              ;C - - - - - 0x0180C1 0C:80B1: 99 90 05
	LDA #$06                        ;C - - - - - 0x0180C4 0C:80B4: A9 06
	STA objAnimFrame,Y              ;C - - - - - 0x0180C6 0C:80B6: 99 70 05
	LDA #$09                        ;C - - - - - 0x0180C9 0C:80B9: A9 09
	STA objKind,Y                   ;C - - - - - 0x0180CB 0C:80BB: 99 20 03
	BNE loc_0C_80AC                 ;C - - - - - 0x0180CE 0C:80BE: D0 EC
loc_0C_80C0:
	JSR CheckAttackEligible         ;C - - - - - 0x0180D0 0C:80C0: 20 38 F7
	BCS loc_0C_80CD                 ;C - - - - - 0x0180D3 0C:80C3: B0 08
	JSR SpawnEffect7E               ;C - - - - - 0x0180D5 0C:80C5: 20 55 F4
	LDA objLife,X                   ;C - - - - - 0x0180D8 0C:80C8: BD 90 04
	BPL loc_0C_80D3                 ;C - - - - - 0x0180DB 0C:80CB: 10 06
loc_0C_80CD:
	JMP loc_0C_81F0                 ;C - - - - - 0x0180DD 0C:80CD: 4C F0 81
loc_0C_80D0:
	JMP loc_0C_81B8                 ;C - - - - - 0x0180E0 0C:80D0: 4C B8 81
loc_0C_80D3:
	JSR EnemyHitCheck               ;C - - - - - 0x0180E3 0C:80D3: 20 F0 84
	LDA #$00                        ;C - - - - - 0x0180E6 0C:80D6: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x0180E8 0C:80D8: 9D 40 04
	LDA objAnim,X                   ;C - - - - - 0x0180EB 0C:80DB: BD 80 05
	CMP #$84                        ;C - - - - - 0x0180EE 0C:80DE: C9 84
	BEQ loc_0C_8108                 ;C - - - - - 0x0180F0 0C:80E0: F0 26
	CMP #$AC                        ;C - - - - - 0x0180F2 0C:80E2: C9 AC
	BEQ loc_0C_8108                 ;C - - - - - 0x0180F4 0C:80E4: F0 22
	CMP #$E7                        ;C - - - - - 0x0180F6 0C:80E6: C9 E7
	BEQ loc_0C_8108                 ;C - - - - - 0x0180F8 0C:80E8: F0 1E
	CMP #$BE                        ;C - - - - - 0x0180FA 0C:80EA: C9 BE
	BEQ loc_0C_8108                 ;C - - - - - 0x0180FC 0C:80EC: F0 1A
	CMP #$CC                        ;C - - - - - 0x0180FE 0C:80EE: C9 CC
	BEQ loc_0C_8108                 ;C - - - - - 0x018100 0C:80F0: F0 16
	LDA objSpriteDown,X             ;C - - - - - 0x018102 0C:80F2: BD B0 05
	CMP #$06                        ;C - - - - - 0x018105 0C:80F5: C9 06
	BEQ loc_0C_80FD                 ;C - - - - - 0x018107 0C:80F7: F0 04
	CMP #$0C                        ;C - - - - - 0x018109 0C:80F9: C9 0C
	BNE loc_0C_8116                 ;C - - - - - 0x01810B 0C:80FB: D0 19
loc_0C_80FD:
	LDA objY,X                      ;C - - - - - 0x01810D 0C:80FD: BD C0 03
	CLC                             ;C - - - - - 0x018110 0C:8100: 18
	ADC #$0A                        ;C - - - - - 0x018111 0C:8101: 69 0A
	STA objParamC,X                 ;C - - - - - 0x018113 0C:8103: 9D 30 05
	BNE loc_0C_8131                 ;C - - - - - 0x018116 0C:8106: D0 29
loc_0C_8108:
	LDA objParamB,X                 ;C - - - - - 0x018118 0C:8108: BD 20 05
	STA objParamC,X                 ;C - - - - - 0x01811B 0C:810B: 9D 30 05
	LDA objLife,X                   ;C - - - - - 0x01811E 0C:810E: BD 90 04
	BMI loc_0C_80D0                 ;C - - - - - 0x018121 0C:8111: 30 BD
	JMP loc_0C_819A                 ;C - - - - - 0x018123 0C:8113: 4C 9A 81
loc_0C_8116:
	LDA objKind,X                   ;C - - - - - 0x018126 0C:8116: BD 20 03
	CMP #$91                        ;C - - - - - 0x018129 0C:8119: C9 91
	BEQ loc_0C_8131                 ;C - - - - - 0x01812B 0C:811B: F0 14
	LDA attackType                  ;C - - - - - 0x01812D 0C:811D: A5 A7
	CMP #$1D                        ;C - - - - - 0x01812F 0C:811F: C9 1D
	BNE loc_0C_812B                 ;C - - - - - 0x018131 0C:8121: D0 08
	LDA objY                        ;C - - - - - 0x018133 0C:8123: AD C0 03
	STA objParamC,X                 ;C - - - - - 0x018136 0C:8126: 9D 30 05
	BNE loc_0C_8131                 ;C - - - - - 0x018139 0C:8129: D0 06
loc_0C_812B:
	LDA objY,X                      ;C - - - - - 0x01813B 0C:812B: BD C0 03
	STA objParamC,X                 ;C - - - - - 0x01813E 0C:812E: 9D 30 05
loc_0C_8131:
	LDA objLife,X                   ;C - - - - - 0x018141 0C:8131: BD 90 04
	BMI loc_0C_80D0                 ;C - - - - - 0x018144 0C:8134: 30 9A
	LDA #$1E                        ;C - - - - - 0x018146 0C:8136: A9 1E
	STA timerA3                     ;C - - - - - 0x018148 0C:8138: 85 A3
	LDA objSpriteDown,X             ;C - - - - - 0x01814A 0C:813A: BD B0 05
	CMP #$03                        ;C - - - - - 0x01814D 0C:813D: C9 03
	BNE loc_0C_8146                 ;C - - - - - 0x01814F 0C:813F: D0 05
	LDA objHitTimer,X               ;C - - - - - 0x018151 0C:8141: BD E0 04
	BEQ loc_0C_81B5                 ;C - - - - - 0x018154 0C:8144: F0 6F
loc_0C_8146:
	LDA attackType                  ;C - - - - - 0x018156 0C:8146: A5 A7
	CMP #$01                        ;C - - - - - 0x018158 0C:8148: C9 01
	BEQ loc_0C_81AB                 ;C - - - - - 0x01815A 0C:814A: F0 5F
	CMP #$0D                        ;C - - - - - 0x01815C 0C:814C: C9 0D
	BEQ loc_0C_81AB                 ;C - - - - - 0x01815E 0C:814E: F0 5B
	CMP #$02                        ;C - - - - - 0x018160 0C:8150: C9 02
	BEQ loc_0C_819A                 ;C - - - - - 0x018162 0C:8152: F0 46
	CMP #$03                        ;C - - - - - 0x018164 0C:8154: C9 03
	BEQ loc_0C_819A                 ;C - - - - - 0x018166 0C:8156: F0 42
	CMP #$08                        ;C - - - - - 0x018168 0C:8158: C9 08
	BEQ loc_0C_819A                 ;C - - - - - 0x01816A 0C:815A: F0 3E
	CMP #$0E                        ;C - - - - - 0x01816C 0C:815C: C9 0E
	BEQ loc_0C_819A                 ;C - - - - - 0x01816E 0C:815E: F0 3A
	CMP #$07                        ;C - - - - - 0x018170 0C:8160: C9 07
	BEQ loc_0C_81AB                 ;C - - - - - 0x018172 0C:8162: F0 47
	CMP #$0A                        ;C - - - - - 0x018174 0C:8164: C9 0A
	BEQ loc_0C_819A                 ;C - - - - - 0x018176 0C:8166: F0 32
	CMP #$0F                        ;C - - - - - 0x018178 0C:8168: C9 0F
	BEQ loc_0C_819A                 ;C - - - - - 0x01817A 0C:816A: F0 2E
	CMP #$10                        ;C - - - - - 0x01817C 0C:816C: C9 10
	BEQ loc_0C_819A                 ;C - - - - - 0x01817E 0C:816E: F0 2A
	CMP #$11                        ;C - - - - - 0x018180 0C:8170: C9 11
	BEQ loc_0C_819A                 ;C - - - - - 0x018182 0C:8172: F0 26
	CMP #$12                        ;C - - - - - 0x018184 0C:8174: C9 12
	BEQ loc_0C_819A                 ;C - - - - - 0x018186 0C:8176: F0 22
	CMP #$13                        ;C - - - - - 0x018188 0C:8178: C9 13
	BEQ loc_0C_819A                 ;C - - - - - 0x01818A 0C:817A: F0 1E
	CMP #$14                        ;C - - - - - 0x01818C 0C:817C: C9 14
	BEQ loc_0C_819A                 ;C - - - - - 0x01818E 0C:817E: F0 1A
	CMP #$15                        ;C - - - - - 0x018190 0C:8180: C9 15
	BEQ loc_0C_819A                 ;C - - - - - 0x018192 0C:8182: F0 16
	CMP #$16                        ;C - - - - - 0x018194 0C:8184: C9 16
	BEQ loc_0C_819A                 ;C - - - - - 0x018196 0C:8186: F0 12
	CMP #$17                        ;C - - - - - 0x018198 0C:8188: C9 17
	BEQ loc_0C_819A                 ;C - - - - - 0x01819A 0C:818A: F0 0E
	CMP #$18                        ;C - - - - - 0x01819C 0C:818C: C9 18
	BEQ loc_0C_81AB                 ;C - - - - - 0x01819E 0C:818E: F0 1B
	CMP #$1D                        ;C - - - - - 0x0181A0 0C:8190: C9 1D
	BEQ loc_0C_819A                 ;C - - - - - 0x0181A2 0C:8192: F0 06
	CMP #$22                        ;C - - - - - 0x0181A4 0C:8194: C9 22
	BEQ loc_0C_819A                 ;C - - - - - 0x0181A6 0C:8196: F0 02
	BNE loc_0C_81B5                 ;C - - - - - 0x0181A8 0C:8198: D0 1B
loc_0C_819A:
	LDA #$05                        ;C - - - - - 0x0181AA 0C:819A: A9 05
	STA objKind,X                   ;C - - - - - 0x0181AC 0C:819C: 9D 20 03
	LDA #$8E                        ;C - - - - - 0x0181AF 0C:819F: A9 8E
	STA objVelYLo,X                 ;C - - - - - 0x0181B1 0C:81A1: 9D 20 04
	LDA #$03                        ;C - - - - - 0x0181B4 0C:81A4: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x0181B6 0C:81A6: 9D 30 04
	BNE loc_0C_81B0                 ;C - - - - - 0x0181B9 0C:81A9: D0 05
loc_0C_81AB:
	LDA #$02                        ;C - - - - - 0x0181BB 0C:81AB: A9 02
	STA objKind,X                   ;C - - - - - 0x0181BD 0C:81AD: 9D 20 03
loc_0C_81B0:
	LDA #$80                        ;C - - - - - 0x0181C0 0C:81B0: A9 80
	STA objActive,X                 ;C - - - - - 0x0181C2 0C:81B2: 9D 00 03
loc_0C_81B5:
	JMP loc_0C_800B                 ;C - - - - - 0x0181C5 0C:81B5: 4C 0B 80
loc_0C_81B8:
	LDA objKind,X                   ;C - - - - - 0x0181C8 0C:81B8: BD 20 03
	CMP #$06                        ;C - - - - - 0x0181CB 0C:81BB: C9 06
	BEQ loc_0C_820E                 ;C - - - - - 0x0181CD 0C:81BD: F0 4F
	CMP #$07                        ;C - - - - - 0x0181CF 0C:81BF: C9 07
	BEQ loc_0C_820E                 ;C - - - - - 0x0181D1 0C:81C1: F0 4B
	CMP #$74                        ;C - - - - - 0x0181D3 0C:81C3: C9 74
	BEQ loc_0C_8211                 ;C - - - - - 0x0181D5 0C:81C5: F0 4A
	LDA objAnim,X                   ;C - - - - - 0x0181D7 0C:81C7: BD 80 05
	CMP #$7B                        ;C - - - - - 0x0181DA 0C:81CA: C9 7B
	BEQ loc_0C_821F                 ;C - - - - - 0x0181DC 0C:81CC: F0 51
	INC enemiesDefeated             ;C - - - - - 0x0181DE 0C:81CE: E6 54
	JSR ResetEnemyActive            ;C - - - - - 0x0181E0 0C:81D0: 20 2F 82
	LDA attackType                  ;C - - - - - 0x0181E3 0C:81D3: A5 A7
	CMP #$01                        ;C - - - - - 0x0181E5 0C:81D5: C9 01
	BEQ loc_0C_81E7                 ;C - - - - - 0x0181E7 0C:81D7: F0 0E
	CMP #$07                        ;C - - - - - 0x0181E9 0C:81D9: C9 07
	BEQ loc_0C_81E7                 ;C - - - - - 0x0181EB 0C:81DB: F0 0A
	CMP #$0D                        ;C - - - - - 0x0181ED 0C:81DD: C9 0D
	BEQ loc_0C_81E7                 ;C - - - - - 0x0181EF 0C:81DF: F0 06
	CMP #$18                        ;C - - - - - 0x0181F1 0C:81E1: C9 18
	BEQ loc_0C_81E7                 ;C - - - - - 0x0181F3 0C:81E3: F0 02
	BNE loc_0C_81EB                 ;C - - - - - 0x0181F5 0C:81E5: D0 04
loc_0C_81E7:
	LDA #$06                        ;C - - - - - 0x0181F7 0C:81E7: A9 06
	BNE loc_0C_81ED                 ;C - - - - - 0x0181F9 0C:81E9: D0 02
loc_0C_81EB:
	LDA #$07                        ;C - - - - - 0x0181FB 0C:81EB: A9 07
loc_0C_81ED:
	STA objKind,X                   ;C - - - - - 0x0181FD 0C:81ED: 9D 20 03
loc_0C_81F0:
	LDA playerBusy                  ;C - - - - - 0x018200 0C:81F0: A5 6E
	BMI loc_0C_820E                 ;C - - - - - 0x018202 0C:81F2: 30 1A
	LDA playerInvincible            ;C - - - - - 0x018204 0C:81F4: A5 3B
	BNE loc_0C_820E                 ;C - - - - - 0x018206 0C:81F6: D0 16
	LDA objAtkBox,X                 ;C - - - - - 0x018208 0C:81F8: BD 40 04
	BPL loc_0C_820E                 ;C - - - - - 0x01820B 0C:81FB: 10 11
	JSR CheckHitEligible            ;C - - - - - 0x01820D 0C:81FD: 20 5A F5
	BCS loc_0C_820E                 ;C - - - - - 0x018210 0C:8200: B0 0C
	LDA #$FF                        ;C - - - - - 0x018212 0C:8202: A9 FF
	STA objAtkHeavy,X               ;C - - - - - 0x018214 0C:8204: 9D D0 04
	LDA #$3C                        ;C - - - - - 0x018217 0C:8207: A9 3C
	STA playerInvincible            ;C - - - - - 0x018219 0C:8209: 85 3B
	JSR UpdatePlayerInvincible      ;C - - - - - 0x01821B 0C:820B: 20 D5 F8
loc_0C_820E:
	JMP loc_0C_800B                 ;C - - - - - 0x01821E 0C:820E: 4C 0B 80
loc_0C_8211:
	INC enemiesDefeated             ;C - - - - - 0x018221 0C:8211: E6 54
	JSR ResetEnemyActive            ;C - - - - - 0x018223 0C:8213: 20 2F 82
	LDA #$9F                        ;C - - - - - 0x018226 0C:8216: A9 9F
	STA objKind,X                   ;C - - - - - 0x018228 0C:8218: 9D 20 03
	JMP loc_0C_800B                 ;C - - - - - 0x01822B 0C:821B: 4C 0B 80
loc_0C_821E:
	RTS                             ;C - - - - - 0x01822E 0C:821E: 60
loc_0C_821F:
	LDA #$80                        ;C - - - - - 0x01822F 0C:821F: A9 80
	STA objActive,X                 ;C - - - - - 0x018231 0C:8221: 9D 00 03
	LDA #$95                        ;C - - - - - 0x018234 0C:8224: A9 95
	STA objKind,X                   ;C - - - - - 0x018236 0C:8226: 9D 20 03
	LDA #$7F                        ;C - - - - - 0x018239 0C:8229: A9 7F
	JSR SetAnimX                    ;C - - - - - 0x01823B 0C:822B: 20 88 F2
	RTS                             ;C - - - - - 0x01823E 0C:822E: 60
ResetEnemyActive:
	LDA #$80                        ;C - - - - - 0x01823F 0C:822F: A9 80
	STA objActive,X                 ;C - - - - - 0x018241 0C:8231: 9D 00 03
	LDA #$00                        ;C - - - - - 0x018244 0C:8234: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x018246 0C:8236: 9D 40 04
	STA timerA3                     ;C - - - - - 0x018249 0C:8239: 85 A3
	LDA #$FF                        ;C - - - - - 0x01824B 0C:823B: A9 FF
	STA objSpawnIndex,X             ;C - - - - - 0x01824D 0C:823D: 9D 80 04
	RTS                             ;C - - - - - 0x018250 0C:8240: 60
loc_0C_8241:
	JMP loc_0C_83A8                 ;C - - - - - 0x018251 0C:8241: 4C A8 83
EnemyPreAttackCheck:
	LDA objActive,X                 ;C - - - - - 0x018254 0C:8244: BD 00 03
	AND #$0F                        ;C - - - - - 0x018257 0C:8247: 29 0F
	BEQ loc_0C_821E                 ;C - - - - - 0x018259 0C:8249: F0 D3
	LDA objCooldown,X               ;C - - - - - 0x01825B 0C:824B: BD 40 05
	BEQ loc_0C_8254                 ;C - - - - - 0x01825E 0C:824E: F0 04
	DEC objCooldown,X               ;C - - - - - 0x018260 0C:8250: DE 40 05
	RTS                             ;C - - - - - 0x018263 0C:8253: 60
loc_0C_8254:
	LDY #$0D                        ;C - - - - - 0x018264 0C:8254: A0 0D
loc_0C_8256:
	LDA objKind,X                   ;C - - - - - 0x018266 0C:8256: BD 20 03
	CMP objKind,Y                   ;C - - - - - 0x018269 0C:8259: D9 20 03
	BEQ loc_0C_8241                 ;C - - - - - 0x01826C 0C:825C: F0 E3
	LDA playerId                    ;C - - - - - 0x01826E 0C:825E: A5 34
	CMP #$02                        ;C - - - - - 0x018270 0C:8260: C9 02
	BCC loc_0C_8278                 ;C - - - - - 0x018272 0C:8262: 90 14
	LDA attackType                  ;C - - - - - 0x018274 0C:8264: A5 A7
	CMP #$09                        ;C - - - - - 0x018276 0C:8266: C9 09
	BEQ loc_0C_8270                 ;C - - - - - 0x018278 0C:8268: F0 06
	CMP #$13                        ;C - - - - - 0x01827A 0C:826A: C9 13
	BEQ loc_0C_8270                 ;C - - - - - 0x01827C 0C:826C: F0 02
	BNE loc_0C_8278                 ;C - - - - - 0x01827E 0C:826E: D0 08
loc_0C_8270:
	LDA objDownState,Y              ;C - - - - - 0x018280 0C:8270: B9 C0 04
	BNE loc_0C_8241                 ;C - - - - - 0x018283 0C:8273: D0 CC
	JMP loc_0C_827D                 ;C - - - - - 0x018285 0C:8275: 4C 7D 82
loc_0C_8278:
	LDA objDownState,X              ;C - - - - - 0x018288 0C:8278: BD C0 04
	BNE loc_0C_8241                 ;C - - - - - 0x01828B 0C:827B: D0 C4
loc_0C_827D:
	LDA objActive,Y                 ;C - - - - - 0x01828D 0C:827D: B9 00 03
	BPL loc_0C_8241                 ;C - - - - - 0x018290 0C:8280: 10 BF
	LDA objGrabState,Y              ;C - - - - - 0x018292 0C:8282: B9 F0 03
	BNE loc_0C_8241                 ;C - - - - - 0x018295 0C:8285: D0 BA
	LDA gameAction                  ;C - - - - - 0x018297 0C:8287: A5 30
	CMP #$0B                        ;C - - - - - 0x018299 0C:8289: C9 0B
	BEQ loc_0C_829B                 ;C - - - - - 0x01829B 0C:828B: F0 0E
	CMP #$13                        ;C - - - - - 0x01829D 0C:828D: C9 13
	BEQ loc_0C_829B                 ;C - - - - - 0x01829F 0C:828F: F0 0A
	CMP #$15                        ;C - - - - - 0x0182A1 0C:8291: C9 15
	BEQ loc_0C_829B                 ;C - - - - - 0x0182A3 0C:8293: F0 06
	CMP #$12                        ;C - - - - - 0x0182A5 0C:8295: C9 12
	BEQ loc_0C_829B                 ;C - - - - - 0x0182A7 0C:8297: F0 02
	BNE loc_0C_8241                 ;C - - - - - 0x0182A9 0C:8299: D0 A6
loc_0C_829B:
	LDA objKind,Y                   ;C - - - - - 0x0182AB 0C:829B: B9 20 03
	CMP #$16                        ;C - - - - - 0x0182AE 0C:829E: C9 16
	BCC loc_0C_8241                 ;C - - - - - 0x0182B0 0C:82A0: 90 9F
	CMP #$6F                        ;C - - - - - 0x0182B2 0C:82A2: C9 6F
	BEQ loc_0C_8241                 ;C - - - - - 0x0182B4 0C:82A4: F0 9B
	CMP #$63                        ;C - - - - - 0x0182B6 0C:82A6: C9 63
	BEQ loc_0C_8241                 ;C - - - - - 0x0182B8 0C:82A8: F0 97
	CMP #$69                        ;C - - - - - 0x0182BA 0C:82AA: C9 69
	BEQ loc_0C_8241                 ;C - - - - - 0x0182BC 0C:82AC: F0 93
	CMP #$6C                        ;C - - - - - 0x0182BE 0C:82AE: C9 6C
	BEQ loc_0C_8241                 ;C - - - - - 0x0182C0 0C:82B0: F0 8F
	CMP #$6A                        ;C - - - - - 0x0182C2 0C:82B2: C9 6A
	BEQ loc_0C_8241                 ;C - - - - - 0x0182C4 0C:82B4: F0 8B
	CMP #$6D                        ;C - - - - - 0x0182C6 0C:82B6: C9 6D
	BEQ loc_0C_8333                 ;C - - - - - 0x0182C8 0C:82B8: F0 79
	CMP #$01                        ;C - - - - - 0x0182CA 0C:82BA: C9 01
	BEQ loc_0C_8333                 ;C - - - - - 0x0182CC 0C:82BC: F0 75
	CMP #$04                        ;C - - - - - 0x0182CE 0C:82BE: C9 04
	BEQ loc_0C_8333                 ;C - - - - - 0x0182D0 0C:82C0: F0 71
	CMP #$08                        ;C - - - - - 0x0182D2 0C:82C2: C9 08
	BEQ loc_0C_8333                 ;C - - - - - 0x0182D4 0C:82C4: F0 6D
	CMP #$0E                        ;C - - - - - 0x0182D6 0C:82C6: C9 0E
	BEQ loc_0C_8333                 ;C - - - - - 0x0182D8 0C:82C8: F0 69
	CMP #$0F                        ;C - - - - - 0x0182DA 0C:82CA: C9 0F
	BEQ loc_0C_8333                 ;C - - - - - 0x0182DC 0C:82CC: F0 65
	CMP #$61                        ;C - - - - - 0x0182DE 0C:82CE: C9 61
	BEQ loc_0C_8333                 ;C - - - - - 0x0182E0 0C:82D0: F0 61
	CMP #$62                        ;C - - - - - 0x0182E2 0C:82D2: C9 62
	BEQ loc_0C_8333                 ;C - - - - - 0x0182E4 0C:82D4: F0 5D
	LDA objFlags,X                  ;C - - - - - 0x0182E6 0C:82D6: BD 60 05
	BPL loc_0C_8333                 ;C - - - - - 0x0182E9 0C:82D9: 10 58
	CMP #$80                        ;C - - - - - 0x0182EB 0C:82DB: C9 80
	BCC loc_0C_8333                 ;C - - - - - 0x0182ED 0C:82DD: 90 54
	LDA objFlags,Y                  ;C - - - - - 0x0182EF 0C:82DF: B9 60 05
	BPL loc_0C_8333                 ;C - - - - - 0x0182F2 0C:82E2: 10 4F
	CMP #$80                        ;C - - - - - 0x0182F4 0C:82E4: C9 80
	BCC loc_0C_8333                 ;C - - - - - 0x0182F6 0C:82E6: 90 4B
	LDA objDownState,Y              ;C - - - - - 0x0182F8 0C:82E8: B9 C0 04
	BNE loc_0C_8333                 ;C - - - - - 0x0182FB 0C:82EB: D0 46
	LDA objX,X                      ;C - - - - - 0x0182FD 0C:82ED: BD 60 03
	SEC                             ;C - - - - - 0x018300 0C:82F0: 38
	SBC objX,Y                      ;C - - - - - 0x018301 0C:82F1: F9 60 03
	STA ptr_00                      ;C - - - - - 0x018304 0C:82F4: 85 00
	LDA objXPage,X                  ;C - - - - - 0x018306 0C:82F6: BD 80 03
	SBC objXPage,Y                  ;C - - - - - 0x018309 0C:82F9: F9 80 03
	STA ptr_00+1                    ;C - - - - - 0x01830C 0C:82FC: 85 01
	BPL loc_0C_830F                 ;C - - - - - 0x01830E 0C:82FE: 10 0F
	CLC                             ;C - - - - - 0x018310 0C:8300: 18
	LDA ptr_00                      ;C - - - - - 0x018311 0C:8301: A5 00
	EOR #$FF                        ;C - - - - - 0x018313 0C:8303: 49 FF
	ADC #$01                        ;C - - - - - 0x018315 0C:8305: 69 01
	STA ptr_00                      ;C - - - - - 0x018317 0C:8307: 85 00
	LDA ptr_00+1                    ;C - - - - - 0x018319 0C:8309: A5 01
	EOR #$FF                        ;C - - - - - 0x01831B 0C:830B: 49 FF
	ADC #$00                        ;C - - - - - 0x01831D 0C:830D: 69 00
loc_0C_830F:
	BNE loc_0C_8333                 ;C - - - - - 0x01831F 0C:830F: D0 22
	LDA ptr_00                      ;C - - - - - 0x018321 0C:8311: A5 00
	CMP #$1A                        ;C - - - - - 0x018323 0C:8313: C9 1A
	BCS loc_0C_8333                 ;C - - - - - 0x018325 0C:8315: B0 1C
	LDA attackType                  ;C - - - - - 0x018327 0C:8317: A5 A7
	CMP #$09                        ;C - - - - - 0x018329 0C:8319: C9 09
	BEQ loc_0C_831F                 ;C - - - - - 0x01832B 0C:831B: F0 02
	BNE loc_0C_8336                 ;C - - - - - 0x01832D 0C:831D: D0 17
loc_0C_831F:
	LDA jumpBaseY                   ;C - - - - - 0x01832F 0C:831F: A5 A6
	SEC                             ;C - - - - - 0x018331 0C:8321: 38
	SBC objY,Y                      ;C - - - - - 0x018332 0C:8322: F9 C0 03
	BCS loc_0C_832C                 ;C - - - - - 0x018335 0C:8325: B0 05
	EOR #$FF                        ;C - - - - - 0x018337 0C:8327: 49 FF
	ADC #$01                        ;C - - - - - 0x018339 0C:8329: 69 01
	CLC                             ;C - - - - - 0x01833B 0C:832B: 18
loc_0C_832C:
	CMP #$0C                        ;C - - - - - 0x01833C 0C:832C: C9 0C
	BCS loc_0C_83A8                 ;C - - - - - 0x01833E 0C:832E: B0 78
	JMP loc_0C_8347                 ;C - - - - - 0x018340 0C:8330: 4C 47 83
loc_0C_8333:
	JMP loc_0C_83A8                 ;C - - - - - 0x018343 0C:8333: 4C A8 83
loc_0C_8336:
	LDA objY                        ;C - - - - - 0x018346 0C:8336: AD C0 03
	SEC                             ;C - - - - - 0x018349 0C:8339: 38
	SBC objY,Y                      ;C - - - - - 0x01834A 0C:833A: F9 C0 03
	BCS loc_0C_8343                 ;C - - - - - 0x01834D 0C:833D: B0 04
	EOR #$FF                        ;C - - - - - 0x01834F 0C:833F: 49 FF
	ADC #$01                        ;C - - - - - 0x018351 0C:8341: 69 01
loc_0C_8343:
	CMP #$0C                        ;C - - - - - 0x018353 0C:8343: C9 0C
	BCS loc_0C_83A8                 ;C - - - - - 0x018355 0C:8345: B0 61
loc_0C_8347:
	LDA #$00                        ;C - - - - - 0x018357 0C:8347: A9 00
	STA objAtkBox,Y                 ;C - - - - - 0x018359 0C:8349: 99 40 04
	LDA objAnim,Y                   ;C - - - - - 0x01835C 0C:834C: B9 80 05
	CMP #$84                        ;C - - - - - 0x01835F 0C:834F: C9 84
	BEQ loc_0C_8375                 ;C - - - - - 0x018361 0C:8351: F0 22
	CMP #$AC                        ;C - - - - - 0x018363 0C:8353: C9 AC
	BEQ loc_0C_8375                 ;C - - - - - 0x018365 0C:8355: F0 1E
	CMP #$E7                        ;C - - - - - 0x018367 0C:8357: C9 E7
	BEQ loc_0C_8375                 ;C - - - - - 0x018369 0C:8359: F0 1A
	CMP #$BE                        ;C - - - - - 0x01836B 0C:835B: C9 BE
	BEQ loc_0C_8375                 ;C - - - - - 0x01836D 0C:835D: F0 16
	LDA objSpriteDown,Y             ;C - - - - - 0x01836F 0C:835F: B9 B0 05
	CMP #$06                        ;C - - - - - 0x018372 0C:8362: C9 06
	BEQ loc_0C_836A                 ;C - - - - - 0x018374 0C:8364: F0 04
	CMP #$0C                        ;C - - - - - 0x018376 0C:8366: C9 0C
	BNE loc_0C_837D                 ;C - - - - - 0x018378 0C:8368: D0 13
loc_0C_836A:
	LDA objY,Y                      ;C - - - - - 0x01837A 0C:836A: B9 C0 03
	CLC                             ;C - - - - - 0x01837D 0C:836D: 18
	ADC #$0A                        ;C - - - - - 0x01837E 0C:836E: 69 0A
	STA objParamC,Y                 ;C - - - - - 0x018380 0C:8370: 99 30 05
	BNE loc_0C_8383                 ;C - - - - - 0x018383 0C:8373: D0 0E
loc_0C_8375:
	LDA objParamB,Y                 ;C - - - - - 0x018385 0C:8375: B9 20 05
	STA objParamC,Y                 ;C - - - - - 0x018388 0C:8378: 99 30 05
	BNE loc_0C_8383                 ;C - - - - - 0x01838B 0C:837B: D0 06
loc_0C_837D:
	LDA objY,Y                      ;C - - - - - 0x01838D 0C:837D: B9 C0 03
	STA objParamC,Y                 ;C - - - - - 0x018390 0C:8380: 99 30 05
loc_0C_8383:
	LDA #$80                        ;C - - - - - 0x018393 0C:8383: A9 80
	STA objActive,Y                 ;C - - - - - 0x018395 0C:8385: 99 00 03
	LDA #$03                        ;C - - - - - 0x018398 0C:8388: A9 03
	STA objKind,Y                   ;C - - - - - 0x01839A 0C:838A: 99 20 03
	LDA #$8E                        ;C - - - - - 0x01839D 0C:838D: A9 8E
	STA objVelYLo,Y                 ;C - - - - - 0x01839F 0C:838F: 99 20 04
	LDA #$03                        ;C - - - - - 0x0183A2 0C:8392: A9 03
	STA objVelYHi,Y                 ;C - - - - - 0x0183A4 0C:8394: 99 30 04
	LDA objX                        ;C - - - - - 0x0183A7 0C:8397: AD 60 03
	CMP objX,Y                      ;C - - - - - 0x0183AA 0C:839A: D9 60 03
	BCC loc_0C_83A3                 ;C - - - - - 0x0183AD 0C:839D: 90 04
	LDA #$02                        ;C - - - - - 0x0183AF 0C:839F: A9 02
	BNE loc_0C_83A5                 ;C - - - - - 0x0183B1 0C:83A1: D0 02
loc_0C_83A3:
	LDA #$01                        ;C - - - - - 0x0183B3 0C:83A3: A9 01
loc_0C_83A5:
	STA objFacing,Y                 ;C - - - - - 0x0183B5 0C:83A5: 99 60 04
loc_0C_83A8:
	DEY                             ;C - - - - - 0x0183B8 0C:83A8: 88
	BEQ loc_0C_83AE                 ;C - - - - - 0x0183B9 0C:83A9: F0 03
	JMP loc_0C_8256                 ;C - - - - - 0x0183BB 0C:83AB: 4C 56 82
loc_0C_83AE:
	RTS                             ;C - - - - - 0x0183BE 0C:83AE: 60
; 160 entries; one handler per objKind (lo bytes)
enemyAILo:
	.lobytes EnemyAI_None, EnemyAI_Nop, EnemyAI_Launched, EnemyAI_KnockedBack, EnemyAI_Kind04, EnemyAI_KnockedBack, EnemyAI_Falling, EnemyAI_Kind07_16;- D 0 - - - 0x0183BF 0C:83AF:
	.lobytes EnemyAI_Kind08, EnemyAI_Nop, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_Kind0E, EnemyAI_Kind0F;- D 0 - - - 0x0183C7 0C:83B7:
	.lobytes EnemyAI_Item10_13, EnemyAI_Item10_13, EnemyAI_Item10_13, EnemyAI_Item10_13, EnemyAI_None, EnemyAI_None, EnemyAI_Kind07_16, EnemyAI_None;- D 0 - - - 0x0183CF 0C:83BF:
	.lobytes EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_Downed;- - - - - - 0x0183D7 0C:83C7:
	.lobytes EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt2, EnemyAI_Grunt2;- D 0 - - - 0x0183DF 0C:83CF:
	.lobytes EnemyAI_Grunt2, EnemyAI_Grunt2, EnemyAI_Grunt2, EnemyAI_Grunt2, EnemyAI_Leaper1, EnemyAI_Leaper2, EnemyAI_Projectile2E, EnemyAI_Leaper4;- D 0 - - - 0x0183E7 0C:83D7:
	.lobytes EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_TypeA1, EnemyAI_TypeA2;- D 0 - - - 0x0183EF 0C:83DF:
	.lobytes EnemyAI_TypeA4, EnemyAI_TypeB1, EnemyAI_TypeB2, EnemyAI_TypeB4, EnemyAI_TypeC1, EnemyAI_TypeC2, EnemyAI_TypeC4, EnemyAI_Var1;- D 0 - - - 0x0183F7 0C:83E7:
	.lobytes EnemyAI_CdA_V1, EnemyAI_CdA_V2, EnemyAI_CdA_V4, EnemyAI_CdA_V1, EnemyAI_CdA_V2, EnemyAI_CdA_V4, EnemyAI_CdB_V1, EnemyAI_CdB_V2;- D 0 - - - 0x0183FF 0C:83EF:
	.lobytes EnemyAI_CdB_V4, EnemyAI_CdB_V1, EnemyAI_CdB_V2, EnemyAI_CdB_V4, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_Var2;- - - - - - 0x018407 0C:83F7:
	.lobytes EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var1, EnemyAI_Var1;- - - - - - 0x01840F 0C:83FF:
	.lobytes EnemyAI_Var2, EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var4;- - - - - - 0x018417 0C:8407:
	.lobytes $A700, $A703, $A706, $A709, $A70C, $A70F, $A712, $A715;- - - - - - 0x01841F 0C:840F:
	.lobytes $A718, $A71B, $A71E, $A721, $A724, $A727, $A72A, $A72D;- D 0 - - - 0x018427 0C:8417:
	.lobytes $B300, $B303, $B306, $B309, $B30C, $B30F, $B312, $B315;- D 0 - - - 0x01842F 0C:841F:
	.lobytes $B318, $B31B, $B31E, $B321, $B324, $B327, $B32A, $B32D;- - - - - - 0x018437 0C:8427:
	.lobytes $A000, $A003, $A006, $A009, $A00C, $A00F, $A012, $A015;- D 0 - - - 0x01843F 0C:842F:
	.lobytes $A018, $A01B, $A01E, $A021, $A024, $A027, $A02A, $A02D;- - - - - - 0x018447 0C:8437:
	.lobytes $B300, $B303, $B306, $B309, $B30C, $B30F, $B312, $B315;- D 0 - - - 0x01844F 0C:843F:
	.lobytes $B318, $B31B, $B31E, $B321, $B324, $B327, $B32A, $B32D;- - - - - - 0x018457 0C:8447:
; hi bytes; the last 48 entries point into other banks ($A700.., $B300.., $A000..)
enemyAIHi:
	.hibytes EnemyAI_None, EnemyAI_Nop, EnemyAI_Launched, EnemyAI_KnockedBack, EnemyAI_Kind04, EnemyAI_KnockedBack, EnemyAI_Falling, EnemyAI_Kind07_16;- D 0 - - - 0x01845F 0C:844F:
	.hibytes EnemyAI_Kind08, EnemyAI_Nop, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_Kind0E, EnemyAI_Kind0F;- D 0 - - - 0x018467 0C:8457:
	.hibytes EnemyAI_Item10_13, EnemyAI_Item10_13, EnemyAI_Item10_13, EnemyAI_Item10_13, EnemyAI_None, EnemyAI_None, EnemyAI_Kind07_16, EnemyAI_None;- D 0 - - - 0x01846F 0C:845F:
	.hibytes EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_Downed;- - - - - - 0x018477 0C:8467:
	.hibytes EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt1, EnemyAI_Grunt2, EnemyAI_Grunt2;- D 0 - - - 0x01847F 0C:846F:
	.hibytes EnemyAI_Grunt2, EnemyAI_Grunt2, EnemyAI_Grunt2, EnemyAI_Grunt2, EnemyAI_Leaper1, EnemyAI_Leaper2, EnemyAI_Projectile2E, EnemyAI_Leaper4;- D 0 - - - 0x018487 0C:8477:
	.hibytes EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_Grunt4, EnemyAI_TypeA1, EnemyAI_TypeA2;- D 0 - - - 0x01848F 0C:847F:
	.hibytes EnemyAI_TypeA4, EnemyAI_TypeB1, EnemyAI_TypeB2, EnemyAI_TypeB4, EnemyAI_TypeC1, EnemyAI_TypeC2, EnemyAI_TypeC4, EnemyAI_Var1;- D 0 - - - 0x018497 0C:8487:
	.hibytes EnemyAI_CdA_V1, EnemyAI_CdA_V2, EnemyAI_CdA_V4, EnemyAI_CdA_V1, EnemyAI_CdA_V2, EnemyAI_CdA_V4, EnemyAI_CdB_V1, EnemyAI_CdB_V2;- D 0 - - - 0x01849F 0C:848F:
	.hibytes EnemyAI_CdB_V4, EnemyAI_CdB_V1, EnemyAI_CdB_V2, EnemyAI_CdB_V4, EnemyAI_None, EnemyAI_None, EnemyAI_None, EnemyAI_Var2;- - - - - - 0x0184A7 0C:8497:
	.hibytes EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var1, EnemyAI_Var1;- - - - - - 0x0184AF 0C:849F:
	.hibytes EnemyAI_Var2, EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var1, EnemyAI_Var2, EnemyAI_Var4, EnemyAI_Var4;- - - - - - 0x0184B7 0C:84A7:
	.hibytes $A700, $A703, $A706, $A709, $A70C, $A70F, $A712, $A715;- - - - - - 0x0184BF 0C:84AF:
	.hibytes $A718, $A71B, $A71E, $A721, $A724, $A727, $A72A, $A72D;- D 0 - - - 0x0184C7 0C:84B7:
	.hibytes $B300, $B303, $B306, $B309, $B30C, $B30F, $B312, $B315;- D 0 - - - 0x0184CF 0C:84BF:
	.hibytes $B318, $B31B, $B31E, $B321, $B324, $B327, $B32A, $B32D;- - - - - - 0x0184D7 0C:84C7:
	.hibytes $A000, $A003, $A006, $A009, $A00C, $A00F, $A012, $A015;- D 0 - - - 0x0184DF 0C:84CF:
	.hibytes $A018, $A01B, $A01E, $A021, $A024, $A027, $A02A, $A02D;- - - - - - 0x0184E7 0C:84D7:
	.hibytes $B300, $B303, $B306, $B309, $B30C, $B30F, $B312, $B315;- D 0 - - - 0x0184EF 0C:84DF:
	.hibytes $B318, $B31B, $B31E, $B321, $B324, $B327, $B32A, $B32D;- - - - - - 0x0184F7 0C:84E7:
; RTS handler used by unused kinds
EnemyAI_None:
	RTS                             ;C - - J - - 0x0184FF 0C:84EF: 60
EnemyHitCheck:
	LDA objSpriteDown,X             ;C - - - - - 0x018500 0C:84F0: BD B0 05
	CMP #$03                        ;C - - - - - 0x018503 0C:84F3: C9 03
	BEQ loc_0C_84FA                 ;C - - - - - 0x018505 0C:84F5: F0 03
loc_0C_84F7:
	JMP loc_0C_8593                 ;C - - - - - 0x018507 0C:84F7: 4C 93 85
loc_0C_84FA:
	LDA objActive,X                 ;C - - - - - 0x01850A 0C:84FA: BD 00 03
	CMP #$85                        ;C - - - - - 0x01850D 0C:84FD: C9 85
	BEQ loc_0C_84F7                 ;C - - - - - 0x01850F 0C:84FF: F0 F6
	CMP #$88                        ;C - - - - - 0x018511 0C:8501: C9 88
	BEQ loc_0C_84F7                 ;C - - - - - 0x018513 0C:8503: F0 F2
	LDA objKind,X                   ;C - - - - - 0x018515 0C:8505: BD 20 03
	CMP objId,X                     ;C - - - - - 0x018518 0C:8508: DD 30 03
	BNE loc_0C_84F7                 ;C - - - - - 0x01851B 0C:850B: D0 EA
	LDA objActive,X                 ;C - - - - - 0x01851D 0C:850D: BD 00 03
	CMP #$83                        ;C - - - - - 0x018520 0C:8510: C9 83
	BNE loc_0C_851C                 ;C - - - - - 0x018522 0C:8512: D0 08
	LDA objStep,X                   ;C - - - - - 0x018524 0C:8514: BD 00 05
	CMP #$02                        ;C - - - - - 0x018527 0C:8517: C9 02
	BEQ loc_0C_852C                 ;C - - - - - 0x018529 0C:8519: F0 11
	RTS                             ;C - - - - - 0x01852B 0C:851B: 60
loc_0C_851C:
	LDY objVariant,X                ;C - - - - - 0x01852C 0C:851C: BC C0 05
	LDA tbl_0D_A897,Y               ;C - - - - - bank=0D 0x01852F 0C:851F: B9 97 A8
	TAY                             ;C - - - - - 0x018532 0C:8522: A8
	LDA rngState0                   ;C - - - - - 0x018533 0C:8523: A5 E4
	AND #$0F                        ;C - - - - - 0x018535 0C:8525: 29 0F
	CMP EnemyHitCheckTbl_8590,Y     ;C - - - - - 0x018537 0C:8527: D9 90 85
	BCS loc_0C_8593                 ;C - - - - - 0x01853A 0C:852A: B0 67
loc_0C_852C:
	LDA gameAction                  ;C - - - - - 0x01853C 0C:852C: A5 30
	CMP #$23                        ;C - - - - - 0x01853E 0C:852E: C9 23
	BEQ loc_0C_8564                 ;C - - - - - 0x018540 0C:8530: F0 32
	LDA attackType                  ;C - - - - - 0x018542 0C:8532: A5 A7
	CMP #$00                        ;C - - - - - 0x018544 0C:8534: C9 00
	BEQ loc_0C_8560                 ;C - - - - - 0x018546 0C:8536: F0 28
	CMP #$01                        ;C - - - - - 0x018548 0C:8538: C9 01
	BEQ loc_0C_8564                 ;C - - - - - 0x01854A 0C:853A: F0 28
	CMP #$03                        ;C - - - - - 0x01854C 0C:853C: C9 03
	BEQ loc_0C_8564                 ;C - - - - - 0x01854E 0C:853E: F0 24
	CMP #$04                        ;C - - - - - 0x018550 0C:8540: C9 04
	BEQ loc_0C_8560                 ;C - - - - - 0x018552 0C:8542: F0 1C
	CMP #$06                        ;C - - - - - 0x018554 0C:8544: C9 06
	BEQ loc_0C_8560                 ;C - - - - - 0x018556 0C:8546: F0 18
	CMP #$07                        ;C - - - - - 0x018558 0C:8548: C9 07
	BEQ loc_0C_8564                 ;C - - - - - 0x01855A 0C:854A: F0 18
	CMP #$0B                        ;C - - - - - 0x01855C 0C:854C: C9 0B
	BEQ loc_0C_8560                 ;C - - - - - 0x01855E 0C:854E: F0 10
	CMP #$0C                        ;C - - - - - 0x018560 0C:8550: C9 0C
	BEQ loc_0C_8560                 ;C - - - - - 0x018562 0C:8552: F0 0C
	CMP #$0D                        ;C - - - - - 0x018564 0C:8554: C9 0D
	BEQ loc_0C_8564                 ;C - - - - - 0x018566 0C:8556: F0 0C
	CMP #$18                        ;C - - - - - 0x018568 0C:8558: C9 18
	BEQ loc_0C_8564                 ;C - - - - - 0x01856A 0C:855A: F0 08
	CMP #$1A                        ;C - - - - - 0x01856C 0C:855C: C9 1A
	BNE loc_0C_8593                 ;C - - - - - 0x01856E 0C:855E: D0 33
loc_0C_8560:
	LDA #$03                        ;C - - - - - 0x018570 0C:8560: A9 03
	BNE loc_0C_8566                 ;C - - - - - 0x018572 0C:8562: D0 02
loc_0C_8564:
	LDA #$08                        ;C - - - - - 0x018574 0C:8564: A9 08
loc_0C_8566:
	STA objTimer,X                  ;C - - - - - 0x018576 0C:8566: 9D D0 05
	STX hudEnemySlot                ;C - - - - - 0x018579 0C:8569: 86 B0
	LDA #$00                        ;C - - - - - 0x01857B 0C:856B: A9 00
	STA hudEnemyActive              ;C - - - - - 0x01857D 0C:856D: 85 B1
	LDA #$26                        ;C - - - - - 0x01857F 0C:856F: A9 26
	JSR QueueSound                  ;C - - - - - 0x018581 0C:8571: 20 4C F3
	LDA #$83                        ;C - - - - - 0x018584 0C:8574: A9 83
	STA objActive,X                 ;C - - - - - 0x018586 0C:8576: 9D 00 03
	LDA #$00                        ;C - - - - - 0x018589 0C:8579: A9 00
	STA objStep,X                   ;C - - - - - 0x01858B 0C:857B: 9D 00 05
	STA objHitTimer,X               ;C - - - - - 0x01858E 0C:857E: 9D E0 04
	LDA attackType                  ;C - - - - - 0x018591 0C:8581: A5 A7
	CMP #$06                        ;C - - - - - 0x018593 0C:8583: C9 06
	BEQ loc_0C_858B                 ;C - - - - - 0x018595 0C:8585: F0 04
	CMP #$0C                        ;C - - - - - 0x018597 0C:8587: C9 0C
	BNE loc_0C_858D                 ;C - - - - - 0x018599 0C:8589: D0 02
loc_0C_858B:
	STX ram_00A8                    ;C - - - - - 0x01859B 0C:858B: 86 A8
loc_0C_858D:
	JMP FaceToPlayerFlag            ;C - - - - - 0x01859D 0C:858D: 4C 43 F3
EnemyHitCheckTbl_8590:
	.byte $08,$0A,$0E               ;- D 0 - - - 0x0185A0 0C:8590:
loc_0C_8593:
	LDA objKind,X                   ;C - - - - - 0x0185A3 0C:8593: BD 20 03
	BEQ loc_0C_85B6                 ;C - - - - - 0x0185A6 0C:8596: F0 1E
	STX hudEnemySlot                ;C - - - - - 0x0185A8 0C:8598: 86 B0
	LDA #$00                        ;C - - - - - 0x0185AA 0C:859A: A9 00
	STA hudEnemyActive              ;C - - - - - 0x0185AC 0C:859C: 85 B1
	LDA gameAction                  ;C - - - - - 0x0185AE 0C:859E: A5 30
	CMP #$17                        ;C - - - - - 0x0185B0 0C:85A0: C9 17
	BNE loc_0C_85A8                 ;C - - - - - 0x0185B2 0C:85A2: D0 04
	STA ram_00BF                    ;C - - - - - 0x0185B4 0C:85A4: 85 BF
	BNE loc_0C_85B6                 ;C - - - - - 0x0185B6 0C:85A6: D0 0E
loc_0C_85A8:
	LDA playerId                    ;C - - - - - 0x0185B8 0C:85A8: A5 34
	CMP #$02                        ;C - - - - - 0x0185BA 0C:85AA: C9 02
	BNE loc_0C_85B6                 ;C - - - - - 0x0185BC 0C:85AC: D0 08
	LDA gameAction                  ;C - - - - - 0x0185BE 0C:85AE: A5 30
	CMP #$16                        ;C - - - - - 0x0185C0 0C:85B0: C9 16
	BNE loc_0C_85B6                 ;C - - - - - 0x0185C2 0C:85B2: D0 02
	STA ram_00BF                    ;C - - - - - 0x0185C4 0C:85B4: 85 BF
loc_0C_85B6:
	JSR InitHitFields               ;C - - - - - 0x0185C6 0C:85B6: 20 09 FB
	LDY playerId                    ;C - - - - - 0x0185C9 0C:85B9: A4 34
	LDA EnemyHitCheckTbl_87B0,Y     ;C - - - - - 0x0185CB 0C:85BB: B9 B0 87
	STA ptr_02                      ;C - - - - - 0x0185CE 0C:85BE: 85 02
	LDA EnemyHitCheckTbl_87B3,Y     ;C - - - - - 0x0185D0 0C:85C0: B9 B3 87
	STA ptr_02+1                    ;C - - - - - 0x0185D3 0C:85C3: 85 03
	JMP (ptr_02)                    ;C - - - - - 0x0185D5 0C:85C5: 6C 02 00
ofs_0C_85C8:
	LDA attackType                  ;C - - J - - 0x0185D8 0C:85C8: A5 A7
	CMP #$07                        ;C - - - - - 0x0185DA 0C:85CA: C9 07
	BNE loc_0C_85D2                 ;C - - - - - 0x0185DC 0C:85CC: D0 04
	LDA #$19                        ;C - - - - - 0x0185DE 0C:85CE: A9 19
	BNE loc_0C_85DC                 ;C - - - - - 0x0185E0 0C:85D0: D0 0A
loc_0C_85D2:
	CMP #$08                        ;C - - - - - 0x0185E2 0C:85D2: C9 08
	BNE loc_0C_85DA                 ;C - - - - - 0x0185E4 0C:85D4: D0 04
	LDA #$1F                        ;C - - - - - 0x0185E6 0C:85D6: A9 1F
	BNE loc_0C_85DC                 ;C - - - - - 0x0185E8 0C:85D8: D0 02
loc_0C_85DA:
	LDA #$18                        ;C - - - - - 0x0185EA 0C:85DA: A9 18
loc_0C_85DC:
	JSR QueueSound                  ;C - - - - - 0x0185EC 0C:85DC: 20 4C F3
	LDY playerLevel                 ;C - - - - - 0x0185EF 0C:85DF: A4 6B
	LDA EnemyHitCheckTbl_87B6,Y     ;C - - - - - 0x0185F1 0C:85E1: B9 B6 87
	STA ptr_04                      ;C - - - - - 0x0185F4 0C:85E4: 85 04
	LDA EnemyHitCheckTbl_87BC,Y     ;C - - - - - 0x0185F6 0C:85E6: B9 BC 87
	STA ptr_04+1                    ;C - - - - - 0x0185F9 0C:85E9: 85 05
	LDY attackType                  ;C - - - - - 0x0185FB 0C:85EB: A4 A7
	JMP (ptr_04)                    ;C - - - - - 0x0185FD 0C:85ED: 6C 04 00
ofs_0C_85F0:
	LDA attackType                  ;C - - J - - 0x018600 0C:85F0: A5 A7
	CMP #$01                        ;C - - - - - 0x018602 0C:85F2: C9 01
	BNE loc_0C_85FA                 ;C - - - - - 0x018604 0C:85F4: D0 04
	LDA #$1A                        ;C - - - - - 0x018606 0C:85F6: A9 1A
	BNE loc_0C_8604                 ;C - - - - - 0x018608 0C:85F8: D0 0A
loc_0C_85FA:
	CMP #$08                        ;C - - - - - 0x01860A 0C:85FA: C9 08
	BNE loc_0C_8602                 ;C - - - - - 0x01860C 0C:85FC: D0 04
	.byte $A9,$1F                   ;- - - - - - 0x01860E 0C:85FE:
	.byte $D0                       ;- D 0 - - - 0x018610 0C:8600:
	.byte $02                       ;- - - - - - 0x018611 0C:8601:
loc_0C_8602:
	LDA #$18                        ;C - - - - - 0x018612 0C:8602: A9 18
loc_0C_8604:
	JSR QueueSound                  ;C - - - - - 0x018614 0C:8604: 20 4C F3
	LDY playerLevel                 ;C - - - - - 0x018617 0C:8607: A4 6B
	LDA EnemyHitCheckTbl_87C2,Y     ;C - - - - - 0x018619 0C:8609: B9 C2 87
	STA ptr_04                      ;C - - - - - 0x01861C 0C:860C: 85 04
	LDA EnemyHitCheckTbl_87C8,Y     ;C - - - - - 0x01861E 0C:860E: B9 C8 87
	STA ptr_04+1                    ;C - - - - - 0x018621 0C:8611: 85 05
	LDY attackType                  ;C - - - - - 0x018623 0C:8613: A4 A7
	JMP (ptr_04)                    ;C - - - - - 0x018625 0C:8615: 6C 04 00
ofs_0C_8618:
	LDA attackType                  ;C - - J - - 0x018628 0C:8618: A5 A7
	CMP #$0D                        ;C - - - - - 0x01862A 0C:861A: C9 0D
	BNE loc_0C_8622                 ;C - - - - - 0x01862C 0C:861C: D0 04
	LDA #$27                        ;C - - - - - 0x01862E 0C:861E: A9 27
	BNE loc_0C_8624                 ;C - - - - - 0x018630 0C:8620: D0 02
loc_0C_8622:
	LDA #$18                        ;C - - - - - 0x018632 0C:8622: A9 18
loc_0C_8624:
	JSR QueueSound                  ;C - - - - - 0x018634 0C:8624: 20 4C F3
	LDY playerLevel                 ;C - - - - - 0x018637 0C:8627: A4 6B
	LDA EnemyHitCheckTbl_87CE,Y     ;C - - - - - 0x018639 0C:8629: B9 CE 87
	STA ptr_04                      ;C - - - - - 0x01863C 0C:862C: 85 04
	LDA EnemyHitCheckTbl_87D2,Y     ;C - - - - - 0x01863E 0C:862E: B9 D2 87
	STA ptr_04+1                    ;C - - - - - 0x018641 0C:8631: 85 05
	LDY attackType                  ;C - - - - - 0x018643 0C:8633: A4 A7
	JMP (ptr_04)                    ;C - - - - - 0x018645 0C:8635: 6C 04 00
ofs_0C_8638:
	LDA EnemyHitCheckTbl_87D6,Y     ;C - - J - - 0x018648 0C:8638: B9 D6 87
	BNE loc_0C_8686                 ;C - - - - - 0x01864B 0C:863B: D0 49
ofs_0C_863D:
	LDA EnemyHitCheckTbl_87F9,Y     ;C - - J - - 0x01864D 0C:863D: B9 F9 87
	BNE loc_0C_8686                 ;C - - - - - 0x018650 0C:8640: D0 44
ofs_0C_8642:
	LDA EnemyHitCheckTbl_881C,Y     ;C - - J - - 0x018652 0C:8642: B9 1C 88
	BNE loc_0C_8686                 ;C - - - - - 0x018655 0C:8645: D0 3F
ofs_0C_8647:
	LDA EnemyHitCheckTbl_883F,Y     ;C - - J - - 0x018657 0C:8647: B9 3F 88
	BNE loc_0C_8686                 ;C - - - - - 0x01865A 0C:864A: D0 3A
ofs_0C_864C:
	LDA EnemyHitCheckTbl_8862,Y     ;C - - J - - 0x01865C 0C:864C: B9 62 88
	BNE loc_0C_8686                 ;C - - - - - 0x01865F 0C:864F: D0 35
ofs_0C_8651:
	LDA EnemyHitCheckTbl_8885,Y     ;c - - - - - 0x018661 0C:8651: B9 85 88
	BNE loc_0C_8686                 ;c - - - - - 0x018664 0C:8654: D0 30
ofs_0C_8656:
	LDA EnemyHitCheckTbl_88A8,Y     ;C - - J - - 0x018666 0C:8656: B9 A8 88
	BNE loc_0C_8686                 ;C - - - - - 0x018669 0C:8659: D0 2B
ofs_0C_865B:
	LDA EnemyHitCheckTbl_88A8,Y     ;C - - J - - 0x01866B 0C:865B: B9 A8 88
	BNE loc_0C_8686                 ;C - - - - - 0x01866E 0C:865E: D0 26
ofs_0C_8660:
	LDA EnemyHitCheckTbl_88CB,Y     ;C - - J - - 0x018670 0C:8660: B9 CB 88
	BNE loc_0C_8686                 ;C - - - - - 0x018673 0C:8663: D0 21
ofs_0C_8665:
	LDA EnemyHitCheckTbl_88EE,Y     ;C - - J - - 0x018675 0C:8665: B9 EE 88
	BNE loc_0C_8686                 ;C - - - - - 0x018678 0C:8668: D0 1C
ofs_0C_866A:
	LDA EnemyHitCheckTbl_8911,Y     ;C - - J - - 0x01867A 0C:866A: B9 11 89
	BNE loc_0C_8686                 ;C - - - - - 0x01867D 0C:866D: D0 17
ofs_0C_866F:
	LDA EnemyHitCheckTbl_8934,Y     ;C - - J - - 0x01867F 0C:866F: B9 34 89
	BNE loc_0C_8686                 ;C - - - - - 0x018682 0C:8672: D0 12
ofs_0C_8674:
	LDA EnemyHitCheckTbl_8957,Y     ;C - - J - - 0x018684 0C:8674: B9 57 89
	BNE loc_0C_8686                 ;C - - - - - 0x018687 0C:8677: D0 0D
ofs_0C_8679:
	LDA EnemyHitCheckTbl_897A,Y     ;C - - J - - 0x018689 0C:8679: B9 7A 89
	BNE loc_0C_8686                 ;C - - - - - 0x01868C 0C:867C: D0 08
ofs_0C_867E:
	LDA EnemyHitCheckTbl_899D,Y     ;C - - J - - 0x01868E 0C:867E: B9 9D 89
	BNE loc_0C_8686                 ;C - - - - - 0x018691 0C:8681: D0 03
ofs_0C_8683:
	LDA EnemyHitCheckTbl_89C0,Y     ;C - - J - - 0x018693 0C:8683: B9 C0 89
loc_0C_8686:
	STA ptr_00                      ;C - - - - - 0x018696 0C:8686: 85 00
	LDA attackType                  ;C - - - - - 0x018698 0C:8688: A5 A7
	CMP #$06                        ;C - - - - - 0x01869A 0C:868A: C9 06
	BEQ loc_0C_8692                 ;C - - - - - 0x01869C 0C:868C: F0 04
	CMP #$0C                        ;C - - - - - 0x01869E 0C:868E: C9 0C
	BNE loc_0C_8694                 ;C - - - - - 0x0186A0 0C:8690: D0 02
loc_0C_8692:
	STX ram_00A8                    ;C - - - - - 0x0186A2 0C:8692: 86 A8
loc_0C_8694:
	LDA objSpriteDown,X             ;C - - - - - 0x0186A4 0C:8694: BD B0 05
	CMP #$07                        ;C - - - - - 0x0186A7 0C:8697: C9 07
	BEQ loc_0C_86B8                 ;C - - - - - 0x0186A9 0C:8699: F0 1D
	CMP #$08                        ;C - - - - - 0x0186AB 0C:869B: C9 08
	BEQ loc_0C_86A9                 ;C - - - - - 0x0186AD 0C:869D: F0 0A
	CMP #$09                        ;C - - - - - 0x0186AF 0C:869F: C9 09
	BEQ loc_0C_86B8                 ;C - - - - - 0x0186B1 0C:86A1: F0 15
	CMP #$0B                        ;C - - - - - 0x0186B3 0C:86A3: C9 0B
	BEQ loc_0C_86B8                 ;C - - - - - 0x0186B5 0C:86A5: F0 11
	BNE loc_0C_86E4                 ;C - - - - - 0x0186B7 0C:86A7: D0 3B
loc_0C_86A9:
	CPY #$05                        ;C - - - - - 0x0186B9 0C:86A9: C0 05
	BEQ loc_0C_86B1                 ;C - - - - - 0x0186BB 0C:86AB: F0 04
	CPY #$13                        ;C - - - - - 0x0186BD 0C:86AD: C0 13
	BNE loc_0C_86B8                 ;C - - - - - 0x0186BF 0C:86AF: D0 07
loc_0C_86B1:
	LDA ptr_00                      ;C - - - - - 0x0186C1 0C:86B1: A5 00
	CLC                             ;C - - - - - 0x0186C3 0C:86B3: 18
	ADC #$05                        ;C - - - - - 0x0186C4 0C:86B4: 69 05
	STA ptr_00                      ;C - - - - - 0x0186C6 0C:86B6: 85 00
loc_0C_86B8:
	LDA objSpriteDown,X             ;C - - - - - 0x0186C8 0C:86B8: BD B0 05
	SEC                             ;C - - - - - 0x0186CB 0C:86BB: 38
	SBC #$07                        ;C - - - - - 0x0186CC 0C:86BC: E9 07
	TAY                             ;C - - - - - 0x0186CE 0C:86BE: A8
	CMP #$01                        ;C - - - - - 0x0186CF 0C:86BF: C9 01
	BNE loc_0C_86CA                 ;C - - - - - 0x0186D1 0C:86C1: D0 07
	LDA objVariant,X                ;C - - - - - 0x0186D3 0C:86C3: BD C0 05
	BEQ loc_0C_86CA                 ;C - - - - - 0x0186D6 0C:86C6: F0 02
	LDY #$03                        ;C - - - - - 0x0186D8 0C:86C8: A0 03
loc_0C_86CA:
	LDA stage                       ;C - - - - - 0x0186DA 0C:86CA: A5 61
	CMP #$04                        ;C - - - - - 0x0186DC 0C:86CC: C9 04
	BNE loc_0C_86D2                 ;C - - - - - 0x0186DE 0C:86CE: D0 02
	DEC ptr_00                      ;C - - - - - 0x0186E0 0C:86D0: C6 00
loc_0C_86D2:
	LDA ptr_00                      ;C - - - - - 0x0186E2 0C:86D2: A5 00
	SEC                             ;C - - - - - 0x0186E4 0C:86D4: 38
	SBC EnemyHitCheckTbl_87AB,Y     ;C - - - - - 0x0186E5 0C:86D5: F9 AB 87
	STA ptr_00                      ;C - - - - - 0x0186E8 0C:86D8: 85 00
	BEQ loc_0C_86E0                 ;C - - - - - 0x0186EA 0C:86DA: F0 04
	BMI loc_0C_86E0                 ;C - - - - - 0x0186EC 0C:86DC: 30 02
	BPL loc_0C_86E4                 ;C - - - - - 0x0186EE 0C:86DE: 10 04
loc_0C_86E0:
	LDA #$01                        ;C - - - - - 0x0186F0 0C:86E0: A9 01
	STA ptr_00                      ;C - - - - - 0x0186F2 0C:86E2: 85 00
; GG GNVAITEO/SNVATTGE one hit kills: LDA objLife,X / SEC / SBC dmg
loc_0C_86E4:
	LDA objLife,X                   ;C - - - - - 0x0186F4 0C:86E4: BD 90 04
	SEC                             ;C - - - - - 0x0186F7 0C:86E7: 38
	SBC ptr_00                      ;C - - - - - 0x0186F8 0C:86E8: E5 00
	STA objLife,X                   ;C - - - - - 0x0186FA 0C:86EA: 9D 90 04
	LDA objSpriteDown,X             ;C - - - - - 0x0186FD 0C:86ED: BD B0 05
	CMP #$08                        ;C - - - - - 0x018700 0C:86F0: C9 08
	BNE loc_0C_8702                 ;C - - - - - 0x018702 0C:86F2: D0 0E
	LDA objLife,X                   ;C - - - - - 0x018704 0C:86F4: BD 90 04
	CMP #$30                        ;C - - - - - 0x018707 0C:86F7: C9 30
	BCS loc_0C_8702                 ;C - - - - - 0x018709 0C:86F9: B0 07
	LDA objVariant,X                ;C - - - - - 0x01870B 0C:86FB: BD C0 05
	CMP #$01                        ;C - - - - - 0x01870E 0C:86FE: C9 01
	BEQ loc_0C_8703                 ;C - - - - - 0x018710 0C:8700: F0 01
loc_0C_8702:
	RTS                             ;C - - - - - 0x018712 0C:8702: 60
loc_0C_8703:
	LDA gameAction                  ;C - - - - - 0x018713 0C:8703: A5 30
	CMP #$04                        ;C - - - - - 0x018715 0C:8705: C9 04
	BEQ loc_0C_870D                 ;C - - - - - 0x018717 0C:8707: F0 04
	CMP #$21                        ;C - - - - - 0x018719 0C:8709: C9 21
	BNE loc_0C_872D                 ;C - - - - - 0x01871B 0C:870B: D0 20
loc_0C_870D:
	LDA #$00                        ;c - - - - - 0x01871D 0C:870D: A9 00
	STA ram_0038                    ;c - - - - - 0x01871F 0C:870F: 85 38
	STA gameAction                  ;c - - - - - 0x018721 0C:8711: 85 30
	STA ram_00BA                    ;c - - - - - 0x018723 0C:8713: 85 BA
	JSR ClearTimerA4                ;c - - - - - 0x018725 0C:8715: 20 36 F4
	LDA #$80                        ;c - - - - - 0x018728 0C:8718: A9 80
	STA objActive                   ;c - - - - - 0x01872A 0C:871A: 8D 00 03
	LDY playerId                    ;c - - - - - 0x01872D 0C:871D: A4 34
	LDA tbl_0F_E288,Y               ;c - - - - - 0x01872F 0C:871F: B9 88 E2
	STA playerStandAnim             ;c - - - - - 0x018732 0C:8722: 85 6F
	JSR ResetPlayerStand            ;c - - - - - 0x018734 0C:8724: 20 AA CE
	LDA objY                        ;c - - - - - 0x018737 0C:8727: AD C0 03
	STA objY,X                      ;c - - - - - 0x01873A 0C:872A: 9D C0 03
loc_0C_872D:
	LDA #$0D                        ;C - - - - - 0x01873D 0C:872D: A9 0D
	STA ptr_00                      ;C - - - - - 0x01873F 0C:872F: 85 00
	LDY #$00                        ;C - - - - - 0x018741 0C:8731: A0 00
loc_0C_8733:
	LDA EnemyHitCheckTbl_87A7,Y     ;C - - - - - 0x018743 0C:8733: B9 A7 87
	STA ptr_00+1                    ;C - - - - - 0x018746 0C:8736: 85 01
	LDA EnemyHitCheckTbl_87A8,Y     ;C - - - - - 0x018748 0C:8738: B9 A8 87
	STA ptr_02                      ;C - - - - - 0x01874B 0C:873B: 85 02
	LDY ptr_00                      ;C - - - - - 0x01874D 0C:873D: A4 00
	LDA objFacing,X                 ;C - - - - - 0x01874F 0C:873F: BD 60 04
	STA objFacing,Y                 ;C - - - - - 0x018752 0C:8742: 99 60 04
	LDA objYPage,X                  ;C - - - - - 0x018755 0C:8745: BD E0 03
	STA objYPage,Y                  ;C - - - - - 0x018758 0C:8748: 99 E0 03
	LDA objX,X                      ;C - - - - - 0x01875B 0C:874B: BD 60 03
	CLC                             ;C - - - - - 0x01875E 0C:874E: 18
	ADC ptr_00+1                    ;C - - - - - 0x01875F 0C:874F: 65 01
	STA objX,Y                      ;C - - - - - 0x018761 0C:8751: 99 60 03
	LDA objXPage,X                  ;C - - - - - 0x018764 0C:8754: BD 80 03
	ADC #$00                        ;C - - - - - 0x018767 0C:8757: 69 00
	STA objXPage,Y                  ;C - - - - - 0x018769 0C:8759: 99 80 03
	CMP objXPage                    ;C - - - - - 0x01876C 0C:875C: CD 80 03
	BNE loc_0C_879A                 ;C - - - - - 0x01876F 0C:875F: D0 39
	LDA objY,X                      ;C - - - - - 0x018771 0C:8761: BD C0 03
	CLC                             ;C - - - - - 0x018774 0C:8764: 18
	ADC #$0E                        ;C - - - - - 0x018775 0C:8765: 69 0E
	STA objParamC,Y                 ;C - - - - - 0x018777 0C:8767: 99 30 05
	LDA objY,X                      ;C - - - - - 0x01877A 0C:876A: BD C0 03
	SEC                             ;C - - - - - 0x01877D 0C:876D: 38
	SBC ptr_02                      ;C - - - - - 0x01877E 0C:876E: E5 02
	STA objY,Y                      ;C - - - - - 0x018780 0C:8770: 99 C0 03
	LDA #$FD                        ;C - - - - - 0x018783 0C:8773: A9 FD
	STA objAnim,Y                   ;C - - - - - 0x018785 0C:8775: 99 80 05
	LDA #$FF                        ;C - - - - - 0x018788 0C:8778: A9 FF
	STA objLife,Y                   ;C - - - - - 0x01878A 0C:877A: 99 90 04
	LDA #$0D                        ;C - - - - - 0x01878D 0C:877D: A9 0D
	STA objSpriteDown,Y             ;C - - - - - 0x01878F 0C:877F: 99 B0 05
	LDA #$06                        ;C - - - - - 0x018792 0C:8782: A9 06
	STA objKind,Y                   ;C - - - - - 0x018794 0C:8784: 99 20 03
	STA objId,Y                     ;C - - - - - 0x018797 0C:8787: 99 30 03
	LDA #$80                        ;C - - - - - 0x01879A 0C:878A: A9 80
	STA objActive,Y                 ;C - - - - - 0x01879C 0C:878C: 99 00 03
	LDA #$00                        ;C - - - - - 0x01879F 0C:878F: A9 00
	STA objAnimFlags,Y              ;C - - - - - 0x0187A1 0C:8791: 99 90 05
	TYA                             ;C - - - - - 0x0187A4 0C:8794: 98
	AND #$03                        ;C - - - - - 0x0187A5 0C:8795: 29 03
	STA objAnimFrame,Y              ;C - - - - - 0x0187A7 0C:8797: 99 70 05
loc_0C_879A:
	LDY #$02                        ;C - - - - - 0x0187AA 0C:879A: A0 02
	DEC ptr_00                      ;C - - - - - 0x0187AC 0C:879C: C6 00
	DEC ptr_00                      ;C - - - - - 0x0187AE 0C:879E: C6 00
	LDA ptr_00                      ;C - - - - - 0x0187B0 0C:87A0: A5 00
	CMP #$09                        ;C - - - - - 0x0187B2 0C:87A2: C9 09
	BNE loc_0C_8733                 ;C - - - - - 0x0187B4 0C:87A4: D0 8D
	RTS                             ;C - - - - - 0x0187B6 0C:87A6: 60
EnemyHitCheckTbl_87A7:
	.byte $0C                       ;- D 0 - - - 0x0187B7 0C:87A7:
EnemyHitCheckTbl_87A8:
	.byte $0C,$00,$04               ;- D 0 - - - 0x0187B8 0C:87A8:
EnemyHitCheckTbl_87AB:
	.byte $02,$04,$04,$08,$08       ;- D 0 - - - 0x0187BB 0C:87AB:
EnemyHitCheckTbl_87B0:
	.lobytes ofs_0C_85C8, ofs_0C_85F0, ofs_0C_8618;- D 0 - - - 0x0187C0 0C:87B0:
EnemyHitCheckTbl_87B3:
	.hibytes ofs_0C_85C8, ofs_0C_85F0, ofs_0C_8618;- D 0 - - - 0x0187C3 0C:87B3:
EnemyHitCheckTbl_87B6:
	.lobytes ofs_0C_8638, ofs_0C_863D, ofs_0C_8642, ofs_0C_8647, ofs_0C_864C, ofs_0C_8651;- D 0 - - - 0x0187C6 0C:87B6:
EnemyHitCheckTbl_87BC:
	.hibytes ofs_0C_8638, ofs_0C_863D, ofs_0C_8642, ofs_0C_8647, ofs_0C_864C, ofs_0C_8651;- D 0 - - - 0x0187CC 0C:87BC:
EnemyHitCheckTbl_87C2:
	.lobytes ofs_0C_8656, ofs_0C_865B, ofs_0C_8660, ofs_0C_8665, ofs_0C_866A, ofs_0C_866F;- D 0 - - - 0x0187D2 0C:87C2:
EnemyHitCheckTbl_87C8:
	.hibytes ofs_0C_8656, ofs_0C_865B, ofs_0C_8660, ofs_0C_8665, ofs_0C_866A, ofs_0C_866F;- D 0 - - - 0x0187D8 0C:87C8:
EnemyHitCheckTbl_87CE:
	.lobytes ofs_0C_8674, ofs_0C_8679, ofs_0C_867E, ofs_0C_8683;- D 0 - - - 0x0187DE 0C:87CE:
EnemyHitCheckTbl_87D2:
	.hibytes ofs_0C_8674, ofs_0C_8679, ofs_0C_867E, ofs_0C_8683;- D 0 - - - 0x0187E2 0C:87D2:
EnemyHitCheckTbl_87D6:
	.byte $02                       ;- D 0 - - - 0x0187E6 0C:87D6:
	.byte $09,$08,$04               ;- - - - - - 0x0187E7 0C:87D7:
	.byte $04,$08,$03,$0C           ;- D 0 - - - 0x0187EA 0C:87DA:
	.byte $09                       ;- - - - - - 0x0187EE 0C:87DE:
	.byte $08                       ;- D 0 - - - 0x0187EF 0C:87DF:
	.byte $08,$01,$01,$01,$01,$01,$01,$01,$01,$01;- - - - - - 0x0187F0 0C:87E0:
	.byte $08,$08,$08,$08           ;- D 0 - - - 0x0187FA 0C:87EA:
	.byte $01,$01,$01               ;- - - - - - 0x0187FE 0C:87EE:
	.byte $04,$04,$08               ;- D 0 - - - 0x018801 0C:87F1:
	.byte $01,$01,$01,$01,$0C       ;- - - - - - 0x018804 0C:87F4:
EnemyHitCheckTbl_87F9:
	.byte $03                       ;- D 0 - - - 0x018809 0C:87F9:
	.byte $0A,$08                   ;- - - - - - 0x01880A 0C:87FA:
	.byte $05,$05,$0A,$04,$0E       ;- D 0 - - - 0x01880C 0C:87FC:
	.byte $0B                       ;- - - - - - 0x018811 0C:8801:
	.byte $08                       ;- D 0 - - - 0x018812 0C:8802:
	.byte $0A,$01,$01,$01,$01,$01,$01,$01,$01,$01,$08,$08,$08,$08,$01,$01;- - - - - - 0x018813 0C:8803:
	.byte $01,$05,$05,$09,$01,$01,$01,$01,$0E;- - - - - - 0x018823 0C:8813:
EnemyHitCheckTbl_881C:
	.byte $04                       ;- D 0 - - - 0x01882C 0C:881C:
	.byte $0B,$08                   ;- - - - - - 0x01882D 0C:881D:
	.byte $06,$06,$0C,$05,$10       ;- D 0 - - - 0x01882F 0C:881F:
	.byte $0D                       ;- - - - - - 0x018834 0C:8824:
	.byte $08                       ;- D 0 - - - 0x018835 0C:8825:
	.byte $0C,$01,$01,$01,$01,$01,$01,$01,$01,$01;- - - - - - 0x018836 0C:8826:
	.byte $08,$08                   ;- D 0 - - - 0x018840 0C:8830:
	.byte $08                       ;- - - - - - 0x018842 0C:8832:
	.byte $08                       ;- D 0 - - - 0x018843 0C:8833:
	.byte $01,$01,$01               ;- - - - - - 0x018844 0C:8834:
	.byte $06,$06,$0A               ;- D 0 - - - 0x018847 0C:8837:
	.byte $01,$01,$01,$01,$10       ;- - - - - - 0x01884A 0C:883A:
EnemyHitCheckTbl_883F:
	.byte $05                       ;- D 0 - - - 0x01884F 0C:883F:
	.byte $0C,$08                   ;- - - - - - 0x018850 0C:8840:
	.byte $07,$07,$0E,$06,$12,$0F,$08;- D 0 - - - 0x018852 0C:8842:
	.byte $0E,$01,$01,$01,$01,$01,$01,$01,$01,$01;- - - - - - 0x018859 0C:8849:
	.byte $08                       ;- D 0 - - - 0x018863 0C:8853:
	.byte $08                       ;- - - - - - 0x018864 0C:8854:
	.byte $08                       ;- D 0 - - - 0x018865 0C:8855:
	.byte $08,$01,$01,$01           ;- - - - - - 0x018866 0C:8856:
	.byte $07,$07,$0B               ;- D 0 - - - 0x01886A 0C:885A:
	.byte $01,$01,$01,$01           ;- - - - - - 0x01886D 0C:885D:
	.byte $12                       ;- D 0 - - - 0x018871 0C:8861:
EnemyHitCheckTbl_8862:
	.byte $06                       ;- D 0 - - - 0x018872 0C:8862:
	.byte $0D,$08                   ;- - - - - - 0x018873 0C:8863:
	.byte $08,$08,$10,$07,$14       ;- D 0 - - - 0x018875 0C:8865:
	.byte $11                       ;- - - - - - 0x01887A 0C:886A:
	.byte $08                       ;- D 0 - - - 0x01887B 0C:886B:
	.byte $10,$01,$01,$01,$01,$01,$01,$01,$01,$01;- - - - - - 0x01887C 0C:886C:
	.byte $08                       ;- D 0 - - - 0x018886 0C:8876:
	.byte $08,$08,$08,$01,$01,$01   ;- - - - - - 0x018887 0C:8877:
	.byte $08,$08,$0C               ;- D 0 - - - 0x01888D 0C:887D:
	.byte $01,$01,$01,$01           ;- - - - - - 0x018890 0C:8880:
	.byte $14                       ;- D 0 - - - 0x018894 0C:8884:
EnemyHitCheckTbl_8885:
	.byte $0B,$0E,$08,$0D,$0D,$15,$0C,$19,$16,$08,$15,$01,$01,$01,$01,$01;- - - - - - 0x018895 0C:8885:
	.byte $01,$01,$01,$01,$08,$08,$08,$08,$01,$01,$01,$0D,$0D,$11,$01,$01;- - - - - - 0x0188A5 0C:8895:
	.byte $01,$01,$19               ;- - - - - - 0x0188B5 0C:88A5:
EnemyHitCheckTbl_88A8:
	.byte $01,$05                   ;- D 0 - - - 0x0188B8 0C:88A8:
	.byte $08                       ;- - - - - - 0x0188BA 0C:88AA:
	.byte $05,$05,$0A,$03           ;- D 0 - - - 0x0188BB 0C:88AB:
	.byte $08,$02                   ;- - - - - - 0x0188BF 0C:88AF:
	.byte $08,$14                   ;- D 0 - - - 0x0188C1 0C:88B1:
	.res 9, $01                     ;- - - - - - 0x0188C3 0C:88B3: fill 9 bytes
	.byte $08,$08                   ;- D 0 - - - 0x0188CC 0C:88BC:
	.byte $08,$08                   ;- - - - - - 0x0188CE 0C:88BE:
	.byte $0B                       ;- D 0 - - - 0x0188D0 0C:88C0:
	.byte $01,$01                   ;- - - - - - 0x0188D1 0C:88C1:
	.byte $04,$04,$08               ;- D 0 - - - 0x0188D3 0C:88C3:
	.byte $01,$01,$01,$01,$01       ;- - - - - - 0x0188D6 0C:88C6:
EnemyHitCheckTbl_88CB:
	.byte $01,$07                   ;- D 0 - - - 0x0188DB 0C:88CB:
	.byte $08                       ;- - - - - - 0x0188DD 0C:88CD:
	.byte $07,$07,$0E,$06           ;- D 0 - - - 0x0188DE 0C:88CE:
	.byte $08,$02                   ;- - - - - - 0x0188E2 0C:88D2:
	.byte $08                       ;- D 0 - - - 0x0188E4 0C:88D4:
	.byte $15,$01,$01,$01,$01,$01,$01,$01,$01,$01,$08,$08,$08,$08;- - - - - - 0x0188E5 0C:88D5:
	.byte $0F                       ;- D 0 - - - 0x0188F3 0C:88E3:
	.byte $01,$01                   ;- - - - - - 0x0188F4 0C:88E4:
	.byte $06,$06                   ;- D 0 - - - 0x0188F6 0C:88E6:
	.byte $0A,$01,$01,$01,$01,$01   ;- - - - - - 0x0188F8 0C:88E8:
EnemyHitCheckTbl_88EE:
	.byte $01,$08                   ;- D 0 - - - 0x0188FE 0C:88EE:
	.byte $08                       ;- - - - - - 0x018900 0C:88F0:
	.byte $08,$08,$10,$07           ;- D 0 - - - 0x018901 0C:88F1:
	.byte $08,$02                   ;- - - - - - 0x018905 0C:88F5:
	.byte $08                       ;- D 0 - - - 0x018907 0C:88F7:
	.byte $15,$01,$01,$01,$01,$01,$01,$01,$01,$01;- - - - - - 0x018908 0C:88F8:
	.byte $08,$08                   ;- D 0 - - - 0x018912 0C:8902:
	.byte $08,$08,$11,$01,$01       ;- - - - - - 0x018914 0C:8904:
	.byte $07,$07,$0B               ;- D 0 - - - 0x018919 0C:8909:
	.byte $01,$01,$01,$01,$01       ;- - - - - - 0x01891C 0C:890C:
EnemyHitCheckTbl_8911:
	.byte $01,$09                   ;- D 0 - - - 0x018921 0C:8911:
	.byte $08                       ;- - - - - - 0x018923 0C:8913:
	.byte $09,$09,$12,$08           ;- D 0 - - - 0x018924 0C:8914:
	.byte $08,$02                   ;- - - - - - 0x018928 0C:8918:
	.byte $08,$15                   ;- D 0 - - - 0x01892A 0C:891A:
	.res 9, $01                     ;- - - - - - 0x01892C 0C:891C: fill 9 bytes
	.byte $08                       ;- D 0 - - - 0x018935 0C:8925:
	.byte $08                       ;- - - - - - 0x018936 0C:8926:
	.byte $08                       ;- D 0 - - - 0x018937 0C:8927:
	.byte $08                       ;- - - - - - 0x018938 0C:8928:
	.byte $13                       ;- D 0 - - - 0x018939 0C:8929:
	.byte $01,$01                   ;- - - - - - 0x01893A 0C:892A:
	.byte $08,$08,$0C               ;- D 0 - - - 0x01893C 0C:892C:
	.byte $01,$01,$01,$01,$01       ;- - - - - - 0x01893F 0C:892F:
EnemyHitCheckTbl_8934:
	.byte $02,$0E                   ;- D 0 - - - 0x018944 0C:8934:
	.byte $08                       ;- - - - - - 0x018946 0C:8936:
	.byte $0E,$0E,$17,$0D           ;- D 0 - - - 0x018947 0C:8937:
	.byte $08,$02                   ;- - - - - - 0x01894B 0C:893B:
	.byte $08                       ;- D 0 - - - 0x01894D 0C:893D:
	.byte $15,$01,$01,$01,$01,$01,$01,$01,$01,$01;- - - - - - 0x01894E 0C:893E:
	.byte $08                       ;- D 0 - - - 0x018958 0C:8948:
	.byte $08,$08,$08               ;- - - - - - 0x018959 0C:8949:
	.byte $18                       ;- D 0 - - - 0x01895C 0C:894C:
	.byte $01,$01                   ;- - - - - - 0x01895D 0C:894D:
	.byte $0D,$0D                   ;- D 0 - - - 0x01895F 0C:894F:
	.byte $11,$01,$01,$01,$01,$01   ;- - - - - - 0x018961 0C:8951:
EnemyHitCheckTbl_8957:
	.byte $02,$0A,$08               ;- - - - - - 0x018967 0C:8957:
	.byte $0A                       ;- D 0 - - - 0x01896A 0C:895A:
	.byte $0A                       ;- - - - - - 0x01896B 0C:895B:
	.byte $10                       ;- D 0 - - - 0x01896C 0C:895C:
	.byte $01,$01,$20               ;- - - - - - 0x01896D 0C:895D:
	.byte $08                       ;- D 0 - - - 0x018970 0C:8960:
	.byte $01                       ;- - - - - - 0x018971 0C:8961:
	.byte $06,$04,$0A               ;- D 0 - - - 0x018972 0C:8962:
	.byte $20                       ;- - - - - - 0x018975 0C:8965:
	.byte $08,$08,$08,$08,$18       ;- D 0 - - - 0x018976 0C:8966:
	.byte $01,$01,$01,$01,$01,$02,$02;- - - - - - 0x01897B 0C:896B:
	.byte $05,$05                   ;- D 0 - - - 0x018982 0C:8972:
	.byte $09,$01,$01,$01,$01,$01   ;- - - - - - 0x018984 0C:8974:
EnemyHitCheckTbl_897A:
	.byte $02,$0A,$08               ;- - - - - - 0x01898A 0C:897A:
	.byte $0C                       ;- D 0 - - - 0x01898D 0C:897D:
	.byte $0C                       ;- - - - - - 0x01898E 0C:897E:
	.byte $14                       ;- D 0 - - - 0x01898F 0C:897F:
	.byte $01,$0C,$22               ;- - - - - - 0x018990 0C:8980:
	.byte $08                       ;- D 0 - - - 0x018993 0C:8983:
	.byte $01                       ;- - - - - - 0x018994 0C:8984:
	.byte $07,$06,$0C               ;- D 0 - - - 0x018995 0C:8985:
	.byte $22,$08,$08,$08,$08       ;- - - - - - 0x018998 0C:8988:
	.byte $1C                       ;- D 0 - - - 0x01899D 0C:898D:
	.byte $01,$01,$01,$01,$01,$04   ;- - - - - - 0x01899E 0C:898E:
	.byte $04,$06,$06               ;- D 0 - - - 0x0189A4 0C:8994:
	.byte $0A,$01,$01,$01,$01,$01   ;- - - - - - 0x0189A7 0C:8997:
EnemyHitCheckTbl_899D:
	.byte $02,$0A,$08               ;- - - - - - 0x0189AD 0C:899D:
	.byte $0E                       ;- D 0 - - - 0x0189B0 0C:89A0:
	.byte $0E                       ;- - - - - - 0x0189B1 0C:89A1:
	.byte $18                       ;- D 0 - - - 0x0189B2 0C:89A2:
	.byte $01,$01,$24               ;- - - - - - 0x0189B3 0C:89A3:
	.byte $08                       ;- D 0 - - - 0x0189B6 0C:89A6:
	.byte $01                       ;- - - - - - 0x0189B7 0C:89A7:
	.byte $08,$0A,$0E,$24,$08,$08,$08,$08,$20;- D 0 - - - 0x0189B8 0C:89A8:
	.byte $01,$01,$01,$01,$01,$06   ;- - - - - - 0x0189C1 0C:89B1:
	.byte $06,$07,$07,$0B           ;- D 0 - - - 0x0189C7 0C:89B7:
	.byte $01,$01,$01,$01,$01       ;- - - - - - 0x0189CB 0C:89BB:
EnemyHitCheckTbl_89C0:
	.byte $02,$0A,$08               ;- - - - - - 0x0189D0 0C:89C0:
	.byte $13                       ;- D 0 - - - 0x0189D3 0C:89C3:
	.byte $13                       ;- - - - - - 0x0189D4 0C:89C4:
	.byte $1D                       ;- D 0 - - - 0x0189D5 0C:89C5:
	.byte $01,$01,$29               ;- - - - - - 0x0189D6 0C:89C6:
	.byte $08                       ;- D 0 - - - 0x0189D9 0C:89C9:
	.byte $01                       ;- - - - - - 0x0189DA 0C:89CA:
	.byte $0D,$0F,$13               ;- D 0 - - - 0x0189DB 0C:89CB:
	.byte $29                       ;- - - - - - 0x0189DE 0C:89CE:
	.byte $08,$08,$08,$08,$27       ;- D 0 - - - 0x0189DF 0C:89CF:
	.byte $01,$01,$01,$01,$01,$08   ;- - - - - - 0x0189E4 0C:89D4:
	.byte $08,$0C,$0C               ;- D 0 - - - 0x0189EA 0C:89DA:
	.byte $10,$01,$01,$01,$01,$01   ;- - - - - - 0x0189ED 0C:89DD:
PlayerSpecialDispatch:
	LDY playerId                    ;C - - - - - 0x0189F3 0C:89E3: A4 34
	LDA PlayerSpecialDispatchTbl_8ACE,Y;C - - - - - 0x0189F5 0C:89E5: B9 CE 8A
	STA ptr_02+1                    ;C - - - - - 0x0189F8 0C:89E8: 85 03
	LDA PlayerSpecialDispatchTbl_8AD1,Y;C - - - - - 0x0189FA 0C:89EA: B9 D1 8A
	STA ptr_04                      ;C - - - - - 0x0189FD 0C:89ED: 85 04
	JMP (ptr_02+1)                  ;C - - - - - 0x0189FF 0C:89EF: 6C 03 00
ofs_0C_89F2:
	LDA playerLevel                 ;C - - J - - 0x018A02 0C:89F2: A5 6B
	CMP #$05                        ;C - - - - - 0x018A04 0C:89F4: C9 05
	BNE loc_0C_89F9                 ;C - - - - - 0x018A06 0C:89F6: D0 01
; kinds 01, 09 (shares an RTS)
EnemyAI_Nop:
	RTS                             ;C - - J - - 0x018A08 0C:89F8: 60
loc_0C_89F9:
	LDY playerLevel                 ;C - - - - - 0x018A09 0C:89F9: A4 6B
	LDA EnemyAI_NopTbl_8AD4,Y       ;C - - - - - 0x018A0B 0C:89FB: B9 D4 8A
	STA ram_0008                    ;C - - - - - 0x018A0E 0C:89FE: 85 08
	LDA EnemyAI_NopTbl_8AD9,Y       ;C - - - - - 0x018A10 0C:8A00: B9 D9 8A
	STA ram_0009                    ;C - - - - - 0x018A13 0C:8A03: 85 09
	JMP loc_0C_8A31                 ;C - - - - - 0x018A15 0C:8A05: 4C 31 8A
ofs_0C_8A08:
	LDA playerLevel                 ;C - - J - - 0x018A18 0C:8A08: A5 6B
	CMP #$05                        ;C - - - - - 0x018A1A 0C:8A0A: C9 05
	BNE loc_0C_8A0F                 ;C - - - - - 0x018A1C 0C:8A0C: D0 01
	RTS                             ;C - - - - - 0x018A1E 0C:8A0E: 60
loc_0C_8A0F:
	LDY playerLevel                 ;C - - - - - 0x018A1F 0C:8A0F: A4 6B
	LDA EnemyAI_NopTbl_8ADE,Y       ;C - - - - - 0x018A21 0C:8A11: B9 DE 8A
	STA ram_0008                    ;C - - - - - 0x018A24 0C:8A14: 85 08
	LDA EnemyAI_NopTbl_8AE3,Y       ;C - - - - - 0x018A26 0C:8A16: B9 E3 8A
	STA ram_0009                    ;C - - - - - 0x018A29 0C:8A19: 85 09
	JMP loc_0C_8A31                 ;C - - - - - 0x018A2B 0C:8A1B: 4C 31 8A
ofs_0C_8A1E:
	LDA playerLevel                 ;C - - J - - 0x018A2E 0C:8A1E: A5 6B
	CMP #$03                        ;C - - - - - 0x018A30 0C:8A20: C9 03
	BNE loc_0C_8A25                 ;C - - - - - 0x018A32 0C:8A22: D0 01
	RTS                             ;C - - - - - 0x018A34 0C:8A24: 60
loc_0C_8A25:
	LDY playerLevel                 ;C - - - - - 0x018A35 0C:8A25: A4 6B
	LDA EnemyAI_NopTbl_8AE8,Y       ;C - - - - - 0x018A37 0C:8A27: B9 E8 8A
	STA ram_0008                    ;C - - - - - 0x018A3A 0C:8A2A: 85 08
	LDA EnemyAI_NopTbl_8AEB,Y       ;C - - - - - 0x018A3C 0C:8A2C: B9 EB 8A
	STA ram_0009                    ;C - - - - - 0x018A3F 0C:8A2F: 85 09
loc_0C_8A31:
	LDA playerExp                   ;C - - - - - 0x018A41 0C:8A31: A5 6C
	AND #$0F                        ;C - - - - - 0x018A43 0C:8A33: 29 0F
	STA ptr_04+1                    ;C - - - - - 0x018A45 0C:8A35: 85 05
	LDA playerExp                   ;C - - - - - 0x018A47 0C:8A37: A5 6C
	AND #$F0                        ;C - - - - - 0x018A49 0C:8A39: 29 F0
	STA ptr_06                      ;C - - - - - 0x018A4B 0C:8A3B: 85 06
	LDA playerExp+1                 ;C - - - - - 0x018A4D 0C:8A3D: A5 6D
	AND #$0F                        ;C - - - - - 0x018A4F 0C:8A3F: 29 0F
	STA ptr_06+1                    ;C - - - - - 0x018A51 0C:8A41: 85 07
	LDY attackType                  ;C - - - - - 0x018A53 0C:8A43: A4 A7
	CPY #$03                        ;C - - - - - 0x018A55 0C:8A45: C0 03
	BNE loc_0C_8A56                 ;C - - - - - 0x018A57 0C:8A47: D0 0D
	LDA objAnim                     ;C - - - - - 0x018A59 0C:8A49: AD 80 05
	CMP #$24                        ;C - - - - - 0x018A5C 0C:8A4C: C9 24
	BNE loc_0C_8A56                 ;C - - - - - 0x018A5E 0C:8A4E: D0 06
	LDA #$05                        ;C - - - - - 0x018A60 0C:8A50: A9 05
	STA ptr_0A                      ;C - - - - - 0x018A62 0C:8A52: 85 0A
	BNE loc_0C_8A5D                 ;C - - - - - 0x018A64 0C:8A54: D0 07
loc_0C_8A56:
	LDA EnemyAI_NopTbl_FC10,Y       ;C - - - - - 0x018A66 0C:8A56: B9 10 FC
	AND #$0F                        ;C - - - - - 0x018A69 0C:8A59: 29 0F
	STA ptr_0A                      ;C - - - - - 0x018A6B 0C:8A5B: 85 0A
loc_0C_8A5D:
	LDA EnemyAI_NopTbl_FC10,Y       ;C - - - - - 0x018A6D 0C:8A5D: B9 10 FC
	AND #$F0                        ;C - - - - - 0x018A70 0C:8A60: 29 F0
	STA ptr_0A+1                    ;C - - - - - 0x018A72 0C:8A62: 85 0B
	LDA ptr_04+1                    ;C - - - - - 0x018A74 0C:8A64: A5 05
	CLC                             ;C - - - - - 0x018A76 0C:8A66: 18
	ADC ptr_0A                      ;C - - - - - 0x018A77 0C:8A67: 65 0A
	STA ptr_04+1                    ;C - - - - - 0x018A79 0C:8A69: 85 05
	CMP #$0A                        ;C - - - - - 0x018A7B 0C:8A6B: C9 0A
	BCC loc_0C_8A7B                 ;C - - - - - 0x018A7D 0C:8A6D: 90 0C
	SEC                             ;C - - - - - 0x018A7F 0C:8A6F: 38
	SBC #$0A                        ;C - - - - - 0x018A80 0C:8A70: E9 0A
	STA ptr_04+1                    ;C - - - - - 0x018A82 0C:8A72: 85 05
	LDA ptr_0A+1                    ;C - - - - - 0x018A84 0C:8A74: A5 0B
	CLC                             ;C - - - - - 0x018A86 0C:8A76: 18
	ADC #$10                        ;C - - - - - 0x018A87 0C:8A77: 69 10
	STA ptr_0A+1                    ;C - - - - - 0x018A89 0C:8A79: 85 0B
loc_0C_8A7B:
	LDA ptr_06                      ;C - - - - - 0x018A8B 0C:8A7B: A5 06
	CLC                             ;C - - - - - 0x018A8D 0C:8A7D: 18
	ADC ptr_0A+1                    ;C - - - - - 0x018A8E 0C:8A7E: 65 0B
	STA ptr_06                      ;C - - - - - 0x018A90 0C:8A80: 85 06
	CMP #$A0                        ;C - - - - - 0x018A92 0C:8A82: C9 A0
	BCC loc_0C_8A8D                 ;C - - - - - 0x018A94 0C:8A84: 90 07
	SEC                             ;C - - - - - 0x018A96 0C:8A86: 38
	SBC #$A0                        ;C - - - - - 0x018A97 0C:8A87: E9 A0
	STA ptr_06                      ;C - - - - - 0x018A99 0C:8A89: 85 06
	INC ptr_06+1                    ;C - - - - - 0x018A9B 0C:8A8B: E6 07
loc_0C_8A8D:
	LDA ptr_06+1                    ;C - - - - - 0x018A9D 0C:8A8D: A5 07
	CMP ram_0009                    ;C - - - - - 0x018A9F 0C:8A8F: C5 09
	BCC loc_0C_8AC2                 ;C - - - - - 0x018AA1 0C:8A91: 90 2F
	LDA ptr_06+1                    ;C - - - - - 0x018AA3 0C:8A93: A5 07
	CMP ram_0009                    ;C - - - - - 0x018AA5 0C:8A95: C5 09
	BNE loc_0C_8AA2                 ;C - - - - - 0x018AA7 0C:8A97: D0 09
	LDA ptr_06                      ;C - - - - - 0x018AA9 0C:8A99: A5 06
	CLC                             ;C - - - - - 0x018AAB 0C:8A9B: 18
	ADC ptr_04+1                    ;C - - - - - 0x018AAC 0C:8A9C: 65 05
	CMP ram_0008                    ;C - - - - - 0x018AAE 0C:8A9E: C5 08
	BCC loc_0C_8AC2                 ;C - - - - - 0x018AB0 0C:8AA0: 90 20
loc_0C_8AA2:
	INC playerLevel                 ;C - - - - - 0x018AB2 0C:8AA2: E6 6B
	LDY playerId                    ;C - - - - - 0x018AB4 0C:8AA4: A4 34
	LDA EnemyAI_NopTbl_8BAA,Y       ;C - - - - - 0x018AB6 0C:8AA6: B9 AA 8B
	STA ptr_0C                      ;C - - - - - 0x018AB9 0C:8AA9: 85 0C
	LDA EnemyAI_NopTbl_8BAD,Y       ;C - - - - - 0x018ABB 0C:8AAB: B9 AD 8B
	STA ptr_0C+1                    ;C - - - - - 0x018ABE 0C:8AAE: 85 0D
	LDY playerLevel                 ;C - - - - - 0x018AC0 0C:8AB0: A4 6B
	LDA (ptr_0C),Y                  ;C - - - - - 0x018AC2 0C:8AB2: B1 0C
	STA playerHealth                ;C - - - - - 0x018AC4 0C:8AB4: 85 3A
	LDA #$14                        ;C - - - - - 0x018AC6 0C:8AB6: A9 14
	JSR QueueSound                  ;C - - - - - 0x018AC8 0C:8AB8: 20 4C F3
	LDA #$00                        ;C - - - - - 0x018ACB 0C:8ABB: A9 00
	STA playerExp                   ;C - - - - - 0x018ACD 0C:8ABD: 85 6C
	STA playerExp+1                 ;C - - - - - 0x018ACF 0C:8ABF: 85 6D
	RTS                             ;C - - - - - 0x018AD1 0C:8AC1: 60
loc_0C_8AC2:
	LDA ptr_04+1                    ;C - - - - - 0x018AD2 0C:8AC2: A5 05
	CLC                             ;C - - - - - 0x018AD4 0C:8AC4: 18
	ADC ptr_06                      ;C - - - - - 0x018AD5 0C:8AC5: 65 06
	STA playerExp                   ;C - - - - - 0x018AD7 0C:8AC7: 85 6C
	LDA ptr_06+1                    ;C - - - - - 0x018AD9 0C:8AC9: A5 07
	STA playerExp+1                 ;C - - - - - 0x018ADB 0C:8ACB: 85 6D
	RTS                             ;C - - - - - 0x018ADD 0C:8ACD: 60
PlayerSpecialDispatchTbl_8ACE:
	.lobytes ofs_0C_89F2, ofs_0C_8A08, ofs_0C_8A1E;- D 0 - - - 0x018ADE 0C:8ACE:
PlayerSpecialDispatchTbl_8AD1:
	.hibytes ofs_0C_89F2, ofs_0C_8A08, ofs_0C_8A1E;- D 0 - - - 0x018AE1 0C:8AD1:
EnemyAI_NopTbl_8AD4:
	.byte $33,$54,$90,$47,$50       ;- D 0 - - - 0x018AE4 0C:8AD4:
EnemyAI_NopTbl_8AD9:
	.byte $00,$00,$00,$01,$02       ;- D 0 - - - 0x018AE9 0C:8AD9:
EnemyAI_NopTbl_8ADE:
	.byte $27,$45,$74,$22,$10       ;- D 0 - - - 0x018AEE 0C:8ADE:
EnemyAI_NopTbl_8AE3:
	.byte $00,$00,$00,$01,$02       ;- D 0 - - - 0x018AF3 0C:8AE3:
EnemyAI_NopTbl_8AE8:
	.byte $25,$93,$70               ;- D 0 - - - 0x018AF8 0C:8AE8:
EnemyAI_NopTbl_8AEB:
	.byte $01,$01,$03               ;- D 0 - - - 0x018AFB 0C:8AEB:
; kinds 10-13: pick-up checks against gameAction
EnemyAI_Item10_13:
	LDA gameAction                  ;C - - J - - 0x018AFE 0C:8AEE: A5 30
	CMP #$01                        ;C - - - - - 0x018B00 0C:8AF0: C9 01
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B02 0C:8AF2: F0 67
	CMP #$02                        ;C - - - - - 0x018B04 0C:8AF4: C9 02
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B06 0C:8AF6: F0 63
	CMP #$06                        ;C - - - - - 0x018B08 0C:8AF8: C9 06
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B0A 0C:8AFA: F0 5F
	CMP #$25                        ;C - - - - - 0x018B0C 0C:8AFC: C9 25
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B0E 0C:8AFE: F0 5B
	CMP #$04                        ;C - - - - - 0x018B10 0C:8B00: C9 04
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B12 0C:8B02: F0 57
	CMP #$13                        ;C - - - - - 0x018B14 0C:8B04: C9 13
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B16 0C:8B06: F0 53
	CMP #$15                        ;C - - - - - 0x018B18 0C:8B08: C9 15
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B1A 0C:8B0A: F0 4F
	CMP #$10                        ;C - - - - - 0x018B1C 0C:8B0C: C9 10
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B1E 0C:8B0E: F0 4B
	CMP #$12                        ;C - - - - - 0x018B20 0C:8B10: C9 12
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B22 0C:8B12: F0 47
	CMP #$17                        ;C - - - - - 0x018B24 0C:8B14: C9 17
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B26 0C:8B16: F0 43
	LDA playerId                    ;C - - - - - 0x018B28 0C:8B18: A5 34
	BNE loc_0C_8B22                 ;C - - - - - 0x018B2A 0C:8B1A: D0 06
	LDA gameAction                  ;C - - - - - 0x018B2C 0C:8B1C: A5 30
	CMP #$0B                        ;C - - - - - 0x018B2E 0C:8B1E: C9 0B
	BEQ loc_0C_8B5B                 ;C - - - - - 0x018B30 0C:8B20: F0 39
loc_0C_8B22:
	JSR CheckHitEligible            ;C - - - - - 0x018B32 0C:8B22: 20 5A F5
	BCS loc_0C_8B5B                 ;C - - - - - 0x018B35 0C:8B25: B0 34
	JSR DistanceYToPlayer           ;C - - - - - 0x018B37 0C:8B27: 20 65 F3
	BCS loc_0C_8B5B                 ;C - - - - - 0x018B3A 0C:8B2A: B0 2F
	CMP #$12                        ;C - - - - - 0x018B3C 0C:8B2C: C9 12
	BCS loc_0C_8B5B                 ;C - - - - - 0x018B3E 0C:8B2E: B0 2B
	CMP #$07                        ;C - - - - - 0x018B40 0C:8B30: C9 07
	BCC loc_0C_8B5B                 ;C - - - - - 0x018B42 0C:8B32: 90 27
	LDA padPressed                  ;C - - - - - 0x018B44 0C:8B34: A5 14
	CMP #$40                        ;C - - - - - 0x018B46 0C:8B36: C9 40
	BNE loc_0C_8B5B                 ;C - - - - - 0x018B48 0C:8B38: D0 21
	LDY playerId                    ;C - - - - - 0x018B4A 0C:8B3A: A4 34
	LDA tbl_0F_E210,Y               ;C - - - - - 0x018B4C 0C:8B3C: B9 10 E2
	JSR SetPlayerAnim               ;C - - - - - 0x018B4F 0C:8B3F: 20 94 F2
	LDA tbl_0F_E258,Y               ;C - - - - - 0x018B52 0C:8B42: B9 58 E2
	JSR SetChrBank2                 ;C - - - - - 0x018B55 0C:8B45: 20 40 F4
	LDA objKind,X                   ;C - - - - - 0x018B58 0C:8B48: BD 20 03
	AND #$0F                        ;C - - - - - 0x018B5B 0C:8B4B: 29 0F
	TAY                             ;C - - - - - 0x018B5D 0C:8B4D: A8
	LDA EnemyAI_Item10_13Tbl_8B5C,Y ;C - - - - - 0x018B5E 0C:8B4E: B9 5C 8B
	STA ptr_00                      ;C - - - - - 0x018B61 0C:8B51: 85 00
	LDA EnemyAI_Item10_13Tbl_8B60,Y ;C - - - - - 0x018B63 0C:8B53: B9 60 8B
	STA ptr_00+1                    ;C - - - - - 0x018B66 0C:8B56: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x018B68 0C:8B58: 6C 00 00
loc_0C_8B5B:
	RTS                             ;C - - - - - 0x018B6B 0C:8B5B: 60
EnemyAI_Item10_13Tbl_8B5C:
	.lobytes ofs_0C_8B64, ofs_0C_8BC2, ofs_0C_8BD6, ofs_0C_8BED;- D 0 - - - 0x018B6C 0C:8B5C:
EnemyAI_Item10_13Tbl_8B60:
	.hibytes ofs_0C_8B64, ofs_0C_8BC2, ofs_0C_8BD6, ofs_0C_8BED;- D 0 - - - 0x018B70 0C:8B60:
ofs_0C_8B64:
	LDA #$26                        ;C - - J - - 0x018B74 0C:8B64: A9 26
	JSR QueueSound                  ;C - - - - - 0x018B76 0C:8B66: 20 4C F3
	LDY playerId                    ;C - - - - - 0x018B79 0C:8B69: A4 34
	LDA EnemyAI_NopTbl_8BAA,Y       ;C - - - - - 0x018B7B 0C:8B6B: B9 AA 8B
	STA ptr_02                      ;C - - - - - 0x018B7E 0C:8B6E: 85 02
	LDA EnemyAI_NopTbl_8BAD,Y       ;C - - - - - 0x018B80 0C:8B70: B9 AD 8B
	STA ptr_02+1                    ;C - - - - - 0x018B83 0C:8B73: 85 03
	LDY playerLevel                 ;C - - - - - 0x018B85 0C:8B75: A4 6B
	LDA playerHealth                ;C - - - - - 0x018B87 0C:8B77: A5 3A
	CMP (ptr_02),Y                  ;C - - - - - 0x018B89 0C:8B79: D1 02
	BEQ loc_0C_8B97                 ;C - - - - - 0x018B8B 0C:8B7B: F0 1A
	LDA objAnim,X                   ;C - - - - - 0x018B8D 0C:8B7D: BD 80 05
	AND #$0F                        ;C - - - - - 0x018B90 0C:8B80: 29 0F
	TAY                             ;C - - - - - 0x018B92 0C:8B82: A8
	LDA playerHealth                ;C - - - - - 0x018B93 0C:8B83: A5 3A
	CLC                             ;C - - - - - 0x018B95 0C:8B85: 18
	ADC RefillPlayerHealthTbl_FCC0,Y;C - - - - - 0x018B96 0C:8B86: 79 C0 FC
	STA playerHealth                ;C - - - - - 0x018B99 0C:8B89: 85 3A
	LDY playerLevel                 ;C - - - - - 0x018B9B 0C:8B8B: A4 6B
	LDA (ptr_02),Y                  ;C - - - - - 0x018B9D 0C:8B8D: B1 02
	CMP playerHealth                ;C - - - - - 0x018B9F 0C:8B8F: C5 3A
	BCS loc_0C_8BA6                 ;C - - - - - 0x018BA1 0C:8B91: B0 13
	STA playerHealth                ;C - - - - - 0x018BA3 0C:8B93: 85 3A
	BNE loc_0C_8BA6                 ;C - - - - - 0x018BA5 0C:8B95: D0 0F
loc_0C_8B97:
	LDA objAnim,X                   ;C - - - - - 0x018BA7 0C:8B97: BD 80 05
	SEC                             ;C - - - - - 0x018BAA 0C:8B9A: 38
	SBC #$60                        ;C - - - - - 0x018BAB 0C:8B9B: E9 60
	TAY                             ;C - - - - - 0x018BAD 0C:8B9D: A8
	LDA EnemyAI_Item10_13Tbl_FCD1,Y ;C - - - - - 0x018BAE 0C:8B9E: B9 D1 FC
	STA attackType                  ;C - - - - - 0x018BB1 0C:8BA1: 85 A7
	JSR PlayerSpecialDispatch       ;C - - - - - 0x018BB3 0C:8BA3: 20 E3 89
loc_0C_8BA6:
	JSR EndAttackAction             ;C - - - - - 0x018BB6 0C:8BA6: 20 00 8C
	RTS                             ;C - - - - - 0x018BB9 0C:8BA9: 60
EnemyAI_NopTbl_8BAA:
	.lobytes ofs_0C_8BB0, tbl_0C_8BB6, tbl_0C_8BBC;- D 0 - - - 0x018BBA 0C:8BAA:
EnemyAI_NopTbl_8BAD:
	.hibytes ofs_0C_8BB0, tbl_0C_8BB6, tbl_0C_8BBC;- D 0 - - - 0x018BBD 0C:8BAD:
ofs_0C_8BB0:
	RTI                             ;c - - - - - 0x018BC0 0C:8BB0: 40
	.byte $48,$50,$58,$60           ;- D 0 - I - 0x018BC1 0C:8BB1:
	.byte $68                       ;- - - - - - 0x018BC5 0C:8BB5:
tbl_0C_8BB6:
	.byte $30                       ;- - - - - - 0x018BC6 0C:8BB6:
	.byte $38,$40,$48,$50,$58       ;- D 0 - I - 0x018BC7 0C:8BB7:
tbl_0C_8BBC:
	.byte $50                       ;- - - - - - 0x018BCC 0C:8BBC:
	.byte $58,$60,$68               ;- D 0 - I - 0x018BCD 0C:8BBD:
	.byte $68,$68                   ;- - - - - - 0x018BD0 0C:8BC0:
ofs_0C_8BC2:
	LDA #$2E                        ;c - - - - - 0x018BD2 0C:8BC2: A9 2E
	JSR QueueSound                  ;c - - - - - 0x018BD4 0C:8BC4: 20 4C F3
	LDA credits                     ;c - - - - - 0x018BD7 0C:8BC7: A5 AF
	CMP #$09                        ;c - - - - - 0x018BD9 0C:8BC9: C9 09
	BEQ loc_0C_8BD2                 ;c - - - - - 0x018BDB 0C:8BCB: F0 05
	CLC                             ;c - - - - - 0x018BDD 0C:8BCD: 18
	ADC #$01                        ;c - - - - - 0x018BDE 0C:8BCE: 69 01
	STA credits                     ;c - - - - - 0x018BE0 0C:8BD0: 85 AF
loc_0C_8BD2:
	JSR EndAttackAction             ;c - - - - - 0x018BE2 0C:8BD2: 20 00 8C
	RTS                             ;c - - - - - 0x018BE5 0C:8BD5: 60
ofs_0C_8BD6:
	LDA #$2D                        ;C - - J - - 0x018BE6 0C:8BD6: A9 2D
	JSR QueueSound                  ;C - - - - - 0x018BE8 0C:8BD8: 20 4C F3
	INC lives                       ;C - - - - - 0x018BEB 0C:8BDB: E6 3E
	INC lives                       ;C - - - - - 0x018BED 0C:8BDD: E6 3E
	LDA lives                       ;C - - - - - 0x018BEF 0C:8BDF: A5 3E
	CMP #$09                        ;C - - - - - 0x018BF1 0C:8BE1: C9 09
	BCC loc_0C_8BE9                 ;C - - - - - 0x018BF3 0C:8BE3: 90 04
	LDA #$09                        ;c - - - - - 0x018BF5 0C:8BE5: A9 09
	STA lives                       ;c - - - - - 0x018BF7 0C:8BE7: 85 3E
loc_0C_8BE9:
	JSR EndAttackAction             ;C - - - - - 0x018BF9 0C:8BE9: 20 00 8C
	RTS                             ;C - - - - - 0x018BFC 0C:8BEC: 60
ofs_0C_8BED:
	LDA #$2D                        ;C - - J - - 0x018BFD 0C:8BED: A9 2D
	JSR QueueSound                  ;C - - - - - 0x018BFF 0C:8BEF: 20 4C F3
	LDA lives                       ;C - - - - - 0x018C02 0C:8BF2: A5 3E
	CMP #$09                        ;C - - - - - 0x018C04 0C:8BF4: C9 09
	BCC loc_0C_8BFE                 ;C - - - - - 0x018C06 0C:8BF6: 90 06
	LDA #$09                        ;c - - - - - 0x018C08 0C:8BF8: A9 09
	STA lives                       ;c - - - - - 0x018C0A 0C:8BFA: 85 3E
	BNE EndAttackAction             ;c - - - - - 0x018C0C 0C:8BFC: D0 02
loc_0C_8BFE:
	INC lives                       ;C - - - - - 0x018C0E 0C:8BFE: E6 3E
EndAttackAction:
	LDA ram_00B2                    ;C - - - - - 0x018C10 0C:8C00: A5 B2
	BMI loc_0C_8C10                 ;C - - - - - 0x018C12 0C:8C02: 30 0C
	LDA #$02                        ;C - - - - - 0x018C14 0C:8C04: A9 02
	STA gameAction                  ;C - - - - - 0x018C16 0C:8C06: 85 30
loc_0C_8C08:
	LDA #$0C                        ;C - - - - - 0x018C18 0C:8C08: A9 0C
	STA actionTimer                 ;C - - - - - 0x018C1A 0C:8C0A: 85 37
	JSR ClearObject                 ;C - - - - - 0x018C1C 0C:8C0C: 20 BE F2
	RTS                             ;C - - - - - 0x018C1F 0C:8C0F: 60
loc_0C_8C10:
	LDA #$29                        ;C - - - - - 0x018C20 0C:8C10: A9 29
	STA gameAction                  ;C - - - - - 0x018C22 0C:8C12: 85 30
	LDA #$80                        ;C - - - - - 0x018C24 0C:8C14: A9 80
	STA objActive                   ;C - - - - - 0x018C26 0C:8C16: 8D 00 03
	JMP loc_0C_8C08                 ;C - - - - - 0x018C29 0C:8C19: 4C 08 8C
; kind 04: 8-state machine (jump table by objActive & $0F)
EnemyAI_Kind04:
	LDA objActive,X                 ;C - - J - - 0x018C2C 0C:8C1C: BD 00 03
	AND #$0F                        ;C - - - - - 0x018C2F 0C:8C1F: 29 0F
	TAY                             ;C - - - - - 0x018C31 0C:8C21: A8
	LDA EnemyAI_Kind04Tbl_8C2F,Y    ;C - - - - - 0x018C32 0C:8C22: B9 2F 8C
	STA ptr_00                      ;C - - - - - 0x018C35 0C:8C25: 85 00
	LDA EnemyAI_Kind04Tbl_8C37,Y    ;C - - - - - 0x018C37 0C:8C27: B9 37 8C
	STA ptr_00+1                    ;C - - - - - 0x018C3A 0C:8C2A: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x018C3C 0C:8C2C: 6C 00 00
EnemyAI_Kind04Tbl_8C2F:
	.lobytes ofs_0C_8C3F, ofs_0C_8C98, ofs_0C_8D00, ofs_0C_8D88, ofs_0C_8E43, ofs_0C_8E5A, ofs_0C_8EE5, ofs_0C_8F8D;- D 0 - - - 0x018C3F 0C:8C2F:
EnemyAI_Kind04Tbl_8C37:
	.hibytes ofs_0C_8C3F, ofs_0C_8C98, ofs_0C_8D00, ofs_0C_8D88, ofs_0C_8E43, ofs_0C_8E5A, ofs_0C_8EE5, ofs_0C_8F8D;- D 0 - - - 0x018C47 0C:8C37:
ofs_0C_8C3F:
	LDA #$10                        ;C - - J - - 0x018C4F 0C:8C3F: A9 10
	STA objParamA,X                 ;C - - - - - 0x018C51 0C:8C41: 9D 10 05
	LDA #$08                        ;C - - - - - 0x018C54 0C:8C44: A9 08
	STA objCooldown,X               ;C - - - - - 0x018C56 0C:8C46: 9D 40 05
	LDA objSpriteDown,X             ;C - - - - - 0x018C59 0C:8C49: BD B0 05
	TAY                             ;C - - - - - 0x018C5C 0C:8C4C: A8
	LDA tbl_0F_FC5B,Y               ;C - - - - - 0x018C5D 0C:8C4D: B9 5B FC
	CMP ptr_00                      ;C - - - - - 0x018C60 0C:8C50: C5 00
	BEQ loc_0C_8C65                 ;C - - - - - 0x018C62 0C:8C52: F0 11
	JSR SetAnimX                    ;C - - - - - 0x018C64 0C:8C54: 20 88 F2
	LDA tbl_0F_FC75,Y               ;C - - - - - 0x018C67 0C:8C57: B9 75 FC
	STA ptr_00                      ;C - - - - - 0x018C6A 0C:8C5A: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x018C6C 0C:8C5C: B9 33 FC
	TAY                             ;C - - - - - 0x018C6F 0C:8C5F: A8
	LDA ptr_00                      ;C - - - - - 0x018C70 0C:8C60: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x018C72 0C:8C62: 99 EB 00
loc_0C_8C65:
	LDA objY                        ;C - - - - - 0x018C75 0C:8C65: AD C0 03
	STA objParamC,X                 ;C - - - - - 0x018C78 0C:8C68: 9D 30 05
	INC objActive,X                 ;C - - - - - 0x018C7B 0C:8C6B: FE 00 03
	LDA objY,X                      ;C - - - - - 0x018C7E 0C:8C6E: BD C0 03
	SEC                             ;C - - - - - 0x018C81 0C:8C71: 38
	SBC #$0F                        ;C - - - - - 0x018C82 0C:8C72: E9 0F
	STA objY,X                      ;C - - - - - 0x018C84 0C:8C74: 9D C0 03
	LDA objMoveMode,X               ;C - - - - - 0x018C87 0C:8C77: BD 70 04
	BEQ loc_0C_8C97                 ;C - - - - - 0x018C8A 0C:8C7A: F0 1B
	LDA objFacing,X                 ;C - - - - - 0x018C8C 0C:8C7C: BD 60 04
	AND #$02                        ;C - - - - - 0x018C8F 0C:8C7F: 29 02
	TAY                             ;C - - - - - 0x018C91 0C:8C81: A8
	LDA objX,X                      ;C - - - - - 0x018C92 0C:8C82: BD 60 03
	CLC                             ;C - - - - - 0x018C95 0C:8C85: 18
	ADC EnemyAI_Kind04Tbl_FCE2,Y    ;C - - - - - 0x018C96 0C:8C86: 79 E2 FC
	PHA                             ;C - - - - - 0x018C99 0C:8C89: 48
	LDA objXPage,X                  ;C - - - - - 0x018C9A 0C:8C8A: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCE3,Y    ;C - - - - - 0x018C9D 0C:8C8D: 79 E3 FC
	STA objXPage,X                  ;C - - - - - 0x018CA0 0C:8C90: 9D 80 03
	PLA                             ;C - - - - - 0x018CA3 0C:8C93: 68
	STA objX,X                      ;C - - - - - 0x018CA4 0C:8C94: 9D 60 03
loc_0C_8C97:
	RTS                             ;C - - - - - 0x018CA7 0C:8C97: 60
ofs_0C_8C98:
	LDA objMoveMode,X               ;C - - J - - 0x018CA8 0C:8C98: BD 70 04
	BNE loc_0C_8CC4                 ;C - - - - - 0x018CAB 0C:8C9B: D0 27
	LDA objFacing,X                 ;C - - - - - 0x018CAD 0C:8C9D: BD 60 04
	AND #$02                        ;C - - - - - 0x018CB0 0C:8CA0: 29 02
	TAY                             ;C - - - - - 0x018CB2 0C:8CA2: A8
	LDA objX,X                      ;C - - - - - 0x018CB3 0C:8CA3: BD 60 03
	CLC                             ;C - - - - - 0x018CB6 0C:8CA6: 18
	ADC EnemyAI_Kind04Tbl_FCD6,Y    ;C - - - - - 0x018CB7 0C:8CA7: 79 D6 FC
	PHA                             ;C - - - - - 0x018CBA 0C:8CAA: 48
	LDA objXPage,X                  ;C - - - - - 0x018CBB 0C:8CAB: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCD7,Y    ;C - - - - - 0x018CBE 0C:8CAE: 79 D7 FC
	STA objXPage,X                  ;C - - - - - 0x018CC1 0C:8CB1: 9D 80 03
	PLA                             ;C - - - - - 0x018CC4 0C:8CB4: 68
	STA objX,X                      ;C - - - - - 0x018CC5 0C:8CB5: 9D 60 03
	INC objActive,X                 ;C - - - - - 0x018CC8 0C:8CB8: FE 00 03
	LDA objY,X                      ;C - - - - - 0x018CCB 0C:8CBB: BD C0 03
	SEC                             ;C - - - - - 0x018CCE 0C:8CBE: 38
	SBC #$08                        ;C - - - - - 0x018CCF 0C:8CBF: E9 08
	STA objY,X                      ;C - - - - - 0x018CD1 0C:8CC1: 9D C0 03
loc_0C_8CC4:
	LDA gameAction                  ;C - - - - - 0x018CD4 0C:8CC4: A5 30
	CMP #$06                        ;C - - - - - 0x018CD6 0C:8CC6: C9 06
	BEQ loc_0C_8CD9                 ;C - - - - - 0x018CD8 0C:8CC8: F0 0F
	CMP #$1F                        ;C - - - - - 0x018CDA 0C:8CCA: C9 1F
	BEQ loc_0C_8CD9                 ;C - - - - - 0x018CDC 0C:8CCC: F0 0B
	CMP #$0A                        ;C - - - - - 0x018CDE 0C:8CCE: C9 0A
	BEQ loc_0C_8CD9                 ;C - - - - - 0x018CE0 0C:8CD0: F0 07
	LDA objAnimFlags                ;C - - - - - 0x018CE2 0C:8CD2: AD 90 05
	CMP #$04                        ;C - - - - - 0x018CE5 0C:8CD5: C9 04
	BNE loc_0C_8D4B                 ;C - - - - - 0x018CE7 0C:8CD7: D0 72
loc_0C_8CD9:
	LDA objFacing,X                 ;C - - - - - 0x018CE9 0C:8CD9: BD 60 04
	AND #$02                        ;C - - - - - 0x018CEC 0C:8CDC: 29 02
	TAY                             ;C - - - - - 0x018CEE 0C:8CDE: A8
	LDA objX,X                      ;C - - - - - 0x018CEF 0C:8CDF: BD 60 03
	CLC                             ;C - - - - - 0x018CF2 0C:8CE2: 18
	ADC EnemyAI_Kind04Tbl_FCE6,Y    ;C - - - - - 0x018CF3 0C:8CE3: 79 E6 FC
	PHA                             ;C - - - - - 0x018CF6 0C:8CE6: 48
	LDA objXPage,X                  ;C - - - - - 0x018CF7 0C:8CE7: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCE7,Y    ;C - - - - - 0x018CFA 0C:8CEA: 79 E7 FC
	STA objXPage,X                  ;C - - - - - 0x018CFD 0C:8CED: 9D 80 03
	PLA                             ;C - - - - - 0x018D00 0C:8CF0: 68
	STA objX,X                      ;C - - - - - 0x018D01 0C:8CF1: 9D 60 03
	INC objActive,X                 ;C - - - - - 0x018D04 0C:8CF4: FE 00 03
	LDA objY,X                      ;C - - - - - 0x018D07 0C:8CF7: BD C0 03
	SEC                             ;C - - - - - 0x018D0A 0C:8CFA: 38
	SBC #$08                        ;C - - - - - 0x018D0B 0C:8CFB: E9 08
	STA objY,X                      ;C - - - - - 0x018D0D 0C:8CFD: 9D C0 03
ofs_0C_8D00:
	LDA gameAction                  ;C - - - - - 0x018D10 0C:8D00: A5 30
	CMP #$06                        ;C - - - - - 0x018D12 0C:8D02: C9 06
	BEQ loc_0C_8D15                 ;C - - - - - 0x018D14 0C:8D04: F0 0F
	CMP #$1F                        ;C - - - - - 0x018D16 0C:8D06: C9 1F
	BEQ loc_0C_8D15                 ;C - - - - - 0x018D18 0C:8D08: F0 0B
	CMP #$0A                        ;C - - - - - 0x018D1A 0C:8D0A: C9 0A
	BEQ loc_0C_8D15                 ;C - - - - - 0x018D1C 0C:8D0C: F0 07
	LDA objAnimFrame                ;C - - - - - 0x018D1E 0C:8D0E: AD 70 05
	CMP #$01                        ;C - - - - - 0x018D21 0C:8D11: C9 01
	BNE loc_0C_8D4B                 ;C - - - - - 0x018D23 0C:8D13: D0 36
loc_0C_8D15:
	LDA objSpriteDown,X             ;C - - - - - 0x018D25 0C:8D15: BD B0 05
	TAY                             ;C - - - - - 0x018D28 0C:8D18: A8
	LDA tbl_0F_FC68,Y               ;C - - - - - 0x018D29 0C:8D19: B9 68 FC
	JSR SetAnimX                    ;C - - - - - 0x018D2C 0C:8D1C: 20 88 F2
	LDA objMoveMode,X               ;C - - - - - 0x018D2F 0C:8D1F: BD 70 04
	BNE loc_0C_8D4C                 ;C - - - - - 0x018D32 0C:8D22: D0 28
	LDA objFacing,X                 ;C - - - - - 0x018D34 0C:8D24: BD 60 04
	AND #$02                        ;C - - - - - 0x018D37 0C:8D27: 29 02
	TAY                             ;C - - - - - 0x018D39 0C:8D29: A8
	LDA objX,X                      ;C - - - - - 0x018D3A 0C:8D2A: BD 60 03
	CLC                             ;C - - - - - 0x018D3D 0C:8D2D: 18
	ADC EnemyAI_Kind04Tbl_FCDA,Y    ;C - - - - - 0x018D3E 0C:8D2E: 79 DA FC
	PHA                             ;C - - - - - 0x018D41 0C:8D31: 48
	LDA objXPage,X                  ;C - - - - - 0x018D42 0C:8D32: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCDB,Y    ;C - - - - - 0x018D45 0C:8D35: 79 DB FC
	STA objXPage,X                  ;C - - - - - 0x018D48 0C:8D38: 9D 80 03
	PLA                             ;C - - - - - 0x018D4B 0C:8D3B: 68
	STA objX,X                      ;C - - - - - 0x018D4C 0C:8D3C: 9D 60 03
	INC objActive,X                 ;C - - - - - 0x018D4F 0C:8D3F: FE 00 03
	LDA objY,X                      ;C - - - - - 0x018D52 0C:8D42: BD C0 03
	SEC                             ;C - - - - - 0x018D55 0C:8D45: 38
	SBC #$06                        ;C - - - - - 0x018D56 0C:8D46: E9 06
	STA objY,X                      ;C - - - - - 0x018D58 0C:8D48: 9D C0 03
loc_0C_8D4B:
	RTS                             ;C - - - - - 0x018D5B 0C:8D4B: 60
loc_0C_8D4C:
	LDA gameAction                  ;C - - - - - 0x018D5C 0C:8D4C: A5 30
	CMP #$06                        ;C - - - - - 0x018D5E 0C:8D4E: C9 06
	BEQ loc_0C_8D61                 ;C - - - - - 0x018D60 0C:8D50: F0 0F
	CMP #$1F                        ;C - - - - - 0x018D62 0C:8D52: C9 1F
	BEQ loc_0C_8D61                 ;C - - - - - 0x018D64 0C:8D54: F0 0B
	CMP #$0A                        ;C - - - - - 0x018D66 0C:8D56: C9 0A
	BEQ loc_0C_8D61                 ;C - - - - - 0x018D68 0C:8D58: F0 07
	LDA objAnimFlags                ;C - - - - - 0x018D6A 0C:8D5A: AD 90 05
	CMP #$04                        ;C - - - - - 0x018D6D 0C:8D5D: C9 04
	BNE loc_0C_8D4B                 ;C - - - - - 0x018D6F 0C:8D5F: D0 EA
loc_0C_8D61:
	LDA objFacing,X                 ;C - - - - - 0x018D71 0C:8D61: BD 60 04
	AND #$02                        ;C - - - - - 0x018D74 0C:8D64: 29 02
	TAY                             ;C - - - - - 0x018D76 0C:8D66: A8
	LDA objX,X                      ;C - - - - - 0x018D77 0C:8D67: BD 60 03
	CLC                             ;C - - - - - 0x018D7A 0C:8D6A: 18
	ADC EnemyAI_Kind04Tbl_FCEA,Y    ;C - - - - - 0x018D7B 0C:8D6B: 79 EA FC
	PHA                             ;C - - - - - 0x018D7E 0C:8D6E: 48
	LDA objXPage,X                  ;C - - - - - 0x018D7F 0C:8D6F: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCEB,Y    ;C - - - - - 0x018D82 0C:8D72: 79 EB FC
	STA objXPage,X                  ;C - - - - - 0x018D85 0C:8D75: 9D 80 03
	PLA                             ;C - - - - - 0x018D88 0C:8D78: 68
	STA objX,X                      ;C - - - - - 0x018D89 0C:8D79: 9D 60 03
	INC objActive,X                 ;C - - - - - 0x018D8C 0C:8D7C: FE 00 03
	LDA objY,X                      ;C - - - - - 0x018D8F 0C:8D7F: BD C0 03
	SEC                             ;C - - - - - 0x018D92 0C:8D82: 38
	SBC #$06                        ;C - - - - - 0x018D93 0C:8D83: E9 06
	STA objY,X                      ;C - - - - - 0x018D95 0C:8D85: 9D C0 03
ofs_0C_8D88:
	LDA gameAction                  ;C - - - - - 0x018D98 0C:8D88: A5 30
	CMP #$06                        ;C - - - - - 0x018D9A 0C:8D8A: C9 06
	BEQ loc_0C_8D9D                 ;C - - - - - 0x018D9C 0C:8D8C: F0 0F
	CMP #$1F                        ;C - - - - - 0x018D9E 0C:8D8E: C9 1F
	BEQ loc_0C_8D9D                 ;C - - - - - 0x018DA0 0C:8D90: F0 0B
	CMP #$0A                        ;C - - - - - 0x018DA2 0C:8D92: C9 0A
	BEQ loc_0C_8D9D                 ;C - - - - - 0x018DA4 0C:8D94: F0 07
	LDA objAnimFrame                ;C - - - - - 0x018DA6 0C:8D96: AD 70 05
	CMP #$02                        ;C - - - - - 0x018DA9 0C:8D99: C9 02
	BNE loc_0C_8D4B                 ;C - - - - - 0x018DAB 0C:8D9B: D0 AE
loc_0C_8D9D:
	LDA objFacing,X                 ;C - - - - - 0x018DAD 0C:8D9D: BD 60 04
	AND #$01                        ;C - - - - - 0x018DB0 0C:8DA0: 29 01
	BEQ loc_0C_8DD1                 ;C - - - - - 0x018DB2 0C:8DA2: F0 2D
	LDA stage                       ;C - - - - - 0x018DB4 0C:8DA4: A5 61
	BNE loc_0C_8DAE                 ;C - - - - - 0x018DB6 0C:8DA6: D0 06
	LDA scrollXPage                 ;C - - - - - 0x018DB8 0C:8DA8: A5 F9
	CMP #$03                        ;C - - - - - 0x018DBA 0C:8DAA: C9 03
	BEQ loc_0C_8DB2                 ;C - - - - - 0x018DBC 0C:8DAC: F0 04
loc_0C_8DAE:
	LDA ram_00BC                    ;C - - - - - 0x018DBE 0C:8DAE: A5 BC
	BEQ loc_0C_8DCE                 ;C - - - - - 0x018DC0 0C:8DB0: F0 1C
loc_0C_8DB2:
	LDA objX,X                      ;C - - - - - 0x018DC2 0C:8DB2: BD 60 03
	SEC                             ;C - - - - - 0x018DC5 0C:8DB5: 38
	SBC scrollX                     ;C - - - - - 0x018DC6 0C:8DB6: E5 FC
	CMP #$10                        ;C - - - - - 0x018DC8 0C:8DB8: C9 10
	BCS loc_0C_8DCE                 ;C - - - - - 0x018DCA 0C:8DBA: B0 12
	LDA scrollX                     ;c - - - - - 0x018DCC 0C:8DBC: A5 FC
	CLC                             ;c - - - - - 0x018DCE 0C:8DBE: 18
	ADC #$10                        ;c - - - - - 0x018DCF 0C:8DBF: 69 10
	STA objX,X                      ;c - - - - - 0x018DD1 0C:8DC1: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x018DD4 0C:8DC4: A5 2D
	ADC #$00                        ;c - - - - - 0x018DD6 0C:8DC6: 69 00
	STA objXPage,X                  ;c - - - - - 0x018DD8 0C:8DC8: 9D 80 03
	JMP loc_0C_8DEE                 ;c - - - - - 0x018DDB 0C:8DCB: 4C EE 8D
loc_0C_8DCE:
	JMP loc_0C_8DEF                 ;C - - - - - 0x018DDE 0C:8DCE: 4C EF 8D
loc_0C_8DD1:
	LDA ram_00BC                    ;C - - - - - 0x018DE1 0C:8DD1: A5 BC
	BEQ loc_0C_8DEF                 ;C - - - - - 0x018DE3 0C:8DD3: F0 1A
	LDA objX,X                      ;C - - - - - 0x018DE5 0C:8DD5: BD 60 03
	SEC                             ;C - - - - - 0x018DE8 0C:8DD8: 38
	SBC scrollX                     ;C - - - - - 0x018DE9 0C:8DD9: E5 FC
	CMP #$F1                        ;C - - - - - 0x018DEB 0C:8DDB: C9 F1
	BCC loc_0C_8DEF                 ;C - - - - - 0x018DED 0C:8DDD: 90 10
	LDA scrollX                     ;c - - - - - 0x018DEF 0C:8DDF: A5 FC
	CLC                             ;c - - - - - 0x018DF1 0C:8DE1: 18
	ADC #$F0                        ;c - - - - - 0x018DF2 0C:8DE2: 69 F0
	STA objX,X                      ;c - - - - - 0x018DF4 0C:8DE4: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x018DF7 0C:8DE7: A5 2D
	ADC #$00                        ;c - - - - - 0x018DF9 0C:8DE9: 69 00
	STA objXPage,X                  ;c - - - - - 0x018DFB 0C:8DEB: 9D 80 03
loc_0C_8DEE:
	RTS                             ;c - - - - - 0x018DFE 0C:8DEE: 60
loc_0C_8DEF:
	LDA objMoveMode,X               ;C - - - - - 0x018DFF 0C:8DEF: BD 70 04
	BNE loc_0C_8E1C                 ;C - - - - - 0x018E02 0C:8DF2: D0 28
	LDA objFacing,X                 ;C - - - - - 0x018E04 0C:8DF4: BD 60 04
	AND #$02                        ;C - - - - - 0x018E07 0C:8DF7: 29 02
	TAY                             ;C - - - - - 0x018E09 0C:8DF9: A8
	LDA objX,X                      ;C - - - - - 0x018E0A 0C:8DFA: BD 60 03
	CLC                             ;C - - - - - 0x018E0D 0C:8DFD: 18
	ADC EnemyAI_Kind04Tbl_FCDE,Y    ;C - - - - - 0x018E0E 0C:8DFE: 79 DE FC
	PHA                             ;C - - - - - 0x018E11 0C:8E01: 48
	LDA objXPage,X                  ;C - - - - - 0x018E12 0C:8E02: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCDF,Y    ;C - - - - - 0x018E15 0C:8E05: 79 DF FC
	STA objXPage,X                  ;C - - - - - 0x018E18 0C:8E08: 9D 80 03
	PLA                             ;C - - - - - 0x018E1B 0C:8E0B: 68
	STA objX,X                      ;C - - - - - 0x018E1C 0C:8E0C: 9D 60 03
	LDA objY,X                      ;C - - - - - 0x018E1F 0C:8E0F: BD C0 03
	SEC                             ;C - - - - - 0x018E22 0C:8E12: 38
	SBC #$06                        ;C - - - - - 0x018E23 0C:8E13: E9 06
	STA objY,X                      ;C - - - - - 0x018E25 0C:8E15: 9D C0 03
	INC objActive,X                 ;C - - - - - 0x018E28 0C:8E18: FE 00 03
	RTS                             ;C - - - - - 0x018E2B 0C:8E1B: 60
loc_0C_8E1C:
	LDA objFacing,X                 ;C - - - - - 0x018E2C 0C:8E1C: BD 60 04
	AND #$02                        ;C - - - - - 0x018E2F 0C:8E1F: 29 02
	TAY                             ;C - - - - - 0x018E31 0C:8E21: A8
	LDA objX,X                      ;C - - - - - 0x018E32 0C:8E22: BD 60 03
	CLC                             ;C - - - - - 0x018E35 0C:8E25: 18
	ADC EnemyAI_Kind04Tbl_FCEE,Y    ;C - - - - - 0x018E36 0C:8E26: 79 EE FC
	PHA                             ;C - - - - - 0x018E39 0C:8E29: 48
	LDA objXPage,X                  ;C - - - - - 0x018E3A 0C:8E2A: BD 80 03
	ADC EnemyAI_Kind04Tbl_FCEF,Y    ;C - - - - - 0x018E3D 0C:8E2D: 79 EF FC
	STA objXPage,X                  ;C - - - - - 0x018E40 0C:8E30: 9D 80 03
	PLA                             ;C - - - - - 0x018E43 0C:8E33: 68
	STA objX,X                      ;C - - - - - 0x018E44 0C:8E34: 9D 60 03
	LDA objY,X                      ;C - - - - - 0x018E47 0C:8E37: BD C0 03
	SEC                             ;C - - - - - 0x018E4A 0C:8E3A: 38
	SBC #$06                        ;C - - - - - 0x018E4B 0C:8E3B: E9 06
	STA objY,X                      ;C - - - - - 0x018E4D 0C:8E3D: 9D C0 03
	INC objActive,X                 ;C - - - - - 0x018E50 0C:8E40: FE 00 03
ofs_0C_8E43:
	LDA #$00                        ;C - - - - - 0x018E53 0C:8E43: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x018E55 0C:8E45: 9D 00 04
	LDA #$02                        ;C - - - - - 0x018E58 0C:8E48: A9 02
	STA objVelXHi,X                 ;C - - - - - 0x018E5A 0C:8E4A: 9D 10 04
	LDA #$01                        ;C - - - - - 0x018E5D 0C:8E4D: A9 01
	STA objVelYLo,X                 ;C - - - - - 0x018E5F 0C:8E4F: 9D 20 04
	LDA #$01                        ;C - - - - - 0x018E62 0C:8E52: A9 01
	STA objVelYHi,X                 ;C - - - - - 0x018E64 0C:8E54: 9D 30 04
	INC objActive,X                 ;C - - - - - 0x018E67 0C:8E57: FE 00 03
ofs_0C_8E5A:
	LDA objAnimFlags,X              ;C - - - - - 0x018E6A 0C:8E5A: BD 90 05
	CMP #$0C                        ;C - - - - - 0x018E6D 0C:8E5D: C9 0C
	BNE loc_0C_8E64                 ;C - - - - - 0x018E6F 0C:8E5F: D0 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x018E71 0C:8E61: 20 55 9C
loc_0C_8E64:
	LDA objFacing,X                 ;C - - - - - 0x018E74 0C:8E64: BD 60 04
	AND #$01                        ;C - - - - - 0x018E77 0C:8E67: 29 01
	BEQ loc_0C_8E91                 ;C - - - - - 0x018E79 0C:8E69: F0 26
	LDA ram_00BC                    ;C - - - - - 0x018E7B 0C:8E6B: A5 BC
	BEQ loc_0C_8E8B                 ;C - - - - - 0x018E7D 0C:8E6D: F0 1C
	LDA objX,X                      ;C - - - - - 0x018E7F 0C:8E6F: BD 60 03
	SEC                             ;C - - - - - 0x018E82 0C:8E72: 38
	SBC scrollX                     ;C - - - - - 0x018E83 0C:8E73: E5 FC
	CMP #$10                        ;C - - - - - 0x018E85 0C:8E75: C9 10
	BCS loc_0C_8E8B                 ;C - - - - - 0x018E87 0C:8E77: B0 12
	LDA scrollX                     ;C - - - - - 0x018E89 0C:8E79: A5 FC
	CLC                             ;C - - - - - 0x018E8B 0C:8E7B: 18
	ADC #$10                        ;C - - - - - 0x018E8C 0C:8E7C: 69 10
	STA objX,X                      ;C - - - - - 0x018E8E 0C:8E7E: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x018E91 0C:8E81: A5 2D
	ADC #$00                        ;C - - - - - 0x018E93 0C:8E83: 69 00
	STA objXPage,X                  ;C - - - - - 0x018E95 0C:8E85: 9D 80 03
	JMP loc_0C_8EB4                 ;C - - - - - 0x018E98 0C:8E88: 4C B4 8E
loc_0C_8E8B:
	JSR ApplyVelXSub                ;C - - - - - 0x018E9B 0C:8E8B: 20 A1 F1
	JMP loc_0C_8EB4                 ;C - - - - - 0x018E9E 0C:8E8E: 4C B4 8E
loc_0C_8E91:
	LDA ram_00BC                    ;C - - - - - 0x018EA1 0C:8E91: A5 BC
	BEQ loc_0C_8EB1                 ;C - - - - - 0x018EA3 0C:8E93: F0 1C
	LDA objX,X                      ;C - - - - - 0x018EA5 0C:8E95: BD 60 03
	SEC                             ;C - - - - - 0x018EA8 0C:8E98: 38
	SBC scrollX                     ;C - - - - - 0x018EA9 0C:8E99: E5 FC
	CMP #$F1                        ;C - - - - - 0x018EAB 0C:8E9B: C9 F1
	BCC loc_0C_8EB1                 ;C - - - - - 0x018EAD 0C:8E9D: 90 12
	LDA scrollX                     ;C - - - - - 0x018EAF 0C:8E9F: A5 FC
	CLC                             ;C - - - - - 0x018EB1 0C:8EA1: 18
	ADC #$F0                        ;C - - - - - 0x018EB2 0C:8EA2: 69 F0
	STA objX,X                      ;C - - - - - 0x018EB4 0C:8EA4: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x018EB7 0C:8EA7: A5 2D
	ADC #$00                        ;C - - - - - 0x018EB9 0C:8EA9: 69 00
	STA objXPage,X                  ;C - - - - - 0x018EBB 0C:8EAB: 9D 80 03
	JMP loc_0C_8EB4                 ;C - - - - - 0x018EBE 0C:8EAE: 4C B4 8E
loc_0C_8EB1:
	JSR ApplyVelXAdd                ;C - - - - - 0x018EC1 0C:8EB1: 20 83 F1
loc_0C_8EB4:
	JSR ApplyVelY                   ;C - - - - - 0x018EC4 0C:8EB4: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x018EC7 0C:8EB7: BD 30 04
	BPL loc_0C_8EC4                 ;C - - - - - 0x018ECA 0C:8EBA: 10 08
	LDA objY,X                      ;C - - - - - 0x018ECC 0C:8EBC: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x018ECF 0C:8EBF: DD 30 05
	BCS loc_0C_8EC5                 ;C - - - - - 0x018ED2 0C:8EC2: B0 01
loc_0C_8EC4:
	RTS                             ;C - - - - - 0x018ED4 0C:8EC4: 60
loc_0C_8EC5:
	LDA objParamC,X                 ;C - - - - - 0x018ED5 0C:8EC5: BD 30 05
	STA objY,X                      ;C - - - - - 0x018ED8 0C:8EC8: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x018EDB 0C:8ECB: 20 1F 9B
	LDA #$38                        ;C - - - - - 0x018EDE 0C:8ECE: A9 38
	STA objVelYLo,X                 ;C - - - - - 0x018EE0 0C:8ED0: 9D 20 04
	LDA #$02                        ;C - - - - - 0x018EE3 0C:8ED3: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x018EE5 0C:8ED5: 9D 30 04
	LDA #$80                        ;C - - - - - 0x018EE8 0C:8ED8: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x018EEA 0C:8EDA: 9D 00 04
	LDA #$00                        ;C - - - - - 0x018EED 0C:8EDD: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x018EEF 0C:8EDF: 9D 10 04
	INC objActive,X                 ;C - - - - - 0x018EF2 0C:8EE2: FE 00 03
ofs_0C_8EE5:
	LDA objDownState,X              ;C - - - - - 0x018EF5 0C:8EE5: BD C0 04
	CMP #$FE                        ;C - - - - - 0x018EF8 0C:8EE8: C9 FE
	BEQ loc_0C_8EF2                 ;C - - - - - 0x018EFA 0C:8EEA: F0 06
	CMP #$FD                        ;C - - - - - 0x018EFC 0C:8EEC: C9 FD
	BEQ loc_0C_8EF2                 ;C - - - - - 0x018EFE 0C:8EEE: F0 02
	BNE loc_0C_8EF5                 ;C - - - - - 0x018F00 0C:8EF0: D0 03
loc_0C_8EF2:
	JMP EnemyKnockdownStep          ;C - - - - - 0x018F02 0C:8EF2: 4C FC 9B
loc_0C_8EF5:
	LDA objFacing,X                 ;C - - - - - 0x018F05 0C:8EF5: BD 60 04
	AND #$01                        ;C - - - - - 0x018F08 0C:8EF8: 29 01
	BEQ loc_0C_8F22                 ;C - - - - - 0x018F0A 0C:8EFA: F0 26
	LDA ram_00BC                    ;C - - - - - 0x018F0C 0C:8EFC: A5 BC
	BEQ loc_0C_8F1C                 ;C - - - - - 0x018F0E 0C:8EFE: F0 1C
	LDA objX,X                      ;C - - - - - 0x018F10 0C:8F00: BD 60 03
	SEC                             ;C - - - - - 0x018F13 0C:8F03: 38
	SBC scrollX                     ;C - - - - - 0x018F14 0C:8F04: E5 FC
	CMP #$10                        ;C - - - - - 0x018F16 0C:8F06: C9 10
	BCS loc_0C_8F1C                 ;C - - - - - 0x018F18 0C:8F08: B0 12
	LDA scrollX                     ;C - - - - - 0x018F1A 0C:8F0A: A5 FC
	CLC                             ;C - - - - - 0x018F1C 0C:8F0C: 18
	ADC #$10                        ;C - - - - - 0x018F1D 0C:8F0D: 69 10
	STA objX,X                      ;C - - - - - 0x018F1F 0C:8F0F: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x018F22 0C:8F12: A5 2D
	ADC #$00                        ;C - - - - - 0x018F24 0C:8F14: 69 00
	STA objXPage,X                  ;C - - - - - 0x018F26 0C:8F16: 9D 80 03
	JMP loc_0C_8F45                 ;C - - - - - 0x018F29 0C:8F19: 4C 45 8F
loc_0C_8F1C:
	JSR ApplyVelXSub                ;C - - - - - 0x018F2C 0C:8F1C: 20 A1 F1
	JMP loc_0C_8F45                 ;C - - - - - 0x018F2F 0C:8F1F: 4C 45 8F
loc_0C_8F22:
	LDA ram_00BC                    ;C - - - - - 0x018F32 0C:8F22: A5 BC
	BEQ loc_0C_8F42                 ;C - - - - - 0x018F34 0C:8F24: F0 1C
	LDA objX,X                      ;C - - - - - 0x018F36 0C:8F26: BD 60 03
	SEC                             ;C - - - - - 0x018F39 0C:8F29: 38
	SBC scrollX                     ;C - - - - - 0x018F3A 0C:8F2A: E5 FC
	CMP #$F1                        ;C - - - - - 0x018F3C 0C:8F2C: C9 F1
	BCC loc_0C_8F42                 ;C - - - - - 0x018F3E 0C:8F2E: 90 12
	LDA scrollX                     ;C - - - - - 0x018F40 0C:8F30: A5 FC
	CLC                             ;C - - - - - 0x018F42 0C:8F32: 18
	ADC #$F0                        ;C - - - - - 0x018F43 0C:8F33: 69 F0
	STA objX,X                      ;C - - - - - 0x018F45 0C:8F35: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x018F48 0C:8F38: A5 2D
	ADC #$00                        ;C - - - - - 0x018F4A 0C:8F3A: 69 00
	STA objXPage,X                  ;C - - - - - 0x018F4C 0C:8F3C: 9D 80 03
	JMP loc_0C_8F45                 ;C - - - - - 0x018F4F 0C:8F3F: 4C 45 8F
loc_0C_8F42:
	JSR ApplyVelXAdd                ;C - - - - - 0x018F52 0C:8F42: 20 83 F1
loc_0C_8F45:
	JSR ApplyVelY                   ;C - - - - - 0x018F55 0C:8F45: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x018F58 0C:8F48: BD 30 04
	BPL loc_0C_8F55                 ;C - - - - - 0x018F5B 0C:8F4B: 10 08
	LDA objY,X                      ;C - - - - - 0x018F5D 0C:8F4D: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x018F60 0C:8F50: DD 30 05
	BCS loc_0C_8F56                 ;C - - - - - 0x018F63 0C:8F53: B0 01
loc_0C_8F55:
	RTS                             ;C - - - - - 0x018F65 0C:8F55: 60
loc_0C_8F56:
	LDA objParamC,X                 ;C - - - - - 0x018F66 0C:8F56: BD 30 05
	STA objY,X                      ;C - - - - - 0x018F69 0C:8F59: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x018F6C 0C:8F5C: 20 1F 9B
	LDA attackType                  ;C - - - - - 0x018F6F 0C:8F5F: A5 A7
	STA ram_0151                    ;C - - - - - 0x018F71 0C:8F61: 8D 51 01
	LDA #$05                        ;C - - - - - 0x018F74 0C:8F64: A9 05
	STA attackType                  ;C - - - - - 0x018F76 0C:8F66: 85 A7
	JSR EnemyHitCheck               ;C - - - - - 0x018F78 0C:8F68: 20 F0 84
	LDA objLife,X                   ;C - - - - - 0x018F7B 0C:8F6B: BD 90 04
	BPL loc_0C_8F80                 ;C - - - - - 0x018F7E 0C:8F6E: 10 10
	LDA #$00                        ;C - - - - - 0x018F80 0C:8F70: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x018F82 0C:8F72: 9D 40 04
	INC objActive,X                 ;C - - - - - 0x018F85 0C:8F75: FE 00 03
	INC enemiesDefeated             ;C - - - - - 0x018F88 0C:8F78: E6 54
	JSR PlayerSpecialDispatch       ;C - - - - - 0x018F8A 0C:8F7A: 20 E3 89
	JMP EnemySetDownAnimB           ;C - - - - - 0x018F8D 0C:8F7D: 4C 7A 9C
loc_0C_8F80:
	LDA ram_0151                    ;C - - - - - 0x018F90 0C:8F80: AD 51 01
	STA attackType                  ;C - - - - - 0x018F93 0C:8F83: 85 A7
	LDA #$FF                        ;C - - - - - 0x018F95 0C:8F85: A9 FF
	STA objDownState,X              ;C - - - - - 0x018F97 0C:8F87: 9D C0 04
	JMP EnemyKnockdownStep          ;C - - - - - 0x018F9A 0C:8F8A: 4C FC 9B
ofs_0C_8F8D:
	DEC objParamA,X                 ;C - - J - - 0x018F9D 0C:8F8D: DE 10 05
	LDA objParamA,X                 ;C - - - - - 0x018FA0 0C:8F90: BD 10 05
	BEQ loc_0C_8FA2                 ;C - - - - - 0x018FA3 0C:8F93: F0 0D
	AND #$01                        ;C - - - - - 0x018FA5 0C:8F95: 29 01
	BNE loc_0C_8F9E                 ;C - - - - - 0x018FA7 0C:8F97: D0 05
	JSR SetObjFlag04                ;C - - - - - 0x018FA9 0C:8F99: 20 62 9B
	BNE loc_0C_8FA1                 ;C - - - - - 0x018FAC 0C:8F9C: D0 03
loc_0C_8F9E:
	JSR ClearObjFlag04              ;C - - - - - 0x018FAE 0C:8F9E: 20 6B 9B
loc_0C_8FA1:
	RTS                             ;C - - - - - 0x018FB1 0C:8FA1: 60
loc_0C_8FA2:
	JMP ClearObject                 ;C - - - - - 0x018FB2 0C:8FA2: 4C BE F2
; kind 08: 7-state machine
EnemyAI_Kind08:
	LDA objActive,X                 ;C - - J - - 0x018FB5 0C:8FA5: BD 00 03
	AND #$0F                        ;C - - - - - 0x018FB8 0C:8FA8: 29 0F
	TAY                             ;C - - - - - 0x018FBA 0C:8FAA: A8
	LDA EnemyAI_Kind08Tbl_8FB8,Y    ;C - - - - - 0x018FBB 0C:8FAB: B9 B8 8F
	STA ptr_00                      ;C - - - - - 0x018FBE 0C:8FAE: 85 00
	LDA EnemyAI_Kind08Tbl_8FBF,Y    ;C - - - - - 0x018FC0 0C:8FB0: B9 BF 8F
	STA ptr_00+1                    ;C - - - - - 0x018FC3 0C:8FB3: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x018FC5 0C:8FB5: 6C 00 00
EnemyAI_Kind08Tbl_8FB8:
	.lobytes ofs_0C_8FC6, ofs_0C_9036, ofs_0C_9078, ofs_0C_90BA, ofs_0C_9128, ofs_0C_8F8D, ofs_0C_917E;- D 0 - - - 0x018FC8 0C:8FB8:
EnemyAI_Kind08Tbl_8FBF:
	.hibytes ofs_0C_8FC6, ofs_0C_9036, ofs_0C_9078, ofs_0C_90BA, ofs_0C_9128, ofs_0C_8F8D, ofs_0C_917E;- D 0 - - - 0x018FCF 0C:8FBF:
ofs_0C_8FC6:
	LDA #$33                        ;C - - J - - 0x018FD6 0C:8FC6: A9 33
	JSR QueueSound                  ;C - - - - - 0x018FD8 0C:8FC8: 20 4C F3
	LDA #$10                        ;C - - - - - 0x018FDB 0C:8FCB: A9 10
	STA objParamA,X                 ;C - - - - - 0x018FDD 0C:8FCD: 9D 10 05
	LDA #$08                        ;C - - - - - 0x018FE0 0C:8FD0: A9 08
	STA objCooldown,X               ;C - - - - - 0x018FE2 0C:8FD2: 9D 40 05
	LDA #$10                        ;C - - - - - 0x018FE5 0C:8FD5: A9 10
	STA objParamB,X                 ;C - - - - - 0x018FE7 0C:8FD7: 9D 20 05
	INC objActive,X                 ;C - - - - - 0x018FEA 0C:8FDA: FE 00 03
	LDA objY,X                      ;C - - - - - 0x018FED 0C:8FDD: BD C0 03
	SEC                             ;C - - - - - 0x018FF0 0C:8FE0: 38
	SBC #$04                        ;C - - - - - 0x018FF1 0C:8FE1: E9 04
	STA objY,X                      ;C - - - - - 0x018FF3 0C:8FE3: 9D C0 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x018FF6 0C:8FE6: 20 55 9C
	LDA objFacing,X                 ;C - - - - - 0x018FF9 0C:8FE9: BD 60 04
	AND #$01                        ;C - - - - - 0x018FFC 0C:8FEC: 29 01
	BNE loc_0C_8FF6                 ;C - - - - - 0x018FFE 0C:8FEE: D0 06
	JSR ClearObjFlag40              ;C - - - - - 0x019000 0C:8FF0: 20 99 F0
	JMP loc_0C_8FF9                 ;C - - - - - 0x019003 0C:8FF3: 4C F9 8F
loc_0C_8FF6:
	JSR SetObjFlag40                ;C - - - - - 0x019006 0C:8FF6: 20 90 F0
loc_0C_8FF9:
	LDA objMoveMode,X               ;C - - - - - 0x019009 0C:8FF9: BD 70 04
	BNE loc_0C_901A                 ;C - - - - - 0x01900C 0C:8FFC: D0 1C
	LDA objFacing,X                 ;C - - - - - 0x01900E 0C:8FFE: BD 60 04
	AND #$02                        ;C - - - - - 0x019011 0C:9001: 29 02
	TAY                             ;C - - - - - 0x019013 0C:9003: A8
	LDA objX,X                      ;C - - - - - 0x019014 0C:9004: BD 60 03
	CLC                             ;C - - - - - 0x019017 0C:9007: 18
	ADC EnemyAI_Kind08Tbl_FCF2,Y    ;C - - - - - 0x019018 0C:9008: 79 F2 FC
	PHA                             ;C - - - - - 0x01901B 0C:900B: 48
	LDA objXPage,X                  ;C - - - - - 0x01901C 0C:900C: BD 80 03
	ADC EnemyAI_Kind08Tbl_FCF3,Y    ;C - - - - - 0x01901F 0C:900F: 79 F3 FC
	STA objXPage,X                  ;C - - - - - 0x019022 0C:9012: 9D 80 03
	PLA                             ;C - - - - - 0x019025 0C:9015: 68
	STA objX,X                      ;C - - - - - 0x019026 0C:9016: 9D 60 03
	RTS                             ;C - - - - - 0x019029 0C:9019: 60
loc_0C_901A:
	LDA objFacing,X                 ;C - - - - - 0x01902A 0C:901A: BD 60 04
	AND #$02                        ;C - - - - - 0x01902D 0C:901D: 29 02
	TAY                             ;C - - - - - 0x01902F 0C:901F: A8
	LDA objX,X                      ;C - - - - - 0x019030 0C:9020: BD 60 03
	CLC                             ;C - - - - - 0x019033 0C:9023: 18
	ADC EnemyAI_Kind08Tbl_FCF6,Y    ;C - - - - - 0x019034 0C:9024: 79 F6 FC
	PHA                             ;C - - - - - 0x019037 0C:9027: 48
	LDA objXPage,X                  ;C - - - - - 0x019038 0C:9028: BD 80 03
	ADC EnemyAI_Kind08Tbl_FCF7,Y    ;C - - - - - 0x01903B 0C:902B: 79 F7 FC
	STA objXPage,X                  ;C - - - - - 0x01903E 0C:902E: 9D 80 03
	PLA                             ;C - - - - - 0x019041 0C:9031: 68
	STA objX,X                      ;C - - - - - 0x019042 0C:9032: 9D 60 03
	RTS                             ;C - - - - - 0x019045 0C:9035: 60
ofs_0C_9036:
	LDA gameAction                  ;C - - J - - 0x019046 0C:9036: A5 30
	CMP #$06                        ;C - - - - - 0x019048 0C:9038: C9 06
	BEQ loc_0C_9059                 ;C - - - - - 0x01904A 0C:903A: F0 1D
	CMP #$1F                        ;C - - - - - 0x01904C 0C:903C: C9 1F
	BEQ loc_0C_9059                 ;C - - - - - 0x01904E 0C:903E: F0 19
	CMP #$0A                        ;C - - - - - 0x019050 0C:9040: C9 0A
	BEQ loc_0C_9059                 ;C - - - - - 0x019052 0C:9042: F0 15
	LDA objAnimFrame                ;C - - - - - 0x019054 0C:9044: AD 70 05
	CMP #$01                        ;C - - - - - 0x019057 0C:9047: C9 01
	BNE loc_0C_9077                 ;C - - - - - 0x019059 0C:9049: D0 2C
	LDA objAnimFlags                ;C - - - - - 0x01905B 0C:904B: AD 90 05
	BNE loc_0C_9077                 ;C - - - - - 0x01905E 0C:904E: D0 27
	LDA objY,X                      ;C - - - - - 0x019060 0C:9050: BD C0 03
	SEC                             ;C - - - - - 0x019063 0C:9053: 38
	SBC #$07                        ;C - - - - - 0x019064 0C:9054: E9 07
	STA objY,X                      ;C - - - - - 0x019066 0C:9056: 9D C0 03
loc_0C_9059:
	INC objActive,X                 ;C - - - - - 0x019069 0C:9059: FE 00 03
	LDA objFacing,X                 ;C - - - - - 0x01906C 0C:905C: BD 60 04
	AND #$02                        ;C - - - - - 0x01906F 0C:905F: 29 02
	TAY                             ;C - - - - - 0x019071 0C:9061: A8
	LDA objX,X                      ;C - - - - - 0x019072 0C:9062: BD 60 03
	CLC                             ;C - - - - - 0x019075 0C:9065: 18
	ADC EnemyAI_Kind08Tbl_FCFA,Y    ;C - - - - - 0x019076 0C:9066: 79 FA FC
	PHA                             ;C - - - - - 0x019079 0C:9069: 48
	LDA objXPage,X                  ;C - - - - - 0x01907A 0C:906A: BD 80 03
	ADC EnemyAI_Kind08Tbl_FCFB,Y    ;C - - - - - 0x01907D 0C:906D: 79 FB FC
	STA objXPage,X                  ;C - - - - - 0x019080 0C:9070: 9D 80 03
	PLA                             ;C - - - - - 0x019083 0C:9073: 68
	STA objX,X                      ;C - - - - - 0x019084 0C:9074: 9D 60 03
loc_0C_9077:
	RTS                             ;C - - - - - 0x019087 0C:9077: 60
ofs_0C_9078:
	LDA gameAction                  ;C - - J - - 0x019088 0C:9078: A5 30
	CMP #$06                        ;C - - - - - 0x01908A 0C:907A: C9 06
	BEQ loc_0C_9092                 ;C - - - - - 0x01908C 0C:907C: F0 14
	CMP #$1F                        ;C - - - - - 0x01908E 0C:907E: C9 1F
	BEQ loc_0C_9092                 ;C - - - - - 0x019090 0C:9080: F0 10
	CMP #$0A                        ;C - - - - - 0x019092 0C:9082: C9 0A
	BEQ loc_0C_9092                 ;C - - - - - 0x019094 0C:9084: F0 0C
	LDA objAnimFrame                ;C - - - - - 0x019096 0C:9086: AD 70 05
	CMP #$02                        ;C - - - - - 0x019099 0C:9089: C9 02
	BNE loc_0C_90B9                 ;C - - - - - 0x01909B 0C:908B: D0 2C
	LDA objAnimFlags                ;C - - - - - 0x01909D 0C:908D: AD 90 05
	BNE loc_0C_90B9                 ;C - - - - - 0x0190A0 0C:9090: D0 27
loc_0C_9092:
	INC objActive,X                 ;C - - - - - 0x0190A2 0C:9092: FE 00 03
	LDA objY,X                      ;C - - - - - 0x0190A5 0C:9095: BD C0 03
	SEC                             ;C - - - - - 0x0190A8 0C:9098: 38
	SBC #$06                        ;C - - - - - 0x0190A9 0C:9099: E9 06
	STA objY,X                      ;C - - - - - 0x0190AB 0C:909B: 9D C0 03
	LDA objFacing,X                 ;C - - - - - 0x0190AE 0C:909E: BD 60 04
	AND #$02                        ;C - - - - - 0x0190B1 0C:90A1: 29 02
	TAY                             ;C - - - - - 0x0190B3 0C:90A3: A8
	LDA objX,X                      ;C - - - - - 0x0190B4 0C:90A4: BD 60 03
	CLC                             ;C - - - - - 0x0190B7 0C:90A7: 18
	ADC EnemyAI_Kind08Tbl_FCFE,Y    ;C - - - - - 0x0190B8 0C:90A8: 79 FE FC
	PHA                             ;C - - - - - 0x0190BB 0C:90AB: 48
	LDA objXPage,X                  ;C - - - - - 0x0190BC 0C:90AC: BD 80 03
	ADC EnemyAI_Kind08Tbl_FCFF,Y    ;C - - - - - 0x0190BF 0C:90AF: 79 FF FC
	STA objXPage,X                  ;C - - - - - 0x0190C2 0C:90B2: 9D 80 03
	PLA                             ;C - - - - - 0x0190C5 0C:90B5: 68
	STA objX,X                      ;C - - - - - 0x0190C6 0C:90B6: 9D 60 03
loc_0C_90B9:
	RTS                             ;C - - - - - 0x0190C9 0C:90B9: 60
ofs_0C_90BA:
	LDA gameAction                  ;C - - J - - 0x0190CA 0C:90BA: A5 30
	CMP #$06                        ;C - - - - - 0x0190CC 0C:90BC: C9 06
	BEQ loc_0C_90EC                 ;C - - - - - 0x0190CE 0C:90BE: F0 2C
	CMP #$1F                        ;C - - - - - 0x0190D0 0C:90C0: C9 1F
	BEQ loc_0C_90EC                 ;C - - - - - 0x0190D2 0C:90C2: F0 28
	CMP #$0A                        ;C - - - - - 0x0190D4 0C:90C4: C9 0A
	BEQ loc_0C_90EC                 ;C - - - - - 0x0190D6 0C:90C6: F0 24
	LDA objAnimFrame                ;C - - - - - 0x0190D8 0C:90C8: AD 70 05
	CMP #$03                        ;C - - - - - 0x0190DB 0C:90CB: C9 03
	BNE loc_0C_9127                 ;C - - - - - 0x0190DD 0C:90CD: D0 58
	LDA objAnimFlags                ;C - - - - - 0x0190DF 0C:90CF: AD 90 05
	BNE loc_0C_9127                 ;C - - - - - 0x0190E2 0C:90D2: D0 53
	LDA objSpriteDown,X             ;C - - - - - 0x0190E4 0C:90D4: BD B0 05
	TAY                             ;C - - - - - 0x0190E7 0C:90D7: A8
	LDA tbl_0F_FC68,Y               ;C - - - - - 0x0190E8 0C:90D8: B9 68 FC
	JSR SetAnimX                    ;C - - - - - 0x0190EB 0C:90DB: 20 88 F2
	LDA tbl_0F_FC75,Y               ;C - - - - - 0x0190EE 0C:90DE: B9 75 FC
	STA ptr_00                      ;C - - - - - 0x0190F1 0C:90E1: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x0190F3 0C:90E3: B9 33 FC
	TAY                             ;C - - - - - 0x0190F6 0C:90E6: A8
	LDA ptr_00                      ;C - - - - - 0x0190F7 0C:90E7: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0190F9 0C:90E9: 99 EB 00
loc_0C_90EC:
	INC objActive,X                 ;C - - - - - 0x0190FC 0C:90EC: FE 00 03
	LDA objY                        ;C - - - - - 0x0190FF 0C:90EF: AD C0 03
	STA objY,X                      ;C - - - - - 0x019102 0C:90F2: 9D C0 03
	STA objParamC,X                 ;C - - - - - 0x019105 0C:90F5: 9D 30 05
	LDA #$9E                        ;C - - - - - 0x019108 0C:90F8: A9 9E
	STA objVelYLo,X                 ;C - - - - - 0x01910A 0C:90FA: 9D 20 04
	LDA #$03                        ;C - - - - - 0x01910D 0C:90FD: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x01910F 0C:90FF: 9D 30 04
	LDA #$99                        ;C - - - - - 0x019112 0C:9102: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x019114 0C:9104: 9D 00 04
	LDA #$00                        ;C - - - - - 0x019117 0C:9107: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x019119 0C:9109: 9D 10 04
	LDA objFacing,X                 ;C - - - - - 0x01911C 0C:910C: BD 60 04
	AND #$02                        ;C - - - - - 0x01911F 0C:910F: 29 02
	TAY                             ;C - - - - - 0x019121 0C:9111: A8
	LDA objX,X                      ;C - - - - - 0x019122 0C:9112: BD 60 03
	CLC                             ;C - - - - - 0x019125 0C:9115: 18
	ADC EnemyAI_Kind08Tbl_FD02,Y    ;C - - - - - 0x019126 0C:9116: 79 02 FD
	PHA                             ;C - - - - - 0x019129 0C:9119: 48
	LDA objXPage,X                  ;C - - - - - 0x01912A 0C:911A: BD 80 03
	ADC EnemyAI_Kind08Tbl_FD03,Y    ;C - - - - - 0x01912D 0C:911D: 79 03 FD
	STA objXPage,X                  ;C - - - - - 0x019130 0C:9120: 9D 80 03
	PLA                             ;C - - - - - 0x019133 0C:9123: 68
	STA objX,X                      ;C - - - - - 0x019134 0C:9124: 9D 60 03
loc_0C_9127:
	RTS                             ;C - - - - - 0x019137 0C:9127: 60
ofs_0C_9128:
	JSR EnemyLandCheck              ;C - - J - - bank=0D 0x019138 0C:9128: 20 F6 A9
	BCC loc_0C_9138                 ;C - - - - - 0x01913B 0C:912B: 90 0B
	LDA #$FE                        ;c - - - - - 0x01913D 0C:912D: A9 FE
	STA objVelYHi,X                 ;c - - - - - 0x01913F 0C:912F: 9D 30 04
	LDA #$00                        ;c - - - - - 0x019142 0C:9132: A9 00
	STA objVelYLo,X                 ;c - - - - - 0x019144 0C:9134: 9D 20 04
	RTS                             ;c - - - - - 0x019147 0C:9137: 60
loc_0C_9138:
	LDA objParamB,X                 ;C - - - - - 0x019148 0C:9138: BD 20 05
	BNE loc_0C_916F                 ;C - - - - - 0x01914B 0C:913B: D0 32
	JSR EnemySetDownAnimA           ;C - - - - - 0x01914D 0C:913D: 20 55 9C
	LDA attackType                  ;C - - - - - 0x019150 0C:9140: A5 A7
	STA ram_0151                    ;C - - - - - 0x019152 0C:9142: 8D 51 01
	LDA #$05                        ;C - - - - - 0x019155 0C:9145: A9 05
	STA attackType                  ;C - - - - - 0x019157 0C:9147: 85 A7
	JSR EnemyHitCheck               ;C - - - - - 0x019159 0C:9149: 20 F0 84
	LDA #$00                        ;C - - - - - 0x01915C 0C:914C: A9 00
	STA playerBusy                  ;C - - - - - 0x01915E 0C:914E: 85 6E
	LDA objLife,X                   ;C - - - - - 0x019160 0C:9150: BD 90 04
	BPL loc_0C_9173                 ;C - - - - - 0x019163 0C:9153: 10 1E
	INC enemiesDefeated             ;C - - - - - 0x019165 0C:9155: E6 54
	LDA #$00                        ;C - - - - - 0x019167 0C:9157: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x019169 0C:9159: 9D 40 04
	LDA #$80                        ;C - - - - - 0x01916C 0C:915C: A9 80
	STA objActive,X                 ;C - - - - - 0x01916E 0C:915E: 9D 00 03
	LDA #$16                        ;C - - - - - 0x019171 0C:9161: A9 16
	STA objKind,X                   ;C - - - - - 0x019173 0C:9163: 9D 20 03
	LDA objFacing,X                 ;C - - - - - 0x019176 0C:9166: BD 60 04
	EOR #$03                        ;C - - - - - 0x019179 0C:9169: 49 03
	STA objFacing,X                 ;C - - - - - 0x01917B 0C:916B: 9D 60 04
	RTS                             ;C - - - - - 0x01917E 0C:916E: 60
loc_0C_916F:
	DEC objParamB,X                 ;C - - - - - 0x01917F 0C:916F: DE 20 05
	RTS                             ;C - - - - - 0x019182 0C:9172: 60
loc_0C_9173:
	LDA ram_0151                    ;C - - - - - 0x019183 0C:9173: AD 51 01
	STA attackType                  ;C - - - - - 0x019186 0C:9176: 85 A7
	INC objActive,X                 ;C - - - - - 0x019188 0C:9178: FE 00 03
	INC objActive,X                 ;C - - - - - 0x01918B 0C:917B: FE 00 03
ofs_0C_917E:
	LDA objDownState,X              ;C - - - - - 0x01918E 0C:917E: BD C0 04
	CMP #$FE                        ;C - - - - - 0x019191 0C:9181: C9 FE
	BEQ loc_0C_91B3                 ;C - - - - - 0x019193 0C:9183: F0 2E
	CMP #$FD                        ;C - - - - - 0x019195 0C:9185: C9 FD
	BEQ loc_0C_91B3                 ;C - - - - - 0x019197 0C:9187: F0 2A
	LDA objFacing,X                 ;C - - - - - 0x019199 0C:9189: BD 60 04
	AND #$01                        ;C - - - - - 0x01919C 0C:918C: 29 01
	BEQ loc_0C_9196                 ;C - - - - - 0x01919E 0C:918E: F0 06
	JSR ApplyVelXSub                ;C - - - - - 0x0191A0 0C:9190: 20 A1 F1
	JMP loc_0C_9199                 ;C - - - - - 0x0191A3 0C:9193: 4C 99 91
loc_0C_9196:
	JSR ApplyVelXAdd                ;C - - - - - 0x0191A6 0C:9196: 20 83 F1
loc_0C_9199:
	JSR ApplyVelY                   ;C - - - - - 0x0191A9 0C:9199: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x0191AC 0C:919C: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x0191AF 0C:919F: DD 30 05
	BCS loc_0C_91A5                 ;C - - - - - 0x0191B2 0C:91A2: B0 01
	RTS                             ;C - - - - - 0x0191B4 0C:91A4: 60
loc_0C_91A5:
	LDA objParamC,X                 ;C - - - - - 0x0191B5 0C:91A5: BD 30 05
	STA objY,X                      ;C - - - - - 0x0191B8 0C:91A8: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x0191BB 0C:91AB: 20 1F 9B
	LDA #$FF                        ;C - - - - - 0x0191BE 0C:91AE: A9 FF
	STA objDownState,X              ;C - - - - - 0x0191C0 0C:91B0: 9D C0 04
loc_0C_91B3:
	JSR EnemyKnockdownStep          ;C - - - - - 0x0191C3 0C:91B3: 20 FC 9B
	RTS                             ;C - - - - - 0x0191C6 0C:91B6: 60
; kind 0E
EnemyAI_Kind0E:
	LDA #$00                        ;C - - J - - 0x0191C7 0C:91B7: A9 00
	STA objAnimFlags,X              ;C - - - - - 0x0191C9 0C:91B9: 9D 90 05
	LDA objActive,X                 ;C - - - - - 0x0191CC 0C:91BC: BD 00 03
	AND #$0F                        ;C - - - - - 0x0191CF 0C:91BF: 29 0F
	BNE loc_0C_9226                 ;C - - - - - 0x0191D1 0C:91C1: D0 63
	LDA objAnim                     ;C - - - - - 0x0191D3 0C:91C3: AD 80 05
	CMP #$48                        ;C - - - - - 0x0191D6 0C:91C6: C9 48
	BNE loc_0C_91F4                 ;C - - - - - 0x0191D8 0C:91C8: D0 2A
	LDA #$08                        ;C - - - - - 0x0191DA 0C:91CA: A9 08
	STA objCooldown,X               ;C - - - - - 0x0191DC 0C:91CC: 9D 40 05
	LDA objSpriteDown,X             ;C - - - - - 0x0191DF 0C:91CF: BD B0 05
	TAY                             ;C - - - - - 0x0191E2 0C:91D2: A8
	LDA EnemyAI_Kind0ETbl_FC41,Y    ;C - - - - - 0x0191E3 0C:91D3: B9 41 FC
	CMP objAnim,X                   ;C - - - - - 0x0191E6 0C:91D6: DD 80 05
	BEQ loc_0C_91F4                 ;C - - - - - 0x0191E9 0C:91D9: F0 19
	JSR SetAnimX                    ;C - - - - - 0x0191EB 0C:91DB: 20 88 F2
	LDA EnemyAI_Kind0ETbl_FC4E,Y    ;C - - - - - 0x0191EE 0C:91DE: B9 4E FC
	STA ptr_00                      ;C - - - - - 0x0191F1 0C:91E1: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x0191F3 0C:91E3: B9 33 FC
	TAY                             ;C - - - - - 0x0191F6 0C:91E6: A8
	LDA ptr_00                      ;C - - - - - 0x0191F7 0C:91E7: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0191F9 0C:91E9: 99 EB 00
	LDA #$FF                        ;C - - - - - 0x0191FC 0C:91EC: A9 FF
	STA objDownState,X              ;C - - - - - 0x0191FE 0C:91EE: 9D C0 04
	INC objActive,X                 ;C - - - - - 0x019201 0C:91F1: FE 00 03
loc_0C_91F4:
	LDA gameAction                  ;C - - - - - 0x019204 0C:91F4: A5 30
	BEQ loc_0C_9209                 ;C - - - - - 0x019206 0C:91F6: F0 11
	CMP #$06                        ;C - - - - - 0x019208 0C:91F8: C9 06
	BEQ loc_0C_9209                 ;C - - - - - 0x01920A 0C:91FA: F0 0D
	CMP #$05                        ;C - - - - - 0x01920C 0C:91FC: C9 05
	BEQ loc_0C_9209                 ;C - - - - - 0x01920E 0C:91FE: F0 09
	CMP #$12                        ;C - - - - - 0x019210 0C:9200: C9 12
	BEQ loc_0C_9209                 ;C - - - - - 0x019212 0C:9202: F0 05
	CMP #$24                        ;c - - - - - 0x019214 0C:9204: C9 24
	BEQ loc_0C_9209                 ;c - - - - - 0x019216 0C:9206: F0 01
	RTS                             ;c - - - - - 0x019218 0C:9208: 60
loc_0C_9209:
	LDA jumpBaseY                   ;C - - - - - 0x019219 0C:9209: A5 A6
	STA objParamC,X                 ;C - - - - - 0x01921B 0C:920B: 9D 30 05
	LDA objY,X                      ;C - - - - - 0x01921E 0C:920E: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x019221 0C:9211: DD 30 05
	BCS loc_0C_9219                 ;C - - - - - 0x019224 0C:9214: B0 03
	JMP ApplyVelY                   ;C - - - - - 0x019226 0C:9216: 4C FD F1
loc_0C_9219:
	LDA objParamC,X                 ;C - - - - - 0x019229 0C:9219: BD 30 05
	STA objY,X                      ;C - - - - - 0x01922C 0C:921C: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x01922F 0C:921F: 20 1F 9B
	JSR EnemyRecover                ;C - - - - - 0x019232 0C:9222: 20 29 9C
	RTS                             ;C - - - - - 0x019235 0C:9225: 60
loc_0C_9226:
	LDA objActive,X                 ;C - - - - - 0x019236 0C:9226: BD 00 03
	AND #$02                        ;C - - - - - 0x019239 0C:9229: 29 02
	BEQ loc_0C_9230                 ;C - - - - - 0x01923B 0C:922B: F0 03
	JMP loc_0C_92F0                 ;C - - - - - 0x01923D 0C:922D: 4C F0 92
loc_0C_9230:
	LDA objAnim                     ;C - - - - - 0x019240 0C:9230: AD 80 05
	CMP #$49                        ;C - - - - - 0x019243 0C:9233: C9 49
	BNE loc_0C_92A3                 ;C - - - - - 0x019245 0C:9235: D0 6C
	LDA objAnimFlags                ;C - - - - - 0x019247 0C:9237: AD 90 05
	BEQ loc_0C_924A                 ;C - - - - - 0x01924A 0C:923A: F0 0E
	CMP #$04                        ;c - - - - - 0x01924C 0C:923C: C9 04
	BNE loc_0C_92A3                 ;c - - - - - 0x01924E 0C:923E: D0 63
	LDA #$10                        ;c - - - - - 0x019250 0C:9240: A9 10
	STA objParamA,X                 ;c - - - - - 0x019252 0C:9242: 9D 10 05
	LDA #$08                        ;c - - - - - 0x019255 0C:9245: A9 08
	STA objCooldown,X               ;c - - - - - 0x019257 0C:9247: 9D 40 05
loc_0C_924A:
	LDA objSpriteDown,X             ;C - - - - - 0x01925A 0C:924A: BD B0 05
	TAY                             ;C - - - - - 0x01925D 0C:924D: A8
	LDA tbl_0F_FC68,Y               ;C - - - - - 0x01925E 0C:924E: B9 68 FC
	CMP ptr_00                      ;C - - - - - 0x019261 0C:9251: C5 00
	BEQ loc_0C_9266                 ;C - - - - - 0x019263 0C:9253: F0 11
	JSR SetAnimX                    ;C - - - - - 0x019265 0C:9255: 20 88 F2
	LDA tbl_0F_FC75,Y               ;C - - - - - 0x019268 0C:9258: B9 75 FC
	STA ptr_00                      ;C - - - - - 0x01926B 0C:925B: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x01926D 0C:925D: B9 33 FC
	TAY                             ;C - - - - - 0x019270 0C:9260: A8
	LDA ptr_00                      ;C - - - - - 0x019271 0C:9261: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x019273 0C:9263: 99 EB 00
loc_0C_9266:
	LDA objFacing,X                 ;C - - - - - 0x019276 0C:9266: BD 60 04
	AND #$01                        ;C - - - - - 0x019279 0C:9269: 29 01
	BNE loc_0C_9273                 ;C - - - - - 0x01927B 0C:926B: D0 06
	JSR SetObjFlag40                ;C - - - - - 0x01927D 0C:926D: 20 90 F0
	JMP loc_0C_9276                 ;C - - - - - 0x019280 0C:9270: 4C 76 92
loc_0C_9273:
	JSR ClearObjFlag40              ;C - - - - - 0x019283 0C:9273: 20 99 F0
loc_0C_9276:
	LDA #$13                        ;C - - - - - 0x019286 0C:9276: A9 13
	STA attackType                  ;C - - - - - 0x019288 0C:9278: 85 A7
	JSR EnemyHitCheck               ;C - - - - - 0x01928A 0C:927A: 20 F0 84
	LDA objLife,X                   ;C - - - - - 0x01928D 0C:927D: BD 90 04
	BPL loc_0C_92D3                 ;C - - - - - 0x019290 0C:9280: 10 51
	JSR PlayerSpecialDispatch       ;C - - - - - 0x019292 0C:9282: 20 E3 89
	LDA #$00                        ;C - - - - - 0x019295 0C:9285: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x019297 0C:9287: 9D 40 04
	INC enemiesDefeated             ;C - - - - - 0x01929A 0C:928A: E6 54
	LDA #$80                        ;C - - - - - 0x01929C 0C:928C: A9 80
	STA objActive,X                 ;C - - - - - 0x01929E 0C:928E: 9D 00 03
	LDA #$16                        ;C - - - - - 0x0192A1 0C:9291: A9 16
	STA objKind,X                   ;C - - - - - 0x0192A3 0C:9293: 9D 20 03
	LDA objFacing,X                 ;C - - - - - 0x0192A6 0C:9296: BD 60 04
	EOR #$03                        ;C - - - - - 0x0192A9 0C:9299: 49 03
	STA objFacing,X                 ;C - - - - - 0x0192AB 0C:929B: 9D 60 04
	LDA jumpBaseY                   ;C - - - - - 0x0192AE 0C:929E: A5 A6
	STA objParamC,X                 ;C - - - - - 0x0192B0 0C:92A0: 9D 30 05
loc_0C_92A3:
	LDA gameAction                  ;C - - - - - 0x0192B3 0C:92A3: A5 30
	CMP #$12                        ;C - - - - - 0x0192B5 0C:92A5: C9 12
	BEQ loc_0C_92C9                 ;C - - - - - 0x0192B7 0C:92A7: F0 20
	JSR EnemyLandCheck              ;C - - - - - bank=0D 0x0192B9 0C:92A9: 20 F6 A9
	BCC loc_0C_92B9                 ;C - - - - - 0x0192BC 0C:92AC: 90 0B
	LDA #$FD                        ;C - - - - - 0x0192BE 0C:92AE: A9 FD
	STA objVelYHi,X                 ;C - - - - - 0x0192C0 0C:92B0: 9D 30 04
	LDA #$00                        ;C - - - - - 0x0192C3 0C:92B3: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x0192C5 0C:92B5: 9D 20 04
	RTS                             ;C - - - - - 0x0192C8 0C:92B8: 60
loc_0C_92B9:
	LDA jumpBaseY                   ;C - - - - - 0x0192C9 0C:92B9: A5 A6
	STA objParamC,X                 ;C - - - - - 0x0192CB 0C:92BB: 9D 30 05
	LDA objY,X                      ;C - - - - - 0x0192CE 0C:92BE: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x0192D1 0C:92C1: DD 30 05
	BCS loc_0C_92CA                 ;C - - - - - 0x0192D4 0C:92C4: B0 04
	JSR ApplyVelY                   ;C - - - - - 0x0192D6 0C:92C6: 20 FD F1
loc_0C_92C9:
	RTS                             ;C - - - - - 0x0192D9 0C:92C9: 60
loc_0C_92CA:
	LDA objParamC,X                 ;C - - - - - 0x0192DA 0C:92CA: BD 30 05
	STA objY,X                      ;C - - - - - 0x0192DD 0C:92CD: 9D C0 03
	JMP loc_0C_932E                 ;C - - - - - 0x0192E0 0C:92D0: 4C 2E 93
loc_0C_92D3:
	INC objActive,X                 ;C - - - - - 0x0192E3 0C:92D3: FE 00 03
	LDA #$9E                        ;C - - - - - 0x0192E6 0C:92D6: A9 9E
	STA objVelYLo,X                 ;C - - - - - 0x0192E8 0C:92D8: 9D 20 04
	LDA #$03                        ;C - - - - - 0x0192EB 0C:92DB: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x0192ED 0C:92DD: 9D 30 04
	LDA #$99                        ;C - - - - - 0x0192F0 0C:92E0: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x0192F2 0C:92E2: 9D 00 04
	LDA #$00                        ;C - - - - - 0x0192F5 0C:92E5: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x0192F7 0C:92E7: 9D 10 04
	LDA objY,X                      ;C - - - - - 0x0192FA 0C:92EA: BD C0 03
	STA objParamC,X                 ;C - - - - - 0x0192FD 0C:92ED: 9D 30 05
loc_0C_92F0:
	LDA objDownState,X              ;C - - - - - 0x019300 0C:92F0: BD C0 04
	CMP #$FE                        ;C - - - - - 0x019303 0C:92F3: C9 FE
	BEQ loc_0C_932E                 ;C - - - - - 0x019305 0C:92F5: F0 37
	CMP #$FD                        ;C - - - - - 0x019307 0C:92F7: C9 FD
	BEQ loc_0C_932E                 ;C - - - - - 0x019309 0C:92F9: F0 33
	LDA objFacing,X                 ;C - - - - - 0x01930B 0C:92FB: BD 60 04
	AND #$01                        ;C - - - - - 0x01930E 0C:92FE: 29 01
	BEQ loc_0C_9308                 ;C - - - - - 0x019310 0C:9300: F0 06
	JSR ApplyVelXSub                ;C - - - - - 0x019312 0C:9302: 20 A1 F1
	JMP loc_0C_930B                 ;C - - - - - 0x019315 0C:9305: 4C 0B 93
loc_0C_9308:
	JSR ApplyVelXAdd                ;C - - - - - 0x019318 0C:9308: 20 83 F1
loc_0C_930B:
	LDA objAnimFlags,X              ;C - - - - - 0x01931B 0C:930B: BD 90 05
	CMP #$14                        ;C - - - - - 0x01931E 0C:930E: C9 14
	BNE loc_0C_9315                 ;C - - - - - 0x019320 0C:9310: D0 03
	JSR EnemySetDownAnimA           ;c - - - - - 0x019322 0C:9312: 20 55 9C
loc_0C_9315:
	JSR ApplyVelY                   ;C - - - - - 0x019325 0C:9315: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x019328 0C:9318: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x01932B 0C:931B: DD 30 05
	BCC loc_0C_9331                 ;C - - - - - 0x01932E 0C:931E: 90 11
	LDA objParamC,X                 ;C - - - - - 0x019330 0C:9320: BD 30 05
	STA objY,X                      ;C - - - - - 0x019333 0C:9323: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x019336 0C:9326: 20 1F 9B
	LDA #$FF                        ;C - - - - - 0x019339 0C:9329: A9 FF
	STA objDownState,X              ;C - - - - - 0x01933B 0C:932B: 9D C0 04
loc_0C_932E:
	JMP EnemyKnockdownStep          ;C - - - - - 0x01933E 0C:932E: 4C FC 9B
loc_0C_9331:
	RTS                             ;C - - - - - 0x019341 0C:9331: 60
; kind 0F: 9-state machine
EnemyAI_Kind0F:
	LDA objActive,X                 ;C - - J - - 0x019342 0C:9332: BD 00 03
	AND #$0F                        ;C - - - - - 0x019345 0C:9335: 29 0F
	TAY                             ;C - - - - - 0x019347 0C:9337: A8
	LDA EnemyAI_Kind0FTbl_9345,Y    ;C - - - - - 0x019348 0C:9338: B9 45 93
	STA ptr_00                      ;C - - - - - 0x01934B 0C:933B: 85 00
	LDA EnemyAI_Kind0FTbl_934E,Y    ;C - - - - - 0x01934D 0C:933D: B9 4E 93
	STA ptr_00+1                    ;C - - - - - 0x019350 0C:9340: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x019352 0C:9342: 6C 00 00
EnemyAI_Kind0FTbl_9345:
	.lobytes ofs_0C_9357, ofs_0C_93D1, ofs_0C_9457, ofs_0C_94D4, ofs_0C_9551, ofs_0C_95CE, ofs_0C_9602, ofs_0C_968D;- D 0 - - - 0x019355 0C:9345:
	.lobytes ofs_0C_8F8D            ;- D 0 - - - 0x01935D 0C:934D:
EnemyAI_Kind0FTbl_934E:
	.hibytes ofs_0C_9357, ofs_0C_93D1, ofs_0C_9457, ofs_0C_94D4, ofs_0C_9551, ofs_0C_95CE, ofs_0C_9602, ofs_0C_968D;- D 0 - - - 0x01935E 0C:934E:
	.hibytes ofs_0C_8F8D            ;- D 0 - - - 0x019366 0C:9356:
ofs_0C_9357:
	LDA #$33                        ;C - - J - - 0x019367 0C:9357: A9 33
	JSR QueueSound                  ;C - - - - - 0x019369 0C:9359: 20 4C F3
	LDA #$10                        ;C - - - - - 0x01936C 0C:935C: A9 10
	STA objParamA,X                 ;C - - - - - 0x01936E 0C:935E: 9D 10 05
	LDA #$08                        ;C - - - - - 0x019371 0C:9361: A9 08
	STA objCooldown,X               ;C - - - - - 0x019373 0C:9363: 9D 40 05
	LDA objY,X                      ;C - - - - - 0x019376 0C:9366: BD C0 03
	STA objParamC,X                 ;C - - - - - 0x019379 0C:9369: 9D 30 05
	INC objActive,X                 ;C - - - - - 0x01937C 0C:936C: FE 00 03
	LDA objY,X                      ;C - - - - - 0x01937F 0C:936F: BD C0 03
	SEC                             ;C - - - - - 0x019382 0C:9372: 38
	SBC #$08                        ;C - - - - - 0x019383 0C:9373: E9 08
	STA objY,X                      ;C - - - - - 0x019385 0C:9375: 9D C0 03
	LDA objSpriteDown,X             ;C - - - - - 0x019388 0C:9378: BD B0 05
	TAY                             ;C - - - - - 0x01938B 0C:937B: A8
	LDA tbl_0F_FC5B,Y               ;C - - - - - 0x01938C 0C:937C: B9 5B FC
	CMP ptr_00                      ;C - - - - - 0x01938F 0C:937F: C5 00
	BEQ loc_0C_9394                 ;C - - - - - 0x019391 0C:9381: F0 11
	JSR SetAnimX                    ;C - - - - - 0x019393 0C:9383: 20 88 F2
	LDA tbl_0F_FC75,Y               ;C - - - - - 0x019396 0C:9386: B9 75 FC
	STA ptr_00                      ;C - - - - - 0x019399 0C:9389: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x01939B 0C:938B: B9 33 FC
	TAY                             ;C - - - - - 0x01939E 0C:938E: A8
	LDA ptr_00                      ;C - - - - - 0x01939F 0C:938F: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x0193A1 0C:9391: 99 EB 00
loc_0C_9394:
	LDA objMoveMode,X               ;C - - - - - 0x0193A4 0C:9394: BD 70 04
	BNE loc_0C_93B5                 ;C - - - - - 0x0193A7 0C:9397: D0 1C
	LDA objFacing,X                 ;C - - - - - 0x0193A9 0C:9399: BD 60 04
	AND #$02                        ;C - - - - - 0x0193AC 0C:939C: 29 02
	TAY                             ;C - - - - - 0x0193AE 0C:939E: A8
	LDA objX,X                      ;C - - - - - 0x0193AF 0C:939F: BD 60 03
	CLC                             ;C - - - - - 0x0193B2 0C:93A2: 18
	ADC EnemyAI_Kind0FTbl_FD06,Y    ;C - - - - - 0x0193B3 0C:93A3: 79 06 FD
	PHA                             ;C - - - - - 0x0193B6 0C:93A6: 48
	LDA objXPage,X                  ;C - - - - - 0x0193B7 0C:93A7: BD 80 03
	ADC EnemyAI_Kind0FTbl_FD07,Y    ;C - - - - - 0x0193BA 0C:93AA: 79 07 FD
	STA objXPage,X                  ;C - - - - - 0x0193BD 0C:93AD: 9D 80 03
	PLA                             ;C - - - - - 0x0193C0 0C:93B0: 68
	STA objX,X                      ;C - - - - - 0x0193C1 0C:93B1: 9D 60 03
	RTS                             ;C - - - - - 0x0193C4 0C:93B4: 60
loc_0C_93B5:
	LDA objFacing,X                 ;c - - - - - 0x0193C5 0C:93B5: BD 60 04
	AND #$02                        ;c - - - - - 0x0193C8 0C:93B8: 29 02
	TAY                             ;c - - - - - 0x0193CA 0C:93BA: A8
	LDA objX,X                      ;c - - - - - 0x0193CB 0C:93BB: BD 60 03
	CLC                             ;c - - - - - 0x0193CE 0C:93BE: 18
	ADC EnemyAI_Kind0FTbl_FD0A,Y    ;c - - - - - 0x0193CF 0C:93BF: 79 0A FD
	PHA                             ;c - - - - - 0x0193D2 0C:93C2: 48
	LDA objXPage,X                  ;c - - - - - 0x0193D3 0C:93C3: BD 80 03
	ADC EnemyAI_Kind0FTbl_FD0B,Y    ;c - - - - - 0x0193D6 0C:93C6: 79 0B FD
	STA objXPage,X                  ;c - - - - - 0x0193D9 0C:93C9: 9D 80 03
	PLA                             ;c - - - - - 0x0193DC 0C:93CC: 68
	STA objX,X                      ;c - - - - - 0x0193DD 0C:93CD: 9D 60 03
	RTS                             ;c - - - - - 0x0193E0 0C:93D0: 60
ofs_0C_93D1:
	LDA gameAction                  ;C - - J - - 0x0193E1 0C:93D1: A5 30
	CMP #$06                        ;C - - - - - 0x0193E3 0C:93D3: C9 06
	BEQ loc_0C_93E7                 ;C - - - - - 0x0193E5 0C:93D5: F0 10
	CMP #$1F                        ;C - - - - - 0x0193E7 0C:93D7: C9 1F
	BEQ loc_0C_93E7                 ;C - - - - - 0x0193E9 0C:93D9: F0 0C
	CMP #$0A                        ;C - - - - - 0x0193EB 0C:93DB: C9 0A
	BEQ loc_0C_93E7                 ;C - - - - - 0x0193ED 0C:93DD: F0 08
	LDA objAnimFrame                ;C - - - - - 0x0193EF 0C:93DF: AD 70 05
	CMP #$03                        ;C - - - - - 0x0193F2 0C:93E2: C9 03
	BEQ loc_0C_93E7                 ;C - - - - - 0x0193F4 0C:93E4: F0 01
	RTS                             ;C - - - - - 0x0193F6 0C:93E6: 60
loc_0C_93E7:
	LDA objFacing,X                 ;C - - - - - 0x0193F7 0C:93E7: BD 60 04
	AND #$01                        ;C - - - - - 0x0193FA 0C:93EA: 29 01
	BEQ loc_0C_9411                 ;C - - - - - 0x0193FC 0C:93EC: F0 23
	LDA ram_00BC                    ;C - - - - - 0x0193FE 0C:93EE: A5 BC
	BEQ loc_0C_940E                 ;C - - - - - 0x019400 0C:93F0: F0 1C
	LDA objX,X                      ;C - - - - - 0x019402 0C:93F2: BD 60 03
	SEC                             ;C - - - - - 0x019405 0C:93F5: 38
	SBC scrollX                     ;C - - - - - 0x019406 0C:93F6: E5 FC
	CMP #$10                        ;C - - - - - 0x019408 0C:93F8: C9 10
	BCS loc_0C_940E                 ;C - - - - - 0x01940A 0C:93FA: B0 12
	LDA scrollX                     ;c - - - - - 0x01940C 0C:93FC: A5 FC
	CLC                             ;c - - - - - 0x01940E 0C:93FE: 18
	ADC #$10                        ;c - - - - - 0x01940F 0C:93FF: 69 10
	STA objX,X                      ;c - - - - - 0x019411 0C:9401: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x019414 0C:9404: A5 2D
	ADC #$00                        ;c - - - - - 0x019416 0C:9406: 69 00
	STA objXPage,X                  ;c - - - - - 0x019418 0C:9408: 9D 80 03
	JMP loc_0C_942E                 ;c - - - - - 0x01941B 0C:940B: 4C 2E 94
loc_0C_940E:
	JMP loc_0C_942F                 ;C - - - - - 0x01941E 0C:940E: 4C 2F 94
loc_0C_9411:
	LDA ram_00BC                    ;C - - - - - 0x019421 0C:9411: A5 BC
	BEQ loc_0C_942F                 ;C - - - - - 0x019423 0C:9413: F0 1A
	LDA objX,X                      ;C - - - - - 0x019425 0C:9415: BD 60 03
	SEC                             ;C - - - - - 0x019428 0C:9418: 38
	SBC scrollX                     ;C - - - - - 0x019429 0C:9419: E5 FC
	CMP #$F1                        ;C - - - - - 0x01942B 0C:941B: C9 F1
	BCC loc_0C_942F                 ;C - - - - - 0x01942D 0C:941D: 90 10
	LDA scrollX                     ;c - - - - - 0x01942F 0C:941F: A5 FC
	CLC                             ;c - - - - - 0x019431 0C:9421: 18
	ADC #$F0                        ;c - - - - - 0x019432 0C:9422: 69 F0
	STA objX,X                      ;c - - - - - 0x019434 0C:9424: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x019437 0C:9427: A5 2D
	ADC #$00                        ;c - - - - - 0x019439 0C:9429: 69 00
	STA objXPage,X                  ;c - - - - - 0x01943B 0C:942B: 9D 80 03
loc_0C_942E:
	RTS                             ;c - - - - - 0x01943E 0C:942E: 60
loc_0C_942F:
	LDA objY,X                      ;C - - - - - 0x01943F 0C:942F: BD C0 03
	SEC                             ;C - - - - - 0x019442 0C:9432: 38
	SBC #$08                        ;C - - - - - 0x019443 0C:9433: E9 08
	STA objY,X                      ;C - - - - - 0x019445 0C:9435: 9D C0 03
	INC objActive,X                 ;C - - - - - 0x019448 0C:9438: FE 00 03
	LDA objFacing,X                 ;C - - - - - 0x01944B 0C:943B: BD 60 04
	AND #$02                        ;C - - - - - 0x01944E 0C:943E: 29 02
	TAY                             ;C - - - - - 0x019450 0C:9440: A8
	LDA objX,X                      ;C - - - - - 0x019451 0C:9441: BD 60 03
	CLC                             ;C - - - - - 0x019454 0C:9444: 18
	ADC EnemyAI_Kind0FTbl_FD0E,Y    ;C - - - - - 0x019455 0C:9445: 79 0E FD
	PHA                             ;C - - - - - 0x019458 0C:9448: 48
	LDA objXPage,X                  ;C - - - - - 0x019459 0C:9449: BD 80 03
	ADC EnemyAI_Kind0FTbl_FD0F,Y    ;C - - - - - 0x01945C 0C:944C: 79 0F FD
	STA objXPage,X                  ;C - - - - - 0x01945F 0C:944F: 9D 80 03
	PLA                             ;C - - - - - 0x019462 0C:9452: 68
	STA objX,X                      ;C - - - - - 0x019463 0C:9453: 9D 60 03
	RTS                             ;C - - - - - 0x019466 0C:9456: 60
ofs_0C_9457:
	LDA gameAction                  ;C - - J - - 0x019467 0C:9457: A5 30
	CMP #$06                        ;C - - - - - 0x019469 0C:9459: C9 06
	BEQ loc_0C_946D                 ;C - - - - - 0x01946B 0C:945B: F0 10
	CMP #$1F                        ;C - - - - - 0x01946D 0C:945D: C9 1F
	BEQ loc_0C_946D                 ;C - - - - - 0x01946F 0C:945F: F0 0C
	CMP #$0A                        ;C - - - - - 0x019471 0C:9461: C9 0A
	BEQ loc_0C_946D                 ;C - - - - - 0x019473 0C:9463: F0 08
	LDA objAnimFrame                ;C - - - - - 0x019475 0C:9465: AD 70 05
	CMP #$05                        ;C - - - - - 0x019478 0C:9468: C9 05
	BEQ loc_0C_946D                 ;C - - - - - 0x01947A 0C:946A: F0 01
	RTS                             ;C - - - - - 0x01947C 0C:946C: 60
loc_0C_946D:
	LDA objFacing,X                 ;C - - - - - 0x01947D 0C:946D: BD 60 04
	AND #$01                        ;C - - - - - 0x019480 0C:9470: 29 01
	BEQ loc_0C_9497                 ;C - - - - - 0x019482 0C:9472: F0 23
	LDA ram_00BC                    ;C - - - - - 0x019484 0C:9474: A5 BC
	BEQ loc_0C_9494                 ;C - - - - - 0x019486 0C:9476: F0 1C
	LDA objX,X                      ;C - - - - - 0x019488 0C:9478: BD 60 03
	SEC                             ;C - - - - - 0x01948B 0C:947B: 38
	SBC scrollX                     ;C - - - - - 0x01948C 0C:947C: E5 FC
	CMP #$10                        ;C - - - - - 0x01948E 0C:947E: C9 10
	BCS loc_0C_9494                 ;C - - - - - 0x019490 0C:9480: B0 12
	LDA scrollX                     ;c - - - - - 0x019492 0C:9482: A5 FC
	CLC                             ;c - - - - - 0x019494 0C:9484: 18
	ADC #$10                        ;c - - - - - 0x019495 0C:9485: 69 10
	STA objX,X                      ;c - - - - - 0x019497 0C:9487: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x01949A 0C:948A: A5 2D
	ADC #$00                        ;c - - - - - 0x01949C 0C:948C: 69 00
	STA objXPage,X                  ;c - - - - - 0x01949E 0C:948E: 9D 80 03
	JMP loc_0C_94B4                 ;c - - - - - 0x0194A1 0C:9491: 4C B4 94
loc_0C_9494:
	JMP loc_0C_94B5                 ;C - - - - - 0x0194A4 0C:9494: 4C B5 94
loc_0C_9497:
	LDA ram_00BC                    ;C - - - - - 0x0194A7 0C:9497: A5 BC
	BEQ loc_0C_94B5                 ;C - - - - - 0x0194A9 0C:9499: F0 1A
	LDA objX,X                      ;C - - - - - 0x0194AB 0C:949B: BD 60 03
	SEC                             ;C - - - - - 0x0194AE 0C:949E: 38
	SBC scrollX                     ;C - - - - - 0x0194AF 0C:949F: E5 FC
	CMP #$F1                        ;C - - - - - 0x0194B1 0C:94A1: C9 F1
	BCC loc_0C_94B5                 ;C - - - - - 0x0194B3 0C:94A3: 90 10
	LDA scrollX                     ;c - - - - - 0x0194B5 0C:94A5: A5 FC
	CLC                             ;c - - - - - 0x0194B7 0C:94A7: 18
	ADC #$F0                        ;c - - - - - 0x0194B8 0C:94A8: 69 F0
	STA objX,X                      ;c - - - - - 0x0194BA 0C:94AA: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x0194BD 0C:94AD: A5 2D
	ADC #$00                        ;c - - - - - 0x0194BF 0C:94AF: 69 00
	STA objXPage,X                  ;c - - - - - 0x0194C1 0C:94B1: 9D 80 03
loc_0C_94B4:
	RTS                             ;c - - - - - 0x0194C4 0C:94B4: 60
loc_0C_94B5:
	INC objActive,X                 ;C - - - - - 0x0194C5 0C:94B5: FE 00 03
	LDA objFacing,X                 ;C - - - - - 0x0194C8 0C:94B8: BD 60 04
	AND #$02                        ;C - - - - - 0x0194CB 0C:94BB: 29 02
	TAY                             ;C - - - - - 0x0194CD 0C:94BD: A8
	LDA objX,X                      ;C - - - - - 0x0194CE 0C:94BE: BD 60 03
	CLC                             ;C - - - - - 0x0194D1 0C:94C1: 18
	ADC EnemyAI_Kind0FTbl_FD12,Y    ;C - - - - - 0x0194D2 0C:94C2: 79 12 FD
	PHA                             ;C - - - - - 0x0194D5 0C:94C5: 48
	LDA objXPage,X                  ;C - - - - - 0x0194D6 0C:94C6: BD 80 03
	ADC EnemyAI_Kind0FTbl_FD13,Y    ;C - - - - - 0x0194D9 0C:94C9: 79 13 FD
	STA objXPage,X                  ;C - - - - - 0x0194DC 0C:94CC: 9D 80 03
	PLA                             ;C - - - - - 0x0194DF 0C:94CF: 68
	STA objX,X                      ;C - - - - - 0x0194E0 0C:94D0: 9D 60 03
	RTS                             ;C - - - - - 0x0194E3 0C:94D3: 60
ofs_0C_94D4:
	LDA gameAction                  ;C - - J - - 0x0194E4 0C:94D4: A5 30
	CMP #$06                        ;C - - - - - 0x0194E6 0C:94D6: C9 06
	BEQ loc_0C_94EA                 ;C - - - - - 0x0194E8 0C:94D8: F0 10
	CMP #$1F                        ;C - - - - - 0x0194EA 0C:94DA: C9 1F
	BEQ loc_0C_94EA                 ;C - - - - - 0x0194EC 0C:94DC: F0 0C
	CMP #$0A                        ;C - - - - - 0x0194EE 0C:94DE: C9 0A
	BEQ loc_0C_94EA                 ;C - - - - - 0x0194F0 0C:94E0: F0 08
	LDA objAnimFrame                ;C - - - - - 0x0194F2 0C:94E2: AD 70 05
	CMP #$07                        ;C - - - - - 0x0194F5 0C:94E5: C9 07
	BEQ loc_0C_94EA                 ;C - - - - - 0x0194F7 0C:94E7: F0 01
	RTS                             ;C - - - - - 0x0194F9 0C:94E9: 60
loc_0C_94EA:
	LDA objFacing,X                 ;C - - - - - 0x0194FA 0C:94EA: BD 60 04
	AND #$01                        ;C - - - - - 0x0194FD 0C:94ED: 29 01
	BEQ loc_0C_9514                 ;C - - - - - 0x0194FF 0C:94EF: F0 23
	LDA ram_00BC                    ;C - - - - - 0x019501 0C:94F1: A5 BC
	BEQ loc_0C_9511                 ;C - - - - - 0x019503 0C:94F3: F0 1C
	LDA objX,X                      ;C - - - - - 0x019505 0C:94F5: BD 60 03
	SEC                             ;C - - - - - 0x019508 0C:94F8: 38
	SBC scrollX                     ;C - - - - - 0x019509 0C:94F9: E5 FC
	CMP #$10                        ;C - - - - - 0x01950B 0C:94FB: C9 10
	BCS loc_0C_9511                 ;C - - - - - 0x01950D 0C:94FD: B0 12
	LDA scrollX                     ;c - - - - - 0x01950F 0C:94FF: A5 FC
	CLC                             ;c - - - - - 0x019511 0C:9501: 18
	ADC #$10                        ;c - - - - - 0x019512 0C:9502: 69 10
	STA objX,X                      ;c - - - - - 0x019514 0C:9504: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x019517 0C:9507: A5 2D
	ADC #$00                        ;c - - - - - 0x019519 0C:9509: 69 00
	STA objXPage,X                  ;c - - - - - 0x01951B 0C:950B: 9D 80 03
	JMP loc_0C_9531                 ;c - - - - - 0x01951E 0C:950E: 4C 31 95
loc_0C_9511:
	JMP loc_0C_9532                 ;C - - - - - 0x019521 0C:9511: 4C 32 95
loc_0C_9514:
	LDA ram_00BC                    ;C - - - - - 0x019524 0C:9514: A5 BC
	BEQ loc_0C_9511                 ;C - - - - - 0x019526 0C:9516: F0 F9
	LDA objX,X                      ;C - - - - - 0x019528 0C:9518: BD 60 03
	SEC                             ;C - - - - - 0x01952B 0C:951B: 38
	SBC scrollX                     ;C - - - - - 0x01952C 0C:951C: E5 FC
	CMP #$F1                        ;C - - - - - 0x01952E 0C:951E: C9 F1
	BCC loc_0C_9532                 ;C - - - - - 0x019530 0C:9520: 90 10
	LDA scrollX                     ;c - - - - - 0x019532 0C:9522: A5 FC
	CLC                             ;c - - - - - 0x019534 0C:9524: 18
	ADC #$F0                        ;c - - - - - 0x019535 0C:9525: 69 F0
	STA objX,X                      ;c - - - - - 0x019537 0C:9527: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x01953A 0C:952A: A5 2D
	ADC #$00                        ;c - - - - - 0x01953C 0C:952C: 69 00
	STA objXPage,X                  ;c - - - - - 0x01953E 0C:952E: 9D 80 03
loc_0C_9531:
	RTS                             ;c - - - - - 0x019541 0C:9531: 60
loc_0C_9532:
	INC objActive,X                 ;C - - - - - 0x019542 0C:9532: FE 00 03
	LDA objFacing,X                 ;C - - - - - 0x019545 0C:9535: BD 60 04
	AND #$02                        ;C - - - - - 0x019548 0C:9538: 29 02
	TAY                             ;C - - - - - 0x01954A 0C:953A: A8
	LDA objX,X                      ;C - - - - - 0x01954B 0C:953B: BD 60 03
	CLC                             ;C - - - - - 0x01954E 0C:953E: 18
	ADC EnemyAI_Kind0FTbl_FD12,Y    ;C - - - - - 0x01954F 0C:953F: 79 12 FD
	PHA                             ;C - - - - - 0x019552 0C:9542: 48
	LDA objXPage,X                  ;C - - - - - 0x019553 0C:9543: BD 80 03
	ADC EnemyAI_Kind0FTbl_FD13,Y    ;C - - - - - 0x019556 0C:9546: 79 13 FD
	STA objXPage,X                  ;C - - - - - 0x019559 0C:9549: 9D 80 03
	PLA                             ;C - - - - - 0x01955C 0C:954C: 68
	STA objX,X                      ;C - - - - - 0x01955D 0C:954D: 9D 60 03
	RTS                             ;C - - - - - 0x019560 0C:9550: 60
ofs_0C_9551:
	LDA gameAction                  ;C - - J - - 0x019561 0C:9551: A5 30
	CMP #$06                        ;C - - - - - 0x019563 0C:9553: C9 06
	BEQ loc_0C_9567                 ;C - - - - - 0x019565 0C:9555: F0 10
	CMP #$1F                        ;C - - - - - 0x019567 0C:9557: C9 1F
	BEQ loc_0C_9567                 ;C - - - - - 0x019569 0C:9559: F0 0C
	CMP #$0A                        ;C - - - - - 0x01956B 0C:955B: C9 0A
	BEQ loc_0C_9567                 ;C - - - - - 0x01956D 0C:955D: F0 08
	LDA objAnimFrame                ;C - - - - - 0x01956F 0C:955F: AD 70 05
	CMP #$09                        ;C - - - - - 0x019572 0C:9562: C9 09
	BEQ loc_0C_9567                 ;C - - - - - 0x019574 0C:9564: F0 01
	RTS                             ;C - - - - - 0x019576 0C:9566: 60
loc_0C_9567:
	LDA objFacing,X                 ;C - - - - - 0x019577 0C:9567: BD 60 04
	AND #$01                        ;C - - - - - 0x01957A 0C:956A: 29 01
	BEQ loc_0C_9591                 ;C - - - - - 0x01957C 0C:956C: F0 23
	LDA ram_00BC                    ;C - - - - - 0x01957E 0C:956E: A5 BC
	BEQ loc_0C_958E                 ;C - - - - - 0x019580 0C:9570: F0 1C
	LDA objX,X                      ;C - - - - - 0x019582 0C:9572: BD 60 03
	SEC                             ;C - - - - - 0x019585 0C:9575: 38
	SBC scrollX                     ;C - - - - - 0x019586 0C:9576: E5 FC
	CMP #$10                        ;C - - - - - 0x019588 0C:9578: C9 10
	BCS loc_0C_958E                 ;C - - - - - 0x01958A 0C:957A: B0 12
	LDA scrollX                     ;C - - - - - 0x01958C 0C:957C: A5 FC
	CLC                             ;C - - - - - 0x01958E 0C:957E: 18
	ADC #$10                        ;C - - - - - 0x01958F 0C:957F: 69 10
	STA objX,X                      ;C - - - - - 0x019591 0C:9581: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x019594 0C:9584: A5 2D
	ADC #$00                        ;C - - - - - 0x019596 0C:9586: 69 00
	STA objXPage,X                  ;C - - - - - 0x019598 0C:9588: 9D 80 03
	JMP loc_0C_95AE                 ;C - - - - - 0x01959B 0C:958B: 4C AE 95
loc_0C_958E:
	JMP loc_0C_95AF                 ;C - - - - - 0x01959E 0C:958E: 4C AF 95
loc_0C_9591:
	LDA ram_00BC                    ;C - - - - - 0x0195A1 0C:9591: A5 BC
	BEQ loc_0C_95AF                 ;C - - - - - 0x0195A3 0C:9593: F0 1A
	LDA objX,X                      ;C - - - - - 0x0195A5 0C:9595: BD 60 03
	SEC                             ;C - - - - - 0x0195A8 0C:9598: 38
	SBC scrollX                     ;C - - - - - 0x0195A9 0C:9599: E5 FC
	CMP #$F1                        ;C - - - - - 0x0195AB 0C:959B: C9 F1
	BCC loc_0C_95AF                 ;C - - - - - 0x0195AD 0C:959D: 90 10
	LDA scrollX                     ;c - - - - - 0x0195AF 0C:959F: A5 FC
	CLC                             ;c - - - - - 0x0195B1 0C:95A1: 18
	ADC #$F0                        ;c - - - - - 0x0195B2 0C:95A2: 69 F0
	STA objX,X                      ;c - - - - - 0x0195B4 0C:95A4: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x0195B7 0C:95A7: A5 2D
	ADC #$00                        ;c - - - - - 0x0195B9 0C:95A9: 69 00
	STA objXPage,X                  ;c - - - - - 0x0195BB 0C:95AB: 9D 80 03
loc_0C_95AE:
	RTS                             ;C - - - - - 0x0195BE 0C:95AE: 60
loc_0C_95AF:
	INC objActive,X                 ;C - - - - - 0x0195BF 0C:95AF: FE 00 03
	LDA objFacing,X                 ;C - - - - - 0x0195C2 0C:95B2: BD 60 04
	AND #$02                        ;C - - - - - 0x0195C5 0C:95B5: 29 02
	TAY                             ;C - - - - - 0x0195C7 0C:95B7: A8
	LDA objX,X                      ;C - - - - - 0x0195C8 0C:95B8: BD 60 03
	CLC                             ;C - - - - - 0x0195CB 0C:95BB: 18
	ADC EnemyAI_Kind0FTbl_FD12,Y    ;C - - - - - 0x0195CC 0C:95BC: 79 12 FD
	PHA                             ;C - - - - - 0x0195CF 0C:95BF: 48
	LDA objXPage,X                  ;C - - - - - 0x0195D0 0C:95C0: BD 80 03
	ADC EnemyAI_Kind0FTbl_FD13,Y    ;C - - - - - 0x0195D3 0C:95C3: 79 13 FD
	STA objXPage,X                  ;C - - - - - 0x0195D6 0C:95C6: 9D 80 03
	PLA                             ;C - - - - - 0x0195D9 0C:95C9: 68
	STA objX,X                      ;C - - - - - 0x0195DA 0C:95CA: 9D 60 03
	RTS                             ;C - - - - - 0x0195DD 0C:95CD: 60
ofs_0C_95CE:
	LDA #$00                        ;C - - J - - 0x0195DE 0C:95CE: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x0195E0 0C:95D0: 9D 00 04
	LDA #$02                        ;C - - - - - 0x0195E3 0C:95D3: A9 02
	STA objVelXHi,X                 ;C - - - - - 0x0195E5 0C:95D5: 9D 10 04
	LDA #$01                        ;C - - - - - 0x0195E8 0C:95D8: A9 01
	STA objVelYLo,X                 ;C - - - - - 0x0195EA 0C:95DA: 9D 20 04
	LDA #$01                        ;C - - - - - 0x0195ED 0C:95DD: A9 01
	STA objVelYHi,X                 ;C - - - - - 0x0195EF 0C:95DF: 9D 30 04
	LDA objSpriteDown,X             ;C - - - - - 0x0195F2 0C:95E2: BD B0 05
	TAY                             ;C - - - - - 0x0195F5 0C:95E5: A8
	LDA tbl_0F_FC68,Y               ;C - - - - - 0x0195F6 0C:95E6: B9 68 FC
	CMP ptr_00                      ;C - - - - - 0x0195F9 0C:95E9: C5 00
	BEQ loc_0C_95FE                 ;C - - - - - 0x0195FB 0C:95EB: F0 11
	JSR SetAnimX                    ;C - - - - - 0x0195FD 0C:95ED: 20 88 F2
	LDA tbl_0F_FC75,Y               ;C - - - - - 0x019600 0C:95F0: B9 75 FC
	STA ptr_00                      ;C - - - - - 0x019603 0C:95F3: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x019605 0C:95F5: B9 33 FC
	TAY                             ;C - - - - - 0x019608 0C:95F8: A8
	LDA ptr_00                      ;C - - - - - 0x019609 0C:95F9: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x01960B 0C:95FB: 99 EB 00
loc_0C_95FE:
	INC objActive,X                 ;C - - - - - 0x01960E 0C:95FE: FE 00 03
	RTS                             ;C - - - - - 0x019611 0C:9601: 60
ofs_0C_9602:
	LDA objAnimFlags,X              ;C - - J - - 0x019612 0C:9602: BD 90 05
	CMP #$10                        ;C - - - - - 0x019615 0C:9605: C9 10
	BNE loc_0C_960C                 ;C - - - - - 0x019617 0C:9607: D0 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x019619 0C:9609: 20 55 9C
loc_0C_960C:
	LDA objFacing,X                 ;C - - - - - 0x01961C 0C:960C: BD 60 04
	AND #$01                        ;C - - - - - 0x01961F 0C:960F: 29 01
	BEQ loc_0C_9639                 ;C - - - - - 0x019621 0C:9611: F0 26
	LDA ram_00BC                    ;C - - - - - 0x019623 0C:9613: A5 BC
	BEQ loc_0C_9633                 ;C - - - - - 0x019625 0C:9615: F0 1C
	LDA objX,X                      ;C - - - - - 0x019627 0C:9617: BD 60 03
	SEC                             ;C - - - - - 0x01962A 0C:961A: 38
	SBC scrollX                     ;C - - - - - 0x01962B 0C:961B: E5 FC
	CMP #$10                        ;C - - - - - 0x01962D 0C:961D: C9 10
	BCS loc_0C_9633                 ;C - - - - - 0x01962F 0C:961F: B0 12
	LDA scrollX                     ;C - - - - - 0x019631 0C:9621: A5 FC
	CLC                             ;C - - - - - 0x019633 0C:9623: 18
	ADC #$10                        ;C - - - - - 0x019634 0C:9624: 69 10
	STA objX,X                      ;C - - - - - 0x019636 0C:9626: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x019639 0C:9629: A5 2D
	ADC #$00                        ;C - - - - - 0x01963B 0C:962B: 69 00
	STA objXPage,X                  ;C - - - - - 0x01963D 0C:962D: 9D 80 03
	JMP loc_0C_965C                 ;C - - - - - 0x019640 0C:9630: 4C 5C 96
loc_0C_9633:
	JSR ApplyVelXSub                ;C - - - - - 0x019643 0C:9633: 20 A1 F1
	JMP loc_0C_965C                 ;C - - - - - 0x019646 0C:9636: 4C 5C 96
loc_0C_9639:
	LDA ram_00BC                    ;C - - - - - 0x019649 0C:9639: A5 BC
	BEQ loc_0C_9659                 ;C - - - - - 0x01964B 0C:963B: F0 1C
	LDA objX,X                      ;C - - - - - 0x01964D 0C:963D: BD 60 03
	SEC                             ;C - - - - - 0x019650 0C:9640: 38
	SBC scrollX                     ;C - - - - - 0x019651 0C:9641: E5 FC
	CMP #$F1                        ;C - - - - - 0x019653 0C:9643: C9 F1
	BCC loc_0C_9659                 ;C - - - - - 0x019655 0C:9645: 90 12
	LDA scrollX                     ;c - - - - - 0x019657 0C:9647: A5 FC
	CLC                             ;c - - - - - 0x019659 0C:9649: 18
	ADC #$F0                        ;c - - - - - 0x01965A 0C:964A: 69 F0
	STA objX,X                      ;c - - - - - 0x01965C 0C:964C: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x01965F 0C:964F: A5 2D
	ADC #$00                        ;c - - - - - 0x019661 0C:9651: 69 00
	STA objXPage,X                  ;c - - - - - 0x019663 0C:9653: 9D 80 03
	JMP loc_0C_965C                 ;c - - - - - 0x019666 0C:9656: 4C 5C 96
loc_0C_9659:
	JSR ApplyVelXAdd                ;C - - - - - 0x019669 0C:9659: 20 83 F1
loc_0C_965C:
	JSR ApplyVelY                   ;C - - - - - 0x01966C 0C:965C: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x01966F 0C:965F: BD 30 04
	BPL loc_0C_966C                 ;C - - - - - 0x019672 0C:9662: 10 08
	LDA objY,X                      ;C - - - - - 0x019674 0C:9664: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x019677 0C:9667: DD 30 05
	BCS loc_0C_966D                 ;C - - - - - 0x01967A 0C:966A: B0 01
loc_0C_966C:
	RTS                             ;C - - - - - 0x01967C 0C:966C: 60
loc_0C_966D:
	LDA objParamC,X                 ;C - - - - - 0x01967D 0C:966D: BD 30 05
	STA objY,X                      ;C - - - - - 0x019680 0C:9670: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x019683 0C:9673: 20 1F 9B
	LDA #$38                        ;C - - - - - 0x019686 0C:9676: A9 38
	STA objVelYLo,X                 ;C - - - - - 0x019688 0C:9678: 9D 20 04
	LDA #$02                        ;C - - - - - 0x01968B 0C:967B: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x01968D 0C:967D: 9D 30 04
	LDA #$80                        ;C - - - - - 0x019690 0C:9680: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x019692 0C:9682: 9D 00 04
	LDA #$00                        ;C - - - - - 0x019695 0C:9685: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x019697 0C:9687: 9D 10 04
	INC objActive,X                 ;C - - - - - 0x01969A 0C:968A: FE 00 03
ofs_0C_968D:
	LDA objDownState,X              ;C - - - - - 0x01969D 0C:968D: BD C0 04
	CMP #$FE                        ;C - - - - - 0x0196A0 0C:9690: C9 FE
	BEQ loc_0C_96C5                 ;C - - - - - 0x0196A2 0C:9692: F0 31
	CMP #$FD                        ;C - - - - - 0x0196A4 0C:9694: C9 FD
	BEQ loc_0C_96C5                 ;C - - - - - 0x0196A6 0C:9696: F0 2D
	LDA objFacing,X                 ;C - - - - - 0x0196A8 0C:9698: BD 60 04
	AND #$01                        ;C - - - - - 0x0196AB 0C:969B: 29 01
	BEQ loc_0C_96C8                 ;C - - - - - 0x0196AD 0C:969D: F0 29
	LDA ram_00BC                    ;C - - - - - 0x0196AF 0C:969F: A5 BC
	BEQ loc_0C_96BF                 ;C - - - - - 0x0196B1 0C:96A1: F0 1C
	LDA objX,X                      ;C - - - - - 0x0196B3 0C:96A3: BD 60 03
	SEC                             ;C - - - - - 0x0196B6 0C:96A6: 38
	SBC scrollX                     ;C - - - - - 0x0196B7 0C:96A7: E5 FC
	CMP #$10                        ;C - - - - - 0x0196B9 0C:96A9: C9 10
	BCS loc_0C_96BF                 ;C - - - - - 0x0196BB 0C:96AB: B0 12
	LDA scrollX                     ;C - - - - - 0x0196BD 0C:96AD: A5 FC
	CLC                             ;C - - - - - 0x0196BF 0C:96AF: 18
	ADC #$10                        ;C - - - - - 0x0196C0 0C:96B0: 69 10
	STA objX,X                      ;C - - - - - 0x0196C2 0C:96B2: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0196C5 0C:96B5: A5 2D
	ADC #$00                        ;C - - - - - 0x0196C7 0C:96B7: 69 00
	STA objXPage,X                  ;C - - - - - 0x0196C9 0C:96B9: 9D 80 03
	JMP loc_0C_96EB                 ;C - - - - - 0x0196CC 0C:96BC: 4C EB 96
loc_0C_96BF:
	JSR ApplyVelXSub                ;C - - - - - 0x0196CF 0C:96BF: 20 A1 F1
	JMP loc_0C_96EB                 ;C - - - - - 0x0196D2 0C:96C2: 4C EB 96
loc_0C_96C5:
	JMP loc_0C_9730                 ;C - - - - - 0x0196D5 0C:96C5: 4C 30 97
loc_0C_96C8:
	LDA ram_00BC                    ;C - - - - - 0x0196D8 0C:96C8: A5 BC
	BEQ loc_0C_96E8                 ;C - - - - - 0x0196DA 0C:96CA: F0 1C
	LDA objX,X                      ;C - - - - - 0x0196DC 0C:96CC: BD 60 03
	SEC                             ;C - - - - - 0x0196DF 0C:96CF: 38
	SBC scrollX                     ;C - - - - - 0x0196E0 0C:96D0: E5 FC
	CMP #$F1                        ;C - - - - - 0x0196E2 0C:96D2: C9 F1
	BCC loc_0C_96E8                 ;C - - - - - 0x0196E4 0C:96D4: 90 12
	LDA scrollX                     ;c - - - - - 0x0196E6 0C:96D6: A5 FC
	CLC                             ;c - - - - - 0x0196E8 0C:96D8: 18
	ADC #$F0                        ;c - - - - - 0x0196E9 0C:96D9: 69 F0
	STA objX,X                      ;c - - - - - 0x0196EB 0C:96DB: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x0196EE 0C:96DE: A5 2D
	ADC #$00                        ;c - - - - - 0x0196F0 0C:96E0: 69 00
	STA objXPage,X                  ;c - - - - - 0x0196F2 0C:96E2: 9D 80 03
	JMP loc_0C_96EB                 ;c - - - - - 0x0196F5 0C:96E5: 4C EB 96
loc_0C_96E8:
	JSR ApplyVelXAdd                ;C - - - - - 0x0196F8 0C:96E8: 20 83 F1
loc_0C_96EB:
	JSR ApplyVelY                   ;C - - - - - 0x0196FB 0C:96EB: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x0196FE 0C:96EE: BD 30 04
	BPL loc_0C_96FB                 ;C - - - - - 0x019701 0C:96F1: 10 08
	LDA objY,X                      ;C - - - - - 0x019703 0C:96F3: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x019706 0C:96F6: DD 30 05
	BCS loc_0C_96FC                 ;C - - - - - 0x019709 0C:96F9: B0 01
loc_0C_96FB:
	RTS                             ;C - - - - - 0x01970B 0C:96FB: 60
loc_0C_96FC:
	LDA objParamC,X                 ;C - - - - - 0x01970C 0C:96FC: BD 30 05
	STA objY,X                      ;C - - - - - 0x01970F 0C:96FF: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x019712 0C:9702: 20 1F 9B
	LDA attackType                  ;C - - - - - 0x019715 0C:9705: A5 A7
	STA ram_0151                    ;C - - - - - 0x019717 0C:9707: 8D 51 01
	LDA #$05                        ;C - - - - - 0x01971A 0C:970A: A9 05
	STA attackType                  ;C - - - - - 0x01971C 0C:970C: 85 A7
	JSR EnemyHitCheck               ;C - - - - - 0x01971E 0C:970E: 20 F0 84
	LDA objLife,X                   ;C - - - - - 0x019721 0C:9711: BD 90 04
	BPL loc_0C_9726                 ;C - - - - - 0x019724 0C:9714: 10 10
	JSR PlayerSpecialDispatch       ;C - - - - - 0x019726 0C:9716: 20 E3 89
	LDA #$00                        ;C - - - - - 0x019729 0C:9719: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x01972B 0C:971B: 9D 40 04
	INC objActive,X                 ;C - - - - - 0x01972E 0C:971E: FE 00 03
	INC enemiesDefeated             ;C - - - - - 0x019731 0C:9721: E6 54
	JMP EnemySetDownAnimB           ;C - - - - - 0x019733 0C:9723: 4C 7A 9C
loc_0C_9726:
	LDA ram_0151                    ;C - - - - - 0x019736 0C:9726: AD 51 01
	STA attackType                  ;C - - - - - 0x019739 0C:9729: 85 A7
	LDA #$FF                        ;C - - - - - 0x01973B 0C:972B: A9 FF
	STA objDownState,X              ;C - - - - - 0x01973D 0C:972D: 9D C0 04
loc_0C_9730:
	JMP EnemyKnockdownStep          ;C - - - - - 0x019740 0C:9730: 4C FC 9B
; kind 02: thrown / launched object
EnemyAI_Launched:
	LDA objActive,X                 ;C - - J - - 0x019743 0C:9733: BD 00 03
	AND #$0F                        ;C - - - - - 0x019746 0C:9736: 29 0F
	BNE loc_0C_978A                 ;C - - - - - 0x019748 0C:9738: D0 50
	STA objStep,X                   ;C - - - - - 0x01974A 0C:973A: 9D 00 05
	STA objVelXHi,X                 ;C - - - - - 0x01974D 0C:973D: 9D 10 04
	LDA #$99                        ;C - - - - - 0x019750 0C:9740: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x019752 0C:9742: 9D 00 04
	LDA attackType                  ;C - - - - - 0x019755 0C:9745: A5 A7
	CMP #$07                        ;C - - - - - 0x019757 0C:9747: C9 07
	BNE loc_0C_975C                 ;C - - - - - 0x019759 0C:9749: D0 11
	LDA #$CC                        ;C - - - - - 0x01975B 0C:974B: A9 CC
	STA objVelXLo,X                 ;C - - - - - 0x01975D 0C:974D: 9D 00 04
	LDA #$98                        ;C - - - - - 0x019760 0C:9750: A9 98
	STA objVelYLo,X                 ;C - - - - - 0x019762 0C:9752: 9D 20 04
	LDA #$04                        ;C - - - - - 0x019765 0C:9755: A9 04
	STA objVelYHi,X                 ;C - - - - - 0x019767 0C:9757: 9D 30 04
	BNE loc_0C_976A                 ;C - - - - - 0x01976A 0C:975A: D0 0E
loc_0C_975C:
	LDY playerLevel                 ;C - - - - - 0x01976C 0C:975C: A4 6B
	LDA EnemyAI_LaunchedTbl_9A33,Y  ;C - - - - - 0x01976E 0C:975E: B9 33 9A
	STA objVelYLo,X                 ;C - - - - - 0x019771 0C:9761: 9D 20 04
	LDA EnemyAI_LaunchedTbl_9A39,Y  ;C - - - - - 0x019774 0C:9764: B9 39 9A
	STA objVelYHi,X                 ;C - - - - - 0x019777 0C:9767: 9D 30 04
loc_0C_976A:
	JSR EnemyFacePlayerFlag         ;C - - - - - 0x01977A 0C:976A: 20 1B 98
	INC objActive,X                 ;C - - - - - 0x01977D 0C:976D: FE 00 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x019780 0C:9770: 20 55 9C
	LDA #$10                        ;C - - - - - 0x019783 0C:9773: A9 10
	STA objParamA,X                 ;C - - - - - 0x019785 0C:9775: 9D 10 05
	JSR FaceToPlayer                ;C - - - - - 0x019788 0C:9778: 20 14 F3
	LDA playerFacing                ;C - - - - - 0x01978B 0C:977B: A5 31
	CMP objFacing,X                 ;C - - - - - 0x01978D 0C:977D: DD 60 04
	BEQ loc_0C_9787                 ;C - - - - - 0x019790 0C:9780: F0 05
	LDA objFacing,X                 ;C - - - - - 0x019792 0C:9782: BD 60 04
	EOR #$03                        ;C - - - - - 0x019795 0C:9785: 49 03
loc_0C_9787:
	STA objFacing,X                 ;C - - - - - 0x019797 0C:9787: 9D 60 04
loc_0C_978A:
	LDA objStep,X                   ;C - - - - - 0x01979A 0C:978A: BD 00 05
	CMP #$02                        ;C - - - - - 0x01979D 0C:978D: C9 02
	BNE loc_0C_9794                 ;C - - - - - 0x01979F 0C:978F: D0 03
	JMP loc_0C_9818                 ;C - - - - - 0x0197A1 0C:9791: 4C 18 98
loc_0C_9794:
	LDA objFacing,X                 ;C - - - - - 0x0197A4 0C:9794: BD 60 04
	AND #$01                        ;C - - - - - 0x0197A7 0C:9797: 29 01
	BEQ loc_0C_97C1                 ;C - - - - - 0x0197A9 0C:9799: F0 26
	LDA ram_00BC                    ;C - - - - - 0x0197AB 0C:979B: A5 BC
	BEQ loc_0C_97BB                 ;C - - - - - 0x0197AD 0C:979D: F0 1C
	LDA objX,X                      ;C - - - - - 0x0197AF 0C:979F: BD 60 03
	SEC                             ;C - - - - - 0x0197B2 0C:97A2: 38
	SBC scrollX                     ;C - - - - - 0x0197B3 0C:97A3: E5 FC
	CMP #$F1                        ;C - - - - - 0x0197B5 0C:97A5: C9 F1
	BCC loc_0C_97BB                 ;C - - - - - 0x0197B7 0C:97A7: 90 12
	LDA scrollX                     ;C - - - - - 0x0197B9 0C:97A9: A5 FC
	CLC                             ;C - - - - - 0x0197BB 0C:97AB: 18
	ADC #$F0                        ;C - - - - - 0x0197BC 0C:97AC: 69 F0
	STA objX,X                      ;C - - - - - 0x0197BE 0C:97AE: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0197C1 0C:97B1: A5 2D
	ADC #$00                        ;C - - - - - 0x0197C3 0C:97B3: 69 00
	STA objXPage,X                  ;C - - - - - 0x0197C5 0C:97B5: 9D 80 03
	JMP loc_0C_97E4                 ;C - - - - - 0x0197C8 0C:97B8: 4C E4 97
loc_0C_97BB:
	JSR ApplyVelXAdd                ;C - - - - - 0x0197CB 0C:97BB: 20 83 F1
	JMP loc_0C_97E4                 ;C - - - - - 0x0197CE 0C:97BE: 4C E4 97
loc_0C_97C1:
	LDA ram_00BC                    ;C - - - - - 0x0197D1 0C:97C1: A5 BC
	BEQ loc_0C_97E1                 ;C - - - - - 0x0197D3 0C:97C3: F0 1C
	LDA objX,X                      ;C - - - - - 0x0197D5 0C:97C5: BD 60 03
	SEC                             ;C - - - - - 0x0197D8 0C:97C8: 38
	SBC scrollX                     ;C - - - - - 0x0197D9 0C:97C9: E5 FC
	CMP #$10                        ;C - - - - - 0x0197DB 0C:97CB: C9 10
	BCS loc_0C_97E1                 ;C - - - - - 0x0197DD 0C:97CD: B0 12
	LDA scrollX                     ;C - - - - - 0x0197DF 0C:97CF: A5 FC
	CLC                             ;C - - - - - 0x0197E1 0C:97D1: 18
	ADC #$10                        ;C - - - - - 0x0197E2 0C:97D2: 69 10
	STA objX,X                      ;C - - - - - 0x0197E4 0C:97D4: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0197E7 0C:97D7: A5 2D
	ADC #$00                        ;C - - - - - 0x0197E9 0C:97D9: 69 00
	STA objXPage,X                  ;C - - - - - 0x0197EB 0C:97DB: 9D 80 03
	JMP loc_0C_97E4                 ;C - - - - - 0x0197EE 0C:97DE: 4C E4 97
loc_0C_97E1:
	JSR ApplyVelXSub                ;C - - - - - 0x0197F1 0C:97E1: 20 A1 F1
loc_0C_97E4:
	JSR ApplyVelY                   ;C - - - - - 0x0197F4 0C:97E4: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x0197F7 0C:97E7: BD 30 04
	BPL loc_0C_9817                 ;C - - - - - 0x0197FA 0C:97EA: 10 2B
	LDA objY,X                      ;C - - - - - 0x0197FC 0C:97EC: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x0197FF 0C:97EF: DD 30 05
	BCC loc_0C_9817                 ;C - - - - - 0x019802 0C:97F2: 90 23
	LDA objParamC,X                 ;C - - - - - 0x019804 0C:97F4: BD 30 05
	STA objY,X                      ;C - - - - - 0x019807 0C:97F7: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x01980A 0C:97FA: 20 1F 9B
	LDA #$20                        ;C - - - - - 0x01980D 0C:97FD: A9 20
	JSR QueueSound                  ;C - - - - - 0x01980F 0C:97FF: 20 4C F3
	LDA #$38                        ;C - - - - - 0x019812 0C:9802: A9 38
	STA objVelYLo,X                 ;C - - - - - 0x019814 0C:9804: 9D 20 04
	LDA #$02                        ;C - - - - - 0x019817 0C:9807: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x019819 0C:9809: 9D 30 04
	LDA #$80                        ;C - - - - - 0x01981C 0C:980C: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x01981E 0C:980E: 9D 00 04
	INC objStep,X                   ;C - - - - - 0x019821 0C:9811: FE 00 05
	JSR EnemySetDownAnimB           ;C - - - - - 0x019824 0C:9814: 20 7A 9C
loc_0C_9817:
	RTS                             ;C - - - - - 0x019827 0C:9817: 60
loc_0C_9818:
	JMP EnemyKnockdownStep          ;C - - - - - 0x019828 0C:9818: 4C FC 9B
EnemyFacePlayerFlag:
	JSR FaceToPlayer                ;C - - - - - 0x01982B 0C:981B: 20 14 F3
	LDA playerFacing                ;C - - - - - 0x01982E 0C:981E: A5 31
	CMP objFacing,X                 ;C - - - - - 0x019830 0C:9820: DD 60 04
	BEQ loc_0C_982E                 ;C - - - - - 0x019833 0C:9823: F0 09
	LDA objFacing,X                 ;C - - - - - 0x019835 0C:9825: BD 60 04
	EOR #$03                        ;C - - - - - 0x019838 0C:9828: 49 03
	STA objFacing,X                 ;C - - - - - 0x01983A 0C:982A: 9D 60 04
	RTS                             ;C - - - - - 0x01983D 0C:982D: 60
loc_0C_982E:
	LDA objFacing,X                 ;C - - - - - 0x01983E 0C:982E: BD 60 04
	AND #$01                        ;C - - - - - 0x019841 0C:9831: 29 01
	BEQ loc_0C_9838                 ;C - - - - - 0x019843 0C:9833: F0 03
	JMP ClearObjFlag40              ;C - - - - - 0x019845 0C:9835: 4C 99 F0
loc_0C_9838:
	JMP SetObjFlag40                ;C - - - - - 0x019848 0C:9838: 4C 90 F0
; kinds 03, 05
EnemyAI_KnockedBack:
	LDA objActive,X                 ;C - - J - - 0x01984B 0C:983B: BD 00 03
	AND #$0F                        ;C - - - - - 0x01984E 0C:983E: 29 0F
	BNE loc_0C_9874                 ;C - - - - - 0x019850 0C:9840: D0 32
	STA objStep,X                   ;C - - - - - 0x019852 0C:9842: 9D 00 05
	STA objVelXHi,X                 ;C - - - - - 0x019855 0C:9845: 9D 10 04
	LDA #$99                        ;C - - - - - 0x019858 0C:9848: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x01985A 0C:984A: 9D 00 04
	LDA #$10                        ;C - - - - - 0x01985D 0C:984D: A9 10
	STA objParamA,X                 ;C - - - - - 0x01985F 0C:984F: 9D 10 05
	LDA objKind,X                   ;C - - - - - 0x019862 0C:9852: BD 20 03
	CMP #$03                        ;C - - - - - 0x019865 0C:9855: C9 03
	BNE loc_0C_985C                 ;C - - - - - 0x019867 0C:9857: D0 03
	JMP loc_0C_986E                 ;C - - - - - 0x019869 0C:9859: 4C 6E 98
loc_0C_985C:
	JSR FaceToPlayer                ;C - - - - - 0x01986C 0C:985C: 20 14 F3
	LDA playerFacing                ;C - - - - - 0x01986F 0C:985F: A5 31
	CMP objFacing,X                 ;C - - - - - 0x019871 0C:9861: DD 60 04
	BNE loc_0C_986B                 ;C - - - - - 0x019874 0C:9864: D0 05
	LDA objFacing,X                 ;C - - - - - 0x019876 0C:9866: BD 60 04
	EOR #$03                        ;C - - - - - 0x019879 0C:9869: 49 03
loc_0C_986B:
	STA objFacing,X                 ;C - - - - - 0x01987B 0C:986B: 9D 60 04
loc_0C_986E:
	INC objActive,X                 ;C - - - - - 0x01987E 0C:986E: FE 00 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x019881 0C:9871: 20 55 9C
loc_0C_9874:
	LDA objKind,X                   ;C - - - - - 0x019884 0C:9874: BD 20 03
	CMP #$03                        ;C - - - - - 0x019887 0C:9877: C9 03
	BNE loc_0C_9884                 ;C - - - - - 0x019889 0C:9879: D0 09
	LDA objStep,X                   ;C - - - - - 0x01988B 0C:987B: BD 00 05
	CMP #$02                        ;C - - - - - 0x01988E 0C:987E: C9 02
	BEQ loc_0C_98B8                 ;C - - - - - 0x019890 0C:9880: F0 36
	BNE loc_0C_988B                 ;C - - - - - 0x019892 0C:9882: D0 07
loc_0C_9884:
	LDA objStep,X                   ;C - - - - - 0x019894 0C:9884: BD 00 05
	CMP #$02                        ;C - - - - - 0x019897 0C:9887: C9 02
	BEQ loc_0C_98B8                 ;C - - - - - 0x019899 0C:9889: F0 2D
loc_0C_988B:
	LDA objFacing,X                 ;C - - - - - 0x01989B 0C:988B: BD 60 04
	AND #$01                        ;C - - - - - 0x01989E 0C:988E: 29 01
	BEQ loc_0C_98BB                 ;C - - - - - 0x0198A0 0C:9890: F0 29
	LDA ram_00BC                    ;C - - - - - 0x0198A2 0C:9892: A5 BC
	BEQ loc_0C_98B2                 ;C - - - - - 0x0198A4 0C:9894: F0 1C
	LDA objX,X                      ;C - - - - - 0x0198A6 0C:9896: BD 60 03
	SEC                             ;C - - - - - 0x0198A9 0C:9899: 38
	SBC scrollX                     ;C - - - - - 0x0198AA 0C:989A: E5 FC
	CMP #$F1                        ;C - - - - - 0x0198AC 0C:989C: C9 F1
	BCC loc_0C_98B2                 ;C - - - - - 0x0198AE 0C:989E: 90 12
	LDA scrollX                     ;C - - - - - 0x0198B0 0C:98A0: A5 FC
	CLC                             ;C - - - - - 0x0198B2 0C:98A2: 18
	ADC #$F0                        ;C - - - - - 0x0198B3 0C:98A3: 69 F0
	STA objX,X                      ;C - - - - - 0x0198B5 0C:98A5: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0198B8 0C:98A8: A5 2D
	ADC #$00                        ;C - - - - - 0x0198BA 0C:98AA: 69 00
	STA objXPage,X                  ;C - - - - - 0x0198BC 0C:98AC: 9D 80 03
	JMP loc_0C_98DE                 ;C - - - - - 0x0198BF 0C:98AF: 4C DE 98
loc_0C_98B2:
	JSR ApplyVelXAdd                ;C - - - - - 0x0198C2 0C:98B2: 20 83 F1
	JMP loc_0C_98DE                 ;C - - - - - 0x0198C5 0C:98B5: 4C DE 98
loc_0C_98B8:
	JMP loc_0C_9912                 ;C - - - - - 0x0198C8 0C:98B8: 4C 12 99
loc_0C_98BB:
	LDA ram_00BC                    ;C - - - - - 0x0198CB 0C:98BB: A5 BC
	BEQ loc_0C_98DB                 ;C - - - - - 0x0198CD 0C:98BD: F0 1C
	LDA objX,X                      ;C - - - - - 0x0198CF 0C:98BF: BD 60 03
	SEC                             ;C - - - - - 0x0198D2 0C:98C2: 38
	SBC scrollX                     ;C - - - - - 0x0198D3 0C:98C3: E5 FC
	CMP #$10                        ;C - - - - - 0x0198D5 0C:98C5: C9 10
	BCS loc_0C_98DB                 ;C - - - - - 0x0198D7 0C:98C7: B0 12
	LDA scrollX                     ;C - - - - - 0x0198D9 0C:98C9: A5 FC
	CLC                             ;C - - - - - 0x0198DB 0C:98CB: 18
	ADC #$10                        ;C - - - - - 0x0198DC 0C:98CC: 69 10
	STA objX,X                      ;C - - - - - 0x0198DE 0C:98CE: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0198E1 0C:98D1: A5 2D
	ADC #$00                        ;C - - - - - 0x0198E3 0C:98D3: 69 00
	STA objXPage,X                  ;C - - - - - 0x0198E5 0C:98D5: 9D 80 03
	JMP loc_0C_98DE                 ;C - - - - - 0x0198E8 0C:98D8: 4C DE 98
loc_0C_98DB:
	JSR ApplyVelXSub                ;C - - - - - 0x0198EB 0C:98DB: 20 A1 F1
loc_0C_98DE:
	JSR ApplyVelY                   ;C - - - - - 0x0198EE 0C:98DE: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x0198F1 0C:98E1: BD 30 04
	BPL loc_0C_9911                 ;C - - - - - 0x0198F4 0C:98E4: 10 2B
	LDA objY,X                      ;C - - - - - 0x0198F6 0C:98E6: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x0198F9 0C:98E9: DD 30 05
	BCC loc_0C_9911                 ;C - - - - - 0x0198FC 0C:98EC: 90 23
	LDA objParamC,X                 ;C - - - - - 0x0198FE 0C:98EE: BD 30 05
	STA objY,X                      ;C - - - - - 0x019901 0C:98F1: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x019904 0C:98F4: 20 1F 9B
	LDA #$20                        ;C - - - - - 0x019907 0C:98F7: A9 20
	JSR QueueSound                  ;C - - - - - 0x019909 0C:98F9: 20 4C F3
	LDA #$38                        ;C - - - - - 0x01990C 0C:98FC: A9 38
	STA objVelYLo,X                 ;C - - - - - 0x01990E 0C:98FE: 9D 20 04
	LDA #$02                        ;C - - - - - 0x019911 0C:9901: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x019913 0C:9903: 9D 30 04
	LDA #$80                        ;C - - - - - 0x019916 0C:9906: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x019918 0C:9908: 9D 00 04
	INC objStep,X                   ;C - - - - - 0x01991B 0C:990B: FE 00 05
	JMP EnemySetDownAnimB           ;C - - - - - 0x01991E 0C:990E: 4C 7A 9C
loc_0C_9911:
	RTS                             ;C - - - - - 0x019921 0C:9911: 60
loc_0C_9912:
	LDA objKind,X                   ;C - - - - - 0x019922 0C:9912: BD 20 03
	CMP #$03                        ;C - - - - - 0x019925 0C:9915: C9 03
	BEQ loc_0C_9923                 ;C - - - - - 0x019927 0C:9917: F0 0A
	BNE loc_0C_9920                 ;C - - - - - 0x019929 0C:9919: D0 05
loc_0C_991B:
	LDA #$FF                        ;C - - - - - 0x01992B 0C:991B: A9 FF
	STA objDownState,X              ;C - - - - - 0x01992D 0C:991D: 9D C0 04
loc_0C_9920:
	JMP EnemyKnockdownStep          ;C - - - - - 0x019930 0C:9920: 4C FC 9B
loc_0C_9923:
	LDA objActive,X                 ;C - - - - - 0x019933 0C:9923: BD 00 03
	AND #$02                        ;C - - - - - 0x019936 0C:9926: 29 02
	BNE loc_0C_994A                 ;C - - - - - 0x019938 0C:9928: D0 20
	LDA objDownState,X              ;C - - - - - 0x01993A 0C:992A: BD C0 04
	CMP #$FE                        ;C - - - - - 0x01993D 0C:992D: C9 FE
	BEQ loc_0C_9920                 ;C - - - - - 0x01993F 0C:992F: F0 EF
	CMP #$FD                        ;C - - - - - 0x019941 0C:9931: C9 FD
	BEQ loc_0C_9920                 ;C - - - - - 0x019943 0C:9933: F0 EB
	LDA #$09                        ;C - - - - - 0x019945 0C:9935: A9 09
	STA attackType                  ;C - - - - - 0x019947 0C:9937: 85 A7
	JSR EnemyHitCheck               ;C - - - - - 0x019949 0C:9939: 20 F0 84
	LDA #$00                        ;C - - - - - 0x01994C 0C:993C: A9 00
	STA attackType                  ;C - - - - - 0x01994E 0C:993E: 85 A7
	LDA objLife,X                   ;C - - - - - 0x019950 0C:9940: BD 90 04
	BPL loc_0C_991B                 ;C - - - - - 0x019953 0C:9943: 10 D6
	INC objActive,X                 ;C - - - - - 0x019955 0C:9945: FE 00 03
	INC enemiesDefeated             ;C - - - - - 0x019958 0C:9948: E6 54
loc_0C_994A:
	DEC objParamA,X                 ;C - - - - - 0x01995A 0C:994A: DE 10 05
	LDA objParamA,X                 ;C - - - - - 0x01995D 0C:994D: BD 10 05
	BEQ loc_0C_995F                 ;C - - - - - 0x019960 0C:9950: F0 0D
	AND #$01                        ;C - - - - - 0x019962 0C:9952: 29 01
	BNE loc_0C_995B                 ;C - - - - - 0x019964 0C:9954: D0 05
	JSR SetObjFlag04                ;C - - - - - 0x019966 0C:9956: 20 62 9B
	BNE loc_0C_995E                 ;C - - - - - 0x019969 0C:9959: D0 03
loc_0C_995B:
	JSR ClearObjFlag04              ;C - - - - - 0x01996B 0C:995B: 20 6B 9B
loc_0C_995E:
	RTS                             ;C - - - - - 0x01996E 0C:995E: 60
loc_0C_995F:
	JMP ClearObject                 ;C - - - - - 0x01996F 0C:995F: 4C BE F2
; kind 06
EnemyAI_Falling:
	LDA objActive,X                 ;C - - J - - 0x019972 0C:9962: BD 00 03
	AND #$0F                        ;C - - - - - 0x019975 0C:9965: 29 0F
	BNE loc_0C_99A2                 ;C - - - - - 0x019977 0C:9967: D0 39
	STA objStep,X                   ;C - - - - - 0x019979 0C:9969: 9D 00 05
	STA objVelXHi,X                 ;C - - - - - 0x01997C 0C:996C: 9D 10 04
	LDA #$99                        ;C - - - - - 0x01997F 0C:996F: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x019981 0C:9971: 9D 00 04
	LDA objAnim,X                   ;C - - - - - 0x019984 0C:9974: BD 80 05
	CMP #$BB                        ;C - - - - - 0x019987 0C:9977: C9 BB
	BEQ loc_0C_9986                 ;C - - - - - 0x019989 0C:9979: F0 0B
	CMP #$C7                        ;C - - - - - 0x01998B 0C:997B: C9 C7
	BEQ loc_0C_9986                 ;C - - - - - 0x01998D 0C:997D: F0 07
	CMP #$FD                        ;C - - - - - 0x01998F 0C:997F: C9 FD
	BEQ loc_0C_9986                 ;C - - - - - 0x019991 0C:9981: F0 03
	JSR PlayerSpecialDispatch       ;C - - - - - 0x019993 0C:9983: 20 E3 89
loc_0C_9986:
	LDY playerLevel                 ;C - - - - - 0x019996 0C:9986: A4 6B
	LDA EnemyAI_LaunchedTbl_9A33,Y  ;C - - - - - 0x019998 0C:9988: B9 33 9A
	STA objVelYLo,X                 ;C - - - - - 0x01999B 0C:998B: 9D 20 04
	LDA EnemyAI_LaunchedTbl_9A39,Y  ;C - - - - - 0x01999E 0C:998E: B9 39 9A
	STA objVelYHi,X                 ;C - - - - - 0x0199A1 0C:9991: 9D 30 04
	JSR EnemyFacePlayerFlag         ;C - - - - - 0x0199A4 0C:9994: 20 1B 98
	INC objActive,X                 ;C - - - - - 0x0199A7 0C:9997: FE 00 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x0199AA 0C:999A: 20 55 9C
	LDA #$10                        ;C - - - - - 0x0199AD 0C:999D: A9 10
	STA objParamA,X                 ;C - - - - - 0x0199AF 0C:999F: 9D 10 05
loc_0C_99A2:
	LDA objStep,X                   ;C - - - - - 0x0199B2 0C:99A2: BD 00 05
	CMP #$02                        ;C - - - - - 0x0199B5 0C:99A5: C9 02
	BNE loc_0C_99AC                 ;C - - - - - 0x0199B7 0C:99A7: D0 03
	JMP loc_0C_9A2D                 ;C - - - - - 0x0199B9 0C:99A9: 4C 2D 9A
loc_0C_99AC:
	LDA objFacing,X                 ;C - - - - - 0x0199BC 0C:99AC: BD 60 04
	AND #$01                        ;C - - - - - 0x0199BF 0C:99AF: 29 01
	BEQ loc_0C_99D9                 ;C - - - - - 0x0199C1 0C:99B1: F0 26
	LDA ram_00BC                    ;C - - - - - 0x0199C3 0C:99B3: A5 BC
	BEQ loc_0C_99D3                 ;C - - - - - 0x0199C5 0C:99B5: F0 1C
	LDA objX,X                      ;C - - - - - 0x0199C7 0C:99B7: BD 60 03
	SEC                             ;C - - - - - 0x0199CA 0C:99BA: 38
	SBC scrollX                     ;C - - - - - 0x0199CB 0C:99BB: E5 FC
	CMP #$F1                        ;C - - - - - 0x0199CD 0C:99BD: C9 F1
	BCC loc_0C_99D3                 ;C - - - - - 0x0199CF 0C:99BF: 90 12
	LDA scrollX                     ;C - - - - - 0x0199D1 0C:99C1: A5 FC
	CLC                             ;C - - - - - 0x0199D3 0C:99C3: 18
	ADC #$F0                        ;C - - - - - 0x0199D4 0C:99C4: 69 F0
	STA objX,X                      ;C - - - - - 0x0199D6 0C:99C6: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0199D9 0C:99C9: A5 2D
	ADC #$00                        ;C - - - - - 0x0199DB 0C:99CB: 69 00
	STA objXPage,X                  ;C - - - - - 0x0199DD 0C:99CD: 9D 80 03
	JMP loc_0C_99FC                 ;C - - - - - 0x0199E0 0C:99D0: 4C FC 99
loc_0C_99D3:
	JSR ApplyVelXAdd                ;C - - - - - 0x0199E3 0C:99D3: 20 83 F1
	JMP loc_0C_99FC                 ;C - - - - - 0x0199E6 0C:99D6: 4C FC 99
loc_0C_99D9:
	LDA ram_00BC                    ;C - - - - - 0x0199E9 0C:99D9: A5 BC
	BEQ loc_0C_99F9                 ;C - - - - - 0x0199EB 0C:99DB: F0 1C
	LDA objX,X                      ;C - - - - - 0x0199ED 0C:99DD: BD 60 03
	SEC                             ;C - - - - - 0x0199F0 0C:99E0: 38
	SBC scrollX                     ;C - - - - - 0x0199F1 0C:99E1: E5 FC
	CMP #$10                        ;C - - - - - 0x0199F3 0C:99E3: C9 10
	BCS loc_0C_99F9                 ;C - - - - - 0x0199F5 0C:99E5: B0 12
	LDA scrollX                     ;C - - - - - 0x0199F7 0C:99E7: A5 FC
	CLC                             ;C - - - - - 0x0199F9 0C:99E9: 18
	ADC #$10                        ;C - - - - - 0x0199FA 0C:99EA: 69 10
	STA objX,X                      ;C - - - - - 0x0199FC 0C:99EC: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x0199FF 0C:99EF: A5 2D
	ADC #$00                        ;C - - - - - 0x019A01 0C:99F1: 69 00
	STA objXPage,X                  ;C - - - - - 0x019A03 0C:99F3: 9D 80 03
	JMP loc_0C_99FC                 ;C - - - - - 0x019A06 0C:99F6: 4C FC 99
loc_0C_99F9:
	JSR ApplyVelXSub                ;C - - - - - 0x019A09 0C:99F9: 20 A1 F1
loc_0C_99FC:
	JSR ApplyVelY                   ;C - - - - - 0x019A0C 0C:99FC: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x019A0F 0C:99FF: BD 30 04
	BPL loc_0C_9A2C                 ;C - - - - - 0x019A12 0C:9A02: 10 28
	LDA objY,X                      ;C - - - - - 0x019A14 0C:9A04: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x019A17 0C:9A07: DD 30 05
	BCC loc_0C_9A2C                 ;C - - - - - 0x019A1A 0C:9A0A: 90 20
	LDA objParamC,X                 ;C - - - - - 0x019A1C 0C:9A0C: BD 30 05
	STA objY,X                      ;C - - - - - 0x019A1F 0C:9A0F: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x019A22 0C:9A12: 20 1F 9B
	LDA #$20                        ;C - - - - - 0x019A25 0C:9A15: A9 20
	JSR QueueSound                  ;C - - - - - 0x019A27 0C:9A17: 20 4C F3
	LDA #$38                        ;C - - - - - 0x019A2A 0C:9A1A: A9 38
	STA objVelYLo,X                 ;C - - - - - 0x019A2C 0C:9A1C: 9D 20 04
	LDA #$02                        ;C - - - - - 0x019A2F 0C:9A1F: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x019A31 0C:9A21: 9D 30 04
	LDA #$80                        ;C - - - - - 0x019A34 0C:9A24: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x019A36 0C:9A26: 9D 00 04
	INC objStep,X                   ;C - - - - - 0x019A39 0C:9A29: FE 00 05
loc_0C_9A2C:
	RTS                             ;C - - - - - 0x019A3C 0C:9A2C: 60
loc_0C_9A2D:
	JSR EnemySetDownAnimB           ;C - - - - - 0x019A3D 0C:9A2D: 20 7A 9C
	JMP loc_0C_9B07                 ;C - - - - - 0x019A40 0C:9A30: 4C 07 9B
EnemyAI_LaunchedTbl_9A33:
	.byte $9E,$E8,$18,$88,$38,$A8   ;- D 0 - - - 0x019A43 0C:9A33:
EnemyAI_LaunchedTbl_9A39:
	.byte $03,$03,$04,$04,$05,$05   ;- D 0 - - - 0x019A49 0C:9A39:
; kinds 07, 16
EnemyAI_Kind07_16:
	LDA objActive,X                 ;C - - J - - 0x019A4F 0C:9A3F: BD 00 03
	AND #$0F                        ;C - - - - - 0x019A52 0C:9A42: 29 0F
	BNE loc_0C_9A7E                 ;C - - - - - 0x019A54 0C:9A44: D0 38
	STA objStep,X                   ;C - - - - - 0x019A56 0C:9A46: 9D 00 05
	STA objVelXHi,X                 ;C - - - - - 0x019A59 0C:9A49: 9D 10 04
	LDA #$99                        ;C - - - - - 0x019A5C 0C:9A4C: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x019A5E 0C:9A4E: 9D 00 04
	LDA objAnim,X                   ;C - - - - - 0x019A61 0C:9A51: BD 80 05
	CMP #$BB                        ;C - - - - - 0x019A64 0C:9A54: C9 BB
	BEQ loc_0C_9A5F                 ;C - - - - - 0x019A66 0C:9A56: F0 07
	CMP #$C7                        ;C - - - - - 0x019A68 0C:9A58: C9 C7
	BEQ loc_0C_9A5F                 ;C - - - - - 0x019A6A 0C:9A5A: F0 03
	JSR PlayerSpecialDispatch       ;C - - - - - 0x019A6C 0C:9A5C: 20 E3 89
loc_0C_9A5F:
	LDA #$9E                        ;C - - - - - 0x019A6F 0C:9A5F: A9 9E
	STA objVelYLo,X                 ;C - - - - - 0x019A71 0C:9A61: 9D 20 04
	LDA #$03                        ;C - - - - - 0x019A74 0C:9A64: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x019A76 0C:9A66: 9D 30 04
	LDA objKind,X                   ;C - - - - - 0x019A79 0C:9A69: BD 20 03
	CMP #$16                        ;C - - - - - 0x019A7C 0C:9A6C: C9 16
	BEQ loc_0C_9A73                 ;C - - - - - 0x019A7E 0C:9A6E: F0 03
	JSR EnemyFacePlayerFlag         ;C - - - - - 0x019A80 0C:9A70: 20 1B 98
loc_0C_9A73:
	INC objActive,X                 ;C - - - - - 0x019A83 0C:9A73: FE 00 03
	JSR EnemySetDownAnimA           ;C - - - - - 0x019A86 0C:9A76: 20 55 9C
	LDA #$10                        ;C - - - - - 0x019A89 0C:9A79: A9 10
	STA objParamA,X                 ;C - - - - - 0x019A8B 0C:9A7B: 9D 10 05
loc_0C_9A7E:
	LDA objStep,X                   ;C - - - - - 0x019A8E 0C:9A7E: BD 00 05
	CMP #$02                        ;C - - - - - 0x019A91 0C:9A81: C9 02
	BNE loc_0C_9A88                 ;C - - - - - 0x019A93 0C:9A83: D0 03
	JMP loc_0C_9B04                 ;C - - - - - 0x019A95 0C:9A85: 4C 04 9B
loc_0C_9A88:
	LDA objFacing,X                 ;C - - - - - 0x019A98 0C:9A88: BD 60 04
	AND #$01                        ;C - - - - - 0x019A9B 0C:9A8B: 29 01
	BEQ loc_0C_9AB5                 ;C - - - - - 0x019A9D 0C:9A8D: F0 26
	LDA ram_00BC                    ;C - - - - - 0x019A9F 0C:9A8F: A5 BC
	BEQ loc_0C_9AAF                 ;C - - - - - 0x019AA1 0C:9A91: F0 1C
	LDA objX,X                      ;C - - - - - 0x019AA3 0C:9A93: BD 60 03
	SEC                             ;C - - - - - 0x019AA6 0C:9A96: 38
	SBC scrollX                     ;C - - - - - 0x019AA7 0C:9A97: E5 FC
	CMP #$F1                        ;C - - - - - 0x019AA9 0C:9A99: C9 F1
	BCC loc_0C_9AAF                 ;C - - - - - 0x019AAB 0C:9A9B: 90 12
	LDA scrollX                     ;c - - - - - 0x019AAD 0C:9A9D: A5 FC
	CLC                             ;c - - - - - 0x019AAF 0C:9A9F: 18
	ADC #$F0                        ;c - - - - - 0x019AB0 0C:9AA0: 69 F0
	STA objX,X                      ;c - - - - - 0x019AB2 0C:9AA2: 9D 60 03
	LDA worldXPage                  ;c - - - - - 0x019AB5 0C:9AA5: A5 2D
	ADC #$00                        ;c - - - - - 0x019AB7 0C:9AA7: 69 00
	STA objXPage,X                  ;c - - - - - 0x019AB9 0C:9AA9: 9D 80 03
	JMP loc_0C_9AD8                 ;c - - - - - 0x019ABC 0C:9AAC: 4C D8 9A
loc_0C_9AAF:
	JSR ApplyVelXAdd                ;C - - - - - 0x019ABF 0C:9AAF: 20 83 F1
	JMP loc_0C_9AD8                 ;C - - - - - 0x019AC2 0C:9AB2: 4C D8 9A
loc_0C_9AB5:
	LDA ram_00BC                    ;C - - - - - 0x019AC5 0C:9AB5: A5 BC
	BEQ loc_0C_9AD5                 ;C - - - - - 0x019AC7 0C:9AB7: F0 1C
	LDA objX,X                      ;C - - - - - 0x019AC9 0C:9AB9: BD 60 03
	SEC                             ;C - - - - - 0x019ACC 0C:9ABC: 38
	SBC scrollX                     ;C - - - - - 0x019ACD 0C:9ABD: E5 FC
	CMP #$10                        ;C - - - - - 0x019ACF 0C:9ABF: C9 10
	BCS loc_0C_9AD5                 ;C - - - - - 0x019AD1 0C:9AC1: B0 12
	LDA scrollX                     ;C - - - - - 0x019AD3 0C:9AC3: A5 FC
	CLC                             ;C - - - - - 0x019AD5 0C:9AC5: 18
	ADC #$10                        ;C - - - - - 0x019AD6 0C:9AC6: 69 10
	STA objX,X                      ;C - - - - - 0x019AD8 0C:9AC8: 9D 60 03
	LDA worldXPage                  ;C - - - - - 0x019ADB 0C:9ACB: A5 2D
	ADC #$00                        ;C - - - - - 0x019ADD 0C:9ACD: 69 00
	STA objXPage,X                  ;C - - - - - 0x019ADF 0C:9ACF: 9D 80 03
	JMP loc_0C_9AD8                 ;C - - - - - 0x019AE2 0C:9AD2: 4C D8 9A
loc_0C_9AD5:
	JSR ApplyVelXSub                ;C - - - - - 0x019AE5 0C:9AD5: 20 A1 F1
loc_0C_9AD8:
	JSR ApplyVelY                   ;C - - - - - 0x019AE8 0C:9AD8: 20 FD F1
	LDA objVelYHi,X                 ;C - - - - - 0x019AEB 0C:9ADB: BD 30 04
	BPL loc_0C_9B03                 ;C - - - - - 0x019AEE 0C:9ADE: 10 23
	LDA objY,X                      ;C - - - - - 0x019AF0 0C:9AE0: BD C0 03
	CMP objParamC,X                 ;C - - - - - 0x019AF3 0C:9AE3: DD 30 05
	BCC loc_0C_9B03                 ;C - - - - - 0x019AF6 0C:9AE6: 90 1B
	LDA objParamC,X                 ;C - - - - - 0x019AF8 0C:9AE8: BD 30 05
	STA objY,X                      ;C - - - - - 0x019AFB 0C:9AEB: 9D C0 03
	JSR EnemyFallLandCheck          ;C - - - - - 0x019AFE 0C:9AEE: 20 1F 9B
	LDA #$38                        ;C - - - - - 0x019B01 0C:9AF1: A9 38
	STA objVelYLo,X                 ;C - - - - - 0x019B03 0C:9AF3: 9D 20 04
	LDA #$02                        ;C - - - - - 0x019B06 0C:9AF6: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x019B08 0C:9AF8: 9D 30 04
	LDA #$80                        ;C - - - - - 0x019B0B 0C:9AFB: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x019B0D 0C:9AFD: 9D 00 04
	INC objStep,X                   ;C - - - - - 0x019B10 0C:9B00: FE 00 05
loc_0C_9B03:
	RTS                             ;C - - - - - 0x019B13 0C:9B03: 60
loc_0C_9B04:
	JSR EnemySetDownAnimB           ;C - - - - - 0x019B14 0C:9B04: 20 7A 9C
loc_0C_9B07:
	DEC objParamA,X                 ;C - - - - - 0x019B17 0C:9B07: DE 10 05
	LDA objParamA,X                 ;C - - - - - 0x019B1A 0C:9B0A: BD 10 05
	BEQ loc_0C_9B1C                 ;C - - - - - 0x019B1D 0C:9B0D: F0 0D
	AND #$01                        ;C - - - - - 0x019B1F 0C:9B0F: 29 01
	BNE loc_0C_9B18                 ;C - - - - - 0x019B21 0C:9B11: D0 05
	JSR SetObjFlag04                ;C - - - - - 0x019B23 0C:9B13: 20 62 9B
	BNE loc_0C_9B03                 ;C - - - - - 0x019B26 0C:9B16: D0 EB
loc_0C_9B18:
	JSR ClearObjFlag04              ;C - - - - - 0x019B28 0C:9B18: 20 6B 9B
	RTS                             ;C - - - - - 0x019B2B 0C:9B1B: 60
loc_0C_9B1C:
	JMP ClearObject                 ;C - - - - - 0x019B2C 0C:9B1C: 4C BE F2
EnemyFallLandCheck:
	JSR EnemyOffscreenCheck         ;C - - - - - 0x019B2F 0C:9B1F: 20 E1 9B
	LDA objY,X                      ;C - - - - - 0x019B32 0C:9B22: BD C0 03
	STA ptr_0E+1                    ;C - - - - - 0x019B35 0C:9B25: 85 0F
	LDA objSpriteDown,X             ;C - - - - - 0x019B37 0C:9B27: BD B0 05
	CMP #$06                        ;C - - - - - 0x019B3A 0C:9B2A: C9 06
	BNE loc_0C_9B37                 ;C - - - - - 0x019B3C 0C:9B2C: D0 09
	LDA objY,X                      ;C - - - - - 0x019B3E 0C:9B2E: BD C0 03
	SEC                             ;C - - - - - 0x019B41 0C:9B31: 38
	SBC #$0C                        ;C - - - - - 0x019B42 0C:9B32: E9 0C
	STA objY,X                      ;C - - - - - 0x019B44 0C:9B34: 9D C0 03
loc_0C_9B37:
	LDY #$06                        ;C - - - - - 0x019B47 0C:9B37: A0 06
	JSR TileCollideY                ;C - - - - - 0x019B49 0C:9B39: 20 CF EC
	LDA ptr_0E+1                    ;C - - - - - 0x019B4C 0C:9B3C: A5 0F
	STA objY,X                      ;C - - - - - 0x019B4E 0C:9B3E: 9D C0 03
	LDA spriteFlipMask              ;C - - - - - 0x019B51 0C:9B41: A5 10
	AND #$40                        ;C - - - - - 0x019B53 0C:9B43: 29 40
	BEQ loc_0C_9B61                 ;C - - - - - 0x019B55 0C:9B45: F0 1A
	LDA objKind,X                   ;C - - - - - 0x019B57 0C:9B47: BD 20 03
	STA objId,X                     ;C - - - - - 0x019B5A 0C:9B4A: 9D 30 03
	LDA #$1F                        ;C - - - - - 0x019B5D 0C:9B4D: A9 1F
	STA objKind,X                   ;C - - - - - 0x019B5F 0C:9B4F: 9D 20 03
	STA objWallSide,X               ;C - - - - - 0x019B62 0C:9B52: 9D D0 03
	LDA #$00                        ;C - - - - - 0x019B65 0C:9B55: A9 00
	STA objStep,X                   ;C - - - - - 0x019B67 0C:9B57: 9D 00 05
	LDA #$FF                        ;C - - - - - 0x019B6A 0C:9B5A: A9 FF
	STA objDownState,X              ;C - - - - - 0x019B6C 0C:9B5C: 9D C0 04
	PLA                             ;C - - - - - 0x019B6F 0C:9B5F: 68
	PLA                             ;C - - - - - 0x019B70 0C:9B60: 68
loc_0C_9B61:
	RTS                             ;C - - - - - 0x019B71 0C:9B61: 60
SetObjFlag04:
	LDA objFlags,X                  ;C - - - - - 0x019B72 0C:9B62: BD 60 05
	ORA #$04                        ;C - - - - - 0x019B75 0C:9B65: 09 04
	STA objFlags,X                  ;C - - - - - 0x019B77 0C:9B67: 9D 60 05
	RTS                             ;C - - - - - 0x019B7A 0C:9B6A: 60
ClearObjFlag04:
	LDA objFlags,X                  ;C - - - - - 0x019B7B 0C:9B6B: BD 60 05
	AND #$FB                        ;C - - - - - 0x019B7E 0C:9B6E: 29 FB
	STA objFlags,X                  ;C - - - - - 0x019B80 0C:9B70: 9D 60 05
	RTS                             ;C - - - - - 0x019B83 0C:9B73: 60
; kind 1F: enemy that has been knocked down
EnemyAI_Downed:
	LDA #$FF                        ;C - - J - - 0x019B84 0C:9B74: A9 FF
	STA objDownState,X              ;C - - - - - 0x019B86 0C:9B76: 9D C0 04
	LDA objStep,X                   ;C - - - - - 0x019B89 0C:9B79: BD 00 05
	BNE loc_0C_9BD9                 ;C - - - - - 0x019B8C 0C:9B7C: D0 5B
	LDA objWallSide,X               ;C - - - - - 0x019B8E 0C:9B7E: BD D0 03
	BNE loc_0C_9B86                 ;C - - - - - 0x019B91 0C:9B81: D0 03
	STA objAnimFlags,X              ;C - - - - - 0x019B93 0C:9B83: 9D 90 05
loc_0C_9B86:
	LDA #$00                        ;C - - - - - 0x019B96 0C:9B86: A9 00
	STA objVelXHi,X                 ;C - - - - - 0x019B98 0C:9B88: 9D 10 04
	STA objVelXLo,X                 ;C - - - - - 0x019B9B 0C:9B8B: 9D 00 04
	JSR ApplyVelY                   ;C - - - - - 0x019B9E 0C:9B8E: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x019BA1 0C:9B91: BD C0 03
	CMP #$B0                        ;C - - - - - 0x019BA4 0C:9B94: C9 B0
	BCC loc_0C_9BD8                 ;C - - - - - 0x019BA6 0C:9B96: 90 40
	JSR SetObjFlag04                ;C - - - - - 0x019BA8 0C:9B98: 20 62 9B
	LDA objSpriteDown,X             ;C - - - - - 0x019BAB 0C:9B9B: BD B0 05
	CMP #$06                        ;C - - - - - 0x019BAE 0C:9B9E: C9 06
	BEQ loc_0C_9BDE                 ;C - - - - - 0x019BB0 0C:9BA0: F0 3C
	LDA objLife,X                   ;C - - - - - 0x019BB2 0C:9BA2: BD 90 04
	BMI loc_0C_9BDE                 ;C - - - - - 0x019BB5 0C:9BA5: 30 37
	LDA objId,X                     ;C - - - - - 0x019BB7 0C:9BA7: BD 30 03
	CMP #$20                        ;C - - - - - 0x019BBA 0C:9BAA: C9 20
	BCC loc_0C_9BBC                 ;C - - - - - 0x019BBC 0C:9BAC: 90 0E
	LDA objGrabState,X              ;C - - - - - 0x019BBE 0C:9BAE: BD F0 03
	CMP #$FF                        ;C - - - - - 0x019BC1 0C:9BB1: C9 FF
	BEQ loc_0C_9BBC                 ;C - - - - - 0x019BC3 0C:9BB3: F0 07
	LDA objAnim,X                   ;C - - - - - 0x019BC5 0C:9BB5: BD 80 05
	CMP #$9D                        ;C - - - - - 0x019BC8 0C:9BB8: C9 9D
	BNE loc_0C_9BC3                 ;C - - - - - 0x019BCA 0C:9BBA: D0 07
loc_0C_9BBC:
	LDA #$03                        ;C - - - - - 0x019BCC 0C:9BBC: A9 03
	STA attackType                  ;C - - - - - 0x019BCE 0C:9BBE: 85 A7
	JSR PlayerSpecialDispatch       ;C - - - - - 0x019BD0 0C:9BC0: 20 E3 89
loc_0C_9BC3:
	LDA #$FF                        ;C - - - - - 0x019BD3 0C:9BC3: A9 FF
	STA objLife,X                   ;C - - - - - 0x019BD5 0C:9BC5: 9D 90 04
	STX hudEnemySlot                ;C - - - - - 0x019BD8 0C:9BC8: 86 B0
	LDA #$00                        ;C - - - - - 0x019BDA 0C:9BCA: A9 00
	STA hudEnemyActive              ;C - - - - - 0x019BDC 0C:9BCC: 85 B1
	LDA #$10                        ;C - - - - - 0x019BDE 0C:9BCE: A9 10
	STA objTimer,X                  ;C - - - - - 0x019BE0 0C:9BD0: 9D D0 05
	INC enemiesDefeated             ;C - - - - - 0x019BE3 0C:9BD3: E6 54
	INC objStep,X                   ;C - - - - - 0x019BE5 0C:9BD5: FE 00 05
loc_0C_9BD8:
	RTS                             ;C - - - - - 0x019BE8 0C:9BD8: 60
loc_0C_9BD9:
	DEC objTimer,X                  ;C - - - - - 0x019BE9 0C:9BD9: DE D0 05
	BNE loc_0C_9BD8                 ;C - - - - - 0x019BEC 0C:9BDC: D0 FA
loc_0C_9BDE:
	JMP ClearObject                 ;C - - - - - 0x019BEE 0C:9BDE: 4C BE F2
; pops the caller's return address when off screen
EnemyOffscreenCheck:
	LDA objSpriteDown,X             ;C - - - - - 0x019BF1 0C:9BE1: BD B0 05
	CMP #$07                        ;C - - - - - 0x019BF4 0C:9BE4: C9 07
	BCS loc_0C_9BFB                 ;C - - - - - 0x019BF6 0C:9BE6: B0 13
	LDA objXPage,X                  ;C - - - - - 0x019BF8 0C:9BE8: BD 80 03
	CMP #$03                        ;C - - - - - 0x019BFB 0C:9BEB: C9 03
	BCC loc_0C_9BFB                 ;C - - - - - 0x019BFD 0C:9BED: 90 0C
	BNE loc_0C_9BF8                 ;C - - - - - 0x019BFF 0C:9BEF: D0 07
	LDA objX,X                      ;C - - - - - 0x019C01 0C:9BF1: BD 60 03
	CMP #$F0                        ;C - - - - - 0x019C04 0C:9BF4: C9 F0
	BCC loc_0C_9BFB                 ;C - - - - - 0x019C06 0C:9BF6: 90 03
loc_0C_9BF8:
	PLA                             ;C - - - - - 0x019C08 0C:9BF8: 68
	PLA                             ;C - - - - - 0x019C09 0C:9BF9: 68
	CLC                             ;C - - - - - 0x019C0A 0C:9BFA: 18
loc_0C_9BFB:
	RTS                             ;C - - - - - 0x019C0B 0C:9BFB: 60
EnemyKnockdownStep:
	LDA objDownState,X              ;C - - - - - 0x019C0C 0C:9BFC: BD C0 04
	CMP #$FE                        ;C - - - - - 0x019C0F 0C:9BFF: C9 FE
	BEQ loc_0C_9C13                 ;C - - - - - 0x019C11 0C:9C01: F0 10
	CMP #$FD                        ;C - - - - - 0x019C13 0C:9C03: C9 FD
	BEQ loc_0C_9C24                 ;C - - - - - 0x019C15 0C:9C05: F0 1D
	LDA #$2D                        ;C - - - - - 0x019C17 0C:9C07: A9 2D
	STA objSubStep,X                ;C - - - - - 0x019C19 0C:9C09: 9D 50 05
	JSR EnemySetDownAnimB           ;C - - - - - 0x019C1C 0C:9C0C: 20 7A 9C
	DEC objDownState,X              ;C - - - - - 0x019C1F 0C:9C0F: DE C0 04
	RTS                             ;C - - - - - 0x019C22 0C:9C12: 60
loc_0C_9C13:
	DEC objSubStep,X                ;C - - - - - 0x019C23 0C:9C13: DE 50 05
	BNE loc_0C_9C54                 ;C - - - - - 0x019C26 0C:9C16: D0 3C
	JSR EnemySetDownAnimC           ;C - - - - - 0x019C28 0C:9C18: 20 AD 9C
	LDA #$17                        ;C - - - - - 0x019C2B 0C:9C1B: A9 17
	STA objSubStep,X                ;C - - - - - 0x019C2D 0C:9C1D: 9D 50 05
	DEC objDownState,X              ;C - - - - - 0x019C30 0C:9C20: DE C0 04
	RTS                             ;C - - - - - 0x019C33 0C:9C23: 60
loc_0C_9C24:
	DEC objSubStep,X                ;C - - - - - 0x019C34 0C:9C24: DE 50 05
	BNE loc_0C_9C54                 ;C - - - - - 0x019C37 0C:9C27: D0 2B
EnemyRecover:
	LDA objId,X                     ;C - - - - - 0x019C39 0C:9C29: BD 30 03
	STA objKind,X                   ;C - - - - - 0x019C3C 0C:9C2C: 9D 20 03
	LDA objState,X                  ;C - - - - - 0x019C3F 0C:9C2F: BD 10 03
	STA objActive,X                 ;C - - - - - 0x019C42 0C:9C32: 9D 00 03
	JSR EnemyTileProbe3             ;C - - - - - bank=0D 0x019C45 0C:9C35: 20 1D AA
	LDA #$00                        ;C - - - - - 0x019C48 0C:9C38: A9 00
	STA objMoveMode,X               ;C - - - - - 0x019C4A 0C:9C3A: 9D 70 04
	STA objHitTimer,X               ;C - - - - - 0x019C4D 0C:9C3D: 9D E0 04
	STA objGrabState,X              ;C - - - - - 0x019C50 0C:9C40: 9D F0 03
	LDA objFlags,X                  ;C - - - - - 0x019C53 0C:9C43: BD 60 05
	ORA #$80                        ;C - - - - - 0x019C56 0C:9C46: 09 80
	STA objFlags,X                  ;C - - - - - 0x019C58 0C:9C48: 9D 60 05
	LDY objSpriteDown,X             ;C - - - - - 0x019C5B 0C:9C4B: BC B0 05
	LDA EnemyRecoverTbl_FC82,Y      ;C - - - - - 0x019C5E 0C:9C4E: B9 82 FC
	STA objDownState,X              ;C - - - - - 0x019C61 0C:9C51: 9D C0 04
loc_0C_9C54:
	RTS                             ;C - - - - - 0x019C64 0C:9C54: 60
EnemySetDownAnimA:
	LDA objSpriteDown,X             ;C - - - - - 0x019C65 0C:9C55: BD B0 05
	TAY                             ;C - - - - - 0x019C68 0C:9C58: A8
	LDA EnemySetDownAnimATbl_FC8F,Y ;C - - - - - 0x019C69 0C:9C59: B9 8F FC
	CMP objAnim,X                   ;C - - - - - 0x019C6C 0C:9C5C: DD 80 05
	BEQ loc_0C_9C79                 ;C - - - - - 0x019C6F 0C:9C5F: F0 18
	JSR SetAnimX                    ;C - - - - - 0x019C71 0C:9C61: 20 88 F2
	LDA objSpriteDown,X             ;C - - - - - 0x019C74 0C:9C64: BD B0 05
	CMP #$06                        ;C - - - - - 0x019C77 0C:9C67: C9 06
	BEQ loc_0C_9C79                 ;C - - - - - 0x019C79 0C:9C69: F0 0E
	LDA EnemySetDownAnimATbl_FC9D,Y ;C - - - - - 0x019C7B 0C:9C6B: B9 9D FC
	STA ptr_00                      ;C - - - - - 0x019C7E 0C:9C6E: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x019C80 0C:9C70: B9 33 FC
	TAY                             ;C - - - - - 0x019C83 0C:9C73: A8
	LDA ptr_00                      ;C - - - - - 0x019C84 0C:9C74: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x019C86 0C:9C76: 99 EB 00
loc_0C_9C79:
	RTS                             ;C - - - - - 0x019C89 0C:9C79: 60
EnemySetDownAnimB:
	LDA objSpriteDown,X             ;C - - - - - 0x019C8A 0C:9C7A: BD B0 05
	TAY                             ;C - - - - - 0x019C8D 0C:9C7D: A8
	LDA EnemySetDownAnimBTbl_FCAB,Y ;C - - - - - 0x019C8E 0C:9C7E: B9 AB FC
	CMP objAnim,X                   ;C - - - - - 0x019C91 0C:9C81: DD 80 05
	BEQ loc_0C_9C9E                 ;C - - - - - 0x019C94 0C:9C84: F0 18
	JSR SetAnimX                    ;C - - - - - 0x019C96 0C:9C86: 20 88 F2
	LDA objSpriteDown,X             ;C - - - - - 0x019C99 0C:9C89: BD B0 05
	CMP #$06                        ;C - - - - - 0x019C9C 0C:9C8C: C9 06
	BEQ loc_0C_9C9E                 ;C - - - - - 0x019C9E 0C:9C8E: F0 0E
	LDA EnemySetDownAnimBTbl_9C9F,Y ;C - - - - - 0x019CA0 0C:9C90: B9 9F 9C
	STA ptr_00                      ;C - - - - - 0x019CA3 0C:9C93: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x019CA5 0C:9C95: B9 33 FC
	TAY                             ;C - - - - - 0x019CA8 0C:9C98: A8
	LDA ptr_00                      ;C - - - - - 0x019CA9 0C:9C99: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x019CAB 0C:9C9B: 99 EB 00
loc_0C_9C9E:
	RTS                             ;C - - - - - 0x019CAE 0C:9C9E: 60
EnemySetDownAnimBTbl_9C9F:
	.byte $19,$1C,$1E,$3D,$21,$27   ;- D 0 - - - 0x019CAF 0C:9C9F:
	.byte $00                       ;- - - - - - 0x019CB5 0C:9CA5:
	.byte $2B,$2D,$27               ;- D 0 - - - 0x019CB6 0C:9CA6:
	.byte $2D                       ;- - - - - - 0x019CB9 0C:9CA9:
	.byte $3A,$3A                   ;- D 0 - - - 0x019CBA 0C:9CAA:
	.byte $2E                       ;- - - - - - 0x019CBC 0C:9CAC:
EnemySetDownAnimC:
	LDA objSpriteDown,X             ;C - - - - - 0x019CBD 0C:9CAD: BD B0 05
	TAY                             ;C - - - - - 0x019CC0 0C:9CB0: A8
	LDA EnemySetDownAnimCTbl_9CD3,Y ;C - - - - - 0x019CC1 0C:9CB1: B9 D3 9C
	CMP objAnim,X                   ;C - - - - - 0x019CC4 0C:9CB4: DD 80 05
	BEQ loc_0C_9CD2                 ;C - - - - - 0x019CC7 0C:9CB7: F0 19
	JSR SetAnimX                    ;C - - - - - 0x019CC9 0C:9CB9: 20 88 F2
	LDA EnemySetDownAnimCTbl_9CE0,Y ;C - - - - - 0x019CCC 0C:9CBC: B9 E0 9C
	STA ptr_00                      ;C - - - - - 0x019CCF 0C:9CBF: 85 00
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x019CD1 0C:9CC1: B9 33 FC
	TAY                             ;C - - - - - 0x019CD4 0C:9CC4: A8
	LDA objSpriteDown,X             ;C - - - - - 0x019CD5 0C:9CC5: BD B0 05
	CMP #$08                        ;C - - - - - 0x019CD8 0C:9CC8: C9 08
	BNE loc_0C_9CCD                 ;C - - - - - 0x019CDA 0C:9CCA: D0 01
	INY                             ;C - - - - - 0x019CDC 0C:9CCC: C8
loc_0C_9CCD:
	LDA ptr_00                      ;C - - - - - 0x019CDD 0C:9CCD: A5 00
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x019CDF 0C:9CCF: 99 EB 00
loc_0C_9CD2:
	RTS                             ;C - - - - - 0x019CE2 0C:9CD2: 60
EnemySetDownAnimCTbl_9CD3:
	.byte $82,$8B,$97,$A0,$A5,$D7   ;- D 0 - - - 0x019CE3 0C:9CD3:
	.byte $B9                       ;- - - - - - 0x019CE9 0C:9CD9:
	.byte $E6,$FA,$E2               ;- D 0 - - - 0x019CEA 0C:9CDA:
	.byte $FA                       ;- - - - - - 0x019CED 0C:9CDD:
	.byte $C6                       ;- D 0 - - - 0x019CEE 0C:9CDE:
	.byte $00                       ;- - - - - - 0x019CEF 0C:9CDF:
EnemySetDownAnimCTbl_9CE0:
	.byte $19,$1C,$1E,$3D,$20,$27   ;- D 0 - - - 0x019CF0 0C:9CE0:
	.byte $B9                       ;- - - - - - 0x019CF6 0C:9CE6:
	.byte $28,$2E,$27               ;- D 0 - - - 0x019CF7 0C:9CE7:
	.byte $2E                       ;- - - - - - 0x019CFA 0C:9CEA:
	.byte $3A                       ;- D 0 - - - 0x019CFB 0C:9CEB:
	.byte $00                       ;- - - - - - 0x019CFC 0C:9CEC:
; kinds 20-25, objVariant 1
EnemyAI_Grunt1:
	LDA #$01                        ;C - - J - - 0x019CFD 0C:9CED: A9 01
	BNE EnemyAI_GruntCommon         ;C - - - - - 0x019CFF 0C:9CEF: D0 06
; kinds 26-2B, objVariant 2
EnemyAI_Grunt2:
	LDA #$02                        ;C - - J - - 0x019D01 0C:9CF1: A9 02
	BNE EnemyAI_GruntCommon         ;C - - - - - 0x019D03 0C:9CF3: D0 02
; kinds 30-35, objVariant 4
EnemyAI_Grunt4:
	LDA #$04                        ;C - - J - - 0x019D05 0C:9CF5: A9 04
EnemyAI_GruntCommon:
	STA objVariant,X                ;C - - - - - 0x019D07 0C:9CF7: 9D C0 05
	LDA objDownState,X              ;C - - - - - 0x019D0A 0C:9CFA: BD C0 04
	BEQ loc_0C_9D02                 ;C - - - - - 0x019D0D 0C:9CFD: F0 03
	DEC objDownState,X              ;C - - - - - 0x019D0F 0C:9CFF: DE C0 04
loc_0C_9D02:
	LDA #$00                        ;C - - - - - 0x019D12 0C:9D02: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x019D14 0C:9D04: 9D 40 04
	LDA oamBuffer+15                ;C - - - - - 0x019D17 0C:9D07: AD 0F 02
	ADC rngState0                   ;C - - - - - 0x019D1A 0C:9D0A: 65 E4
	ADC rngState1                   ;C - - - - - 0x019D1C 0C:9D0C: 65 E5
	ADC rngState2                   ;C - - - - - 0x019D1E 0C:9D0E: 65 E6
	STA rngState0                   ;C - - - - - 0x019D20 0C:9D10: 85 E4
	LDA objKind,X                   ;C - - - - - 0x019D22 0C:9D12: BD 20 03
	SEC                             ;C - - - - - 0x019D25 0C:9D15: 38
	SBC #$20                        ;C - - - - - 0x019D26 0C:9D16: E9 20
	TAY                             ;C - - - - - 0x019D28 0C:9D18: A8
	LDA EnemyAI_GruntCommonTbl_9D5B,Y;C - - - - - 0x019D29 0C:9D19: B9 5B 9D
	STA objSpriteDown,X             ;C - - - - - 0x019D2C 0C:9D1C: 9D B0 05
	JSR EnemyGrabbedUpdate          ;C - - - - - bank=0D 0x019D2F 0C:9D1F: 20 29 AB
	BCC loc_0C_9D25                 ;C - - - - - 0x019D32 0C:9D22: 90 01
	RTS                             ;C - - - - - 0x019D34 0C:9D24: 60
loc_0C_9D25:
	JSR EnemyRoutine9FF6            ;C - - - - - 0x019D35 0C:9D25: 20 F6 9F
	LDA objActive,X                 ;C - - - - - 0x019D38 0C:9D28: BD 00 03
	AND #$0F                        ;C - - - - - 0x019D3B 0C:9D2B: 29 0F
	TAY                             ;C - - - - - 0x019D3D 0C:9D2D: A8
	LDA EnemyAI_GruntCommonTbl_9D3B,Y;C - - - - - 0x019D3E 0C:9D2E: B9 3B 9D
	STA ptr_00                      ;C - - - - - 0x019D41 0C:9D31: 85 00
	LDA EnemyAI_GruntCommonTbl_9D4B,Y;C - - - - - 0x019D43 0C:9D33: B9 4B 9D
	STA ptr_00+1                    ;C - - - - - 0x019D46 0C:9D36: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x019D48 0C:9D38: 6C 00 00
EnemyAI_GruntCommonTbl_9D3B:
	.byte $4C,$60,$E8,$8E,$10,$C3,$1D,$F5,$11,$94,$4F,$52,$17,$32,$3A,$9C;- D 0 - - - 0x019D4B 0C:9D3B:
EnemyAI_GruntCommonTbl_9D4B:
	.byte $A0,$A0,$A0,$A1,$A2,$A2,$A4,$A3,$A4,$A4,$A5,$A6,$A7,$A7,$A7,$A8;- D 0 - - - 0x019D5B 0C:9D4B:
EnemyAI_GruntCommonTbl_9D5B:
	.byte $00,$01,$02,$03,$04,$05,$00,$01,$02,$03,$04,$05;- D 0 - - - 0x019D6B 0C:9D5B:
	.byte $00,$00,$00,$00           ;- - - - - - 0x019D77 0C:9D67:
	.byte $00,$01,$02,$03,$04,$05   ;- D 0 - - - 0x019D7B 0C:9D6B:
; kind 2E: straight mover, removed when off screen
EnemyAI_Projectile2E:
	LDA objFacing,X                 ;C - - J - - 0x019D81 0C:9D71: BD 60 04
	AND #$01                        ;C - - - - - 0x019D84 0C:9D74: 29 01
	BEQ loc_0C_9D8B                 ;C - - - - - 0x019D86 0C:9D76: F0 13
	LDA objX,X                      ;C - - - - - 0x019D88 0C:9D78: BD 60 03
	SEC                             ;C - - - - - 0x019D8B 0C:9D7B: 38
	SBC scrollX                     ;C - - - - - 0x019D8C 0C:9D7C: E5 FC
	CMP #$FA                        ;C - - - - - 0x019D8E 0C:9D7E: C9 FA
	BCC loc_0C_9D85                 ;C - - - - - 0x019D90 0C:9D80: 90 03
	JMP ClearObject                 ;C - - - - - 0x019D92 0C:9D82: 4C BE F2
loc_0C_9D85:
	JSR SetObjFlag40                ;C - - - - - 0x019D95 0C:9D85: 20 90 F0
	JMP ApplyVelXAdd                ;C - - - - - 0x019D98 0C:9D88: 4C 83 F1
loc_0C_9D8B:
	LDA objX,X                      ;C - - - - - 0x019D9B 0C:9D8B: BD 60 03
	SEC                             ;C - - - - - 0x019D9E 0C:9D8E: 38
	SBC scrollX                     ;C - - - - - 0x019D9F 0C:9D8F: E5 FC
	CMP #$08                        ;C - - - - - 0x019DA1 0C:9D91: C9 08
	BCS loc_0C_9D98                 ;C - - - - - 0x019DA3 0C:9D93: B0 03
	JMP ClearObject                 ;C - - - - - 0x019DA5 0C:9D95: 4C BE F2
loc_0C_9D98:
	JSR ClearObjFlag40              ;C - - - - - 0x019DA8 0C:9D98: 20 99 F0
	JMP ApplyVelXSub                ;C - - - - - 0x019DAB 0C:9D9B: 4C A1 F1
; kind 2C
EnemyAI_Leaper1:
	LDY #$25                        ;c - - - - - 0x019DAE 0C:9D9E: A0 25
	LDA #$01                        ;c - - - - - 0x019DB0 0C:9DA0: A9 01
	BNE EnemyAI_LeaperCommon        ;c - - - - - 0x019DB2 0C:9DA2: D0 0A
; kind 2D
EnemyAI_Leaper2:
	LDY #$2B                        ;c - - - - - 0x019DB4 0C:9DA4: A0 2B
	LDA #$02                        ;c - - - - - 0x019DB6 0C:9DA6: A9 02
	BNE EnemyAI_LeaperCommon        ;c - - - - - 0x019DB8 0C:9DA8: D0 04
; kind 2F
EnemyAI_Leaper4:
	LDY #$35                        ;c - - - - - 0x019DBA 0C:9DAA: A0 35
	LDA #$04                        ;c - - - - - 0x019DBC 0C:9DAC: A9 04
EnemyAI_LeaperCommon:
	STA objVariant,X                ;c - - - - - 0x019DBE 0C:9DAE: 9D C0 05
	TYA                             ;c - - - - - 0x019DC1 0C:9DB1: 98
	STA objParamA,X                 ;c - - - - - 0x019DC2 0C:9DB2: 9D 10 05
	LDA #$05                        ;c - - - - - 0x019DC5 0C:9DB5: A9 05
	STA objSpriteDown,X             ;c - - - - - 0x019DC7 0C:9DB7: 9D B0 05
	JSR DistanceXToPlayer           ;c - - - - - 0x019DCA 0C:9DBA: 20 74 F3
	CMP #$80                        ;c - - - - - 0x019DCD 0C:9DBD: C9 80
	BCC loc_0C_9DC2                 ;c - - - - - 0x019DCF 0C:9DBF: 90 01
	RTS                             ;c - - - - - 0x019DD1 0C:9DC1: 60
loc_0C_9DC2:
	JSR DirToPlayerGround           ;c - - - - - 0x019DD2 0C:9DC2: 20 5B FB
	TAY                             ;c - - - - - 0x019DD5 0C:9DC5: A8
	LDA EnemyAI_LeaperCommonTbl_A87E,Y;c - - - - - bank=0D 0x019DD6 0C:9DC6: B9 7E A8
	STA objFacing,X                 ;c - - - - - 0x019DD9 0C:9DC9: 9D 60 04
	AND #$0C                        ;c - - - - - 0x019DDC 0C:9DCC: 29 0C
	BNE loc_0C_9DE4                 ;c - - - - - 0x019DDE 0C:9DCE: D0 14
	LDA #$4C                        ;c - - - - - 0x019DE0 0C:9DD0: A9 4C
	STA objVelXLo,X                 ;c - - - - - 0x019DE2 0C:9DD2: 9D 00 04
	LDA #$02                        ;c - - - - - 0x019DE5 0C:9DD5: A9 02
	STA objVelXHi,X                 ;c - - - - - 0x019DE7 0C:9DD7: 9D 10 04
	LDA #$00                        ;c - - - - - 0x019DEA 0C:9DDA: A9 00
	STA objVelYLo,X                 ;c - - - - - 0x019DEC 0C:9DDC: 9D 20 04
	STA objVelYHi,X                 ;c - - - - - 0x019DEF 0C:9DDF: 9D 30 04
	BEQ loc_0C_9DF8                 ;c - - - - - 0x019DF2 0C:9DE2: F0 14
loc_0C_9DE4:
	LDA #$1F                        ;c - - - - - 0x019DF4 0C:9DE4: A9 1F
	STA objVelXLo,X                 ;c - - - - - 0x019DF6 0C:9DE6: 9D 00 04
	LDA #$02                        ;c - - - - - 0x019DF9 0C:9DE9: A9 02
	STA objVelXHi,X                 ;c - - - - - 0x019DFB 0C:9DEB: 9D 10 04
	LDA #$E1                        ;c - - - - - 0x019DFE 0C:9DEE: A9 E1
	STA objVelYLo,X                 ;c - - - - - 0x019E00 0C:9DF0: 9D 20 04
	LDA #$00                        ;c - - - - - 0x019E03 0C:9DF3: A9 00
	STA objVelYHi,X                 ;c - - - - - 0x019E05 0C:9DF5: 9D 30 04
loc_0C_9DF8:
	LDA #$D2                        ;c - - - - - 0x019E08 0C:9DF8: A9 D2
	LDY #$24                        ;c - - - - - 0x019E0A 0C:9DFA: A0 24
	JSR SetAnimXChr3                ;c - - - - - 0x019E0C 0C:9DFC: 20 43 F4
	LDA objVariant,X                ;c - - - - - 0x019E0F 0C:9DFF: BD C0 05
	TAY                             ;c - - - - - 0x019E12 0C:9E02: A8
	LDA tbl_0D_A897,Y               ;c - - - - - bank=0D 0x019E13 0C:9E03: B9 97 A8
	CLC                             ;c - - - - - 0x019E16 0C:9E06: 18
	ADC #$33                        ;c - - - - - 0x019E17 0C:9E07: 69 33
	STA objAtkDamage,X              ;c - - - - - 0x019E19 0C:9E09: 9D 50 04
	LDA #$8E                        ;c - - - - - 0x019E1C 0C:9E0C: A9 8E
	STA objActive,X                 ;c - - - - - 0x019E1E 0C:9E0E: 9D 00 03
	LDA #$03                        ;c - - - - - 0x019E21 0C:9E11: A9 03
	STA objStep,X                   ;c - - - - - 0x019E23 0C:9E13: 9D 00 05
	LDA objParamA,X                 ;c - - - - - 0x019E26 0C:9E16: BD 10 05
	STA objKind,X                   ;c - - - - - 0x019E29 0C:9E19: 9D 20 03
	STA objId,X                     ;c - - - - - 0x019E2C 0C:9E1C: 9D 30 03
	RTS                             ;c - - - - - 0x019E2F 0C:9E1F: 60
; kind 36
EnemyAI_TypeA1:
	LDA #$01                        ;c - - - - - 0x019E30 0C:9E20: A9 01
	BNE loc_0C_9E2A                 ;c - - - - - 0x019E32 0C:9E22: D0 06
; kind 37
EnemyAI_TypeA2:
	LDA #$02                        ;C - - J - - 0x019E34 0C:9E24: A9 02
	BNE loc_0C_9E2A                 ;C - - - - - 0x019E36 0C:9E26: D0 02
; kind 38
EnemyAI_TypeA4:
	LDA #$04                        ;C - - J - - 0x019E38 0C:9E28: A9 04
loc_0C_9E2A:
	LDY #$00                        ;C - - - - - 0x019E3A 0C:9E2A: A0 00
	BEQ EnemyAI_TypeCommon          ;C - - - - - 0x019E3C 0C:9E2C: F0 1A
; kind 3C
EnemyAI_TypeC1:
	LDA #$01                        ;c - - - - - 0x019E3E 0C:9E2E: A9 01
	BNE loc_0C_9E38                 ;c - - - - - 0x019E40 0C:9E30: D0 06
; kind 3D
EnemyAI_TypeC2:
	LDA #$02                        ;C - - J - - 0x019E42 0C:9E32: A9 02
	BNE loc_0C_9E38                 ;C - - - - - 0x019E44 0C:9E34: D0 02
; kind 3E
EnemyAI_TypeC4:
	LDA #$04                        ;C - - J - - 0x019E46 0C:9E36: A9 04
loc_0C_9E38:
	LDY #$04                        ;C - - - - - 0x019E48 0C:9E38: A0 04
	BNE EnemyAI_TypeCommon          ;C - - - - - 0x019E4A 0C:9E3A: D0 0C
; kind 39
EnemyAI_TypeB1:
	LDA #$01                        ;c - - - - - 0x019E4C 0C:9E3C: A9 01
	BNE loc_0C_9E46                 ;c - - - - - 0x019E4E 0C:9E3E: D0 06
; kind 3A
EnemyAI_TypeB2:
	LDA #$02                        ;c - - - - - 0x019E50 0C:9E40: A9 02
	BNE loc_0C_9E46                 ;c - - - - - 0x019E52 0C:9E42: D0 02
; kind 3B
EnemyAI_TypeB4:
	LDA #$04                        ;C - - J - - 0x019E54 0C:9E44: A9 04
loc_0C_9E46:
	LDY #$03                        ;C - - - - - 0x019E56 0C:9E46: A0 03
EnemyAI_TypeCommon:
	STA objVariant,X                ;C - - - - - 0x019E58 0C:9E48: 9D C0 05
	TYA                             ;C - - - - - 0x019E5B 0C:9E4B: 98
	STA objSpriteDown,X             ;C - - - - - 0x019E5C 0C:9E4C: 9D B0 05
	LDA stage                       ;C - - - - - 0x019E5F 0C:9E4F: A5 61
	CMP #$03                        ;C - - - - - 0x019E61 0C:9E51: C9 03
	BNE loc_0C_9E5B                 ;C - - - - - 0x019E63 0C:9E53: D0 06
	LDA stageSection                ;C - - - - - 0x019E65 0C:9E55: A5 60
	CMP #$01                        ;C - - - - - 0x019E67 0C:9E57: C9 01
	BEQ loc_0C_9E63                 ;C - - - - - 0x019E69 0C:9E59: F0 08
loc_0C_9E5B:
	JSR DistanceXToPlayer           ;C - - - - - 0x019E6B 0C:9E5B: 20 74 F3
	CMP #$08                        ;C - - - - - 0x019E6E 0C:9E5E: C9 08
	BCC loc_0C_9E63                 ;C - - - - - 0x019E70 0C:9E60: 90 01
	RTS                             ;C - - - - - 0x019E72 0C:9E62: 60
loc_0C_9E63:
	LDA objFlags,X                  ;C - - - - - 0x019E73 0C:9E63: BD 60 05
	AND #$FB                        ;C - - - - - 0x019E76 0C:9E66: 29 FB
	STA objFlags,X                  ;C - - - - - 0x019E78 0C:9E68: 9D 60 05
	LDA playerGroundY               ;C - - - - - 0x019E7B 0C:9E6B: A5 36
	STA objParamB,X                 ;C - - - - - 0x019E7D 0C:9E6D: 9D 20 05
	LDA #$FF                        ;C - - - - - 0x019E80 0C:9E70: A9 FF
	STA objVelYHi,X                 ;C - - - - - 0x019E82 0C:9E72: 9D 30 04
	LDA #$00                        ;C - - - - - 0x019E85 0C:9E75: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x019E87 0C:9E77: 9D 20 04
	STA objVelXLo,X                 ;C - - - - - 0x019E8A 0C:9E7A: 9D 00 04
	STA objVelXHi,X                 ;C - - - - - 0x019E8D 0C:9E7D: 9D 10 04
	LDA objVariant,X                ;C - - - - - 0x019E90 0C:9E80: BD C0 05
	TAY                             ;C - - - - - 0x019E93 0C:9E83: A8
	LDA tbl_0D_A897,Y               ;C - - - - - bank=0D 0x019E94 0C:9E84: B9 97 A8
	CLC                             ;C - - - - - 0x019E97 0C:9E87: 18
	LDY objSpriteDown,X             ;C - - - - - 0x019E98 0C:9E88: BC B0 05
	ADC EnemyAI_TypeCommonTbl_9EBF,Y;C - - - - - 0x019E9B 0C:9E8B: 79 BF 9E
	STA objAtkDamage,X              ;C - - - - - 0x019E9E 0C:9E8E: 9D 50 04
	LDA EnemyAI_TypeCommonTbl_9EB3,Y;C - - - - - 0x019EA1 0C:9E91: B9 B3 9E
	JSR SetAnimX                    ;C - - - - - 0x019EA4 0C:9E94: 20 88 F2
	TYA                             ;C - - - - - 0x019EA7 0C:9E97: 98
	BNE loc_0C_9E9F                 ;C - - - - - 0x019EA8 0C:9E98: D0 05
	LDA #$06                        ;C - - - - - 0x019EAA 0C:9E9A: A9 06
	STA objAnimFrame,X              ;C - - - - - 0x019EAC 0C:9E9C: 9D 70 05
loc_0C_9E9F:
	LDA EnemyAI_TypeCommonTbl_9EB9,Y;C - - - - - 0x019EAF 0C:9E9F: B9 B9 9E
	PHA                             ;C - - - - - 0x019EB2 0C:9EA2: 48
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x019EB3 0C:9EA3: B9 33 FC
	TAY                             ;C - - - - - 0x019EB6 0C:9EA6: A8
	PLA                             ;C - - - - - 0x019EB7 0C:9EA7: 68
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x019EB8 0C:9EA8: 99 EB 00
	LDA #$8F                        ;C - - - - - 0x019EBB 0C:9EAB: A9 8F
	STA objActive,X                 ;C - - - - - 0x019EBD 0C:9EAD: 9D 00 03
	JMP loc_0C_9FBB                 ;C - - - - - 0x019EC0 0C:9EB0: 4C BB 9F
EnemyAI_TypeCommonTbl_9EB3:
	.byte $84                       ;- D 0 - - - 0x019EC3 0C:9EB3:
	.byte $00,$00                   ;- - - - - - 0x019EC4 0C:9EB4:
	.byte $BE,$AC                   ;- D 0 - - - 0x019EC6 0C:9EB6:
	.byte $00                       ;- - - - - - 0x019EC8 0C:9EB8:
EnemyAI_TypeCommonTbl_9EB9:
	.byte $1A                       ;- D 0 - - - 0x019EC9 0C:9EB9:
	.byte $00,$00                   ;- - - - - - 0x019ECA 0C:9EBA:
	.byte $35,$22                   ;- D 0 - - - 0x019ECC 0C:9EBC:
	.byte $00                       ;- - - - - - 0x019ECE 0C:9EBE:
EnemyAI_TypeCommonTbl_9EBF:
	.byte $36                       ;- D 0 - - - 0x019ECF 0C:9EBF:
	.byte $00,$00                   ;- - - - - - 0x019ED0 0C:9EC0:
	.byte $36,$39                   ;- D 0 - - - 0x019ED2 0C:9EC2:
	.byte $00                       ;- - - - - - 0x019ED4 0C:9EC4:
; kinds 3F 50 53 56 57 59 5C
EnemyAI_Var1:
	LDA #$01                        ;C - - J - - 0x019ED5 0C:9EC5: A9 01
	BNE EnemyAI_VarCommon           ;C - - - - - 0x019ED7 0C:9EC7: D0 06
; kinds 4F 51 54 58 5A 5D
EnemyAI_Var2:
	LDA #$02                        ;c - - - - - 0x019ED9 0C:9EC9: A9 02
	BNE EnemyAI_VarCommon           ;c - - - - - 0x019EDB 0C:9ECB: D0 02
; kinds 52 55 5B 5E 5F
EnemyAI_Var4:
	LDA #$04                        ;C - - J - - 0x019EDD 0C:9ECD: A9 04
EnemyAI_VarCommon:
	STA objVariant,X                ;C - - - - - 0x019EDF 0C:9ECF: 9D C0 05
	LDA #$00                        ;C - - - - - 0x019EE2 0C:9ED2: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x019EE4 0C:9ED4: 9D 40 04
	LDA objKind,X                   ;C - - - - - 0x019EE7 0C:9ED7: BD 20 03
	SEC                             ;C - - - - - 0x019EEA 0C:9EDA: 38
	SBC #$36                        ;C - - - - - 0x019EEB 0C:9EDB: E9 36
	TAY                             ;C - - - - - 0x019EED 0C:9EDD: A8
	LDA EnemyAI_VarCommonTbl_9F91,Y ;C - - - - - 0x019EEE 0C:9EDE: B9 91 9F
	STA objSpriteDown,X             ;C - - - - - 0x019EF1 0C:9EE1: 9D B0 05
	LDA #$78                        ;C - - - - - 0x019EF4 0C:9EE4: A9 78
	STA objTimer,X                  ;C - - - - - 0x019EF6 0C:9EE6: 9D D0 05
	LDA #$8D                        ;C - - - - - 0x019EF9 0C:9EE9: A9 8D
	STA objActive,X                 ;C - - - - - 0x019EFB 0C:9EEB: 9D 00 03
	JSR EnemySetAnimSetA            ;C - - - - - bank=0D 0x019EFE 0C:9EEE: 20 AE AA
	JMP loc_0C_9FBB                 ;C - - - - - 0x019F01 0C:9EF1: 4C BB 9F
; kinds 40, 43
EnemyAI_CdA_V1:
	LDA #$00                        ;C - - J - - 0x019F04 0C:9EF4: A9 00
	BEQ loc_0C_9EFA                 ;C - - - - - 0x019F06 0C:9EF6: F0 02
; kinds 46, 49
EnemyAI_CdB_V1:
	LDA #$02                        ;C - - J - - 0x019F08 0C:9EF8: A9 02
loc_0C_9EFA:
	STA objCooldown,X               ;C - - - - - 0x019F0A 0C:9EFA: 9D 40 05
	LDA #$01                        ;C - - - - - 0x019F0D 0C:9EFD: A9 01
	BNE EnemyAI_CdCommon            ;C - - - - - 0x019F0F 0C:9EFF: D0 18
; kinds 41, 44
EnemyAI_CdA_V2:
	LDA #$00                        ;c - - - - - 0x019F11 0C:9F01: A9 00
	BEQ loc_0C_9F07                 ;c - - - - - 0x019F13 0C:9F03: F0 02
; kinds 47, 4A
EnemyAI_CdB_V2:
	LDA #$02                        ;C - - J - - 0x019F15 0C:9F05: A9 02
loc_0C_9F07:
	STA objCooldown,X               ;C - - - - - 0x019F17 0C:9F07: 9D 40 05
	LDA #$02                        ;C - - - - - 0x019F1A 0C:9F0A: A9 02
	BNE EnemyAI_CdCommon            ;C - - - - - 0x019F1C 0C:9F0C: D0 0B
; kinds 42, 45
EnemyAI_CdA_V4:
	LDA #$00                        ;C - - J - - 0x019F1E 0C:9F0E: A9 00
	BEQ loc_0C_9F14                 ;C - - - - - 0x019F20 0C:9F10: F0 02
; kinds 48, 4B
EnemyAI_CdB_V4:
	LDA #$02                        ;C - - J - - 0x019F22 0C:9F12: A9 02
loc_0C_9F14:
	STA objCooldown,X               ;C - - - - - 0x019F24 0C:9F14: 9D 40 05
	LDA #$04                        ;C - - - - - 0x019F27 0C:9F17: A9 04
EnemyAI_CdCommon:
	STA objVariant,X                ;C - - - - - 0x019F29 0C:9F19: 9D C0 05
	LDA objKind,X                   ;C - - - - - 0x019F2C 0C:9F1C: BD 20 03
	SEC                             ;C - - - - - 0x019F2F 0C:9F1F: 38
	SBC #$36                        ;C - - - - - 0x019F30 0C:9F20: E9 36
	TAY                             ;C - - - - - 0x019F32 0C:9F22: A8
	LDA EnemyAI_VarCommonTbl_9F91,Y ;C - - - - - 0x019F33 0C:9F23: B9 91 9F
	STA objSpriteDown,X             ;C - - - - - 0x019F36 0C:9F26: 9D B0 05
	LDA #$00                        ;C - - - - - 0x019F39 0C:9F29: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x019F3B 0C:9F2B: 9D 40 04
	LDA objActive,X                 ;C - - - - - 0x019F3E 0C:9F2E: BD 00 03
	LSR A                           ;C - - - - - 0x019F41 0C:9F31: 4A
	BCS loc_0C_9F5D                 ;C - - - - - 0x019F42 0C:9F32: B0 29
	INC objActive,X                 ;C - - - - - 0x019F44 0C:9F34: FE 00 03
	LDY objSpriteDown,X             ;C - - - - - 0x019F47 0C:9F37: BC B0 05
	DEY                             ;C - - - - - 0x019F4A 0C:9F3A: 88
	TYA                             ;C - - - - - 0x019F4B 0C:9F3B: 98
	ADC objCooldown,X               ;C - - - - - 0x019F4C 0C:9F3C: 7D 40 05
	TAY                             ;C - - - - - 0x019F4F 0C:9F3F: A8
	STA objAnimFrame,X              ;C - - - - - 0x019F50 0C:9F40: 9D 70 05
	LDA #$A2                        ;C - - - - - 0x019F53 0C:9F43: A9 A2
	STA objAnim,X                   ;C - - - - - 0x019F55 0C:9F45: 9D 80 05
	LDA #$00                        ;C - - - - - 0x019F58 0C:9F48: A9 00
	STA objAnimFlags,X              ;C - - - - - 0x019F5A 0C:9F4A: 9D 90 05
	LDA EnemyAI_CdCommonTbl_9F8D,Y  ;C - - - - - 0x019F5D 0C:9F4D: B9 8D 9F
	PHA                             ;C - - - - - 0x019F60 0C:9F50: 48
	LDY objSpriteDown,X             ;C - - - - - 0x019F61 0C:9F51: BC B0 05
	LDA tbl_0F_FC33,Y               ;C - - - - - 0x019F64 0C:9F54: B9 33 FC
	TAY                             ;C - - - - - 0x019F67 0C:9F57: A8
	PLA                             ;C - - - - - 0x019F68 0C:9F58: 68
	STA a:chrBankShadow+3,Y         ;C - - - - - 0x019F69 0C:9F59: 99 EB 00
	RTS                             ;C - - - - - 0x019F6C 0C:9F5C: 60
loc_0C_9F5D:
	LDA #$00                        ;C - - - - - 0x019F6D 0C:9F5D: A9 00
	STA objAnimFlags,X              ;C - - - - - 0x019F6F 0C:9F5F: 9D 90 05
	LDA #$32                        ;C - - - - - 0x019F72 0C:9F62: A9 32
	LDY #$32                        ;C - - - - - 0x019F74 0C:9F64: A0 32
	JSR CheckNearPlayer             ;C - - - - - 0x019F76 0C:9F66: 20 3E FB
	BCS loc_0C_9F7F                 ;C - - - - - 0x019F79 0C:9F69: B0 14
	LDA #$FF                        ;C - - - - - 0x019F7B 0C:9F6B: A9 FF
	STA objDownState,X              ;C - - - - - 0x019F7D 0C:9F6D: 9D C0 04
	LDA objXPage,X                  ;C - - - - - 0x019F80 0C:9F70: BD 80 03
	SEC                             ;C - - - - - 0x019F83 0C:9F73: 38
	SBC scrollXPage                 ;C - - - - - 0x019F84 0C:9F74: E5 F9
	LDA objX,X                      ;C - - - - - 0x019F86 0C:9F76: BD 60 03
	SBC scrollX                     ;C - - - - - 0x019F89 0C:9F79: E5 FC
	CMP #$40                        ;C - - - - - 0x019F8B 0C:9F7B: C9 40
	BCS loc_0C_9F8C                 ;C - - - - - 0x019F8D 0C:9F7D: B0 0D
loc_0C_9F7F:
	LDA #$00                        ;C - - - - - 0x019F8F 0C:9F7F: A9 00
	STA objDownState,X              ;C - - - - - 0x019F91 0C:9F81: 9D C0 04
	LDA #$80                        ;C - - - - - 0x019F94 0C:9F84: A9 80
	STA objActive,X                 ;C - - - - - 0x019F96 0C:9F86: 9D 00 03
	JMP loc_0C_9FBB                 ;C - - - - - 0x019F99 0C:9F89: 4C BB 9F
loc_0C_9F8C:
	RTS                             ;C - - - - - 0x019F9C 0C:9F8C: 60
EnemyAI_CdCommonTbl_9F8D:
	.byte $1B,$1E,$1B,$1E           ;- D 0 - - - 0x019F9D 0C:9F8D:
EnemyAI_VarCommonTbl_9F91:
	.byte $00,$00,$00,$03,$03,$03,$04,$04,$04,$00;- - - - - - 0x019FA1 0C:9F91:
	.byte $01                       ;- D 0 - - - 0x019FAB 0C:9F9B:
	.byte $01                       ;- - - - - - 0x019FAC 0C:9F9C:
	.byte $01,$02                   ;- D 0 - - - 0x019FAD 0C:9F9D:
	.byte $02                       ;- - - - - - 0x019FAF 0C:9F9F:
	.byte $02                       ;- D 0 - - - 0x019FB0 0C:9FA0:
	.byte $01                       ;- - - - - - 0x019FB1 0C:9FA1:
	.byte $01                       ;- D 0 - - - 0x019FB2 0C:9FA2:
	.byte $01                       ;- - - - - - 0x019FB3 0C:9FA3:
	.byte $02,$02,$02               ;- D 0 - - - 0x019FB4 0C:9FA4:
	.byte $04,$04,$04,$00,$01,$01,$01,$02,$02,$02;- - - - - - 0x019FB7 0C:9FA7:
	.byte $03                       ;- D 0 - - - 0x019FC1 0C:9FB1:
	.byte $03,$03                   ;- - - - - - 0x019FC2 0C:9FB2:
	.byte $05                       ;- D 0 - - - 0x019FC4 0C:9FB4:
	.byte $05,$05                   ;- - - - - - 0x019FC5 0C:9FB5:
	.byte $04                       ;- D 0 - - - 0x019FC7 0C:9FB7:
	.byte $04                       ;- - - - - - 0x019FC8 0C:9FB8:
	.byte $04                       ;- D 0 - - - 0x019FC9 0C:9FB9:
	.byte $00                       ;- - - - - - 0x019FCA 0C:9FBA:
loc_0C_9FBB:
	LDA objKind,X                   ;C - - - - - 0x019FCB 0C:9FBB: BD 20 03
	SEC                             ;C - - - - - 0x019FCE 0C:9FBE: 38
	SBC #$36                        ;C - - - - - 0x019FCF 0C:9FBF: E9 36
	TAY                             ;C - - - - - 0x019FD1 0C:9FC1: A8
	LDA EnemyAI_CdCommonTbl_9FCC,Y  ;C - - - - - 0x019FD2 0C:9FC2: B9 CC 9F
	STA objKind,X                   ;C - - - - - 0x019FD5 0C:9FC5: 9D 20 03
	STA objId,X                     ;C - - - - - 0x019FD8 0C:9FC8: 9D 30 03
	RTS                             ;C - - - - - 0x019FDB 0C:9FCB: 60
EnemyAI_CdCommonTbl_9FCC:
	.byte $20                       ;- - - - - - 0x019FDC 0C:9FCC:
	.byte $26,$30                   ;- D 0 - - - 0x019FDD 0C:9FCD:
	.byte $23,$29                   ;- - - - - - 0x019FDF 0C:9FCF:
	.byte $33                       ;- D 0 - - - 0x019FE1 0C:9FD1:
	.byte $24                       ;- - - - - - 0x019FE2 0C:9FD2:
	.byte $2A,$34                   ;- D 0 - - - 0x019FE3 0C:9FD3:
	.byte $20                       ;- - - - - - 0x019FE5 0C:9FD5:
	.byte $21                       ;- D 0 - - - 0x019FE6 0C:9FD6:
	.byte $27                       ;- - - - - - 0x019FE7 0C:9FD7:
	.byte $31,$22                   ;- D 0 - - - 0x019FE8 0C:9FD8:
	.byte $28                       ;- - - - - - 0x019FEA 0C:9FDA:
	.byte $32                       ;- D 0 - - - 0x019FEB 0C:9FDB:
	.byte $21                       ;- - - - - - 0x019FEC 0C:9FDC:
	.byte $27                       ;- D 0 - - - 0x019FED 0C:9FDD:
	.byte $31                       ;- - - - - - 0x019FEE 0C:9FDE:
	.byte $22,$28,$32               ;- D 0 - - - 0x019FEF 0C:9FDF:
	.byte $24,$2A,$34,$26,$21,$27,$31,$22,$28,$32;- - - - - - 0x019FF2 0C:9FE2:
	.byte $23                       ;- D 0 - - - 0x019FFC 0C:9FEC:
	.byte $29,$33                   ;- - - - - - 0x019FFD 0C:9FED:
	.byte $25                       ;- D 0 - - - 0x019FFF 0C:9FEF:
	.byte $2B,$35                   ;- - - - - - 0x01A000 0C:9FF0:
	.byte $24                       ;- D 0 - - - 0x01A002 0C:9FF2:
	.byte $2A                       ;- - - - - - 0x01A003 0C:9FF3:
	.byte $34                       ;- D 0 - - - 0x01A004 0C:9FF4:
	.byte $30                       ;- - - - - - 0x01A005 0C:9FF5:
; partly data-like, kept as is
EnemyRoutine9FF6:
	LDA objActive,X                 ;C - - - - - 0x01A006 0C:9FF6: BD 00 03
	CMP #$89                        ;C - - - - - 0x01A009 0C:9FF9: C9 89
	.byte $F0, $48                  ;C - - - - - BEQ loc_0D_A045 0x01A00B 0C:9FFB: (branch to another bank, kept as bytes)
	CMP #$8F                        ;C - - - - - 0x01A00D 0C:9FFD: C9 8F
	.byte $F0                       ;C - - - - - 0x01A00F 0C:9FFF: crosses into bank 0D: BEQ $A045 (rel)
