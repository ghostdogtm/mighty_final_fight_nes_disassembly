.segment "BANK_03"
; 0x006010-0x00800F  CPU $A000-$BFFF

ofsset_03_A000:
	.byte $F0,$F6,$F0,$FE,$F8,$F2,$F8,$FA,$F8,$02,$00,$F2,$00,$FA,$00,$02;- D 1 - I - 0x006010 03:A000:
	.byte $08,$FA,$08,$02,$10,$02   ;- D 1 - I - 0x006020 03:A010:
ofsset_03_A016:
	.byte $F0,$F5,$F0,$FD,$F8,$F8,$F8,$00,$00,$F9,$00,$FC,$00,$01,$08,$F5;- D 1 - I - 0x006026 03:A016:
	.byte $08,$FD                   ;- D 1 - I - 0x006036 03:A026:
ofsset_03_A028:
	.byte $F1,$F5,$F1,$FD,$F9,$F8,$F9,$00,$01,$F9,$01,$FC,$01,$01,$09,$F7;- D 1 - I - 0x006038 03:A028:
	.byte $09,$FF                   ;- D 1 - I - 0x006048 03:A038:
ofsset_03_A03A:
	.byte $F1,$F5,$F1,$FD,$F9,$F8,$F9,$00,$01,$F9,$01,$FA,$01,$01,$09,$F7;- D 1 - I - 0x00604A 03:A03A:
	.byte $09,$FF                   ;- D 1 - I - 0x00605A 03:A04A:
ofsset_03_A04C:
	.byte $F0,$F5,$F0,$FD,$F8,$ED,$F8,$F1,$F8,$F9,$F8,$01,$00,$F1,$00,$F9;- D 1 - I - 0x00605C 03:A04C:
	.byte $00,$01,$08,$F7,$08,$FF   ;- D 1 - I - 0x00606C 03:A05C:
ofsset_03_A062:
	.byte $F0,$F4,$F0,$FC,$F8,$F0,$F8,$F8,$F8,$00,$00,$F0,$00,$F8,$00,$00;- D 1 - I - 0x006072 03:A062:
	.byte $08,$F6,$08,$FE           ;- D 1 - I - 0x006082 03:A072:
ofsset_03_A076:
	.byte $F0,$F7,$F0,$FF,$F0,$07,$F8,$F7,$F8,$FF,$F8,$07,$00,$F7,$00,$FF;- D 1 - I - 0x006086 03:A076:
	.byte $00,$07,$08,$FA,$08,$02   ;- D 1 - I - 0x006096 03:A086:
ofsset_03_A08C:
	.byte $FC,$F8,$FC,$00,$FC,$08,$04,$F0,$04,$F8,$04,$00,$04,$08,$0C,$F0;- D 1 - I - 0x00609C 03:A08C:
	.byte $0C,$F8,$0C,$00,$0C,$08   ;- D 1 - I - 0x0060AC 03:A09C:
ofsset_03_A0A2:
	.byte $FC,$00,$FC,$08,$04,$F0,$04,$F8,$04,$00,$04,$08,$0C,$F0,$0C,$F8;- D 1 - I - 0x0060B2 03:A0A2:
	.byte $0C,$00,$0C,$08           ;- D 1 - I - 0x0060C2 03:A0B2:
ofsset_03_A0B6:
	.byte $F0,$F6,$F8,$F2,$F8,$FA,$F8,$02,$00,$F2,$00,$FA,$00,$FB,$00,$02;- D 1 - I - 0x0060C6 03:A0B6:
	.byte $08,$F9,$08,$01           ;- D 1 - I - 0x0060D6 03:A0C6:
ofsset_03_A0CA:
	.byte $F0,$04,$F8,$F7,$F8,$FF,$F8,$07,$00,$F6,$00,$FE,$00,$06,$08,$F6;- D 1 - I - 0x0060DA 03:A0CA:
ofsset_03_A0DA:
	.byte $F0,$F0,$F0,$F8,$F8,$EE,$F8,$F6,$F8,$FE,$F8,$06,$00,$F2,$00,$FA;- D 1 - I - 0x0060EA 03:A0DA:
	.byte $00,$02,$00,$0A,$08,$02   ;- D 1 - I - 0x0060FA 03:A0EA:
ofsset_03_A0F0:
	.byte $EA,$FA,$EA,$02,$F2,$FA,$F2,$02,$FA,$F8,$FA,$00,$02,$F8,$02,$00;- D 1 - I - 0x006100 03:A0F0:
	.byte $0A,$FC,$0A,$04           ;- D 1 - I - 0x006110 03:A100:
ofsset_03_A104:
	.byte $F0,$F0,$F0,$F8,$F0,$08,$F8,$F0,$F8,$F8,$F8,$00,$F8,$08,$00,$F0;- D 1 - I - 0x006114 03:A104:
	.byte $00,$F8,$00,$00,$00,$08,$08,$F0,$08,$F8,$08,$00;- D 1 - I - 0x006124 03:A114:
ofsset_03_A120:
	.byte $F0,$F3,$F0,$FB,$F0,$03,$F8,$F6,$F8,$FE,$F8,$06,$00,$F8,$00,$00;- D 1 - I - 0x006130 03:A120:
	.byte $08,$FB,$08,$03,$10,$F9   ;- D 1 - I - 0x006140 03:A130:
ofsset_03_A136:
	.byte $EB,$F8,$EB,$00,$F3,$F8,$F3,$00,$FB,$F8,$FB,$00,$03,$F8,$03,$00;- D 1 - I - 0x006146 03:A136:
	.byte $0B,$F8,$0B,$00           ;- D 1 - I - 0x006156 03:A146:
ofsset_03_A14A:
	.byte $EB,$F8,$EB,$00,$F3,$F8,$F3,$00,$FB,$F8,$FB,$00,$03,$F8,$03,$00;- D 1 - I - 0x00615A 03:A14A:
	.byte $0B,$F9,$0B,$01           ;- D 1 - I - 0x00616A 03:A15A:
ofsset_03_A15E:
	.byte $E9,$F8,$E9,$00,$F1,$F8,$F1,$00,$F9,$F8,$F9,$00,$01,$F8,$01,$00;- D 1 - I - 0x00616E 03:A15E:
	.byte $09,$FE,$09,$06           ;- D 1 - I - 0x00617E 03:A16E:
ofsset_03_A172:
	.byte $EA,$F8,$EA,$00,$F2,$F8,$F2,$00,$FA,$F8,$FA,$00,$02,$F8,$02,$00;- D 1 - I - 0x006182 03:A172:
	.byte $0A,$FE                   ;- D 1 - I - 0x006192 03:A182:
ofsset_03_A184:
	.byte $EA,$F8,$EA,$00,$F2,$F8,$F2,$00,$FA,$F8,$FA,$00,$02,$F8,$02,$00;- D 1 - I - 0x006194 03:A184:
	.byte $0A,$F8,$0A,$00           ;- D 1 - I - 0x0061A4 03:A194:
ofsset_03_A198:
	.byte $EB,$F5,$EB,$FD,$F3,$F4,$F3,$FC,$FB,$EA,$FB,$F2,$FB,$F8,$03,$F6;- D 1 - I - 0x0061A8 03:A198:
	.byte $03,$FD,$0B,$F6,$0B,$FE   ;- D 1 - I - 0x0061B8 03:A1A8:
ofsset_03_A1AE:
	.byte $F6,$F7,$F6,$FF,$FE,$F5,$FE,$FD,$FE,$05,$FE,$05,$06,$F7,$06,$FF;- D 1 - I - 0x0061BE 03:A1AE:
	.byte $06,$07,$0E,$FE,$0E,$06   ;- D 1 - I - 0x0061CE 03:A1BE:
ofsset_03_A1C4:
	.byte $EB,$F4,$EB,$FC,$F3,$F4,$F3,$FC,$FB,$F6,$FB,$FE,$03,$FA,$03,$02;- D 1 - I - 0x0061D4 03:A1C4:
	.byte $0B,$FC                   ;- D 1 - I - 0x0061E4 03:A1D4:
ofsset_03_A1D6:
	.byte $F6,$00,$F6,$08,$FE,$F9,$FE,$01,$FE,$09,$06,$F9,$06,$01,$06,$09;- D 1 - I - 0x0061E6 03:A1D6:
	.byte $0E,$F8                   ;- D 1 - I - 0x0061F6 03:A1E6:
ofsset_03_A1E8:
	.byte $FF,$F5,$FF,$FD,$FF,$05,$07,$EE,$07,$F6,$07,$FE,$07,$06,$0F,$EE;- D 1 - I - 0x0061F8 03:A1E8:
	.byte $0F,$F6,$0F,$FE,$0F,$06   ;- D 1 - I - 0x006208 03:A1F8:
ofsset_03_A1FE:
	.byte $E5,$F8,$E5,$00,$ED,$F6,$ED,$FE,$F5,$F8,$F5,$00,$FD,$F8,$FD,$00;- D 1 - I - 0x00620E 03:A1FE:
	.byte $05,$F8,$05,$00,$0D,$F8,$0D,$00;- D 1 - I - 0x00621E 03:A20E:
ofsset_03_A216:
	.byte $E5,$F8,$E5,$00,$ED,$F6,$ED,$FE,$F5,$F8,$F5,$00,$FD,$F8,$FD,$00;- D 1 - I - 0x006226 03:A216:
	.byte $05,$F4,$05,$FC,$05,$04,$0D,$F8,$0D,$04;- D 1 - I - 0x006236 03:A226:
ofsset_03_A230:
	.byte $E4,$F8,$E4,$00,$EC,$F6,$EC,$FE,$F4,$F8,$F4,$00,$FC,$F8,$FC,$00;- D 1 - I - 0x006240 03:A230:
	.byte $04,$F8,$04,$00,$0C,$F8,$0C,$00;- D 1 - I - 0x006250 03:A240:
ofsset_03_A248:
	.byte $E5,$F8,$E5,$00,$ED,$F6,$ED,$FE,$F5,$F8,$F5,$00,$FD,$F8,$FD,$00;- D 1 - I - 0x006258 03:A248:
	.byte $05,$F9,$05,$01,$0D,$F9   ;- D 1 - I - 0x006268 03:A258:
ofsset_03_A25E:
	.byte $E5,$F8,$E5,$00,$ED,$F6,$ED,$FE,$F5,$F8,$F5,$00,$F5,$00,$FD,$F0;- D 1 - I - 0x00626E 03:A25E:
	.byte $FD,$F8,$FD,$00,$05,$F8,$0D,$F8;- D 1 - I - 0x00627E 03:A26E:
ofsset_03_A276:
	.byte $E5,$F8,$E5,$00,$ED,$F6,$ED,$FE,$F5,$F8,$F5,$F8,$F5,$00,$F5,$00;- D 1 - I - 0x006286 03:A276:
	.byte $FD,$E8,$FD,$F0,$FD,$F8,$FD,$00,$05,$F8,$0D,$F8;- D 1 - I - 0x006296 03:A286:
ofsset_03_A292:
	.byte $E8,$F8,$E8,$00,$F0,$F8,$F0,$00,$F8,$FC,$F8,$04,$00,$FE,$00,$06;- D 1 - I - 0x0062A2 03:A292:
	.byte $08,$FB,$08,$03           ;- D 1 - I - 0x0062B2 03:A2A2:
ofsset_03_A2A6:
	.byte $F3,$F8,$F3,$00,$F3,$08,$FB,$F4,$FB,$FC,$FB,$04,$FB,$05,$03,$F3;- D 1 - I - 0x0062B6 03:A2A6:
	.byte $03,$FB,$03,$02,$03,$03,$0B,$F0,$0B,$F8;- D 1 - I - 0x0062C6 03:A2B6:
ofsset_03_A2C0:
	.byte $F8,$00,$F8,$08,$F8,$10,$00,$F6,$00,$FE,$00,$06,$00,$06,$00,$0E;- D 1 - I - 0x0062D0 03:A2C0:
	.byte $08,$F1,$08,$F9,$08,$01,$08,$08;- D 1 - I - 0x0062E0 03:A2D0:
ofsset_03_A2D8:
	.byte $F1,$F5,$F1,$FD,$F1,$02,$F9,$F7,$F9,$FF,$F9,$01,$01,$F7,$01,$F8;- D 1 - I - 0x0062E8 03:A2D8:
	.byte $01,$00,$09,$F3,$09,$FB,$09,$03;- D 1 - I - 0x0062F8 03:A2E8:
ofsset_03_A2F0:
	.byte $E4,$FE,$EC,$F8,$EC,$00,$F4,$F8,$F4,$00,$FC,$F9,$FC,$01,$04,$F8;- D 1 - I - 0x006300 03:A2F0:
	.byte $04,$00,$0C,$F8,$0C,$00   ;- D 1 - I - 0x006310 03:A300:
ofsset_03_A306:
	.byte $EB,$F8,$EB,$00,$F3,$F8,$F3,$00,$FB,$F8,$FB,$00,$03,$F8,$03,$00;- D 1 - I - 0x006316 03:A306:
	.byte $0B,$F6,$0B,$FE,$13,$F8,$13,$00;- D 1 - I - 0x006326 03:A316:
ofsset_03_A31E:
	.byte $EC,$F6,$EC,$FE,$F4,$F3,$F4,$FB,$FC,$F5,$FC,$FD,$04,$F9,$04,$01;- D 1 - I - 0x00632E 03:A31E:
	.byte $0C,$F9,$0C,$01           ;- D 1 - I - 0x00633E 03:A32E:
ofsset_03_A332:
	.byte $EF,$F8,$EF,$00,$F7,$F8,$F7,$00,$FF,$F9,$FF,$01,$07,$FA,$07,$02;- D 1 - I - 0x006342 03:A332:
	.byte $0F,$00,$FF,$F1           ;- D 1 - I - 0x006352 03:A342:
ofsset_03_A346:
	.byte $ED,$F8,$ED,$00,$F5,$F8,$F5,$00,$FD,$F9,$FD,$01,$05,$F9,$05,$01;- D 1 - I - 0x006356 03:A346:
	.byte $0D,$00                   ;- D 1 - I - 0x006366 03:A356:
ofsset_03_A358:
	.byte $EF,$F8,$EF,$00,$F7,$F8,$F7,$00,$FF,$F9,$FF,$01,$07,$FA,$07,$02;- D 1 - I - 0x006368 03:A358:
	.byte $0F,$FF,$0F,$07           ;- D 1 - I - 0x006378 03:A368:
ofsset_03_A36C:
	.byte $ED,$F8,$ED,$00,$F5,$F8,$F5,$00,$FD,$F9,$FD,$01,$05,$F9,$05,$01;- D 1 - I - 0x00637C 03:A36C:
	.byte $0D,$01                   ;- D 1 - I - 0x00638C 03:A37C:
ofsset_03_A37E:
	.byte $EF,$F8,$EF,$00,$EF,$08,$F7,$F8,$F7,$00,$FF,$F9,$FF,$01,$07,$FA;- D 1 - I - 0x00638E 03:A37E:
	.byte $07,$02,$0F,$00           ;- D 1 - I - 0x00639E 03:A38E:
ofsset_03_A392:
	.byte $E8,$F7,$EF,$F0,$EF,$F8,$EF,$00,$F7,$F0,$F7,$F8,$F7,$00,$FF,$F9;- D 1 - I - 0x0063A2 03:A392:
	.byte $FF,$01,$07,$FA,$07,$02,$0F,$00,$E7,$F8;- D 1 - I - 0x0063B2 03:A3A2:
ofsset_03_A3AC:
	.byte $EF,$F7,$EF,$FF,$F7,$F7,$F7,$FF,$FF,$F1,$FF,$F9,$FF,$01,$07,$FE;- D 1 - I - 0x0063BC 03:A3AC:
	.byte $07,$06,$0F,$00           ;- D 1 - I - 0x0063CC 03:A3BC:
ofsset_03_A3C0:
	.byte $EF,$F7,$EF,$FF,$F7,$F0,$F7,$F7,$F7,$FF,$FF,$E9,$FF,$F1,$FF,$F9;- D 1 - I - 0x0063D0 03:A3C0:
	.byte $FF,$01,$07,$FE,$07,$06,$0F,$00;- D 1 - I - 0x0063E0 03:A3D0:
ofsset_03_A3D8:
	.byte $F4,$F3,$F4,$FB,$FC,$EE,$FC,$F6,$FC,$FD,$04,$F0,$04,$F8,$04,$00;- D 1 - I - 0x0063E8 03:A3D8:
	.byte $0C,$F8,$0C,$00           ;- D 1 - I - 0x0063F8 03:A3E8:
ofsset_03_A3EC:
	.byte $E8,$F7,$E8,$FF,$F0,$F7,$F0,$FF,$F8,$F7,$F8,$FF,$00,$F9,$00,$01;- D 1 - I - 0x0063FC 03:A3EC:
	.byte $08,$FA,$08,$02,$10,$FF   ;- D 1 - I - 0x00640C 03:A3FC:
ofsset_03_A402:
	.byte $F0,$F8,$F0,$00,$F8,$F9,$F8,$01,$F8,$09,$00,$FB,$00,$03,$00,$08;- D 1 - I - 0x006412 03:A402:
	.byte $08,$F8,$08,$00           ;- D 1 - I - 0x006422 03:A412:
ofsset_03_A416:
	.byte $01,$F3,$01,$FB,$01,$03,$01,$0B,$09,$F5,$09,$FD,$09,$04,$09,$0C;- D 1 - I - 0x006426 03:A416:
	.byte $11,$F4                   ;- D 1 - I - 0x006436 03:A426:
ofsset_03_A428:
	.byte $F8,$FF,$F8,$07,$00,$F1,$00,$F9,$00,$FF,$00,$01,$00,$09,$08,$EA;- D 1 - I - 0x006438 03:A428:
	.byte $08,$F2,$08,$FA,$08,$02   ;- D 1 - I - 0x006448 03:A438:
ofsset_03_A43E:
	.byte $EE,$EF,$EE,$F7,$F6,$E9,$F6,$F1,$F6,$F9,$F6,$01,$FE,$E9,$FE,$F1;- D 1 - I - 0x00644E 03:A43E:
	.byte $FE,$F9,$FE,$01,$06,$EF,$06,$F7,$06,$FF;- D 1 - I - 0x00645E 03:A44E:
ofsset_03_A458:
	.byte $F0,$F5,$F0,$FD,$F8,$F0,$F8,$F8,$F8,$F8,$F8,$00,$00,$F0,$00,$F8;- D 1 - I - 0x006468 03:A458:
	.byte $00,$00,$00,$08,$08,$F0,$08,$F8,$08,$00,$08,$08;- D 1 - I - 0x006478 03:A468:
ofsset_03_A474:
	.byte $EA,$01,$EA,$09,$F2,$F1,$F2,$F9,$F2,$01,$F2,$09,$FA,$F1,$FA,$F9;- D 1 - I - 0x006484 03:A474:
	.byte $FA,$F9,$FA,$01,$FA,$09,$02,$F7,$02,$FF,$02,$07,$0A,$03;- D 1 - I - 0x006494 03:A484:
ofsset_03_A492:
	.byte $EA,$F4,$EA,$FC,$EA,$04,$F2,$F0,$F2,$F8,$F2,$00,$F2,$08,$FA,$F0;- D 1 - I - 0x0064A2 03:A492:
	.byte $FA,$F8,$FA,$F8,$FA,$00,$02,$F7,$02,$FF;- D 1 - I - 0x0064B2 03:A4A2:
ofsset_03_A4AC:
	.byte $F0,$F6,$F0,$FE,$F8,$F1,$F8,$F9,$F8,$01,$00,$F1,$00,$F9,$00,$01;- D 1 - I - 0x0064BC 03:A4AC:
	.byte $08,$F1,$08,$F9,$08,$01   ;- D 1 - I - 0x0064CC 03:A4BC:
ofsset_03_A4C2:
	.byte $ED,$FC,$F5,$F6,$F5,$FE,$FD,$FA,$FD,$02,$05,$FC,$05,$04,$0D,$FC;- D 1 - I - 0x0064D2 03:A4C2:
	.byte $0D,$04                   ;- D 1 - I - 0x0064E2 03:A4D2:
ofsset_03_A4D4:
	.byte $E8,$FA,$F0,$F7,$F0,$FF,$F8,$F7,$F8,$FF,$00,$FA,$00,$02,$08,$FA;- D 1 - I - 0x0064E4 03:A4D4:
	.byte $08,$02,$10,$FA,$10,$02   ;- D 1 - I - 0x0064F4 03:A4E4:
ofsset_03_A4EA:
	.byte $F0,$F5,$F0,$FD,$F8,$F9,$F8,$FC,$F8,$01,$00,$F8,$00,$00,$08,$F5;- D 1 - I - 0x0064FA 03:A4EA:
	.byte $08,$FD                   ;- D 1 - I - 0x00650A 03:A4FA:
ofsset_03_A4FC:
	.byte $08,$F7,$08,$FF,$00,$F8,$00,$00,$F8,$F8,$F8,$00,$F0,$F8,$F0,$00;- D 1 - I - 0x00650C 03:A4FC:
	.byte $E8,$F8,$E8,$00           ;- D 1 - I - 0x00651C 03:A50C:
ofsset_03_A510:
	.byte $E9,$00,$F1,$FA,$F1,$02,$F9,$F9,$F9,$01,$01,$F8,$01,$00,$09,$F8;- D 1 - I - 0x006520 03:A510:
	.byte $09,$00                   ;- D 1 - I - 0x006530 03:A520:
ofsset_03_A522:
	.byte $E5,$F4,$E5,$FC,$E5,$04,$ED,$F4,$ED,$FC,$ED,$04,$F5,$F4,$F5,$FC;- D 1 - I - 0x006532 03:A522:
	.byte $F5,$04,$FD,$F4,$FD,$FC,$FD,$04,$05,$F8,$05,$00,$0D,$F7,$0D,$00;- D 1 - I - 0x006542 03:A532:
ofsset_03_A542:
	.byte $EB,$F7,$EB,$00,$F3,$F8,$F3,$00,$FB,$F4,$FB,$FC,$FB,$04,$03,$F4;- D 1 - I - 0x006552 03:A542:
	.byte $03,$FC,$03,$04,$0B,$F4,$0B,$FC,$0B,$04,$13,$F4,$13,$FC,$13,$04;- D 1 - I - 0x006562 03:A552:
ofsset_03_A562:
	.byte $EA,$F9,$EA,$FE,$F2,$F6,$F2,$FB,$F2,$03,$F2,$04,$FA,$F6,$FA,$FB;- D 1 - I - 0x006572 03:A562:
	.byte $FA,$FF,$FA,$07,$02,$F3,$02,$FB,$02,$01,$02,$08,$0A,$FC,$0A,$03;- D 1 - I - 0x006582 03:A572:
	.byte $0A,$06                   ;- D 1 - I - 0x006592 03:A582:
ofsset_03_A584:
	.byte $E8,$FB,$E8,$03,$F0,$F3,$F0,$FB,$F0,$03,$F8,$F3,$F8,$FB,$F8,$03;- D 1 - I - 0x006594 03:A584:
	.byte $F8,$0B,$00,$F3,$00,$FB,$00,$FE,$00,$06,$08,$FC,$08,$04,$E8,$FB;- D 1 - I - 0x0065A4 03:A594:
	.byte $F0,$FB,$F8,$FB,$00,$07,$08,$04,$F0,$EB,$F8,$EB;- D 1 - I - 0x0065B4 03:A5A4:
ofsset_03_A5B0:
	.byte $EB,$F9,$EB,$FE,$F3,$F6,$F3,$FB,$F3,$03,$F3,$04,$FB,$F6,$FB,$FB;- D 1 - I - 0x0065C0 03:A5B0:
	.byte $FB,$FF,$FB,$07,$03,$F3,$03,$FB,$03,$03,$03,$08,$09,$09,$0B,$FB;- D 1 - I - 0x0065D0 03:A5C0:
	.byte $0B,$08                   ;- D 1 - I - 0x0065E0 03:A5D0:
ofsset_03_A5D2:
	.byte $E9,$F9,$E9,$FE,$F1,$F6,$F1,$FB,$F1,$03,$F1,$04,$F9,$F6,$F9,$FB;- D 1 - I - 0x0065E2 03:A5D2:
	.byte $F9,$FF,$F9,$07,$01,$F3,$01,$FB,$01,$03,$01,$08,$09,$FD,$09,$03;- D 1 - I - 0x0065F2 03:A5E2:
	.byte $09,$03                   ;- D 1 - I - 0x006602 03:A5F2:
ofsset_03_A5F4:
	.byte $EB,$F9,$EB,$FE,$F3,$F6,$F3,$FB,$F3,$03,$F3,$04,$FB,$F6,$FB,$FB;- D 1 - I - 0x006604 03:A5F4:
	.byte $FB,$FF,$FB,$07,$03,$F3,$03,$FB,$03,$03,$03,$06,$0B,$02,$0B,$05;- D 1 - I - 0x006614 03:A604:
ofsset_03_A614:
	.byte $E8,$FC,$E8,$04,$F0,$F4,$F0,$FC,$F0,$04,$F8,$F4,$F8,$FC,$F8,$04;- D 1 - I - 0x006624 03:A614:
	.byte $F8,$0C,$00,$FB,$00,$FF,$00,$07,$08,$FC,$08,$04,$E8,$FC,$F0,$FC;- D 1 - I - 0x006634 03:A624:
	.byte $F8,$FC,$00,$08,$08,$04,$F8,$EC;- D 1 - I - 0x006644 03:A634:
ofsset_03_A63C:
	.byte $E9,$F9,$E9,$FE,$F1,$F6,$F1,$FB,$F1,$03,$F1,$04,$F9,$F6,$F9,$FB;- D 1 - I - 0x00664C 03:A63C:
	.byte $F9,$FF,$F9,$07,$01,$F3,$01,$FB,$01,$03,$01,$08,$09,$01,$09,$03;- D 1 - I - 0x00665C 03:A64C:
	.byte $09,$03                   ;- D 1 - I - 0x00666C 03:A65C:
ofsset_03_A65E:
	.byte $EA,$F9,$EA,$FE,$F2,$ED,$F2,$F5,$F2,$FB,$F2,$03,$F2,$04,$FA,$EB;- D 1 - I - 0x00666E 03:A65E:
	.byte $FA,$F3,$FA,$FB,$FA,$FF,$FA,$07,$FB,$FB,$02,$FB,$02,$01,$02,$08;- D 1 - I - 0x00667E 03:A66E:
	.byte $0A,$FC,$0A,$03,$0A,$06   ;- D 1 - I - 0x00668E 03:A67E:
ofsset_03_A684:
	.byte $F3,$F7,$F3,$FF,$F3,$07,$FB,$F7,$FB,$FF,$03,$F1,$03,$F9,$03,$01;- D 1 - I - 0x006694 03:A684:
	.byte $03,$09,$0B,$F7,$0B,$FF,$0B,$07,$0B,$0A,$F3,$07,$FB,$00,$FB,$08;- D 1 - I - 0x0066A4 03:A694:
	.byte $03,$01,$03,$09           ;- D 1 - I - 0x0066B4 03:A6A4:
ofsset_03_A6A8:
	.byte $EA,$F9,$EA,$FE,$F2,$EC,$F2,$F4,$F2,$FB,$F2,$03,$F2,$04,$FA,$EB;- D 1 - I - 0x0066B8 03:A6A8:
	.byte $FA,$F3,$FA,$FB,$FA,$FF,$FA,$07,$FB,$FB,$02,$FB,$02,$01,$02,$08;- D 1 - I - 0x0066C8 03:A6B8:
	.byte $0A,$FC,$0A,$03,$0A,$06   ;- D 1 - I - 0x0066D8 03:A6C8:
ofsset_03_A6CE:
	.byte $F3,$EE,$F3,$F6,$F3,$FE,$F3,$04,$F3,$09,$F3,$11,$FB,$EE,$FB,$F6;- D 1 - I - 0x0066DE 03:A6CE:
	.byte $FB,$04,$FB,$0C,$FB,$0E,$03,$EE,$03,$F6,$03,$FE,$03,$06,$03,$0A;- D 1 - I - 0x0066EE 03:A6DE:
	.byte $F3,$0C,$FB,$F8,$FB,$00,$03,$FE,$07,$F2;- D 1 - I - 0x0066FE 03:A6EE:
ofsset_03_A6F8:
	.byte $EA,$F9,$EA,$FE,$F2,$F4,$F2,$FB,$F2,$03,$F2,$04,$F9,$F3,$FA,$FB;- D 1 - I - 0x006708 03:A6F8:
	.byte $FA,$FF,$FA,$07,$FB,$FB,$02,$FB,$02,$01,$02,$08,$0A,$FC,$0A,$03;- D 1 - I - 0x006718 03:A708:
	.byte $0A,$06                   ;- D 1 - I - 0x006728 03:A718:
ofsset_03_A71A:
	.byte $FE,$F5,$FE,$FD,$FE,$05,$FE,$0C,$06,$EF,$06,$F5,$06,$FD,$06,$05;- D 1 - I - 0x00672A 03:A71A:
	.byte $06,$0D,$0E,$F1,$0E,$F9,$0E,$FF,$0E,$05,$0E,$0D,$06,$05,$06,$0D;- D 1 - I - 0x00673A 03:A72A:
	.byte $0E,$0D                   ;- D 1 - I - 0x00674A 03:A73A:
ofsset_03_A73C:
	.byte $EA,$F9,$EA,$FE,$F2,$F4,$F2,$FB,$F2,$03,$F2,$04,$F8,$EF,$F9,$F3;- D 1 - I - 0x00674C 03:A73C:
	.byte $FA,$FB,$FA,$FF,$FA,$07,$FB,$FB,$02,$FB,$02,$01,$02,$08,$0A,$FC;- D 1 - I - 0x00675C 03:A74C:
	.byte $0A,$03,$0A,$06           ;- D 1 - I - 0x00676C 03:A75C:
ofsset_03_A760:
	.byte $F3,$F8,$F3,$00,$F3,$08,$FB,$F8,$FB,$00,$FB,$08,$03,$FC,$03,$00;- D 1 - I - 0x006770 03:A760:
	.byte $03,$08,$0B,$FC,$0B,$04,$0B,$08,$F3,$F8,$FB,$FC,$03,$08;- D 1 - I - 0x006780 03:A770:
ofsset_03_A77E:
	.byte $FC,$F8,$FC,$00,$FC,$04,$FC,$0C,$FC,$14;- D 1 - I - 0x00678E 03:A77E:
ofsset_03_A788:
	.byte $EC,$FC,$EC,$03,$EC,$06,$F4,$F3,$F4,$FB,$F4,$01,$F4,$08,$FC,$F6;- - - - - - 0x006798 03:A788:
	.byte $FC,$FB,$FC,$FF,$FC,$07,$04,$F6,$04,$FB,$04,$03,$04,$04,$0C,$F9;- - - - - - 0x0067A8 03:A798:
	.byte $0C,$FE                   ;- - - - - - 0x0067B8 03:A7A8:
ofsset_03_A7AA:
	.byte $ED,$EE,$ED,$F1,$ED,$F9,$ED,$01,$F5,$EF,$F5,$F7,$F5,$FF,$F5,$07;- D 1 - I - 0x0067BA 03:A7AA:
	.byte $FD,$F0,$FD,$F8,$FD,$00,$05,$F1,$05,$F9,$05,$01,$F5,$EF,$F5,$F7;- D 1 - I - 0x0067CA 03:A7BA:
	.byte $FD,$F9,$05,$F1           ;- D 1 - I - 0x0067DA 03:A7CA:
ofsset_03_A7CE:
	.byte $F2,$F5,$F2,$FD,$F2,$05,$FA,$F5,$FA,$FD,$FA,$05,$02,$F5,$02,$FD;- D 1 - I - 0x0067DE 03:A7CE:
	.byte $02,$05,$FA,$FD,$FA,$05,$02,$FD;- D 1 - I - 0x0067EE 03:A7DE:
ofsset_03_A7E6:
	.byte $F2,$F8,$F2,$00,$FA,$F6,$FA,$FE,$FA,$06,$02,$F5,$02,$FB,$02,$03;- D 1 - I - 0x0067F6 03:A7E6:
	.byte $02,$06,$0A,$EF,$0A,$F7,$0A,$FF,$0A,$07,$F2,$FA,$F2,$FF,$FA,$F7;- D 1 - I - 0x006806 03:A7F6:
	.byte $0A,$FF,$FA,$02           ;- - - - - - 0x006816 03:A806:
ofsset_03_A80A:
	.byte $E8,$FB,$E8,$00,$F0,$F9,$F0,$FB,$F0,$03,$F8,$F8,$F8,$FB,$F8,$02;- D 1 - I - 0x00681A 03:A80A:
	.byte $F8,$0A,$00,$F3,$00,$FB,$00,$01,$00,$09,$08,$FC,$08,$03,$08,$04;- D 1 - I - 0x00682A 03:A81A:
ofsset_03_A82A:
	.byte $F8,$0A,$00,$F3,$00,$09,$08,$FC,$08,$03,$08,$04,$E8,$FC,$E8,$01;- D 1 - I - 0x00683A 03:A82A:
	.byte $F0,$F9,$F0,$FB,$F0,$03,$F8,$FB,$F8,$F8,$F8,$02,$00,$FB,$00,$01;- D 1 - I - 0x00684A 03:A83A:
ofsset_03_A84A:
	.byte $E6,$F4,$E6,$FC,$E6,$04,$EE,$F4,$EE,$FC,$EE,$04,$F6,$F4,$F6,$FC;- D 1 - I - 0x00685A 03:A84A:
	.byte $F6,$04,$FE,$F4,$FE,$FC,$FE,$04,$06,$FA,$06,$FD,$06,$02,$0E,$FA;- D 1 - I - 0x00686A 03:A85A:
	.byte $0E,$02                   ;- D 1 - I - 0x00687A 03:A86A:
ofsset_03_A86C:
	.byte $E5,$F4,$E5,$FC,$E5,$04,$ED,$F4,$ED,$FC,$ED,$04,$F5,$F4,$F5,$FC;- D 1 - I - 0x00687C 03:A86C:
	.byte $F5,$04,$FD,$F4,$FD,$FC,$FD,$04,$05,$FB,$05,$03,$0B,$F9,$0D,$01;- D 1 - I - 0x00688C 03:A87C:
ofsset_03_A88C:
	.byte $E6,$F4,$E6,$FC,$E6,$04,$EE,$F4,$EE,$FC,$EE,$04,$F6,$F4,$F6,$FC;- D 1 - I - 0x00689C 03:A88C:
	.byte $F6,$04,$FE,$F4,$FE,$FC,$FE,$04,$06,$FB,$06,$03,$08,$F6,$0E,$04;- D 1 - I - 0x0068AC 03:A89C:
ofsset_03_A8AC:
	.byte $E5,$F4,$E5,$FC,$E5,$04,$ED,$F4,$ED,$FC,$ED,$04,$F5,$F4,$F5,$FC;- D 1 - I - 0x0068BC 03:A8AC:
	.byte $F5,$04,$FD,$F4,$FD,$FC,$FD,$04,$05,$FC,$05,$04,$0B,$02,$0D,$FA;- D 1 - I - 0x0068CC 03:A8BC:
ofsset_03_A8CC:
	.byte $E5,$F6,$E5,$FE,$E5,$06,$ED,$F6,$ED,$FE,$ED,$06,$F5,$EC,$F5,$F4;- D 1 - I - 0x0068DC 03:A8CC:
	.byte $F5,$FC,$F5,$04,$FD,$F4,$FD,$FC,$FD,$04,$05,$F8,$05,$00,$0D,$F7;- D 1 - I - 0x0068EC 03:A8DC:
	.byte $0D,$00                   ;- D 1 - I - 0x0068FC 03:A8EC:
ofsset_03_A8EE:
	.byte $E4,$F1,$E4,$F9,$E4,$01,$EC,$F1,$EC,$F9,$EC,$01,$F4,$E3,$F4,$EB;- D 1 - I - 0x0068FE 03:A8EE:
	.byte $F4,$F3,$F4,$FB,$F4,$03,$FC,$E3,$FC,$EB,$FC,$F3,$FC,$FB,$FC,$03;- D 1 - I - 0x00690E 03:A8FE:
	.byte $04,$F3,$04,$FB,$04,$03,$0C,$F2,$0C,$FF;- D 1 - I - 0x00691E 03:A90E:
ofsset_03_A918:
	.byte $E4,$F4,$E4,$FC,$EC,$F4,$EC,$FC,$F4,$E3,$F4,$EB,$F4,$F3,$F4,$FB;- D 1 - I - 0x006928 03:A918:
	.byte $F4,$03,$FC,$E3,$FC,$EB,$FC,$F3,$FC,$FB,$FC,$03,$04,$F3,$04,$FB;- D 1 - I - 0x006938 03:A928:
	.byte $04,$03,$0C,$F2,$0C,$FF   ;- D 1 - I - 0x006948 03:A938:
ofsset_03_A93E:
	.byte $EB,$EC,$EB,$F4,$EB,$FC,$F3,$EC,$F3,$F4,$F3,$FC,$F3,$04,$FB,$F4;- D 1 - I - 0x00694E 03:A93E:
	.byte $FB,$FC,$FB,$04,$03,$F4,$03,$FC,$03,$04,$0B,$FB,$0B,$03,$03,$FC;- D 1 - I - 0x00695E 03:A94E:
	.byte $0B,$03,$E3,$ED,$E3,$F5   ;- D 1 - I - 0x00696E 03:A95E:
ofsset_03_A964:
	.byte $E6,$08,$E6,$10,$E6,$18,$EE,$00,$EE,$08,$EE,$10,$EE,$18,$F6,$F8;- D 1 - I - 0x006974 03:A964:
	.byte $F6,$00,$F6,$08,$F6,$10,$F6,$18,$FE,$F7,$FE,$FF,$FE,$07,$FE,$0F;- D 1 - I - 0x006984 03:A974:
	.byte $06,$F4,$06,$FC,$06,$07,$06,$0F,$FE,$FF,$06,$FC;- D 1 - I - 0x006994 03:A984:
ofsset_03_A990:
	.byte $FF,$F4,$FF,$FC,$FF,$04,$FF,$0C,$07,$EC,$07,$F4,$07,$FC,$07,$04;- D 1 - I - 0x0069A0 03:A990:
	.byte $07,$0C,$07,$14,$0F,$EC,$0F,$F4,$0F,$FC,$0F,$04,$0F,$0C,$0F,$14;- D 1 - I - 0x0069B0 03:A9A0:
ofsset_03_A9B0:
	.byte $E9,$EA,$E9,$F2,$F1,$E8,$F1,$F0,$F1,$F8,$F9,$E8,$F9,$F0,$F9,$F8;- D 1 - I - 0x0069C0 03:A9B0:
	.byte $F9,$00,$01,$F0,$01,$F8,$01,$00,$09,$EA,$09,$F2,$09,$FA,$09,$02;- D 1 - I - 0x0069D0 03:A9C0:
	.byte $09,$F2                   ;- D 1 - I - 0x0069E0 03:A9D0:
ofsset_03_A9D2:
	.byte $EB,$F5,$F3,$FC,$EB,$F5,$EB,$FD,$F3,$F4,$F3,$FC,$F3,$04,$FB,$F4;- D 1 - I - 0x0069E2 03:A9D2:
	.byte $FB,$FC,$FB,$04,$03,$F4,$03,$FC,$03,$04,$03,$0C,$0B,$FC,$0B,$04;- D 1 - I - 0x0069F2 03:A9E2:
	.byte $0B,$0C,$13,$03,$13,$0B   ;- D 1 - I - 0x006A02 03:A9F2:
ofsset_03_A9F8:
	.byte $E6,$F6,$E6,$FE,$E6,$06,$EE,$F6,$EE,$FE,$EE,$06,$F6,$EE,$F6,$F6;- D 1 - I - 0x006A08 03:A9F8:
	.byte $F6,$FE,$F6,$06,$FE,$F6,$FE,$FE,$FE,$06,$06,$FA,$06,$FD,$06,$02;- D 1 - I - 0x006A18 03:AA08:
	.byte $0E,$FA,$0E,$02           ;- D 1 - I - 0x006A28 03:AA18:
ofsset_03_AA1C:
	.byte $E5,$F6,$E5,$FE,$E5,$06,$ED,$F6,$ED,$FE,$ED,$06,$F5,$EE,$F5,$F6;- D 1 - I - 0x006A2C 03:AA1C:
	.byte $F5,$FE,$F5,$06,$FD,$F6,$FD,$FE,$FD,$06,$05,$FB,$05,$03,$0B,$F9;- D 1 - I - 0x006A3C 03:AA2C:
	.byte $0D,$01                   ;- D 1 - I - 0x006A4C 03:AA3C:
ofsset_03_AA3E:
	.byte $E6,$F6,$E6,$FE,$E6,$06,$EE,$F6,$EE,$FE,$EE,$06,$F6,$EE,$F6,$F6;- D 1 - I - 0x006A4E 03:AA3E:
	.byte $F6,$FE,$F6,$06,$FE,$F6,$FE,$FE,$FE,$06,$06,$FB,$06,$03,$08,$F6;- D 1 - I - 0x006A5E 03:AA4E:
	.byte $0E,$04                   ;- D 1 - I - 0x006A6E 03:AA5E:
ofsset_03_AA60:
	.byte $E5,$F6,$E5,$FE,$E5,$06,$ED,$F6,$ED,$FE,$ED,$06,$F5,$EE,$F5,$F6;- - - - - - 0x006A70 03:AA60:
	.byte $F5,$FE,$F5,$06,$FD,$F6,$FD,$FE,$FD,$06,$05,$FC,$05,$04,$0B,$02;- - - - - - 0x006A80 03:AA70:
	.byte $0D,$FA                   ;- - - - - - 0x006A90 03:AA80:
ofsset_03_AA82:
	.byte $E3,$F8,$E3,$00,$EB,$F1,$EB,$F8,$EB,$F9,$EB,$00,$F3,$F1,$F3,$F9;- D 1 - I - 0x006A92 03:AA82:
	.byte $F3,$01,$F3,$09,$FB,$F1,$FB,$F9,$FB,$01,$FB,$09,$03,$F4,$03,$FA;- D 1 - I - 0x006AA2 03:AA92:
	.byte $03,$02,$03,$02,$0B,$F9,$0B,$03;- D 1 - I - 0x006AB2 03:AAA2:
ofsset_03_AAAA:
	.byte $E2,$F8,$E2,$00,$EA,$F1,$EA,$F8,$EA,$F9,$EA,$00,$F2,$F1,$F2,$F9;- D 1 - I - 0x006ABA 03:AAAA:
	.byte $F2,$01,$F2,$09,$FA,$F1,$FA,$F9,$FA,$01,$FA,$09,$02,$F4,$02,$FC;- D 1 - I - 0x006ACA 03:AABA:
	.byte $02,$04,$09,$F9,$0A,$F9,$0A,$01;- D 1 - I - 0x006ADA 03:AACA:
ofsset_03_AAD2:
	.byte $E3,$F8,$E3,$00,$EB,$F1,$EB,$F8,$EB,$F9,$EB,$00,$F3,$F1,$F3,$F9;- D 1 - I - 0x006AE2 03:AAD2:
	.byte $F3,$01,$F3,$09,$FB,$F1,$FB,$F9,$FB,$01,$FB,$09,$03,$F4,$03,$FC;- D 1 - I - 0x006AF2 03:AAE2:
	.byte $03,$04,$09,$F5,$0B,$F9,$0B,$04;- D 1 - I - 0x006B02 03:AAF2:
ofsset_03_AAFA:
	.byte $E4,$F8,$E4,$00,$EC,$F1,$EC,$F8,$EC,$F9,$EC,$00,$F4,$F1,$F4,$F9;- D 1 - I - 0x006B0A 03:AAFA:
	.byte $F4,$01,$F4,$09,$FC,$F1,$FC,$F9,$FC,$01,$FC,$09,$04,$F4,$04,$FC;- D 1 - I - 0x006B1A 03:AB0A:
	.byte $04,$04,$09,$F4,$0C,$F5,$0C,$05;- D 1 - I - 0x006B2A 03:AB1A:
ofsset_03_AB22:
	.byte $E2,$F8,$E2,$00,$EA,$F1,$EA,$F8,$EA,$F9,$EA,$00,$F2,$F1,$F2,$F9;- D 1 - I - 0x006B32 03:AB22:
	.byte $F2,$01,$F2,$09,$FA,$F1,$FA,$F9,$FA,$01,$FA,$09,$02,$F4,$02,$FC;- D 1 - I - 0x006B42 03:AB32:
	.byte $02,$04,$09,$F8,$0A,$FB,$0A,$03;- D 1 - I - 0x006B52 03:AB42:
ofsset_03_AB4A:
	.byte $ED,$E9,$ED,$F1,$ED,$F1,$ED,$F9,$F5,$E9,$F5,$EF,$F5,$F1,$F5,$F9;- D 1 - I - 0x006B5A 03:AB4A:
	.byte $F5,$01,$FD,$E9,$FD,$F1,$FD,$F9,$FD,$01,$05,$EE,$05,$F1,$05,$F6;- D 1 - I - 0x006B6A 03:AB5A:
	.byte $05,$FE,$05,$FF,$0D,$F1,$0D,$F9,$0D,$01;- D 1 - I - 0x006B7A 03:AB6A:
ofsset_03_AB74:
	.byte $E2,$EE,$E2,$F6,$E2,$FE,$EA,$F1,$EA,$F7,$EA,$F9,$EA,$01,$F2,$EE;- D 1 - I - 0x006B84 03:AB74:
	.byte $F2,$F6,$F2,$FE,$F2,$06,$FA,$EE,$FA,$F6,$FA,$FE,$FA,$06,$02,$F0;- D 1 - I - 0x006B94 03:AB84:
	.byte $02,$F8,$02,$FE,$02,$00,$02,$08,$0A,$FD,$0A,$05;- D 1 - I - 0x006BA4 03:AB94:
ofsset_03_ABA0:
	.byte $E3,$E8,$E3,$F6,$E3,$FE,$EB,$E9,$EB,$F1,$EB,$F8,$EB,$F9,$EB,$01;- D 1 - I - 0x006BB0 03:ABA0:
	.byte $F3,$E6,$F3,$EE,$F3,$F6,$F3,$FE,$F3,$06,$FB,$EE,$FB,$F6,$FB,$FE;- D 1 - I - 0x006BC0 03:ABB0:
	.byte $FB,$06,$03,$FD,$03,$FD,$03,$05,$0B,$FD,$0B,$05;- D 1 - I - 0x006BD0 03:ABC0:
ofsset_03_ABCC:
	.byte $E2,$F6,$E2,$FE,$EA,$F4,$EA,$FC,$EA,$FC,$EA,$04,$F2,$EE,$F2,$F6;- D 1 - I - 0x006BDC 03:ABCC:
	.byte $F2,$FE,$F2,$06,$FA,$E6,$FA,$EE,$FA,$F6,$FA,$FE,$FA,$06,$02,$F6;- D 1 - I - 0x006BEC 03:ABDC:
	.byte $02,$F6,$02,$FE,$02,$06,$0A,$FA,$0A,$03;- D 1 - I - 0x006BFC 03:ABEC:
ofsset_03_ABF6:
	.byte $E2,$F8,$E2,$00,$EA,$F0,$EA,$F8,$EA,$F8,$EA,$00,$EA,$08,$F2,$F0;- D 1 - I - 0x006C06 03:ABF6:
	.byte $F2,$F8,$F2,$F8,$F2,$00,$F2,$08,$FA,$F0,$FA,$F8,$FA,$00,$FA,$08;- D 1 - I - 0x006C16 03:AC06:
	.byte $02,$F7,$02,$FF,$0A,$F7,$0A,$FF;- D 1 - I - 0x006C26 03:AC16:
ofsset_03_AC1E:
	.byte $E8,$F1,$E8,$F8,$E8,$F9,$E8,$01,$F0,$F0,$F0,$F8,$F0,$F8,$F0,$00;- D 1 - I - 0x006C2E 03:AC1E:
	.byte $F0,$08,$F8,$EC,$F8,$F0,$F8,$F4,$F8,$FC,$F8,$04,$00,$E8,$00,$F0;- D 1 - I - 0x006C3E 03:AC2E:
	.byte $00,$F0,$00,$F8,$00,$00,$08,$F6,$08,$FE;- D 1 - I - 0x006C4E 03:AC3E:
ofsset_03_AC48:
	.byte $E3,$F6,$E3,$FE,$E3,$06,$EB,$F8,$EB,$FE,$EB,$00,$EB,$08,$F3,$F6;- D 1 - I - 0x006C58 03:AC48:
	.byte $F3,$FE,$F3,$06,$F3,$0E,$FB,$F6,$FB,$FE,$FB,$06,$FB,$0E,$03,$FC;- D 1 - I - 0x006C68 03:AC58:
	.byte $03,$03,$03,$0A,$03,$0B,$0B,$FE,$0B,$06;- D 1 - I - 0x006C78 03:AC68:
ofsset_03_AC72:
	.byte $F3,$00,$F3,$08,$F3,$10,$FB,$F8,$FB,$00,$FB,$08,$FB,$10,$FB,$18;- D 1 - I - 0x006C82 03:AC72:
	.byte $03,$F6,$03,$FE,$03,$06,$03,$0E,$03,$16,$0B,$F8,$0B,$07,$0B,$0F;- D 1 - I - 0x006C92 03:AC82:
ofsset_03_AC92:
	.byte $FB,$F6,$FB,$02,$FB,$0A,$FB,$12,$03,$F4,$03,$FC,$03,$02,$03,$0A;- D 1 - I - 0x006CA2 03:AC92:
	.byte $03,$12,$0B,$F4,$0B,$FC,$0B,$04,$0B,$0C,$0B,$12;- D 1 - I - 0x006CB2 03:ACA2:
ofsset_03_ACAE:
	.byte $ED,$FC                   ;- - - - - - 0x006CBE 03:ACAE: unused sprite offset pairs (dy, dx)
	.byte $ED,$06                   ;- - - - - - 0x006CC0 03:ACB0: unused sprite offset pairs (dy, dx)
	.byte $F5,$F7                   ;- - - - - - 0x006CC2 03:ACB2: unused sprite offset pairs (dy, dx)
	.byte $F5,$FD                   ;- - - - - - 0x006CC4 03:ACB4: unused sprite offset pairs (dy, dx)
	.byte $F5,$05                   ;- - - - - - 0x006CC6 03:ACB6: unused sprite offset pairs (dy, dx)
	.byte $F5,$05                   ;- - - - - - 0x006CC8 03:ACB8: unused sprite offset pairs (dy, dx)
	.byte $FD,$F4                   ;- - - - - - 0x006CCA 03:ACBA: unused sprite offset pairs (dy, dx)
	.byte $FD,$FC                   ;- - - - - - 0x006CCC 03:ACBC: unused sprite offset pairs (dy, dx)
	.byte $FD,$04                   ;- - - - - - 0x006CCE 03:ACBE: unused sprite offset pairs (dy, dx)
	.byte $FD,$0C                   ;- - - - - - 0x006CD0 03:ACC0: unused sprite offset pairs (dy, dx)
	.byte $05,$F4                   ;- - - - - - 0x006CD2 03:ACC2: unused sprite offset pairs (dy, dx)
	.byte $05,$FC                   ;- - - - - - 0x006CD4 03:ACC4: unused sprite offset pairs (dy, dx)
	.byte $05,$04                   ;- - - - - - 0x006CD6 03:ACC6: unused sprite offset pairs (dy, dx)
	.byte $05,$0C                   ;- - - - - - 0x006CD8 03:ACC8: unused sprite offset pairs (dy, dx)
	.byte $0D,$F4                   ;- - - - - - 0x006CDA 03:ACCA: unused sprite offset pairs (dy, dx)
	.byte $0D,$FB                   ;- - - - - - 0x006CDC 03:ACCC: unused sprite offset pairs (dy, dx)
	.byte $0D,$FC                   ;- - - - - - 0x006CDE 03:ACCE: unused sprite offset pairs (dy, dx)
	.byte $0D,$03                   ;- - - - - - 0x006CE0 03:ACD0: unused sprite offset pairs (dy, dx)
	.byte $15,$FB                   ;- - - - - - 0x006CE2 03:ACD2: unused sprite offset pairs (dy, dx)
	.byte $15,$03                   ;- - - - - - 0x006CE4 03:ACD4: unused sprite offset pairs (dy, dx)
ofsset_03_ACD6:
	.byte $15,$FA                   ;- - - - - - 0x006CE6 03:ACD6: unused sprite offset pairs (dy, dx)
	.byte $15,$02                   ;- - - - - - 0x006CE8 03:ACD8: unused sprite offset pairs (dy, dx)
	.byte $15,$F2                   ;- - - - - - 0x006CEA 03:ACDA: unused sprite offset pairs (dy, dx)
	.byte $0D,$F8                   ;- - - - - - 0x006CEC 03:ACDC: unused sprite offset pairs (dy, dx)
	.byte $0D,$00                   ;- - - - - - 0x006CEE 03:ACDE: unused sprite offset pairs (dy, dx)
	.byte $0D,$F0                   ;- - - - - - 0x006CF0 03:ACE0: unused sprite offset pairs (dy, dx)
	.byte $0D,$FA                   ;- - - - - - 0x006CF2 03:ACE2: unused sprite offset pairs (dy, dx)
	.byte $05,$FA                   ;- - - - - - 0x006CF4 03:ACE4: unused sprite offset pairs (dy, dx)
	.byte $05,$02                   ;- - - - - - 0x006CF6 03:ACE6: unused sprite offset pairs (dy, dx)
	.byte $05,$EA                   ;- - - - - - 0x006CF8 03:ACE8: unused sprite offset pairs (dy, dx)
	.byte $05,$F2                   ;- - - - - - 0x006CFA 03:ACEA: unused sprite offset pairs (dy, dx)
	.byte $FD,$FA                   ;- - - - - - 0x006CFC 03:ACEC: unused sprite offset pairs (dy, dx)
	.byte $FD,$02                   ;- - - - - - 0x006CFE 03:ACEE: unused sprite offset pairs (dy, dx)
	.byte $FD,$EA                   ;- - - - - - 0x006D00 03:ACF0: unused sprite offset pairs (dy, dx)
	.byte $FD,$F2                   ;- - - - - - 0x006D02 03:ACF2: unused sprite offset pairs (dy, dx)
	.byte $F5,$FC                   ;- - - - - - 0x006D04 03:ACF4: unused sprite offset pairs (dy, dx)
	.byte $F5,$ED                   ;- - - - - - 0x006D06 03:ACF6: unused sprite offset pairs (dy, dx)
	.byte $F5,$F5                   ;- - - - - - 0x006D08 03:ACF8: unused sprite offset pairs (dy, dx)
	.byte $F5,$EE                   ;- - - - - - 0x006D0A 03:ACFA: unused sprite offset pairs (dy, dx)
	.byte $ED,$F2                   ;- - - - - - 0x006D0C 03:ACFC: unused sprite offset pairs (dy, dx)
	.byte $ED,$FA                   ;- - - - - - 0x006D0E 03:ACFE: unused sprite offset pairs (dy, dx)
ofsset_03_AD00:
	.byte $07,$FC,$E2,$FB,$E2,$03,$EA,$F1,$EA,$FA,$EA,$02,$F2,$F1,$F2,$F3;- D 1 - I - 0x006D10 03:AD00:
	.byte $F2,$FB,$F2,$03,$FA,$F4,$FA,$FC,$FA,$00,$FA,$04,$02,$F4,$02,$FC;- D 1 - I - 0x006D20 03:AD10:
	.byte $02,$03,$0A,$FD,$0A,$FF,$0A,$07,$EA,$FA,$F2,$04,$FA,$FC,$02,$04;- D 1 - I - 0x006D30 03:AD20:
	.byte $0A,$07,$E5,$F6,$E0,$FB,$02,$F7;- D 1 - I - 0x006D40 03:AD30:
ofsset_03_AD38:
	.byte $07,$FA,$E2,$F9,$E2,$01,$EA,$EF,$EA,$F8,$EA,$00,$F2,$EF,$F2,$F1;- D 1 - I - 0x006D48 03:AD38:
	.byte $F2,$F9,$F2,$01,$FA,$F2,$FA,$FA,$FA,$FE,$FA,$02,$02,$F2,$02,$FA;- D 1 - I - 0x006D58 03:AD48:
	.byte $02,$01,$02,$02,$0A,$FD,$0A,$05,$EA,$F8,$F2,$02,$FA,$FA,$02,$03;- D 1 - I - 0x006D68 03:AD58:
	.byte $0A,$FD,$0A,$05,$E5,$F4,$E0,$F9,$02,$F5;- D 1 - I - 0x006D78 03:AD68:
ofsset_03_AD72:
	.byte $08,$FA,$E3,$F9,$E3,$01,$EB,$EF,$EB,$F8,$EB,$00,$F3,$EF,$F3,$F1;- D 1 - I - 0x006D82 03:AD72:
	.byte $F3,$F9,$F3,$01,$FB,$F2,$FB,$FA,$FB,$FE,$FB,$02,$03,$F2,$03,$FA;- D 1 - I - 0x006D92 03:AD82:
	.byte $03,$02,$03,$0A,$0B,$01,$0B,$0B,$EB,$F8,$F3,$02,$FB,$FA,$03,$01;- D 1 - I - 0x006DA2 03:AD92:
	.byte $03,$0B,$0B,$01,$E6,$F4,$E1,$F9,$03,$F5;- D 1 - I - 0x006DB2 03:ADA2:
ofsset_03_ADAC:
	.byte $08,$FA,$E3,$F9,$E3,$01,$EB,$EF,$EB,$F8,$EB,$00,$F3,$EF,$F3,$F1;- D 1 - I - 0x006DBC 03:ADAC:
	.byte $F3,$F9,$F3,$01,$FB,$F2,$FB,$FA,$FB,$FE,$FB,$02,$03,$F2,$03,$FA;- D 1 - I - 0x006DCC 03:ADBC:
	.byte $03,$02,$03,$0A,$0B,$FD,$0B,$0D,$EB,$F8,$F3,$02,$FB,$FA,$03,$01;- D 1 - I - 0x006DDC 03:ADCC:
	.byte $03,$0B,$0B,$FD,$0B,$09,$E6,$F4,$E1,$F9,$03,$F5;- D 1 - I - 0x006DEC 03:ADDC:
ofsset_03_ADE8:
	.byte $07,$FC,$E2,$FB,$E2,$03,$EA,$FA,$EA,$02,$F2,$F3,$F2,$FB,$F2,$03;- D 1 - I - 0x006DF8 03:ADE8:
	.byte $FA,$F4,$FA,$FC,$FA,$00,$FA,$04,$02,$F4,$02,$FC,$02,$03,$0A,$FD;- D 1 - I - 0x006E08 03:ADF8:
	.byte $0A,$FF,$0A,$07,$EA,$FA,$F2,$04,$FA,$FC,$02,$04,$0A,$07,$ED,$E3;- D 1 - I - 0x006E18 03:AE08:
	.byte $F2,$E8,$F7,$EB,$FA,$EF,$02,$F7;- D 1 - I - 0x006E28 03:AE18:
ofsset_03_AE20:
	.byte $F1,$EE,$F1,$F4,$F1,$FB,$F9,$EF,$F9,$F5,$F9,$FD,$F9,$FF,$F9,$06;- D 1 - I - 0x006E30 03:AE20:
	.byte $F9,$0A,$01,$EE,$01,$F6,$01,$FE,$01,$06,$09,$EE,$09,$F9,$09,$FC;- D 1 - I - 0x006E40 03:AE30:
	.byte $09,$01,$09,$06,$09,$09,$01,$F6,$01,$FE,$06,$DE,$06,$E6;- D 1 - I - 0x006E50 03:AE40:
ofsset_03_AE4E:
	.byte $E3,$F9,$E3,$01,$EB,$EF,$EB,$F8,$EB,$00,$F3,$EF,$F3,$F1,$F3,$F9;- D 1 - I - 0x006E5E 03:AE4E:
	.byte $F3,$01,$FB,$F2,$FB,$F8,$FB,$FD,$FB,$02,$03,$F5,$03,$FD,$03,$02;- D 1 - I - 0x006E6E 03:AE5E:
	.byte $03,$0A,$0B,$01,$0B,$0B,$EB,$F8,$F3,$02,$03,$0A,$0B,$01,$04,$E9;- D 1 - I - 0x006E7E 03:AE6E:
	.byte $FF,$EE,$E6,$F4,$E1,$F9   ;- D 1 - I - 0x006E8E 03:AE7E:
ofsset_03_AE84:
	.byte $E8,$F4,$E8,$FC,$E8,$04,$F0,$F0,$F0,$F2,$F0,$FA,$F0,$02,$F8,$F0;- D 1 - I - 0x006E94 03:AE84:
	.byte $F8,$F8,$F8,$00,$F8,$06,$F8,$08,$00,$F9,$00,$FC,$00,$01,$00,$04;- D 1 - I - 0x006EA4 03:AE94:
	.byte $00,$05,$00,$0C,$08,$FA,$08,$02,$08,$0A,$F8,$00,$08,$FC,$08,$04;- D 1 - I - 0x006EB4 03:AEA4:
	.byte $EE,$E4,$EE,$EC           ;- D 1 - I - 0x006EC4 03:AEB4:
ofsset_03_AEB8:
	.byte $EA,$F3,$EA,$FB,$F2,$F3,$F2,$F9,$F2,$01,$F2,$05,$FA,$F6,$FA,$FE;- D 1 - I - 0x006EC8 03:AEB8:
	.byte $FA,$06,$FA,$0A,$02,$FB,$02,$02,$02,$03,$02,$0A,$0A,$00,$0A,$08;- D 1 - I - 0x006ED8 03:AEC8:
	.byte $0A,$00,$0A,$08           ;- D 1 - I - 0x006EE8 03:AED8:
ofsset_03_AEDC:
	.byte $F0,$F3,$F0,$FA,$F0,$FE,$F0,$06,$F8,$F3,$F8,$F6,$F8,$FB,$F8,$FE;- D 1 - I - 0x006EEC 03:AEDC:
	.byte $F8,$06,$F8,$0E,$F8,$14,$00,$EE,$00,$F3,$00,$F6,$00,$FE,$00,$00;- D 1 - I - 0x006EFC 03:AEEC:
	.byte $00,$08,$00,$10,$00,$14,$08,$EF,$08,$06,$08,$0E;- D 1 - I - 0x006F0C 03:AEFC:
ofsset_03_AF08:
	.byte $FC,$FF,$FC,$07,$FC,$0F,$04,$EF,$04,$F7,$04,$06,$04,$07,$04,$0E;- D 1 - I - 0x006F18 03:AF08:
	.byte $04,$15,$0C,$EF,$0C,$F4,$0C,$FC,$0C,$FF,$0C,$07,$0C,$0F,$0C,$17;- D 1 - I - 0x006F28 03:AF18:
	.byte $04,$FF,$0C,$07           ;- D 1 - I - 0x006F38 03:AF28:
ofsset_03_AF2C:
	.byte $F2,$F3,$F2,$F7,$F2,$FF,$F2,$07,$FA,$F4,$FA,$F7,$FA,$FF,$FA,$06;- D 1 - I - 0x006F3C 03:AF2C:
	.byte $FA,$0A,$FA,$0E,$02,$F9,$02,$FC,$02,$04,$02,$0C,$02,$0E,$0A,$F9;- D 1 - I - 0x006F4C 03:AF3C:
	.byte $0A,$01,$0A,$09,$02,$04,$0A,$01,$0A,$09;- D 1 - I - 0x006F5C 03:AF4C:
ofsset_03_AF56:
	.byte $EE,$FD,$EE,$FF,$EE,$07,$F6,$F4,$F6,$FC,$F6,$03,$F6,$04,$FE,$F4;- D 1 - I - 0x006F66 03:AF56:
	.byte $FE,$FC,$FE,$00,$FE,$04,$06,$F1,$06,$F3,$06,$FB,$06,$03,$06,$04;- D 1 - I - 0x006F76 03:AF66:
	.byte $0E,$F1,$0E,$FA,$0E,$02,$16,$FB,$16,$03,$EE,$07,$FE,$FC,$0E,$FA;- D 1 - I - 0x006F86 03:AF76:
ofsset_03_AF86:
	.byte $EE,$F0,$EE,$F8,$F6,$EE,$F6,$F5,$F6,$F6,$F6,$FD,$FE,$EE,$FE,$F2;- D 1 - I - 0x006F96 03:AF86:
	.byte $FE,$FA,$FE,$02,$06,$F3,$06,$F7,$06,$FF,$06,$05,$0E,$FD,$0E,$05;- D 1 - I - 0x006FA6 03:AF96:
	.byte $EE,$F0,$EE,$F8           ;- D 1 - I - 0x006FB6 03:AFA6:
ofsset_03_AFAA:
	.byte $FE,$F9,$F9,$FE           ;- D 1 - I - 0x006FBA 03:AFAA:
ofsset_03_AFAE:
	.byte $FC,$F8,$FC,$00           ;- D 1 - I - 0x006FBE 03:AFAE:
ofsset_03_AFB2:
	.byte $FA,$FA,$FF,$FF           ;- D 1 - I - 0x006FC2 03:AFB2:
ofsset_03_AFB6:
	.byte $F8,$FC,$00,$FC           ;- D 1 - I - 0x006FC6 03:AFB6:
ofsset_03_AFBA:
	.byte $E3,$01,$E3,$09,$EB,$F1,$EB,$F9,$EB,$01,$EB,$09,$F3,$F1,$F3,$F9;- D 1 - I - 0x006FCA 03:AFBA:
	.byte $F3,$01,$F3,$09,$FB,$F5,$FB,$FD,$FB,$05,$03,$FA,$03,$02,$0B,$F9;- D 1 - I - 0x006FDA 03:AFCA:
	.byte $0B,$01,$0B,$01           ;- D 1 - I - 0x006FEA 03:AFDA:
ofsset_03_AFDE:
	.byte $E3,$01,$E3,$09,$EB,$F9,$EB,$01,$EB,$09,$F3,$E9,$F3,$F1,$F3,$F9;- D 1 - I - 0x006FEE 03:AFDE:
	.byte $F3,$01,$F3,$09,$FB,$ED,$FB,$F5,$FB,$FD,$FB,$05,$03,$FA,$03,$02;- D 1 - I - 0x006FFE 03:AFEE:
	.byte $0B,$F9,$0B,$01,$0B,$01   ;- D 1 - I - 0x00700E 03:AFFE:
ofsset_03_B004:
	.byte $E3,$F7,$E3,$FF,$E3,$07,$EB,$EF,$EB,$F7,$EB,$FF,$EB,$07,$F3,$F1;- D 1 - I - 0x007014 03:B004:
	.byte $F3,$F9,$F3,$01,$F3,$09,$FB,$F9,$FB,$01,$FB,$09,$03,$FA,$03,$02;- D 1 - I - 0x007024 03:B014:
	.byte $0B,$F9,$0B,$01,$0B,$01   ;- D 1 - I - 0x007034 03:B024:
ofsset_03_B02A:
	.byte $E1,$F5,$E9,$F0,$E9,$F8,$E9,$00,$F1,$F0,$F1,$F8,$F1,$00,$F1,$08;- D 1 - I - 0x00703A 03:B02A:
	.byte $F9,$F0,$F9,$F8,$F9,$00,$F9,$08,$01,$F6,$01,$FE,$01,$06,$09,$FD;- D 1 - I - 0x00704A 03:B03A:
	.byte $09,$00,$09,$08,$01,$FE   ;- D 1 - I - 0x00705A 03:B04A:
ofsset_03_B050:
	.byte $ED,$E6,$ED,$EE,$ED,$F6,$F5,$E6,$F5,$EE,$F5,$F6,$F5,$FE,$FD,$EF;- D 1 - I - 0x007060 03:B050:
	.byte $FD,$F7,$FD,$FF,$05,$EE,$05,$F4,$05,$FC,$05,$FE,$0D,$EE,$0D,$F6;- D 1 - I - 0x007070 03:B060:
	.byte $0D,$FB,$0D,$FE           ;- D 1 - I - 0x007080 03:B070:
ofsset_03_B074:
	.byte $ED,$E6,$ED,$EE,$ED,$F6,$F5,$F6,$F5,$FE,$FD,$F7,$FD,$FF,$05,$F4;- D 1 - I - 0x007084 03:B074:
	.byte $05,$FC,$05,$FE,$0D,$F6,$0D,$FB,$0D,$FE,$F5,$E6,$F5,$EE,$FD,$E7;- D 1 - I - 0x007094 03:B084:
	.byte $FD,$EF,$05,$E6,$05,$EE,$0D,$EE;- D 1 - I - 0x0070A4 03:B094:
ofsset_03_B09C:
	.byte $DB,$ED,$DB,$F5,$E3,$EB,$E3,$F3,$E3,$FB,$EB,$E5,$EB,$ED,$EB,$F5;- D 1 - I - 0x0070AC 03:B09C:
	.byte $EB,$FD,$F3,$E5,$F3,$ED,$F3,$F5,$F3,$FD,$FB,$ED,$FB,$F5,$FB,$FD;- D 1 - I - 0x0070BC 03:B0AC:
	.byte $03,$F4,$03,$FC,$03,$FD,$0B,$FD,$0B,$F2;- D 1 - I - 0x0070CC 03:B0BC:
ofsset_03_B0C6:
	.byte $DB,$ED,$DB,$F5,$E3,$F3,$E3,$FB,$EB,$FD,$F3,$F5,$F3,$FD,$FB,$ED;- D 1 - I - 0x0070D6 03:B0C6:
	.byte $FB,$F5,$FB,$FD,$03,$F4,$03,$FC,$03,$FD,$0B,$FD,$0B,$F2,$EB,$F5;- D 1 - I - 0x0070E6 03:B0D6:
	.byte $E3,$EB,$EB,$E5,$EB,$ED,$F3,$ED;- D 1 - I - 0x0070F6 03:B0E6:
ofsset_03_B0EE:
	.byte $02,$DB,$8A,$BF,$68,$4E,$AA,$F3,$A6,$7D,$6E,$FF,$0E,$B6,$6A,$BF;- - - - - - 0x0070FE 03:B0EE:
	.byte $EE,$FB                   ;- - - - - - 0x00710E 03:B0FE:
; sprite offset set pointers (256), low bytes; hi at 03:B200
ofsSetLo_03:
	.lobytes ofsset_03_A000, ofsset_03_A016, ofsset_03_A028, ofsset_03_A03A, ofsset_03_A04C, ofsset_03_A062, ofsset_03_A076, ofsset_03_A08C;- D 1 - - - 0x007110 03:B100:
	.lobytes ofsset_03_A0A2, ofsset_03_A0B6, ofsset_03_A0CA, ofsset_03_A0DA, ofsset_03_A0F0, ofsset_03_A104, ofsset_03_A120, ofsset_03_A136;- D 1 - - - 0x007118 03:B108:
	.lobytes ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136;- - - - - - 0x007120 03:B110:
	.lobytes ofsset_03_A136, ofsset_03_A14A, ofsset_03_A14A, ofsset_03_A15E, ofsset_03_A172, ofsset_03_A184, ofsset_03_A198, ofsset_03_A1AE;- D 1 - - - 0x007128 03:B118:
	.lobytes ofsset_03_A1AE, ofsset_03_A1C4, ofsset_03_A1C4, ofsset_03_A1D6, ofsset_03_A1D6, ofsset_03_A1E8, ofsset_03_A1E8, ofsset_03_A1FE;- D 1 - - - 0x007130 03:B120:
	.lobytes ofsset_03_A216, ofsset_03_A230, ofsset_03_A248, ofsset_03_A25E, ofsset_03_A276, ofsset_03_A292, ofsset_03_A2A6, ofsset_03_A2C0;- D 1 - - - 0x007138 03:B128:
	.lobytes ofsset_03_A2D8, ofsset_03_A2F0, ofsset_03_A306, ofsset_03_A31E, ofsset_03_A332, ofsset_03_A332, ofsset_03_A332, ofsset_03_A346;- D 1 - - - 0x007140 03:B130:
	.lobytes ofsset_03_A346, ofsset_03_A358, ofsset_03_A36C, ofsset_03_A37E, ofsset_03_A392, ofsset_03_A3AC, ofsset_03_A3C0, ofsset_03_A3D8;- D 1 - - - 0x007148 03:B138:
	.lobytes ofsset_03_A3EC, ofsset_03_A402, ofsset_03_A416, ofsset_03_A428, ofsset_03_A43E, ofsset_03_A458, ofsset_03_A474, ofsset_03_A492;- D 1 - - - 0x007150 03:B140:
	.lobytes ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4C2, ofsset_03_A4C2, ofsset_03_A4D4;- - - - - - 0x007158 03:B148:
	.lobytes ofsset_03_A4D4, ofsset_03_A4EA, ofsset_03_A4EA, ofsset_03_A4FC, ofsset_03_A4FC, ofsset_03_A510, ofsset_03_A510, ofsset_03_A522;- D 1 - - - 0x007160 03:B150:
	.lobytes ofsset_03_A522, ofsset_03_A542, ofsset_03_A542, ofsset_03_A562, ofsset_03_A562, ofsset_03_A562, ofsset_03_A584, ofsset_03_A5B0;- D 1 - - - 0x007168 03:B158:
	.lobytes ofsset_03_A5D2, ofsset_03_A5F4, ofsset_03_A614, ofsset_03_A63C, ofsset_03_A65E, ofsset_03_A65E, ofsset_03_A684, ofsset_03_A6A8;- D 1 - - - 0x007170 03:B160:
	.lobytes ofsset_03_A6CE, ofsset_03_A6F8, ofsset_03_A71A, ofsset_03_A73C, ofsset_03_A760, ofsset_03_A77E, ofsset_03_A77E, ofsset_03_A788;- D 1 - - - 0x007178 03:B168:
	.lobytes ofsset_03_A788, ofsset_03_A7AA, ofsset_03_A7AA, ofsset_03_A7CE, ofsset_03_A7CE, ofsset_03_A7E6, ofsset_03_A7E6, ofsset_03_A80A;- - - - - - 0x007180 03:B170:
	.lobytes ofsset_03_A82A, ofsset_03_A82A, ofsset_03_A84A, ofsset_03_A84A, ofsset_03_A84A, ofsset_03_A86C, ofsset_03_A86C, ofsset_03_A88C;- - - - - - 0x007188 03:B178:
	.lobytes ofsset_03_A88C, ofsset_03_A8AC, ofsset_03_A8CC, ofsset_03_A8EE, ofsset_03_A8EE, ofsset_03_A918, ofsset_03_A93E, ofsset_03_A964;- D 1 - - - 0x007190 03:B180:
	.lobytes ofsset_03_A964, ofsset_03_A990, ofsset_03_A990, ofsset_03_A9B0, ofsset_03_A9B0, ofsset_03_A9D2, ofsset_03_A9D2, ofsset_03_A9F8;- D 1 - - - 0x007198 03:B188:
	.lobytes ofsset_03_A9F8, ofsset_03_AA1C, ofsset_03_AA1C, ofsset_03_AA3E, ofsset_03_AA3E, ofsset_03_AA60, ofsset_03_AA82, ofsset_03_AAAA;- D 1 - - - 0x0071A0 03:B190:
	.lobytes ofsset_03_AAD2, ofsset_03_AAFA, ofsset_03_AB22, ofsset_03_AB4A, ofsset_03_AB74, ofsset_03_ABA0, ofsset_03_ABCC, ofsset_03_ABF6;- D 1 - - - 0x0071A8 03:B198:
	.lobytes ofsset_03_AC1E, ofsset_03_AC48, ofsset_03_AC72, ofsset_03_AC92, ofsset_03_ACAE, ofsset_03_ACD6, ofsset_03_AD00, ofsset_03_AD00;- D 1 - - - 0x0071B0 03:B1A0:
	.lobytes ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00;- - - - - - 0x0071B8 03:B1A8:
	.lobytes ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD38, ofsset_03_AD72, ofsset_03_ADAC, ofsset_03_ADE8, ofsset_03_AE20, ofsset_03_AE4E;- - - - - - 0x0071C0 03:B1B0:
	.lobytes ofsset_03_AE84, ofsset_03_AEB8, ofsset_03_AEDC, ofsset_03_AF08, ofsset_03_AF2C, ofsset_03_AF56, ofsset_03_AF86, ofsset_03_AFAA;- D 1 - - - 0x0071C8 03:B1B8:
	.lobytes ofsset_03_AFAE, ofsset_03_AFB2, ofsset_03_AFB6, ofsset_03_AFBA, ofsset_03_AFDE, ofsset_03_B004, ofsset_03_B02A, ofsset_03_B050;- D 1 - - - 0x0071D0 03:B1C0:
	.lobytes ofsset_03_B050, ofsset_03_B050, ofsset_03_B074, ofsset_03_B09C, ofsset_03_B0C6, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0071D8 03:B1C8:
	.lobytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0071E0 03:B1D0:
	.lobytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0071E8 03:B1D8:
	.lobytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0071F0 03:B1E0:
	.lobytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0071F8 03:B1E8:
	.lobytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x007200 03:B1F0:
	.lobytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x007208 03:B1F8:
ofsSetHi_03:
	.hibytes ofsset_03_A000, ofsset_03_A016, ofsset_03_A028, ofsset_03_A03A, ofsset_03_A04C, ofsset_03_A062, ofsset_03_A076, ofsset_03_A08C;- D 1 - - - 0x007210 03:B200:
	.hibytes ofsset_03_A0A2, ofsset_03_A0B6, ofsset_03_A0CA, ofsset_03_A0DA, ofsset_03_A0F0, ofsset_03_A104, ofsset_03_A120, ofsset_03_A136;- D 1 - - - 0x007218 03:B208:
	.hibytes ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136, ofsset_03_A136;- - - - - - 0x007220 03:B210:
	.hibytes ofsset_03_A136, ofsset_03_A14A, ofsset_03_A14A, ofsset_03_A15E, ofsset_03_A172, ofsset_03_A184, ofsset_03_A198, ofsset_03_A1AE;- D 1 - - - 0x007228 03:B218:
	.hibytes ofsset_03_A1AE, ofsset_03_A1C4, ofsset_03_A1C4, ofsset_03_A1D6, ofsset_03_A1D6, ofsset_03_A1E8, ofsset_03_A1E8, ofsset_03_A1FE;- D 1 - - - 0x007230 03:B220:
	.hibytes ofsset_03_A216, ofsset_03_A230, ofsset_03_A248, ofsset_03_A25E, ofsset_03_A276, ofsset_03_A292, ofsset_03_A2A6, ofsset_03_A2C0;- D 1 - - - 0x007238 03:B228:
	.hibytes ofsset_03_A2D8, ofsset_03_A2F0, ofsset_03_A306, ofsset_03_A31E, ofsset_03_A332, ofsset_03_A332, ofsset_03_A332, ofsset_03_A346;- D 1 - - - 0x007240 03:B230:
	.hibytes ofsset_03_A346, ofsset_03_A358, ofsset_03_A36C, ofsset_03_A37E, ofsset_03_A392, ofsset_03_A3AC, ofsset_03_A3C0, ofsset_03_A3D8;- D 1 - - - 0x007248 03:B238:
	.hibytes ofsset_03_A3EC, ofsset_03_A402, ofsset_03_A416, ofsset_03_A428, ofsset_03_A43E, ofsset_03_A458, ofsset_03_A474, ofsset_03_A492;- D 1 - - - 0x007250 03:B240:
	.hibytes ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4AC, ofsset_03_A4C2, ofsset_03_A4C2, ofsset_03_A4D4;- - - - - - 0x007258 03:B248:
	.hibytes ofsset_03_A4D4, ofsset_03_A4EA, ofsset_03_A4EA, ofsset_03_A4FC, ofsset_03_A4FC, ofsset_03_A510, ofsset_03_A510, ofsset_03_A522;- D 1 - - - 0x007260 03:B250:
	.hibytes ofsset_03_A522, ofsset_03_A542, ofsset_03_A542, ofsset_03_A562, ofsset_03_A562, ofsset_03_A562, ofsset_03_A584, ofsset_03_A5B0;- D 1 - - - 0x007268 03:B258:
	.hibytes ofsset_03_A5D2, ofsset_03_A5F4, ofsset_03_A614, ofsset_03_A63C, ofsset_03_A65E, ofsset_03_A65E, ofsset_03_A684, ofsset_03_A6A8;- D 1 - - - 0x007270 03:B260:
	.hibytes ofsset_03_A6CE, ofsset_03_A6F8, ofsset_03_A71A, ofsset_03_A73C, ofsset_03_A760, ofsset_03_A77E, ofsset_03_A77E, ofsset_03_A788;- D 1 - - - 0x007278 03:B268:
	.hibytes ofsset_03_A788, ofsset_03_A7AA, ofsset_03_A7AA, ofsset_03_A7CE, ofsset_03_A7CE, ofsset_03_A7E6, ofsset_03_A7E6, ofsset_03_A80A;- - - - - - 0x007280 03:B270:
	.hibytes ofsset_03_A82A, ofsset_03_A82A, ofsset_03_A84A, ofsset_03_A84A, ofsset_03_A84A, ofsset_03_A86C, ofsset_03_A86C, ofsset_03_A88C;- - - - - - 0x007288 03:B278:
	.hibytes ofsset_03_A88C, ofsset_03_A8AC, ofsset_03_A8CC, ofsset_03_A8EE, ofsset_03_A8EE, ofsset_03_A918, ofsset_03_A93E, ofsset_03_A964;- D 1 - - - 0x007290 03:B280:
	.hibytes ofsset_03_A964, ofsset_03_A990, ofsset_03_A990, ofsset_03_A9B0, ofsset_03_A9B0, ofsset_03_A9D2, ofsset_03_A9D2, ofsset_03_A9F8;- D 1 - - - 0x007298 03:B288:
	.hibytes ofsset_03_A9F8, ofsset_03_AA1C, ofsset_03_AA1C, ofsset_03_AA3E, ofsset_03_AA3E, ofsset_03_AA60, ofsset_03_AA82, ofsset_03_AAAA;- D 1 - - - 0x0072A0 03:B290:
	.hibytes ofsset_03_AAD2, ofsset_03_AAFA, ofsset_03_AB22, ofsset_03_AB4A, ofsset_03_AB74, ofsset_03_ABA0, ofsset_03_ABCC, ofsset_03_ABF6;- D 1 - - - 0x0072A8 03:B298:
	.hibytes ofsset_03_AC1E, ofsset_03_AC48, ofsset_03_AC72, ofsset_03_AC92, ofsset_03_ACAE, ofsset_03_ACD6, ofsset_03_AD00, ofsset_03_AD00;- D 1 - - - 0x0072B0 03:B2A0:
	.hibytes ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD00;- - - - - - 0x0072B8 03:B2A8:
	.hibytes ofsset_03_AD00, ofsset_03_AD00, ofsset_03_AD38, ofsset_03_AD72, ofsset_03_ADAC, ofsset_03_ADE8, ofsset_03_AE20, ofsset_03_AE4E;- - - - - - 0x0072C0 03:B2B0:
	.hibytes ofsset_03_AE84, ofsset_03_AEB8, ofsset_03_AEDC, ofsset_03_AF08, ofsset_03_AF2C, ofsset_03_AF56, ofsset_03_AF86, ofsset_03_AFAA;- D 1 - - - 0x0072C8 03:B2B8:
	.hibytes ofsset_03_AFAE, ofsset_03_AFB2, ofsset_03_AFB6, ofsset_03_AFBA, ofsset_03_AFDE, ofsset_03_B004, ofsset_03_B02A, ofsset_03_B050;- D 1 - - - 0x0072D0 03:B2C0:
	.hibytes ofsset_03_B050, ofsset_03_B050, ofsset_03_B074, ofsset_03_B09C, ofsset_03_B0C6, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0072D8 03:B2C8:
	.hibytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0072E0 03:B2D0:
	.hibytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0072E8 03:B2D8:
	.hibytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0072F0 03:B2E0:
	.hibytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x0072F8 03:B2E8:
	.hibytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x007300 03:B2F0:
	.hibytes ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE, ofsset_03_B0EE;- - - - - - 0x007308 03:B2F8:
; enemy AI entry stubs (bank 03 set), 3 bytes each, indexed by enemy kind from enemyAILo/Hi
ofs_03_B300:
	JMP loc_03_B3F4                 ;C - - J - - 0x007310 03:B300: 4C F4 B3
frame_02_8A30_02:
	JMP loc_03_BB91                 ;C - - J - - 0x007313 03:B303: 4C 91 BB
	JMP loc_03_B330                 ;- - - - - - 0x007316 03:B306: 4C 30 B3
	JMP loc_03_B330                 ;- - - - - - 0x007319 03:B309: 4C 30 B3
ofs_03_B30C:
	JMP loc_03_BBCB                 ;C - - J - - 0x00731C 03:B30C: 4C CB BB
enemyAI_75:
	JMP loc_03_BD46                 ;C - - J - - 0x00731F 03:B30F: 4C 46 BD
	JMP loc_03_B330                 ;- - - - - - 0x007322 03:B312: 4C 30 B3
	JMP loc_03_B330                 ;- - - - - - 0x007325 03:B315: 4C 30 B3
	JMP loc_03_B330                 ;- - - - - - 0x007328 03:B318: 4C 30 B3
	JMP loc_03_B330                 ;- - - - - - 0x00732B 03:B31B: 4C 30 B3
	JMP loc_03_B330                 ;- - - - - - 0x00732E 03:B31E: 4C 30 B3
ofs_03_B321:
	JMP loc_03_BF38                 ;C - - J - - 0x007331 03:B321: 4C 38 BF
enemyAI_7C:
	JMP loc_03_BFBE                 ;C - - J - - 0x007334 03:B324: 4C BE BF
ofs_03_B327:
	JMP loc_03_BF95                 ;C - - J - - 0x007337 03:B327: 4C 95 BF
enemyAI_7E:
	JMP loc_03_BF48                 ;C - - J - - 0x00733A 03:B32A: 4C 48 BF
enemyAI_7F:
	JMP loc_03_BED2                 ;C - - J - - 0x00733D 03:B32D: 4C D2 BE
loc_03_B330:
	RTS                             ;- - - - - - 0x007340 03:B330: 60
EnemyMoveProbe4Way:
	LDA #$00                        ;C - - - - - 0x007341 03:B331: A9 00
	STA ptr_0E+1                    ;C - - - - - 0x007343 03:B333: 85 0F
	LDA objFacing,X                 ;C - - - - - 0x007345 03:B335: BD 60 04
	AND #$08                        ;C - - - - - 0x007348 03:B338: 29 08
	BEQ loc_03_B34D                 ;C - - - - - 0x00734A 03:B33A: F0 11
	LDY #$01                        ;C - - - - - 0x00734C 03:B33C: A0 01
	JSR MoveYSubCheck               ;C - - - - - 0x00734E 03:B33E: 20 F7 F0
	BCC loc_03_B363                 ;C - - - - - 0x007351 03:B341: 90 20
	LDA spriteFlipMask              ;C - - - - - 0x007353 03:B343: A5 10
	AND #$10                        ;C - - - - - 0x007355 03:B345: 29 10
	BEQ loc_03_B363                 ;C - - - - - 0x007357 03:B347: F0 1A
	STA ptr_0E+1                    ;C - - - - - 0x007359 03:B349: 85 0F
	BNE loc_03_B363                 ;C - - - - - 0x00735B 03:B34B: D0 16
loc_03_B34D:
	LDA objFacing,X                 ;C - - - - - 0x00735D 03:B34D: BD 60 04
	AND #$04                        ;C - - - - - 0x007360 03:B350: 29 04
	BEQ loc_03_B363                 ;C - - - - - 0x007362 03:B352: F0 0F
	LDY #$00                        ;C - - - - - 0x007364 03:B354: A0 00
	JSR MoveYAddCheck               ;C - - - - - 0x007366 03:B356: 20 A2 F0
	BCC loc_03_B363                 ;C - - - - - 0x007369 03:B359: 90 08
	LDA spriteFlipMask              ;C - - - - - 0x00736B 03:B35B: A5 10
	AND #$10                        ;C - - - - - 0x00736D 03:B35D: 29 10
	BEQ loc_03_B363                 ;C - - - - - 0x00736F 03:B35F: F0 02
	STA ptr_0E+1                    ;C - - - - - 0x007371 03:B361: 85 0F
loc_03_B363:
	LDA objFacing,X                 ;C - - - - - 0x007373 03:B363: BD 60 04
	AND #$01                        ;C - - - - - 0x007376 03:B366: 29 01
	BEQ loc_03_B37B                 ;C - - - - - 0x007378 03:B368: F0 11
	LDY #$00                        ;C - - - - - 0x00737A 03:B36A: A0 00
	JSR SetFlag40MoveRight          ;C - - - - - 0x00737C 03:B36C: 20 00 F0
	BCC loc_03_B37B                 ;C - - - - - 0x00737F 03:B36F: 90 0A
	LDA spriteFlipMask              ;c - - - - - 0x007381 03:B371: A5 10
	AND #$10                        ;c - - - - - 0x007383 03:B373: 29 10
	BEQ loc_03_B38F                 ;c - - - - - 0x007385 03:B375: F0 18
	STA ptr_0E+1                    ;c - - - - - 0x007387 03:B377: 85 0F
	BNE loc_03_B38F                 ;c - - - - - 0x007389 03:B379: D0 14
loc_03_B37B:
	LDA objFacing,X                 ;C - - - - - 0x00738B 03:B37B: BD 60 04
	AND #$02                        ;C - - - - - 0x00738E 03:B37E: 29 02
	BEQ loc_03_B38F                 ;C - - - - - 0x007390 03:B380: F0 0D
	LDY #$01                        ;C - - - - - 0x007392 03:B382: A0 01
	JSR ClearFlag40MoveLeft         ;C - - - - - 0x007394 03:B384: 20 51 F0
	BCC loc_03_B38F                 ;C - - - - - 0x007397 03:B387: 90 06
	LDA spriteFlipMask              ;c - - - - - 0x007399 03:B389: A5 10
	AND #$10                        ;c - - - - - 0x00739B 03:B38B: 29 10
	STA ptr_0E+1                    ;c - - - - - 0x00739D 03:B38D: 85 0F
loc_03_B38F:
	RTS                             ;C - - - - - 0x00739F 03:B38F: 60
SetFlag40ToPlayer_03:
	JSR DistanceXToPlayer           ;C - - - - - 0x0073A0 03:B390: 20 74 F3
	BCS loc_03_B398                 ;C - - - - - 0x0073A3 03:B393: B0 03
	JMP ClearObjFlag40              ;C - - - - - 0x0073A5 03:B395: 4C 99 F0
loc_03_B398:
	JMP SetObjFlag40                ;C - - - - - 0x0073A8 03:B398: 4C 90 F0
SetVelFromTbl_B39B:
	LDA SetVelFromTbl_B39BTbl_B3C4,Y;C - - - - - 0x0073AB 03:B39B: B9 C4 B3
	STA objVelXLo,X                 ;C - - - - - 0x0073AE 03:B39E: 9D 00 04
	LDA SetVelFromTbl_B39BTbl_B3B4,Y;C - - - - - 0x0073B1 03:B3A1: B9 B4 B3
	STA objVelXHi,X                 ;C - - - - - 0x0073B4 03:B3A4: 9D 10 04
	LDA SetVelFromTbl_B39BTbl_B3E4,Y;C - - - - - 0x0073B7 03:B3A7: B9 E4 B3
	STA objVelYLo,X                 ;C - - - - - 0x0073BA 03:B3AA: 9D 20 04
	LDA SetVelFromTbl_B39BTbl_B3D4,Y;C - - - - - 0x0073BD 03:B3AD: B9 D4 B3
	STA objVelYHi,X                 ;C - - - - - 0x0073C0 03:B3B0: 9D 30 04
	RTS                             ;C - - - - - 0x0073C3 03:B3B3: 60
SetVelFromTbl_B39BTbl_B3B4:
	.byte $00,$00,$00,$00,$01,$00,$00,$00;- D 1 - - - 0x0073C4 03:B3B4:
	.byte $00                       ;- - - - - - 0x0073CC 03:B3BC:
	.byte $00,$00,$00,$01,$00,$00   ;- D 1 - - - 0x0073CD 03:B3BD:
	.byte $00                       ;- - - - - - 0x0073D3 03:B3C3:
SetVelFromTbl_B39BTbl_B3C4:
	.byte $00,$61,$B5,$EC,$00,$EC,$B5,$61;- D 1 - - - 0x0073D4 03:B3C4:
	.byte $00                       ;- - - - - - 0x0073DC 03:B3CC:
	.byte $61,$B5,$EC,$00,$EC,$B5   ;- D 1 - - - 0x0073DD 03:B3CD:
	.byte $61                       ;- - - - - - 0x0073E3 03:B3D3:
SetVelFromTbl_B39BTbl_B3D4:
	.byte $01,$00,$00,$00,$00,$00,$00,$00;- D 1 - - - 0x0073E4 03:B3D4:
	.byte $01                       ;- - - - - - 0x0073EC 03:B3DC:
	.byte $00,$00,$00,$00,$00,$00   ;- D 1 - - - 0x0073ED 03:B3DD:
	.byte $00                       ;- - - - - - 0x0073F3 03:B3E3:
SetVelFromTbl_B39BTbl_B3E4:
	.byte $00,$EC,$B5,$61,$00,$61,$B5,$EC;- D 1 - - - 0x0073F4 03:B3E4:
	.byte $00                       ;- - - - - - 0x0073FC 03:B3EC:
	.byte $EC,$B5,$61,$00,$61,$B5   ;- D 1 - - - 0x0073FD 03:B3ED:
	.byte $EC                       ;- - - - - - 0x007403 03:B3F3:
loc_03_B3F4:
	LDA objDownState,X              ;C - - - - - 0x007404 03:B3F4: BD C0 04
	BEQ loc_03_B3FC                 ;C - - - - - 0x007407 03:B3F7: F0 03
	DEC objDownState,X              ;C - - - - - 0x007409 03:B3F9: DE C0 04
loc_03_B3FC:
	LDA objVariant,X                ;C - - - - - 0x00740C 03:B3FC: BD C0 05
	BEQ loc_03_B404                 ;C - - - - - 0x00740F 03:B3FF: F0 03
	DEC objVariant,X                ;C - - - - - 0x007411 03:B401: DE C0 05
loc_03_B404:
	LDA #$00                        ;C - - - - - 0x007414 03:B404: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x007416 03:B406: 9D 40 04
	LDA #$09                        ;C - - - - - 0x007419 03:B409: A9 09
	STA objSpriteDown,X             ;C - - - - - 0x00741B 03:B40B: 9D B0 05
	LDA objKind+13                  ;C - - - - - 0x00741E 03:B40E: AD 2D 03
	CMP #$6E                        ;C - - - - - 0x007421 03:B411: C9 6E
	BNE loc_03_B421                 ;C - - - - - 0x007423 03:B413: D0 0C
	LDA #$01                        ;C - - - - - 0x007425 03:B415: A9 01
	STA objDownState,X              ;C - - - - - 0x007427 03:B417: 9D C0 04
	LDA #$D9                        ;C - - - - - 0x00742A 03:B41A: A9 D9
	LDY #$24                        ;C - - - - - 0x00742C 03:B41C: A0 24
	JMP SetAnimXChr3                ;C - - - - - 0x00742E 03:B41E: 4C 43 F4
loc_03_B421:
	LDA objGrabState,X              ;C - - - - - 0x007431 03:B421: BD F0 03
	BEQ loc_03_B46C                 ;C - - - - - 0x007434 03:B424: F0 46
	CMP #$FF                        ;C - - - - - 0x007436 03:B426: C9 FF
	BEQ loc_03_B45B                 ;C - - - - - 0x007438 03:B428: F0 31
	LDA gameAction                  ;C - - - - - 0x00743A 03:B42A: A5 30
	CMP #$04                        ;C - - - - - 0x00743C 03:B42C: C9 04
	BEQ loc_03_B434                 ;C - - - - - 0x00743E 03:B42E: F0 04
	CMP #$21                        ;C - - - - - 0x007440 03:B430: C9 21
	BNE loc_03_B46C                 ;C - - - - - 0x007442 03:B432: D0 38
loc_03_B434:
	CPX grabbedSlot                 ;C - - - - - 0x007444 03:B434: E4 39
	BNE loc_03_B46C                 ;C - - - - - 0x007446 03:B436: D0 34
	LDA gameAction                  ;C - - - - - 0x007448 03:B438: A5 30
	CMP #$21                        ;C - - - - - 0x00744A 03:B43A: C9 21
	BNE loc_03_B444                 ;C - - - - - 0x00744C 03:B43C: D0 06
	LDA #$DF                        ;C - - - - - 0x00744E 03:B43E: A9 DF
	LDY #$26                        ;C - - - - - 0x007450 03:B440: A0 26
	BNE loc_03_B448                 ;C - - - - - 0x007452 03:B442: D0 04
loc_03_B444:
	LDA #$D9                        ;C - - - - - 0x007454 03:B444: A9 D9
	LDY #$24                        ;C - - - - - 0x007456 03:B446: A0 24
loc_03_B448:
	JSR SetAnimXChr3                ;C - - - - - 0x007458 03:B448: 20 43 F4
	LDA #$00                        ;C - - - - - 0x00745B 03:B44B: A9 00
	STA objStep,X                   ;C - - - - - 0x00745D 03:B44D: 9D 00 05
	STA objHitTimer,X               ;C - - - - - 0x007460 03:B450: 9D E0 04
	LDA #$81                        ;C - - - - - 0x007463 03:B453: A9 81
	STA objActive,X                 ;C - - - - - 0x007465 03:B455: 9D 00 03
	JMP FaceToPlayerFlag            ;C - - - - - 0x007468 03:B458: 4C 43 F3
loc_03_B45B:
	LDA #$00                        ;c - - - - - 0x00746B 03:B45B: A9 00
	STA objGrabState,X              ;c - - - - - 0x00746D 03:B45D: 9D F0 03
	LDA playerId                    ;c - - - - - 0x007470 03:B460: A5 34
	CMP #$02                        ;c - - - - - 0x007472 03:B462: C9 02
	BNE loc_03_B46C                 ;c - - - - - 0x007474 03:B464: D0 06
	LDA objY                        ;c - - - - - 0x007476 03:B466: AD C0 03
	STA objY,X                      ;c - - - - - 0x007479 03:B469: 9D C0 03
loc_03_B46C:
	LDA objHitTimer,X               ;C - - - - - 0x00747C 03:B46C: BD E0 04
	BEQ loc_03_B4A6                 ;C - - - - - 0x00747F 03:B46F: F0 35
	CMP #$1E                        ;C - - - - - 0x007481 03:B471: C9 1E
	BEQ loc_03_B47D                 ;C - - - - - 0x007483 03:B473: F0 08
	CMP #$1A                        ;C - - - - - 0x007485 03:B475: C9 1A
	BEQ loc_03_B483                 ;C - - - - - 0x007487 03:B477: F0 0A
	CMP #$10                        ;C - - - - - 0x007489 03:B479: C9 10
	BCS loc_03_B48A                 ;C - - - - - 0x00748B 03:B47B: B0 0D
loc_03_B47D:
	LDA #$D9                        ;C - - - - - 0x00748D 03:B47D: A9 D9
	LDY #$24                        ;C - - - - - 0x00748F 03:B47F: A0 24
	BNE loc_03_B487                 ;C - - - - - 0x007491 03:B481: D0 04
loc_03_B483:
	LDA #$DF                        ;C - - - - - 0x007493 03:B483: A9 DF
	LDY #$26                        ;C - - - - - 0x007495 03:B485: A0 26
loc_03_B487:
	JSR SetAnimXChr3                ;C - - - - - 0x007497 03:B487: 20 43 F4
loc_03_B48A:
	LDA rngState0                   ;C - - - - - 0x00749A 03:B48A: A5 E4
	ASL A                           ;C - - - - - 0x00749C 03:B48C: 0A
	BCC loc_03_B495                 ;C - - - - - 0x00749D 03:B48D: 90 06
	LDA #$85                        ;C - - - - - 0x00749F 03:B48F: A9 85
	LDY #$00                        ;C - - - - - 0x0074A1 03:B491: A0 00
	BEQ loc_03_B499                 ;C - - - - - 0x0074A3 03:B493: F0 04
loc_03_B495:
	LDA #$84                        ;C - - - - - 0x0074A5 03:B495: A9 84
	LDY #$01                        ;C - - - - - 0x0074A7 03:B497: A0 01
loc_03_B499:
	STA objActive,X                 ;C - - - - - 0x0074A9 03:B499: 9D 00 03
	TYA                             ;C - - - - - 0x0074AC 03:B49C: 98
	STA objStep,X                   ;C - - - - - 0x0074AD 03:B49D: 9D 00 05
	DEC objHitTimer,X               ;C - - - - - 0x0074B0 03:B4A0: DE E0 04
	JMP FaceToPlayerFlag            ;C - - - - - 0x0074B3 03:B4A3: 4C 43 F3
loc_03_B4A6:
	LDA gameAction                  ;C - - - - - 0x0074B6 03:B4A6: A5 30
	CMP #$1F                        ;C - - - - - 0x0074B8 03:B4A8: C9 1F
	BEQ loc_03_B4BD                 ;C - - - - - 0x0074BA 03:B4AA: F0 11
	CMP #$0B                        ;C - - - - - 0x0074BC 03:B4AC: C9 0B
	BEQ loc_03_B4B6                 ;C - - - - - 0x0074BE 03:B4AE: F0 06
	CMP #$25                        ;C - - - - - 0x0074C0 03:B4B0: C9 25
	BEQ loc_03_B4E4                 ;C - - - - - 0x0074C2 03:B4B2: F0 30
	BNE loc_03_B50A                 ;C - - - - - 0x0074C4 03:B4B4: D0 54
loc_03_B4B6:
	LDA #$00                        ;C - - - - - 0x0074C6 03:B4B6: A9 00
	STA objAtkHeavy,X               ;C - - - - - 0x0074C8 03:B4B8: 9D D0 04
	BEQ loc_03_B50A                 ;C - - - - - 0x0074CB 03:B4BB: F0 4D
loc_03_B4BD:
	LDA #$00                        ;C - - - - - 0x0074CD 03:B4BD: A9 00
	STA objAtkHeavy,X               ;C - - - - - 0x0074CF 03:B4BF: 9D D0 04
	LDA #$18                        ;C - - - - - 0x0074D2 03:B4C2: A9 18
	STA objVariant,X                ;C - - - - - 0x0074D4 03:B4C4: 9D C0 05
	LDA objActive,X                 ;C - - - - - 0x0074D7 03:B4C7: BD 00 03
	CMP #$82                        ;C - - - - - 0x0074DA 03:B4CA: C9 82
	BEQ loc_03_B50A                 ;C - - - - - 0x0074DC 03:B4CC: F0 3C
	CMP #$86                        ;C - - - - - 0x0074DE 03:B4CE: C9 86
	BNE loc_03_B4D9                 ;C - - - - - 0x0074E0 03:B4D0: D0 07
	LDA #$D9                        ;C - - - - - 0x0074E2 03:B4D2: A9 D9
	LDY #$24                        ;C - - - - - 0x0074E4 03:B4D4: A0 24
	JMP SetAnimXChr3                ;C - - - - - 0x0074E6 03:B4D6: 4C 43 F4
loc_03_B4D9:
	LDA #$82                        ;C - - - - - 0x0074E9 03:B4D9: A9 82
	STA objActive,X                 ;C - - - - - 0x0074EB 03:B4DB: 9D 00 03
	LDA #$00                        ;C - - - - - 0x0074EE 03:B4DE: A9 00
	STA objStep,X                   ;C - - - - - 0x0074F0 03:B4E0: 9D 00 05
	RTS                             ;C - - - - - 0x0074F3 03:B4E3: 60
loc_03_B4E4:
	LDA objY,X                      ;C - - - - - 0x0074F4 03:B4E4: BD C0 03
	STA objParamC,X                 ;C - - - - - 0x0074F7 03:B4E7: 9D 30 05
	LDA #$8E                        ;C - - - - - 0x0074FA 03:B4EA: A9 8E
	STA objVelYLo,X                 ;C - - - - - 0x0074FC 03:B4EC: 9D 20 04
	LDA #$03                        ;C - - - - - 0x0074FF 03:B4EF: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x007501 03:B4F1: 9D 30 04
	LDA objKind,X                   ;C - - - - - 0x007504 03:B4F4: BD 20 03
	STA objId,X                     ;C - - - - - 0x007507 03:B4F7: 9D 30 03
	LDA #$05                        ;C - - - - - 0x00750A 03:B4FA: A9 05
	STA objKind,X                   ;C - - - - - 0x00750C 03:B4FC: 9D 20 03
	LDA #$80                        ;C - - - - - 0x00750F 03:B4FF: A9 80
	STA objActive,X                 ;C - - - - - 0x007511 03:B501: 9D 00 03
	LDA #$FF                        ;C - - - - - 0x007514 03:B504: A9 FF
	STA objDownState,X              ;C - - - - - 0x007516 03:B506: 9D C0 04
	RTS                             ;C - - - - - 0x007519 03:B509: 60
loc_03_B50A:
	LDA objXPage                    ;C - - - - - 0x00751A 03:B50A: AD 80 03
	CMP objXPage,X                  ;C - - - - - 0x00751D 03:B50D: DD 80 03
	BEQ loc_03_B515                 ;C - - - - - 0x007520 03:B510: F0 03
	JMP loc_03_BA53                 ;C - - - - - 0x007522 03:B512: 4C 53 BA
loc_03_B515:
	LDA objX,X                      ;C - - - - - 0x007525 03:B515: BD 60 03
	CMP #$F2                        ;C - - - - - 0x007528 03:B518: C9 F2
	BCS loc_03_B520                 ;C - - - - - 0x00752A 03:B51A: B0 04
	CMP #$16                        ;C - - - - - 0x00752C 03:B51C: C9 16
	BCS loc_03_B523                 ;C - - - - - 0x00752E 03:B51E: B0 03
loc_03_B520:
	JMP loc_03_BA53                 ;C - - - - - 0x007530 03:B520: 4C 53 BA
loc_03_B523:
	LDA objActive,X                 ;C - - - - - 0x007533 03:B523: BD 00 03
	AND #$0F                        ;C - - - - - 0x007536 03:B526: 29 0F
	TAY                             ;C - - - - - 0x007538 03:B528: A8
	LDA SetVelFromTbl_B39BTbl_B536,Y;C - - - - - 0x007539 03:B529: B9 36 B5
	STA ptr_00                      ;C - - - - - 0x00753C 03:B52C: 85 00
	LDA SetVelFromTbl_B39BTbl_B53E,Y;C - - - - - 0x00753E 03:B52E: B9 3E B5
	STA ptr_00+1                    ;C - - - - - 0x007541 03:B531: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x007543 03:B533: 6C 00 00
SetVelFromTbl_B39BTbl_B536:
	.lobytes ofs_03_B546, ofs_03_B57B, ofs_03_B666, ofs_03_B6F5, ofs_03_B7C9, ofs_03_B879, ofs_03_BA1C, ofs_03_BA88;- D 1 - - - 0x007546 03:B536:
SetVelFromTbl_B39BTbl_B53E:
	.hibytes ofs_03_B546, ofs_03_B57B, ofs_03_B666, ofs_03_B6F5, ofs_03_B7C9, ofs_03_B879, ofs_03_BA1C, ofs_03_BA88;- D 1 - - - 0x00754E 03:B53E:
ofs_03_B546:
	LDA #$00                        ;C - - J - - 0x007556 03:B546: A9 00
	STA objTimer,X                  ;C - - - - - 0x007558 03:B548: 9D D0 05
	STA objCounter,X                ;C - - - - - 0x00755B 03:B54B: 9D E0 05
	STA objStep,X                   ;C - - - - - 0x00755E 03:B54E: 9D 00 05
	LDA #$22                        ;C - - - - - 0x007561 03:B551: A9 22
	LDY #$09                        ;C - - - - - 0x007563 03:B553: A0 09
	JSR CheckNearPlayer             ;C - - - - - 0x007565 03:B555: 20 3E FB
	BCC loc_03_B571                 ;C - - - - - 0x007568 03:B558: 90 17
	LDA #$00                        ;C - - - - - 0x00756A 03:B55A: A9 00
	STA objStep,X                   ;C - - - - - 0x00756C 03:B55C: 9D 00 05
	LDA gameAction                  ;C - - - - - 0x00756F 03:B55F: A5 30
	CMP #$01                        ;C - - - - - 0x007571 03:B561: C9 01
	BEQ loc_03_B569                 ;C - - - - - 0x007573 03:B563: F0 04
	LDA #$83                        ;C - - - - - 0x007575 03:B565: A9 83
	BNE loc_03_B56B                 ;C - - - - - 0x007577 03:B567: D0 02
loc_03_B569:
	LDA #$87                        ;C - - - - - 0x007579 03:B569: A9 87
loc_03_B56B:
	STA objActive,X                 ;C - - - - - 0x00757B 03:B56B: 9D 00 03
	JMP FaceToPlayerFlag            ;C - - - - - 0x00757E 03:B56E: 4C 43 F3
loc_03_B571:
	INC objActive,X                 ;C - - - - - 0x007581 03:B571: FE 00 03
	LDA #$D9                        ;C - - - - - 0x007584 03:B574: A9 D9
	LDY #$24                        ;C - - - - - 0x007586 03:B576: A0 24
	JMP SetAnimXChr3                ;C - - - - - 0x007588 03:B578: 4C 43 F4
ofs_03_B57B:
	LDA #$DA                        ;C - - J - - 0x00758B 03:B57B: A9 DA
	CMP objAnim,X                   ;C - - - - - 0x00758D 03:B57D: DD 80 05
	BEQ loc_03_B587                 ;C - - - - - 0x007590 03:B580: F0 05
	LDY #$24                        ;C - - - - - 0x007592 03:B582: A0 24
	JSR SetAnimXChr3                ;C - - - - - 0x007594 03:B584: 20 43 F4
loc_03_B587:
	LDA gameAction                  ;C - - - - - 0x007597 03:B587: A5 30
	CMP #$01                        ;C - - - - - 0x007599 03:B589: C9 01
	BNE loc_03_B59F                 ;C - - - - - 0x00759B 03:B58B: D0 12
	LDA #$22                        ;C - - - - - 0x00759D 03:B58D: A9 22
	LDY #$08                        ;C - - - - - 0x00759F 03:B58F: A0 08
	JSR CheckNearPlayer             ;C - - - - - 0x0075A1 03:B591: 20 3E FB
	BCC loc_03_B59F                 ;C - - - - - 0x0075A4 03:B594: 90 09
	JSR FaceToPlayerFlag            ;C - - - - - 0x0075A6 03:B596: 20 43 F3
	LDA #$87                        ;C - - - - - 0x0075A9 03:B599: A9 87
	STA objActive,X                 ;C - - - - - 0x0075AB 03:B59B: 9D 00 03
	RTS                             ;C - - - - - 0x0075AE 03:B59E: 60
loc_03_B59F:
	LDA objStep,X                   ;C - - - - - 0x0075AF 03:B59F: BD 00 05
	BEQ loc_03_B5A7                 ;C - - - - - 0x0075B2 03:B5A2: F0 03
	JMP loc_03_B615                 ;C - - - - - 0x0075B4 03:B5A4: 4C 15 B6
loc_03_B5A7:
	LDA #$30                        ;C - - - - - 0x0075B7 03:B5A7: A9 30
	LDY #$10                        ;C - - - - - 0x0075B9 03:B5A9: A0 10
	JSR CheckNearPlayer             ;C - - - - - 0x0075BB 03:B5AB: 20 3E FB
	BCC loc_03_B5DC                 ;C - - - - - 0x0075BE 03:B5AE: 90 2C
	LDA #$00                        ;C - - - - - 0x0075C0 03:B5B0: A9 00
	STA objToggle,X                 ;C - - - - - 0x0075C2 03:B5B2: 9D F0 05
	STA objTimer,X                  ;C - - - - - 0x0075C5 03:B5B5: 9D D0 05
	LDA rngState0                   ;C - - - - - 0x0075C8 03:B5B8: A5 E4
	AND #$0F                        ;C - - - - - 0x0075CA 03:B5BA: 29 0F
	CMP #$06                        ;C - - - - - 0x0075CC 03:B5BC: C9 06
	BCS loc_03_B5C6                 ;C - - - - - 0x0075CE 03:B5BE: B0 06
	INC objStep,X                   ;C - - - - - 0x0075D0 03:B5C0: FE 00 05
	JMP loc_03_B615                 ;C - - - - - 0x0075D3 03:B5C3: 4C 15 B6
loc_03_B5C6:
	CMP #$0C                        ;C - - - - - 0x0075D6 03:B5C6: C9 0C
	BCS loc_03_B5D3                 ;C - - - - - 0x0075D8 03:B5C8: B0 09
	INC objStep,X                   ;C - - - - - 0x0075DA 03:B5CA: FE 00 05
	DEC objToggle,X                 ;C - - - - - 0x0075DD 03:B5CD: DE F0 05
	JMP loc_03_B615                 ;C - - - - - 0x0075E0 03:B5D0: 4C 15 B6
loc_03_B5D3:
	LDA #$00                        ;C - - - - - 0x0075E3 03:B5D3: A9 00
	STA objStep,X                   ;C - - - - - 0x0075E5 03:B5D5: 9D 00 05
	INC objActive,X                 ;C - - - - - 0x0075E8 03:B5D8: FE 00 03
	RTS                             ;C - - - - - 0x0075EB 03:B5DB: 60
loc_03_B5DC:
	JSR DistanceYToPlayerGround     ;C - - - - - 0x0075EC 03:B5DC: 20 D9 FB
	CMP #$08                        ;C - - - - - 0x0075EF 03:B5DF: C9 08
	BCC loc_03_B5FC                 ;C - - - - - 0x0075F1 03:B5E1: 90 19
	LDY #$00                        ;C - - - - - 0x0075F3 03:B5E3: A0 00
	JSR SetVelFromTbl_B39B          ;C - - - - - 0x0075F5 03:B5E5: 20 9B B3
	JSR DistanceYToPlayerGround     ;C - - - - - 0x0075F8 03:B5E8: 20 D9 FB
	BCS loc_03_B5F1                 ;C - - - - - 0x0075FB 03:B5EB: B0 04
	LDA #$08                        ;C - - - - - 0x0075FD 03:B5ED: A9 08
	BNE loc_03_B5F3                 ;C - - - - - 0x0075FF 03:B5EF: D0 02
loc_03_B5F1:
	LDA #$04                        ;C - - - - - 0x007601 03:B5F1: A9 04
loc_03_B5F3:
	STA objFacing,X                 ;C - - - - - 0x007603 03:B5F3: 9D 60 04
	JSR EnemyMoveProbe4Way          ;C - - - - - 0x007606 03:B5F6: 20 31 B3
	JMP SetFlag40ToPlayer_03        ;C - - - - - 0x007609 03:B5F9: 4C 90 B3
loc_03_B5FC:
	LDY #$04                        ;C - - - - - 0x00760C 03:B5FC: A0 04
	JSR SetVelFromTbl_B39B          ;C - - - - - 0x00760E 03:B5FE: 20 9B B3
	JSR DistanceXToPlayer           ;C - - - - - 0x007611 03:B601: 20 74 F3
	BCS loc_03_B60A                 ;C - - - - - 0x007614 03:B604: B0 04
	LDA #$02                        ;C - - - - - 0x007616 03:B606: A9 02
	BNE loc_03_B60C                 ;C - - - - - 0x007618 03:B608: D0 02
loc_03_B60A:
	LDA #$01                        ;C - - - - - 0x00761A 03:B60A: A9 01
loc_03_B60C:
	STA objFacing,X                 ;C - - - - - 0x00761C 03:B60C: 9D 60 04
	JSR EnemyMoveProbe4Way          ;C - - - - - 0x00761F 03:B60F: 20 31 B3
	JMP SetFlag40ToPlayer_03        ;C - - - - - 0x007622 03:B612: 4C 90 B3
loc_03_B615:
	LDA objToggle,X                 ;C - - - - - 0x007625 03:B615: BD F0 05
	BNE loc_03_B620                 ;C - - - - - 0x007628 03:B618: D0 06
	LDA #$22                        ;C - - - - - 0x00762A 03:B61A: A9 22
	LDY #$09                        ;C - - - - - 0x00762C 03:B61C: A0 09
	BNE loc_03_B624                 ;C - - - - - 0x00762E 03:B61E: D0 04
loc_03_B620:
	LDA #$25                        ;C - - - - - 0x007630 03:B620: A9 25
	LDY #$0C                        ;C - - - - - 0x007632 03:B622: A0 0C
loc_03_B624:
	JSR CheckNearPlayer             ;C - - - - - 0x007634 03:B624: 20 3E FB
	BCC loc_03_B643                 ;C - - - - - 0x007637 03:B627: 90 1A
	LDA gameAction                  ;C - - - - - 0x007639 03:B629: A5 30
	CMP #$06                        ;C - - - - - 0x00763B 03:B62B: C9 06
	BEQ loc_03_B643                 ;C - - - - - 0x00763D 03:B62D: F0 14
	LDA objToggle,X                 ;C - - - - - 0x00763F 03:B62F: BD F0 05
	BNE loc_03_B638                 ;C - - - - - 0x007642 03:B632: D0 04
	LDA #$83                        ;C - - - - - 0x007644 03:B634: A9 83
	BNE loc_03_B63A                 ;C - - - - - 0x007646 03:B636: D0 02
loc_03_B638:
	LDA #$85                        ;C - - - - - 0x007648 03:B638: A9 85
loc_03_B63A:
	STA objActive,X                 ;C - - - - - 0x00764A 03:B63A: 9D 00 03
	LDA #$00                        ;C - - - - - 0x00764D 03:B63D: A9 00
	STA objStep,X                   ;C - - - - - 0x00764F 03:B63F: 9D 00 05
	RTS                             ;C - - - - - 0x007652 03:B642: 60
loc_03_B643:
	LDA objTimer,X                  ;C - - - - - 0x007653 03:B643: BD D0 05
	BEQ loc_03_B64E                 ;C - - - - - 0x007656 03:B646: F0 06
	DEC objTimer,X                  ;C - - - - - 0x007658 03:B648: DE D0 05
	JMP loc_03_B660                 ;C - - - - - 0x00765B 03:B64B: 4C 60 B6
loc_03_B64E:
	LDA #$08                        ;C - - - - - 0x00765E 03:B64E: A9 08
	STA objTimer,X                  ;C - - - - - 0x007660 03:B650: 9D D0 05
	JSR DirToPlayerGround           ;C - - - - - 0x007663 03:B653: 20 5B FB
	TAY                             ;C - - - - - 0x007666 03:B656: A8
	JSR SetVelFromTbl_B39B          ;C - - - - - 0x007667 03:B657: 20 9B B3
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x00766A 03:B65A: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x00766D 03:B65D: 9D 60 04
loc_03_B660:
	JSR EnemyMoveProbe4Way          ;C - - - - - 0x007670 03:B660: 20 31 B3
	JMP SetFlag40ToPlayer_03        ;C - - - - - 0x007673 03:B663: 4C 90 B3
ofs_03_B666:
	LDA #$DA                        ;C - - J - - 0x007676 03:B666: A9 DA
	CMP objAnim,X                   ;C - - - - - 0x007678 03:B668: DD 80 05
	BEQ loc_03_B672                 ;C - - - - - 0x00767B 03:B66B: F0 05
	LDY #$24                        ;C - - - - - 0x00767D 03:B66D: A0 24
	JSR SetAnimXChr3                ;C - - - - - 0x00767F 03:B66F: 20 43 F4
loc_03_B672:
	LDA objStep,X                   ;C - - - - - 0x007682 03:B672: BD 00 05
	BNE loc_03_B6D0                 ;C - - - - - 0x007685 03:B675: D0 59
	LDA rngState0                   ;C - - - - - 0x007687 03:B677: A5 E4
	AND #$0F                        ;C - - - - - 0x007689 03:B679: 29 0F
	CMP #$05                        ;C - - - - - 0x00768B 03:B67B: C9 05
	BCS loc_03_B686                 ;C - - - - - 0x00768D 03:B67D: B0 07
	LDA #$03                        ;C - - - - - 0x00768F 03:B67F: A9 03
	STA objFacing,X                 ;C - - - - - 0x007691 03:B681: 9D 60 04
	BNE loc_03_B69B                 ;C - - - - - 0x007694 03:B684: D0 15
loc_03_B686:
	CMP #$0B                        ;C - - - - - 0x007696 03:B686: C9 0B
	BCS loc_03_B696                 ;C - - - - - 0x007698 03:B688: B0 0C
	LDY #$04                        ;C - - - - - 0x00769A 03:B68A: A0 04
	JSR SetVelFromTbl_B39B          ;C - - - - - 0x00769C 03:B68C: 20 9B B3
	LDA #$04                        ;C - - - - - 0x00769F 03:B68F: A9 04
	STA objFacing,X                 ;C - - - - - 0x0076A1 03:B691: 9D 60 04
	BNE loc_03_B6A0                 ;C - - - - - 0x0076A4 03:B694: D0 0A
loc_03_B696:
	LDA #$05                        ;C - - - - - 0x0076A6 03:B696: A9 05
	STA objFacing,X                 ;C - - - - - 0x0076A8 03:B698: 9D 60 04
loc_03_B69B:
	LDY #$05                        ;C - - - - - 0x0076AB 03:B69B: A0 05
	JSR SetVelFromTbl_B39B          ;C - - - - - 0x0076AD 03:B69D: 20 9B B3
loc_03_B6A0:
	JSR DistanceXToPlayer           ;C - - - - - 0x0076B0 03:B6A0: 20 74 F3
	BCC loc_03_B6AD                 ;C - - - - - 0x0076B3 03:B6A3: 90 08
	LDA objFacing,X                 ;C - - - - - 0x0076B5 03:B6A5: BD 60 04
	ADC #$07                        ;C - - - - - 0x0076B8 03:B6A8: 69 07
	STA objFacing,X                 ;C - - - - - 0x0076BA 03:B6AA: 9D 60 04
loc_03_B6AD:
	LDY objFacing,X                 ;C - - - - - 0x0076BD 03:B6AD: BC 60 04
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x0076C0 03:B6B0: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x0076C3 03:B6B3: 9D 60 04
	LDA rngState1                   ;C - - - - - 0x0076C6 03:B6B6: A5 E5
	AND #$07                        ;C - - - - - 0x0076C8 03:B6B8: 29 07
	BNE loc_03_B6C0                 ;C - - - - - 0x0076CA 03:B6BA: D0 04
	LDA #$30                        ;C - - - - - 0x0076CC 03:B6BC: A9 30
	BNE loc_03_B6C9                 ;C - - - - - 0x0076CE 03:B6BE: D0 09
loc_03_B6C0:
	LSR A                           ;C - - - - - 0x0076D0 03:B6C0: 4A
	BCS loc_03_B6C7                 ;C - - - - - 0x0076D1 03:B6C1: B0 04
	LDA #$48                        ;C - - - - - 0x0076D3 03:B6C3: A9 48
	BNE loc_03_B6C9                 ;C - - - - - 0x0076D5 03:B6C5: D0 02
loc_03_B6C7:
	LDA #$60                        ;C - - - - - 0x0076D7 03:B6C7: A9 60
loc_03_B6C9:
	STA objTimer,X                  ;C - - - - - 0x0076D9 03:B6C9: 9D D0 05
	INC objStep,X                   ;C - - - - - 0x0076DC 03:B6CC: FE 00 05
	RTS                             ;C - - - - - 0x0076DF 03:B6CF: 60
loc_03_B6D0:
	LDA objX,X                      ;C - - - - - 0x0076E0 03:B6D0: BD 60 03
	CMP #$F1                        ;C - - - - - 0x0076E3 03:B6D3: C9 F1
	BCS loc_03_B6EA                 ;C - - - - - 0x0076E5 03:B6D5: B0 13
	CMP #$17                        ;C - - - - - 0x0076E7 03:B6D7: C9 17
	BCC loc_03_B6EA                 ;C - - - - - 0x0076E9 03:B6D9: 90 0F
	DEC objTimer,X                  ;C - - - - - 0x0076EB 03:B6DB: DE D0 05
	BEQ loc_03_B6EA                 ;C - - - - - 0x0076EE 03:B6DE: F0 0A
	JSR EnemyMoveProbe4Way          ;C - - - - - 0x0076F0 03:B6E0: 20 31 B3
	JSR SetFlag40ToPlayer_03        ;C - - - - - 0x0076F3 03:B6E3: 20 90 B3
	LDA ptr_0E+1                    ;C - - - - - 0x0076F6 03:B6E6: A5 0F
	BEQ loc_03_B6F4                 ;C - - - - - 0x0076F8 03:B6E8: F0 0A
loc_03_B6EA:
	LDA #$00                        ;C - - - - - 0x0076FA 03:B6EA: A9 00
	STA objStep,X                   ;C - - - - - 0x0076FC 03:B6EC: 9D 00 05
	LDA #$86                        ;C - - - - - 0x0076FF 03:B6EF: A9 86
	STA objActive,X                 ;C - - - - - 0x007701 03:B6F1: 9D 00 03
loc_03_B6F4:
	RTS                             ;C - - - - - 0x007704 03:B6F4: 60
ofs_03_B6F5:
	LDA objStep,X                   ;C - - J - - 0x007705 03:B6F5: BD 00 05
	BEQ loc_03_B701                 ;C - - - - - 0x007708 03:B6F8: F0 07
	CMP #$01                        ;C - - - - - 0x00770A 03:B6FA: C9 01
	BEQ loc_03_B71F                 ;C - - - - - 0x00770C 03:B6FC: F0 21
	JMP loc_03_B7BD                 ;C - - - - - 0x00770E 03:B6FE: 4C BD B7
loc_03_B701:
	LDA #$00                        ;C - - - - - 0x007711 03:B701: A9 00
	STA objParamA,X                 ;C - - - - - 0x007713 03:B703: 9D 10 05
	LDA rngState0                   ;C - - - - - 0x007716 03:B706: A5 E4
	AND #$07                        ;C - - - - - 0x007718 03:B708: 29 07
	BEQ loc_03_B711                 ;C - - - - - 0x00771A 03:B70A: F0 05
	LDA #$02                        ;C - - - - - 0x00771C 03:B70C: A9 02
	STA objCounter,X                ;C - - - - - 0x00771E 03:B70E: 9D E0 05
loc_03_B711:
	INC objCounter,X                ;C - - - - - 0x007721 03:B711: FE E0 05
	LDA #$00                        ;C - - - - - 0x007724 03:B714: A9 00
	STA objTimer,X                  ;C - - - - - 0x007726 03:B716: 9D D0 05
	INC objStep,X                   ;C - - - - - 0x007729 03:B719: FE 00 05
	JMP FaceToPlayerFlag            ;C - - - - - 0x00772C 03:B71C: 4C 43 F3
loc_03_B71F:
	LDA objTimer,X                  ;C - - - - - 0x00772F 03:B71F: BD D0 05
	BEQ loc_03_B744                 ;C - - - - - 0x007732 03:B722: F0 20
	DEC objTimer,X                  ;C - - - - - 0x007734 03:B724: DE D0 05
	CMP #$01                        ;C - - - - - 0x007737 03:B727: C9 01
	BNE loc_03_B73D                 ;C - - - - - 0x007739 03:B729: D0 12
	CMP gameAction                  ;C - - - - - 0x00773B 03:B72B: C5 30
	BNE loc_03_B73D                 ;C - - - - - 0x00773D 03:B72D: D0 0E
	JSR FaceToPlayerFlag            ;c - - - - - 0x00773F 03:B72F: 20 43 F3
	LDA #$00                        ;c - - - - - 0x007742 03:B732: A9 00
	STA objStep,X                   ;c - - - - - 0x007744 03:B734: 9D 00 05
	LDA #$87                        ;c - - - - - 0x007747 03:B737: A9 87
	STA objActive,X                 ;c - - - - - 0x007749 03:B739: 9D 00 03
	RTS                             ;c - - - - - 0x00774C 03:B73C: 60
loc_03_B73D:
	LDA #$D9                        ;C - - - - - 0x00774D 03:B73D: A9 D9
	LDY #$24                        ;C - - - - - 0x00774F 03:B73F: A0 24
	JMP SetAnimXChr3                ;C - - - - - 0x007751 03:B741: 4C 43 F4
loc_03_B744:
	LDA #$DC                        ;C - - - - - 0x007754 03:B744: A9 DC
	CMP objAnim,X                   ;C - - - - - 0x007756 03:B746: DD 80 05
	BEQ loc_03_B753                 ;C - - - - - 0x007759 03:B749: F0 08
	LDY #$25                        ;C - - - - - 0x00775B 03:B74B: A0 25
	JSR SetAnimXChr3                ;C - - - - - 0x00775D 03:B74D: 20 43 F4
	INC objAnimFlags,X              ;C - - - - - 0x007760 03:B750: FE 90 05
loc_03_B753:
	LDA objAnimFrame,X              ;C - - - - - 0x007763 03:B753: BD 70 05
	BEQ loc_03_B75F                 ;C - - - - - 0x007766 03:B756: F0 07
	LDA objAnimFlags,X              ;C - - - - - 0x007768 03:B758: BD 90 05
	CMP #$07                        ;C - - - - - 0x00776B 03:B75B: C9 07
	BEQ loc_03_B789                 ;C - - - - - 0x00776D 03:B75D: F0 2A
loc_03_B75F:
	LDA objAnimFrame,X              ;C - - - - - 0x00776F 03:B75F: BD 70 05
	CMP #$01                        ;C - - - - - 0x007772 03:B762: C9 01
	BNE loc_03_B779                 ;C - - - - - 0x007774 03:B764: D0 13
	LDA #$8C                        ;C - - - - - 0x007776 03:B766: A9 8C
	STA objAtkBox,X                 ;C - - - - - 0x007778 03:B768: 9D 40 04
	LDA objParamA,X                 ;C - - - - - 0x00777B 03:B76B: BD 10 05
	BNE loc_03_B774                 ;C - - - - - 0x00777E 03:B76E: D0 04
	LDA #$07                        ;C - - - - - 0x007780 03:B770: A9 07
	BNE loc_03_B776                 ;C - - - - - 0x007782 03:B772: D0 02
loc_03_B774:
	LDA #$0F                        ;c - - - - - 0x007784 03:B774: A9 0F
loc_03_B776:
	STA objAtkDamage,X              ;C - - - - - 0x007786 03:B776: 9D 50 04
loc_03_B779:
	LDA objAtkHeavy,X               ;C - - - - - 0x007789 03:B779: BD D0 04
	BEQ loc_03_B788                 ;C - - - - - 0x00778C 03:B77C: F0 0A
	LDA #$18                        ;C - - - - - 0x00778E 03:B77E: A9 18
	JSR QueueSound                  ;C - - - - - 0x007790 03:B780: 20 4C F3
	LDA #$00                        ;C - - - - - 0x007793 03:B783: A9 00
	STA objAtkHeavy,X               ;C - - - - - 0x007795 03:B785: 9D D0 04
loc_03_B788:
	RTS                             ;C - - - - - 0x007798 03:B788: 60
loc_03_B789:
	DEC objCounter,X                ;C - - - - - 0x007799 03:B789: DE E0 05
	BNE loc_03_B797                 ;C - - - - - 0x00779C 03:B78C: D0 09
	INC objStep,X                   ;C - - - - - 0x00779E 03:B78E: FE 00 05
	LDA #$10                        ;C - - - - - 0x0077A1 03:B791: A9 10
	STA objTimer,X                  ;C - - - - - 0x0077A3 03:B793: 9D D0 05
	RTS                             ;C - - - - - 0x0077A6 03:B796: 60
loc_03_B797:
	LDA #$22                        ;C - - - - - 0x0077A7 03:B797: A9 22
	LDY #$09                        ;C - - - - - 0x0077A9 03:B799: A0 09
	JSR CheckNearPlayer             ;C - - - - - 0x0077AB 03:B79B: 20 3E FB
	BCS loc_03_B7A9                 ;C - - - - - 0x0077AE 03:B79E: B0 09
loc_03_B7A0:
	DEC objActive,X                 ;C - - - - - 0x0077B0 03:B7A0: DE 00 03
	LDA #$00                        ;C - - - - - 0x0077B3 03:B7A3: A9 00
	STA objStep,X                   ;C - - - - - 0x0077B5 03:B7A5: 9D 00 05
	RTS                             ;C - - - - - 0x0077B8 03:B7A8: 60
loc_03_B7A9:
	LDA objCounter,X                ;C - - - - - 0x0077B9 03:B7A9: BD E0 05
	CMP #$01                        ;C - - - - - 0x0077BC 03:B7AC: C9 01
	BNE loc_03_B7B5                 ;C - - - - - 0x0077BE 03:B7AE: D0 05
	LDA #$FF                        ;C - - - - - 0x0077C0 03:B7B0: A9 FF
	STA objParamA,X                 ;C - - - - - 0x0077C2 03:B7B2: 9D 10 05
loc_03_B7B5:
	LDA #$12                        ;C - - - - - 0x0077C5 03:B7B5: A9 12
	STA objTimer,X                  ;C - - - - - 0x0077C7 03:B7B7: 9D D0 05
	JMP FaceToPlayerFlag            ;C - - - - - 0x0077CA 03:B7BA: 4C 43 F3
loc_03_B7BD:
	DEC objTimer,X                  ;C - - - - - 0x0077CD 03:B7BD: DE D0 05
	BEQ loc_03_B7A0                 ;C - - - - - 0x0077D0 03:B7C0: F0 DE
	LDA #$D9                        ;C - - - - - 0x0077D2 03:B7C2: A9 D9
	LDY #$24                        ;C - - - - - 0x0077D4 03:B7C4: A0 24
	JMP SetAnimXChr3                ;C - - - - - 0x0077D6 03:B7C6: 4C 43 F4
ofs_03_B7C9:
	LDA objStep,X                   ;C - - J - - 0x0077D9 03:B7C9: BD 00 05
	CMP #$01                        ;C - - - - - 0x0077DC 03:B7CC: C9 01
	BEQ loc_03_B7F2                 ;C - - - - - 0x0077DE 03:B7CE: F0 22
	CMP #$02                        ;C - - - - - 0x0077E0 03:B7D0: C9 02
	BEQ loc_03_B802                 ;C - - - - - 0x0077E2 03:B7D2: F0 2E
	CMP #$03                        ;C - - - - - 0x0077E4 03:B7D4: C9 03
	BEQ loc_03_B827                 ;C - - - - - 0x0077E6 03:B7D6: F0 4F
	JSR FaceToPlayerFlag            ;C - - - - - 0x0077E8 03:B7D8: 20 43 F3
	LDA #$D9                        ;C - - - - - 0x0077EB 03:B7DB: A9 D9
	CMP objAnim,X                   ;C - - - - - 0x0077ED 03:B7DD: DD 80 05
	BEQ loc_03_B7EA                 ;C - - - - - 0x0077F0 03:B7E0: F0 08
	LDY #$24                        ;C - - - - - 0x0077F2 03:B7E2: A0 24
	JSR SetAnimXChr3                ;C - - - - - 0x0077F4 03:B7E4: 20 43 F4
	INC objAnimFlags,X              ;C - - - - - 0x0077F7 03:B7E7: FE 90 05
loc_03_B7EA:
	LDA objAnimFrame,X              ;C - - - - - 0x0077FA 03:B7EA: BD 70 05
	ORA objAnimFlags,X              ;C - - - - - 0x0077FD 03:B7ED: 1D 90 05
	BNE loc_03_B801                 ;C - - - - - 0x007800 03:B7F0: D0 0F
loc_03_B7F2:
	JSR EnemyChooseDirToPlayer      ;C - - - - - 0x007802 03:B7F2: 20 29 BB
	LDA #$DD                        ;C - - - - - 0x007805 03:B7F5: A9 DD
	LDY #$24                        ;C - - - - - 0x007807 03:B7F7: A0 24
	JSR SetAnimXChr3                ;C - - - - - 0x007809 03:B7F9: 20 43 F4
	LDA #$02                        ;C - - - - - 0x00780C 03:B7FC: A9 02
	STA objStep,X                   ;C - - - - - 0x00780E 03:B7FE: 9D 00 05
loc_03_B801:
	RTS                             ;C - - - - - 0x007811 03:B801: 60
loc_03_B802:
	JSR EnemyMoveProbe4Way          ;C - - - - - 0x007812 03:B802: 20 31 B3
	LDA objX,X                      ;C - - - - - 0x007815 03:B805: BD 60 03
	CMP #$F1                        ;C - - - - - 0x007818 03:B808: C9 F1
	BCS loc_03_B817                 ;C - - - - - 0x00781A 03:B80A: B0 0B
	CMP #$17                        ;C - - - - - 0x00781C 03:B80C: C9 17
	BCC loc_03_B817                 ;C - - - - - 0x00781E 03:B80E: 90 07
	JSR DistanceXToPlayer           ;C - - - - - 0x007820 03:B810: 20 74 F3
	CMP #$30                        ;C - - - - - 0x007823 03:B813: C9 30
	BCS loc_03_B826                 ;C - - - - - 0x007825 03:B815: B0 0F
loc_03_B817:
	LDA #$DE                        ;C - - - - - 0x007827 03:B817: A9 DE
	LDY #$25                        ;C - - - - - 0x007829 03:B819: A0 25
	JSR SetAnimXChr3                ;C - - - - - 0x00782B 03:B81B: 20 43 F4
	LDA #$0E                        ;C - - - - - 0x00782E 03:B81E: A9 0E
	STA objAtkDamage,X              ;C - - - - - 0x007830 03:B820: 9D 50 04
	INC objStep,X                   ;C - - - - - 0x007833 03:B823: FE 00 05
loc_03_B826:
	RTS                             ;C - - - - - 0x007836 03:B826: 60
loc_03_B827:
	LDA objVelXHi,X                 ;C - - - - - 0x007837 03:B827: BD 10 04
	BEQ loc_03_B82E                 ;C - - - - - 0x00783A 03:B82A: F0 02
	LDA #$8B                        ;C - - - - - 0x00783C 03:B82C: A9 8B
loc_03_B82E:
	STA objAtkBox,X                 ;C - - - - - 0x00783E 03:B82E: 9D 40 04
	LDA objVelXLo,X                 ;C - - - - - 0x007841 03:B831: BD 00 04
	SEC                             ;C - - - - - 0x007844 03:B834: 38
	SBC objParamA,X                 ;C - - - - - 0x007845 03:B835: FD 10 05
	STA objVelXLo,X                 ;C - - - - - 0x007848 03:B838: 9D 00 04
	LDA objVelXHi,X                 ;C - - - - - 0x00784B 03:B83B: BD 10 04
	SBC #$00                        ;C - - - - - 0x00784E 03:B83E: E9 00
	STA objVelXHi,X                 ;C - - - - - 0x007850 03:B840: 9D 10 04
	LDA objVelYLo,X                 ;C - - - - - 0x007853 03:B843: BD 20 04
	SEC                             ;C - - - - - 0x007856 03:B846: 38
	SBC objParamB,X                 ;C - - - - - 0x007857 03:B847: FD 20 05
	STA objVelYLo,X                 ;C - - - - - 0x00785A 03:B84A: 9D 20 04
	LDA objVelYHi,X                 ;C - - - - - 0x00785D 03:B84D: BD 30 04
	SBC #$00                        ;C - - - - - 0x007860 03:B850: E9 00
	STA objVelYHi,X                 ;C - - - - - 0x007862 03:B852: 9D 30 04
	LDA objVelXHi,X                 ;C - - - - - 0x007865 03:B855: BD 10 04
	BMI loc_03_B863                 ;C - - - - - 0x007868 03:B858: 30 09
	LDA objVelYHi,X                 ;C - - - - - 0x00786A 03:B85A: BD 30 04
	BMI loc_03_B863                 ;C - - - - - 0x00786D 03:B85D: 30 04
	JSR EnemyMoveProbe4Way          ;C - - - - - 0x00786F 03:B85F: 20 31 B3
	RTS                             ;C - - - - - 0x007872 03:B862: 60
loc_03_B863:
	LDA #$81                        ;C - - - - - 0x007873 03:B863: A9 81
	STA objActive,X                 ;C - - - - - 0x007875 03:B865: 9D 00 03
	LDA #$00                        ;C - - - - - 0x007878 03:B868: A9 00
	STA objStep,X                   ;C - - - - - 0x00787A 03:B86A: 9D 00 05
	STA objParamA,X                 ;C - - - - - 0x00787D 03:B86D: 9D 10 05
	STA objParamB,X                 ;C - - - - - 0x007880 03:B870: 9D 20 05
	LDA #$04                        ;C - - - - - 0x007883 03:B873: A9 04
	STA objVariant,X                ;C - - - - - 0x007885 03:B875: 9D C0 05
	RTS                             ;C - - - - - 0x007888 03:B878: 60
ofs_03_B879:
	LDA objStep,X                   ;C - - J - - 0x007889 03:B879: BD 00 05
	BEQ loc_03_B881                 ;C - - - - - 0x00788C 03:B87C: F0 03
	JMP loc_03_B925                 ;C - - - - - 0x00788E 03:B87E: 4C 25 B9
loc_03_B881:
	JSR FaceToPlayerFlag            ;C - - - - - 0x007891 03:B881: 20 43 F3
	LDA objVariant,X                ;C - - - - - 0x007894 03:B884: BD C0 05
	BNE loc_03_B8BA                 ;C - - - - - 0x007897 03:B887: D0 31
	LDA playerBusy                  ;C - - - - - 0x007899 03:B889: A5 6E
	BMI loc_03_B8BA                 ;C - - - - - 0x00789B 03:B88B: 30 2D
	LDA gameAction                  ;C - - - - - 0x00789D 03:B88D: A5 30
	CMP #$0B                        ;C - - - - - 0x00789F 03:B88F: C9 0B
	BEQ loc_03_B8BA                 ;C - - - - - 0x0078A1 03:B891: F0 27
	CMP #$25                        ;C - - - - - 0x0078A3 03:B893: C9 25
	BEQ loc_03_B8BA                 ;C - - - - - 0x0078A5 03:B895: F0 23
	CMP #$16                        ;C - - - - - 0x0078A7 03:B897: C9 16
	BEQ loc_03_B8BA                 ;C - - - - - 0x0078A9 03:B899: F0 1F
	CMP #$17                        ;C - - - - - 0x0078AB 03:B89B: C9 17
	BEQ loc_03_B8BA                 ;C - - - - - 0x0078AD 03:B89D: F0 1B
	CMP #$1F                        ;C - - - - - 0x0078AF 03:B89F: C9 1F
	BEQ loc_03_B8BA                 ;C - - - - - 0x0078B1 03:B8A1: F0 17
	LDA objFlags,X                  ;C - - - - - 0x0078B3 03:B8A3: BD 60 05
	AND #$40                        ;C - - - - - 0x0078B6 03:B8A6: 29 40
	BEQ loc_03_B8B3                 ;C - - - - - 0x0078B8 03:B8A8: F0 09
	LDA objX,X                      ;C - - - - - 0x0078BA 03:B8AA: BD 60 03
	CMP #$ED                        ;C - - - - - 0x0078BD 03:B8AD: C9 ED
	BCS loc_03_B8BA                 ;C - - - - - 0x0078BF 03:B8AF: B0 09
	BCC loc_03_B8C5                 ;C - - - - - 0x0078C1 03:B8B1: 90 12
loc_03_B8B3:
	LDA objX,X                      ;C - - - - - 0x0078C3 03:B8B3: BD 60 03
	CMP #$13                        ;C - - - - - 0x0078C6 03:B8B6: C9 13
	BCS loc_03_B8C5                 ;C - - - - - 0x0078C8 03:B8B8: B0 0B
loc_03_B8BA:
	LDA #$82                        ;C - - - - - 0x0078CA 03:B8BA: A9 82
	STA objActive,X                 ;C - - - - - 0x0078CC 03:B8BC: 9D 00 03
	LDA #$00                        ;C - - - - - 0x0078CF 03:B8BF: A9 00
	STA objStep,X                   ;C - - - - - 0x0078D1 03:B8C1: 9D 00 05
	RTS                             ;C - - - - - 0x0078D4 03:B8C4: 60
loc_03_B8C5:
	LDA objY                        ;C - - - - - 0x0078D5 03:B8C5: AD C0 03
	CMP playerGroundY               ;C - - - - - 0x0078D8 03:B8C8: C5 36
	BEQ loc_03_B8E1                 ;C - - - - - 0x0078DA 03:B8CA: F0 15
	LDA gameAction                  ;C - - - - - 0x0078DC 03:B8CC: A5 30
	CMP #$01                        ;C - - - - - 0x0078DE 03:B8CE: C9 01
	BEQ loc_03_B8D6                 ;C - - - - - 0x0078E0 03:B8D0: F0 04
	LDA #$83                        ;C - - - - - 0x0078E2 03:B8D2: A9 83
	BNE loc_03_B8D8                 ;C - - - - - 0x0078E4 03:B8D4: D0 02
loc_03_B8D6:
	LDA #$87                        ;C - - - - - 0x0078E6 03:B8D6: A9 87
loc_03_B8D8:
	STA objActive,X                 ;C - - - - - 0x0078E8 03:B8D8: 9D 00 03
	LDA #$00                        ;C - - - - - 0x0078EB 03:B8DB: A9 00
	STA objStep,X                   ;C - - - - - 0x0078ED 03:B8DD: 9D 00 05
	RTS                             ;C - - - - - 0x0078F0 03:B8E0: 60
loc_03_B8E1:
	LDA #$00                        ;C - - - - - 0x0078F1 03:B8E1: A9 00
	STA objActive+1                 ;C - - - - - 0x0078F3 03:B8E3: 8D 01 03
	STA objActive+2                 ;C - - - - - 0x0078F6 03:B8E6: 8D 02 03
	LDA #$FF                        ;C - - - - - 0x0078F9 03:B8E9: A9 FF
	STA objDownState,X              ;C - - - - - 0x0078FB 03:B8EB: 9D C0 04
	LDA objY,X                      ;C - - - - - 0x0078FE 03:B8EE: BD C0 03
	STA objParamA,X                 ;C - - - - - 0x007901 03:B8F1: 9D 10 05
	LDA objFacing,X                 ;C - - - - - 0x007904 03:B8F4: BD 60 04
	LSR A                           ;C - - - - - 0x007907 03:B8F7: 4A
	BCS loc_03_B8FE                 ;C - - - - - 0x007908 03:B8F8: B0 04
	LDA #$01                        ;C - - - - - 0x00790A 03:B8FA: A9 01
	BNE loc_03_B900                 ;C - - - - - 0x00790C 03:B8FC: D0 02
loc_03_B8FE:
	LDA #$02                        ;C - - - - - 0x00790E 03:B8FE: A9 02
loc_03_B900:
	STA playerFacing                ;C - - - - - 0x007910 03:B900: 85 31
	LDA objFlags,X                  ;C - - - - - 0x007912 03:B902: BD 60 05
	AND #$40                        ;C - - - - - 0x007915 03:B905: 29 40
	BEQ loc_03_B90F                 ;C - - - - - 0x007917 03:B907: F0 06
	JSR ClearPlayerFlag40           ;C - - - - - 0x007919 03:B909: 20 48 F0
	JMP loc_03_B912                 ;C - - - - - 0x00791C 03:B90C: 4C 12 B9
loc_03_B90F:
	JSR SetPlayerFlag40             ;C - - - - - 0x00791F 03:B90F: 20 3F F0
loc_03_B912:
	LDA #$0A                        ;C - - - - - 0x007922 03:B912: A9 0A
	STA gameAction                  ;C - - - - - 0x007924 03:B914: 85 30
	LDA #$03                        ;C - - - - - 0x007926 03:B916: A9 03
	STA objCounter,X                ;C - - - - - 0x007928 03:B918: 9D E0 05
	INC objStep,X                   ;C - - - - - 0x00792B 03:B91B: FE 00 05
	LDA #$91                        ;C - - - - - 0x00792E 03:B91E: A9 91
	LDY #$3E                        ;C - - - - - 0x007930 03:B920: A0 3E
	JMP SetAnimXChr3                ;C - - - - - 0x007932 03:B922: 4C 43 F4
loc_03_B925:
	LDA objStep,X                   ;C - - - - - 0x007935 03:B925: BD 00 05
	CMP #$01                        ;C - - - - - 0x007938 03:B928: C9 01
	BEQ loc_03_B93A                 ;C - - - - - 0x00793A 03:B92A: F0 0E
	LDY playerId                    ;C - - - - - 0x00793C 03:B92C: A4 34
	LDA SetVelFromTbl_B39BTbl_E207,Y;C - - - - - 0x00793E 03:B92E: B9 07 E2
	JSR SetPlayerAnim               ;C - - - - - 0x007941 03:B931: 20 94 F2
	LDA SetVelFromTbl_B39BTbl_E24F,Y;C - - - - - 0x007944 03:B934: B9 4F E2
	JSR SetChrBank2                 ;C - - - - - 0x007947 03:B937: 20 40 F4
loc_03_B93A:
	LDA objAnimFrame,X              ;C - - - - - 0x00794A 03:B93A: BD 70 05
	CMP #$03                        ;C - - - - - 0x00794D 03:B93D: C9 03
	BNE loc_03_B977                 ;C - - - - - 0x00794F 03:B93F: D0 36
	INC objStep,X                   ;C - - - - - 0x007951 03:B941: FE 00 05
	LDA objAnimFlags,X              ;C - - - - - 0x007954 03:B944: BD 90 05
	BNE loc_03_B977                 ;C - - - - - 0x007957 03:B947: D0 2E
	LDA #$1F                        ;C - - - - - 0x007959 03:B949: A9 1F
	JSR QueueSound                  ;C - - - - - 0x00795B 03:B94B: 20 4C F3
	DEC objCounter,X                ;C - - - - - 0x00795E 03:B94E: DE E0 05
	BEQ loc_03_B962                 ;C - - - - - 0x007961 03:B951: F0 0F
	LDA #$07                        ;C - - - - - 0x007963 03:B953: A9 07
	STA objAtkDamage,X              ;C - - - - - 0x007965 03:B955: 9D 50 04
	LDA #$3C                        ;C - - - - - 0x007968 03:B958: A9 3C
	STA playerInvincible            ;C - - - - - 0x00796A 03:B95A: 85 3B
	JSR UpdatePlayerInvincible      ;C - - - - - 0x00796C 03:B95C: 20 D5 F8
	JMP loc_03_B977                 ;C - - - - - 0x00796F 03:B95F: 4C 77 B9
loc_03_B962:
	LDA #$0F                        ;C - - - - - 0x007972 03:B962: A9 0F
	STA objAtkDamage,X              ;C - - - - - 0x007974 03:B964: 9D 50 04
	LDA #$3C                        ;C - - - - - 0x007977 03:B967: A9 3C
	STA playerInvincible            ;C - - - - - 0x007979 03:B969: 85 3B
	JSR UpdatePlayerInvincible      ;C - - - - - 0x00797B 03:B96B: 20 D5 F8
	LDA #$80                        ;C - - - - - 0x00797E 03:B96E: A9 80
	STA objActive                   ;C - - - - - 0x007980 03:B970: 8D 00 03
	LDA #$06                        ;C - - - - - 0x007983 03:B973: A9 06
	STA gameAction                  ;C - - - - - 0x007985 03:B975: 85 30
loc_03_B977:
	LDA gameAction                  ;C - - - - - 0x007987 03:B977: A5 30
	CMP #$06                        ;C - - - - - 0x007989 03:B979: C9 06
	BNE loc_03_B9AC                 ;C - - - - - 0x00798B 03:B97B: D0 2F
	LDA objParamA,X                 ;C - - - - - 0x00798D 03:B97D: BD 10 05
	STA playerGroundY               ;C - - - - - 0x007990 03:B980: 85 36
	LDY playerId                    ;C - - - - - 0x007992 03:B982: A4 34
	LDA tbl_0F_E20A,Y               ;C - - - - - 0x007994 03:B984: B9 0A E2
	JSR SetPlayerAnim               ;C - - - - - 0x007997 03:B987: 20 94 F2
	LDA tbl_0F_E252,Y               ;C - - - - - 0x00799A 03:B98A: B9 52 E2
	JSR SetChrBank2                 ;C - - - - - 0x00799D 03:B98D: 20 40 F4
	LDA objAnimFrame,X              ;C - - - - - 0x0079A0 03:B990: BD 70 05
	CMP #$04                        ;C - - - - - 0x0079A3 03:B993: C9 04
	BNE loc_03_B9AB                 ;C - - - - - 0x0079A5 03:B995: D0 14
	LDA objAnimFlags,X              ;C - - - - - 0x0079A7 03:B997: BD 90 05
	CMP #$05                        ;C - - - - - 0x0079AA 03:B99A: C9 05
	BNE loc_03_B9AB                 ;C - - - - - 0x0079AC 03:B99C: D0 0D
	LDA #$81                        ;C - - - - - 0x0079AE 03:B99E: A9 81
	STA objActive,X                 ;C - - - - - 0x0079B0 03:B9A0: 9D 00 03
	LDA #$00                        ;C - - - - - 0x0079B3 03:B9A3: A9 00
	STA objStep,X                   ;C - - - - - 0x0079B5 03:B9A5: 9D 00 05
	STA objDownState,X              ;C - - - - - 0x0079B8 03:B9A8: 9D C0 04
loc_03_B9AB:
	RTS                             ;C - - - - - 0x0079BB 03:B9AB: 60
loc_03_B9AC:
	LDA objStep,X                   ;C - - - - - 0x0079BC 03:B9AC: BD 00 05
	CMP #$01                        ;C - - - - - 0x0079BF 03:B9AF: C9 01
	BEQ loc_03_B9CB                 ;C - - - - - 0x0079C1 03:B9B1: F0 18
	LDA objAnimFrame,X              ;C - - - - - 0x0079C3 03:B9B3: BD 70 05
	CMP #$04                        ;C - - - - - 0x0079C6 03:B9B6: C9 04
	BNE loc_03_B9CB                 ;C - - - - - 0x0079C8 03:B9B8: D0 11
	LDA objAnimFlags,X              ;C - - - - - 0x0079CA 03:B9BA: BD 90 05
	CMP #$05                        ;C - - - - - 0x0079CD 03:B9BD: C9 05
	BNE loc_03_B9CB                 ;C - - - - - 0x0079CF 03:B9BF: D0 0A
	LDA #$01                        ;C - - - - - 0x0079D1 03:B9C1: A9 01
	STA objAnimFrame,X              ;C - - - - - 0x0079D3 03:B9C3: 9D 70 05
	LDA #$00                        ;C - - - - - 0x0079D6 03:B9C6: A9 00
	STA objAnimFlags,X              ;C - - - - - 0x0079D8 03:B9C8: 9D 90 05
loc_03_B9CB:
	LDA objAnimFrame,X              ;C - - - - - 0x0079DB 03:B9CB: BD 70 05
	CLC                             ;C - - - - - 0x0079DE 03:B9CE: 18
	ADC #$01                        ;C - - - - - 0x0079DF 03:B9CF: 69 01
	LSR A                           ;C - - - - - 0x0079E1 03:B9D1: 4A
	TAY                             ;C - - - - - 0x0079E2 03:B9D2: A8
	LDA objFlags,X                  ;C - - - - - 0x0079E3 03:B9D3: BD 60 05
	AND #$40                        ;C - - - - - 0x0079E6 03:B9D6: 29 40
	BEQ loc_03_B9EF                 ;C - - - - - 0x0079E8 03:B9D8: F0 15
	LDA objX,X                      ;C - - - - - 0x0079EA 03:B9DA: BD 60 03
	CLC                             ;C - - - - - 0x0079ED 03:B9DD: 18
	ADC SetVelFromTbl_B39BTbl_BA16,Y;C - - - - - 0x0079EE 03:B9DE: 79 16 BA
	STA objX                        ;C - - - - - 0x0079F1 03:B9E1: 8D 60 03
	LDA objXPage,X                  ;C - - - - - 0x0079F4 03:B9E4: BD 80 03
	ADC #$00                        ;C - - - - - 0x0079F7 03:B9E7: 69 00
	STA objXPage                    ;C - - - - - 0x0079F9 03:B9E9: 8D 80 03
	JMP loc_03_BA01                 ;C - - - - - 0x0079FC 03:B9EC: 4C 01 BA
loc_03_B9EF:
	LDA objX,X                      ;C - - - - - 0x0079FF 03:B9EF: BD 60 03
	SEC                             ;C - - - - - 0x007A02 03:B9F2: 38
	SBC SetVelFromTbl_B39BTbl_BA16,Y;C - - - - - 0x007A03 03:B9F3: F9 16 BA
	STA objX                        ;C - - - - - 0x007A06 03:B9F6: 8D 60 03
	LDA objXPage,X                  ;C - - - - - 0x007A09 03:B9F9: BD 80 03
	SBC #$00                        ;C - - - - - 0x007A0C 03:B9FC: E9 00
	STA objXPage                    ;C - - - - - 0x007A0E 03:B9FE: 8D 80 03
loc_03_BA01:
	LDA objY,X                      ;C - - - - - 0x007A11 03:BA01: BD C0 03
	SEC                             ;C - - - - - 0x007A14 03:BA04: 38
	SBC SetVelFromTbl_B39BTbl_BA19,Y;C - - - - - 0x007A15 03:BA05: F9 19 BA
	STA objY                        ;C - - - - - 0x007A18 03:BA08: 8D C0 03
	LDA #$00                        ;C - - - - - 0x007A1B 03:BA0B: A9 00
	STA timerA4                     ;C - - - - - 0x007A1D 03:BA0D: 85 A4
	STA timerA3                     ;C - - - - - 0x007A1F 03:BA0F: 85 A3
	LDA #$0A                        ;C - - - - - 0x007A21 03:BA11: A9 0A
	STA gameAction                  ;C - - - - - 0x007A23 03:BA13: 85 30
	RTS                             ;C - - - - - 0x007A25 03:BA15: 60
SetVelFromTbl_B39BTbl_BA16:
	.byte $12,$07,$0A               ;- D 1 - - - 0x007A26 03:BA16:
SetVelFromTbl_B39BTbl_BA19:
	.byte $0C,$12,$17               ;- D 1 - - - 0x007A29 03:BA19:
ofs_03_BA1C:
	JSR DistanceXToPlayer           ;C - - J - - 0x007A2C 03:BA1C: 20 74 F3
	CMP #$30                        ;C - - - - - 0x007A2F 03:BA1F: C9 30
	BCS loc_03_BA27                 ;C - - - - - 0x007A31 03:BA21: B0 04
	LDA #$04                        ;C - - - - - 0x007A33 03:BA23: A9 04
	BNE loc_03_BA39                 ;C - - - - - 0x007A35 03:BA25: D0 12
loc_03_BA27:
	CMP #$48                        ;C - - - - - 0x007A37 03:BA27: C9 48
	BCS loc_03_BA2F                 ;C - - - - - 0x007A39 03:BA29: B0 04
	LDA #$08                        ;C - - - - - 0x007A3B 03:BA2B: A9 08
	BNE loc_03_BA39                 ;C - - - - - 0x007A3D 03:BA2D: D0 0A
loc_03_BA2F:
	CMP #$60                        ;C - - - - - 0x007A3F 03:BA2F: C9 60
	BCS loc_03_BA37                 ;C - - - - - 0x007A41 03:BA31: B0 04
	LDA #$0A                        ;C - - - - - 0x007A43 03:BA33: A9 0A
	BNE loc_03_BA39                 ;C - - - - - 0x007A45 03:BA35: D0 02
loc_03_BA37:
	LDA #$0E                        ;C - - - - - 0x007A47 03:BA37: A9 0E
loc_03_BA39:
	STA ptr_00                      ;C - - - - - 0x007A49 03:BA39: 85 00
	LDA rngState0                   ;C - - - - - 0x007A4B 03:BA3B: A5 E4
	AND #$0F                        ;C - - - - - 0x007A4D 03:BA3D: 29 0F
	CMP ptr_00                      ;C - - - - - 0x007A4F 03:BA3F: C5 00
	BCS loc_03_BA4D                 ;C - - - - - 0x007A51 03:BA41: B0 0A
	LDA gameAction                  ;C - - - - - 0x007A53 03:BA43: A5 30
	CMP #$06                        ;C - - - - - 0x007A55 03:BA45: C9 06
	BEQ loc_03_BA4D                 ;C - - - - - 0x007A57 03:BA47: F0 04
	LDA #$84                        ;C - - - - - 0x007A59 03:BA49: A9 84
	BNE loc_03_BA4F                 ;C - - - - - 0x007A5B 03:BA4B: D0 02
loc_03_BA4D:
	LDA #$81                        ;C - - - - - 0x007A5D 03:BA4D: A9 81
loc_03_BA4F:
	STA objActive,X                 ;C - - - - - 0x007A5F 03:BA4F: 9D 00 03
	RTS                             ;C - - - - - 0x007A62 03:BA52: 60
loc_03_BA53:
	LDA #$DA                        ;C - - - - - 0x007A63 03:BA53: A9 DA
	CMP objAnim,X                   ;C - - - - - 0x007A65 03:BA55: DD 80 05
	BEQ loc_03_BA5F                 ;C - - - - - 0x007A68 03:BA58: F0 05
	LDY #$24                        ;C - - - - - 0x007A6A 03:BA5A: A0 24
	JSR SetAnimXChr3                ;C - - - - - 0x007A6C 03:BA5C: 20 43 F4
loc_03_BA5F:
	LDA #$08                        ;C - - - - - 0x007A6F 03:BA5F: A9 08
	STA objDownState,X              ;C - - - - - 0x007A71 03:BA61: 9D C0 04
	LDA #$81                        ;C - - - - - 0x007A74 03:BA64: A9 81
	STA objActive,X                 ;C - - - - - 0x007A76 03:BA66: 9D 00 03
	LDA #$00                        ;C - - - - - 0x007A79 03:BA69: A9 00
	STA objStep,X                   ;C - - - - - 0x007A7B 03:BA6B: 9D 00 05
	JSR SetFlag40ToPlayer_03        ;C - - - - - 0x007A7E 03:BA6E: 20 90 B3
	LDY #$04                        ;C - - - - - 0x007A81 03:BA71: A0 04
	JSR SetVelFromTbl_B39B          ;C - - - - - 0x007A83 03:BA73: 20 9B B3
	LDA objXPage,X                  ;C - - - - - 0x007A86 03:BA76: BD 80 03
	CMP #$FF                        ;C - - - - - 0x007A89 03:BA79: C9 FF
	BEQ loc_03_BA85                 ;C - - - - - 0x007A8B 03:BA7B: F0 08
	JSR DistanceXToPlayer           ;C - - - - - 0x007A8D 03:BA7D: 20 74 F3
	BCS loc_03_BA85                 ;C - - - - - 0x007A90 03:BA80: B0 03
	JMP ApplyVelXSub                ;C - - - - - 0x007A92 03:BA82: 4C A1 F1
loc_03_BA85:
	JMP ApplyVelXAdd                ;C - - - - - 0x007A95 03:BA85: 4C 83 F1
ofs_03_BA88:
	LDA #$A3                        ;C - - J - - 0x007A98 03:BA88: A9 A3
	CMP objAnim,X                   ;C - - - - - 0x007A9A 03:BA8A: DD 80 05
	BEQ loc_03_BA99                 ;C - - - - - 0x007A9D 03:BA8D: F0 0A
	LDY #$30                        ;C - - - - - 0x007A9F 03:BA8F: A0 30
	JSR SetAnimXChr3                ;C - - - - - 0x007AA1 03:BA91: 20 43 F4
	LDA #$26                        ;C - - - - - 0x007AA4 03:BA94: A9 26
	STA objAtkDamage,X              ;C - - - - - 0x007AA6 03:BA96: 9D 50 04
loc_03_BA99:
	LDA objAnimFrame,X              ;C - - - - - 0x007AA9 03:BA99: BD 70 05
	CMP #$05                        ;C - - - - - 0x007AAC 03:BA9C: C9 05
	BCS loc_03_BAAA                 ;C - - - - - 0x007AAE 03:BA9E: B0 0A
	LDA objDownState,X              ;C - - - - - 0x007AB0 03:BAA0: BD C0 04
	BNE loc_03_BAAA                 ;C - - - - - 0x007AB3 03:BAA3: D0 05
	LDA #$01                        ;C - - - - - 0x007AB5 03:BAA5: A9 01
	STA objDownState,X              ;C - - - - - 0x007AB7 03:BAA7: 9D C0 04
loc_03_BAAA:
	LDA objAnimFrame,X              ;C - - - - - 0x007ABA 03:BAAA: BD 70 05
	CMP #$02                        ;C - - - - - 0x007ABD 03:BAAD: C9 02
	BCS loc_03_BAB5                 ;C - - - - - 0x007ABF 03:BAAF: B0 04
	LDA #$96                        ;C - - - - - 0x007AC1 03:BAB1: A9 96
	BNE loc_03_BAB7                 ;C - - - - - 0x007AC3 03:BAB3: D0 02
loc_03_BAB5:
	LDA #$97                        ;C - - - - - 0x007AC5 03:BAB5: A9 97
loc_03_BAB7:
	STA objAtkBox,X                 ;C - - - - - 0x007AC7 03:BAB7: 9D 40 04
	LDA objAnimFrame,X              ;C - - - - - 0x007ACA 03:BABA: BD 70 05
	CMP #$09                        ;C - - - - - 0x007ACD 03:BABD: C9 09
	BCS loc_03_BAC2                 ;C - - - - - 0x007ACF 03:BABF: B0 01
	RTS                             ;C - - - - - 0x007AD1 03:BAC1: 60
loc_03_BAC2:
	LDA #$00                        ;C - - - - - 0x007AD2 03:BAC2: A9 00
	STA objStep,X                   ;C - - - - - 0x007AD4 03:BAC4: 9D 00 05
	STA objAtkBox,X                 ;C - - - - - 0x007AD7 03:BAC7: 9D 40 04
	LDA #$81                        ;C - - - - - 0x007ADA 03:BACA: A9 81
	STA objActive,X                 ;C - - - - - 0x007ADC 03:BACC: 9D 00 03
	RTS                             ;C - - - - - 0x007ADF 03:BACF: 60
SetVelFromTbl_BAD0:
	LDA SetVelFromTbl_BAD0Tbl_BAF9,Y;C - - - - - 0x007AE0 03:BAD0: B9 F9 BA
	STA objVelXLo,X                 ;C - - - - - 0x007AE3 03:BAD3: 9D 00 04
	LDA SetVelFromTbl_BAD0Tbl_BAE9,Y;C - - - - - 0x007AE6 03:BAD6: B9 E9 BA
	STA objVelXHi,X                 ;C - - - - - 0x007AE9 03:BAD9: 9D 10 04
	LDA SetVelFromTbl_BAD0Tbl_BB19,Y;C - - - - - 0x007AEC 03:BADC: B9 19 BB
	STA objVelYLo,X                 ;C - - - - - 0x007AEF 03:BADF: 9D 20 04
	LDA SetVelFromTbl_BAD0Tbl_BB09,Y;C - - - - - 0x007AF2 03:BAE2: B9 09 BB
	STA objVelYHi,X                 ;C - - - - - 0x007AF5 03:BAE5: 9D 30 04
	RTS                             ;C - - - - - 0x007AF8 03:BAE8: 60
SetVelFromTbl_BAD0Tbl_BAE9:
	.byte $00,$00,$01,$02           ;- - - - - - 0x007AF9 03:BAE9:
	.byte $02,$02,$01               ;- D 1 - - - 0x007AFD 03:BAED:
	.byte $00,$00,$00               ;- - - - - - 0x007B00 03:BAF0:
	.byte $01                       ;- D 1 - - - 0x007B03 03:BAF3:
	.byte $02                       ;- - - - - - 0x007B04 03:BAF4:
	.byte $02                       ;- D 1 - - - 0x007B05 03:BAF5:
	.byte $02                       ;- - - - - - 0x007B06 03:BAF6:
	.byte $01                       ;- D 1 - - - 0x007B07 03:BAF7:
	.byte $00                       ;- - - - - - 0x007B08 03:BAF8:
SetVelFromTbl_BAD0Tbl_BAF9:
	.byte $00,$E1,$A0,$1F           ;- - - - - - 0x007B09 03:BAF9:
	.byte $4C,$1F,$A0               ;- D 1 - - - 0x007B0D 03:BAFD:
	.byte $E1,$00,$E1               ;- - - - - - 0x007B10 03:BB00:
	.byte $A0                       ;- D 1 - - - 0x007B13 03:BB03:
	.byte $1F                       ;- - - - - - 0x007B14 03:BB04:
	.byte $4C                       ;- D 1 - - - 0x007B15 03:BB05:
	.byte $1F                       ;- - - - - - 0x007B16 03:BB06:
	.byte $A0                       ;- D 1 - - - 0x007B17 03:BB07:
	.byte $E1                       ;- - - - - - 0x007B18 03:BB08:
SetVelFromTbl_BAD0Tbl_BB09:
	.byte $02,$02,$01,$00           ;- - - - - - 0x007B19 03:BB09:
	.byte $00,$00,$01               ;- D 1 - - - 0x007B1D 03:BB0D:
	.byte $02,$02,$02               ;- - - - - - 0x007B20 03:BB10:
	.byte $01                       ;- D 1 - - - 0x007B23 03:BB13:
	.byte $00                       ;- - - - - - 0x007B24 03:BB14:
	.byte $00                       ;- D 1 - - - 0x007B25 03:BB15:
	.byte $00                       ;- - - - - - 0x007B26 03:BB16:
	.byte $01                       ;- D 1 - - - 0x007B27 03:BB17:
	.byte $02                       ;- - - - - - 0x007B28 03:BB18:
SetVelFromTbl_BAD0Tbl_BB19:
	.byte $4C,$1F,$A0,$E1           ;- - - - - - 0x007B29 03:BB19:
	.byte $00,$E1,$A0               ;- D 1 - - - 0x007B2D 03:BB1D:
	.byte $1F,$4C,$1F               ;- - - - - - 0x007B30 03:BB20:
	.byte $A0                       ;- D 1 - - - 0x007B33 03:BB23:
	.byte $E1                       ;- - - - - - 0x007B34 03:BB24:
	.byte $00                       ;- D 1 - - - 0x007B35 03:BB25:
	.byte $E1                       ;- - - - - - 0x007B36 03:BB26:
	.byte $A0                       ;- D 1 - - - 0x007B37 03:BB27:
	.byte $1F                       ;- - - - - - 0x007B38 03:BB28:
EnemyChooseDirToPlayer:
	JSR DirToPlayerGround           ;C - - - - - 0x007B39 03:BB29: 20 5B FB
	TAY                             ;C - - - - - 0x007B3C 03:BB2C: A8
	AND #$07                        ;C - - - - - 0x007B3D 03:BB2D: 29 07
	BNE loc_03_BB49                 ;C - - - - - 0x007B3F 03:BB2F: D0 18
	TYA                             ;c - - - - - 0x007B41 03:BB31: 98
	BNE loc_03_BB38                 ;c - - - - - 0x007B42 03:BB32: D0 04
	INY                             ;c - - - - - 0x007B44 03:BB34: C8
	INY                             ;c - - - - - 0x007B45 03:BB35: C8
	BNE loc_03_BB3A                 ;c - - - - - 0x007B46 03:BB36: D0 02
loc_03_BB38:
	DEY                             ;c - - - - - 0x007B48 03:BB38: 88
	DEY                             ;c - - - - - 0x007B49 03:BB39: 88
loc_03_BB3A:
	JSR DistanceXToPlayer           ;c - - - - - 0x007B4A 03:BB3A: 20 74 F3
	BCS loc_03_BB4D                 ;c - - - - - 0x007B4D 03:BB3D: B0 0E
	TYA                             ;c - - - - - 0x007B4F 03:BB3F: 98
	EOR #$FF                        ;c - - - - - 0x007B50 03:BB40: 49 FF
	ADC #$01                        ;c - - - - - 0x007B52 03:BB42: 69 01
	AND #$0F                        ;c - - - - - 0x007B54 03:BB44: 29 0F
	TAY                             ;c - - - - - 0x007B56 03:BB46: A8
	BNE loc_03_BB4D                 ;c - - - - - 0x007B57 03:BB47: D0 04
loc_03_BB49:
	LDA EnemyChooseDirToPlayerTbl_BB81,Y;C - - - - - 0x007B59 03:BB49: B9 81 BB
	TAY                             ;C - - - - - 0x007B5C 03:BB4C: A8
loc_03_BB4D:
	LDA tbl_0F_FBF0,Y               ;C - - - - - 0x007B5D 03:BB4D: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x007B60 03:BB50: 9D 60 04
	JSR SetVelFromTbl_BAD0          ;C - - - - - 0x007B63 03:BB53: 20 D0 BA
	TYA                             ;C - - - - - 0x007B66 03:BB56: 98
	AND #$01                        ;C - - - - - 0x007B67 03:BB57: 29 01
	BEQ loc_03_BB67                 ;C - - - - - 0x007B69 03:BB59: F0 0C
	LDA #$12                        ;C - - - - - 0x007B6B 03:BB5B: A9 12
	STA objParamA,X                 ;C - - - - - 0x007B6D 03:BB5D: 9D 10 05
	LDA #$07                        ;C - - - - - 0x007B70 03:BB60: A9 07
	STA objParamB,X                 ;C - - - - - 0x007B72 03:BB62: 9D 20 05
	BNE loc_03_BB80                 ;C - - - - - 0x007B75 03:BB65: D0 19
loc_03_BB67:
	TYA                             ;C - - - - - 0x007B77 03:BB67: 98
	LSR A                           ;C - - - - - 0x007B78 03:BB68: 4A
	LSR A                           ;C - - - - - 0x007B79 03:BB69: 4A
	BCC loc_03_BB76                 ;C - - - - - 0x007B7A 03:BB6A: 90 0A
	LDA #$0E                        ;C - - - - - 0x007B7C 03:BB6C: A9 0E
	STA objParamA,X                 ;C - - - - - 0x007B7E 03:BB6E: 9D 10 05
	STA objParamB,X                 ;C - - - - - 0x007B81 03:BB71: 9D 20 05
	BNE loc_03_BB80                 ;C - - - - - 0x007B84 03:BB74: D0 0A
loc_03_BB76:
	LDA #$14                        ;C - - - - - 0x007B86 03:BB76: A9 14
	STA objParamA,X                 ;C - - - - - 0x007B88 03:BB78: 9D 10 05
	LDA #$00                        ;C - - - - - 0x007B8B 03:BB7B: A9 00
	STA objParamB,X                 ;C - - - - - 0x007B8D 03:BB7D: 9D 20 05
loc_03_BB80:
	RTS                             ;C - - - - - 0x007B90 03:BB80: 60
EnemyChooseDirToPlayerTbl_BB81:
	.byte $02,$02,$02,$03           ;- - - - - - 0x007B91 03:BB81:
	.byte $04,$05,$06               ;- D 1 - - - 0x007B95 03:BB85:
	.byte $06,$0A,$0A               ;- - - - - - 0x007B98 03:BB88:
	.byte $0A                       ;- D 1 - - - 0x007B9B 03:BB8B:
	.byte $0B                       ;- - - - - - 0x007B9C 03:BB8C:
	.byte $0C                       ;- D 1 - - - 0x007B9D 03:BB8D:
	.byte $0D                       ;- - - - - - 0x007B9E 03:BB8E:
	.byte $0E                       ;- D 1 - - - 0x007B9F 03:BB8F:
	.byte $0E                       ;- - - - - - 0x007BA0 03:BB90:
loc_03_BB91:
	LDA objActive,X                 ;C - - - - - 0x007BA1 03:BB91: BD 00 03
	AND #$0F                        ;C - - - - - 0x007BA4 03:BB94: 29 0F
	BNE loc_03_BBA5                 ;C - - - - - 0x007BA6 03:BB96: D0 0D
	LDA #$33                        ;C - - - - - 0x007BA8 03:BB98: A9 33
	STA objVelXLo,X                 ;C - - - - - 0x007BAA 03:BB9A: 9D 00 04
	LDA #$01                        ;C - - - - - 0x007BAD 03:BB9D: A9 01
	STA objVelXHi,X                 ;C - - - - - 0x007BAF 03:BB9F: 9D 10 04
	INC objActive,X                 ;C - - - - - 0x007BB2 03:BBA2: FE 00 03
loc_03_BBA5:
	LDA objFacing,X                 ;C - - - - - 0x007BB5 03:BBA5: BD 60 04
	AND #$01                        ;C - - - - - 0x007BB8 03:BBA8: 29 01
	BEQ loc_03_BBBA                 ;C - - - - - 0x007BBA 03:BBAA: F0 0E
	JSR SetObjFlag40                ;C - - - - - 0x007BBC 03:BBAC: 20 90 F0
	JSR ApplyVelXAdd                ;C - - - - - 0x007BBF 03:BBAF: 20 83 F1
	LDA objX,X                      ;C - - - - - 0x007BC2 03:BBB2: BD 60 03
	CMP #$F8                        ;C - - - - - 0x007BC5 03:BBB5: C9 F8
	BCS loc_03_BBC7                 ;C - - - - - 0x007BC7 03:BBB7: B0 0E
	RTS                             ;C - - - - - 0x007BC9 03:BBB9: 60
loc_03_BBBA:
	JSR ClearObjFlag40              ;C - - - - - 0x007BCA 03:BBBA: 20 99 F0
	JSR ApplyVelXSub                ;C - - - - - 0x007BCD 03:BBBD: 20 A1 F1
	LDA objX,X                      ;C - - - - - 0x007BD0 03:BBC0: BD 60 03
	CMP #$08                        ;C - - - - - 0x007BD3 03:BBC3: C9 08
	BCS loc_03_BBCA                 ;C - - - - - 0x007BD5 03:BBC5: B0 03
loc_03_BBC7:
	JSR ClearObject                 ;C - - - - - 0x007BD7 03:BBC7: 20 BE F2
loc_03_BBCA:
	RTS                             ;C - - - - - 0x007BDA 03:BBCA: 60
loc_03_BBCB:
	LDA objActive,X                 ;C - - - - - 0x007BDB 03:BBCB: BD 00 03
	AND #$0F                        ;C - - - - - 0x007BDE 03:BBCE: 29 0F
	BNE loc_03_BBDE                 ;C - - - - - 0x007BE0 03:BBD0: D0 0C
	LDA scrollX                     ;C - - - - - 0x007BE2 03:BBD2: A5 FC
	BNE loc_03_BBE6                 ;C - - - - - 0x007BE4 03:BBD4: D0 10
	LDA #$3C                        ;C - - - - - 0x007BE6 03:BBD6: A9 3C
	STA objStep,X                   ;C - - - - - 0x007BE8 03:BBD8: 9D 00 05
	INC objActive,X                 ;C - - - - - 0x007BEB 03:BBDB: FE 00 03
loc_03_BBDE:
	LDA objStep,X                   ;C - - - - - 0x007BEE 03:BBDE: BD 00 05
	BEQ loc_03_BBEF                 ;C - - - - - 0x007BF1 03:BBE1: F0 0C
	DEC objStep,X                   ;C - - - - - 0x007BF3 03:BBE3: DE 00 05
loc_03_BBE6:
	RTS                             ;C - - - - - 0x007BF6 03:BBE6: 60
loc_03_BBE7:
	JSR ClearObject                 ;C - - - - - 0x007BF7 03:BBE7: 20 BE F2
	LDA #$08                        ;C - - - - - 0x007BFA 03:BBEA: A9 08
	STA enemiesDefeated             ;C - - - - - 0x007BFC 03:BBEC: 85 54
	RTS                             ;C - - - - - 0x007BFE 03:BBEE: 60
loc_03_BBEF:
	JSR CountAnim7B                 ;C - - - - - 0x007BFF 03:BBEF: 20 D1 BC
	BNE loc_03_BBFA                 ;C - - - - - 0x007C02 03:BBF2: D0 06
	LDA #$3C                        ;c - - - - - 0x007C04 03:BBF4: A9 3C
	STA objStep,X                   ;c - - - - - 0x007C06 03:BBF6: 9D 00 05
	RTS                             ;c - - - - - 0x007C09 03:BBF9: 60
loc_03_BBFA:
	INC objParamA,X                 ;C - - - - - 0x007C0A 03:BBFA: FE 10 05
	LDA objParamA,X                 ;C - - - - - 0x007C0D 03:BBFD: BD 10 05
	CMP #$06                        ;C - - - - - 0x007C10 03:BC00: C9 06
	BCS loc_03_BBE7                 ;C - - - - - 0x007C12 03:BC02: B0 E3
	LDA #$29                        ;C - - - - - 0x007C14 03:BC04: A9 29
	JSR QueueSound                  ;C - - - - - 0x007C16 03:BC06: 20 4C F3
	JSR FindFreeEnemySlot           ;C - - - - - 0x007C19 03:BC09: 20 1A F7
	BCS loc_03_BBEF                 ;C - - - - - 0x007C1C 03:BC0C: B0 E1
	STY ptr_00                      ;C - - - - - 0x007C1E 03:BC0E: 84 00
	LDA objXPage,X                  ;C - - - - - 0x007C20 03:BC10: BD 80 03
	STA objXPage,Y                  ;C - - - - - 0x007C23 03:BC13: 99 80 03
	LDA objYPage,X                  ;C - - - - - 0x007C26 03:BC16: BD E0 03
	STA objYPage,Y                  ;C - - - - - 0x007C29 03:BC19: 99 E0 03
	LDA #$00                        ;C - - - - - 0x007C2C 03:BC1C: A9 00
	STA objLife,Y                   ;C - - - - - 0x007C2E 03:BC1E: 99 90 04
	STA objHudLife,Y                ;C - - - - - 0x007C31 03:BC21: 99 A0 04
	STA objMoveMode,Y               ;C - - - - - 0x007C34 03:BC24: 99 70 04
	STA objStunTimer,Y              ;C - - - - - 0x007C37 03:BC27: 99 B0 04
	STA objDownState,Y              ;C - - - - - 0x007C3A 03:BC2A: 99 C0 04
	STA objAtkHeavy,Y               ;C - - - - - 0x007C3D 03:BC2D: 99 D0 04
	STA objHitTimer,Y               ;C - - - - - 0x007C40 03:BC30: 99 E0 04
	STA objGrabState,Y              ;C - - - - - 0x007C43 03:BC33: 99 F0 03
	STA objParamC,Y                 ;C - - - - - 0x007C46 03:BC36: 99 30 05
	LDA #$9E                        ;C - - - - - 0x007C49 03:BC39: A9 9E
	STA objAtkBox,Y                 ;C - - - - - 0x007C4B 03:BC3B: 99 40 04
	LDA #$3F                        ;C - - - - - 0x007C4E 03:BC3E: A9 3F
	STA objAtkDamage,Y              ;C - - - - - 0x007C50 03:BC40: 99 50 04
	LDA #$91                        ;C - - - - - 0x007C53 03:BC43: A9 91
	STA objKind,Y                   ;C - - - - - 0x007C55 03:BC45: 99 20 03
	LDA objParamA,X                 ;C - - - - - 0x007C58 03:BC48: BD 10 05
	CMP #$01                        ;C - - - - - 0x007C5B 03:BC4B: C9 01
	BNE loc_03_BC54                 ;C - - - - - 0x007C5D 03:BC4D: D0 05
	LDA #$FF                        ;C - - - - - 0x007C5F 03:BC4F: A9 FF
	STA objParamC,Y                 ;C - - - - - 0x007C61 03:BC51: 99 30 05
loc_03_BC54:
	LDA #$7B                        ;C - - - - - 0x007C64 03:BC54: A9 7B
	JSR SetAnimY                    ;C - - - - - 0x007C66 03:BC56: 20 A0 F2
	LDA rngState0                   ;C - - - - - 0x007C69 03:BC59: A5 E4
	ADC rngState1                   ;C - - - - - 0x007C6B 03:BC5B: 65 E5
	STA rngState0                   ;C - - - - - 0x007C6D 03:BC5D: 85 E4
	AND #$07                        ;C - - - - - 0x007C6F 03:BC5F: 29 07
	TAY                             ;C - - - - - 0x007C71 03:BC61: A8
	STY ptr_00+1                    ;C - - - - - 0x007C72 03:BC62: 84 01
	LDA EnemyChooseDirToPlayerTbl_BD3E,Y;C - - - - - 0x007C74 03:BC64: B9 3E BD
	STA objStep,X                   ;C - - - - - 0x007C77 03:BC67: 9D 00 05
	LDA stage                       ;C - - - - - 0x007C7A 03:BC6A: A5 61
	BEQ loc_03_BC7A                 ;C - - - - - 0x007C7C 03:BC6C: F0 0C
	CMP #$01                        ;C - - - - - 0x007C7E 03:BC6E: C9 01
	BEQ loc_03_BC97                 ;C - - - - - 0x007C80 03:BC70: F0 25
	CMP #$02                        ;C - - - - - 0x007C82 03:BC72: C9 02
	BEQ loc_03_BCB4                 ;C - - - - - 0x007C84 03:BC74: F0 3E
	CMP #$04                        ;c - - - - - 0x007C86 03:BC76: C9 04
	BEQ loc_03_BCB4                 ;c - - - - - 0x007C88 03:BC78: F0 3A
loc_03_BC7A:
	LDA EnemyChooseDirToPlayerTbl_BCF6,Y;C - - - - - 0x007C8A 03:BC7A: B9 F6 BC
	LDY ptr_00                      ;C - - - - - 0x007C8D 03:BC7D: A4 00
	STA objY,Y                      ;C - - - - - 0x007C8F 03:BC7F: 99 C0 03
	LDY ptr_00+1                    ;C - - - - - 0x007C92 03:BC82: A4 01
	LDA EnemyChooseDirToPlayerTbl_BD0E,Y;C - - - - - 0x007C94 03:BC84: B9 0E BD
	LDY ptr_00                      ;C - - - - - 0x007C97 03:BC87: A4 00
	STA objX,Y                      ;C - - - - - 0x007C99 03:BC89: 99 60 03
	LDY ptr_00+1                    ;C - - - - - 0x007C9C 03:BC8C: A4 01
	LDA EnemyChooseDirToPlayerTbl_BD26,Y;C - - - - - 0x007C9E 03:BC8E: B9 26 BD
	LDY ptr_00                      ;C - - - - - 0x007CA1 03:BC91: A4 00
	STA objFacing,Y                 ;C - - - - - 0x007CA3 03:BC93: 99 60 04
	RTS                             ;C - - - - - 0x007CA6 03:BC96: 60
loc_03_BC97:
	LDA EnemyChooseDirToPlayerTbl_BCFE,Y;C - - - - - 0x007CA7 03:BC97: B9 FE BC
	LDY ptr_00                      ;C - - - - - 0x007CAA 03:BC9A: A4 00
	STA objY,Y                      ;C - - - - - 0x007CAC 03:BC9C: 99 C0 03
	LDY ptr_00+1                    ;C - - - - - 0x007CAF 03:BC9F: A4 01
	LDA EnemyChooseDirToPlayerTbl_BD16,Y;C - - - - - 0x007CB1 03:BCA1: B9 16 BD
	LDY ptr_00                      ;C - - - - - 0x007CB4 03:BCA4: A4 00
	STA objX,Y                      ;C - - - - - 0x007CB6 03:BCA6: 99 60 03
	LDY ptr_00+1                    ;C - - - - - 0x007CB9 03:BCA9: A4 01
	LDA EnemyChooseDirToPlayerTbl_BD2E,Y;C - - - - - 0x007CBB 03:BCAB: B9 2E BD
	LDY ptr_00                      ;C - - - - - 0x007CBE 03:BCAE: A4 00
	STA objFacing,Y                 ;C - - - - - 0x007CC0 03:BCB0: 99 60 04
	RTS                             ;C - - - - - 0x007CC3 03:BCB3: 60
loc_03_BCB4:
	LDA EnemyChooseDirToPlayerTbl_BD06,Y;C - - - - - 0x007CC4 03:BCB4: B9 06 BD
	LDY ptr_00                      ;C - - - - - 0x007CC7 03:BCB7: A4 00
	STA objY,Y                      ;C - - - - - 0x007CC9 03:BCB9: 99 C0 03
	LDY ptr_00+1                    ;C - - - - - 0x007CCC 03:BCBC: A4 01
	LDA EnemyChooseDirToPlayerTbl_BD1E,Y;C - - - - - 0x007CCE 03:BCBE: B9 1E BD
	LDY ptr_00                      ;C - - - - - 0x007CD1 03:BCC1: A4 00
	STA objX,Y                      ;C - - - - - 0x007CD3 03:BCC3: 99 60 03
	LDY ptr_00+1                    ;C - - - - - 0x007CD6 03:BCC6: A4 01
	LDA EnemyChooseDirToPlayerTbl_BD36,Y;C - - - - - 0x007CD8 03:BCC8: B9 36 BD
	LDY ptr_00                      ;C - - - - - 0x007CDB 03:BCCB: A4 00
	STA objFacing,Y                 ;C - - - - - 0x007CDD 03:BCCD: 99 60 04
	RTS                             ;C - - - - - 0x007CE0 03:BCD0: 60
; $00 if three objects use anim $7B, else $FF
CountAnim7B:
	LDA #$00                        ;C - - - - - 0x007CE1 03:BCD1: A9 00
	STA ptr_00                      ;C - - - - - 0x007CE3 03:BCD3: 85 00
	LDY #$0F                        ;C - - - - - 0x007CE5 03:BCD5: A0 0F
loc_03_BCD7:
	LDA objActive,Y                 ;C - - - - - 0x007CE7 03:BCD7: B9 00 03
	BPL loc_03_BCE5                 ;C - - - - - 0x007CEA 03:BCDA: 10 09
	LDA objAnim,Y                   ;C - - - - - 0x007CEC 03:BCDC: B9 80 05
	CMP #$7B                        ;C - - - - - 0x007CEF 03:BCDF: C9 7B
	BNE loc_03_BCE5                 ;C - - - - - 0x007CF1 03:BCE1: D0 02
	INC ptr_00                      ;C - - - - - 0x007CF3 03:BCE3: E6 00
loc_03_BCE5:
	DEY                             ;C - - - - - 0x007CF5 03:BCE5: 88
	CPY #$02                        ;C - - - - - 0x007CF6 03:BCE6: C0 02
	BNE loc_03_BCD7                 ;C - - - - - 0x007CF8 03:BCE8: D0 ED
	LDA ptr_00                      ;C - - - - - 0x007CFA 03:BCEA: A5 00
	CMP #$03                        ;C - - - - - 0x007CFC 03:BCEC: C9 03
	BEQ loc_03_BCF3                 ;C - - - - - 0x007CFE 03:BCEE: F0 03
	LDA #$FF                        ;C - - - - - 0x007D00 03:BCF0: A9 FF
	RTS                             ;C - - - - - 0x007D02 03:BCF2: 60
loc_03_BCF3:
	LDA #$00                        ;c - - - - - 0x007D03 03:BCF3: A9 00
	RTS                             ;c - - - - - 0x007D05 03:BCF5: 60
EnemyChooseDirToPlayerTbl_BCF6:
	.byte $98                       ;- D 1 - - - 0x007D06 03:BCF6:
	.byte $88                       ;- - - - - - 0x007D07 03:BCF7:
	.byte $78,$88                   ;- D 1 - - - 0x007D08 03:BCF8:
	.byte $98                       ;- - - - - - 0x007D0A 03:BCFA:
	.byte $88,$78,$98               ;- D 1 - - - 0x007D0B 03:BCFB:
EnemyChooseDirToPlayerTbl_BCFE:
	.byte $98                       ;- D 1 - - - 0x007D0E 03:BCFE:
	.byte $98                       ;- - - - - - 0x007D0F 03:BCFF:
	.byte $A8                       ;- D 1 - - - 0x007D10 03:BD00:
	.byte $A8,$98                   ;- - - - - - 0x007D11 03:BD01:
	.byte $98,$A8,$A8               ;- D 1 - - - 0x007D13 03:BD03:
EnemyChooseDirToPlayerTbl_BD06:
	.byte $88,$98,$A8,$98,$88,$98,$A8;- D 1 - - - 0x007D16 03:BD06:
	.byte $98                       ;- - - - - - 0x007D1D 03:BD0D:
EnemyChooseDirToPlayerTbl_BD0E:
	.byte $FF                       ;- D 1 - - - 0x007D1E 03:BD0E:
	.byte $FF                       ;- - - - - - 0x007D1F 03:BD0F:
	.byte $FF,$FF                   ;- D 1 - - - 0x007D20 03:BD10:
	.byte $FF                       ;- - - - - - 0x007D22 03:BD12:
	.byte $FF,$FF,$FF               ;- D 1 - - - 0x007D23 03:BD13:
EnemyChooseDirToPlayerTbl_BD16:
	.byte $00                       ;- D 1 - - - 0x007D26 03:BD16:
	.byte $00                       ;- - - - - - 0x007D27 03:BD17:
	.byte $00                       ;- D 1 - - - 0x007D28 03:BD18:
	.byte $00,$00                   ;- - - - - - 0x007D29 03:BD19:
	.byte $00,$00,$00               ;- D 1 - - - 0x007D2B 03:BD1B:
EnemyChooseDirToPlayerTbl_BD1E:
	.byte $00,$00,$00,$00,$00,$00,$00;- D 1 - - - 0x007D2E 03:BD1E:
	.byte $00                       ;- - - - - - 0x007D35 03:BD25:
EnemyChooseDirToPlayerTbl_BD26:
	.byte $02                       ;- D 1 - - - 0x007D36 03:BD26:
	.byte $02                       ;- - - - - - 0x007D37 03:BD27:
	.byte $02,$02                   ;- D 1 - - - 0x007D38 03:BD28:
	.byte $02                       ;- - - - - - 0x007D3A 03:BD2A:
	.byte $02,$02,$02               ;- D 1 - - - 0x007D3B 03:BD2B:
EnemyChooseDirToPlayerTbl_BD2E:
	.byte $01                       ;- D 1 - - - 0x007D3E 03:BD2E:
	.byte $01                       ;- - - - - - 0x007D3F 03:BD2F:
	.byte $01                       ;- D 1 - - - 0x007D40 03:BD30:
	.byte $01,$01                   ;- - - - - - 0x007D41 03:BD31:
	.byte $01,$01,$01               ;- D 1 - - - 0x007D43 03:BD33:
EnemyChooseDirToPlayerTbl_BD36:
	.byte $01,$01,$01,$01,$01,$01,$01;- D 1 - - - 0x007D46 03:BD36:
	.byte $01                       ;- - - - - - 0x007D4D 03:BD3D:
EnemyChooseDirToPlayerTbl_BD3E:
	.byte $44,$5A,$4B,$3C,$44,$5A,$4B,$3C;- D 1 - - - 0x007D4E 03:BD3E:
loc_03_BD46:
	LDA objActive,X                 ;C - - - - - 0x007D56 03:BD46: BD 00 03
	AND #$0F                        ;C - - - - - 0x007D59 03:BD49: 29 0F
	BNE loc_03_BD8B                 ;C - - - - - 0x007D5B 03:BD4B: D0 3E
	STA objVelXLo,X                 ;C - - - - - 0x007D5D 03:BD4D: 9D 00 04
	STA objVelYLo,X                 ;C - - - - - 0x007D60 03:BD50: 9D 20 04
	STA objAtkBox,X                 ;C - - - - - 0x007D63 03:BD53: 9D 40 04
	LDA #$03                        ;C - - - - - 0x007D66 03:BD56: A9 03
	STA objVelXHi,X                 ;C - - - - - 0x007D68 03:BD58: 9D 10 04
	LDA #$01                        ;C - - - - - 0x007D6B 03:BD5B: A9 01
	STA objVelYHi,X                 ;C - - - - - 0x007D6D 03:BD5D: 9D 30 04
	LDA #$10                        ;C - - - - - 0x007D70 03:BD60: A9 10
	STA objStep,X                   ;C - - - - - 0x007D72 03:BD62: 9D 00 05
	INC objActive,X                 ;C - - - - - 0x007D75 03:BD65: FE 00 03
	LDA ram_00B2                    ;C - - - - - 0x007D78 03:BD68: A5 B2
	BEQ loc_03_BD74                 ;C - - - - - 0x007D7A 03:BD6A: F0 08
	DEC objParamB+15                ;C - - - - - 0x007D7C 03:BD6C: CE 2F 05
	INC ram_00B9                    ;C - - - - - 0x007D7F 03:BD6F: E6 B9
	JMP loc_03_BD7C                 ;C - - - - - 0x007D81 03:BD71: 4C 7C BD
loc_03_BD74:
	JSR CountKinds10to13            ;C - - - - - 0x007D84 03:BD74: 20 9B BE
	BNE loc_03_BD7C                 ;C - - - - - 0x007D87 03:BD77: D0 03
	JSR SpawnObjBelowEnemy          ;C - - - - - 0x007D89 03:BD79: 20 CE BD
loc_03_BD7C:
	LDA playerFacing                ;C - - - - - 0x007D8C 03:BD7C: A5 31
	CMP objFacing,X                 ;C - - - - - 0x007D8E 03:BD7E: DD 60 04
	BEQ loc_03_BD88                 ;C - - - - - 0x007D91 03:BD81: F0 05
	LDA objFacing,X                 ;C - - - - - 0x007D93 03:BD83: BD 60 04
	EOR #$03                        ;C - - - - - 0x007D96 03:BD86: 49 03
loc_03_BD88:
	STA objFacing,X                 ;C - - - - - 0x007D98 03:BD88: 9D 60 04
loc_03_BD8B:
	JSR ApplyVelYUpAlt              ;C - - - - - 0x007D9B 03:BD8B: 20 DF F1
	LDA objFacing,X                 ;C - - - - - 0x007D9E 03:BD8E: BD 60 04
	AND #$01                        ;C - - - - - 0x007DA1 03:BD91: 29 01
	BEQ loc_03_BDA2                 ;C - - - - - 0x007DA3 03:BD93: F0 0D
	JSR ApplyVelXAdd                ;C - - - - - 0x007DA5 03:BD95: 20 83 F1
	LDA objX,X                      ;C - - - - - 0x007DA8 03:BD98: BD 60 03
	CMP #$F8                        ;C - - - - - 0x007DAB 03:BD9B: C9 F8
	BCS loc_03_BDAC                 ;C - - - - - 0x007DAD 03:BD9D: B0 0D
	JMP loc_03_BDAF                 ;C - - - - - 0x007DAF 03:BD9F: 4C AF BD
loc_03_BDA2:
	JSR ApplyVelXSub                ;C - - - - - 0x007DB2 03:BDA2: 20 A1 F1
	LDA objX,X                      ;C - - - - - 0x007DB5 03:BDA5: BD 60 03
	CMP #$08                        ;C - - - - - 0x007DB8 03:BDA8: C9 08
	BCS loc_03_BDAF                 ;C - - - - - 0x007DBA 03:BDAA: B0 03
loc_03_BDAC:
	JMP ClearObject                 ;C - - - - - 0x007DBC 03:BDAC: 4C BE F2
loc_03_BDAF:
	DEC objStep,X                   ;C - - - - - 0x007DBF 03:BDAF: DE 00 05
	LDA objStep,X                   ;C - - - - - 0x007DC2 03:BDB2: BD 00 05
	BEQ loc_03_BDCD                 ;C - - - - - 0x007DC5 03:BDB5: F0 16
	AND #$01                        ;C - - - - - 0x007DC7 03:BDB7: 29 01
	BNE loc_03_BDC5                 ;C - - - - - 0x007DC9 03:BDB9: D0 0A
	LDA objFlags,X                  ;C - - - - - 0x007DCB 03:BDBB: BD 60 05
	ORA #$04                        ;C - - - - - 0x007DCE 03:BDBE: 09 04
	STA objFlags,X                  ;C - - - - - 0x007DD0 03:BDC0: 9D 60 05
	BNE loc_03_BDCD                 ;C - - - - - 0x007DD3 03:BDC3: D0 08
loc_03_BDC5:
	LDA objFlags,X                  ;C - - - - - 0x007DD5 03:BDC5: BD 60 05
	AND #$FB                        ;C - - - - - 0x007DD8 03:BDC8: 29 FB
	STA objFlags,X                  ;C - - - - - 0x007DDA 03:BDCA: 9D 60 05
loc_03_BDCD:
	RTS                             ;C - - - - - 0x007DDD 03:BDCD: 60
SpawnObjBelowEnemy:
	LDA objParamC,X                 ;C - - - - - 0x007DDE 03:BDCE: BD 30 05
	BPL loc_03_BDD5                 ;C - - - - - 0x007DE1 03:BDD1: 10 02
	BMI loc_03_BDDF                 ;C - - - - - 0x007DE3 03:BDD3: 30 0A
loc_03_BDD5:
	LDA rngState0                   ;C - - - - - 0x007DE5 03:BDD5: A5 E4
	ADC rngState1                   ;C - - - - - 0x007DE7 03:BDD7: 65 E5
	STA rngState0                   ;C - - - - - 0x007DE9 03:BDD9: 85 E4
	CMP #$7F                        ;C - - - - - 0x007DEB 03:BDDB: C9 7F
	BCC loc_03_BDAF                 ;C - - - - - 0x007DED 03:BDDD: 90 D0
loc_03_BDDF:
	JSR FindFreeEnemySlot           ;C - - - - - 0x007DEF 03:BDDF: 20 1A F7
	BCS loc_03_BDAF                 ;C - - - - - 0x007DF2 03:BDE2: B0 CB
	STY ptr_00                      ;C - - - - - 0x007DF4 03:BDE4: 84 00
	LDA objXPage,X                  ;C - - - - - 0x007DF6 03:BDE6: BD 80 03
	STA objXPage,Y                  ;C - - - - - 0x007DF9 03:BDE9: 99 80 03
	LDA objYPage,X                  ;C - - - - - 0x007DFC 03:BDEC: BD E0 03
	STA objYPage,Y                  ;C - - - - - 0x007DFF 03:BDEF: 99 E0 03
	LDA objX,X                      ;C - - - - - 0x007E02 03:BDF2: BD 60 03
	STA objX,Y                      ;C - - - - - 0x007E05 03:BDF5: 99 60 03
	LDA objY,X                      ;C - - - - - 0x007E08 03:BDF8: BD C0 03
	CLC                             ;C - - - - - 0x007E0B 03:BDFB: 18
	ADC #$0C                        ;C - - - - - 0x007E0C 03:BDFC: 69 0C
	STA objY,Y                      ;C - - - - - 0x007E0E 03:BDFE: 99 C0 03
	LDA #$00                        ;C - - - - - 0x007E11 03:BE01: A9 00
	STA objLife,Y                   ;C - - - - - 0x007E13 03:BE03: 99 90 04
	STA objHudLife,Y                ;C - - - - - 0x007E16 03:BE06: 99 A0 04
	STA objMoveMode,Y               ;C - - - - - 0x007E19 03:BE09: 99 70 04
	STA objStunTimer,Y              ;C - - - - - 0x007E1C 03:BE0C: 99 B0 04
	STA objDownState,Y              ;C - - - - - 0x007E1F 03:BE0F: 99 C0 04
	STA objAtkHeavy,Y               ;C - - - - - 0x007E22 03:BE12: 99 D0 04
	STA objHitTimer,Y               ;C - - - - - 0x007E25 03:BE15: 99 E0 04
	STA objGrabState,Y              ;C - - - - - 0x007E28 03:BE18: 99 F0 03
	STA objSpriteDown,Y             ;C - - - - - 0x007E2B 03:BE1B: 99 B0 05
	STA objVariant,Y                ;C - - - - - 0x007E2E 03:BE1E: 99 C0 05
	STA objTimer,Y                  ;C - - - - - 0x007E31 03:BE21: 99 D0 05
	STA objCounter,Y                ;C - - - - - 0x007E34 03:BE24: 99 E0 05
	STA objToggle,Y                 ;C - - - - - 0x007E37 03:BE27: 99 F0 05
	STA objAtkDamage,Y              ;C - - - - - 0x007E3A 03:BE2A: 99 50 04
	LDA #$1F                        ;C - - - - - 0x007E3D 03:BE2D: A9 1F
	STA objAtkBox,Y                 ;C - - - - - 0x007E3F 03:BE2F: 99 40 04
	LDA objParamC,X                 ;C - - - - - 0x007E42 03:BE32: BD 30 05
	BPL loc_03_BE44                 ;C - - - - - 0x007E45 03:BE35: 10 0D
	LDA #$10                        ;C - - - - - 0x007E47 03:BE37: A9 10
	STA objKind,Y                   ;C - - - - - 0x007E49 03:BE39: 99 20 03
	LDA #$61                        ;C - - - - - 0x007E4C 03:BE3C: A9 61
	JSR SetAnimY                    ;C - - - - - 0x007E4E 03:BE3E: 20 A0 F2
	JMP loc_03_BE72                 ;C - - - - - 0x007E51 03:BE41: 4C 72 BE
loc_03_BE44:
	LDA rngState1                   ;C - - - - - 0x007E54 03:BE44: A5 E5
	ADC rngState2                   ;C - - - - - 0x007E56 03:BE46: 65 E6
	STA rngState1                   ;C - - - - - 0x007E58 03:BE48: 85 E5
	AND #$0F                        ;C - - - - - 0x007E5A 03:BE4A: 29 0F
	TAY                             ;C - - - - - 0x007E5C 03:BE4C: A8
	STY ptr_00+1                    ;C - - - - - 0x007E5D 03:BE4D: 84 01
	LDA SpawnObjBelowEnemyTbl_BE88,Y;C - - - - - 0x007E5F 03:BE4F: B9 88 BE
	LDY ptr_00                      ;C - - - - - 0x007E62 03:BE52: A4 00
	STA objKind,Y                   ;C - - - - - 0x007E64 03:BE54: 99 20 03
	CMP #$69                        ;C - - - - - 0x007E67 03:BE57: C9 69
	BNE loc_03_BE68                 ;C - - - - - 0x007E69 03:BE59: D0 0D
	LDY playerId                    ;C - - - - - 0x007E6B 03:BE5B: A4 34
	LDA SpawnObjBelowEnemyTbl_BE98,Y;C - - - - - 0x007E6D 03:BE5D: B9 98 BE
	LDY ptr_00                      ;C - - - - - 0x007E70 03:BE60: A4 00
	JSR SetAnimY                    ;C - - - - - 0x007E72 03:BE62: 20 A0 F2
	JMP loc_03_BE72                 ;C - - - - - 0x007E75 03:BE65: 4C 72 BE
loc_03_BE68:
	LDY ptr_00+1                    ;C - - - - - 0x007E78 03:BE68: A4 01
	LDA SpawnObjBelowEnemyTbl_BE78,Y;C - - - - - 0x007E7A 03:BE6A: B9 78 BE
	LDY ptr_00                      ;C - - - - - 0x007E7D 03:BE6D: A4 00
	JSR SetAnimY                    ;C - - - - - 0x007E7F 03:BE6F: 20 A0 F2
loc_03_BE72:
	LDA #$90                        ;C - - - - - 0x007E82 03:BE72: A9 90
	STA objFlags,Y                  ;C - - - - - 0x007E84 03:BE74: 99 60 05
	RTS                             ;C - - - - - 0x007E87 03:BE77: 60
SpawnObjBelowEnemyTbl_BE78:
	.byte $60,$63,$62,$63           ;- - - - - - 0x007E88 03:BE78:
	.byte $64                       ;- D 1 - - - 0x007E8C 03:BE7C:
	.byte $65,$60,$40,$5E,$5D,$5D,$5E,$40,$60,$63,$64;- - - - - - 0x007E8D 03:BE7D:
SpawnObjBelowEnemyTbl_BE88:
	.byte $10,$10,$10,$10           ;- - - - - - 0x007E98 03:BE88:
	.byte $13                       ;- D 1 - - - 0x007E9C 03:BE8C:
	.byte $11,$10,$69,$69,$69,$69,$69;- - - - - - 0x007E9D 03:BE8D:
	.byte $69                       ;- D 1 - - - 0x007EA4 03:BE94:
	.byte $10,$10,$13               ;- - - - - - 0x007EA5 03:BE95:
SpawnObjBelowEnemyTbl_BE98:
	.byte $40                       ;- - - - - - 0x007EA8 03:BE98:
	.byte $5E                       ;- D 1 - - - 0x007EA9 03:BE99:
	.byte $5D                       ;- - - - - - 0x007EAA 03:BE9A:
; $FF if two or more
CountKinds10to13:
	LDA #$00                        ;C - - - - - 0x007EAB 03:BE9B: A9 00
	STA ptr_00                      ;C - - - - - 0x007EAD 03:BE9D: 85 00
	LDY #$0D                        ;C - - - - - 0x007EAF 03:BE9F: A0 0D
loc_03_BEA1:
	LDA objActive,Y                 ;C - - - - - 0x007EB1 03:BEA1: B9 00 03
	BPL loc_03_BEC1                 ;C - - - - - 0x007EB4 03:BEA4: 10 1B
	LDA objKind,Y                   ;C - - - - - 0x007EB6 03:BEA6: B9 20 03
	CMP #$10                        ;C - - - - - 0x007EB9 03:BEA9: C9 10
	BEQ loc_03_BEBF                 ;C - - - - - 0x007EBB 03:BEAB: F0 12
	CMP #$11                        ;C - - - - - 0x007EBD 03:BEAD: C9 11
	BEQ loc_03_BEBF                 ;C - - - - - 0x007EBF 03:BEAF: F0 0E
	CMP #$12                        ;C - - - - - 0x007EC1 03:BEB1: C9 12
	BEQ loc_03_BEBF                 ;C - - - - - 0x007EC3 03:BEB3: F0 0A
	CMP #$13                        ;C - - - - - 0x007EC5 03:BEB5: C9 13
	BEQ loc_03_BEBF                 ;C - - - - - 0x007EC7 03:BEB7: F0 06
	CMP #$69                        ;C - - - - - 0x007EC9 03:BEB9: C9 69
	BEQ loc_03_BEBF                 ;C - - - - - 0x007ECB 03:BEBB: F0 02
	BNE loc_03_BEC1                 ;C - - - - - 0x007ECD 03:BEBD: D0 02
loc_03_BEBF:
	INC ptr_00                      ;C - - - - - 0x007ECF 03:BEBF: E6 00
loc_03_BEC1:
	DEY                             ;C - - - - - 0x007ED1 03:BEC1: 88
	CPY #$00                        ;C - - - - - 0x007ED2 03:BEC2: C0 00
	BNE loc_03_BEA1                 ;C - - - - - 0x007ED4 03:BEC4: D0 DB
	LDA ptr_00                      ;C - - - - - 0x007ED6 03:BEC6: A5 00
	CMP #$02                        ;C - - - - - 0x007ED8 03:BEC8: C9 02
	BCC loc_03_BECF                 ;C - - - - - 0x007EDA 03:BECA: 90 03
	LDA #$FF                        ;C - - - - - 0x007EDC 03:BECC: A9 FF
	RTS                             ;C - - - - - 0x007EDE 03:BECE: 60
loc_03_BECF:
	LDA #$00                        ;C - - - - - 0x007EDF 03:BECF: A9 00
	RTS                             ;C - - - - - 0x007EE1 03:BED1: 60
loc_03_BED2:
	LDA #$FF                        ;C - - - - - 0x007EE2 03:BED2: A9 FF
	STA objDownState,X              ;C - - - - - 0x007EE4 03:BED4: 9D C0 04
	LDA gameAction                  ;C - - - - - 0x007EE7 03:BED7: A5 30
	BEQ loc_03_BEEB                 ;C - - - - - 0x007EE9 03:BED9: F0 10
	LDA attackType                  ;C - - - - - 0x007EEB 03:BEDB: A5 A7
	BEQ loc_03_BEEB                 ;C - - - - - 0x007EED 03:BEDD: F0 0C
	CMP #$06                        ;C - - - - - 0x007EEF 03:BEDF: C9 06
	BEQ loc_03_BEEB                 ;C - - - - - 0x007EF1 03:BEE1: F0 08
	CMP #$0B                        ;C - - - - - 0x007EF3 03:BEE3: C9 0B
	BEQ loc_03_BEEB                 ;C - - - - - 0x007EF5 03:BEE5: F0 04
	CMP #$0C                        ;C - - - - - 0x007EF7 03:BEE7: C9 0C
	BNE loc_03_BF31                 ;C - - - - - 0x007EF9 03:BEE9: D0 46
loc_03_BEEB:
	LDA #$0A                        ;C - - - - - 0x007EFB 03:BEEB: A9 0A
	STA gameAction                  ;C - - - - - 0x007EFD 03:BEED: 85 30
	LDA #$00                        ;C - - - - - 0x007EFF 03:BEEF: A9 00
	STA objStep,X                   ;C - - - - - 0x007F01 03:BEF1: 9D 00 05
	STA objVelXHi,X                 ;C - - - - - 0x007F04 03:BEF4: 9D 10 04
	LDA #$99                        ;C - - - - - 0x007F07 03:BEF7: A9 99
	STA objVelXLo,X                 ;C - - - - - 0x007F09 03:BEF9: 9D 00 04
	LDA playerFacing                ;C - - - - - 0x007F0C 03:BEFC: A5 31
	STA objFacing,X                 ;C - - - - - 0x007F0E 03:BEFE: 9D 60 04
	LDA objParamB,X                 ;C - - - - - 0x007F11 03:BF01: BD 20 05
	STA objParamC,X                 ;C - - - - - 0x007F14 03:BF04: 9D 30 05
	LDA #$8E                        ;C - - - - - 0x007F17 03:BF07: A9 8E
	STA objVelYLo,X                 ;C - - - - - 0x007F19 03:BF09: 9D 20 04
	LDA #$03                        ;C - - - - - 0x007F1C 03:BF0C: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x007F1E 03:BF0E: 9D 30 04
	LDA #$0B                        ;C - - - - - 0x007F21 03:BF11: A9 0B
	STA objSpriteDown,X             ;C - - - - - 0x007F23 03:BF13: 9D B0 05
	LDA #$05                        ;C - - - - - 0x007F26 03:BF16: A9 05
	STA objKind,X                   ;C - - - - - 0x007F28 03:BF18: 9D 20 03
	LDA #$9B                        ;C - - - - - 0x007F2B 03:BF1B: A9 9B
	STA objId,X                     ;C - - - - - 0x007F2D 03:BF1D: 9D 30 03
	LDA #$81                        ;C - - - - - 0x007F30 03:BF20: A9 81
	STA objActive,X                 ;C - - - - - 0x007F32 03:BF22: 9D 00 03
	LDA #$10                        ;C - - - - - 0x007F35 03:BF25: A9 10
	STA objTimer,X                  ;C - - - - - 0x007F37 03:BF27: 9D D0 05
	LDA #$C4                        ;C - - - - - 0x007F3A 03:BF2A: A9 C4
	LDY #$39                        ;C - - - - - 0x007F3C 03:BF2C: A0 39
	JMP SetAnimXChr4                ;C - - - - - 0x007F3E 03:BF2E: 4C 49 F4
loc_03_BF31:
	LDA #$C3                        ;C - - - - - 0x007F41 03:BF31: A9 C3
	LDY #$3A                        ;C - - - - - 0x007F43 03:BF33: A0 3A
	JMP SetAnimXChr4                ;C - - - - - 0x007F45 03:BF35: 4C 49 F4
loc_03_BF38:
	DEC objTimer,X                  ;C - - - - - 0x007F48 03:BF38: DE D0 05
	BNE loc_03_BF47                 ;C - - - - - 0x007F4B 03:BF3B: D0 0A
	LDA #$80                        ;C - - - - - 0x007F4D 03:BF3D: A9 80
	STA objActive,X                 ;C - - - - - 0x007F4F 03:BF3F: 9D 00 03
	LDA #$7D                        ;C - - - - - 0x007F52 03:BF42: A9 7D
	STA objKind,X                   ;C - - - - - 0x007F54 03:BF44: 9D 20 03
loc_03_BF47:
	RTS                             ;C - - - - - 0x007F57 03:BF47: 60
loc_03_BF48:
	LDA #$01                        ;C - - - - - 0x007F58 03:BF48: A9 01
	STA objDownState,X              ;C - - - - - 0x007F5A 03:BF4A: 9D C0 04
	LDA objActive,X                 ;C - - - - - 0x007F5D 03:BF4D: BD 00 03
	AND #$0F                        ;C - - - - - 0x007F60 03:BF50: 29 0F
	BNE loc_03_BF7C                 ;C - - - - - 0x007F62 03:BF52: D0 28
	LDY objStep,X                   ;C - - - - - 0x007F64 03:BF54: BC 00 05
	LDA objAnimFrame,Y              ;C - - - - - 0x007F67 03:BF57: B9 70 05
	CMP #$0B                        ;C - - - - - 0x007F6A 03:BF5A: C9 0B
	BNE loc_03_BF94                 ;C - - - - - 0x007F6C 03:BF5C: D0 36
	LDA #$CF                        ;C - - - - - 0x007F6E 03:BF5E: A9 CF
	STA objAnim,X                   ;C - - - - - 0x007F70 03:BF60: 9D 80 05
	LDA #$3B                        ;C - - - - - 0x007F73 03:BF63: A9 3B
	STA chrBankShadow+4             ;C - - - - - 0x007F75 03:BF65: 85 EC
	LDA #$00                        ;C - - - - - 0x007F77 03:BF67: A9 00
	STA objAnimFrame,X              ;C - - - - - 0x007F79 03:BF69: 9D 70 05
	STA objAnimFlags,X              ;C - - - - - 0x007F7C 03:BF6C: 9D 90 05
	LDA #$90                        ;C - - - - - 0x007F7F 03:BF6F: A9 90
	STA objFlags,X                  ;C - - - - - 0x007F81 03:BF71: 9D 60 05
	ORA #$04                        ;C - - - - - 0x007F84 03:BF74: 09 04
	STA objFlags,Y                  ;C - - - - - 0x007F86 03:BF76: 99 60 05
	INC objActive,X                 ;C - - - - - 0x007F89 03:BF79: FE 00 03
loc_03_BF7C:
	DEC objTimer,X                  ;C - - - - - 0x007F8C 03:BF7C: DE D0 05
	BEQ loc_03_BFBB                 ;C - - - - - 0x007F8F 03:BF7F: F0 3A
	LDA objTimer,X                  ;C - - - - - 0x007F91 03:BF81: BD D0 05
	CMP #$5F                        ;C - - - - - 0x007F94 03:BF84: C9 5F
	BCC loc_03_BF94                 ;C - - - - - 0x007F96 03:BF86: 90 0C
	CMP #$A0                        ;C - - - - - 0x007F98 03:BF88: C9 A0
	BCS loc_03_BF94                 ;C - - - - - 0x007F9A 03:BF8A: B0 08
	LDA objFlags,X                  ;C - - - - - 0x007F9C 03:BF8C: BD 60 05
	EOR #$04                        ;C - - - - - 0x007F9F 03:BF8F: 49 04
	STA objFlags,X                  ;C - - - - - 0x007FA1 03:BF91: 9D 60 05
loc_03_BF94:
	RTS                             ;C - - - - - 0x007FA4 03:BF94: 60
loc_03_BF95:
	LDA objAnimFrame,X              ;C - - - - - 0x007FA5 03:BF95: BD 70 05
	CMP #$02                        ;C - - - - - 0x007FA8 03:BF98: C9 02
	BNE loc_03_BFA6                 ;C - - - - - 0x007FAA 03:BF9A: D0 0A
	LDA #$01                        ;C - - - - - 0x007FAC 03:BF9C: A9 01
	STA objAnimFrame,X              ;C - - - - - 0x007FAE 03:BF9E: 9D 70 05
	LDA #$00                        ;C - - - - - 0x007FB1 03:BFA1: A9 00
	STA objAnimFlags,X              ;C - - - - - 0x007FB3 03:BFA3: 9D 90 05
loc_03_BFA6:
	LDA objFacing,X                 ;C - - - - - 0x007FB6 03:BFA6: BD 60 04
	AND #$01                        ;C - - - - - 0x007FB9 03:BFA9: 29 01
	BEQ loc_03_BFB0                 ;C - - - - - 0x007FBB 03:BFAB: F0 03
	JMP ApplyVelXAdd                ;C - - - - - 0x007FBD 03:BFAD: 4C 83 F1
loc_03_BFB0:
	JSR ApplyVelXSub                ;C - - - - - 0x007FC0 03:BFB0: 20 A1 F1
	LDA objXPage,X                  ;C - - - - - 0x007FC3 03:BFB3: BD 80 03
	CMP scrollXPage                 ;C - - - - - 0x007FC6 03:BFB6: C5 F9
	BNE loc_03_BFBB                 ;C - - - - - 0x007FC8 03:BFB8: D0 01
	RTS                             ;C - - - - - 0x007FCA 03:BFBA: 60
loc_03_BFBB:
	JMP ClearObject                 ;C - - - - - 0x007FCB 03:BFBB: 4C BE F2
loc_03_BFBE:
	LDA objY                        ;C - - - - - 0x007FCE 03:BFBE: AD C0 03
	STA objY,X                      ;C - - - - - 0x007FD1 03:BFC1: 9D C0 03
	LDA objX                        ;C - - - - - 0x007FD4 03:BFC4: AD 60 03
	STA objX,X                      ;C - - - - - 0x007FD7 03:BFC7: 9D 60 03
	LDA #$D0                        ;C - - - - - 0x007FDA 03:BFCA: A9 D0
	STA objFlags,X                  ;C - - - - - 0x007FDC 03:BFCC: 9D 60 05
	INC objSubStep                  ;C - - - - - 0x007FDF 03:BFCF: EE 50 05
	LDA #$00                        ;C - - - - - 0x007FE2 03:BFD2: A9 00
	STA objX                        ;C - - - - - 0x007FE4 03:BFD4: 8D 60 03
	LDA dat_0F_E22A                 ;C - - - - - 0x007FE7 03:BFD7: AD 2A E2
	JSR SetPlayerAnim               ;C - - - - - 0x007FEA 03:BFDA: 20 94 F2
	LDA dat_0F_E272                 ;C - - - - - 0x007FED 03:BFDD: AD 72 E2
	JSR SetChrBank2                 ;C - - - - - 0x007FF0 03:BFE0: 20 40 F4
	JSR SetPlayerFlag40             ;C - - - - - 0x007FF3 03:BFE3: 20 3F F0
	LDA #$8F                        ;C - - - - - 0x007FF6 03:BFE6: A9 8F
	STA objKind,X                   ;C - - - - - 0x007FF8 03:BFE8: 9D 20 03
	LDA #$19                        ;C - - - - - 0x007FFB 03:BFEB: A9 19
	STA palBuffer+23                ;C - - - - - 0x007FFD 03:BFED: 8D 17 06
	LDA #$21                        ;C - - - - - 0x008000 03:BFF0: A9 21
	STA palBuffer+27                ;C - - - - - 0x008002 03:BFF2: 8D 1B 06
	STA palUpdateFlag               ;C - - - - - 0x008005 03:BFF5: 85 18
	LDA #$FE                        ;C - - - - - 0x008007 03:BFF7: A9 FE
	LDY #$31                        ;C - - - - - 0x008009 03:BFF9: A0 31
	JMP SetAnimXChr4                ;C - - - - - 0x00800B 03:BFFB: 4C 49 F4
	.byte $5F,$11                   ;- - - - - - 0x00800E 03:BFFE:
