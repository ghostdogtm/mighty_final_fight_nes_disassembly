.segment "BANK_09"
; 0x012010-0x01400F  CPU $A000-$BFFF

SetSectionChr:
	ASL A                           ;C - - - - - 0x012010 09:A000: 0A
	PHA                             ;C - - - - - 0x012011 09:A001: 48
	TAX                             ;C - - - - - 0x012012 09:A002: AA
	LDA SetSectionChrTbl_A035,X     ;C - - - - - 0x012013 09:A003: BD 35 A0
	STA chrBankShadow+3             ;C - - - - - 0x012016 09:A006: 85 EB
	LDA SetSectionChrTbl_A036,X     ;C - - - - - 0x012018 09:A008: BD 36 A0
	STA chrBankShadow+4             ;C - - - - - 0x01201B 09:A00B: 85 EC
	LDA SetSectionChrTbl_A0B5,X     ;C - - - - - 0x01201D 09:A00D: BD B5 A0
	STA chrBankShadow+5             ;C - - - - - 0x012020 09:A010: 85 ED
	PLA                             ;C - - - - - 0x012022 09:A012: 68
LoadSpritePal2:
	ASL A                           ;C - - - - - 0x012023 09:A013: 0A
	ASL A                           ;C - - - - - 0x012024 09:A014: 0A
	TAY                             ;C - - - - - 0x012025 09:A015: A8
	LDA #$00                        ;C - - - - - 0x012026 09:A016: A9 00
	ADC #$A1                        ;C - - - - - 0x012028 09:A018: 69 A1
	STA ptr_00+1                    ;C - - - - - 0x01202A 09:A01A: 85 01
	LDA #$05                        ;C - - - - - 0x01202C 09:A01C: A9 05
	STA ptr_00                      ;C - - - - - 0x01202E 09:A01E: 85 00
	LDX #$00                        ;C - - - - - 0x012030 09:A020: A2 00
loc_09_A022:
	LDA (ptr_00),Y                  ;C - - - - - 0x012032 09:A022: B1 00
	STA palBuffer+24,X              ;C - - - - - 0x012034 09:A024: 9D 18 06
	STA palBase+24,X                ;C - - - - - 0x012037 09:A027: 9D 38 06
	INY                             ;C - - - - - 0x01203A 09:A02A: C8
	INX                             ;C - - - - - 0x01203B 09:A02B: E8
	CPX #$08                        ;C - - - - - 0x01203C 09:A02C: E0 08
	BNE loc_09_A022                 ;C - - - - - 0x01203E 09:A02E: D0 F2
	LDX #$FF                        ;C - - - - - 0x012040 09:A030: A2 FF
	STX palUpdateFlag               ;C - - - - - 0x012042 09:A032: 86 18
	RTS                             ;C - - - - - 0x012044 09:A034: 60
SetSectionChrTbl_A035:
	.byte $1D                       ;- D 1 - - - 0x012045 09:A035:
SetSectionChrTbl_A036:
	.byte $1E,$1D,$1E,$1D,$1F       ;- D 1 - - - 0x012046 09:A036:
	.byte $1D,$1E                   ;- - - - - - 0x01204B 09:A03B:
	.byte $00,$38,$00,$28,$24,$00,$00,$2C,$1D,$1E,$1D,$18,$00,$2C,$24,$00;- D 1 - - - 0x01204D 09:A03D:
	.byte $00,$2C                   ;- D 1 - - - 0x01205D 09:A04D:
	.byte $00,$28,$1D,$1E           ;- - - - - - 0x01205F 09:A04F:
	.byte $37,$20,$23,$23,$24,$18,$1D,$18,$1D,$1F,$24,$18,$1D,$1F,$1D,$1F;- D 1 - - - 0x012063 09:A053:
	.byte $1D,$18,$1D,$1F,$24,$18   ;- D 1 - - - 0x012073 09:A063:
	.byte $24,$18                   ;- - - - - - 0x012079 09:A069:
	.byte $1D,$18,$23,$23,$1D,$18   ;- D 1 - - - 0x01207B 09:A06B:
	.byte $1D,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x012081 09:A071:
	.res 52, $00                    ;- - - - - - 0x012091 09:A081: fill 52 bytes
SetSectionChrTbl_A0B5:
	.byte $1B                       ;- D 1 - - - 0x0120C5 09:A0B5:
	.byte $00                       ;- - - - - - 0x0120C6 09:A0B6:
	.byte $1B                       ;- D 1 - - - 0x0120C7 09:A0B7:
	.byte $00                       ;- - - - - - 0x0120C8 09:A0B8:
	.byte $1B                       ;- D 1 - - - 0x0120C9 09:A0B9:
	.byte $00,$00,$00               ;- - - - - - 0x0120CA 09:A0BA:
	.byte $00                       ;- D 1 - - - 0x0120CD 09:A0BD:
	.byte $00                       ;- - - - - - 0x0120CE 09:A0BE:
	.byte $00                       ;- D 1 - - - 0x0120CF 09:A0BF:
	.byte $00                       ;- - - - - - 0x0120D0 09:A0C0:
	.byte $00                       ;- D 1 - - - 0x0120D1 09:A0C1:
	.byte $00                       ;- - - - - - 0x0120D2 09:A0C2:
	.byte $2F                       ;- D 1 - - - 0x0120D3 09:A0C3:
	.byte $00                       ;- - - - - - 0x0120D4 09:A0C4:
	.byte $20                       ;- D 1 - - - 0x0120D5 09:A0C5:
	.byte $00                       ;- - - - - - 0x0120D6 09:A0C6:
	.byte $1B                       ;- D 1 - - - 0x0120D7 09:A0C7:
	.byte $00                       ;- - - - - - 0x0120D8 09:A0C8:
	.byte $2F                       ;- D 1 - - - 0x0120D9 09:A0C9:
	.byte $00                       ;- - - - - - 0x0120DA 09:A0CA:
	.byte $00                       ;- D 1 - - - 0x0120DB 09:A0CB:
	.byte $00                       ;- - - - - - 0x0120DC 09:A0CC:
	.byte $2F                       ;- D 1 - - - 0x0120DD 09:A0CD:
	.byte $00,$00,$00,$1B,$00       ;- - - - - - 0x0120DE 09:A0CE:
	.byte $18                       ;- D 1 - - - 0x0120E3 09:A0D3:
	.byte $00                       ;- - - - - - 0x0120E4 09:A0D4:
	.byte $35                       ;- D 1 - - - 0x0120E5 09:A0D5:
	.byte $00                       ;- - - - - - 0x0120E6 09:A0D6:
	.byte $1B                       ;- D 1 - - - 0x0120E7 09:A0D7:
	.byte $00                       ;- - - - - - 0x0120E8 09:A0D8:
	.byte $20                       ;- D 1 - - - 0x0120E9 09:A0D9:
	.byte $00                       ;- - - - - - 0x0120EA 09:A0DA:
	.byte $1B                       ;- D 1 - - - 0x0120EB 09:A0DB:
	.byte $00                       ;- - - - - - 0x0120EC 09:A0DC:
	.byte $20                       ;- D 1 - - - 0x0120ED 09:A0DD:
	.byte $00                       ;- - - - - - 0x0120EE 09:A0DE:
	.byte $20                       ;- D 1 - - - 0x0120EF 09:A0DF:
	.byte $00                       ;- - - - - - 0x0120F0 09:A0E0:
	.byte $1B                       ;- D 1 - - - 0x0120F1 09:A0E1:
	.byte $00                       ;- - - - - - 0x0120F2 09:A0E2:
	.byte $20                       ;- D 1 - - - 0x0120F3 09:A0E3:
	.byte $00                       ;- - - - - - 0x0120F4 09:A0E4:
	.byte $1B                       ;- D 1 - - - 0x0120F5 09:A0E5:
	.byte $00                       ;- - - - - - 0x0120F6 09:A0E6:
	.byte $20                       ;- D 1 - - - 0x0120F7 09:A0E7:
	.byte $00,$1B,$00               ;- - - - - - 0x0120F8 09:A0E8:
	.byte $20                       ;- D 1 - - - 0x0120FB 09:A0EB:
	.byte $00                       ;- - - - - - 0x0120FC 09:A0EC:
	.byte $35                       ;- D 1 - - - 0x0120FD 09:A0ED:
	.byte $00                       ;- - - - - - 0x0120FE 09:A0EE:
	.byte $1B                       ;- D 1 - - - 0x0120FF 09:A0EF:
	.byte $00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x012100 09:A0F0:
	.byte $00,$00,$00,$00,$00       ;- - - - - - 0x012110 09:A100:
	.byte $0F,$0F,$30,$00,$0F,$0F,$30,$11,$0F,$0F,$30,$04,$0F,$0F,$30,$19;- D 1 - I - 0x012115 09:A105:
	.byte $0F,$0F,$30,$23,$0F,$0F,$30,$14,$0F,$0F,$30,$01,$0F,$0F,$30,$25;- D 1 - I - 0x012125 09:A115:
	.byte $0F,$0F,$20,$2C,$0F,$0F,$20,$00,$0F,$0F,$30,$21,$0F,$0F,$36,$17;- D 1 - I - 0x012135 09:A125:
	.byte $0F,$0F,$30,$23,$0F,$0F,$30,$25,$0F,$0F,$30,$21,$0F,$0F,$38,$15;- D 1 - I - 0x012145 09:A135:
	.byte $0F,$0F,$30,$14,$0F,$0F,$30,$01,$0F,$0F,$30,$01,$0F,$0F,$30,$01;- D 1 - I - 0x012155 09:A145:
	.byte $0F,$0F,$30,$15,$0F,$0F,$30,$22,$0F,$0F,$30,$19,$0F,$0F,$30,$22;- D 1 - I - 0x012165 09:A155:
	.byte $0F,$0F,$30,$00,$0F,$0F,$30,$0F;- D 1 - I - 0x012175 09:A165:
	.res 10, $0F                    ;- - - - - - 0x01217D 09:A16D: fill 10 bytes
	.byte $30,$12,$0F,$0F,$30,$25   ;- - - - - - 0x012187 09:A177:
	.byte $0F,$0F,$30,$21,$0F,$0F,$30,$12,$0F,$0F,$27,$17,$0F,$0F,$30,$25;- D 1 - I - 0x01218D 09:A17D:
	.byte $0F,$0F,$30,$14,$0F,$0F,$30,$14,$0F,$0F,$30,$19,$0F,$0F,$30,$12;- D 1 - I - 0x01219D 09:A18D:
	.byte $0F,$0F,$30,$15,$0F,$0F,$30,$14,$0F,$0F,$30,$01,$0F,$0F,$30,$14;- D 1 - I - 0x0121AD 09:A19D:
	.byte $0F,$0F,$30,$19,$0F,$0F,$30,$01,$0F,$0F,$30,$14,$0F,$0F,$30,$00;- D 1 - I - 0x0121BD 09:A1AD:
	.byte $0F,$0F,$30,$19,$0F,$0F,$30,$12,$0F,$0F,$30,$12,$0F,$0F,$30,$14;- D 1 - I - 0x0121CD 09:A1BD:
	.byte $0F,$0F,$30,$01,$0F,$0F,$30,$19;- D 1 - I - 0x0121DD 09:A1CD:
	.byte $0F,$0F,$30,$01,$0F,$0F,$30,$01;- - - - - - 0x0121E5 09:A1D5:
	.byte $0F,$0F,$30,$00,$0F,$0F,$30,$14,$0F,$0F,$27,$15,$0F,$0F,$30,$25;- D 1 - I - 0x0121ED 09:A1DD:
	.byte $0F,$0F,$30,$01,$0F,$0F,$30,$21;- D 1 - I - 0x0121FD 09:A1ED:
	.byte $0F,$0F,$30,$12,$0F,$0F,$30,$00,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F;- - - - - - 0x012205 09:A1F5:
	.res 64, $0F                    ;- - - - - - 0x012215 09:A205: fill 64 bytes
	.byte $D1,$38,$1A,$20,$00,$20,$90,$7E,$42,$20,$00,$90,$4A,$20,$9B,$A0;- - - - - - 0x012255 09:A245:
	.byte $57,$02,$91,$A2,$F5,$80,$3F,$02,$21,$00,$28,$B2,$45,$AA,$BE,$2A;- - - - - - 0x012265 09:A255:
	.byte $AE,$AA,$7D,$FA,$EA,$AA,$DF,$B2,$FE,$7C,$B7,$86,$6E,$BE,$4F,$B2;- - - - - - 0x012275 09:A265:
	.byte $F1,$AC,$B7,$A3,$7F,$AA,$87,$BA,$B3,$8A,$7F,$00,$40,$88,$0B,$86;- - - - - - 0x012285 09:A275:
	.byte $18,$A8,$95,$22,$53,$80,$C2,$80,$2D,$88,$11,$22,$01,$0A,$78,$02;- - - - - - 0x012295 09:A285:
	.byte $8A,$A2,$3E,$28,$49,$2A,$20,$02,$F9,$80,$09,$A2,$77,$BA,$FF,$AA;- - - - - - 0x0122A5 09:A295:
	.byte $7C,$28,$6D,$E2,$DD,$EC,$EF,$A3,$FD,$EB,$FD,$87,$FF,$A2,$3D,$AA;- - - - - - 0x0122B5 09:A2A5:
	.byte $1F,$A2,$FF,$EA,$7F,$AB,$73,$AA,$3F,$B2,$FF,$29,$66,$00,$76,$A2;- - - - - - 0x0122C5 09:A2B5:
	.byte $60,$82,$78,$AA,$D7,$AA,$CB,$A8,$D9,$C2,$7C,$E8,$A6,$A8,$3D,$A2;- - - - - - 0x0122D5 09:A2C5:
	.byte $FA,$29,$7C,$A8,$CD,$00,$01,$A8,$C9,$28,$D5,$8A,$36,$E1,$F4,$EA;- - - - - - 0x0122E5 09:A2D5:
	.byte $3D,$FA,$FF,$E3,$FF,$A2,$FF,$0A,$FB,$CA,$3F,$AF,$ED,$02,$3C,$A3;- - - - - - 0x0122F5 09:A2E5:
	.byte $FF,$3C,$FF,$6A,$EB,$EA,$F7,$AA,$FC,$A9,$E7;- - - - - - 0x012305 09:A2F5:
PaletteAnimTick:
	LDA #$03                        ;C - - - - - 0x012310 09:A300: A9 03
	STA spriteFlipMask              ;C - - - - - 0x012312 09:A302: 85 10
	LDA palUpdateFlag               ;C - - - - - 0x012314 09:A304: A5 18
	AND #$01                        ;C - - - - - 0x012316 09:A306: 29 01
	STA spritePriorityBit           ;C - - - - - 0x012318 09:A308: 85 11
	LDA #$00                        ;C - - - - - 0x01231A 09:A30A: A9 00
	STA palUpdateFlag               ;C - - - - - 0x01231C 09:A30C: 85 18
loc_09_A30E:
	LDX spriteFlipMask              ;C - - - - - 0x01231E 09:A30E: A6 10
	LDA palAnimActive,X             ;C - - - - - 0x012320 09:A310: BD 00 01
	BPL loc_09_A318                 ;C - - - - - 0x012323 09:A313: 10 03
	JSR PaletteAnimChannel          ;C - - - - - 0x012325 09:A315: 20 21 A3
loc_09_A318:
	DEC spriteFlipMask              ;C - - - - - 0x012328 09:A318: C6 10
	BPL loc_09_A30E                 ;C - - - - - 0x01232A 09:A31A: 10 F2
	LDA spritePriorityBit           ;C - - - - - 0x01232C 09:A31C: A5 11
	STA palUpdateFlag               ;C - - - - - 0x01232E 09:A31E: 85 18
	RTS                             ;C - - - - - 0x012330 09:A320: 60
PaletteAnimChannel:
	LDY palAnimType,X               ;C - - - - - 0x012331 09:A321: BC 08 01
	LDA PaletteAnimChannelTbl_A445,Y;C - - - - - 0x012334 09:A324: B9 45 A4
	TAY                             ;C - - - - - 0x012337 09:A327: A8
	LDA palAnimTimer,X              ;C - - - - - 0x012338 09:A328: BD 0C 01
	INC palAnimTimer,X              ;C - - - - - 0x01233B 09:A32B: FE 0C 01
	CMP PaletteAnimChannelTbl_A459,Y;C - - - - - 0x01233E 09:A32E: D9 59 A4
	BNE loc_09_A36F                 ;C - - - - - 0x012341 09:A331: D0 3C
	LDA #$00                        ;C - - - - - 0x012343 09:A333: A9 00
	STA palAnimTimer,X              ;C - - - - - 0x012345 09:A335: 9D 0C 01
	LDA palAnimStep,X               ;C - - - - - 0x012348 09:A338: BD 04 01
	INC palAnimStep,X               ;C - - - - - 0x01234B 09:A33B: FE 04 01
	CMP PaletteAnimChannelTbl_A458,Y;C - - - - - 0x01234E 09:A33E: D9 58 A4
	BNE loc_09_A348                 ;C - - - - - 0x012351 09:A341: D0 05
	LDA #$00                        ;C - - - - - 0x012353 09:A343: A9 00
	STA palAnimStep,X               ;C - - - - - 0x012355 09:A345: 9D 04 01
loc_09_A348:
	TYA                             ;C - - - - - 0x012358 09:A348: 98
	CLC                             ;C - - - - - 0x012359 09:A349: 18
	ADC palAnimStep,X               ;C - - - - - 0x01235A 09:A34A: 7D 04 01
	TAX                             ;C - - - - - 0x01235D 09:A34D: AA
	LDA PaletteAnimChannelTbl_A45B,X;C - - - - - 0x01235E 09:A34E: BD 5B A4
	ASL A                           ;C - - - - - 0x012361 09:A351: 0A
	ADC PaletteAnimChannelTbl_A45B,X;C - - - - - 0x012362 09:A352: 7D 5B A4
	TAX                             ;C - - - - - 0x012365 09:A355: AA
	LDA PaletteAnimChannelTbl_A45A,Y;C - - - - - 0x012366 09:A356: B9 5A A4
	TAY                             ;C - - - - - 0x012369 09:A359: A8
	LDA #$03                        ;C - - - - - 0x01236A 09:A35A: A9 03
	STA ptr_00                      ;C - - - - - 0x01236C 09:A35C: 85 00
loc_09_A35E:
	LDA PaletteAnimChannelTbl_A370,X;C - - - - - 0x01236E 09:A35E: BD 70 A3
	STA palBuffer,Y                 ;C - - - - - 0x012371 09:A361: 99 00 06
	STA palBase,Y                   ;C - - - - - 0x012374 09:A364: 99 20 06
	INY                             ;C - - - - - 0x012377 09:A367: C8
	INX                             ;C - - - - - 0x012378 09:A368: E8
	DEC ptr_00                      ;C - - - - - 0x012379 09:A369: C6 00
	BNE loc_09_A35E                 ;C - - - - - 0x01237B 09:A36B: D0 F1
	INC spritePriorityBit           ;C - - - - - 0x01237D 09:A36D: E6 11
loc_09_A36F:
	RTS                             ;C - - - - - 0x01237F 09:A36F: 60
PaletteAnimChannelTbl_A370:
	.byte $14,$2A,$12,$04,$2A,$12,$0F,$00,$01,$0C,$00,$01,$01,$00,$01;- - - - - - 0x012380 09:A370:
	.byte $06,$0F,$2C,$06,$0F,$12   ;- D 1 - - - 0x01238F 09:A37F:
	.byte $06,$37,$0F               ;- - - - - - 0x012395 09:A385:
	.byte $05,$23,$05,$05,$23,$15,$05,$23,$05,$05,$23,$05,$05,$23,$05,$05;- D 1 - - - 0x012398 09:A388:
	.byte $23,$05,$05,$23,$05,$05,$23,$05,$05,$23,$05,$05,$23,$05,$05,$23;- D 1 - - - 0x0123A8 09:A398:
	.byte $15,$05,$23,$15,$05,$23,$15,$05,$23,$05,$05,$23,$05,$05,$23,$15;- D 1 - - - 0x0123B8 09:A3A8:
	.byte $15,$05,$27,$15,$27,$15,$0F,$07,$17,$17,$0F,$07,$07,$17,$0F,$15;- D 1 - - - 0x0123C8 09:A3B8:
	.byte $27,$17,$15,$17,$27,$18,$27,$15,$18,$27,$35,$18,$27,$25,$18,$27;- D 1 - - - 0x0123D8 09:A3C8:
	.byte $15                       ;- D 1 - - - 0x0123E8 09:A3D8:
	.byte $18,$23,$12,$08,$23,$12,$20,$23,$16,$20,$23,$26,$20,$23,$36,$20;- - - - - - 0x0123E9 09:A3D9:
	.byte $23,$06                   ;- - - - - - 0x0123F9 09:A3E9:
	.byte $0C,$12,$05,$12,$0C,$05   ;- D 1 - - - 0x0123FB 09:A3EB:
	.byte $12,$05,$27,$12,$27,$05   ;- - - - - - 0x012401 09:A3F1:
	.byte $11,$0F,$21,$0F,$21,$11,$21,$11,$0F,$0F,$11,$11,$11,$11,$0F,$16;- D 1 - - - 0x012407 09:A3F7:
	.byte $23,$13,$06,$23,$13,$16,$23,$13,$26,$23,$13,$15,$05,$27,$15,$27;- D 1 - - - 0x012417 09:A407:
	.byte $05,$05,$13,$03,$15,$13,$03,$25,$13,$03,$25,$13,$03,$25,$13,$03;- D 1 - - - 0x012427 09:A417:
	.byte $15,$13,$03,$05,$13,$03   ;- D 1 - - - 0x012437 09:A427:
	.byte $06,$0F,$0F               ;- - - - - - 0x01243D 09:A42D:
	.byte $06,$27,$16,$06,$16,$16   ;- D 1 - - - 0x012440 09:A430:
	.byte $06,$16,$06,$06,$16,$06   ;- - - - - - 0x012446 09:A436:
	.byte $18,$13,$03,$03,$13,$03,$13,$13,$03;- D 1 - - - 0x01244C 09:A43C:
PaletteAnimChannelTbl_A445:
	.byte $00,$05                   ;- - - - - - 0x012455 09:A445:
	.byte $0B,$3E,$51,$56,$5C,$61,$67;- D 1 - - - 0x012457 09:A447:
	.byte $6E                       ;- - - - - - 0x01245E 09:A44E:
	.byte $72                       ;- D 1 - - - 0x01245F 09:A44F:
	.byte $77                       ;- - - - - - 0x012460 09:A450:
	.byte $7C,$82,$87,$8E,$93,$9D,$D0;- D 1 - - - 0x012461 09:A451:
PaletteAnimChannelTbl_A458:
	.byte $01                       ;- - - - - - 0x012468 09:A458:
PaletteAnimChannelTbl_A459:
	.byte $0A                       ;- - - - - - 0x012469 09:A459:
PaletteAnimChannelTbl_A45A:
	.byte $05                       ;- - - - - - 0x01246A 09:A45A:
PaletteAnimChannelTbl_A45B:
	.byte $00,$01,$02,$1E,$05,$02,$03,$04;- - - - - - 0x01246B 09:A45B:
	.byte $2F,$01,$09,$05,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06;- D 1 - - - 0x012473 09:A463:
	.byte $06,$06,$06,$05,$06,$06,$06,$06,$06,$06,$06,$05,$06,$06,$06,$06;- D 1 - - - 0x012483 09:A473:
	.byte $06,$06,$06,$05,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06;- D 1 - - - 0x012493 09:A483:
	.byte $06,$06,$06,$0F,$07,$0D,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$11;- D 1 - - - 0x0124A3 09:A493:
	.byte $12,$13,$14,$15,$16,$17,$01,$08,$0D,$18,$19,$02,$0C,$09,$1A,$1B;- D 1 - - - 0x0124B3 09:A4A3:
	.byte $1C,$01,$06,$0D,$1D,$1E,$02,$0C,$09,$1C,$1B,$1A,$03,$0C,$05,$1F;- D 1 - - - 0x0124C3 09:A4B3:
	.byte $20,$21,$22               ;- D 1 - - - 0x0124D3 09:A4C3:
	.byte $00,$0C,$01,$25           ;- - - - - - 0x0124D6 09:A4C6:
	.byte $01,$08,$09,$29,$2A       ;- D 1 - - - 0x0124DA 09:A4CA:
	.byte $01,$06,$05,$2B,$2C       ;- - - - - - 0x0124DF 09:A4CF:
	.byte $02,$0C,$09,$2D,$2E,$2F,$01,$10,$0D,$30,$31,$03,$14,$09,$32,$33;- D 1 - - - 0x0124E4 09:A4D4:
	.byte $34,$35,$01,$0C,$0D,$36,$37,$06,$18,$0D,$38,$39,$3A,$3B,$3C,$3D;- D 1 - - - 0x0124F4 09:A4E4:
	.byte $3E,$2F,$01,$0D,$40,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41;- D 1 - - - 0x012504 09:A4F4:
	.byte $41,$41,$41,$41,$40,$41,$41,$41,$41,$41,$41,$41,$40,$41,$41,$41;- D 1 - - - 0x012514 09:A504:
	.byte $41,$41,$41,$41,$40,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41;- D 1 - - - 0x012524 09:A514:
	.byte $41,$41,$41,$41,$02,$16,$0D,$44,$45,$46;- D 1 - - - 0x012534 09:A524:
	.byte $04,$00,$60,$00,$00,$00,$08,$44,$21,$10,$00,$15,$80,$10,$08,$00;- - - - - - 0x01253E 09:A52E:
	.byte $00,$00,$25,$04,$40,$00,$20,$10,$03,$04,$20,$40,$04,$00,$02,$01;- - - - - - 0x01254E 09:A53E:
	.byte $03,$00,$01,$40,$08,$00,$30,$01,$00,$01,$00,$00,$80,$11,$09,$00;- - - - - - 0x01255E 09:A54E:
	.byte $80,$02,$26,$40,$87,$00,$00,$40,$84,$00,$05,$10,$20,$10,$2C,$44;- - - - - - 0x01256E 09:A55E:
	.byte $20,$00,$00,$01,$10,$10,$00,$10,$00,$00,$40,$00,$12,$00,$03,$14;- - - - - - 0x01257E 09:A56E:
	.byte $00,$04,$01,$44,$01,$00,$08,$10,$00,$00,$80,$10,$00,$40,$00,$00;- - - - - - 0x01258E 09:A57E:
	.byte $20,$40,$08,$40,$31,$14,$01,$04,$C0,$00,$00,$00,$18,$00,$00,$00;- - - - - - 0x01259E 09:A58E:
	.byte $0C,$10,$10,$04,$02,$00,$04,$41,$05,$00,$00,$00,$29,$41,$41,$00;- - - - - - 0x0125AE 09:A59E:
	.byte $80,$04,$81,$04,$00,$04,$00,$00,$41,$04,$40,$01,$22,$01,$10,$00;- - - - - - 0x0125BE 09:A5AE:
	.byte $04,$01,$01,$01,$48,$40,$22,$40,$81,$01,$03,$40,$0D,$45,$04,$05;- - - - - - 0x0125CE 09:A5BE:
	.byte $02,$00,$01,$00,$82,$04,$00,$10,$08,$04,$80,$44,$12,$10,$00,$40;- - - - - - 0x0125DE 09:A5CE:
	.byte $05,$04,$09,$10,$60,$00,$C2,$44,$D1,$09,$08,$01,$14,$01,$11,$04;- - - - - - 0x0125EE 09:A5DE:
	.byte $61,$00,$04,$01,$20,$10,$04,$01,$00,$00,$20,$01,$40,$00,$00,$10;- - - - - - 0x0125FE 09:A5EE:
	.byte $00,$04,$08,$00,$04,$00,$00,$14,$00,$00,$01,$54,$50,$00,$02,$01;- - - - - - 0x01260E 09:A5FE:
	.byte $00,$04,$48,$00,$82,$10,$00,$04,$00,$14,$01,$00,$00,$40,$08,$40;- - - - - - 0x01261E 09:A60E:
	.byte $0A,$00,$39,$01,$06,$04,$04,$55,$90,$41,$90,$11,$88,$00,$B0,$00;- - - - - - 0x01262E 09:A61E:
	.byte $80,$00,$00,$05,$40,$00,$E0,$05,$A0,$00,$43,$C0,$00,$04,$02,$00;- - - - - - 0x01263E 09:A62E:
	.byte $18,$00,$D9,$01,$20,$01,$00,$15,$18,$45,$81,$01,$1C,$10,$00,$04;- - - - - - 0x01264E 09:A63E:
	.byte $40,$40,$84,$11,$00,$04,$06,$04,$68,$00,$08,$00,$8A,$00,$1C,$00;- - - - - - 0x01265E 09:A64E:
	.byte $03,$00,$40,$00,$9D,$50,$07,$10,$25,$10,$02,$40,$82,$85,$01,$00;- - - - - - 0x01266E 09:A65E:
	.byte $29,$00,$88,$01,$40,$00,$22,$01,$80,$00,$88,$10,$21,$04,$00,$01;- - - - - - 0x01267E 09:A66E:
	.byte $02,$04,$04,$04,$60,$00,$11,$10,$4E,$11,$32,$00,$20,$00,$A0,$50;- - - - - - 0x01268E 09:A67E:
	.byte $10,$00,$A0,$01,$00,$14,$62,$10,$00,$41,$88,$05,$23,$00,$10,$44;- - - - - - 0x01269E 09:A68E:
	.byte $08,$00,$09,$11,$58,$10,$A2,$05,$00,$05,$02,$14,$50,$50,$02,$44;- - - - - - 0x0126AE 09:A69E:
	.byte $01,$40,$08,$14,$11,$04,$10,$10,$20,$40,$22,$04,$40,$00,$04,$10;- - - - - - 0x0126BE 09:A6AE:
	.byte $00,$00,$00,$40,$08,$00,$0D,$04,$00,$40,$22,$00,$80,$00,$11,$00;- - - - - - 0x0126CE 09:A6BE:
	.byte $00,$00,$40,$00,$0C,$01,$80,$80,$40,$01,$0A,$00,$10,$10,$00,$01;- - - - - - 0x0126DE 09:A6CE:
	.byte $02,$04,$01,$40,$81,$14,$44,$04,$00,$40,$22,$00,$A2,$01,$80,$41;- - - - - - 0x0126EE 09:A6DE:
	.byte $08,$40,$20,$04,$41,$00,$C0,$04,$10,$00,$00,$00,$06,$00,$84,$10;- - - - - - 0x0126FE 09:A6EE:
	.byte $20,$00                   ;- - - - - - 0x01270E 09:A6FE:
RunTextScript_09:
	JSR ClearTextQueueRows_09       ;C - - - - - 0x012710 09:A700: 20 8E A7
	LDY textScriptIdx               ;C - - - - - 0x012713 09:A703: A4 B8
	LDA RunTextScript_09Tbl_A7D6,Y  ;C - - - - - 0x012715 09:A705: B9 D6 A7
	STA ptr_0C                      ;C - - - - - 0x012718 09:A708: 85 0C
	LDA RunTextScript_09Tbl_A7DB,Y  ;C - - - - - 0x01271A 09:A70A: B9 DB A7
	STA ptr_0C+1                    ;C - - - - - 0x01271D 09:A70D: 85 0D
	LDA #$00                        ;C - - - - - 0x01271F 09:A70F: A9 00
	STA ptr_0E                      ;C - - - - - 0x012721 09:A711: 85 0E
loc_09_A713:
	LDA #$00                        ;C - - - - - 0x012723 09:A713: A9 00
	STA spriteFlipMask              ;C - - - - - 0x012725 09:A715: 85 10
	STA spriteBaseY                 ;C - - - - - 0x012727 09:A717: 85 12
loc_09_A719:
	LDA #$00                        ;C - - - - - 0x012729 09:A719: A9 00
	STA spritePriorityBit           ;C - - - - - 0x01272B 09:A71B: 85 11
loc_09_A71D:
	LDX spriteFlipMask              ;C - - - - - 0x01272D 09:A71D: A6 10
	LDA RunTextScript_09Tbl_A782,X  ;C - - - - - 0x01272F 09:A71F: BD 82 A7
	STA vramQueue                   ;C - - - - - 0x012732 09:A722: 8D 80 07
	LDA RunTextScript_09Tbl_A785,X  ;C - - - - - 0x012735 09:A725: BD 85 A7
	CLC                             ;C - - - - - 0x012738 09:A728: 18
	ADC spritePriorityBit           ;C - - - - - 0x012739 09:A729: 65 11
	STA vramQueue+1                 ;C - - - - - 0x01273B 09:A72B: 8D 81 07
	LDA #$00                        ;C - - - - - 0x01273E 09:A72E: A9 00
	STA vramQueue+2                 ;C - - - - - 0x012740 09:A730: 8D 82 07
	LDY ptr_0E                      ;C - - - - - 0x012743 09:A733: A4 0E
	INC ptr_0E                      ;C - - - - - 0x012745 09:A735: E6 0E
	LDA (ptr_0C),Y                  ;C - - - - - 0x012747 09:A737: B1 0C
	CMP #$FF                        ;C - - - - - 0x012749 09:A739: C9 FF
	BEQ loc_09_A77E                 ;C - - - - - 0x01274B 09:A73B: F0 41
	CMP #$FE                        ;C - - - - - 0x01274D 09:A73D: C9 FE
	BEQ loc_09_A76D                 ;C - - - - - 0x01274F 09:A73F: F0 2C
	STA vramQueue+3                 ;C - - - - - 0x012751 09:A741: 8D 83 07
	LDA #$FF                        ;C - - - - - 0x012754 09:A744: A9 FF
	STA vramQueue+4                 ;C - - - - - 0x012756 09:A746: 8D 84 07
	STA vramUpdateFlag0             ;C - - - - - 0x012759 09:A749: 85 19
	LDA spriteFlipMask              ;C - - - - - 0x01275B 09:A74B: A5 10
	PHA                             ;C - - - - - 0x01275D 09:A74D: 48
	LDA spritePriorityBit           ;C - - - - - 0x01275E 09:A74E: A5 11
	PHA                             ;C - - - - - 0x012760 09:A750: 48
	JSR MoveXSubSlot0               ;C - - - - - 0x012761 09:A751: 20 88 A7
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012764 09:A754: 20 06 F4
	PLA                             ;C - - - - - 0x012767 09:A757: 68
	STA spritePriorityBit           ;C - - - - - 0x012768 09:A758: 85 11
	PLA                             ;C - - - - - 0x01276A 09:A75A: 68
	STA spriteFlipMask              ;C - - - - - 0x01276B 09:A75B: 85 10
	INC spritePriorityBit           ;C - - - - - 0x01276D 09:A75D: E6 11
	LDA frameCounter                ;C - - - - - 0x01276F 09:A75F: A5 92
	AND #$03                        ;C - - - - - 0x012771 09:A761: 29 03
	BNE loc_09_A76A                 ;C - - - - - 0x012773 09:A763: D0 05
	LDA #$2B                        ;C - - - - - 0x012775 09:A765: A9 2B
	JSR QueueSound                  ;C - - - - - 0x012777 09:A767: 20 4C F3
loc_09_A76A:
	JMP loc_09_A71D                 ;C - - - - - 0x01277A 09:A76A: 4C 1D A7
loc_09_A76D:
	INC spriteFlipMask              ;C - - - - - 0x01277D 09:A76D: E6 10
	LDA spriteFlipMask              ;C - - - - - 0x01277F 09:A76F: A5 10
	CMP #$03                        ;C - - - - - 0x012781 09:A771: C9 03
	BNE loc_09_A719                 ;C - - - - - 0x012783 09:A773: D0 A4
	JSR Wait180Frames               ;C - - - - - 0x012785 09:A775: 20 D0 A7
	JSR ClearTextQueueRows_09       ;C - - - - - 0x012788 09:A778: 20 8E A7
	JMP loc_09_A713                 ;C - - - - - 0x01278B 09:A77B: 4C 13 A7
loc_09_A77E:
	JMP Wait180Frames               ;C - - - - - 0x01278E 09:A77E: 4C D0 A7
	.byte $60                       ;- - - - - - 0x012791 09:A781:
RunTextScript_09Tbl_A782:
	.byte $21,$21,$22               ;- D 1 - - - 0x012792 09:A782:
RunTextScript_09Tbl_A785:
	.byte $A7,$E7,$27               ;- D 1 - - - 0x012795 09:A785:
MoveXSubSlot0:
	LDX #$00                        ;C - - - - - 0x012798 09:A788: A2 00
	JSR ApplyVelXSub                ;C - - - - - 0x01279A 09:A78A: 20 A1 F1
	RTS                             ;C - - - - - 0x01279D 09:A78D: 60
ClearTextQueueRows_09:
	LDA #$22                        ;C - - - - - 0x01279E 09:A78E: A9 22
	STA vramQueue+4                 ;C - - - - - 0x0127A0 09:A790: 8D 84 07
	LDA #$21                        ;C - - - - - 0x0127A3 09:A793: A9 21
	STA vramQueue+48                ;C - - - - - 0x0127A5 09:A795: 8D B0 07
	STA vramQueue+26                ;C - - - - - 0x0127A8 09:A798: 8D 9A 07
	LDA #$27                        ;C - - - - - 0x0127AB 09:A79B: A9 27
	STA vramQueue+5                 ;C - - - - - 0x0127AD 09:A79D: 8D 85 07
	LDA #$E7                        ;C - - - - - 0x0127B0 09:A7A0: A9 E7
	STA vramQueue+27                ;C - - - - - 0x0127B2 09:A7A2: 8D 9B 07
	LDA #$A7                        ;C - - - - - 0x0127B5 09:A7A5: A9 A7
	STA vramQueue+49                ;C - - - - - 0x0127B7 09:A7A7: 8D B1 07
	LDX #$12                        ;C - - - - - 0x0127BA 09:A7AA: A2 12
	STX vramQueue+6                 ;C - - - - - 0x0127BC 09:A7AC: 8E 86 07
	STX vramQueue+28                ;C - - - - - 0x0127BF 09:A7AF: 8E 9C 07
	STX vramQueue+50                ;C - - - - - 0x0127C2 09:A7B2: 8E B2 07
	LDY #$00                        ;C - - - - - 0x0127C5 09:A7B5: A0 00
	LDA #$00                        ;C - - - - - 0x0127C7 09:A7B7: A9 00
loc_09_A7B9:
	STA vramQueue+7,Y               ;C - - - - - 0x0127C9 09:A7B9: 99 87 07
	STA vramQueue+29,Y              ;C - - - - - 0x0127CC 09:A7BC: 99 9D 07
	STA vramQueue+51,Y              ;C - - - - - 0x0127CF 09:A7BF: 99 B3 07
	INY                             ;C - - - - - 0x0127D2 09:A7C2: C8
	DEX                             ;C - - - - - 0x0127D3 09:A7C3: CA
	BPL loc_09_A7B9                 ;C - - - - - 0x0127D4 09:A7C4: 10 F3
	LDA #$FF                        ;C - - - - - 0x0127D6 09:A7C6: A9 FF
	STA vramQueue+70                ;C - - - - - 0x0127D8 09:A7C8: 8D C6 07
	STA vramUpdateFlag0             ;C - - - - - 0x0127DB 09:A7CB: 85 19
	JMP WaitFrame                   ;C - - - - - 0x0127DD 09:A7CD: 4C 31 FF
Wait180Frames:
	LDX #$B4                        ;C - - - - - 0x0127E0 09:A7D0: A2 B4
	JSR WaitFrames                  ;C - - - - - 0x0127E2 09:A7D2: 20 2A FF
	RTS                             ;C - - - - - 0x0127E5 09:A7D5: 60
RunTextScript_09Tbl_A7D6:
	.lobytes RunTextScript_09Tbl_A7D6_00, RunTextScript_09Tbl_A7D6_01, RunTextScript_09Tbl_A7D6_02, RunTextScript_09Tbl_A7D6_03, RunTextScript_09Tbl_A7D6_04;- D 1 - - - 0x0127E6 09:A7D6:
RunTextScript_09Tbl_A7DB:
	.hibytes RunTextScript_09Tbl_A7D6_00, RunTextScript_09Tbl_A7D6_01, RunTextScript_09Tbl_A7D6_02, RunTextScript_09Tbl_A7D6_03, RunTextScript_09Tbl_A7D6_04;- D 1 - - - 0x0127EB 09:A7DB:
RunTextScript_09Tbl_A7D6_00:
	.byte $00,$00,$00,$00,$00,$22,$00,$23,$00,$10,$00,$15,$00,$15,$FE;- D 1 - I - 0x0127F0 09:A7E0: "     S T A F F/"
	.byte $FE                       ;- D 1 - I - 0x0127FF 09:A7EF: "/"
	.byte $FF                       ;- D 1 - I - 0x012800 09:A7F0: "$"
RunTextScript_09Tbl_A7D6_01:
	.byte $00,$00,$00,$00,$00,$00,$1F,$1B,$10,$1D,$1D,$14,$21,$FE;- D 1 - I - 0x012801 09:A7F1: "      PLANNER/"
	.res 8, $00                     ;- D 1 - I - 0x01280F 09:A7FF: fill 8 bytes
	.byte $1A,$2B,$1E,$FE           ;- D 1 - I - 0x012817 09:A807: "K.O/"
	.byte $FE                       ;- D 1 - I - 0x01281B 09:A80B: "/"
	.byte $00,$00,$00,$00,$1F,$21,$1E,$16,$21,$10,$1C,$1C,$14,$21,$FE;- D 1 - I - 0x01281C 09:A80C: "    PROGRAMMER/"
	.byte $FE                       ;- D 1 - I - 0x01282B 09:A81B: "/"
	.byte $FE                       ;- D 1 - I - 0x01282C 09:A81C: "/"
	.byte $00,$00,$00,$00,$00,$00,$12,$17,$18,$1F,$22,$FE;- D 1 - I - 0x01282D 09:A81D: "      CHIPS/"
	.byte $00,$00,$00,$00,$00,$00,$14,$10,$12,$24,$1C,$FE;- D 1 - I - 0x012839 09:A829: "      EACUM/"
	.byte $00,$00,$00,$00,$00,$00,$1D,$18,$26,$10,$1D,$1E,$FE;- D 1 - I - 0x012845 09:A835: "      NIWANO/"
	.byte $00,$00,$1E,$11,$19,$14,$12,$23,$00,$13,$14,$22,$18,$16,$1D,$14,$21,$FE;- D 1 - I - 0x012852 09:A842: "  OBJECT DESIGNER/"
	.byte $FE                       ;- D 1 - I - 0x012864 09:A854: "/"
	.byte $FE                       ;- D 1 - I - 0x012865 09:A855: "/"
	.byte $00,$00,$00,$00,$10,$21,$10,$22,$17,$18,$2B,$1A,$10,$18,$FE;- D 1 - I - 0x012866 09:A856: "    ARASHI.KAI/"
	.byte $00,$00,$00,$00,$23,$22,$24,$11,$1E,$00,$1F,$18,$FE;- D 1 - I - 0x012875 09:A865: "    TSUBO PI/"
	.byte $00,$00,$00,$00,$29,$14,$1D,$13,$14,$1D,$FF;- D 1 - I - 0x012882 09:A872: "    ZENDEN$"
RunTextScript_09Tbl_A7D6_02:
	.byte $00,$00,$22,$12,$21,$1E,$1B,$1B,$00,$13,$14,$22,$18,$16,$1D,$14,$21,$FE;- D 1 - I - 0x01288D 09:A87D: "  SCROLL DESIGNER/"
	.byte $00,$00,$00,$00,$00,$00,$28,$24,$1A,$18,$FE;- D 1 - I - 0x01289F 09:A88F: "      YUKI/"
	.byte $00,$00,$00,$00,$00,$00,$1B,$18,$1D,$13,$10,$FE;- D 1 - I - 0x0128AA 09:A89A: "      LINDA/"
	.byte $00,$00,$00,$00,$00,$00,$21,$28,$24,$16,$1E,$FE;- D 1 - I - 0x0128B6 09:A8A6: "      RYUGO/"
	.byte $00,$00,$00,$00,$00,$00,$10,$21,$1D,$18,$14,$FE;- D 1 - I - 0x0128C2 09:A8B2: "      ARNIE/"
	.byte $00,$00,$00,$00,$00,$00,$1C,$10,$1C,$18,$1C,$24,$FF;- D 1 - I - 0x0128CE 09:A8BE: "      MAMIMU$"
RunTextScript_09Tbl_A7D6_03:
	.byte $00,$00,$00,$22,$1E,$24,$1D,$13,$00,$12,$1E,$1C,$1F,$1E,$22,$14,$FE;- D 1 - I - 0x0128DB 09:A8CB: "   SOUND COMPOSE/"
	.byte $00,$00,$00,$00,$00,$00,$00,$22,$14,$23,$22,$24,$1E,$FE;- D 1 - I - 0x0128EC 09:A8DC: "       SETSUO/"
	.byte $00,$00,$00,$00,$00,$00,$00,$28,$24,$1A,$1E,$FE;- D 1 - I - 0x0128FA 09:A8EA: "       YUKO/"
	.byte $00,$00,$00,$22,$1F,$14,$12,$18,$10,$1B,$00,$23,$17,$10,$1D,$1A,$22,$FE;- D 1 - I - 0x012906 09:A8F6: "   SPECIAL THANKS/"
	.byte $00,$00,$00,$00,$00,$00,$1C,$10,$1D,$10,$22,$17,$18,$FE;- D 1 - I - 0x012918 09:A908: "      MANASHI/"
	.byte $00,$00,$00,$00,$00,$00,$24,$22,$17,$18,$FE;- D 1 - I - 0x012926 09:A916: "      USHI/"
	.byte $FE                       ;- D 1 - I - 0x012931 09:A921: "/"
	.byte $00,$00,$00,$00,$11,$1B,$10,$12,$1A,$2B,$18,$FE;- D 1 - I - 0x012932 09:A922: "    BLACK.I/"
	.byte $00,$00,$00,$00,$1F,$21,$1E,$15,$14,$22,$22,$1E,$21,$2B,$1A,$FE;- D 1 - I - 0x01293E 09:A92E: "    PROFESSOR.K/"
	.byte $FE                       ;- D 1 - I - 0x01294E 09:A93E: "/"
	.byte $00,$00,$00,$00,$00,$00,$00,$10,$1D,$13,$FE;- D 1 - I - 0x01294F 09:A93F: "       AND/"
	.byte $00,$12,$10,$1F,$12,$1E,$1C,$00,$10,$1B,$1B,$00,$22,$23,$10,$15,$15,$FF;- D 1 - I - 0x01295A 09:A94A: " CAPCOM ALL STAFF$"
RunTextScript_09Tbl_A7D6_04:
	.byte $00,$00,$00,$00,$23,$17,$10,$1D,$1A,$00,$28,$1E,$24,$FE;- D 1 - I - 0x01296C 09:A95C: "    THANK YOU/"
	.byte $00,$00,$00,$00,$00,$00,$00,$15,$1E,$21,$00,$FE;- D 1 - I - 0x01297A 09:A96A: "       FOR /"
	.byte $00,$00,$00,$28,$1E,$24,$21,$00,$1F,$1B,$10,$28,$18,$1D,$16,$FE;- D 1 - I - 0x012986 09:A976: "   YOUR PLAYING/"
	.byte $FE                       ;- D 1 - I - 0x012996 09:A986: "/"
	.byte $1F,$21,$14,$22,$14,$1D,$23,$14,$13,$00,$11,$28,$00,$12,$10,$1F,$12,$1E,$1C,$FE;- D 1 - I - 0x012997 09:A987: "PRESENTED BY CAPCOM/"
	.byte $FF                       ;- D 1 - I - 0x0129AB 09:A99B: "$"
	.byte $AA,$1B,$8A,$FE,$28,$B7,$80,$E3,$AC,$F2,$02,$A8,$83,$39,$0A,$D6;- - - - - - 0x0129AC 09:A99C:
	.byte $98,$7F,$20,$13,$A8,$AD,$AA,$7A,$89,$8F,$CA,$16,$02,$E5,$2E,$EA;- - - - - - 0x0129BC 09:A9AC:
	.byte $32,$7D,$A8,$C2,$01,$9B,$8A,$5E,$26,$67,$93,$B7,$8E,$9C,$04,$BF;- - - - - - 0x0129CC 09:A9BC:
	.byte $00,$8B,$28,$5B,$88,$CB,$A0,$BF,$AA,$14,$AA,$E8,$A8,$D4,$2A,$AA;- - - - - - 0x0129DC 09:A9CC:
	.byte $F2,$93,$2A,$DF,$CE,$98,$0D,$63,$68,$E5,$4E,$2F,$8A,$79,$8E,$BA;- - - - - - 0x0129EC 09:A9DC:
	.byte $00,$B9,$82,$C5,$A8,$7D,$2A,$84,$82,$96,$A0,$9C,$88,$4C,$18,$F6;- - - - - - 0x0129FC 09:A9EC:
	.byte $0B,$7E,$A8,$EB,$A0,$DF,$88,$5B,$24,$71,$08,$7B,$AA,$BF,$C8,$E9;- - - - - - 0x012A0C 09:A9FC:
	.byte $A7,$69,$C8,$F0,$BE,$F5,$AA,$B5,$43,$F6,$FA,$B7,$3B,$7C,$28,$91;- - - - - - 0x012A1C 09:AA0C:
	.byte $98,$DD,$72,$FF,$00,$0B,$2A,$6D,$20,$F2,$8A,$FF,$04,$71,$2B,$F1;- - - - - - 0x012A2C 09:AA1C:
	.byte $24,$DA,$AA,$E9,$82,$77,$A9,$77,$A1,$3F,$F8,$CF,$A9,$F3,$98,$9F;- - - - - - 0x012A3C 09:AA2C:
	.byte $2A,$7C,$AE,$FF,$BB,$FF,$92;- - - - - - 0x012A4C 09:AA3C:
	.byte $A9,$88,$1A,$8A,$67,$88,$CB,$80;- - - - - - 0x012A53 09:AA43:
	.byte $7A,$BA,$DD,$89,$87,$EA,$33,$8A,$71,$88,$BA,$A1,$FF,$DA,$6D,$62;- - - - - - 0x012A5B 09:AA4B:
	.byte $FD,$A2,$14,$4A,$9F,$03,$02,$82,$5B,$AB,$99,$E8,$28,$AE,$E7,$00;- - - - - - 0x012A6B 09:AA5B:
	.byte $3A,$6A,$9B,$2A,$18,$1A,$CA,$29,$4B,$AA,$D6,$FC,$AE,$A8,$D8,$8A;- - - - - - 0x012A7B 09:AA6B:
	.byte $A4,$3A,$33,$AA,$B7,$00,$E3,$08,$B5,$2B,$34,$A8,$88,$93,$70,$8A;- - - - - - 0x012A8B 09:AA7B:
	.byte $FF,$18,$BF,$A2,$CD,$62,$F5,$BA,$1F,$8A,$7A,$2A,$DF,$BA,$EF,$8F;- - - - - - 0x012A9B 09:AA8B:
	.byte $AF,$E2,$9A,$AB,$70,$A8,$29,$AA,$C5,$A9,$4F,$AE,$7C,$A2,$ED,$88;- - - - - - 0x012AAB 09:AA9B:
	.byte $FE,$82,$3C,$A0,$D6,$AA,$F9,$C6,$CD,$FB,$33,$8C,$C3,$28,$DF,$88;- - - - - - 0x012ABB 09:AAAB:
	.byte $00,$82,$0E,$8A,$FA,$2A,$76,$9A,$3B,$AA,$47,$88,$99,$B9,$58,$89;- - - - - - 0x012ACB 09:AABB:
	.byte $3A,$8A,$86,$20,$79,$88,$F4,$20,$B9,$C8,$A7,$6B,$E7,$2B,$DE,$B2;- - - - - - 0x012ADB 09:AACB:
	.byte $B7,$80,$3B,$A2,$F9,$9A,$EF,$DA,$CF,$0A,$D6,$AC,$CF,$8E,$DF,$CA;- - - - - - 0x012AEB 09:AADB:
	.byte $A3,$0A,$BE,$82,$FC,$E0,$51,$88,$B7,$A4,$F4,$C8,$1C,$AA,$EF,$AF;- - - - - - 0x012AFB 09:AAEB:
	.byte $DF,$E8,$EA,$A9,$FF       ;- - - - - - 0x012B0B 09:AAFB:
InitEndingPlayerObj:
	LDA #$80                        ;C - - - - - 0x012B10 09:AB00: A9 80
	STA objActive                   ;C - - - - - 0x012B12 09:AB02: 8D 00 03
	LDA #$D0                        ;C - - - - - 0x012B15 09:AB05: A9 D0
	STA objFlags                    ;C - - - - - 0x012B17 09:AB07: 8D 60 05
	LDA #$00                        ;C - - - - - 0x012B1A 09:AB0A: A9 00
	STA objXPage                    ;C - - - - - 0x012B1C 09:AB0C: 8D 80 03
	STA objYPage                    ;C - - - - - 0x012B1F 09:AB0F: 8D E0 03
	STA objKind                     ;C - - - - - 0x012B22 09:AB12: 8D 20 03
	LDA #$58                        ;C - - - - - 0x012B25 09:AB15: A9 58
	STA objX                        ;C - - - - - 0x012B27 09:AB17: 8D 60 03
	LDA #$A8                        ;C - - - - - 0x012B2A 09:AB1A: A9 A8
	STA objY                        ;C - - - - - 0x012B2C 09:AB1C: 8D C0 03
	LDY playerId                    ;C - - - - - 0x012B2F 09:AB1F: A4 34
	LDA InitEndingPlayerObjTbl_AB2E,Y;C - - - - - 0x012B31 09:AB21: B9 2E AB
	STA ptr_00                      ;C - - - - - 0x012B34 09:AB24: 85 00
	LDA InitEndingPlayerObjTbl_AB31,Y;C - - - - - 0x012B36 09:AB26: B9 31 AB
	STA ptr_00+1                    ;C - - - - - 0x012B39 09:AB29: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x012B3B 09:AB2B: 6C 00 00
InitEndingPlayerObjTbl_AB2E:
	.lobytes InitEndingPlayerObjTbl_AB2E_00, InitEndingPlayerObjTbl_AB2E_01, InitEndingPlayerObjTbl_AB2E_02;- - - - - - 0x012B3E 09:AB2E:
InitEndingPlayerObjTbl_AB31:
	.hibytes InitEndingPlayerObjTbl_AB2E_00, InitEndingPlayerObjTbl_AB2E_01, InitEndingPlayerObjTbl_AB2E_02;- - - - - - 0x012B41 09:AB31:
InitEndingPlayerObjTbl_AB2E_00:
	LDA objActive                   ;c - - - - - 0x012B44 09:AB34: AD 00 03
	AND #$0F                        ;c - - - - - 0x012B47 09:AB37: 29 0F
	BNE loc_09_AB7D                 ;c - - - - - 0x012B49 09:AB39: D0 42
	LDA #$73                        ;c - - - - - 0x012B4B 09:AB3B: A9 73
	CMP objAnim                     ;c - - - - - 0x012B4D 09:AB3D: CD 80 05
	BEQ loc_09_AB4A                 ;c - - - - - 0x012B50 09:AB40: F0 08
	JSR SetPlayerAnim               ;c - - - - - 0x012B52 09:AB42: 20 94 F2
	LDA #$3F                        ;c - - - - - 0x012B55 09:AB45: A9 3F
	JSR SetChrBank2                 ;c - - - - - 0x012B57 09:AB47: 20 40 F4
loc_09_AB4A:
	LDA objAnimFrame                ;c - - - - - 0x012B5A 09:AB4A: AD 70 05
	BNE loc_09_AB59                 ;c - - - - - 0x012B5D 09:AB4D: D0 0A
	LDA objAnimFlags                ;c - - - - - 0x012B5F 09:AB4F: AD 90 05
	BNE loc_09_AB59                 ;c - - - - - 0x012B62 09:AB52: D0 05
	LDA #$16                        ;c - - - - - 0x012B64 09:AB54: A9 16
	JSR QueueSound                  ;c - - - - - 0x012B66 09:AB56: 20 4C F3
loc_09_AB59:
	LDA objAnimFrame                ;c - - - - - 0x012B69 09:AB59: AD 70 05
	CMP #$06                        ;c - - - - - 0x012B6C 09:AB5C: C9 06
	BNE loc_09_AB77                 ;c - - - - - 0x012B6E 09:AB5E: D0 17
	LDA #$13                        ;c - - - - - 0x012B70 09:AB60: A9 13
	JSR SetPlayerAnim               ;c - - - - - 0x012B72 09:AB62: 20 94 F2
	LDA #$03                        ;c - - - - - 0x012B75 09:AB65: A9 03
	JSR SetChrBank2                 ;c - - - - - 0x012B77 09:AB67: 20 40 F4
	LDA #$38                        ;c - - - - - 0x012B7A 09:AB6A: A9 38
	STA objVelYLo                   ;c - - - - - 0x012B7C 09:AB6C: 8D 20 04
	LDA #$04                        ;c - - - - - 0x012B7F 09:AB6F: A9 04
	STA objVelYHi                   ;c - - - - - 0x012B81 09:AB71: 8D 30 04
	INC objActive                   ;c - - - - - 0x012B84 09:AB74: EE 00 03
loc_09_AB77:
	JSR RedrawAndWaitFrame          ;c - - - - - 0x012B87 09:AB77: 20 06 F4
	JMP InitEndingPlayerObjTbl_AB2E_00;c - - - - - 0x012B8A 09:AB7A: 4C 34 AB
loc_09_AB7D:
	LDA objActive                   ;c - - - - - 0x012B8D 09:AB7D: AD 00 03
	AND #$02                        ;c - - - - - 0x012B90 09:AB80: 29 02
	BNE loc_09_AB95                 ;c - - - - - 0x012B92 09:AB82: D0 11
	LDA objAnimFrame                ;c - - - - - 0x012B94 09:AB84: AD 70 05
	CMP #$05                        ;c - - - - - 0x012B97 09:AB87: C9 05
	BNE loc_09_AB9A                 ;c - - - - - 0x012B99 09:AB89: D0 0F
	LDA #$05                        ;c - - - - - 0x012B9B 09:AB8B: A9 05
	STA objAnimFrame                ;c - - - - - 0x012B9D 09:AB8D: 8D 70 05
	LDA #$00                        ;c - - - - - 0x012BA0 09:AB90: A9 00
	STA objAnimFlags                ;c - - - - - 0x012BA2 09:AB92: 8D 90 05
loc_09_AB95:
	LDX #$00                        ;c - - - - - 0x012BA5 09:AB95: A2 00
	JSR ApplyVelY                   ;c - - - - - 0x012BA7 09:AB97: 20 FD F1
loc_09_AB9A:
	JSR ApplyVelXAdd                ;c - - - - - 0x012BAA 09:AB9A: 20 83 F1
	LDA objVelYHi                   ;c - - - - - 0x012BAD 09:AB9D: AD 30 04
	BPL loc_09_ABB4                 ;c - - - - - 0x012BB0 09:ABA0: 10 12
	LDA #$3E                        ;c - - - - - 0x012BB2 09:ABA2: A9 3E
	CMP objAnim                     ;c - - - - - 0x012BB4 09:ABA4: CD 80 05
	BEQ loc_09_ABB4                 ;c - - - - - 0x012BB7 09:ABA7: F0 0B
	JSR SetPlayerAnim               ;c - - - - - 0x012BB9 09:ABA9: 20 94 F2
	LDA #$01                        ;c - - - - - 0x012BBC 09:ABAC: A9 01
	JSR SetChrBank2                 ;c - - - - - 0x012BBE 09:ABAE: 20 40 F4
	INC objActive                   ;c - - - - - 0x012BC1 09:ABB1: EE 00 03
loc_09_ABB4:
	LDA objY                        ;c - - - - - 0x012BC4 09:ABB4: AD C0 03
	CMP #$A9                        ;c - - - - - 0x012BC7 09:ABB7: C9 A9
	BCC loc_09_ABCD                 ;c - - - - - 0x012BC9 09:ABB9: 90 12
	LDA #$A8                        ;c - - - - - 0x012BCB 09:ABBB: A9 A8
	STA objY                        ;c - - - - - 0x012BCD 09:ABBD: 8D C0 03
	LDA #$01                        ;c - - - - - 0x012BD0 09:ABC0: A9 01
	JSR SetPlayerAnim               ;c - - - - - 0x012BD2 09:ABC2: 20 94 F2
	LDA #$00                        ;c - - - - - 0x012BD5 09:ABC5: A9 00
	JSR SetChrBank2                 ;c - - - - - 0x012BD7 09:ABC7: 20 40 F4
	JMP RedrawAndWaitFrame          ;c - - - - - 0x012BDA 09:ABCA: 4C 06 F4
loc_09_ABCD:
	JMP loc_09_AB77                 ;c - - - - - 0x012BDD 09:ABCD: 4C 77 AB
InitEndingPlayerObjTbl_AB2E_01:
	LDA #$24                        ;C - - J - - 0x012BE0 09:ABD0: A9 24
	CMP objAnim                     ;C - - - - - 0x012BE2 09:ABD2: CD 80 05
	BEQ loc_09_ABEE                 ;C - - - - - 0x012BE5 09:ABD5: F0 17
	JSR SetPlayerAnim               ;C - - - - - 0x012BE7 09:ABD7: 20 94 F2
	LDA #$32                        ;C - - - - - 0x012BEA 09:ABDA: A9 32
	JSR SetChrBank2                 ;C - - - - - 0x012BEC 09:ABDC: 20 40 F4
loc_09_ABDF:
	LDA objAnimFrame                ;C - - - - - 0x012BEF 09:ABDF: AD 70 05
	BNE loc_09_ABEE                 ;C - - - - - 0x012BF2 09:ABE2: D0 0A
	LDA objAnimFlags                ;C - - - - - 0x012BF4 09:ABE4: AD 90 05
	BNE loc_09_ABEE                 ;C - - - - - 0x012BF7 09:ABE7: D0 05
	LDA #$1B                        ;C - - - - - 0x012BF9 09:ABE9: A9 1B
	JSR QueueSound                  ;C - - - - - 0x012BFB 09:ABEB: 20 4C F3
loc_09_ABEE:
	LDA objAnimFrame                ;C - - - - - 0x012BFE 09:ABEE: AD 70 05
	CMP #$0B                        ;C - - - - - 0x012C01 09:ABF1: C9 0B
	BNE loc_09_ABFA                 ;C - - - - - 0x012C03 09:ABF3: D0 05
	LDA #$34                        ;C - - - - - 0x012C05 09:ABF5: A9 34
	JSR QueueSound                  ;C - - - - - 0x012C07 09:ABF7: 20 4C F3
loc_09_ABFA:
	LDA objAnimFrame                ;C - - - - - 0x012C0A 09:ABFA: AD 70 05
	CMP #$13                        ;C - - - - - 0x012C0D 09:ABFD: C9 13
	BEQ loc_09_AC07                 ;C - - - - - 0x012C0F 09:ABFF: F0 06
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012C11 09:AC01: 20 06 F4
	JMP loc_09_ABDF                 ;C - - - - - 0x012C14 09:AC04: 4C DF AB
loc_09_AC07:
	LDA #$14                        ;C - - - - - 0x012C17 09:AC07: A9 14
	CMP objAnim                     ;C - - - - - 0x012C19 09:AC09: CD 80 05
	BEQ loc_09_AC20                 ;C - - - - - 0x012C1C 09:AC0C: F0 12
	JSR SetPlayerAnim               ;C - - - - - 0x012C1E 09:AC0E: 20 94 F2
	LDA #$07                        ;C - - - - - 0x012C21 09:AC11: A9 07
	JSR SetChrBank2                 ;C - - - - - 0x012C23 09:AC13: 20 40 F4
	LDA #$33                        ;C - - - - - 0x012C26 09:AC16: A9 33
	STA objVelYLo                   ;C - - - - - 0x012C28 09:AC18: 8D 20 04
	LDA #$01                        ;C - - - - - 0x012C2B 09:AC1B: A9 01
	STA objVelYHi                   ;C - - - - - 0x012C2D 09:AC1D: 8D 30 04
loc_09_AC20:
	LDA objAnim                     ;C - - - - - 0x012C30 09:AC20: AD 80 05
	CMP #$5B                        ;C - - - - - 0x012C33 09:AC23: C9 5B
	BEQ loc_09_AC55                 ;C - - - - - 0x012C35 09:AC25: F0 2E
	LDA objAnimFrame                ;C - - - - - 0x012C37 09:AC27: AD 70 05
	CMP #$04                        ;C - - - - - 0x012C3A 09:AC2A: C9 04
	BNE loc_09_AC36                 ;C - - - - - 0x012C3C 09:AC2C: D0 08
	LDA objAnimFlags                ;C - - - - - 0x012C3E 09:AC2E: AD 90 05
	BNE loc_09_AC36                 ;C - - - - - 0x012C41 09:AC31: D0 03
	JSR PlayHitSound                ;C - - - - - 0x012C43 09:AC33: 20 30 F4
loc_09_AC36:
	LDA objAnimFrame                ;C - - - - - 0x012C46 09:AC36: AD 70 05
	CMP #$06                        ;C - - - - - 0x012C49 09:AC39: C9 06
	BNE loc_09_AC7B                 ;C - - - - - 0x012C4B 09:AC3B: D0 3E
	LDA #$5B                        ;C - - - - - 0x012C4D 09:AC3D: A9 5B
	JSR SetPlayerAnim               ;C - - - - - 0x012C4F 09:AC3F: 20 94 F2
	LDA #$05                        ;C - - - - - 0x012C52 09:AC42: A9 05
	JSR SetChrBank2                 ;C - - - - - 0x012C54 09:AC44: 20 40 F4
	LDA objY                        ;C - - - - - 0x012C57 09:AC47: AD C0 03
	STA playerGroundY               ;C - - - - - 0x012C5A 09:AC4A: 85 36
	LDA objY                        ;C - - - - - 0x012C5C 09:AC4C: AD C0 03
	SEC                             ;C - - - - - 0x012C5F 09:AC4F: 38
	SBC #$20                        ;C - - - - - 0x012C60 09:AC50: E9 20
	STA objY                        ;C - - - - - 0x012C62 09:AC52: 8D C0 03
loc_09_AC55:
	LDX #$00                        ;C - - - - - 0x012C65 09:AC55: A2 00
	JSR ApplyVelY                   ;C - - - - - 0x012C67 09:AC57: 20 FD F1
	LDA objVelYHi                   ;C - - - - - 0x012C6A 09:AC5A: AD 30 04
	BPL loc_09_AC7B                 ;C - - - - - 0x012C6D 09:AC5D: 10 1C
	LDA objY                        ;C - - - - - 0x012C6F 09:AC5F: AD C0 03
	CMP #$A8                        ;C - - - - - 0x012C72 09:AC62: C9 A8
	BCC loc_09_AC7B                 ;C - - - - - 0x012C74 09:AC64: 90 15
	LDA #$A8                        ;C - - - - - 0x012C76 09:AC66: A9 A8
	STA objY                        ;C - - - - - 0x012C78 09:AC68: 8D C0 03
	LDA #$02                        ;C - - - - - 0x012C7B 09:AC6B: A9 02
	JSR SetPlayerAnim               ;C - - - - - 0x012C7D 09:AC6D: 20 94 F2
	LDA #$04                        ;C - - - - - 0x012C80 09:AC70: A9 04
	JSR SetChrBank2                 ;C - - - - - 0x012C82 09:AC72: 20 40 F4
loc_09_AC75:
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012C85 09:AC75: 20 06 F4
	JMP loc_09_AC75                 ;C - - - - - 0x012C88 09:AC78: 4C 75 AC
loc_09_AC7B:
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012C8B 09:AC7B: 20 06 F4
	JMP loc_09_AC20                 ;C - - - - - 0x012C8E 09:AC7E: 4C 20 AC
InitEndingPlayerObjTbl_AB2E_02:
	LDA #$30                        ;C - - J - - 0x012C91 09:AC81: A9 30
	CMP objAnim                     ;C - - - - - 0x012C93 09:AC83: CD 80 05
	BEQ loc_09_ACA9                 ;C - - - - - 0x012C96 09:AC86: F0 21
	JSR SetPlayerAnim               ;C - - - - - 0x012C98 09:AC88: 20 94 F2
	LDA #$0B                        ;C - - - - - 0x012C9B 09:AC8B: A9 0B
	JSR SetChrBank2                 ;C - - - - - 0x012C9D 09:AC8D: 20 40 F4
	LDA #$08                        ;C - - - - - 0x012CA0 09:AC90: A9 08
	STA objStep                     ;C - - - - - 0x012CA2 09:AC92: 8D 00 05
	LDA #$1E                        ;C - - - - - 0x012CA5 09:AC95: A9 1E
	STA objStep+1                   ;C - - - - - 0x012CA7 09:AC97: 8D 01 05
	LDA #$00                        ;C - - - - - 0x012CAA 09:AC9A: A9 00
	STA objVelXLo                   ;C - - - - - 0x012CAC 09:AC9C: 8D 00 04
	LDA #$03                        ;C - - - - - 0x012CAF 09:AC9F: A9 03
	STA objVelXHi                   ;C - - - - - 0x012CB1 09:ACA1: 8D 10 04
	LDA #$90                        ;C - - - - - 0x012CB4 09:ACA4: A9 90
	STA objFlags                    ;C - - - - - 0x012CB6 09:ACA6: 8D 60 05
loc_09_ACA9:
	LDA objStep                     ;C - - - - - 0x012CB9 09:ACA9: AD 00 05
	BEQ loc_09_ACB7                 ;C - - - - - 0x012CBC 09:ACAC: F0 09
	DEC objStep                     ;C - - - - - 0x012CBE 09:ACAE: CE 00 05
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012CC1 09:ACB1: 20 06 F4
	JMP InitEndingPlayerObjTbl_AB2E_02;C - - - - - 0x012CC4 09:ACB4: 4C 81 AC
loc_09_ACB7:
	LDA #$3D                        ;C - - - - - 0x012CC7 09:ACB7: A9 3D
	CMP objAnim                     ;C - - - - - 0x012CC9 09:ACB9: CD 80 05
	BEQ loc_09_ACCB                 ;C - - - - - 0x012CCC 09:ACBC: F0 0D
	JSR SetPlayerAnim               ;C - - - - - 0x012CCE 09:ACBE: 20 94 F2
	LDA #$0A                        ;C - - - - - 0x012CD1 09:ACC1: A9 0A
	JSR SetChrBank2                 ;C - - - - - 0x012CD3 09:ACC3: 20 40 F4
	LDA #$2C                        ;C - - - - - 0x012CD6 09:ACC6: A9 2C
	JSR QueueSound                  ;C - - - - - 0x012CD8 09:ACC8: 20 4C F3
loc_09_ACCB:
	LDX #$00                        ;C - - - - - 0x012CDB 09:ACCB: A2 00
	JSR SetPlayerFlag40             ;C - - - - - 0x012CDD 09:ACCD: 20 3F F0
	JSR ApplyVelXAdd                ;C - - - - - 0x012CE0 09:ACD0: 20 83 F1
	LDA objStep+1                   ;C - - - - - 0x012CE3 09:ACD3: AD 01 05
	BEQ loc_09_ACE1                 ;C - - - - - 0x012CE6 09:ACD6: F0 09
	DEC objStep+1                   ;C - - - - - 0x012CE8 09:ACD8: CE 01 05
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012CEB 09:ACDB: 20 06 F4
	JMP loc_09_ACB7                 ;C - - - - - 0x012CEE 09:ACDE: 4C B7 AC
loc_09_ACE1:
	LDA #$47                        ;C - - - - - 0x012CF1 09:ACE1: A9 47
	CMP objAnim                     ;C - - - - - 0x012CF3 09:ACE3: CD 80 05
	BEQ loc_09_ACF0                 ;C - - - - - 0x012CF6 09:ACE6: F0 08
	JSR SetPlayerAnim               ;C - - - - - 0x012CF8 09:ACE8: 20 94 F2
	LDA #$11                        ;C - - - - - 0x012CFB 09:ACEB: A9 11
	JSR SetChrBank2                 ;C - - - - - 0x012CFD 09:ACED: 20 40 F4
loc_09_ACF0:
	LDA objAnimFrame                ;C - - - - - 0x012D00 09:ACF0: AD 70 05
	BNE loc_09_ACFA                 ;C - - - - - 0x012D03 09:ACF3: D0 05
	LDA #$1D                        ;C - - - - - 0x012D05 09:ACF5: A9 1D
	JSR QueueSound                  ;C - - - - - 0x012D07 09:ACF7: 20 4C F3
loc_09_ACFA:
	LDA objAnimFrame                ;C - - - - - 0x012D0A 09:ACFA: AD 70 05
	CMP #$0C                        ;C - - - - - 0x012D0D 09:ACFD: C9 0C
	BNE loc_09_AD11                 ;C - - - - - 0x012D0F 09:ACFF: D0 10
	LDA #$03                        ;C - - - - - 0x012D11 09:AD01: A9 03
	JSR SetPlayerAnim               ;C - - - - - 0x012D13 09:AD03: 20 94 F2
	LDA #$08                        ;C - - - - - 0x012D16 09:AD06: A9 08
	JSR SetChrBank2                 ;C - - - - - 0x012D18 09:AD08: 20 40 F4
loc_09_AD0B:
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012D1B 09:AD0B: 20 06 F4
	JMP loc_09_AD0B                 ;C - - - - - 0x012D1E 09:AD0E: 4C 0B AD
loc_09_AD11:
	JSR RedrawAndWaitFrame          ;C - - - - - 0x012D21 09:AD11: 20 06 F4
	JMP loc_09_ACE1                 ;C - - - - - 0x012D24 09:AD14: 4C E1 AC
	.byte $44,$17,$80,$2C,$55,$64,$51,$C9,$14,$04,$04,$40,$00,$03,$00,$00;- - - - - - 0x012D27 09:AD17:
	.byte $44,$01,$05,$00,$00,$18,$40,$0B,$00,$00,$00,$02,$84,$02,$10,$25;- - - - - - 0x012D37 09:AD27:
	.byte $01,$00,$00,$28,$01,$80,$01,$13,$04,$84,$10,$08,$40,$08,$89,$84;- - - - - - 0x012D47 09:AD37:
	.byte $00,$0A,$00,$1A,$05,$24,$10,$34,$05,$20,$14,$22,$51,$20,$44,$10;- - - - - - 0x012D57 09:AD47:
	.byte $05,$36,$04,$00,$01,$04,$01,$10,$04,$51,$01,$02,$10,$00,$00,$02;- - - - - - 0x012D67 09:AD57:
	.byte $40,$0F,$44,$00,$40,$20,$00,$00,$10,$00,$01,$00,$00,$01,$01,$60;- - - - - - 0x012D77 09:AD67:
	.byte $00,$00,$00,$01,$00,$82,$00,$00,$00,$BB,$10,$07,$00,$00,$01,$92;- - - - - - 0x012D87 09:AD77:
	.byte $05,$48,$44,$83,$00,$4C,$01,$08,$10,$06,$95,$83,$40,$64,$00,$34;- - - - - - 0x012D97 09:AD87:
	.byte $04,$46,$28,$5C,$40,$1C,$10,$03,$50,$09,$00,$44,$04,$02,$00,$09;- - - - - - 0x012DA7 09:AD97:
	.byte $00,$04,$04,$88,$10,$00,$01,$00,$08,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x012DB7 09:ADA7:
	.byte $00,$02,$00,$00,$41,$0D,$00,$00,$00,$37,$15,$B5,$00,$00,$41,$80;- - - - - - 0x012DC7 09:ADB7:
	.byte $26,$92,$04,$34,$50,$85,$40,$14,$00,$00,$40,$AC,$00,$84,$00,$44;- - - - - - 0x012DD7 09:ADC7:
	.byte $05,$04,$10,$C8,$50,$D0,$51,$00,$10,$00,$01,$0A,$00,$80,$00,$00;- - - - - - 0x012DE7 09:ADD7:
	.byte $00,$46,$00,$08,$04,$08,$44,$24,$00,$12,$04,$80,$00,$00,$00,$08;- - - - - - 0x012DF7 09:ADE7:
	.byte $00,$00,$00,$00,$00,$00,$00,$04,$04,$CA,$00,$00,$00,$10,$00,$12;- - - - - - 0x012E07 09:ADF7:
	.byte $01,$A0,$25,$28,$00,$02,$10,$6F,$04,$E1,$00,$80,$19,$9D,$10,$C0;- - - - - - 0x012E17 09:AE07:
	.byte $00,$CD,$40,$87,$40,$DA,$11,$02,$45,$00,$10,$09,$04,$12,$90,$81;- - - - - - 0x012E27 09:AE17:
	.byte $50,$08,$00,$00,$00,$00,$00,$20,$00,$40,$06,$24,$00,$A3,$40,$10;- - - - - - 0x012E37 09:AE27:
	.byte $00,$08,$00,$02,$05,$84,$44,$08,$08,$11,$14,$02,$01,$40,$C5,$00;- - - - - - 0x012E47 09:AE37:
	.byte $10,$0E,$00,$20,$10,$00,$10,$56,$11,$73,$45,$08,$40,$48,$00,$0C;- - - - - - 0x012E57 09:AE47:
	.byte $00,$01,$05,$00,$41,$03,$44,$09,$12;- - - - - - 0x012E67 09:AE57:
	.byte $00,$01,$02,$03,$00,$01,$64,$00,$23,$00,$62,$40,$00,$00,$01,$40,$0F,$00,$00,$00,$02,$00,$08,$00,$64,$66,$01,$00,$0F,$20,$2C,$1C,$0F,$28,$18,$1A,$0F,$10,$00,$16,$0F,$05,$13,$03,$00,$00,$00,$90;- D 1 - - - 0x012E70 09:AE60: stage section header: 8 screen ids (+8 more), pal idx, chr banks, 16-byte palette
	.byte $04,$10,$A5,$04,$02,$21,$03,$00,$20,$00,$02,$40,$C2,$80,$08,$04,$0F,$00,$00,$00,$00,$04,$82,$00,$68,$6A,$20,$00,$0F,$20,$2C,$12,$0F,$13,$03,$11,$0F,$21,$11,$0F,$0F,$11,$11,$0F,$00,$00,$00,$00;- D 1 - - - 0x012EA0 09:AE90: stage section header: 8 screen ids (+8 more), pal idx, chr banks, 16-byte palette
	.byte $05,$06,$07,$07,$09,$00,$1C,$44,$22,$00,$45,$04,$00,$00,$10,$04,$10,$00,$04,$00,$00,$11,$40,$40,$68,$6A,$17,$11,$0F,$20,$2C,$1C,$0F,$07,$2B,$10,$0F,$26,$23,$13,$0F,$15,$27,$05,$00,$00,$8E,$8F;- D 1 - - - 0x012ED0 09:AEC0: stage section header: 8 screen ids (+8 more), pal idx, chr banks, 16-byte palette
	.byte $42,$80,$02,$04,$20,$40,$10,$00,$00,$00,$10,$40,$00,$08,$00,$42;- - - - - - 0x012F00 09:AEF0:
; stageScreenBase: 32 map screens, 64 bytes each = 8x8 metatiles, one row per line (unused screens are $21/$23 fill)
	.byte $00,$01,$02,$03,$04,$05,$06,$06;- D 1 - I - 0x012F10 09:AF00:
	.byte $07,$08,$09,$0A,$0B,$0C,$0D,$0E;- D 1 - I - 0x012F18 09:AF08:
	.byte $0F,$10,$11,$12,$13,$14,$15,$16;- D 1 - I - 0x012F20 09:AF10:
	.byte $17,$18,$19,$1A,$1B,$1C,$1D,$1E;- D 1 - I - 0x012F28 09:AF18:
	.res 8, $1F                     ;- D 1 - I - 0x012F30 09:AF20: fill 8 bytes
	.res 8, $20                     ;- - - - - - 0x012F38 09:AF28: fill 8 bytes
	.res 16, $21                    ;- - - - - - 0x012F40 09:AF30: fill 16 bytes
	.byte $06,$06,$22,$23,$23,$23,$24,$00;- D 1 - I - 0x012F50 09:AF40:
	.byte $25,$26,$27,$28,$29,$2A,$2B,$07;- D 1 - I - 0x012F58 09:AF48:
	.byte $2C,$2D,$2E,$2F,$30,$31,$32,$0F;- D 1 - I - 0x012F60 09:AF50:
	.byte $33,$1D,$34,$35,$36,$37,$38,$17;- D 1 - I - 0x012F68 09:AF58:
	.res 8, $1F                     ;- D 1 - I - 0x012F70 09:AF60: fill 8 bytes
	.res 8, $20                     ;- D 1 - I - 0x012F78 09:AF68: fill 8 bytes
	.res 16, $21                    ;- - - - - - 0x012F80 09:AF70: fill 16 bytes
	.byte $39,$01,$3A,$3B,$3C,$3D,$3E,$3D;- D 1 - I - 0x012F90 09:AF80:
	.byte $08,$09,$3F,$40,$41,$42,$43,$42;- D 1 - I - 0x012F98 09:AF88:
	.byte $10,$11,$44,$45,$46,$47,$48,$49;- D 1 - I - 0x012FA0 09:AF90:
	.byte $18,$19,$4A,$4B,$4C,$4C,$4C,$4C;- D 1 - I - 0x012FA8 09:AF98:
	.res 8, $1F                     ;- D 1 - I - 0x012FB0 09:AFA0: fill 8 bytes
	.res 8, $20                     ;- D 1 - I - 0x012FB8 09:AFA8: fill 8 bytes
	.res 16, $21                    ;- - - - - - 0x012FC0 09:AFB0: fill 16 bytes
	.byte $22,$23,$23,$24,$06,$06,$06,$06;- D 1 - I - 0x012FD0 09:AFC0:
	.byte $4D,$4E,$4F,$2B,$0D,$0E,$25,$50;- D 1 - I - 0x012FD8 09:AFC8:
	.byte $2E,$51,$52,$32,$53,$16,$2C,$15;- D 1 - I - 0x012FE0 09:AFD0:
	.byte $34,$54,$55,$38,$56,$57,$58,$59;- D 1 - I - 0x012FE8 09:AFD8:
	.byte $1F,$1F,$1F,$1F,$5A,$5B,$5B,$5B;- D 1 - I - 0x012FF0 09:AFE0:
	.byte $20,$20,$20,$20,$20,$20,$20,$20;- D 1 - I - 0x012FF8 09:AFE8:
	.res 16, $21                    ;- - - - - - 0x013000 09:AFF0: fill 16 bytes
	.byte $5C,$5D,$5E,$5F,$60,$5E,$61,$5C;- D 1 - I - 0x013010 09:B000:
	.byte $62,$63,$64,$65,$66,$64,$67,$62;- D 1 - I - 0x013018 09:B008:
	.byte $68,$69,$6A,$6B,$6C,$6A,$6D,$68;- D 1 - I - 0x013020 09:B010:
	.byte $68,$6E,$6F,$6F,$6F,$6F,$70,$68;- D 1 - I - 0x013028 09:B018:
	.byte $5C,$71,$72,$73,$74,$75,$76,$5C;- D 1 - I - 0x013030 09:B020:
	.res 8, $20                     ;- - - - - - 0x013038 09:B028: fill 8 bytes
	.res 16, $21                    ;- - - - - - 0x013040 09:B030: fill 16 bytes
	.byte $77,$78,$79,$7A,$7B,$7B,$7B,$7A;- D 1 - I - 0x013050 09:B040:
	.byte $7C,$7D,$7E,$7F,$80,$81,$82,$7F;- D 1 - I - 0x013058 09:B048:
	.byte $83,$84,$85,$86,$87,$88,$89,$86;- D 1 - I - 0x013060 09:B050:
	.byte $8A,$8B,$8C,$8D,$8E,$8E,$8E,$8D;- D 1 - I - 0x013068 09:B058:
	.res 8, $1F                     ;- D 1 - I - 0x013070 09:B060: fill 8 bytes
	.byte $20,$20,$20,$20,$20,$20,$20,$20;- - - - - - 0x013078 09:B068:
	.res 16, $21                    ;- - - - - - 0x013080 09:B070: fill 16 bytes
	.byte $7B,$7B,$7B,$8F,$77,$78,$79,$90;- D 1 - I - 0x013090 09:B080:
	.byte $91,$92,$93,$94,$95,$96,$97,$7F;- D 1 - I - 0x013098 09:B088:
	.byte $98,$99,$9A,$9B,$9C,$9D,$9E,$86;- D 1 - I - 0x0130A0 09:B090:
	.byte $8E,$8E,$8E,$9F,$A0,$A1,$A2,$A3;- D 1 - I - 0x0130A8 09:B098:
	.res 8, $1F                     ;- D 1 - I - 0x0130B0 09:B0A0: fill 8 bytes
	.byte $20,$20,$20,$20,$20,$20,$20,$20;- D 1 - I - 0x0130B8 09:B0A8:
	.res 16, $21                    ;- - - - - - 0x0130C0 09:B0B0: fill 16 bytes
	.byte $A4,$A4,$A5,$A6,$A7,$A8,$A9,$77;- D 1 - I - 0x0130D0 09:B0C0:
	.byte $80,$81,$AA,$AB,$AC,$AD,$AE,$AF;- D 1 - I - 0x0130D8 09:B0C8:
	.byte $87,$88,$B0,$B1,$B2,$B3,$B4,$B5;- D 1 - I - 0x0130E0 09:B0D0:
	.byte $B6,$B6,$B7,$B8,$B9,$BA,$BB,$BC;- D 1 - I - 0x0130E8 09:B0D8:
	.res 8, $1F                     ;- D 1 - I - 0x0130F0 09:B0E0: fill 8 bytes
	.res 8, $20                     ;- D 1 - I - 0x0130F8 09:B0E8: fill 8 bytes
	.res 11, $21                    ;- - - - - - 0x013100 09:B0F0: fill 11 bytes
	.byte $21,$21,$21,$21,$21       ;- D 1 - I - 0x01310B 09:B0FB:
	.byte $A7,$A8,$BD,$7B,$7B,$7B,$8F,$77;- - - - - - 0x013110 09:B100:
	.byte $BE,$BF,$C0,$91,$92,$93,$94,$95;- - - - - - 0x013118 09:B108:
	.byte $C1,$C2,$C3,$98,$99,$9A,$9B,$9C;- - - - - - 0x013120 09:B110:
	.byte $C4,$8B,$C5,$8E,$8E,$8E,$9F,$A0;- - - - - - 0x013128 09:B118:
	.res 8, $1F                     ;- - - - - - 0x013130 09:B120: fill 8 bytes
	.res 8, $20                     ;- - - - - - 0x013138 09:B128: fill 8 bytes
	.res 464, $21                   ;- - - - - - 0x013140 09:B130: fill 464 bytes
	.byte $21,$21,$21,$21,$21,$21,$21,$21;- D 1 - I - 0x013310 09:B300:
	.byte $21,$21,$21,$21,$21,$21,$21,$21;- D 1 - I - 0x013318 09:B308:
	.byte $21,$21,$21,$21,$21,$21,$21,$21;- D 1 - I - 0x013320 09:B310:
enemyAI_78:
	.byte $21,$21,$21,$21,$21,$21,$21,$21;- D 1 - I - 0x013328 09:B318:
	.byte $21,$21,$21,$21,$21,$21,$21,$21;- D 1 - I - 0x013330 09:B320:
	.res 984, $21                   ;- - - - - - 0x013338 09:B328: fill 984 bytes
; stageMetaBase: 256 metatiles x 4 block ids (TL, TR, BL, BR), 4 metatiles per line
	.byte $44,$45,$4C,$4D,$00,$00,$71,$00,$00,$78,$00,$00,$00,$00,$00,$78;- D 1 - I - 0x013710 09:B700:
	.byte $00,$00,$00,$79,$00,$06,$00,$07,$10,$11,$18,$19,$54,$55,$40,$41;- D 1 - I - 0x013720 09:B710:
	.byte $00,$00,$42,$43,$70,$00,$78,$00,$78,$00,$0E,$0F,$00,$22,$78,$2D;- D 1 - I - 0x013730 09:B720:
	.byte $23,$06,$2E,$07,$09,$0A,$0C,$0D,$0B,$35,$1F,$1F,$48,$49,$50,$51;- D 1 - I - 0x013740 09:B730:
	.byte $4A,$4B,$52,$53,$1B,$29,$20,$8F,$2A,$28,$7F,$31,$6D,$6E,$32,$33;- D 1 - I - 0x013750 09:B740:
	.byte $6E,$06,$34,$07,$5E,$5F,$2B,$2C,$7A,$7B,$24,$25,$58,$59,$A0,$A0;- D 1 - I - 0x013760 09:B750:
	.byte $5A,$5B,$A0,$A0,$12,$13,$A0,$A0,$1A,$39,$A0,$A0,$3A,$3B,$A0,$A0;- D 1 - I - 0x013770 09:B760:
	.byte $3C,$08,$A0,$A0,$16,$17,$A0,$A0,$1C,$1D,$A0,$A0,$A8,$A8,$B0,$B0;- D 1 - I - 0x013780 09:B770:
	.byte $B1,$B1,$00,$00,$00,$00,$00,$00,$06,$10,$07,$18,$11,$10,$19,$18;- D 1 - I - 0x013790 09:B780:
	.byte $11,$06,$19,$07,$36,$0A,$1F,$1F,$0B,$0A,$2B,$2C,$06,$09,$07,$0C;- D 1 - I - 0x0137A0 09:B790:
	.byte $0A,$0B,$0D,$1F,$3D,$3E,$1F,$1F,$0A,$0B,$1F,$0C,$0A,$06,$0D,$07;- D 1 - I - 0x0137B0 09:B7A0:
	.byte $7B,$7C,$26,$1E,$5E,$5F,$0C,$0D,$06,$5E,$07,$0C,$5F,$7A,$0D,$24;- D 1 - I - 0x0137C0 09:B7B0:
	.byte $7B,$7B,$25,$26,$7C,$14,$1E,$2B,$15,$06,$2C,$07,$1D,$1E,$A0,$A0;- D 1 - I - 0x0137D0 09:B7C0:
	.byte $08,$16,$A0,$A0,$17,$1C,$A0,$A0,$1D,$1D,$A0,$A0,$1E,$16,$A0,$A0;- D 1 - I - 0x0137E0 09:B7D0:
	.byte $17,$08,$A0,$A0,$78,$00,$00,$78,$00,$78,$79,$00,$00,$00,$00,$04;- D 1 - I - 0x0137F0 09:B7E0:
	.byte $70,$00,$00,$00,$62,$63,$6A,$6B,$63,$64,$6B,$6C,$00,$71,$0E,$0F;- D 1 - I - 0x013800 09:B7F0:
	.byte $00,$78,$0E,$0F,$00,$79,$62,$63,$72,$73,$63,$64,$73,$74,$62,$63;- D 1 - I - 0x013810 09:B800:
	.byte $2A,$28,$7F,$20,$29,$2A,$8F,$69,$6A,$6B,$75,$76,$6B,$6C,$76,$5C;- D 1 - I - 0x013820 09:B810:
	.byte $6A,$6B,$5D,$76,$6B,$6C,$76,$76,$2F,$12,$A0,$A0,$13,$60,$A0,$A0;- D 1 - I - 0x013830 09:B820:
	.byte $61,$61,$A0,$A0,$06,$09,$07,$2B,$0A,$0A,$2C,$65,$0A,$0B,$66,$0C;- D 1 - I - 0x013840 09:B830:
	.byte $0B,$0A,$0C,$0D,$5F,$46,$0D,$4E,$47,$14,$4F,$2B,$14,$15,$2B,$2C;- D 1 - I - 0x013850 09:B840:
	.byte $17,$56,$A0,$A0,$57,$16,$A0,$A0,$16,$17,$30,$3F,$1C,$1D,$37,$37;- D 1 - I - 0x013860 09:B850:
	.byte $1D,$1E,$3F,$3F,$16,$17,$37,$3F,$38,$05,$7D,$7E,$05,$05,$7E,$7E;- D 1 - I - 0x013870 09:B860:
	.byte $21,$21,$21,$21,$98,$EC,$98,$EC,$F4,$EE,$F5,$ED,$96,$F4,$96,$F5;- D 1 - I - 0x013880 09:B870:
	.byte $EE,$96,$ED,$96,$87,$90,$87,$90,$21,$21,$6F,$6F,$98,$EC,$B3,$D7;- D 1 - I - 0x013890 09:B880:
	.byte $FD,$8C,$F4,$EE,$96,$FD,$AB,$F4,$8C,$96,$EE,$AB,$87,$90,$99,$97;- D 1 - I - 0x0138A0 09:B890:
	.byte $77,$77,$77,$77,$98,$EC,$E5,$E6,$F5,$ED,$E6,$E6,$96,$F5,$E6,$E6;- D 1 - I - 0x0138B0 09:B8A0:
	.byte $ED,$96,$E6,$E6,$87,$90,$E6,$E7,$85,$B7,$80,$81,$B7,$B7,$81,$81;- D 1 - I - 0x0138C0 09:B8B0:
	.byte $B7,$8A,$81,$82,$88,$8B,$F0,$8D,$8B,$89,$8E,$B1,$89,$95,$B1,$B1;- D 1 - I - 0x0138D0 09:B8C0:
	.byte $86,$89,$B1,$B1,$89,$8B,$B1,$8D,$8B,$83,$8E,$67,$00,$B2,$B9,$BA;- D 1 - I - 0x0138E0 09:B8D0:
	.byte $BB,$BC,$C3,$C4,$BD,$B2,$C5,$BA,$9A,$A1,$A2,$DF,$A1,$A1,$DE,$DF;- D 1 - I - 0x0138F0 09:B8E0:
	.byte $C1,$C2,$BE,$BF,$CB,$CC,$BE,$BF,$CD,$C2,$BE,$BF,$9B,$A1,$9B,$A1;- D 1 - I - 0x013900 09:B8F0:
	.byte $9C,$9D,$A4,$A5,$9D,$9D,$A6,$A7,$9E,$A1,$9F,$A1,$C6,$C7,$00,$00;- D 1 - I - 0x013910 09:B900:
	.byte $C6,$C7,$F1,$F2,$C6,$C7,$F3,$00,$F6,$91,$9B,$A1,$AC,$AD,$B4,$B5;- D 1 - I - 0x013920 09:B910:
	.byte $AE,$AF,$B5,$B5,$9F,$91,$B6,$A1,$00,$F8,$A0,$A0,$F9,$FA,$A0,$A0;- D 1 - I - 0x013930 09:B920:
	.byte $FB,$FC,$A0,$A0,$A3,$AA,$A0,$A0,$A9,$AA,$A0,$A0,$9A,$00,$A2,$B8;- D 1 - I - 0x013940 09:B930:
	.byte $9A,$A1,$A2,$DE,$A1,$9C,$A1,$A4,$9D,$9D,$A5,$A6,$9D,$9E,$A7,$9F;- D 1 - I - 0x013950 09:B940:
	.byte $9B,$C0,$9B,$C8,$C1,$C2,$C9,$CE,$CB,$CC,$CF,$D6,$CD,$C2,$D6,$00;- D 1 - I - 0x013960 09:B950:
	.byte $91,$AC,$A1,$B4,$AD,$AE,$B5,$B5,$AF,$9F,$B5,$B6,$F6,$D0,$9B,$E0;- D 1 - I - 0x013970 09:B960:
	.byte $D1,$D2,$E1,$E2,$D3,$D4,$DB,$DC,$D5,$D5,$DD,$DD,$A3,$E8,$A0,$A0;- D 1 - I - 0x013980 09:B970:
	.byte $E9,$EA,$A0,$A0,$E3,$E4,$A0,$A0,$00,$00,$A0,$A0,$A3,$A9,$A0,$A0;- D 1 - I - 0x013990 09:B980:
	.byte $A1,$A1,$DF,$DE,$A1,$9A,$DF,$A2,$00,$00,$B8,$B9,$B2,$BB,$BA,$C3;- D 1 - I - 0x0139A0 09:B990:
	.byte $BC,$BD,$C4,$C5,$B2,$00,$BA,$B9,$9E,$9B,$9F,$9B,$C0,$C1,$C8,$C9;- D 1 - I - 0x0139B0 09:B9A0:
	.byte $C2,$CB,$CE,$CF,$CC,$CD,$D6,$D6,$C2,$CA,$00,$BE,$C1,$C2,$BF,$BE;- D 1 - I - 0x0139C0 09:B9B0:
	.byte $9F,$F6,$B6,$9B,$D0,$D1,$E0,$E1,$D2,$D3,$E2,$DB,$D4,$D5,$DC,$DD;- D 1 - I - 0x0139D0 09:B9C0:
	.byte $D5,$C6,$DD,$F1,$C7,$C6,$F2,$F3,$AA,$A9,$A0,$A0,$AA,$A3,$A0,$A0;- D 1 - I - 0x0139E0 09:B9D0:
	.byte $E8,$E9,$A0,$A0,$EA,$E3,$A0,$A0,$E4,$00,$A0,$A0,$F8,$F9,$A0,$A0;- D 1 - I - 0x0139F0 09:B9E0:
	.byte $FA,$FB,$A0,$A0,$B2,$9A,$BA,$A2,$C2,$CB,$BF,$BE,$CC,$CD,$BF,$BE;- D 1 - I - 0x013A00 09:B9F0:
	.byte $C2,$9B,$BF,$9B,$C7,$C6,$00,$00,$C7,$C6,$F1,$F2,$C7,$F6,$F3,$9B;- - - - - - 0x013A10 09:BA00:
	.byte $FC,$F8,$A0,$A0,$FB,$A3,$A0,$A0,$00,$00,$00,$00,$00,$00,$00,$00;- - - - - - 0x013A20 09:BA10:
	.res 224, $00                   ;- - - - - - 0x013A30 09:BA20: fill 224 bytes
; stageBlockTL / TR ($BC00) / BL ($BD00) / BR ($BE00): tile numbers of 16x16 block b
	.byte $00,$20,$21,$22,$00,$00,$23,$33,$23,$25,$27,$26,$28,$29,$AF,$00;- D 1 - - - 0x013B10 09:BB00:
	.byte $00,$00,$A3,$A5,$3B,$21,$3B,$21,$65,$67,$A4,$00,$30,$31,$31,$29;- D 1 - - - 0x013B20 09:BB10:
	.byte $80,$23,$4E,$4F,$30,$61,$63,$50,$DF,$82,$84,$28,$46,$5E,$5F,$A4;- D 1 - - - 0x013B30 09:BB20:
	.byte $D0,$00,$8F,$6C,$6C,$27,$6A,$D1,$E0,$87,$89,$8A,$8C,$27,$3F,$D1;- D 1 - - - 0x013B40 09:BB30:
	.byte $00,$42,$AB,$AB,$A0,$A2,$00,$00,$A9,$21,$9B,$9B,$C0,$C2,$C5,$C4;- D 1 - - - 0x013B50 09:BB40:
	.byte $E6,$E8,$EA,$EA,$A0,$B2,$E5,$C4,$C6,$C8,$C9,$CC,$47,$7E,$3B,$E3;- D 1 - - - 0x013B60 09:BB50:
	.byte $EC,$EE,$A6,$A8,$A8,$29,$51,$00,$F0,$EF,$B8,$B8,$B8,$4E,$4F,$23;- D 1 - - - 0x013B70 09:BB60:
	.byte $D9,$00,$B8,$B8,$B8,$3C,$3C,$23,$00,$CA,$30,$31,$31,$E0,$00,$80;- D 1 - - - 0x013B80 09:BB70:
	.byte $B7,$21,$EF,$2A,$54,$B7,$2B,$00,$B7,$2A,$27,$AC,$2E,$40,$42,$2B;- D 1 - - - 0x013B90 09:BB80:
	.byte $AD,$20,$00,$00,$34,$39,$45,$AD,$3E,$00,$4E,$6E,$20,$20,$20,$5B;- D 1 - - - 0x013BA0 09:BB90:
	.byte $E4,$20,$4E,$7E,$20,$60,$62,$64,$21,$4C,$4D,$45,$20,$80,$82,$84;- D 1 - - - 0x013BB0 09:BBA0:
	.byte $21,$00,$00,$3E,$20,$6A,$6B,$26,$9F,$20,$C0,$00,$00,$00,$00,$A6;- D 1 - - - 0x013BC0 09:BBB0:
	.byte $AF,$20,$C0,$20,$B1,$B3,$C4,$C6,$00,$00,$20,$20,$D1,$B3,$66,$68;- D 1 - - - 0x013BD0 09:BBC0:
	.byte $00,$9C,$7C,$7A,$6D,$7B,$00,$3A,$00,$34,$00,$00,$BE,$9D,$86,$88;- D 1 - - - 0x013BE0 09:BBD0:
	.byte $97,$99,$97,$DC,$DE,$B7,$28,$31,$21,$B9,$21,$00,$3A,$47,$57,$01;- D 1 - - - 0x013BF0 09:BBE0:
	.byte $B7,$00,$00,$00,$43,$33,$6E,$00,$00,$E6,$FB,$FD,$E8,$53,$00,$D9;- D 1 - - - 0x013C00 09:BBF0:
	.byte $00,$20,$21,$22,$4D,$00,$24,$34,$24,$26,$27,$27,$29,$2A,$00,$00;- D 1 - - - 0x013C10 09:BC00:
	.byte $00,$00,$A4,$A3,$21,$44,$21,$44,$66,$68,$5A,$81,$31,$31,$32,$2A;- D 1 - - - 0x013C20 09:BC10:
	.byte $85,$24,$4F,$4F,$60,$62,$64,$51,$81,$83,$DE,$45,$2A,$5F,$5F,$A5;- D 1 - - - 0x013C30 09:BC20:
	.byte $D1,$8E,$5F,$6D,$6D,$69,$27,$D1,$00,$88,$89,$8B,$8D,$3E,$27,$D1;- D 1 - - - 0x013C40 09:BC30:
	.byte $9A,$52,$AB,$AD,$A1,$A0,$00,$00,$AA,$AC,$20,$AD,$C1,$C0,$C4,$C4;- D 1 - - - 0x013C50 09:BC40:
	.byte $E7,$E9,$E9,$EB,$B1,$A0,$C4,$C4,$C7,$C9,$CB,$CD,$48,$7F,$C3,$44;- D 1 - - - 0x013C60 09:BC50:
	.byte $ED,$ED,$A8,$A8,$A7,$50,$2A,$BA,$F1,$DD,$B8,$B8,$BE,$4F,$4F,$24;- D 1 - - - 0x013C70 09:BC60:
	.byte $CA,$DC,$B8,$B8,$BE,$3C,$3C,$24,$00,$00,$31,$31,$32,$00,$00,$85;- D 1 - - - 0x013C80 09:BC70:
	.byte $FF,$21,$BA,$BA,$00,$25,$94,$EB,$D7,$D7,$BA,$29,$2F,$41,$56,$2C;- D 1 - - - 0x013C90 09:BC80:
	.byte $AE,$20,$53,$33,$00,$2B,$46,$AE,$3F,$EB,$4F,$6F,$20,$20,$20,$20;- D 1 - - - 0x013CA0 09:BC90:
	.byte $E4,$20,$4F,$7F,$59,$61,$63,$65,$21,$4D,$4D,$46,$59,$81,$83,$85;- D 1 - - - 0x013CB0 09:BCA0:
	.byte $21,$00,$00,$3F,$69,$6A,$20,$26,$20,$20,$20,$00,$00,$00,$A5,$00;- D 1 - - - 0x013CC0 09:BCB0:
	.byte $20,$20,$20,$B0,$B2,$9F,$C5,$C7,$00,$00,$20,$B0,$D2,$AF,$67,$00;- D 1 - - - 0x013CD0 09:BCC0:
	.byte $6D,$79,$7B,$7A,$7A,$7A,$00,$00,$33,$00,$3E,$BD,$BF,$9E,$87,$89;- D 1 - - - 0x013CE0 09:BCD0:
	.byte $98,$9A,$97,$DD,$DF,$30,$32,$BA,$B8,$21,$BB,$43,$00,$48,$58,$01;- D 1 - - - 0x013CF0 09:BCE0:
	.byte $00,$00,$00,$00,$44,$34,$6F,$BD,$E5,$FA,$FC,$E7,$00,$54,$00,$21;- D 1 - - - 0x013D00 09:BCF0:
	.byte $00,$20,$21,$22,$5C,$00,$23,$33,$53,$35,$37,$36,$3B,$21,$BF,$CF;- D 1 - - - 0x013D10 09:BD00:
	.byte $55,$57,$B3,$00,$38,$39,$38,$D3,$75,$77,$00,$90,$30,$31,$31,$40;- D 1 - - - 0x013D20 09:BD10:
	.byte $86,$23,$5E,$5F,$30,$71,$73,$52,$90,$92,$94,$3B,$21,$5E,$5F,$00;- D 1 - - - 0x013D30 09:BD20:
	.byte $43,$00,$9F,$7A,$7C,$37,$3D,$D2,$E0,$9C,$00,$00,$9C,$37,$6F,$F2;- D 1 - - - 0x013D40 09:BD30:
	.byte $A9,$21,$97,$99,$B0,$B2,$00,$C4,$B9,$BB,$BD,$BD,$A0,$A2,$D5,$C4;- D 1 - - - 0x013D50 09:BD40:
	.byte $F6,$F8,$FA,$FA,$C0,$C2,$F5,$C4,$D6,$D8,$D6,$D8,$B4,$5B,$38,$59;- D 1 - - - 0x013D60 09:BD50:
	.byte $FC,$FE,$B8,$B8,$B8,$40,$40,$00,$D3,$FF,$B8,$B8,$B8,$5E,$5F,$23;- D 1 - - - 0x013D70 09:BD60:
	.byte $00,$00,$B6,$AE,$AE,$DA,$DB,$23,$D9,$00,$30,$31,$31,$F0,$F1,$86;- D 1 - - - 0x013D80 09:BD70:
	.byte $B7,$36,$37,$3B,$34,$B7,$2C,$00,$B7,$3B,$EF,$3D,$47,$50,$52,$2D;- D 1 - - - 0x013D90 09:BD80:
	.byte $AD,$20,$00,$00,$44,$2D,$45,$AD,$3E,$00,$4E,$6E,$20,$4A,$4B,$5B;- D 1 - - - 0x013DA0 09:BD90:
	.byte $21,$20,$5E,$8E,$20,$70,$72,$74,$21,$5C,$5D,$45,$20,$00,$00,$00;- D 1 - - - 0x013DB0 09:BDA0:
	.byte $F4,$00,$C3,$3E,$20,$20,$20,$21,$AF,$20,$C0,$00,$A1,$A3,$B4,$B6;- D 1 - - - 0x013DC0 09:BDB0:
	.byte $A2,$D3,$91,$20,$C1,$B3,$D4,$D6,$8A,$8C,$D3,$D3,$E1,$E3,$76,$78;- D 1 - - - 0x013DD0 09:BDC0:
	.byte $00,$8C,$7A,$7C,$7D,$8D,$7A,$3A,$00,$44,$00,$CC,$CE,$00,$F0,$F2;- D 1 - - - 0x013DE0 09:BDD0:
	.byte $AA,$A9,$9B,$00,$00,$B7,$38,$A7,$CA,$C9,$CA,$00,$3A,$57,$2E,$01;- D 1 - - - 0x013DF0 09:BDE0:
	.byte $B7,$E9,$ED,$ED,$53,$43,$6E,$D8,$00,$F6,$F9,$F9,$F8,$33,$00,$DA;- D 1 - - - 0x013E00 09:BDF0:
	.byte $00,$20,$21,$22,$5D,$00,$24,$34,$54,$36,$37,$37,$21,$44,$CE,$00;- D 1 - - - 0x013E10 09:BE00:
	.byte $56,$58,$00,$B3,$39,$3A,$4C,$D4,$76,$78,$00,$91,$31,$31,$32,$41;- D 1 - - - 0x013E20 09:BE10:
	.byte $4A,$24,$5F,$5F,$70,$72,$74,$42,$91,$93,$95,$21,$44,$5F,$5F,$00;- D 1 - - - 0x013E30 09:BE20:
	.byte $E1,$9E,$00,$7B,$7D,$79,$37,$E2,$00,$9D,$00,$00,$9D,$6E,$37,$E2;- D 1 - - - 0x013E40 09:BE30:
	.byte $AA,$AC,$98,$AD,$B1,$B0,$F5,$C4,$BA,$BC,$BD,$AD,$A1,$A0,$C4,$C4;- D 1 - - - 0x013E50 09:BE40:
	.byte $F7,$F9,$F9,$FB,$C1,$C0,$C4,$C4,$D7,$00,$D7,$00,$B5,$6B,$49,$3A;- D 1 - - - 0x013E60 09:BE50:
	.byte $FD,$FD,$B8,$B8,$BE,$41,$41,$BA,$D4,$FF,$B8,$B8,$BE,$5F,$5F,$24;- D 1 - - - 0x013E70 09:BE60:
	.byte $DC,$00,$AE,$AE,$B7,$DB,$DB,$24,$00,$D9,$31,$31,$32,$F1,$F1,$96;- D 1 - - - 0x013E80 09:BE70:
	.byte $35,$36,$BA,$BA,$00,$FF,$96,$EB,$3C,$3C,$BA,$3C,$48,$51,$55,$2E;- D 1 - - - 0x013E90 09:BE80:
	.byte $AE,$20,$33,$43,$00,$2C,$46,$AE,$3F,$EB,$4F,$6F,$49,$4A,$20,$20;- D 1 - - - 0x013EA0 09:BE90:
	.byte $21,$20,$5F,$8F,$59,$71,$73,$75,$21,$5D,$5D,$46,$59,$00,$93,$95;- D 1 - - - 0x013EB0 09:BEA0:
	.byte $F4,$00,$00,$3F,$20,$20,$20,$21,$20,$20,$20,$A0,$A1,$00,$B5,$00;- D 1 - - - 0x013EC0 09:BEB0:
	.byte $D3,$90,$92,$B0,$C2,$AF,$D5,$00,$8B,$00,$D3,$E0,$E1,$90,$77,$00;- D 1 - - - 0x013ED0 09:BEC0:
	.byte $7D,$79,$7C,$7B,$7C,$7C,$7A,$00,$43,$00,$3E,$CD,$CF,$00,$F1,$F3;- D 1 - - - 0x013EE0 09:BED0:
	.byte $A8,$AA,$AB,$00,$00,$A4,$22,$BA,$C8,$CA,$CB,$53,$00,$58,$2F,$01;- D 1 - - - 0x013EF0 09:BEE0:
	.byte $00,$EC,$EC,$EE,$54,$44,$6F,$AA,$F5,$F9,$F9,$F7,$00,$34,$00,$CA;- D 1 - - - 0x013F00 09:BEF0:
; stageBlockAttr: bits 0-1 palette, bits 4-7 collision/priority flags
	.byte $00,$01,$01,$01,$03,$20,$32,$02,$02,$02,$02,$02,$01,$01,$03,$03;- D 1 - - - 0x013F10 09:BF00:
	.byte $02,$02,$02,$02,$31,$31,$01,$01,$02,$02,$02,$33,$03,$03,$03,$01;- D 1 - - - 0x013F20 09:BF10:
	.byte $03,$01,$01,$01,$03,$03,$03,$00,$33,$33,$33,$01,$01,$01,$01,$02;- D 1 - - - 0x013F30 09:BF20:
	.byte $21,$02,$01,$02,$02,$02,$02,$21,$21,$02,$02,$02,$02,$02,$02,$21;- D 1 - - - 0x013F40 09:BF30:
	.byte $01,$01,$01,$01,$02,$02,$33,$33,$31,$31,$31,$31,$02,$02,$03,$03;- D 1 - - - 0x013F50 09:BF40:
	.byte $02,$02,$02,$02,$02,$02,$03,$03,$02,$02,$02,$02,$02,$02,$31,$31;- D 1 - - - 0x013F60 09:BF50:
	.byte $01,$01,$02,$02,$02,$01,$01,$00,$01,$02,$32,$32,$32,$31,$31,$31;- D 1 - - - 0x013F70 09:BF60:
	.byte $03,$03,$02,$02,$02,$02,$02,$41,$03,$03,$33,$33,$33,$21,$21,$03;- D 1 - - - 0x013F80 09:BF70:
	.byte $20,$20,$20,$11,$02,$20,$11,$03,$11,$11,$20,$11,$02,$03,$03,$03;- D 1 - - - 0x013F90 09:BF80:
	.byte $03,$33,$02,$02,$02,$11,$02,$33,$03,$33,$00,$00,$03,$03,$03,$33;- D 1 - - - 0x013FA0 09:BF90:
	.byte $20,$03,$00,$00,$03,$01,$01,$01,$20,$00,$00,$32,$33,$31,$31,$31;- D 1 - - - 0x013FB0 09:BFA0:
	.byte $20,$10,$01,$33,$03,$03,$03,$20,$01,$01,$01,$01,$01,$01,$02,$02;- D 1 - - - 0x013FC0 09:BFB0:
	.byte $01,$01,$01,$01,$00,$01,$32,$32,$02,$02,$01,$01,$01,$01,$03,$03;- D 1 - - - 0x013FD0 09:BFC0:
	.byte $30,$32,$32,$32,$32,$32,$02,$33,$32,$32,$33,$02,$02,$02,$02,$02;- D 1 - - - 0x013FE0 09:BFD0:
	.byte $01,$01,$01,$02,$02,$00,$00,$00,$01,$01,$01,$32,$03,$02,$32,$30;- D 1 - - - 0x013FF0 09:BFE0:
	.byte $00,$01,$01,$01,$32,$02,$30,$01,$01,$01,$01,$01,$01,$02,$30,$01;- D 1 - - - 0x014000 09:BFF0:
