.segment "BANK_0B"
; 0x016010-0x01800F  CPU $A000-$BFFF

ofsset_0B_A000:
	.byte $F0,$F4,$F0,$FC,$F0,$04,$F8,$F5,$F8,$FC,$F8,$04,$00,$F5,$00,$FD;- D 1 - - - 0x016010 0B:A000:
	.byte $00,$05,$08,$F4,$08,$FC,$08,$04;- D 1 - I - 0x016020 0B:A010:
ofsset_0B_A018:
	.byte $F0,$FE,$F0,$06,$F8,$F9,$F8,$FE,$F8,$01,$F8,$09,$00,$F8,$00,$00;- D 1 - I - 0x016028 0B:A018:
	.byte $00,$08,$08,$F2,$08,$FA,$08,$02;- D 1 - I - 0x016038 0B:A028:
ofsset_0B_A030:
	.byte $F1,$F4,$F1,$FC,$F1,$04,$F9,$F4,$F9,$FC,$F9,$04,$01,$F5,$01,$FD;- D 1 - I - 0x016040 0B:A030:
	.byte $01,$05,$09,$F4,$09,$FC,$09,$04;- D 1 - I - 0x016050 0B:A040:
ofsset_0B_A048:
	.byte $F0,$F2,$F0,$FA,$F8,$F2,$F8,$FA,$F8,$FA,$F8,$02,$00,$F2,$00,$FA;- D 1 - I - 0x016058 0B:A048:
	.byte $00,$02,$08,$F1,$08,$F9,$08,$01;- D 1 - I - 0x016068 0B:A058:
ofsset_0B_A060:
	.byte $EC,$F4,$EC,$FC,$F4,$F3,$F4,$FB,$F4,$03,$FC,$F3,$FC,$FB,$FC,$03;- D 1 - I - 0x016070 0B:A060:
	.byte $04,$F3,$04,$FB,$04,$03,$0C,$F6,$0C,$FE,$F1,$03;- D 1 - I - 0x016080 0B:A070:
ofsset_0B_A07C:
	.byte $F0,$F2,$F0,$FA,$F8,$F2,$F8,$FA,$F8,$FC,$00,$F1,$00,$F7,$00,$FC;- D 1 - I - 0x01608C 0B:A07C:
	.byte $08,$F1,$08,$F9,$08,$01   ;- D 1 - I - 0x01609C 0B:A08C:
ofsset_0B_A092:
	.byte $F1,$F7,$F1,$FF,$F8,$F8,$F8,$00,$00,$F8,$00,$00,$08,$F8,$08,$00;- D 1 - I - 0x0160A2 0B:A092:
	.byte $F8,$FA,$00,$FC,$FC,$F4   ;- D 1 - I - 0x0160B2 0B:A0A2:
ofsset_0B_A0A8:
	.byte $F2,$ED,$F2,$F1,$F2,$F9,$FA,$EF,$FA,$F7,$FA,$FF,$02,$F8,$02,$00;- D 1 - I - 0x0160B8 0B:A0A8:
	.byte $0A,$F5,$0A,$FD,$0A,$05   ;- D 1 - I - 0x0160C8 0B:A0B8:
ofsset_0B_A0BE:
	.byte $F1,$F7,$F1,$FF,$F8,$F8,$F8,$00,$00,$F8,$00,$00,$08,$F8,$08,$00;- D 1 - I - 0x0160CE 0B:A0BE:
	.byte $F8,$FA,$00,$00           ;- D 1 - I - 0x0160DE 0B:A0CE:
ofsset_0B_A0D2:
	.byte $F4,$FC,$FC,$FC,$03,$FC   ;- D 1 - I - 0x0160E2 0B:A0D2:
ofsset_0B_A0D8:
	.byte $F0,$F7,$F0,$FF,$F8,$F8,$F8,$00,$00,$F8,$00,$FE,$08,$F8,$08,$00;- D 1 - I - 0x0160E8 0B:A0D8:
	.byte $F8,$FA,$FD,$F6           ;- D 1 - I - 0x0160F8 0B:A0E8:
ofsset_0B_A0EC:
	.byte $F8,$FC,$00,$FC           ;- D 1 - I - 0x0160FC 0B:A0EC:
ofsset_0B_A0F0:
	.byte $F1,$F4,$F1,$FC,$F9,$F6,$F9,$FE,$01,$F6,$01,$FE,$09,$F6,$09,$FE;- D 1 - I - 0x016100 0B:A0F0:
	.byte $F9,$FB,$01,$FA           ;- D 1 - I - 0x016110 0B:A100:
ofsset_0B_A104:
	.byte $F8,$FB,$00,$FB           ;- D 1 - I - 0x016114 0B:A104:
ofsset_0B_A108:
	.byte $FA,$F9,$FD,$FD           ;- D 1 - I - 0x016118 0B:A108:
ofsset_0B_A10C:
	.byte $F4,$FC,$FC,$F8,$FC,$00,$04,$F8,$04,$00,$0C,$F8,$0C,$00;- D 1 - I - 0x01611C 0B:A10C:
ofsset_0B_A11A:
	.byte $F0,$F4,$F0,$FC,$F8,$F6,$F8,$FE,$00,$F6,$00,$FE,$08,$F6,$08,$FE;- D 1 - I - 0x01612A 0B:A11A:
	.byte $F8,$FB,$00,$FB           ;- D 1 - I - 0x01613A 0B:A12A:
ofsset_0B_A12E:
	.byte $F4,$FC,$FC,$F8,$FC,$00,$0C,$00,$04,$F8,$04,$00,$0C,$F8;- D 1 - I - 0x01613E 0B:A12E:
ofsset_0B_A13C:
	.byte $F0,$F8,$F0,$00,$F8,$F7,$F8,$FF,$00,$F8,$00,$00,$08,$F8,$08,$00;- D 1 - I - 0x01614C 0B:A13C:
	.byte $10,$00,$F8,$F7,$F8,$FF,$FF,$05,$00,$F8;- D 1 - I - 0x01615C 0B:A14C:
ofsset_0B_A156:
	.byte $F4,$FC,$FC,$F8,$FC,$00,$04,$F8,$04,$00,$0C,$00,$0C,$F8;- D 1 - I - 0x016166 0B:A156:
ofsset_0B_A164:
	.byte $F0,$F6,$F0,$FE,$F8,$F6,$F8,$FE,$FF,$F7,$FA,$FF,$07,$F7,$02,$FF;- D 1 - I - 0x016174 0B:A164:
	.byte $0F,$F7,$0A,$FF,$F0,$FE   ;- D 1 - I - 0x016184 0B:A174:
ofsset_0B_A17A:
	.byte $F3,$F8,$F3,$00,$FB,$F8,$FB,$00,$FD,$F8,$FD,$00,$05,$F8,$05,$00;- D 1 - I - 0x01618A 0B:A17A:
	.byte $EB,$FF,$0D,$00           ;- D 1 - I - 0x01619A 0B:A18A:
ofsset_0B_A18E:
	.byte $F1,$F3,$F1,$FB,$F9,$FB,$F9,$03,$F9,$F1,$F9,$F9,$01,$F9,$01,$01;- D 1 - I - 0x01619E 0B:A18E:
	.byte $09,$F9,$09,$01,$FE,$02   ;- D 1 - I - 0x0161AE 0B:A19E:
ofsset_0B_A1A4:
	.byte $03,$F6,$03,$FE,$F1,$F7,$F1,$FF,$F8,$F8,$F8,$00,$00,$F8,$00,$00;- D 1 - I - 0x0161B4 0B:A1A4:
	.byte $08,$F8,$08,$00,$F8,$FA,$00,$00;- D 1 - I - 0x0161C4 0B:A1B4:
ofsset_0B_A1BC:
	.byte $F5,$F9,$FD,$F1,$FD,$F9,$05,$F1,$F7,$01,$F7,$09,$FF,$F9,$FF,$01;- D 1 - I - 0x0161CC 0B:A1BC:
	.byte $FF,$09,$07,$F9,$F6,$FE   ;- D 1 - I - 0x0161DC 0B:A1CC:
ofsset_0B_A1D2:
	.byte $EE,$F8,$EE,$00,$F6,$F8,$F6,$00,$02,$F8,$02,$00,$0A,$F8,$0A,$00;- D 1 - I - 0x0161E2 0B:A1D2:
	.byte $E6,$FF,$12,$00           ;- D 1 - I - 0x0161F2 0B:A1E2:
ofsset_0B_A1E6:
	.byte $EF,$F7,$EF,$FF,$F7,$F7,$F7,$FF,$FF,$FF,$FF,$07,$FF,$F5,$FF,$FD;- D 1 - I - 0x0161F6 0B:A1E6:
	.byte $07,$FD,$07,$05,$FA,$F6   ;- D 1 - I - 0x016206 0B:A1F6:
ofsset_0B_A1FC:
	.byte $EB,$F8,$EB,$00,$F3,$F8,$F3,$00,$FB,$F0,$FB,$F8,$FB,$00,$03,$F8;- D 1 - I - 0x01620C 0B:A1FC:
	.byte $03,$00,$03,$04           ;- D 1 - I - 0x01621C 0B:A20C:
ofsset_0B_A210:
	.byte $F1,$FF,$F9,$EF,$F9,$F7,$F9,$FF,$01,$EF,$01,$F7,$F3,$07,$FB,$FF;- D 1 - I - 0x016220 0B:A210:
	.byte $FB,$07,$03,$FF,$02,$FA   ;- D 1 - I - 0x016230 0B:A220:
ofsset_0B_A226:
	.byte $F0,$FB,$F0,$03,$F8,$F3,$F8,$FB,$F8,$03,$00,$F3,$00,$FB,$00,$03;- D 1 - I - 0x016236 0B:A226:
	.byte $08,$F3,$08,$FB           ;- D 1 - I - 0x016246 0B:A236:
ofsset_0B_A23A:
	.byte $F0,$F6,$F0,$FE,$F8,$F3,$F8,$FB,$F8,$03,$F8,$F3,$00,$F3,$00,$FB;- D 1 - I - 0x01624A 0B:A23A:
	.byte $00,$03,$00,$03,$08,$F3,$08,$FB,$08,$03;- D 1 - I - 0x01625A 0B:A24A:
ofsset_0B_A254:
	.byte $F0,$F6,$F0,$FE,$F8,$FB,$F8,$03,$00,$FB,$00,$03,$00,$03,$08,$F3;- D 1 - I - 0x016264 0B:A254:
	.byte $08,$FB,$08,$03,$F8,$F3,$00,$F3,$F9,$EB;- D 1 - I - 0x016274 0B:A264:
ofsset_0B_A26E:
	.byte $01,$F5,$F0,$F3,$F0,$FB,$F8,$F3,$F8,$FB,$00,$F9,$00,$01,$08,$F3;- D 1 - I - 0x01627E 0B:A26E:
	.byte $08,$FB,$08,$03,$F8,$F9,$FD,$00;- D 1 - I - 0x01628E 0B:A27E:
	.byte $00,$F4,$F3,$F1,$FB,$F1   ;- - - - - - 0x016296 0B:A286:
ofsset_0B_A28C:
	.byte $E6,$F4,$E6,$FC,$EE,$F4,$EE,$FC,$EE,$00,$EE,$04,$F6,$F5,$F6,$FA;- D 1 - I - 0x01629C 0B:A28C:
	.byte $F6,$02,$FE,$F4,$FE,$F6,$FE,$FC,$FE,$04,$06,$F2,$06,$FD,$06,$05;- D 1 - I - 0x0162AC 0B:A29C:
	.byte $0E,$01                   ;- D 1 - I - 0x0162BC 0B:A2AC:
ofsset_0B_A2AE:
	.byte $F0,$EF,$F0,$F7,$F8,$EF,$F8,$F7,$00,$E8,$00,$F0,$00,$F6,$00,$FE;- D 1 - I - 0x0162BE 0B:A2AE:
	.byte $08,$F3,$08,$FB,$08,$03,$F8,$F3,$F8,$FB,$FC,$02,$00,$E4;- D 1 - I - 0x0162CE 0B:A2BE:
ofsset_0B_A2CC:
	.byte $EF,$F8,$EF,$00,$EF,$08,$F7,$F5,$F7,$FD,$F7,$05,$FF,$F3,$FF,$FB;- D 1 - I - 0x0162DC 0B:A2CC:
	.byte $FF,$FC,$07,$F7           ;- D 1 - I - 0x0162EC 0B:A2DC:
ofsset_0B_A2E0:
	.byte $ED,$F9,$ED,$01,$ED,$09,$F5,$F6,$F5,$FE,$F5,$06,$F5,$E6,$F5,$EE;- D 1 - I - 0x0162F0 0B:A2E0:
	.byte $FD,$E6,$FD,$EE,$FD,$F6,$05,$F8,$0D,$F9,$FD,$FD;- D 1 - I - 0x016300 0B:A2F0:
ofsset_0B_A2FC:
	.byte $F2,$08,$F2,$00,$F2,$F8,$FA,$F5,$FA,$FD,$FA,$05,$02,$F2,$02,$FA;- D 1 - I - 0x01630C 0B:A2FC:
	.byte $02,$02,$02,$06,$FD,$EA,$0A,$FA;- D 1 - I - 0x01631C 0B:A30C:
ofsset_0B_A314:
	.byte $F1,$FF,$F1,$F7,$F1,$EF,$F9,$FA,$F9,$F2,$01,$02,$01,$FA,$01,$F2;- D 1 - I - 0x016324 0B:A314:
	.byte $09,$FF,$09,$F7,$09,$EF,$F9,$FE,$F9,$F6,$FC,$03;- D 1 - I - 0x016334 0B:A324:
ofsset_0B_A330:
	.byte $F6,$08,$F6,$00,$F6,$F8,$FE,$F4,$FE,$FC,$FE,$04,$06,$F2,$06,$FA;- D 1 - I - 0x016340 0B:A330:
	.byte $0E,$FA                   ;- D 1 - I - 0x016350 0B:A340:
ofsset_0B_A342:
	.byte $F0,$F8,$F0,$00,$F8,$F2,$F8,$FA,$F8,$02,$00,$EA,$00,$F2,$00,$FA;- D 1 - I - 0x016352 0B:A342:
	.byte $FE,$02,$08,$F2,$08,$FA,$F8,$F2,$F8,$FA,$FA,$02;- D 1 - I - 0x016362 0B:A352:
ofsset_0B_A35E:
	.byte $FA,$F5,$FA,$FB,$FA,$03,$FA,$0B,$02,$F4,$02,$FC,$02,$02,$02,$0A;- D 1 - I - 0x01636E 0B:A35E:
	.byte $0A,$F9,$0A,$01,$0A,$09   ;- D 1 - I - 0x01637E 0B:A36E:
ofsset_0B_A374:
	.byte $ED,$F4,$ED,$FC,$F5,$F3,$F5,$FB,$F5,$03,$FD,$F3,$FD,$FB,$FD,$03;- D 1 - I - 0x016384 0B:A374:
	.byte $05,$F3,$05,$FB,$05,$03,$0D,$F3,$0D,$FB,$0D,$03,$F2,$03;- D 1 - I - 0x016394 0B:A384:
ofsset_0B_A392:
	.byte $F7,$FC,$F7,$04,$F7,$0C,$FF,$03,$FF,$0B,$07,$02,$07,$0A,$F7,$EE;- D 1 - I - 0x0163A2 0B:A392:
	.byte $F7,$F6,$EF,$EC,$EF,$F4,$FF,$F5,$FF,$FD,$07,$FA;- D 1 - I - 0x0163B2 0B:A3A2:
ofsset_0B_A3AE:
	.byte $E8,$F3,$E8,$FB,$F0,$F3,$F0,$FB,$F0,$03,$F8,$F3,$F8,$FB,$F8,$03;- - - - - - 0x0163BE 0B:A3AE:
	.byte $F8,$0B,$00,$F3,$00,$FB,$00,$03,$00,$0B,$08,$F8,$08,$01,$F0,$F7;- - - - - - 0x0163CE 0B:A3BE:
	.byte $00,$F9,$00,$01,$08,$F8,$08,$01;- - - - - - 0x0163DE 0B:A3CE:
ofsset_0B_A3D6:
	.byte $F0,$F3,$F0,$FB,$F8,$F3,$F8,$FB,$00,$F9,$00,$01,$08,$F3,$08,$FB;- D 1 - I - 0x0163E6 0B:A3D6:
	.byte $08,$03,$F8,$F9,$FD,$00,$01,$F4;- D 1 - I - 0x0163F6 0B:A3E6:
ofsset_0B_A3EE:
	.byte $F0,$F3,$F0,$FB,$F8,$F3,$F8,$FB,$00,$F9,$00,$01,$08,$F3,$08,$FB;- D 1 - I - 0x0163FE 0B:A3EE:
	.byte $08,$03,$F8,$F9,$FD,$00,$F0,$EC,$F8,$ED,$00,$EF;- D 1 - I - 0x01640E 0B:A3FE:
ofsset_0B_A40A:
	.byte $E2,$F5,$EA,$F5,$EA,$FD,$EA,$05,$F2,$F3,$F2,$FB,$F2,$03,$FA,$F2;- D 1 - I - 0x01641A 0B:A40A:
	.byte $FA,$FA,$FA,$02,$02,$FA,$02,$02,$0A,$FA,$0A,$02;- D 1 - I - 0x01642A 0B:A41A:
ofsset_0B_A426:
	.byte $F4,$FF,$F4,$07,$FC,$EF,$FC,$FF,$FC,$07,$04,$F5,$04,$FD,$04,$05;- D 1 - I - 0x016436 0B:A426:
	.byte $0C,$FF,$FC,$F7           ;- D 1 - I - 0x016446 0B:A436:
ofsset_0B_A43A:
	.byte $F2,$F7,$F2,$FF,$F2,$04,$F2,$0C,$FA,$F6,$FA,$FE,$FA,$06,$FA,$06;- D 1 - I - 0x01644A 0B:A43A:
	.byte $FA,$0E,$02,$F6,$02,$FE,$02,$06,$0A,$FD;- D 1 - I - 0x01645A 0B:A44A:
ofsset_0B_A454:
	.byte $F7,$FE,$F7,$06,$F7,$0E,$FF,$FE,$FF,$06,$F1,$02,$EE,$0A,$EF,$10;- D 1 - I - 0x016464 0B:A454:
	.byte $F6,$0A,$F7,$10,$FF,$09,$FF,$10,$07,$FE,$FF,$F6;- D 1 - I - 0x016474 0B:A464:
ofsset_0B_A470:
	.byte $F1,$F4,$F1,$FC,$F9,$F3,$F9,$FD,$F9,$05,$F9,$F9,$01,$FA,$01,$02;- D 1 - I - 0x016480 0B:A470:
	.byte $01,$FD,$01,$06,$09,$FB,$09,$03;- D 1 - I - 0x016490 0B:A480:
ofsset_0B_A488:
	.byte $EE,$03,$EE,$0B,$F6,$EF,$F6,$F9,$F6,$01,$F6,$09,$F6,$11,$FE,$EE;- D 1 - I - 0x016498 0B:A488:
	.byte $FE,$F6,$FE,$FE,$FE,$0A,$06,$EE,$06,$F6,$06,$FE,$F6,$F3,$FE,$02;- D 1 - I - 0x0164A8 0B:A498:
ofsset_0B_A4A8:
	.byte $03,$03,$0B,$04,$03,$07,$03,$0F,$0B,$07,$0B,$0F,$03,$EF,$03,$F7;- D 1 - I - 0x0164B8 0B:A4A8:
	.byte $03,$FF,$0B,$F0,$0B,$F8,$0B,$FF;- D 1 - I - 0x0164C8 0B:A4B8:
ofsset_0B_A4C0:
	.byte $FB,$0A,$03,$03,$03,$0B,$0B,$07,$0B,$0F,$03,$EF,$03,$F7,$03,$FF;- D 1 - I - 0x0164D0 0B:A4C0:
	.byte $0B,$F0,$0B,$F8,$0B,$FF,$0B,$04,$03,$03;- D 1 - I - 0x0164E0 0B:A4D0:
ofsset_0B_A4DA:
	.byte $F0,$F4,$F0,$FC,$F8,$EC,$F8,$F4,$F8,$FC,$00,$F3,$00,$03,$08,$F4;- D 1 - I - 0x0164EA 0B:A4DA:
	.byte $08,$FC,$08,$04,$00,$F7,$FF,$FB,$05,$FD;- D 1 - I - 0x0164FA 0B:A4EA:
ofsset_0B_A4F4:
	.byte $EC,$F9,$EC,$01,$F4,$F1,$F4,$F9,$F4,$01,$FC,$F3,$FC,$FA,$FC,$01;- D 1 - I - 0x016504 0B:A4F4:
	.byte $04,$F9,$04,$01,$0C,$FA,$0C,$02;- D 1 - I - 0x016514 0B:A504:
ofsset_0B_A50C:
	.byte $ED,$F4,$ED,$FC,$F5,$F4,$F5,$FC,$FD,$F5,$FD,$F9,$FD,$FE,$05,$F4;- D 1 - I - 0x01651C 0B:A50C:
	.byte $05,$FC,$0D,$F9           ;- D 1 - I - 0x01652C 0B:A51C:
ofsset_0B_A520:
	.byte $F1,$F9,$F1,$04,$F1,$0C,$F9,$FC,$F9,$04,$F9,$09,$01,$FC,$01,$04;- D 1 - I - 0x016530 0B:A520:
	.byte $09,$F4,$09,$FC,$09,$04,$F1,$01,$F9,$FC;- D 1 - I - 0x016540 0B:A530:
ofsset_0B_A53A:
	.byte $FE,$FA,$FE,$02,$FE,$0A,$FE,$0D,$06,$FA,$06,$02,$06,$0A,$06,$0D;- D 1 - I - 0x01654A 0B:A53A:
	.byte $0E,$05,$0E,$0D           ;- D 1 - I - 0x01655A 0B:A54A:
ofsset_0B_A54E:
	.byte $F3,$FB,$F1,$FF,$F3,$07,$FB,$FB,$F9,$FF,$FB,$07,$FB,$F7,$00,$F3;- D 1 - I - 0x01655E 0B:A54E:
	.byte $02,$FF,$08,$EF,$08,$F7,$FB,$FF,$00,$FB;- D 1 - I - 0x01656E 0B:A55E:
ofsset_0B_A568:
	.byte $EB,$F3,$EB,$FB,$F3,$ED,$F3,$F5,$F3,$FD,$F3,$05,$FB,$ED,$FB,$F5;- D 1 - I - 0x016578 0B:A568:
	.byte $FB,$FD,$FB,$05,$03,$F3,$03,$FB,$03,$03,$0B,$FA,$0B,$02;- D 1 - I - 0x016588 0B:A578:
ofsset_0B_A586:
	.byte $EB,$F3,$EB,$FB,$F3,$ED,$F3,$F5,$F3,$FD,$F3,$05,$FB,$ED,$FB,$F5;- D 1 - I - 0x016596 0B:A586:
	.byte $FB,$FD,$FB,$05,$03,$F3,$03,$FB,$03,$03,$0B,$F3,$0B,$FB;- D 1 - I - 0x0165A6 0B:A596:
ofsset_0B_A5A4:
	.byte $ED,$F4,$ED,$FC,$F5,$ED,$F5,$F5,$F5,$FD,$F5,$05,$FD,$ED,$FD,$F5;- - - - - - 0x0165B4 0B:A5A4:
	.byte $FD,$FD,$FD,$05,$05,$ED,$05,$F5,$05,$FD,$05,$06,$0D,$EF,$0D,$FD;- - - - - - 0x0165C4 0B:A5B4:
	.byte $F5,$F6,$0D,$F5,$15,$F1,$15,$FA;- - - - - - 0x0165D4 0B:A5C4:
ofsset_0B_A5CC:
	.byte $F0,$FA,$F0,$02,$F8,$F4,$F8,$FC,$F8,$04,$00,$F7,$00,$05,$00,$0D;- D 1 - I - 0x0165DC 0B:A5CC:
	.byte $FA,$FC,$FA,$04,$02,$FB,$02,$03,$0A,$FD,$0A,$05;- D 1 - I - 0x0165EC 0B:A5DC:
ofsset_0B_A5E8:
	.byte $F0,$F9,$F0,$01,$F8,$FB,$F8,$03,$F8,$0B,$00,$F7,$00,$0B,$0A,$FB;- D 1 - I - 0x0165F8 0B:A5E8:
	.byte $07,$03,$FA,$FE,$FF,$06,$02,$FE,$07,$F6;- D 1 - I - 0x016608 0B:A5F8:
ofsset_0B_A602:
	.byte $F3,$F5,$F3,$FD,$F3,$05,$F9,$F4,$F9,$FC,$FA,$05,$00,$F7,$F5,$FD;- D 1 - I - 0x016612 0B:A602:
	.byte $FD,$FD,$FD,$05,$05,$FD,$05,$05;- D 1 - I - 0x016622 0B:A612:
ofsset_0B_A61A:
	.byte $F3,$F3,$F3,$FA,$FB,$F3,$FC,$F9,$03,$F3,$04,$F9,$01,$01,$F3,$FD;- D 1 - I - 0x01662A 0B:A61A:
	.byte $F3,$05,$FB,$F5,$FB,$FD,$FB,$05;- D 1 - I - 0x01663A 0B:A62A:
ofsset_0B_A632:
	.byte $F3,$F3,$F3,$FB,$FB,$F3,$FB,$FB,$03,$FB,$F7,$01,$FE,$F3,$FF,$FC;- D 1 - I - 0x016642 0B:A632:
	.byte $FF,$04,$05,$F3,$05,$FB,$05,$03;- D 1 - I - 0x016652 0B:A642:
ofsset_0B_A64A:
	.byte $FD,$F3,$FD,$FB,$FD,$03,$05,$F3,$05,$FB,$F7,$F7,$F4,$FF,$F5,$05;- D 1 - I - 0x01665A 0B:A64A:
	.byte $FC,$FF,$FD,$05,$05,$FE,$05,$05;- D 1 - I - 0x01666A 0B:A65A:
ofsset_0B_A662:
	.byte $FE,$FA,$FB,$FF           ;- D 1 - I - 0x016672 0B:A662:
ofsset_0B_A666:
	.byte $FC,$FE                   ;- D 1 - I - 0x016676 0B:A666:
ofsset_0B_A668:
	.byte $F9,$FC,$01,$FC           ;- D 1 - I - 0x016678 0B:A668:
ofsset_0B_A66C:
	.byte $FC,$F9,$FC,$01           ;- D 1 - I - 0x01667C 0B:A66C:
ofsset_0B_A670:
	.byte $FA,$FC                   ;- D 1 - I - 0x016680 0B:A670:
ofsset_0B_A672:
	.byte $FC,$FA                   ;- D 1 - I - 0x016682 0B:A672:
ofsset_0B_A674:
	.byte $F7,$FC,$FF,$FC           ;- D 1 - I - 0x016684 0B:A674:
ofsset_0B_A678:
	.byte $FC,$F7,$FC,$FF           ;- D 1 - I - 0x016688 0B:A678:
ofsset_0B_A67C:
	.byte $FE,$FC                   ;- D 1 - I - 0x01668C 0B:A67C:
ofsset_0B_A67E:
	.byte $F0,$F8,$F0,$00,$F8,$F0,$F8,$F8,$F8,$00,$00,$ED,$00,$F5,$00,$FD;- D 1 - I - 0x01668E 0B:A67E:
	.byte $00,$05,$08,$F5,$08,$FD,$F9,$04,$00,$E8;- D 1 - I - 0x01669E 0B:A68E:
ofsset_0B_A698:
	.byte $F0,$FB,$F0,$03,$F8,$FD,$F8,$03,$F8,$0B,$FF,$F9,$00,$01,$00,$09;- D 1 - I - 0x0166A8 0B:A698:
	.byte $07,$F3,$07,$FB,$07,$03,$00,$F9,$00,$01;- D 1 - I - 0x0166B8 0B:A6A8:
ofsset_0B_A6B2:
	.byte $E8,$FA,$E8,$02,$F0,$F2,$F0,$FA,$F0,$02,$F0,$0A,$F8,$F2,$F8,$FA;- D 1 - I - 0x0166C2 0B:A6B2:
	.byte $F8,$02,$F8,$0A,$02,$F0,$00,$F8,$00,$00,$00,$08,$08,$F8,$08,$00;- D 1 - I - 0x0166D2 0B:A6C2:
	.byte $F5,$FD,$00,$FB           ;- D 1 - I - 0x0166E2 0B:A6D2:
ofsset_0B_A6D6:
	.byte $F8,$38,$F8,$40,$00,$38,$00,$40,$08,$38,$08,$40,$00,$30,$08,$F8;- D 1 - I - 0x0166E6 0B:A6D6:
	.byte $08,$00,$08,$08,$08,$10,$08,$18,$00,$00,$00,$10,$F8,$30;- D 1 - I - 0x0166F6 0B:A6E6:
ofsset_0B_A6F4:
	.byte $EB,$F4,$EB,$FC,$EB,$04,$F3,$F0,$F3,$F8,$F3,$00,$F3,$08,$FB,$F0;- D 1 - I - 0x016704 0B:A6F4:
	.byte $FB,$F8,$FB,$00,$FB,$08,$03,$F0,$03,$F8,$03,$00,$FB,$F8;- D 1 - I - 0x016714 0B:A704:
ofsset_0B_A712:
	.byte $00,$00,$00,$08,$08,$00,$00,$24,$00,$2C,$08,$2C,$26,$00,$2E,$00;- D 1 - I - 0x016722 0B:A712:
	.byte $2E,$08,$26,$2C,$2E,$24,$2E,$2C;- D 1 - I - 0x016732 0B:A722:
ofsset_0B_A72A:
	.byte $F7,$06,$F0,$F4,$F0,$FC,$F0,$04,$F8,$F5,$F8,$FC,$F8,$04,$00,$F5;- D 1 - I - 0x01673A 0B:A72A:
	.byte $00,$FD,$00,$05,$08,$F4,$08,$FC,$08,$04;- D 1 - I - 0x01674A 0B:A73A:
ofsset_0B_A744:
	.byte $EC,$F7,$EC,$FF,$F4,$F7,$F4,$FF,$F4,$07,$FC,$EF,$FC,$F7,$FC,$FF;- D 1 - I - 0x016754 0B:A744:
	.byte $FC,$07,$04,$F8,$04,$00,$0C,$F7,$0C,$FF,$F3,$FA;- D 1 - I - 0x016764 0B:A754:
ofsset_0B_A760:
	.byte $EC,$F4,$EC,$FC,$F4,$F2,$F4,$FA,$F4,$02,$FC,$F0,$FC,$F8,$FC,$00;- D 1 - I - 0x016770 0B:A760:
	.byte $04,$F4,$04,$FC,$0C,$F2,$0C,$FA,$F3,$F8;- D 1 - I - 0x016780 0B:A770:
ofsset_0B_A77A:
	.byte $EC,$F6,$EC,$FE,$F4,$F1,$F4,$F9,$F4,$01,$FC,$EE,$FC,$F6,$FC,$FE;- - - - - - 0x01678A 0B:A77A:
	.byte $FC,$06,$04,$EE,$04,$F6,$04,$FE,$0C,$F6,$0C,$FE;- - - - - - 0x01679A 0B:A78A:
ofsset_0B_A796:
	.byte $EC,$01,$EC,$F9,$F4,$01,$F4,$F9,$F4,$F1,$FC,$09,$FC,$01,$FC,$F9;- - - - - - 0x0167A6 0B:A796:
	.byte $FC,$F1,$04,$00,$04,$F8,$0C,$01,$0C,$F9,$F3,$FE;- - - - - - 0x0167B6 0B:A7A6:
ofsset_0B_A7B2:
	.byte $EC,$04,$EC,$FC,$F4,$06,$F4,$FE,$F4,$F6,$FC,$08,$FC,$00,$FC,$F8;- - - - - - 0x0167C2 0B:A7B2:
	.byte $04,$04,$04,$FC,$0C,$06,$0C,$FE,$F3,$00;- - - - - - 0x0167D2 0B:A7C2:
ofsset_0B_A7CC:
	.byte $EC,$02,$EC,$FA,$F4,$07,$F4,$FF,$F4,$F7,$FC,$0A,$FC,$02,$FC,$FA;- - - - - - 0x0167DC 0B:A7CC:
	.byte $FC,$F2,$04,$0A,$04,$02,$04,$FA,$0C,$02,$0C,$FA;- - - - - - 0x0167EC 0B:A7DC:
ofsset_0B_A7E8:
	.byte $EC,$F4,$EC,$FC,$F4,$EB,$F4,$F3,$F4,$FB,$F4,$03,$FC,$F3,$FC,$FB;- D 1 - I - 0x0167F8 0B:A7E8:
	.byte $FC,$03,$04,$F6,$04,$FE,$0C,$F6,$0C,$FE;- D 1 - I - 0x016808 0B:A7F8:
ofsset_0B_A802:
	.byte $EC,$EA,$EC,$F2,$F4,$EA,$F4,$F2,$F4,$FA,$FC,$EB,$FC,$F3,$FC,$FB;- D 1 - I - 0x016812 0B:A802:
	.byte $04,$F2,$04,$FA,$0C,$F2,$0C,$FA;- D 1 - I - 0x016822 0B:A812:
ofsset_0B_A81A:
	.byte $EC,$F4,$EC,$FC,$F4,$F2,$F4,$FA,$F4,$02,$FC,$F0,$FC,$F8,$FC,$00;- D 1 - I - 0x01682A 0B:A81A:
	.byte $04,$F1,$04,$F9,$04,$01,$F3,$F8;- D 1 - I - 0x01683A 0B:A82A:
ofsset_0B_A832:
	.byte $F0,$F5,$F0,$FD,$F8,$F5,$F8,$FC,$F8,$FF,$FF,$F6,$00,$F9,$00,$01;- D 1 - I - 0x016842 0B:A832:
	.byte $00,$FF,$08,$F5,$08,$FD,$08,$05,$F8,$FB,$F5,$03;- D 1 - I - 0x016852 0B:A842:
ofsset_0B_A84E:
	.byte $F0,$EF,$F0,$F7,$F8,$EF,$F8,$F7,$01,$E8,$00,$F0,$00,$F6,$00,$FE;- D 1 - I - 0x01685E 0B:A84E:
	.byte $08,$F3,$08,$FB,$08,$03,$F8,$F3,$F8,$FB,$FC,$02;- D 1 - I - 0x01686E 0B:A85E:
ofsset_0B_A86A:
	.byte $FC,$F8,$FC,$00           ;- D 1 - I - 0x01687A 0B:A86A:
ofsset_0B_A86E:
	.byte $F2,$F3,$F2,$FB,$F2,$03,$FA,$F3,$FA,$FB,$FA,$03,$FC,$0B,$02,$F7;- D 1 - I - 0x01687E 0B:A86E:
	.byte $02,$FF,$02,$07,$0A,$FB,$0A,$03,$0A,$0B,$FA,$03,$02,$FF,$02,$07;- D 1 - I - 0x01688E 0B:A87E:
ofsset_0B_A88E:
	.byte $F0,$EE,$F3,$F6,$F0,$01,$F0,$09,$F8,$EE,$F8,$F6,$F8,$FE,$F8,$06;- D 1 - I - 0x01689E 0B:A88E:
	.byte $F8,$0E,$00,$EE,$00,$F6,$00,$FE,$00,$06,$00,$F6,$FD,$FE;- D 1 - I - 0x0168AE 0B:A89E:
ofsset_0B_A8AC:
	.byte $03,$EF,$03,$F7,$03,$FD,$03,$06,$03,$0E,$0B,$EF,$0B,$F7,$0B,$FF;- D 1 - I - 0x0168BC 0B:A8AC:
	.byte $0B,$07,$0B,$0F,$13,$07,$13,$0F,$03,$FF,$0B,$FC,$FB,$07,$FB,$0F;- D 1 - I - 0x0168CC 0B:A8BC:
ofsset_0B_A8CC:
	.byte $EB,$F2,$EB,$FA,$F3,$F2,$F3,$FA,$FB,$ED,$FB,$F5,$FB,$FD,$03,$F3;- D 1 - I - 0x0168DC 0B:A8CC:
	.byte $03,$FB,$03,$03,$0B,$F2,$0B,$FD,$0B,$05,$F3,$F2,$03,$F5,$03,$FD;- D 1 - I - 0x0168EC 0B:A8DC:
	.byte $F2,$DD,$F2,$E5,$F2,$ED,$FA,$E5,$FA,$ED;- D 1 - I - 0x0168FC 0B:A8EC:
ofsset_0B_A8F6:
	.byte $EC,$F2,$EC,$FA,$F4,$F0,$F4,$F8,$F4,$00,$FC,$E5,$FC,$ED,$FC,$F5;- D 1 - I - 0x016906 0B:A8F6:
	.byte $FC,$FD,$FC,$05,$04,$EB,$04,$F3,$04,$FB,$04,$03,$0C,$F2,$0C,$FE;- D 1 - I - 0x016916 0B:A906:
	.byte $F4,$F0                   ;- D 1 - I - 0x016926 0B:A916:
ofsset_0B_A918:
	.byte $EB,$F2,$EB,$FA,$F3,$F2,$F3,$FA,$FB,$ED,$FB,$F5,$FB,$FD,$03,$F3;- D 1 - I - 0x016928 0B:A918:
	.byte $03,$FB,$03,$03,$0B,$F2,$0B,$FD,$0B,$05,$F3,$F2,$03,$F5,$03,$FD;- D 1 - I - 0x016938 0B:A928:
	.byte $E6,$F5,$E6,$FD,$EB,$EE,$F3,$EE;- D 1 - I - 0x016948 0B:A938:
ofsset_0B_A940:
	.byte $F0,$F0,$F0,$F8,$F0,$00,$F8,$E8,$F8,$F0,$F8,$F8,$F8,$00,$00,$ED;- D 1 - I - 0x016950 0B:A940:
	.byte $00,$F5,$00,$FD,$08,$F0,$06,$F7,$08,$FF,$F7,$F0,$00,$FC;- D 1 - I - 0x016960 0B:A950:
ofsset_0B_A95E:
	.byte $E9,$F9,$E9,$01,$F1,$F4,$F1,$FC,$F1,$04,$F9,$F4,$F9,$FC,$F9,$04;- D 1 - I - 0x01696E 0B:A95E:
	.byte $01,$F9,$01,$01,$09,$F9,$09,$01,$F1,$FC;- D 1 - I - 0x01697E 0B:A96E:
ofsset_0B_A978:
	.byte $EA,$FE,$EA,$06,$F2,$FE,$F2,$06,$F2,$0E,$FA,$EB,$FA,$F3,$FA,$FB;- D 1 - I - 0x016988 0B:A978:
	.byte $FA,$01,$FA,$09,$FA,$11,$02,$EB,$02,$F3,$02,$FB,$02,$03,$02,$0B;- D 1 - I - 0x016998 0B:A988:
	.byte $02,$13,$0A,$0B           ;- D 1 - I - 0x0169A8 0B:A998:
ofsset_0B_A99C:
	.byte $F2,$F3,$F2,$FB,$FA,$F1,$FA,$F9,$FA,$01,$02,$F0,$02,$F8,$02,$00;- D 1 - I - 0x0169AC 0B:A99C:
	.byte $0A,$F0,$0A,$F8,$0A,$00,$FA,$F8,$02,$F8,$02,$00,$0A,$F0,$0A,$F8;- D 1 - I - 0x0169BC 0B:A9AC:
ofsset_0B_A9BC:
	.byte $EE,$0B,$F6,$13,$F6,$0B,$F6,$03,$F6,$FB,$F6,$F3,$F6,$EB,$FE,$11;- D 1 - I - 0x0169CC 0B:A9BC:
	.byte $FE,$09,$FE,$01,$FE,$FB,$FE,$F3,$FE,$EB,$06,$0E,$06,$06,$06,$FE;- D 1 - I - 0x0169DC 0B:A9CC:
	.byte $0E,$06,$0E,$FE           ;- D 1 - I - 0x0169EC 0B:A9DC:
ofsset_0B_A9E0:
	.byte $F0,$05,$F0,$FD,$F8,$07,$F8,$FF,$F8,$F7,$00,$08,$00,$00,$00,$F8;- D 1 - I - 0x0169F0 0B:A9E0:
	.byte $08,$08,$08,$00,$08,$F8,$F8,$00,$00,$00,$00,$F8,$08,$08,$08,$00;- D 1 - I - 0x016A00 0B:A9F0:
ofsset_0B_AA00:
	.byte $E9,$FF,$E9,$F7,$F1,$04,$F1,$FC,$F1,$F4,$F9,$04,$F9,$FC,$F9,$F4;- D 1 - I - 0x016A10 0B:AA00:
	.byte $01,$FF,$01,$F7,$09,$FF,$09,$F7,$F1,$FC;- D 1 - I - 0x016A20 0B:AA10:
ofsset_0B_AA1A:
	.byte $E4,$F7,$EC,$F2,$EC,$FA,$F4,$ED,$F4,$F5,$F4,$FD,$FC,$F5,$FC,$FD;- D 1 - I - 0x016A2A 0B:AA1A:
	.byte $04,$ED,$04,$F5,$04,$FD,$0C,$F1,$0C,$FD,$E5,$FD,$E5,$05,$ED,$FD;- D 1 - I - 0x016A3A 0B:AA2A:
	.byte $ED,$05                   ;- D 1 - I - 0x016A4A 0B:AA3A:
ofsset_0B_AA3C:
	.byte $EC,$F2,$EC,$FA,$F4,$ED,$F4,$F5,$F4,$FD,$FC,$EC,$FC,$F4,$FC,$FC;- D 1 - I - 0x016A4C 0B:AA3C:
	.byte $04,$ED,$04,$F5,$04,$FD,$0C,$F1,$0C,$FD,$ED,$E0,$ED,$E8,$F5,$E0;- D 1 - I - 0x016A5C 0B:AA4C:
	.byte $F5,$E8,$F4,$F5           ;- D 1 - I - 0x016A6C 0B:AA5C:
ofsset_0B_AA60:
	.byte $05,$FA,$EE,$EC,$EE,$F4,$F6,$EC,$F6,$F4,$F6,$FC,$FE,$EC,$FE,$F4;- D 1 - I - 0x016A70 0B:AA60:
	.byte $FE,$FC,$06,$EC,$06,$F4,$06,$FC,$0E,$FC,$F6,$EC,$03,$E2,$03,$EA;- D 1 - I - 0x016A80 0B:AA70:
	.byte $0B,$E2,$0B,$EA           ;- D 1 - I - 0x016A90 0B:AA80:
ofsset_0B_AA84:
	.byte $F8,$F7,$F8,$FF,$00,$F7,$00,$FF;- D 1 - I - 0x016A94 0B:AA84:
ofsset_0B_AA8C:
	.byte $F5,$F4,$F5,$FC,$FD,$F4,$FD,$FC;- D 1 - I - 0x016A9C 0B:AA8C:
ofsset_0B_AA94:
	.byte $F6,$F8,$F6,$00,$FE,$F8,$FE,$00;- D 1 - I - 0x016AA4 0B:AA94:
ofsset_0B_AA9C:
	.byte $FB,$FC,$FB,$F4,$03,$FC,$03,$F4;- D 1 - I - 0x016AAC 0B:AA9C:
ofsset_0B_AAA4:
	.byte $FA,$00,$FA,$F8,$02,$00,$02,$F8;- D 1 - I - 0x016AB4 0B:AAA4:
ofsset_0B_AAAC:
	.byte $FB,$FC,$FB,$04,$03,$FC,$03,$04;- D 1 - I - 0x016ABC 0B:AAAC:
ofsset_0B_AAB4:
	.byte $F8,$01,$F8,$F9,$00,$01,$00,$F9;- D 1 - I - 0x016AC4 0B:AAB4:
ofsset_0B_AABC:
	.byte $F5,$04,$F5,$FC,$FD,$04,$FD,$FC;- D 1 - I - 0x016ACC 0B:AABC:
ofsset_0B_AAC4:
	.byte $EC,$F1,$EC,$F9,$EC,$01,$EC,$09,$F4,$F1,$F4,$F9,$F4,$01,$F4,$09;- D 1 - I - 0x016AD4 0B:AAC4:
	.byte $FC,$F9,$FC,$01,$FC,$09,$04,$F8,$04,$00,$0C,$FB,$F3,$04;- D 1 - I - 0x016AE4 0B:AAD4:
ofsset_0B_AAE2:
	.byte $FA,$FE,$FA,$06,$FA,$0E,$FA,$16,$02,$F8,$02,$00,$02,$08,$02,$10;- D 1 - I - 0x016AF2 0B:AAE2:
	.byte $0A,$F8,$0A,$00,$0A,$08,$0A,$10,$02,$00,$02,$10;- D 1 - I - 0x016B02 0B:AAF2:
ofsset_0B_AAFE:
	.byte $EC,$F5,$EC,$FD,$F4,$F6,$F4,$FE,$FC,$F5,$FC,$FD,$FC,$05,$04,$F5;- D 1 - I - 0x016B0E 0B:AAFE:
	.byte $04,$FD,$0C,$F4,$0C,$FC,$F3,$F4;- D 1 - I - 0x016B1E 0B:AB0E:
ofsset_0B_AB16:
	.byte $EC,$F7,$EC,$FF,$F4,$E9,$F4,$F1,$F4,$F9,$F4,$01,$F4,$09,$FC,$E9;- D 1 - I - 0x016B26 0B:AB16:
	.byte $FC,$F1,$FC,$F9,$FC,$01,$FC,$09,$04,$F7,$04,$FF,$0C,$F8,$0C,$00;- D 1 - I - 0x016B36 0B:AB26:
ofsset_0B_AB36:
	.byte $EC,$03,$EC,$FB,$F4,$02,$F4,$FA,$FC,$03,$FC,$FB,$FC,$F3,$04,$F8;- D 1 - I - 0x016B46 0B:AB36:
	.byte $04,$00,$0C,$F9,$0C,$01,$F3,$04;- D 1 - I - 0x016B56 0B:AB46:
ofsset_0B_AB4E:
	.byte $EC,$F8,$EC,$00,$F4,$EA,$F4,$F2,$F4,$FA,$F4,$02,$F4,$0A,$FC,$EA;- D 1 - I - 0x016B5E 0B:AB4E:
	.byte $FC,$F2,$FC,$FA,$FC,$02,$FC,$0A,$04,$F9,$04,$01,$0C,$FA,$0C,$02;- D 1 - I - 0x016B6E 0B:AB5E:
	.byte $F3,$FD                   ;- D 1 - I - 0x016B7E 0B:AB6E:
ofsset_0B_AB70:
	.byte $F1,$F8,$F1,$00,$F9,$F8,$F9,$FC,$F9,$00,$01,$F8,$01,$FB,$01,$00;- D 1 - I - 0x016B80 0B:AB70:
	.byte $09,$F8,$09,$FC,$09,$00   ;- D 1 - I - 0x016B90 0B:AB80:
ofsset_0B_AB86:
	.byte $F1,$F4,$F2,$FC,$F1,$04,$F9,$F4,$FA,$FC,$F9,$04,$01,$F4,$01,$FC;- D 1 - I - 0x016B96 0B:AB86:
	.byte $01,$04,$09,$F4,$09,$FC,$09,$04,$01,$03,$F4,$EC,$04,$EC,$01,$FC;- D 1 - I - 0x016BA6 0B:AB96:
ofsset_0B_ABA6:
	.byte $F0,$F8,$F0,$00,$F8,$F8,$F8,$FC,$F8,$00,$00,$F8,$00,$FB,$00,$00;- D 1 - I - 0x016BB6 0B:ABA6:
	.byte $08,$F8,$08,$FC,$08,$00   ;- D 1 - I - 0x016BC6 0B:ABB6:
ofsset_0B_ABBC:
	.byte $FA,$F4,$F1,$F4,$F2,$FC,$F1,$04,$F9,$F4,$FA,$FC,$F9,$04,$01,$F4;- D 1 - I - 0x016BCC 0B:ABBC:
	.byte $01,$FC,$01,$04,$09,$F4,$09,$FC,$09,$04,$01,$03,$FC,$EC,$01,$FC;- D 1 - I - 0x016BDC 0B:ABCC:
ofsset_0B_ABDC:
	.byte $EC,$F4,$EC,$FC,$F4,$EB,$F4,$F3,$F4,$FB,$F4,$03,$FC,$F3,$FC,$FB;- D 1 - I - 0x016BEC 0B:ABDC:
	.byte $FC,$03,$04,$F6,$04,$FE,$0C,$F5,$0C,$FD;- D 1 - I - 0x016BFC 0B:ABEC:
ofsset_0B_ABF6:
	.byte $ED,$F4,$ED,$FC,$F5,$EB,$F5,$F3,$F5,$FB,$F5,$03,$FD,$F3,$FD,$FB;- D 1 - I - 0x016C06 0B:ABF6:
	.byte $FD,$03,$05,$F3,$05,$FB,$05,$03,$0D,$F2,$0D,$FA,$0D,$02;- D 1 - I - 0x016C16 0B:AC06:
ofsset_0B_AC14:
	.byte $DE,$FC,$E6,$F8,$E6,$00,$E6,$FE,$EE,$F4,$EE,$FC,$EE,$04,$EE,$FC;- D 1 - I - 0x016C24 0B:AC14:
	.byte $F6,$F4,$F6,$FC,$F6,$04,$F6,$F8,$F6,$00,$FE,$F4,$FE,$FC,$FE,$04;- D 1 - I - 0x016C34 0B:AC24:
	.byte $FE,$F8,$FE,$00,$06,$F8,$06,$00,$06,$F8,$06,$00,$0E,$F8,$0E,$00;- D 1 - I - 0x016C44 0B:AC34:
ofsset_0B_AC44:
	.byte $F0,$F8,$F0,$00,$F8,$F8,$F8,$00,$00,$F8,$00,$00,$08,$F8,$08,$00;- - - - - - 0x016C54 0B:AC44:
ofsset_0B_AC54:
	.byte $F0,$F8,$F8,$F6,$F8,$FE,$F8,$06,$00,$F7,$00,$FF,$00,$03,$08,$FB;- D 1 - I - 0x016C64 0B:AC54:
	.byte $08,$03                   ;- D 1 - I - 0x016C74 0B:AC64:
ofsset_0B_AC66:
	.byte $E9,$F0,$E9,$F8,$E9,$00,$E9,$08,$E9,$10,$F1,$F0,$F1,$F8,$F1,$00;- D 1 - I - 0x016C76 0B:AC66:
	.byte $F1,$08,$F1,$10,$F9,$F0,$F9,$F8,$F9,$00,$F9,$08,$01,$F8,$01,$00;- D 1 - I - 0x016C86 0B:AC76:
	.byte $01,$08,$09,$F8,$09,$00,$09,$08;- D 1 - I - 0x016C96 0B:AC86:
ofsset_0B_AC8E:
	.byte $00,$28,$00,$30,$00,$38,$18,$00,$20,$00,$20,$50,$20,$58,$28,$F0;- D 1 - I - 0x016C9E 0B:AC8E:
	.byte $28,$F8,$28,$40,$28,$48,$30,$F8,$40,$40;- D 1 - I - 0x016CAE 0B:AC9E:
ofsset_0B_ACA8:
	.byte $F1,$F5,$F1,$FD,$F9,$F3,$F9,$FB,$F9,$00,$01,$F4,$01,$FC,$01,$04;- D 1 - I - 0x016CB8 0B:ACA8:
	.byte $09,$F4,$09,$FC,$09,$04,$01,$FA;- D 1 - I - 0x016CC8 0B:ACB8:
ofsset_0B_ACC0:
	.byte $E8,$EA,$E8,$F2,$EB,$01,$EF,$F9,$EF,$07,$F0,$E9,$F0,$ED,$F0,$F1;- D 1 - I - 0x016CD0 0B:ACC0:
	.byte $F0,$FC,$F0,$04,$F8,$EC,$F8,$F0,$F8,$F4,$F8,$FC,$F8,$FE,$F8,$04;- D 1 - I - 0x016CE0 0B:ACD0:
	.byte $F8,$0C,$00,$EB,$00,$EF,$00,$F7,$00,$F7,$00,$FE,$00,$03,$00,$08;- D 1 - I - 0x016CF0 0B:ACE0:
	.byte $00,$10,$08,$EA,$08,$F2,$08,$03,$08,$0B,$08,$13;- D 1 - I - 0x016D00 0B:ACF0:
ofsset_0B_ACFC:
	.byte $F3,$F3,$F3,$FB,$FB,$EC,$FB,$F4,$FB,$FC,$FB,$04,$03,$EC,$03,$F4;- D 1 - I - 0x016D0C 0B:ACFC:
	.byte $03,$F8,$03,$00,$03,$04,$0B,$F4,$0B,$FC,$0B,$04,$FB,$FB;- D 1 - I - 0x016D1C 0B:AD0C:
ofsset_0B_AD1A:
	.byte $EC,$F8,$EC,$00,$F4,$EB,$F4,$F3,$F4,$FB,$F4,$03,$F4,$0B,$FC,$EB;- D 1 - I - 0x016D2A 0B:AD1A:
	.byte $FC,$EF,$FC,$F7,$FC,$FF,$FC,$07,$04,$EE,$04,$F6,$04,$FE,$04,$06;- D 1 - I - 0x016D3A 0B:AD2A:
	.byte $0C,$F6,$0C,$FE,$0C,$06,$0C,$0E,$14,$03,$14,$0B,$14,$13;- D 1 - I - 0x016D4A 0B:AD3A:
ofsset_0B_AD48:
	.byte $F1,$F2,$F1,$FA,$F1,$02,$F9,$F2,$F9,$FA,$F9,$02,$01,$F0,$01,$F8;- D 1 - I - 0x016D58 0B:AD48:
	.byte $01,$FF,$07,$F5,$07,$FD,$F9,$F2,$F9,$FA;- D 1 - I - 0x016D68 0B:AD58:
ofsset_0B_AD62:
	.byte $EA,$F4,$EA,$FC,$F2,$F3,$F2,$FB,$F2,$03,$FA,$EC,$FA,$F4,$FA,$FC;- D 1 - I - 0x016D72 0B:AD62:
	.byte $FA,$04,$02,$EC,$02,$F4,$02,$FC,$02,$04,$0A,$FB,$0A,$03,$0A,$0B;- D 1 - I - 0x016D82 0B:AD72:
	.byte $0A,$13,$0A,$1B,$12,$05,$12,$0D,$12,$15,$12,$1D;- D 1 - I - 0x016D92 0B:AD82:
ofsset_0B_AD8E:
	.byte $E9,$F2,$E9,$FA,$E9,$02,$F1,$F2,$F1,$FA,$F1,$02,$F9,$F0,$F9,$F8;- D 1 - I - 0x016D9E 0B:AD8E:
	.byte $F9,$FF,$F1,$F2,$F1,$FA,$F0,$E9,$F8,$E9,$F4,$F1;- D 1 - I - 0x016DAE 0B:AD9E:
ofsset_0B_ADAA:
	.byte $F1,$F8,$F1,$00,$F9,$F8,$F9,$00,$01,$F7,$01,$FF,$01,$07,$09,$F4;- D 1 - I - 0x016DBA 0B:ADAA:
	.byte $09,$FC,$09,$04           ;- D 1 - I - 0x016DCA 0B:ADBA:
ofsset_0B_ADBE:
	.byte $D2,$EA,$D2,$F2,$D2,$FA,$DA,$EF,$DA,$F7,$E2,$EF,$E2,$F7,$E2,$FF;- D 1 - I - 0x016DCE 0B:ADBE:
	.byte $EA,$F7,$E9,$FF,$E6,$07,$F1,$FF,$EE,$07,$E5,$F3,$E1,$FF;- D 1 - I - 0x016DDE 0B:ADCE:
ofsset_0B_ADDC:
	.byte $F0,$F7,$F0,$FF,$F8,$F8,$F8,$00,$00,$F8,$00,$00,$08,$F6,$08,$FE;- D 1 - I - 0x016DEC 0B:ADDC:
	.byte $10,$F6,$10,$FE           ;- D 1 - I - 0x016DFC 0B:ADEC:
ofsset_0B_ADF0:
	.byte $EA,$F2,$EA,$FA,$EA,$02,$F2,$F2,$F2,$FA,$F2,$02,$F2,$0A,$FA,$F2;- D 1 - I - 0x016E00 0B:ADF0:
	.byte $FA,$FA,$FA,$02,$FA,$0A,$02,$F2,$02,$FA,$02,$02,$0A,$FD,$F2,$F2;- D 1 - I - 0x016E10 0B:AE00:
	.byte $F2,$FA,$02,$02           ;- D 1 - I - 0x016E20 0B:AE10:
ofsset_0B_AE14:
	.byte $EF,$F8,$EF,$00,$F7,$F9,$F7,$01,$FF,$F9,$FF,$01,$07,$FA,$07,$02;- D 1 - I - 0x016E24 0B:AE14:
	.byte $0F,$02                   ;- D 1 - I - 0x016E34 0B:AE24:
ofsset_0B_AE26:
	.byte $F2,$F5,$F2,$FD,$F2,$05,$F2,$0D,$FA,$EC,$FA,$F4,$FA,$FA,$FA,$02;- D 1 - I - 0x016E36 0B:AE26:
	.byte $FA,$0A,$FA,$12,$02,$F1,$02,$F9,$02,$01,$02,$09,$02,$11,$F2,$06;- D 1 - I - 0x016E46 0B:AE36:
	.byte $FA,$06                   ;- D 1 - I - 0x016E56 0B:AE46:
ofsset_0B_AE48:
	.byte $EF,$F8,$EF,$00,$F7,$F9,$F7,$01,$FF,$F9,$FF,$01,$07,$FB,$07,$03;- D 1 - I - 0x016E58 0B:AE48:
	.byte $0F,$FB,$0F,$03           ;- D 1 - I - 0x016E68 0B:AE58:
ofsset_0B_AE5C:
	.byte $FE,$EA,$FE,$F2,$FE,$FA,$FE,$02,$FE,$04,$FE,$0A,$04,$08,$06,$EA;- D 1 - I - 0x016E6C 0B:AE5C:
	.byte $06,$F2,$06,$F8,$06,$00,$06,$08,$06,$10,$0E,$F1,$0E,$F9,$0E,$01;- D 1 - I - 0x016E7C 0B:AE6C:
	.byte $0E,$09                   ;- D 1 - I - 0x016E8C 0B:AE7C:
ofsset_0B_AE7E:
	.byte $EE,$F8,$EE,$00,$F6,$F9,$F6,$01,$FE,$F9,$FE,$01,$06,$FA,$06,$02;- D 1 - I - 0x016E8E 0B:AE7E:
	.byte $0E,$00                   ;- D 1 - I - 0x016E9E 0B:AE8E:
ofsset_0B_AE90:
	.byte $F6,$02,$F6,$0A,$FE,$EA,$FE,$F2,$FE,$FA,$FE,$01,$FE,$02,$FE,$0A;- D 1 - I - 0x016EA0 0B:AE90:
	.byte $06,$EA,$06,$F2,$06,$F8,$06,$00,$06,$08,$06,$10,$0E,$F1,$0E,$F9;- D 1 - I - 0x016EB0 0B:AEA0:
	.byte $0E,$01                   ;- D 1 - I - 0x016EC0 0B:AEB0:
ofsset_0B_AEB2:
	.byte $EF,$F8,$EF,$00,$F7,$F9,$F7,$01,$FF,$F9,$FF,$01,$07,$FA,$07,$02;- D 1 - I - 0x016EC2 0B:AEB2:
	.byte $0F,$FA,$0F,$02           ;- D 1 - I - 0x016ED2 0B:AEC2:
ofsset_0B_AEC6:
	.byte $EE,$F9,$EE,$01,$F6,$F1,$F6,$F9,$F6,$01,$FE,$F5,$FE,$FD,$FE,$05;- D 1 - I - 0x016ED6 0B:AEC6:
	.byte $06,$FA,$06,$02,$0E,$F9,$0E,$01;- D 1 - I - 0x016EE6 0B:AED6:
ofsset_0B_AEDE:
	.byte $EC,$F3,$EC,$FB,$F4,$F3,$F4,$FB,$FC,$F3,$FC,$FB,$FC,$03,$04,$F4;- D 1 - I - 0x016EEE 0B:AEDE:
	.byte $04,$FA,$04,$FC,$0C,$FB   ;- D 1 - I - 0x016EFE 0B:AEEE:
ofsset_0B_AEF4:
	.byte $F0,$0B,$F0,$13,$F8,$04,$F8,$0C,$F8,$14,$FD,$FC,$00,$04,$00,$0C;- D 1 - I - 0x016F04 0B:AEF4:
	.byte $00,$14,$08,$04,$08,$0C,$00,$04,$00,$0C;- D 1 - I - 0x016F14 0B:AF04:
ofsset_0B_AF0E:
	.byte $EE,$F8,$EE,$00,$F6,$F9,$F6,$01,$FE,$F9,$FE,$01,$06,$F9,$06,$01;- D 1 - I - 0x016F1E 0B:AF0E:
	.byte $0E,$F9,$0E,$01           ;- D 1 - I - 0x016F2E 0B:AF1E:
ofsset_0B_AF22:
	.byte $F9,$0E,$F9,$16,$01,$FE,$00,$06,$01,$0E,$01,$16,$01,$1E,$08,$06;- D 1 - I - 0x016F32 0B:AF22:
	.byte $09,$0E,$09,$16,$09,$1E,$08,$0E;- D 1 - I - 0x016F42 0B:AF32:
ofsset_0B_AF3A:
	.byte $EF,$F7,$EF,$FF,$F7,$F8,$F7,$00,$FF,$00,$07,$F8,$07,$00,$0F,$00;- D 1 - I - 0x016F4A 0B:AF3A:
	.byte $FF,$F8,$FD,$F3           ;- D 1 - I - 0x016F5A 0B:AF4A:
ofsset_0B_AF4E:
	.byte $F6,$09,$F6,$11,$F6,$19,$FE,$09,$FE,$11,$FE,$19,$03,$11,$03,$19;- D 1 - I - 0x016F5E 0B:AF4E:
	.byte $03,$21,$0B,$11,$0B,$19,$0B,$21,$06,$11;- D 1 - I - 0x016F6E 0B:AF5E:
ofsset_0B_AF68:
	.byte $F1,$F5,$F1,$FD,$F9,$F4,$F9,$FC,$FA,$EC,$01,$F7,$01,$FF,$09,$F4;- D 1 - I - 0x016F78 0B:AF68:
	.byte $09,$FC,$09,$04           ;- D 1 - I - 0x016F88 0B:AF78:
ofsset_0B_AF7C:
	.byte $FC,$FC,$FC,$04           ;- D 1 - I - 0x016F8C 0B:AF7C:
ofsset_0B_AF80:
	.byte $F0,$02,$F0,$0A,$F8,$00,$F8,$08,$00,$FF,$00,$07,$08,$FA,$08,$02;- D 1 - I - 0x016F90 0B:AF80:
ofsset_0B_AF90:
	.byte $F0,$F1,$F0,$F9,$F8,$F1,$F8,$F9,$F8,$01,$00,$F1,$00,$F9,$00,$01;- D 1 - I - 0x016FA0 0B:AF90:
	.byte $08,$F4,$08,$FC,$08,$04,$00,$F9,$00,$01,$08,$FC;- D 1 - I - 0x016FB0 0B:AFA0:
ofsset_0B_AFAC:
	.byte $EF,$F8,$EF,$00,$F7,$F8,$F7,$00,$FF,$FC,$FF,$04,$07,$FC,$07,$04;- D 1 - I - 0x016FBC 0B:AFAC:
	.byte $0F,$02                   ;- D 1 - I - 0x016FCC 0B:AFBC:
ofsset_0B_AFBE:
	.byte $E8,$F6,$E8,$FE,$F0,$F2,$F0,$FA,$F0,$02,$F8,$EA,$F8,$F2,$F8,$FA;- D 1 - I - 0x016FCE 0B:AFBE:
	.byte $F8,$02,$00,$EA,$00,$F2,$00,$FA,$00,$02,$08,$FB,$F8,$FC;- D 1 - I - 0x016FDE 0B:AFCE:
ofsset_0B_AFDC:
	.byte $F4,$F7,$F4,$FF,$F4,$07,$FC,$F8,$FC,$00,$FC,$08,$04,$F7,$04,$FF;- D 1 - I - 0x016FEC 0B:AFDC:
	.byte $04,$07,$0C,$FD           ;- D 1 - I - 0x016FFC 0B:AFEC:
ofsset_0B_AFF0:
	.byte $E8,$02,$E8,$FA,$F0,$06,$F0,$FE,$F0,$F6,$F8,$0E,$F8,$06,$F8,$FE;- D 1 - I - 0x017000 0B:AFF0:
	.byte $F8,$F6,$00,$0E,$00,$06,$00,$FE,$00,$F6,$08,$FD,$F8,$F7,$F8,$FC;- D 1 - I - 0x017010 0B:B000:
ofsset_0B_B010:
	.byte $F9,$01,$01,$F0,$01,$F8,$01,$00,$01,$08,$09,$F0,$09,$F8,$09,$00;- D 1 - I - 0x017020 0B:B010:
	.byte $09,$08                   ;- D 1 - I - 0x017030 0B:B020:
ofsset_0B_B022:
	.byte $E8,$FC,$E8,$04,$F0,$FC,$F0,$04,$EF,$0C,$F8,$FC,$F8,$04,$00,$F4;- D 1 - I - 0x017032 0B:B022:
	.byte $00,$FC,$00,$04,$08,$FC,$F8,$FC,$FA,$EC,$F8,$F4;- D 1 - I - 0x017042 0B:B032:
ofsset_0B_B03E:
	.byte $EF,$FA,$F7,$F7,$F7,$FF,$FF,$F9,$FF,$01,$07,$F4,$07,$FC,$07,$04;- D 1 - I - 0x01704E 0B:B03E:
ofsset_0B_B04E:
	.byte $E8,$FC,$E8,$F4,$F0,$FC,$F0,$F4,$EF,$EC,$F8,$04,$F8,$FC,$F8,$F4;- D 1 - I - 0x01705E 0B:B04E:
	.byte $00,$FC,$00,$F4,$08,$FC,$F8,$FC,$F8,$F8,$FA,$0C,$FE,$FA;- D 1 - I - 0x01706E 0B:B05E:
ofsset_0B_B06C:
	.byte $F1,$02,$F9,$FA,$F9,$02,$01,$F9,$01,$01,$09,$F9,$09,$01,$11,$F8;- D 1 - I - 0x01707C 0B:B06C:
	.byte $11,$00                   ;- D 1 - I - 0x01708C 0B:B07C:
ofsset_0B_B07E:
	.byte $F8,$F8,$F8,$00,$00,$F8,$00,$00,$F8,$08,$00,$08,$F0,$F0,$F0,$F8;- D 1 - I - 0x01708E 0B:B07E:
	.byte $F0,$00,$F0,$08,$F8,$F0,$00,$F0,$08,$F0,$08,$F8,$08,$00,$08,$08;- D 1 - I - 0x01709E 0B:B08E:
	.byte $F8,$F8,$F8,$00,$F8,$08,$00,$F8;- D 1 - I - 0x0170AE 0B:B09E:
ofsset_0B_B0A6:
	.byte $F1,$F6,$F9,$F4,$F9,$FC,$01,$F4,$01,$FC,$09,$F8,$09,$00,$11,$F8;- D 1 - I - 0x0170B6 0B:B0A6:
	.byte $11,$00                   ;- D 1 - I - 0x0170C6 0B:B0B6:
ofsset_0B_B0B8:
	.byte $F8,$00,$F8,$08,$F8,$10,$F8,$18,$F8,$20,$00,$00,$00,$08,$00,$10;- D 1 - I - 0x0170C8 0B:B0B8:
	.byte $00,$18,$00,$20,$08,$00,$08,$08,$08,$10,$08,$1F,$F0,$10,$35,$F8;- D 1 - I - 0x0170D8 0B:B0C8:
	.byte $30,$00,$30,$09,$38,$00,$38,$08,$38,$10,$40,$08,$40,$10,$40,$0E;- D 1 - I - 0x0170E8 0B:B0D8:
	.byte $60,$00,$5F,$0A,$68,$09,$78,$00;- D 1 - I - 0x0170F8 0B:B0E8:
ofsset_0B_B0F0:
	.byte $AA,$FE,$AA,$96,$C2,$F7,$FE,$F7,$A2,$D8,$E0,$47,$FA,$FF,$8B,$FF;- - - - - - 0x017100 0B:B0F0:
ofsSetLo_0B:
	.lobytes ofsset_0B_A000, ofsset_0B_A018, ofsset_0B_A030, ofsset_0B_A048, ofsset_0B_A060, ofsset_0B_A07C, ofsset_0B_A092, ofsset_0B_A0A8;- D 1 - - - 0x017110 0B:B100:
	.lobytes ofsset_0B_A0BE, ofsset_0B_A0D2, ofsset_0B_A0D8, ofsset_0B_A0EC, ofsset_0B_A0F0, ofsset_0B_A104, ofsset_0B_A108, ofsset_0B_A10C;- D 1 - - - 0x017118 0B:B108:
	.lobytes ofsset_0B_A11A, ofsset_0B_A12E, ofsset_0B_A13C, ofsset_0B_A156, ofsset_0B_A164, ofsset_0B_A17A, ofsset_0B_A18E, ofsset_0B_A1A4;- D 1 - - - 0x017120 0B:B110:
	.lobytes ofsset_0B_A1BC, ofsset_0B_A1D2, ofsset_0B_A1E6, ofsset_0B_A1FC, ofsset_0B_A210, ofsset_0B_A226, ofsset_0B_A23A, ofsset_0B_A254;- D 1 - - - 0x017128 0B:B118:
	.lobytes ofsset_0B_A26E, ofsset_0B_A28C, ofsset_0B_A2AE, ofsset_0B_A2CC, ofsset_0B_A2E0, ofsset_0B_A2FC, ofsset_0B_A314, ofsset_0B_A330;- D 1 - - - 0x017130 0B:B120:
	.lobytes ofsset_0B_A342, ofsset_0B_A35E, ofsset_0B_A374, ofsset_0B_A392, ofsset_0B_A3AE, ofsset_0B_A3D6, ofsset_0B_A3EE, ofsset_0B_A40A;- D 1 - - - 0x017138 0B:B128:
	.lobytes ofsset_0B_A426, ofsset_0B_A43A, ofsset_0B_A454, ofsset_0B_A470, ofsset_0B_A470, ofsset_0B_A488, ofsset_0B_A488, ofsset_0B_A4A8;- D 1 - - - 0x017140 0B:B130:
	.lobytes ofsset_0B_A4A8, ofsset_0B_A4C0, ofsset_0B_A4C0, ofsset_0B_A4DA, ofsset_0B_A4DA, ofsset_0B_A4F4, ofsset_0B_A4F4, ofsset_0B_A50C;- D 1 - - - 0x017148 0B:B138:
	.lobytes ofsset_0B_A520, ofsset_0B_A53A, ofsset_0B_A53A, ofsset_0B_A54E, ofsset_0B_A54E, ofsset_0B_A568, ofsset_0B_A568, ofsset_0B_A586;- D 1 - - - 0x017150 0B:B140:
	.lobytes ofsset_0B_A5A4, ofsset_0B_A5CC, ofsset_0B_A5CC, ofsset_0B_A5E8, ofsset_0B_A5E8, ofsset_0B_A602, ofsset_0B_A602, ofsset_0B_A61A;- - - - - - 0x017158 0B:B148:
	.lobytes ofsset_0B_A61A, ofsset_0B_A632, ofsset_0B_A632, ofsset_0B_A64A, ofsset_0B_A64A, ofsset_0B_A662, ofsset_0B_A662, ofsset_0B_A666;- D 1 - - - 0x017160 0B:B150:
	.lobytes ofsset_0B_A666, ofsset_0B_A668, ofsset_0B_A668, ofsset_0B_A66C, ofsset_0B_A66C, ofsset_0B_A670, ofsset_0B_A670, ofsset_0B_A672;- D 1 - - - 0x017168 0B:B158:
	.lobytes ofsset_0B_A672, ofsset_0B_A674, ofsset_0B_A674, ofsset_0B_A678, ofsset_0B_A678, ofsset_0B_A67C, ofsset_0B_A67C, ofsset_0B_A67E;- D 1 - - - 0x017170 0B:B160:
	.lobytes ofsset_0B_A67E, ofsset_0B_A698, ofsset_0B_A698, ofsset_0B_A6B2, ofsset_0B_A6B2, ofsset_0B_A6D6, ofsset_0B_A6D6, ofsset_0B_A6F4;- D 1 - - - 0x017178 0B:B168:
	.lobytes ofsset_0B_A6F4, ofsset_0B_A712, ofsset_0B_A712, ofsset_0B_A72A, ofsset_0B_A72A, ofsset_0B_A744, ofsset_0B_A744, ofsset_0B_A744;- D 1 - - - 0x017180 0B:B170:
	.lobytes ofsset_0B_A744, ofsset_0B_A760, ofsset_0B_A760, ofsset_0B_A77A, ofsset_0B_A77A, ofsset_0B_A796, ofsset_0B_A796, ofsset_0B_A7B2;- D 1 - - - 0x017188 0B:B178:
	.lobytes ofsset_0B_A7B2, ofsset_0B_A7CC, ofsset_0B_A7CC, ofsset_0B_A7E8, ofsset_0B_A7E8, ofsset_0B_A802, ofsset_0B_A81A, ofsset_0B_A832;- - - - - - 0x017190 0B:B180:
	.lobytes ofsset_0B_A832, ofsset_0B_A84E, ofsset_0B_A84E, ofsset_0B_A86A, ofsset_0B_A86A, ofsset_0B_A86E, ofsset_0B_A86E, ofsset_0B_A88E;- D 1 - - - 0x017198 0B:B188:
	.lobytes ofsset_0B_A88E, ofsset_0B_A8AC, ofsset_0B_A8AC, ofsset_0B_A8CC, ofsset_0B_A8CC, ofsset_0B_A8F6, ofsset_0B_A8F6, ofsset_0B_A918;- D 1 - - - 0x0171A0 0B:B190:
	.lobytes ofsset_0B_A918, ofsset_0B_A940, ofsset_0B_A940, ofsset_0B_A95E, ofsset_0B_A95E, ofsset_0B_A978, ofsset_0B_A978, ofsset_0B_A99C;- D 1 - - - 0x0171A8 0B:B198:
	.lobytes ofsset_0B_A99C, ofsset_0B_A9BC, ofsset_0B_A9BC, ofsset_0B_A9E0, ofsset_0B_A9E0, ofsset_0B_AA00, ofsset_0B_AA00, ofsset_0B_AA1A;- D 1 - - - 0x0171B0 0B:B1A0:
	.lobytes ofsset_0B_AA1A, ofsset_0B_AA3C, ofsset_0B_AA3C, ofsset_0B_AA60, ofsset_0B_AA60, ofsset_0B_AA84, ofsset_0B_AA84, ofsset_0B_AA8C;- D 1 - - - 0x0171B8 0B:B1A8:
	.lobytes ofsset_0B_AA8C, ofsset_0B_AA94, ofsset_0B_AA94, ofsset_0B_AA9C, ofsset_0B_AA9C, ofsset_0B_AAA4, ofsset_0B_AAA4, ofsset_0B_AAAC;- D 1 - - - 0x0171C0 0B:B1B0:
	.lobytes ofsset_0B_AAAC, ofsset_0B_AAB4, ofsset_0B_AAB4, ofsset_0B_AABC, ofsset_0B_AABC, ofsset_0B_AAC4, ofsset_0B_AAC4, ofsset_0B_AAE2;- D 1 - - - 0x0171C8 0B:B1B8:
	.lobytes ofsset_0B_AAE2, ofsset_0B_AAFE, ofsset_0B_AAFE, ofsset_0B_AB16, ofsset_0B_AB16, ofsset_0B_AB36, ofsset_0B_AB36, ofsset_0B_AB4E;- D 1 - - - 0x0171D0 0B:B1C0:
	.lobytes ofsset_0B_AB4E, ofsset_0B_AB70, ofsset_0B_AB86, ofsset_0B_ABA6, ofsset_0B_ABBC, ofsset_0B_ABDC, ofsset_0B_ABDC, ofsset_0B_ABF6;- D 1 - - - 0x0171D8 0B:B1C8:
	.lobytes ofsset_0B_ABF6, ofsset_0B_AC14, ofsset_0B_AC44, ofsset_0B_AC54, ofsset_0B_AC66, ofsset_0B_AC8E, ofsset_0B_ACA8, ofsset_0B_ACC0;- D 1 - - - 0x0171E0 0B:B1D0:
	.lobytes ofsset_0B_ACFC, ofsset_0B_AD1A, ofsset_0B_AD48, ofsset_0B_AD62, ofsset_0B_AD8E, ofsset_0B_ADAA, ofsset_0B_ADBE, ofsset_0B_ADDC;- D 1 - - - 0x0171E8 0B:B1D8:
	.lobytes ofsset_0B_ADF0, ofsset_0B_AE14, ofsset_0B_AE26, ofsset_0B_AE48, ofsset_0B_AE5C, ofsset_0B_AE7E, ofsset_0B_AE90, ofsset_0B_AEB2;- D 1 - - - 0x0171F0 0B:B1E0:
	.lobytes ofsset_0B_AEC6, ofsset_0B_AEDE, ofsset_0B_AEF4, ofsset_0B_AF0E, ofsset_0B_AF22, ofsset_0B_AF3A, ofsset_0B_AF4E, ofsset_0B_AF68;- D 1 - - - 0x0171F8 0B:B1E8:
	.lobytes ofsset_0B_AF7C, ofsset_0B_AF80, ofsset_0B_AF90, ofsset_0B_AFAC, ofsset_0B_AFBE, ofsset_0B_AFDC, ofsset_0B_AFF0, ofsset_0B_B010;- D 1 - - - 0x017200 0B:B1F0:
	.lobytes ofsset_0B_B022, ofsset_0B_B03E, ofsset_0B_B04E, ofsset_0B_B06C, ofsset_0B_B07E, ofsset_0B_B0A6, ofsset_0B_B0B8, ofsset_0B_B0F0;- D 1 - - - 0x017208 0B:B1F8:
ofsSetHi_0B:
	.hibytes ofsset_0B_A000, ofsset_0B_A018, ofsset_0B_A030, ofsset_0B_A048, ofsset_0B_A060, ofsset_0B_A07C, ofsset_0B_A092, ofsset_0B_A0A8;- D 1 - - - 0x017210 0B:B200:
	.hibytes ofsset_0B_A0BE, ofsset_0B_A0D2, ofsset_0B_A0D8, ofsset_0B_A0EC, ofsset_0B_A0F0, ofsset_0B_A104, ofsset_0B_A108, ofsset_0B_A10C;- D 1 - - - 0x017218 0B:B208:
	.hibytes ofsset_0B_A11A, ofsset_0B_A12E, ofsset_0B_A13C, ofsset_0B_A156, ofsset_0B_A164, ofsset_0B_A17A, ofsset_0B_A18E, ofsset_0B_A1A4;- D 1 - - - 0x017220 0B:B210:
	.hibytes ofsset_0B_A1BC, ofsset_0B_A1D2, ofsset_0B_A1E6, ofsset_0B_A1FC, ofsset_0B_A210, ofsset_0B_A226, ofsset_0B_A23A, ofsset_0B_A254;- D 1 - - - 0x017228 0B:B218:
	.hibytes ofsset_0B_A26E, ofsset_0B_A28C, ofsset_0B_A2AE, ofsset_0B_A2CC, ofsset_0B_A2E0, ofsset_0B_A2FC, ofsset_0B_A314, ofsset_0B_A330;- D 1 - - - 0x017230 0B:B220:
	.hibytes ofsset_0B_A342, ofsset_0B_A35E, ofsset_0B_A374, ofsset_0B_A392, ofsset_0B_A3AE, ofsset_0B_A3D6, ofsset_0B_A3EE, ofsset_0B_A40A;- D 1 - - - 0x017238 0B:B228:
	.hibytes ofsset_0B_A426, ofsset_0B_A43A, ofsset_0B_A454, ofsset_0B_A470, ofsset_0B_A470, ofsset_0B_A488, ofsset_0B_A488, ofsset_0B_A4A8;- D 1 - - - 0x017240 0B:B230:
	.hibytes ofsset_0B_A4A8, ofsset_0B_A4C0, ofsset_0B_A4C0, ofsset_0B_A4DA, ofsset_0B_A4DA, ofsset_0B_A4F4, ofsset_0B_A4F4, ofsset_0B_A50C;- D 1 - - - 0x017248 0B:B238:
	.hibytes ofsset_0B_A520, ofsset_0B_A53A, ofsset_0B_A53A, ofsset_0B_A54E, ofsset_0B_A54E, ofsset_0B_A568, ofsset_0B_A568, ofsset_0B_A586;- D 1 - - - 0x017250 0B:B240:
	.hibytes ofsset_0B_A5A4, ofsset_0B_A5CC, ofsset_0B_A5CC, ofsset_0B_A5E8, ofsset_0B_A5E8, ofsset_0B_A602, ofsset_0B_A602, ofsset_0B_A61A;- - - - - - 0x017258 0B:B248:
	.hibytes ofsset_0B_A61A, ofsset_0B_A632, ofsset_0B_A632, ofsset_0B_A64A, ofsset_0B_A64A, ofsset_0B_A662, ofsset_0B_A662, ofsset_0B_A666;- D 1 - - - 0x017260 0B:B250:
	.hibytes ofsset_0B_A666, ofsset_0B_A668, ofsset_0B_A668, ofsset_0B_A66C, ofsset_0B_A66C, ofsset_0B_A670, ofsset_0B_A670, ofsset_0B_A672;- D 1 - - - 0x017268 0B:B258:
	.hibytes ofsset_0B_A672, ofsset_0B_A674, ofsset_0B_A674, ofsset_0B_A678, ofsset_0B_A678, ofsset_0B_A67C, ofsset_0B_A67C, ofsset_0B_A67E;- D 1 - - - 0x017270 0B:B260:
	.hibytes ofsset_0B_A67E, ofsset_0B_A698, ofsset_0B_A698, ofsset_0B_A6B2, ofsset_0B_A6B2, ofsset_0B_A6D6, ofsset_0B_A6D6, ofsset_0B_A6F4;- D 1 - - - 0x017278 0B:B268:
	.hibytes ofsset_0B_A6F4, ofsset_0B_A712, ofsset_0B_A712, ofsset_0B_A72A, ofsset_0B_A72A, ofsset_0B_A744, ofsset_0B_A744, ofsset_0B_A744;- D 1 - - - 0x017280 0B:B270:
	.hibytes ofsset_0B_A744, ofsset_0B_A760, ofsset_0B_A760, ofsset_0B_A77A, ofsset_0B_A77A, ofsset_0B_A796, ofsset_0B_A796, ofsset_0B_A7B2;- D 1 - - - 0x017288 0B:B278:
	.hibytes ofsset_0B_A7B2, ofsset_0B_A7CC, ofsset_0B_A7CC, ofsset_0B_A7E8, ofsset_0B_A7E8, ofsset_0B_A802, ofsset_0B_A81A, ofsset_0B_A832;- - - - - - 0x017290 0B:B280:
	.hibytes ofsset_0B_A832, ofsset_0B_A84E, ofsset_0B_A84E, ofsset_0B_A86A, ofsset_0B_A86A, ofsset_0B_A86E, ofsset_0B_A86E, ofsset_0B_A88E;- D 1 - - - 0x017298 0B:B288:
	.hibytes ofsset_0B_A88E, ofsset_0B_A8AC, ofsset_0B_A8AC, ofsset_0B_A8CC, ofsset_0B_A8CC, ofsset_0B_A8F6, ofsset_0B_A8F6, ofsset_0B_A918;- D 1 - - - 0x0172A0 0B:B290:
	.hibytes ofsset_0B_A918, ofsset_0B_A940, ofsset_0B_A940, ofsset_0B_A95E, ofsset_0B_A95E, ofsset_0B_A978, ofsset_0B_A978, ofsset_0B_A99C;- D 1 - - - 0x0172A8 0B:B298:
	.hibytes ofsset_0B_A99C, ofsset_0B_A9BC, ofsset_0B_A9BC, ofsset_0B_A9E0, ofsset_0B_A9E0, ofsset_0B_AA00, ofsset_0B_AA00, ofsset_0B_AA1A;- D 1 - - - 0x0172B0 0B:B2A0:
	.hibytes ofsset_0B_AA1A, ofsset_0B_AA3C, ofsset_0B_AA3C, ofsset_0B_AA60, ofsset_0B_AA60, ofsset_0B_AA84, ofsset_0B_AA84, ofsset_0B_AA8C;- D 1 - - - 0x0172B8 0B:B2A8:
	.hibytes ofsset_0B_AA8C, ofsset_0B_AA94, ofsset_0B_AA94, ofsset_0B_AA9C, ofsset_0B_AA9C, ofsset_0B_AAA4, ofsset_0B_AAA4, ofsset_0B_AAAC;- D 1 - - - 0x0172C0 0B:B2B0:
	.hibytes ofsset_0B_AAAC, ofsset_0B_AAB4, ofsset_0B_AAB4, ofsset_0B_AABC, ofsset_0B_AABC, ofsset_0B_AAC4, ofsset_0B_AAC4, ofsset_0B_AAE2;- D 1 - - - 0x0172C8 0B:B2B8:
	.hibytes ofsset_0B_AAE2, ofsset_0B_AAFE, ofsset_0B_AAFE, ofsset_0B_AB16, ofsset_0B_AB16, ofsset_0B_AB36, ofsset_0B_AB36, ofsset_0B_AB4E;- D 1 - - - 0x0172D0 0B:B2C0:
	.hibytes ofsset_0B_AB4E, ofsset_0B_AB70, ofsset_0B_AB86, ofsset_0B_ABA6, ofsset_0B_ABBC, ofsset_0B_ABDC, ofsset_0B_ABDC, ofsset_0B_ABF6;- D 1 - - - 0x0172D8 0B:B2C8:
	.hibytes ofsset_0B_ABF6, ofsset_0B_AC14, ofsset_0B_AC44, ofsset_0B_AC54, ofsset_0B_AC66, ofsset_0B_AC8E, ofsset_0B_ACA8, ofsset_0B_ACC0;- D 1 - - - 0x0172E0 0B:B2D0:
	.hibytes ofsset_0B_ACFC, ofsset_0B_AD1A, ofsset_0B_AD48, ofsset_0B_AD62, ofsset_0B_AD8E, ofsset_0B_ADAA, ofsset_0B_ADBE, ofsset_0B_ADDC;- D 1 - - - 0x0172E8 0B:B2D8:
	.hibytes ofsset_0B_ADF0, ofsset_0B_AE14, ofsset_0B_AE26, ofsset_0B_AE48, ofsset_0B_AE5C, ofsset_0B_AE7E, ofsset_0B_AE90, ofsset_0B_AEB2;- D 1 - - - 0x0172F0 0B:B2E0:
	.hibytes ofsset_0B_AEC6, ofsset_0B_AEDE, ofsset_0B_AEF4, ofsset_0B_AF0E, ofsset_0B_AF22, ofsset_0B_AF3A, ofsset_0B_AF4E, ofsset_0B_AF68;- D 1 - - - 0x0172F8 0B:B2E8:
	.hibytes ofsset_0B_AF7C, ofsset_0B_AF80, ofsset_0B_AF90, ofsset_0B_AFAC, ofsset_0B_AFBE, ofsset_0B_AFDC, ofsset_0B_AFF0, ofsset_0B_B010;- D 1 - - - 0x017300 0B:B2F0:
	.hibytes ofsset_0B_B022, ofsset_0B_B03E, ofsset_0B_B04E, ofsset_0B_B06C, ofsset_0B_B07E, ofsset_0B_B0A6, ofsset_0B_B0B8, ofsset_0B_B0F0;- D 1 - - - 0x017308 0B:B2F8:
; enemy AI entry stubs (bank 0B set), 3 bytes each, indexed by enemy kind from enemyAILo/Hi
ofs_0B_B300:
	JMP loc_0B_B331                 ;C - - J - - 0x017310 0B:B300: 4C 31 B3
	JMP loc_0B_B331                 ;- - - - - - 0x017313 0B:B303: 4C 31 B3
enemyAI_72:
	JMP loc_0B_B5D7                 ;C - - J - - 0x017316 0B:B306: 4C D7 B5
	JMP loc_0B_B330                 ;- - - - - - 0x017319 0B:B309: 4C 30 B3
ofs_0B_B30C:
	JMP loc_0B_B696                 ;C - - J - - 0x01731C 0B:B30C: 4C 96 B6
	JMP loc_0B_B330                 ;- - - - - - 0x01731F 0B:B30F: 4C 30 B3
	JMP loc_0B_B330                 ;- - - - - - 0x017322 0B:B312: 4C 30 B3
	JMP loc_0B_B330                 ;- - - - - - 0x017325 0B:B315: 4C 30 B3
	JMP loc_0B_B330                 ;- - - - - - 0x017328 0B:B318: 4C 30 B3
	JMP loc_0B_B330                 ;- - - - - - 0x01732B 0B:B31B: 4C 30 B3
	JMP loc_0B_B330                 ;- - - - - - 0x01732E 0B:B31E: 4C 30 B3
ofs_0B_B321:
	JMP loc_0B_BD7F                 ;C - - J - - 0x017331 0B:B321: 4C 7F BD
	JMP loc_0B_B330                 ;- - - - - - 0x017334 0B:B324: 4C 30 B3
ofs_0B_B327:
	JMP loc_0B_BD7F                 ;C - - J - - 0x017337 0B:B327: 4C 7F BD
	JMP loc_0B_B330                 ;- - - - - - 0x01733A 0B:B32A: 4C 30 B3
	JMP loc_0B_B330                 ;- - - - - - 0x01733D 0B:B32D: 4C 30 B3
loc_0B_B330:
	RTS                             ;- - - - - - 0x017340 0B:B330: 60
loc_0B_B331:
	LDA gameOverFlag                ;C - - - - - 0x017341 0B:B331: A5 62
	BEQ loc_0B_B336                 ;C - - - - - 0x017343 0B:B333: F0 01
	RTS                             ;C - - - - - 0x017345 0B:B335: 60
loc_0B_B336:
	LDA objActive,X                 ;C - - - - - 0x017346 0B:B336: BD 00 03
	AND #$0F                        ;C - - - - - 0x017349 0B:B339: 29 0F
	TAY                             ;C - - - - - 0x01734B 0B:B33B: A8
	LDA ofsSetHi_0BTbl_B64E,Y       ;C - - - - - 0x01734C 0B:B33C: B9 4E B6
	STA ptr_00                      ;C - - - - - 0x01734F 0B:B33F: 85 00
	LDA ofsSetHi_0BTbl_B652,Y       ;C - - - - - 0x017351 0B:B341: B9 52 B6
	STA ptr_00+1                    ;C - - - - - 0x017354 0B:B344: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x017356 0B:B346: 6C 00 00
ofsSetHi_0BTbl_B64E_00:
	LDA #$09                        ;C - - J - - 0x017359 0B:B349: A9 09
	JSR QueueSoundSaved             ;C - - - - - 0x01735B 0B:B34B: 20 4A F3
	LDA #$14                        ;C - - - - - 0x01735E 0B:B34E: A9 14
	STA objStep,X                   ;C - - - - - 0x017360 0B:B350: 9D 00 05
	LDA #$00                        ;C - - - - - 0x017363 0B:B353: A9 00
	STA ram_00B9                    ;C - - - - - 0x017365 0B:B355: 85 B9
	STA objParamB,X                 ;C - - - - - 0x017367 0B:B357: 9D 20 05
	LDA #$78                        ;C - - - - - 0x01736A 0B:B35A: A9 78
	STA objParamC,X                 ;C - - - - - 0x01736C 0B:B35C: 9D 30 05
	INC objActive,X                 ;C - - - - - 0x01736F 0B:B35F: FE 00 03
	INC objActive,X                 ;C - - - - - 0x017372 0B:B362: FE 00 03
	RTS                             ;C - - - - - 0x017375 0B:B365: 60
ofsSetHi_0BTbl_B64E_01:
	LDA objStep,X                   ;C - - J - - 0x017376 0B:B366: BD 00 05
	BNE loc_0B_B370                 ;C - - - - - 0x017379 0B:B369: D0 05
	LDA objParamB,X                 ;C - - - - - 0x01737B 0B:B36B: BD 20 05
	BEQ loc_0B_B37E                 ;C - - - - - 0x01737E 0B:B36E: F0 0E
loc_0B_B370:
	LDA objParamB,X                 ;C - - - - - 0x017380 0B:B370: BD 20 05
	CMP #$02                        ;C - - - - - 0x017383 0B:B373: C9 02
	BEQ loc_0B_B37D                 ;C - - - - - 0x017385 0B:B375: F0 06
	JSR SpawnThrownObj72            ;C - - - - - 0x017387 0B:B377: 20 6F B4
	INC objActive,X                 ;C - - - - - 0x01738A 0B:B37A: FE 00 03
loc_0B_B37D:
	RTS                             ;C - - - - - 0x01738D 0B:B37D: 60
loc_0B_B37E:
	LDA gameAction                  ;C - - - - - 0x01738E 0B:B37E: A5 30
	BEQ loc_0B_B387                 ;C - - - - - 0x017390 0B:B380: F0 05
	CMP #$03                        ;C - - - - - 0x017392 0B:B382: C9 03
	BEQ loc_0B_B387                 ;C - - - - - 0x017394 0B:B384: F0 01
	RTS                             ;C - - - - - 0x017396 0B:B386: 60
loc_0B_B387:
	LDA ram_00B9                    ;C - - - - - 0x017397 0B:B387: A5 B9
	CMP #$08                        ;C - - - - - 0x017399 0B:B389: C9 08
	BCC loc_0B_B3E9                 ;C - - - - - 0x01739B 0B:B38B: 90 5C
	LDA #$80                        ;C - - - - - 0x01739D 0B:B38D: A9 80
	STA objActive+6                 ;C - - - - - 0x01739F 0B:B38F: 8D 06 03
	STA objX+6                      ;C - - - - - 0x0173A2 0B:B392: 8D 66 03
	LDA #$90                        ;C - - - - - 0x0173A5 0B:B395: A9 90
	STA objFlags+6                  ;C - - - - - 0x0173A7 0B:B397: 8D 66 05
	LDA objXPage                    ;C - - - - - 0x0173AA 0B:B39A: AD 80 03
	STA objXPage+6                  ;C - - - - - 0x0173AD 0B:B39D: 8D 86 03
	LDA objYPage                    ;C - - - - - 0x0173B0 0B:B3A0: AD E0 03
	STA objYPage+6                  ;C - - - - - 0x0173B3 0B:B3A3: 8D E6 03
	LDA #$00                        ;C - - - - - 0x0173B6 0B:B3A6: A9 00
	STA objY+6                      ;C - - - - - 0x0173B8 0B:B3A8: 8D C6 03
	STA objAnimFlags+6              ;C - - - - - 0x0173BB 0B:B3AB: 8D 96 05
	STA objAnimFrame+6              ;C - - - - - 0x0173BE 0B:B3AE: 8D 76 05
	STA objVelXHi+6                 ;C - - - - - 0x0173C1 0B:B3B1: 8D 16 04
	STA objVelXLo+6                 ;C - - - - - 0x0173C4 0B:B3B4: 8D 06 04
	STA objVelYHi+6                 ;C - - - - - 0x0173C7 0B:B3B7: 8D 36 04
	STA objVelYLo+6                 ;C - - - - - 0x0173CA 0B:B3BA: 8D 26 04
	LDA #$1F                        ;C - - - - - 0x0173CD 0B:B3BD: A9 1F
	STA objAtkBox+6                 ;C - - - - - 0x0173CF 0B:B3BF: 8D 46 04
	LDY ram_00B9                    ;C - - - - - 0x0173D2 0B:B3C2: A4 B9
	LDA ofsSetHi_0BTbl_B66C,Y       ;C - - - - - 0x0173D4 0B:B3C4: B9 6C B6
	STA objAnim+6                   ;C - - - - - 0x0173D7 0B:B3C7: 8D 86 05
	LDA ram_00B9                    ;C - - - - - 0x0173DA 0B:B3CA: A5 B9
	CMP #$14                        ;C - - - - - 0x0173DC 0B:B3CC: C9 14
	BNE loc_0B_B3D4                 ;C - - - - - 0x0173DE 0B:B3CE: D0 04
	LDA #$FC                        ;C - - - - - 0x0173E0 0B:B3D0: A9 FC
	STA gameOverFlag                ;C - - - - - 0x0173E2 0B:B3D2: 85 62
loc_0B_B3D4:
	LDA ofsSetHi_0BTbl_B681,Y       ;C - - - - - 0x0173E4 0B:B3D4: B9 81 B6
	STA objKind+6                   ;C - - - - - 0x0173E7 0B:B3D7: 8D 26 03
	LDA objFlags+6                  ;C - - - - - 0x0173EA 0B:B3DA: AD 66 05
	ORA #$04                        ;C - - - - - 0x0173ED 0B:B3DD: 09 04
	STA objFlags+6                  ;C - - - - - 0x0173EF 0B:B3DF: 8D 66 05
	INC objActive,X                 ;C - - - - - 0x0173F2 0B:B3E2: FE 00 03
	INC objActive,X                 ;C - - - - - 0x0173F5 0B:B3E5: FE 00 03
	RTS                             ;C - - - - - 0x0173F8 0B:B3E8: 60
loc_0B_B3E9:
	LDA #$00                        ;c - - - - - 0x0173F9 0B:B3E9: A9 00
	STA objActive+6                 ;c - - - - - 0x0173FB 0B:B3EB: 8D 06 03
	LDA #$80                        ;c - - - - - 0x0173FE 0B:B3EE: A9 80
	STA objActive                   ;c - - - - - 0x017400 0B:B3F0: 8D 00 03
	LDA #$29                        ;c - - - - - 0x017403 0B:B3F3: A9 29
	STA gameAction                  ;c - - - - - 0x017405 0B:B3F5: 85 30
	LDA #$0C                        ;c - - - - - 0x017407 0B:B3F7: A9 0C
	STA actionTimer                 ;c - - - - - 0x017409 0B:B3F9: 85 37
	JSR ClearObject                 ;c - - - - - 0x01740B 0B:B3FB: 20 BE F2
	LDA #$FB                        ;c - - - - - 0x01740E 0B:B3FE: A9 FB
	STA gameOverFlag                ;c - - - - - 0x017410 0B:B400: 85 62
	RTS                             ;c - - - - - 0x017412 0B:B402: 60
ofsSetHi_0BTbl_B64E_02:
	DEC objParamC,X                 ;C - - J - - 0x017413 0B:B403: DE 30 05
	BNE loc_0B_B410                 ;C - - - - - 0x017416 0B:B406: D0 08
	LDA #$40                        ;C - - - - - 0x017418 0B:B408: A9 40
	STA objParamC,X                 ;C - - - - - 0x01741A 0B:B40A: 9D 30 05
	DEC objActive,X                 ;C - - - - - 0x01741D 0B:B40D: DE 00 03
loc_0B_B410:
	RTS                             ;C - - - - - 0x017420 0B:B410: 60
ofsSetHi_0BTbl_B64E_03:
	LDA objY+6                      ;C - - J - - 0x017421 0B:B411: AD C6 03
	CMP #$8C                        ;C - - - - - 0x017424 0B:B414: C9 8C
	BCC loc_0B_B45F                 ;C - - - - - 0x017426 0B:B416: 90 47
	LDA gameAction                  ;C - - - - - 0x017428 0B:B418: A5 30
	BEQ loc_0B_B421                 ;C - - - - - 0x01742A 0B:B41A: F0 05
	CMP #$03                        ;c - - - - - 0x01742C 0B:B41C: C9 03
	BEQ loc_0B_B421                 ;c - - - - - 0x01742E 0B:B41E: F0 01
	RTS                             ;c - - - - - 0x017430 0B:B420: 60
loc_0B_B421:
	LDA #$8C                        ;C - - - - - 0x017431 0B:B421: A9 8C
	STA objY+6                      ;C - - - - - 0x017433 0B:B423: 8D C6 03
	LDY playerId                    ;C - - - - - 0x017436 0B:B426: A4 34
	LDA PlayerRow_E1E6,Y            ;C - - - - - 0x017438 0B:B428: B9 E6 E1
	JSR SetPlayerAnim               ;C - - - - - 0x01743B 0B:B42B: 20 94 F2
	LDA PlayerRow_E22B,Y            ;C - - - - - 0x01743E 0B:B42E: B9 2B E2
	JSR SetChrBank2                 ;C - - - - - 0x017441 0B:B431: 20 40 F4
	LDY playerId                    ;C - - - - - 0x017444 0B:B434: A4 34
	LDA PlayerRow_E1C1,Y            ;C - - - - - 0x017446 0B:B436: B9 C1 E1
	STA objVelXLo                   ;C - - - - - 0x017449 0B:B439: 8D 00 04
	LDA PlayerRow_E1C4,Y            ;C - - - - - 0x01744C 0B:B43C: B9 C4 E1
	STA objVelXHi                   ;C - - - - - 0x01744F 0B:B43F: 8D 10 04
	LDA PlayerRow_E1C7,Y            ;C - - - - - 0x017452 0B:B442: B9 C7 E1
	STA objVelYLo                   ;C - - - - - 0x017455 0B:B445: 8D 20 04
	LDA PlayerRow_E1CA,Y            ;C - - - - - 0x017458 0B:B448: B9 CA E1
	STA objVelYHi                   ;C - - - - - 0x01745B 0B:B44B: 8D 30 04
	LDA #$80                        ;C - - - - - 0x01745E 0B:B44E: A9 80
	STA objActive                   ;C - - - - - 0x017460 0B:B450: 8D 00 03
	LDA #$1A                        ;C - - - - - 0x017463 0B:B453: A9 1A
	STA gameAction                  ;C - - - - - 0x017465 0B:B455: 85 30
	JSR ClearObject                 ;C - - - - - 0x017467 0B:B457: 20 BE F2
	LDA #$FE                        ;C - - - - - 0x01746A 0B:B45A: A9 FE
	STA gameOverFlag                ;C - - - - - 0x01746C 0B:B45C: 85 62
	RTS                             ;C - - - - - 0x01746E 0B:B45E: 60
loc_0B_B45F:
	LDA objFlags+6                  ;C - - - - - 0x01746F 0B:B45F: AD 66 05
	AND #$FB                        ;C - - - - - 0x017472 0B:B462: 29 FB
	STA objFlags+6                  ;C - - - - - 0x017474 0B:B464: 8D 66 05
	LDX #$06                        ;C - - - - - 0x017477 0B:B467: A2 06
	JSR ApplyVelY                   ;C - - - - - 0x017479 0B:B469: 20 FD F1
	LDX #$0F                        ;C - - - - - 0x01747C 0B:B46C: A2 0F
	RTS                             ;C - - - - - 0x01747E 0B:B46E: 60
SpawnThrownObj72:
	JSR FindFreeEnemySlot           ;C - - - - - 0x01747F 0B:B46F: 20 1A F7
	BCC loc_0B_B475                 ;C - - - - - 0x017482 0B:B472: 90 01
loc_0B_B474:
	RTS                             ;C - - - - - 0x017484 0B:B474: 60
loc_0B_B475:
	LDA objStep,X                   ;C - - - - - 0x017485 0B:B475: BD 00 05
	BEQ loc_0B_B474                 ;C - - - - - 0x017488 0B:B478: F0 FA
	DEC objStep,X                   ;C - - - - - 0x01748A 0B:B47A: DE 00 05
	INC objParamB,X                 ;C - - - - - 0x01748D 0B:B47D: FE 20 05
	LDA #$3F                        ;C - - - - - 0x017490 0B:B480: A9 3F
	STA objAtkDamage,Y              ;C - - - - - 0x017492 0B:B482: 99 50 04
	LDA #$9E                        ;C - - - - - 0x017495 0B:B485: A9 9E
	STA objAtkBox,Y                 ;C - - - - - 0x017497 0B:B487: 99 40 04
	LDA #$00                        ;C - - - - - 0x01749A 0B:B48A: A9 00
	STA objLife,Y                   ;C - - - - - 0x01749C 0B:B48C: 99 90 04
	STA objHudLife,Y                ;C - - - - - 0x01749F 0B:B48F: 99 A0 04
	STA objSpriteDown,Y             ;C - - - - - 0x0174A2 0B:B492: 99 B0 05
	STA objParamB,Y                 ;C - - - - - 0x0174A5 0B:B495: 99 20 05
	STA objVelYHi,Y                 ;C - - - - - 0x0174A8 0B:B498: 99 30 04
	STA objVelYLo,Y                 ;C - - - - - 0x0174AB 0B:B49B: 99 20 04
	LDA objXPage                    ;C - - - - - 0x0174AE 0B:B49E: AD 80 03
	STA objXPage,Y                  ;C - - - - - 0x0174B1 0B:B4A1: 99 80 03
	LDA objYPage                    ;C - - - - - 0x0174B4 0B:B4A4: AD E0 03
	STA objYPage,Y                  ;C - - - - - 0x0174B7 0B:B4A7: 99 E0 03
	LDA #$72                        ;C - - - - - 0x0174BA 0B:B4AA: A9 72
	STA objKind,Y                   ;C - - - - - 0x0174BC 0B:B4AC: 99 20 03
	STA objId,Y                     ;C - - - - - 0x0174BF 0B:B4AF: 99 30 03
	LDA #$7B                        ;C - - - - - 0x0174C2 0B:B4B2: A9 7B
	JSR SetAnimY                    ;C - - - - - 0x0174C4 0B:B4B4: 20 A0 F2
	LDA #$01                        ;C - - - - - 0x0174C7 0B:B4B7: A9 01
	STA objVelXHi,Y                 ;C - - - - - 0x0174C9 0B:B4B9: 99 10 04
	LDA #$00                        ;C - - - - - 0x0174CC 0B:B4BC: A9 00
	STA objVelXLo,Y                 ;C - - - - - 0x0174CE 0B:B4BE: 99 00 04
	STY ptr_02                      ;C - - - - - 0x0174D1 0B:B4C1: 84 02
	LDA rngState0                   ;C - - - - - 0x0174D3 0B:B4C3: A5 E4
	ROR A                           ;C - - - - - 0x0174D5 0B:B4C5: 6A
	AND #$07                        ;C - - - - - 0x0174D6 0B:B4C6: 29 07
	TAY                             ;C - - - - - 0x0174D8 0B:B4C8: A8
	LDA SpawnThrownObj72Tbl_B656,Y  ;C - - - - - 0x0174D9 0B:B4C9: B9 56 B6
	BEQ loc_0B_B4D5                 ;C - - - - - 0x0174DC 0B:B4CC: F0 07
	LDY ptr_02                      ;C - - - - - 0x0174DE 0B:B4CE: A4 02
	LDA #$40                        ;C - - - - - 0x0174E0 0B:B4D0: A9 40
	STA objVelXLo,Y                 ;C - - - - - 0x0174E2 0B:B4D2: 99 00 04
loc_0B_B4D5:
	LDY #$02                        ;C - - - - - 0x0174E5 0B:B4D5: A0 02
loc_0B_B4D7:
	LDA objActive,Y                 ;C - - - - - 0x0174E7 0B:B4D7: B9 00 03
	BPL loc_0B_B4E7                 ;C - - - - - 0x0174EA 0B:B4DA: 10 0B
	LDA objKind,Y                   ;C - - - - - 0x0174EC 0B:B4DC: B9 20 03
	CMP #$72                        ;C - - - - - 0x0174EF 0B:B4DF: C9 72
	BNE loc_0B_B4E7                 ;C - - - - - 0x0174F1 0B:B4E1: D0 04
	CPY ptr_02                      ;C - - - - - 0x0174F3 0B:B4E3: C4 02
	BNE loc_0B_B4EE                 ;C - - - - - 0x0174F5 0B:B4E5: D0 07
loc_0B_B4E7:
	INY                             ;C - - - - - 0x0174F7 0B:B4E7: C8
	CPY #$0F                        ;C - - - - - 0x0174F8 0B:B4E8: C0 0F
	BNE loc_0B_B4D7                 ;C - - - - - 0x0174FA 0B:B4EA: D0 EB
	BEQ loc_0B_B4F5                 ;C - - - - - 0x0174FC 0B:B4EC: F0 07
loc_0B_B4EE:
	LDA objParamA,Y                 ;C - - - - - 0x0174FE 0B:B4EE: B9 10 05
	CMP #$8C                        ;C - - - - - 0x017501 0B:B4F1: C9 8C
	BEQ loc_0B_B505                 ;C - - - - - 0x017503 0B:B4F3: F0 10
loc_0B_B4F5:
	LDA rngState1                   ;C - - - - - 0x017505 0B:B4F5: A5 E5
	EOR objY                        ;C - - - - - 0x017507 0B:B4F7: 4D C0 03
	AND #$03                        ;C - - - - - 0x01750A 0B:B4FA: 29 03
	TAY                             ;C - - - - - 0x01750C 0B:B4FC: A8
	LDA SpawnThrownObj72Tbl_B666,Y  ;C - - - - - 0x01750D 0B:B4FD: B9 66 B6
	STA ptr_02+1                    ;C - - - - - 0x017510 0B:B500: 85 03
	JMP loc_0B_B512                 ;C - - - - - 0x017512 0B:B502: 4C 12 B5
loc_0B_B505:
	LDA rngState1                   ;C - - - - - 0x017515 0B:B505: A5 E5
	EOR objY                        ;C - - - - - 0x017517 0B:B507: 4D C0 03
	AND #$01                        ;C - - - - - 0x01751A 0B:B50A: 29 01
	TAY                             ;C - - - - - 0x01751C 0B:B50C: A8
	LDA SpawnThrownObj72Tbl_B66A,Y  ;C - - - - - 0x01751D 0B:B50D: B9 6A B6
	STA ptr_02+1                    ;C - - - - - 0x017520 0B:B510: 85 03
loc_0B_B512:
	LDY ptr_02                      ;C - - - - - 0x017522 0B:B512: A4 02
	LDA ptr_02+1                    ;C - - - - - 0x017524 0B:B514: A5 03
	BEQ loc_0B_B52B                 ;C - - - - - 0x017526 0B:B516: F0 13
	CMP #$01                        ;C - - - - - 0x017528 0B:B518: C9 01
	BEQ loc_0B_B537                 ;C - - - - - 0x01752A 0B:B51A: F0 1B
	CMP #$02                        ;C - - - - - 0x01752C 0B:B51C: C9 02
	BEQ loc_0B_B543                 ;C - - - - - 0x01752E 0B:B51E: F0 23
	CMP #$03                        ;C - - - - - 0x017530 0B:B520: C9 03
	BEQ loc_0B_B559                 ;C - - - - - 0x017532 0B:B522: F0 35
	CMP #$04                        ;C - - - - - 0x017534 0B:B524: C9 04
	BEQ loc_0B_B56F                 ;C - - - - - 0x017536 0B:B526: F0 47
	JMP loc_0B_B581                 ;C - - - - - 0x017538 0B:B528: 4C 81 B5
loc_0B_B52B:
	LDA #$01                        ;C - - - - - 0x01753B 0B:B52B: A9 01
	STA objFacing,Y                 ;C - - - - - 0x01753D 0B:B52D: 99 60 04
	LDA #$01                        ;C - - - - - 0x017540 0B:B530: A9 01
	STA objX,Y                      ;C - - - - - 0x017542 0B:B532: 99 60 03
	BNE loc_0B_B54D                 ;C - - - - - 0x017545 0B:B535: D0 16
loc_0B_B537:
	LDA #$01                        ;C - - - - - 0x017547 0B:B537: A9 01
	STA objFacing,Y                 ;C - - - - - 0x017549 0B:B539: 99 60 04
	LDA #$01                        ;C - - - - - 0x01754C 0B:B53C: A9 01
	STA objX,Y                      ;C - - - - - 0x01754E 0B:B53E: 99 60 03
	BNE loc_0B_B563                 ;C - - - - - 0x017551 0B:B541: D0 20
loc_0B_B543:
	LDA #$02                        ;C - - - - - 0x017553 0B:B543: A9 02
	STA objFacing,Y                 ;C - - - - - 0x017555 0B:B545: 99 60 04
	LDA #$FF                        ;C - - - - - 0x017558 0B:B548: A9 FF
	STA objX,Y                      ;C - - - - - 0x01755A 0B:B54A: 99 60 03
loc_0B_B54D:
	LDA #$8C                        ;C - - - - - 0x01755D 0B:B54D: A9 8C
	STA objY,Y                      ;C - - - - - 0x01755F 0B:B54F: 99 C0 03
	STA objParamA,Y                 ;C - - - - - 0x017562 0B:B552: 99 10 05
	JSR EnemyRandomJump             ;C - - - - - 0x017565 0B:B555: 20 AF B5
	RTS                             ;C - - - - - 0x017568 0B:B558: 60
loc_0B_B559:
	LDA #$02                        ;C - - - - - 0x017569 0B:B559: A9 02
	STA objFacing,Y                 ;C - - - - - 0x01756B 0B:B55B: 99 60 04
	LDA #$FF                        ;C - - - - - 0x01756E 0B:B55E: A9 FF
	STA objX,Y                      ;C - - - - - 0x017570 0B:B560: 99 60 03
loc_0B_B563:
	LDA #$A4                        ;C - - - - - 0x017573 0B:B563: A9 A4
	STA objY,Y                      ;C - - - - - 0x017575 0B:B565: 99 C0 03
	STA objParamA,Y                 ;C - - - - - 0x017578 0B:B568: 99 10 05
	JSR EnemyRandomJump             ;C - - - - - 0x01757B 0B:B56B: 20 AF B5
	RTS                             ;C - - - - - 0x01757E 0B:B56E: 60
loc_0B_B56F:
	LDA stage                       ;C - - - - - 0x01757F 0B:B56F: A5 61
	CMP #$02                        ;C - - - - - 0x017581 0B:B571: C9 02
	BCC loc_0B_B52B                 ;C - - - - - 0x017583 0B:B573: 90 B6
	LDA #$01                        ;C - - - - - 0x017585 0B:B575: A9 01
	STA objFacing,Y                 ;C - - - - - 0x017587 0B:B577: 99 60 04
	LDA #$50                        ;C - - - - - 0x01758A 0B:B57A: A9 50
	STA objX,Y                      ;C - - - - - 0x01758C 0B:B57C: 99 60 03
	BNE loc_0B_B591                 ;C - - - - - 0x01758F 0B:B57F: D0 10
loc_0B_B581:
	LDA stage                       ;C - - - - - 0x017591 0B:B581: A5 61
	CMP #$02                        ;C - - - - - 0x017593 0B:B583: C9 02
	BCC loc_0B_B543                 ;C - - - - - 0x017595 0B:B585: 90 BC
	LDA #$02                        ;C - - - - - 0x017597 0B:B587: A9 02
	STA objFacing,Y                 ;C - - - - - 0x017599 0B:B589: 99 60 04
	LDA #$B0                        ;C - - - - - 0x01759C 0B:B58C: A9 B0
	STA objX,Y                      ;C - - - - - 0x01759E 0B:B58E: 99 60 03
loc_0B_B591:
	LDA #$01                        ;C - - - - - 0x0175A1 0B:B591: A9 01
	STA objY,Y                      ;C - - - - - 0x0175A3 0B:B593: 99 C0 03
	LDA #$8C                        ;C - - - - - 0x0175A6 0B:B596: A9 8C
	STA objParamA,Y                 ;C - - - - - 0x0175A8 0B:B598: 99 10 05
	LDA #$00                        ;C - - - - - 0x0175AB 0B:B59B: A9 00
	STA objVelXHi,Y                 ;C - - - - - 0x0175AD 0B:B59D: 99 10 04
	STA objVelXLo,Y                 ;C - - - - - 0x0175B0 0B:B5A0: 99 00 04
	STA objVelYHi,Y                 ;C - - - - - 0x0175B3 0B:B5A3: 99 30 04
	STA objVelYLo,Y                 ;C - - - - - 0x0175B6 0B:B5A6: 99 20 04
	LDA #$01                        ;C - - - - - 0x0175B9 0B:B5A9: A9 01
	STA objSpriteDown,Y             ;C - - - - - 0x0175BB 0B:B5AB: 99 B0 05
	RTS                             ;C - - - - - 0x0175BE 0B:B5AE: 60
EnemyRandomJump:
	LDA rngState0                   ;C - - - - - 0x0175BF 0B:B5AF: A5 E4
	ADC enemySpawnTimer             ;C - - - - - 0x0175C1 0B:B5B1: 65 63
	AND #$07                        ;C - - - - - 0x0175C3 0B:B5B3: 29 07
	TAY                             ;C - - - - - 0x0175C5 0B:B5B5: A8
	LDA EnemyRandomJumpTbl_B65E,Y   ;C - - - - - 0x0175C6 0B:B5B6: B9 5E B6
	BEQ loc_0B_B5D6                 ;C - - - - - 0x0175C9 0B:B5B9: F0 1B
	LDY ptr_02                      ;C - - - - - 0x0175CB 0B:B5BB: A4 02
	LDA #$01                        ;C - - - - - 0x0175CD 0B:B5BD: A9 01
	STA objVelXHi,Y                 ;C - - - - - 0x0175CF 0B:B5BF: 99 10 04
	LDA #$02                        ;C - - - - - 0x0175D2 0B:B5C2: A9 02
	STA objVelYHi,Y                 ;C - - - - - 0x0175D4 0B:B5C4: 99 30 04
	LDA #$40                        ;C - - - - - 0x0175D7 0B:B5C7: A9 40
	STA objVelXLo,Y                 ;C - - - - - 0x0175D9 0B:B5C9: 99 00 04
	LDA #$80                        ;C - - - - - 0x0175DC 0B:B5CC: A9 80
	STA objVelYLo,Y                 ;C - - - - - 0x0175DE 0B:B5CE: 99 20 04
	LDA #$02                        ;C - - - - - 0x0175E1 0B:B5D1: A9 02
	STA objSpriteDown,Y             ;C - - - - - 0x0175E3 0B:B5D3: 99 B0 05
loc_0B_B5D6:
	RTS                             ;C - - - - - 0x0175E6 0B:B5D6: 60
loc_0B_B5D7:
	LDA objSpriteDown,X             ;C - - - - - 0x0175E7 0B:B5D7: BD B0 05
	BEQ loc_0B_B625                 ;C - - - - - 0x0175EA 0B:B5DA: F0 49
	JSR ApplyVelY                   ;C - - - - - 0x0175EC 0B:B5DC: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x0175EF 0B:B5DF: BD C0 03
	CMP objParamA,X                 ;C - - - - - 0x0175F2 0B:B5E2: DD 10 05
	BCC loc_0B_B625                 ;C - - - - - 0x0175F5 0B:B5E5: 90 3E
	LDA objParamA,X                 ;C - - - - - 0x0175F7 0B:B5E7: BD 10 05
	STA objY,X                      ;C - - - - - 0x0175FA 0B:B5EA: 9D C0 03
	LDA objSpriteDown,X             ;C - - - - - 0x0175FD 0B:B5ED: BD B0 05
	CMP #$01                        ;C - - - - - 0x017600 0B:B5F0: C9 01
	BEQ loc_0B_B601                 ;C - - - - - 0x017602 0B:B5F2: F0 0D
	LDA #$02                        ;C - - - - - 0x017604 0B:B5F4: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x017606 0B:B5F6: 9D 30 04
	LDA #$80                        ;C - - - - - 0x017609 0B:B5F9: A9 80
	STA objVelYLo,X                 ;C - - - - - 0x01760B 0B:B5FB: 9D 20 04
	JMP loc_0B_B625                 ;C - - - - - 0x01760E 0B:B5FE: 4C 25 B6
loc_0B_B601:
	INC objParamB,X                 ;C - - - - - 0x017611 0B:B601: FE 20 05
	LDA objParamB,X                 ;C - - - - - 0x017614 0B:B604: BD 20 05
	CMP #$02                        ;C - - - - - 0x017617 0B:B607: C9 02
	BEQ loc_0B_B616                 ;C - - - - - 0x017619 0B:B609: F0 0B
	LDA #$02                        ;C - - - - - 0x01761B 0B:B60B: A9 02
	STA objVelYHi,X                 ;C - - - - - 0x01761D 0B:B60D: 9D 30 04
	LDA #$05                        ;C - - - - - 0x017620 0B:B610: A9 05
	STA objVelYLo,X                 ;C - - - - - 0x017622 0B:B612: 9D 20 04
	RTS                             ;C - - - - - 0x017625 0B:B615: 60
loc_0B_B616:
	LDA #$01                        ;C - - - - - 0x017626 0B:B616: A9 01
	STA objVelXHi,X                 ;C - - - - - 0x017628 0B:B618: 9D 10 04
	LDA #$00                        ;C - - - - - 0x01762B 0B:B61B: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x01762D 0B:B61D: 9D 00 04
	LDA #$00                        ;C - - - - - 0x017630 0B:B620: A9 00
	STA objSpriteDown,X             ;C - - - - - 0x017632 0B:B622: 9D B0 05
loc_0B_B625:
	LDA objFacing,X                 ;C - - - - - 0x017635 0B:B625: BD 60 04
	AND #$01                        ;C - - - - - 0x017638 0B:B628: 29 01
	BEQ loc_0B_B632                 ;C - - - - - 0x01763A 0B:B62A: F0 06
	JSR SetObjFlag40                ;C - - - - - 0x01763C 0B:B62C: 20 90 F0
	JSR ApplyVelXAdd                ;C - - - - - 0x01763F 0B:B62F: 20 83 F1
loc_0B_B632:
	LDA objFacing,X                 ;C - - - - - 0x017642 0B:B632: BD 60 04
	AND #$02                        ;C - - - - - 0x017645 0B:B635: 29 02
	BEQ loc_0B_B63F                 ;C - - - - - 0x017647 0B:B637: F0 06
	JSR ClearObjFlag40              ;C - - - - - 0x017649 0B:B639: 20 99 F0
	JSR ApplyVelXSub                ;C - - - - - 0x01764C 0B:B63C: 20 A1 F1
loc_0B_B63F:
	LDA objXPage,X                  ;C - - - - - 0x01764F 0B:B63F: BD 80 03
	CMP objXPage                    ;C - - - - - 0x017652 0B:B642: CD 80 03
	BEQ loc_0B_B64D                 ;C - - - - - 0x017655 0B:B645: F0 06
	DEC objParamB+15                ;C - - - - - 0x017657 0B:B647: CE 2F 05
	JMP ClearObject                 ;C - - - - - 0x01765A 0B:B64A: 4C BE F2
loc_0B_B64D:
	RTS                             ;C - - - - - 0x01765D 0B:B64D: 60
ofsSetHi_0BTbl_B64E:
	.lobytes ofsSetHi_0BTbl_B64E_00, ofsSetHi_0BTbl_B64E_01, ofsSetHi_0BTbl_B64E_02, ofsSetHi_0BTbl_B64E_03;- D 1 - - - 0x01765E 0B:B64E:
ofsSetHi_0BTbl_B652:
	.hibytes ofsSetHi_0BTbl_B64E_00, ofsSetHi_0BTbl_B64E_01, ofsSetHi_0BTbl_B64E_02, ofsSetHi_0BTbl_B64E_03;- D 1 - - - 0x017662 0B:B652:
SpawnThrownObj72Tbl_B656:
	.byte $00,$00,$00,$FF,$FF,$FF,$FF,$FF;- D 1 - - - 0x017666 0B:B656:
EnemyRandomJumpTbl_B65E:
	.byte $FF,$FF,$00,$00,$00,$00,$00,$00;- D 1 - - - 0x01766E 0B:B65E:
SpawnThrownObj72Tbl_B666:
	.byte $00,$02,$04,$05           ;- D 1 - - - 0x017676 0B:B666:
SpawnThrownObj72Tbl_B66A:
	.byte $01,$03                   ;- D 1 - - - 0x01767A 0B:B66A:
ofsSetHi_0BTbl_B66C:
	.res 8, $00                     ;- - - - - - 0x01767C 0B:B66C: fill 8 bytes
	.byte $63,$63,$62,$62,$60,$60,$61,$61;- - - - - - 0x017684 0B:B674:
	.byte $64,$64                   ;- D 1 - - - 0x01768C 0B:B67C:
	.byte $65,$65                   ;- - - - - - 0x01768E 0B:B67E:
	.byte $67                       ;- D 1 - - - 0x017690 0B:B680:
ofsSetHi_0BTbl_B681:
	.res 8, $00                     ;- - - - - - 0x017691 0B:B681: fill 8 bytes
	.res 8, $10                     ;- - - - - - 0x017699 0B:B689: fill 8 bytes
	.byte $13,$13                   ;- D 1 - - - 0x0176A1 0B:B691:
	.byte $11,$11                   ;- - - - - - 0x0176A3 0B:B693:
	.byte $12                       ;- D 1 - - - 0x0176A5 0B:B695:
loc_0B_B696:
	STX objSpriteAir+15             ;C - - - - - 0x0176A6 0B:B696: 8E FF 04
	LDA objActive,X                 ;C - - - - - 0x0176A9 0B:B699: BD 00 03
	CMP #$8A                        ;C - - - - - 0x0176AC 0B:B69C: C9 8A
	BEQ loc_0B_B6A6                 ;C - - - - - 0x0176AE 0B:B69E: F0 06
	LDA objY,X                      ;C - - - - - 0x0176B0 0B:B6A0: BD C0 03
	STA objParamB,X                 ;C - - - - - 0x0176B3 0B:B6A3: 9D 20 05
loc_0B_B6A6:
	LDA objDownState,X              ;C - - - - - 0x0176B6 0B:B6A6: BD C0 04
	BEQ loc_0B_B6AE                 ;C - - - - - 0x0176B9 0B:B6A9: F0 03
	DEC objDownState,X              ;C - - - - - 0x0176BB 0B:B6AB: DE C0 04
loc_0B_B6AE:
	LDA #$0B                        ;C - - - - - 0x0176BE 0B:B6AE: A9 0B
	STA objSpriteDown,X             ;C - - - - - 0x0176C0 0B:B6B0: 9D B0 05
	LDA #$00                        ;C - - - - - 0x0176C3 0B:B6B3: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x0176C5 0B:B6B5: 9D 40 04
	LDA objKind+13                  ;C - - - - - 0x0176C8 0B:B6B8: AD 2D 03
	CMP #$6E                        ;C - - - - - 0x0176CB 0B:B6BB: C9 6E
	BNE loc_0B_B6C7                 ;C - - - - - 0x0176CD 0B:B6BD: D0 08
	INC objDownState,X              ;C - - - - - 0x0176CF 0B:B6BF: FE C0 04
	BEQ loc_0B_B6C7                 ;C - - - - - 0x0176D2 0B:B6C2: F0 03
	JMP loc_0B_B743                 ;C - - - - - 0x0176D4 0B:B6C4: 4C 43 B7
loc_0B_B6C7:
	LDA objHitTimer,X               ;C - - - - - 0x0176D7 0B:B6C7: BD E0 04
	BEQ loc_0B_B6D8                 ;C - - - - - 0x0176DA 0B:B6CA: F0 0C
	LDA #$BC                        ;C - - - - - 0x0176DC 0B:B6CC: A9 BC
	LDY #$38                        ;C - - - - - 0x0176DE 0B:B6CE: A0 38
	JSR SetAnimXChr4                ;C - - - - - 0x0176E0 0B:B6D0: 20 49 F4
	LDA #$81                        ;C - - - - - 0x0176E3 0B:B6D3: A9 81
	STA objActive,X                 ;C - - - - - 0x0176E5 0B:B6D5: 9D 00 03
loc_0B_B6D8:
	LDA objGrabState,X              ;C - - - - - 0x0176E8 0B:B6D8: BD F0 03
	BEQ loc_0B_B74A                 ;C - - - - - 0x0176EB 0B:B6DB: F0 6D
	LDA gameAction                  ;C - - - - - 0x0176ED 0B:B6DD: A5 30
	CMP #$21                        ;C - - - - - 0x0176EF 0B:B6DF: C9 21
	BEQ loc_0B_B6E7                 ;C - - - - - 0x0176F1 0B:B6E1: F0 04
	CMP #$04                        ;C - - - - - 0x0176F3 0B:B6E3: C9 04
	BNE loc_0B_B74A                 ;C - - - - - 0x0176F5 0B:B6E5: D0 63
loc_0B_B6E7:
	CPX grabbedSlot                 ;C - - - - - 0x0176F7 0B:B6E7: E4 39
	BNE loc_0B_B74A                 ;C - - - - - 0x0176F9 0B:B6E9: D0 5F
	LDA objLife,X                   ;C - - - - - 0x0176FB 0B:B6EB: BD 90 04
	CMP #$26                        ;C - - - - - 0x0176FE 0B:B6EE: C9 26
	BCC loc_0B_B721                 ;C - - - - - 0x017700 0B:B6F0: 90 2F
	LDA gameAction                  ;c - - - - - 0x017702 0B:B6F2: A5 30
	CMP #$21                        ;c - - - - - 0x017704 0B:B6F4: C9 21
	BNE loc_0B_B707                 ;c - - - - - 0x017706 0B:B6F6: D0 0F
	LDA #$C3                        ;c - - - - - 0x017708 0B:B6F8: A9 C3
	LDY #$3A                        ;c - - - - - 0x01770A 0B:B6FA: A0 3A
	JSR SetAnimXChr4                ;c - - - - - 0x01770C 0B:B6FC: 20 49 F4
	LDA #$80                        ;c - - - - - 0x01770F 0B:B6FF: A9 80
	STA objActive,X                 ;c - - - - - 0x017711 0B:B701: 9D 00 03
	JMP FaceToPlayerFlag            ;c - - - - - 0x017714 0B:B704: 4C 43 F3
loc_0B_B707:
	LDA #$00                        ;c - - - - - 0x017717 0B:B707: A9 00
	STA timerA3                     ;c - - - - - 0x017719 0B:B709: 85 A3
	JSR FaceToPlayerFlag            ;c - - - - - 0x01771B 0B:B70B: 20 43 F3
	LDA #$80                        ;c - - - - - 0x01771E 0B:B70E: A9 80
	STA objActive,X                 ;c - - - - - 0x017720 0B:B710: 9D 00 03
	LDA grabTimer                   ;c - - - - - 0x017723 0B:B713: A5 38
	BMI loc_0B_B743                 ;c - - - - - 0x017725 0B:B715: 30 2C
	CMP #$0C                        ;c - - - - - 0x017727 0B:B717: C9 0C
	BCC loc_0B_B743                 ;c - - - - - 0x017729 0B:B719: 90 28
	LDA #$0C                        ;c - - - - - 0x01772B 0B:B71B: A9 0C
	STA grabTimer                   ;c - - - - - 0x01772D 0B:B71D: 85 38
	BNE loc_0B_B743                 ;c - - - - - 0x01772F 0B:B71F: D0 22
loc_0B_B721:
	LDA #$00                        ;C - - - - - 0x017731 0B:B721: A9 00
	STA gameAction                  ;C - - - - - 0x017733 0B:B723: 85 30
	STA objHitTimer,X               ;C - - - - - 0x017735 0B:B725: 9D E0 04
	STA objGrabState,X              ;C - - - - - 0x017738 0B:B728: 9D F0 03
	STA grabTimer                   ;C - - - - - 0x01773B 0B:B72B: 85 38
	DEC grabTimer                   ;C - - - - - 0x01773D 0B:B72D: C6 38
	LDY playerId                    ;C - - - - - 0x01773F 0B:B72F: A4 34
	LDA EnemyRandomJumpTbl_BD7C,Y   ;C - - - - - 0x017741 0B:B731: B9 7C BD
	JSR SetChrBank2                 ;C - - - - - 0x017744 0B:B734: 20 40 F4
	LDA #$20                        ;C - - - - - 0x017747 0B:B737: A9 20
	STA objTimer,X                  ;C - - - - - 0x017749 0B:B739: 9D D0 05
	LDA #$88                        ;C - - - - - 0x01774C 0B:B73C: A9 88
	STA objActive,X                 ;C - - - - - 0x01774E 0B:B73E: 9D 00 03
	BNE loc_0B_B74A                 ;C - - - - - 0x017751 0B:B741: D0 07
loc_0B_B743:
	LDA #$BC                        ;C - - - - - 0x017753 0B:B743: A9 BC
	LDY #$38                        ;C - - - - - 0x017755 0B:B745: A0 38
	JMP SetAnimXChr4                ;C - - - - - 0x017757 0B:B747: 4C 49 F4
loc_0B_B74A:
	LDA objLife,X                   ;C - - - - - 0x01775A 0B:B74A: BD 90 04
	CMP #$5A                        ;C - - - - - 0x01775D 0B:B74D: C9 5A
	BCS loc_0B_B78C                 ;C - - - - - 0x01775F 0B:B74F: B0 3B
	LDA objParamA,X                 ;C - - - - - 0x017761 0B:B751: BD 10 05
	BNE loc_0B_B78C                 ;C - - - - - 0x017764 0B:B754: D0 36
	LDA objDownState,X              ;C - - - - - 0x017766 0B:B756: BD C0 04
	BNE loc_0B_B77B                 ;C - - - - - 0x017769 0B:B759: D0 20
	LDA objY,X                      ;C - - - - - 0x01776B 0B:B75B: BD C0 03
	STA objParamC,X                 ;C - - - - - 0x01776E 0B:B75E: 9D 30 05
	LDA #$8E                        ;C - - - - - 0x017771 0B:B761: A9 8E
	STA objVelYLo,X                 ;C - - - - - 0x017773 0B:B763: 9D 20 04
	LDA #$03                        ;C - - - - - 0x017776 0B:B766: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x017778 0B:B768: 9D 30 04
	LDA objKind,X                   ;C - - - - - 0x01777B 0B:B76B: BD 20 03
	STA objId,X                     ;C - - - - - 0x01777E 0B:B76E: 9D 30 03
	LDA #$05                        ;C - - - - - 0x017781 0B:B771: A9 05
	STA objKind,X                   ;C - - - - - 0x017783 0B:B773: 9D 20 03
	LDA #$FF                        ;C - - - - - 0x017786 0B:B776: A9 FF
	STA objDownState,X              ;C - - - - - 0x017788 0B:B778: 9D C0 04
loc_0B_B77B:
	LDA #$80                        ;C - - - - - 0x01778B 0B:B77B: A9 80
	STA objActive,X                 ;C - - - - - 0x01778D 0B:B77D: 9D 00 03
	STA objState,X                  ;C - - - - - 0x017790 0B:B780: 9D 10 03
	LDA #$F2                        ;C - - - - - 0x017793 0B:B783: A9 F2
	JSR QueueSoundSaved             ;C - - - - - 0x017795 0B:B785: 20 4A F3
	INC objParamA,X                 ;C - - - - - 0x017798 0B:B788: FE 10 05
	RTS                             ;C - - - - - 0x01779B 0B:B78B: 60
loc_0B_B78C:
	LDA objParamA,X                 ;C - - - - - 0x01779C 0B:B78C: BD 10 05
	CMP #$01                        ;C - - - - - 0x01779F 0B:B78F: C9 01
	BNE loc_0B_B7B8                 ;C - - - - - 0x0177A1 0B:B791: D0 25
	LDA gameAction                  ;C - - - - - 0x0177A3 0B:B793: A5 30
	BEQ loc_0B_B7A5                 ;C - - - - - 0x0177A5 0B:B795: F0 0E
	CMP #$03                        ;C - - - - - 0x0177A7 0B:B797: C9 03
	BEQ loc_0B_B7A5                 ;C - - - - - 0x0177A9 0B:B799: F0 0A
	CMP #$17                        ;C - - - - - 0x0177AB 0B:B79B: C9 17
	BEQ loc_0B_B7A5                 ;C - - - - - 0x0177AD 0B:B79D: F0 06
	LDA #$01                        ;C - - - - - 0x0177AF 0B:B79F: A9 01
	STA objDownState,X              ;C - - - - - 0x0177B1 0B:B7A1: 9D C0 04
	RTS                             ;C - - - - - 0x0177B4 0B:B7A4: 60
loc_0B_B7A5:
	LDA #$3C                        ;C - - - - - 0x0177B5 0B:B7A5: A9 3C
	STA gameOverFlag                ;C - - - - - 0x0177B7 0B:B7A7: 85 62
	LDA #$80                        ;C - - - - - 0x0177B9 0B:B7A9: A9 80
	STA objActive,X                 ;C - - - - - 0x0177BB 0B:B7AB: 9D 00 03
	STA objState,X                  ;C - - - - - 0x0177BE 0B:B7AE: 9D 10 03
	INC objParamA,X                 ;C - - - - - 0x0177C1 0B:B7B1: FE 10 05
	INC objVariant,X                ;C - - - - - 0x0177C4 0B:B7B4: FE C0 05
	RTS                             ;C - - - - - 0x0177C7 0B:B7B7: 60
loc_0B_B7B8:
	LDA objActive,X                 ;C - - - - - 0x0177C8 0B:B7B8: BD 00 03
	CMP #$8A                        ;C - - - - - 0x0177CB 0B:B7BB: C9 8A
	BEQ loc_0B_B7D7                 ;C - - - - - 0x0177CD 0B:B7BD: F0 18
	LDA objY,X                      ;C - - - - - 0x0177CF 0B:B7BF: BD C0 03
	CMP #$82                        ;C - - - - - 0x0177D2 0B:B7C2: C9 82
	BCS loc_0B_B7CB                 ;C - - - - - 0x0177D4 0B:B7C4: B0 05
	LDA #$82                        ;c - - - - - 0x0177D6 0B:B7C6: A9 82
	STA objY,X                      ;c - - - - - 0x0177D8 0B:B7C8: 9D C0 03
loc_0B_B7CB:
	LDA objY,X                      ;C - - - - - 0x0177DB 0B:B7CB: BD C0 03
	CMP #$AE                        ;C - - - - - 0x0177DE 0B:B7CE: C9 AE
	BCC loc_0B_B7D7                 ;C - - - - - 0x0177E0 0B:B7D0: 90 05
	LDA #$AE                        ;C - - - - - 0x0177E2 0B:B7D2: A9 AE
	STA objY,X                      ;C - - - - - 0x0177E4 0B:B7D4: 9D C0 03
loc_0B_B7D7:
	LDA objVariant,X                ;C - - - - - 0x0177E7 0B:B7D7: BD C0 05
	BNE loc_0B_B7EF                 ;C - - - - - 0x0177EA 0B:B7DA: D0 13
	LDA objActive,X                 ;C - - - - - 0x0177EC 0B:B7DC: BD 00 03
	AND #$0F                        ;C - - - - - 0x0177EF 0B:B7DF: 29 0F
	TAY                             ;C - - - - - 0x0177F1 0B:B7E1: A8
	LDA EnemyRandomJumpTbl_BCE6,Y   ;C - - - - - 0x0177F2 0B:B7E2: B9 E6 BC
	STA ptr_00                      ;C - - - - - 0x0177F5 0B:B7E5: 85 00
	LDA EnemyRandomJumpTbl_BCF7,Y   ;C - - - - - 0x0177F7 0B:B7E7: B9 F7 BC
	STA ptr_00+1                    ;C - - - - - 0x0177FA 0B:B7EA: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x0177FC 0B:B7EC: 6C 00 00
loc_0B_B7EF:
	LDA #$06                        ;C - - - - - 0x0177FF 0B:B7EF: A9 06
	CMP soundLast                   ;C - - - - - 0x017801 0B:B7F1: C5 D9
	BEQ loc_0B_B7F8                 ;C - - - - - 0x017803 0B:B7F3: F0 03
	JSR QueueSoundSaved             ;C - - - - - 0x017805 0B:B7F5: 20 4A F3
loc_0B_B7F8:
	LDA objActive,X                 ;C - - - - - 0x017808 0B:B7F8: BD 00 03
	AND #$0F                        ;C - - - - - 0x01780B 0B:B7FB: 29 0F
	TAY                             ;C - - - - - 0x01780D 0B:B7FD: A8
	LDA EnemyRandomJumpTbl_BCEC,Y   ;C - - - - - 0x01780E 0B:B7FE: B9 EC BC
	STA ptr_00                      ;C - - - - - 0x017811 0B:B801: 85 00
	LDA EnemyRandomJumpTbl_BCFD,Y   ;C - - - - - 0x017813 0B:B803: B9 FD BC
	STA ptr_00+1                    ;C - - - - - 0x017816 0B:B806: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x017818 0B:B808: 6C 00 00
EnemyRandomJumpTbl_BCE6_00:
	JSR SetFlag40ToPlayer_0B        ;C - - J - - 0x01781B 0B:B80B: 20 E1 BB
	JSR SetAnimBD                   ;C - - - - - 0x01781E 0B:B80E: 20 D9 BC
	LDA #$00                        ;C - - - - - 0x017821 0B:B811: A9 00
	STA objCounter,X                ;C - - - - - 0x017823 0B:B813: 9D E0 05
	STA objTimer,X                  ;C - - - - - 0x017826 0B:B816: 9D D0 05
	STA objToggle,X                 ;C - - - - - 0x017829 0B:B819: 9D F0 05
	STA objParamA,X                 ;C - - - - - 0x01782C 0B:B81C: 9D 10 05
	LDA #$83                        ;C - - - - - 0x01782F 0B:B81F: A9 83
	STA objActive,X                 ;C - - - - - 0x017831 0B:B821: 9D 00 03
	RTS                             ;C - - - - - 0x017834 0B:B824: 60
EnemyRandomJumpTbl_BCE6_03:
	JSR SetAnimBD                   ;C - - J - - 0x017835 0B:B825: 20 D9 BC
	LDA #$20                        ;C - - - - - 0x017838 0B:B828: A9 20
	LDY #$18                        ;C - - - - - 0x01783A 0B:B82A: A0 18
	JSR CheckNearPlayer             ;C - - - - - 0x01783C 0B:B82C: 20 3E FB
	BCC loc_0B_B83A                 ;C - - - - - 0x01783F 0B:B82F: 90 09
	INC objActive,X                 ;C - - - - - 0x017841 0B:B831: FE 00 03
	LDA #$00                        ;C - - - - - 0x017844 0B:B834: A9 00
	STA objTimer,X                  ;C - - - - - 0x017846 0B:B836: 9D D0 05
	RTS                             ;C - - - - - 0x017849 0B:B839: 60
loc_0B_B83A:
	DEC objTimer,X                  ;C - - - - - 0x01784A 0B:B83A: DE D0 05
	LDA objTimer,X                  ;C - - - - - 0x01784D 0B:B83D: BD D0 05
	BPL loc_0B_B869                 ;C - - - - - 0x017850 0B:B840: 10 27
	JSR DirToPlayerGround           ;C - - - - - 0x017852 0B:B842: 20 5B FB
	TAY                             ;C - - - - - 0x017855 0B:B845: A8
	LDA #$0A                        ;C - - - - - 0x017856 0B:B846: A9 0A
	STA objTimer,X                  ;C - - - - - 0x017858 0B:B848: 9D D0 05
loc_0B_B84B:
	LDA facingByDirTbl,Y            ;C - - - - - 0x01785B 0B:B84B: B9 F0 FB
	STA objFacing,X                 ;C - - - - - 0x01785E 0B:B84E: 9D 60 04
	LDA EnemyRandomJumpTbl_BD1C,Y   ;C - - - - - 0x017861 0B:B851: B9 1C BD
	STA objVelXLo,X                 ;C - - - - - 0x017864 0B:B854: 9D 00 04
	LDA EnemyRandomJumpTbl_BD0C,Y   ;C - - - - - 0x017867 0B:B857: B9 0C BD
	STA objVelXHi,X                 ;C - - - - - 0x01786A 0B:B85A: 9D 10 04
	LDA EnemyRandomJumpTbl_BD3C,Y   ;C - - - - - 0x01786D 0B:B85D: B9 3C BD
	STA objVelYLo,X                 ;C - - - - - 0x017870 0B:B860: 9D 20 04
	LDA EnemyRandomJumpTbl_BD2C,Y   ;C - - - - - 0x017873 0B:B863: B9 2C BD
	STA objVelYHi,X                 ;C - - - - - 0x017876 0B:B866: 9D 30 04
loc_0B_B869:
	JSR EnemyBounceMoveVert         ;C - - - - - 0x017879 0B:B869: 20 6B BC
	JMP SetFlag40ToPlayer_0B        ;C - - - - - 0x01787C 0B:B86C: 4C E1 BB
EnemyRandomJumpTbl_BCE6_04:
	JSR SetFlag40ToPlayer_0B        ;C - - J - - 0x01787F 0B:B86F: 20 E1 BB
	DEC objTimer,X                  ;C - - - - - 0x017882 0B:B872: DE D0 05
	LDA objTimer,X                  ;C - - - - - 0x017885 0B:B875: BD D0 05
	BPL loc_0B_B8B8                 ;C - - - - - 0x017888 0B:B878: 10 3E
	JSR DirToPlayerGround           ;C - - - - - 0x01788A 0B:B87A: 20 5B FB
	TAY                             ;C - - - - - 0x01788D 0B:B87D: A8
	LDA objToggle,X                 ;C - - - - - 0x01788E 0B:B87E: BD F0 05
	BNE loc_0B_B889                 ;C - - - - - 0x017891 0B:B881: D0 06
	LDA EnemyRandomJumpTbl_BD4C,Y   ;C - - - - - 0x017893 0B:B883: B9 4C BD
	JMP loc_0B_B88C                 ;C - - - - - 0x017896 0B:B886: 4C 8C B8
loc_0B_B889:
	LDA EnemyRandomJumpTbl_BD5C,Y   ;c - - - - - 0x017899 0B:B889: B9 5C BD
loc_0B_B88C:
	STA objStep,X                   ;C - - - - - 0x01789C 0B:B88C: 9D 00 05
	BPL loc_0B_B8B8                 ;C - - - - - 0x01789F 0B:B88F: 10 27
	LDA #$1C                        ;C - - - - - 0x0178A1 0B:B891: A9 1C
	LDY #$04                        ;C - - - - - 0x0178A3 0B:B893: A0 04
	JSR CheckNearPlayer             ;C - - - - - 0x0178A5 0B:B895: 20 3E FB
	BCS loc_0B_B8C4                 ;C - - - - - 0x0178A8 0B:B898: B0 2A
	LDA #$38                        ;C - - - - - 0x0178AA 0B:B89A: A9 38
	LDY #$18                        ;C - - - - - 0x0178AC 0B:B89C: A0 18
	JSR CheckNearPlayer             ;C - - - - - 0x0178AE 0B:B89E: 20 3E FB
	BCS loc_0B_B8AC                 ;C - - - - - 0x0178B1 0B:B8A1: B0 09
	LDA #$00                        ;c - - - - - 0x0178B3 0B:B8A3: A9 00
	STA objTimer,X                  ;c - - - - - 0x0178B5 0B:B8A5: 9D D0 05
	DEC objActive,X                 ;c - - - - - 0x0178B8 0B:B8A8: DE 00 03
	RTS                             ;c - - - - - 0x0178BB 0B:B8AB: 60
loc_0B_B8AC:
	LDA objStep,X                   ;C - - - - - 0x0178BC 0B:B8AC: BD 00 05
	AND #$0F                        ;C - - - - - 0x0178BF 0B:B8AF: 29 0F
	TAY                             ;C - - - - - 0x0178C1 0B:B8B1: A8
	LDA EnemyRandomJumpTbl_BD6C,Y   ;C - - - - - 0x0178C2 0B:B8B2: B9 6C BD
	STA objTimer,X                  ;C - - - - - 0x0178C5 0B:B8B5: 9D D0 05
loc_0B_B8B8:
	JSR SetAnimBD                   ;C - - - - - 0x0178C8 0B:B8B8: 20 D9 BC
	LDA objStep,X                   ;C - - - - - 0x0178CB 0B:B8BB: BD 00 05
	AND #$0F                        ;C - - - - - 0x0178CE 0B:B8BE: 29 0F
	TAY                             ;C - - - - - 0x0178D0 0B:B8C0: A8
	JMP loc_0B_B84B                 ;C - - - - - 0x0178D1 0B:B8C1: 4C 4B B8
loc_0B_B8C4:
	LDA #$00                        ;C - - - - - 0x0178D4 0B:B8C4: A9 00
	STA objCounter,X                ;C - - - - - 0x0178D6 0B:B8C6: 9D E0 05
	INC objActive,X                 ;C - - - - - 0x0178D9 0B:B8C9: FE 00 03
	LDA #$C0                        ;C - - - - - 0x0178DC 0B:B8CC: A9 C0
	LDY #$39                        ;C - - - - - 0x0178DE 0B:B8CE: A0 39
	JMP SetAnimXChr4                ;C - - - - - 0x0178E0 0B:B8D0: 4C 49 F4
EnemyRandomJumpTbl_BCE6_05:
	LDA #$1C                        ;C - - J - - 0x0178E3 0B:B8D3: A9 1C
	LDY #$04                        ;C - - - - - 0x0178E5 0B:B8D5: A0 04
	JSR CheckNearPlayer             ;C - - - - - 0x0178E7 0B:B8D7: 20 3E FB
	BCS loc_0B_B8E3                 ;C - - - - - 0x0178EA 0B:B8DA: B0 07
	JSR SetAnimBD                   ;C - - - - - 0x0178EC 0B:B8DC: 20 D9 BC
	DEC objActive,X                 ;C - - - - - 0x0178EF 0B:B8DF: DE 00 03
	RTS                             ;C - - - - - 0x0178F2 0B:B8E2: 60
loc_0B_B8E3:
	JSR EnemyAttackHitboxFrame3     ;C - - - - - 0x0178F3 0B:B8E3: 20 0A BB
	LDA objAtkHeavy,X               ;C - - - - - 0x0178F6 0B:B8E6: BD D0 04
	BEQ loc_0B_B911                 ;C - - - - - 0x0178F9 0B:B8E9: F0 26
	LDA #$18                        ;C - - - - - 0x0178FB 0B:B8EB: A9 18
	JSR QueueSound                  ;C - - - - - 0x0178FD 0B:B8ED: 20 4C F3
	LDA #$00                        ;C - - - - - 0x017900 0B:B8F0: A9 00
	STA objAtkHeavy,X               ;C - - - - - 0x017902 0B:B8F2: 9D D0 04
	STA objVelXLo,X                 ;C - - - - - 0x017905 0B:B8F5: 9D 00 04
	LDA #$04                        ;C - - - - - 0x017908 0B:B8F8: A9 04
	STA objVelXHi,X                 ;C - - - - - 0x01790A 0B:B8FA: 9D 10 04
	LDA #$01                        ;C - - - - - 0x01790D 0B:B8FD: A9 01
	STA objFacing,X                 ;C - - - - - 0x01790F 0B:B8FF: 9D 60 04
	LDA objFlags,X                  ;C - - - - - 0x017912 0B:B902: BD 60 05
	AND #$40                        ;C - - - - - 0x017915 0B:B905: 29 40
	BEQ loc_0B_B90E                 ;C - - - - - 0x017917 0B:B907: F0 05
	LDA #$02                        ;C - - - - - 0x017919 0B:B909: A9 02
	STA objFacing,X                 ;C - - - - - 0x01791B 0B:B90B: 9D 60 04
loc_0B_B90E:
	JSR EnemyBounceMoveVert         ;C - - - - - 0x01791E 0B:B90E: 20 6B BC
loc_0B_B911:
	JSR FaceToPlayerFlag            ;C - - - - - 0x017921 0B:B911: 20 43 F3
	LDA #$00                        ;C - - - - - 0x017924 0B:B914: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x017926 0B:B916: 9D 00 04
	STA objVelXHi,X                 ;C - - - - - 0x017929 0B:B919: 9D 10 04
	LDA rngState0                   ;C - - - - - 0x01792C 0B:B91C: A5 E4
	BEQ loc_0B_B928                 ;C - - - - - 0x01792E 0B:B91E: F0 08
	LDA objToggle,X                 ;C - - - - - 0x017930 0B:B920: BD F0 05
	EOR #$FF                        ;C - - - - - 0x017933 0B:B923: 49 FF
	STA objToggle,X                 ;C - - - - - 0x017935 0B:B925: 9D F0 05
loc_0B_B928:
	RTS                             ;C - - - - - 0x017938 0B:B928: 60
EnemyRandomJumpTbl_BCEC_00:
	JSR SetFlag40ToPlayer_0B        ;C - - J - - 0x017939 0B:B929: 20 E1 BB
	JSR SetAnimBD                   ;C - - - - - 0x01793C 0B:B92C: 20 D9 BC
	LDA objXPage,X                  ;C - - - - - 0x01793F 0B:B92F: BD 80 03
	CMP #$02                        ;C - - - - - 0x017942 0B:B932: C9 02
	BEQ loc_0B_B952                 ;C - - - - - 0x017944 0B:B934: F0 1C
	LDA #$01                        ;C - - - - - 0x017946 0B:B936: A9 01
	STA objFacing,X                 ;C - - - - - 0x017948 0B:B938: 9D 60 04
	LDA objXPage,X                  ;C - - - - - 0x01794B 0B:B93B: BD 80 03
	CMP #$01                        ;C - - - - - 0x01794E 0B:B93E: C9 01
	BEQ loc_0B_B947                 ;C - - - - - 0x017950 0B:B940: F0 05
	LDA #$02                        ;C - - - - - 0x017952 0B:B942: A9 02
	STA objFacing,X                 ;C - - - - - 0x017954 0B:B944: 9D 60 04
loc_0B_B947:
	LDA #$00                        ;C - - - - - 0x017957 0B:B947: A9 00
	STA objSubStep,X                ;C - - - - - 0x017959 0B:B949: 9D 50 05
	LDA #$82                        ;C - - - - - 0x01795C 0B:B94C: A9 82
	STA objActive,X                 ;C - - - - - 0x01795E 0B:B94E: 9D 00 03
	RTS                             ;C - - - - - 0x017961 0B:B951: 60
loc_0B_B952:
	LDA #$83                        ;C - - - - - 0x017962 0B:B952: A9 83
	STA objActive,X                 ;C - - - - - 0x017964 0B:B954: 9D 00 03
	RTS                             ;C - - - - - 0x017967 0B:B957: 60
EnemyRandomJumpTbl_BCEC_03:
	JSR SetAnimBD                   ;C - - J - - 0x017968 0B:B958: 20 D9 BC
	LDA objX,X                      ;C - - - - - 0x01796B 0B:B95B: BD 60 03
	CMP objX                        ;C - - - - - 0x01796E 0B:B95E: CD 60 03
	BCC loc_0B_B967                 ;C - - - - - 0x017971 0B:B961: 90 04
	LDA #$01                        ;C - - - - - 0x017973 0B:B963: A9 01
	BNE loc_0B_B969                 ;C - - - - - 0x017975 0B:B965: D0 02
loc_0B_B967:
	LDA #$02                        ;C - - - - - 0x017977 0B:B967: A9 02
loc_0B_B969:
	STA objFacing,X                 ;C - - - - - 0x017979 0B:B969: 9D 60 04
	LDA #$00                        ;C - - - - - 0x01797C 0B:B96C: A9 00
	STA objSubStep,X                ;C - - - - - 0x01797E 0B:B96E: 9D 50 05
	JSR SetFlag40ToPlayer_0B        ;C - - - - - 0x017981 0B:B971: 20 E1 BB
	INC objActive,X                 ;C - - - - - 0x017984 0B:B974: FE 00 03
	INC objActive,X                 ;C - - - - - 0x017987 0B:B977: FE 00 03
	RTS                             ;C - - - - - 0x01798A 0B:B97A: 60
EnemyRandomJumpTbl_BCEC_04:
	JSR SetFlag40ToPlayer_0B        ;C - - J - - 0x01798B 0B:B97B: 20 E1 BB
	LDA objSubStep,X                ;C - - - - - 0x01798E 0B:B97E: BD 50 05
	BNE loc_0B_B9A7                 ;C - - - - - 0x017991 0B:B981: D0 24
	LDA #$40                        ;C - - - - - 0x017993 0B:B983: A9 40
	LDY #$10                        ;C - - - - - 0x017995 0B:B985: A0 10
	JSR CheckNearPlayer             ;C - - - - - 0x017997 0B:B987: 20 3E FB
	BCC loc_0B_B9A7                 ;C - - - - - 0x01799A 0B:B98A: 90 1B
	LDA objY,X                      ;C - - - - - 0x01799C 0B:B98C: BD C0 03
	CMP objY                        ;C - - - - - 0x01799F 0B:B98F: CD C0 03
	BCC loc_0B_B998                 ;C - - - - - 0x0179A2 0B:B992: 90 04
	LDA #$04                        ;C - - - - - 0x0179A4 0B:B994: A9 04
	BNE loc_0B_B99A                 ;C - - - - - 0x0179A6 0B:B996: D0 02
loc_0B_B998:
	LDA #$08                        ;C - - - - - 0x0179A8 0B:B998: A9 08
loc_0B_B99A:
	STA objFacing,X                 ;C - - - - - 0x0179AA 0B:B99A: 9D 60 04
	LDA #$01                        ;C - - - - - 0x0179AD 0B:B99D: A9 01
	STA objSubStep,X                ;C - - - - - 0x0179AF 0B:B99F: 9D 50 05
	LDA #$00                        ;C - - - - - 0x0179B2 0B:B9A2: A9 00
	STA objCounter,X                ;C - - - - - 0x0179B4 0B:B9A4: 9D E0 05
loc_0B_B9A7:
	LDA #$03                        ;C - - - - - 0x0179B7 0B:B9A7: A9 03
	STA objVelYHi,X                 ;C - - - - - 0x0179B9 0B:B9A9: 9D 30 04
	LDA #$00                        ;C - - - - - 0x0179BC 0B:B9AC: A9 00
	STA objVelYLo,X                 ;C - - - - - 0x0179BE 0B:B9AE: 9D 20 04
	STA objVelXLo,X                 ;C - - - - - 0x0179C1 0B:B9B1: 9D 00 04
	STA objVelXHi,X                 ;C - - - - - 0x0179C4 0B:B9B4: 9D 10 04
	LDA objSubStep,X                ;C - - - - - 0x0179C7 0B:B9B7: BD 50 05
	BNE loc_0B_BA0A                 ;C - - - - - 0x0179CA 0B:B9BA: D0 4E
	DEC objTimer,X                  ;C - - - - - 0x0179CC 0B:B9BC: DE D0 05
	BPL loc_0B_BA0A                 ;C - - - - - 0x0179CF 0B:B9BF: 10 49
	LDA objCounter,X                ;C - - - - - 0x0179D1 0B:B9C1: BD E0 05
	CMP #$05                        ;C - - - - - 0x0179D4 0B:B9C4: C9 05
	BNE loc_0B_B9F8                 ;C - - - - - 0x0179D6 0B:B9C6: D0 30
	LDA #$68                        ;C - - - - - 0x0179D8 0B:B9C8: A9 68
	LDY #$0E                        ;C - - - - - 0x0179DA 0B:B9CA: A0 0E
	JSR CheckNearPlayer             ;C - - - - - 0x0179DC 0B:B9CC: 20 3E FB
	BCC loc_0B_B9DC                 ;C - - - - - 0x0179DF 0B:B9CF: 90 0B
	LDA #$00                        ;C - - - - - 0x0179E1 0B:B9D1: A9 00
	STA objCounter,X                ;C - - - - - 0x0179E3 0B:B9D3: 9D E0 05
	LDA rngState0                   ;C - - - - - 0x0179E6 0B:B9D6: A5 E4
	AND #$01                        ;C - - - - - 0x0179E8 0B:B9D8: 29 01
	BNE loc_0B_BA3D                 ;C - - - - - 0x0179EA 0B:B9DA: D0 61
loc_0B_B9DC:
	LDA #$5A                        ;C - - - - - 0x0179EC 0B:B9DC: A9 5A
	STA objTimer,X                  ;C - - - - - 0x0179EE 0B:B9DE: 9D D0 05
	LDA #$00                        ;C - - - - - 0x0179F1 0B:B9E1: A9 00
	STA objCounter,X                ;C - - - - - 0x0179F3 0B:B9E3: 9D E0 05
	LDA #$84                        ;C - - - - - 0x0179F6 0B:B9E6: A9 84
	STA objStep,X                   ;C - - - - - 0x0179F8 0B:B9E8: 9D 00 05
	LDA #$87                        ;C - - - - - 0x0179FB 0B:B9EB: A9 87
	STA objActive,X                 ;C - - - - - 0x0179FD 0B:B9ED: 9D 00 03
	LDA #$C2                        ;C - - - - - 0x017A00 0B:B9F0: A9 C2
	LDY #$33                        ;C - - - - - 0x017A02 0B:B9F2: A0 33
	JSR SetAnimXChr4                ;C - - - - - 0x017A04 0B:B9F4: 20 49 F4
	RTS                             ;C - - - - - 0x017A07 0B:B9F7: 60
loc_0B_B9F8:
	LDA #$BF                        ;C - - - - - 0x017A08 0B:B9F8: A9 BF
	LDY #$38                        ;C - - - - - 0x017A0A 0B:B9FA: A0 38
	JSR SetAnimXChr4                ;C - - - - - 0x017A0C 0B:B9FC: 20 49 F4
	LDA #$84                        ;C - - - - - 0x017A0F 0B:B9FF: A9 84
	STA objStep,X                   ;C - - - - - 0x017A11 0B:BA01: 9D 00 05
	LDA #$86                        ;C - - - - - 0x017A14 0B:BA04: A9 86
	STA objActive,X                 ;C - - - - - 0x017A16 0B:BA06: 9D 00 03
	RTS                             ;C - - - - - 0x017A19 0B:BA09: 60
loc_0B_BA0A:
	LDA objFacing,X                 ;C - - - - - 0x017A1A 0B:BA0A: BD 60 04
	CMP #$08                        ;C - - - - - 0x017A1D 0B:BA0D: C9 08
	BNE loc_0B_BA27                 ;C - - - - - 0x017A1F 0B:BA0F: D0 16
	LDY #$01                        ;C - - - - - 0x017A21 0B:BA11: A0 01
	JSR MoveYSubCheck               ;C - - - - - 0x017A23 0B:BA13: 20 F7 F0
	LDA spriteFlipMask              ;C - - - - - 0x017A26 0B:BA16: A5 10
	AND #$50                        ;C - - - - - 0x017A28 0B:BA18: 29 50
	BEQ loc_0B_BA3C                 ;C - - - - - 0x017A2A 0B:BA1A: F0 20
	LDA objSubStep,X                ;C - - - - - 0x017A2C 0B:BA1C: BD 50 05
	BNE loc_0B_BA3D                 ;C - - - - - 0x017A2F 0B:BA1F: D0 1C
	LDA #$04                        ;C - - - - - 0x017A31 0B:BA21: A9 04
	STA objFacing,X                 ;C - - - - - 0x017A33 0B:BA23: 9D 60 04
	RTS                             ;C - - - - - 0x017A36 0B:BA26: 60
loc_0B_BA27:
	LDY #$00                        ;C - - - - - 0x017A37 0B:BA27: A0 00
	JSR MoveYAddCheck               ;C - - - - - 0x017A39 0B:BA29: 20 A2 F0
	LDA spriteFlipMask              ;C - - - - - 0x017A3C 0B:BA2C: A5 10
	AND #$50                        ;C - - - - - 0x017A3E 0B:BA2E: 29 50
	BEQ loc_0B_BA3C                 ;C - - - - - 0x017A40 0B:BA30: F0 0A
	LDA objSubStep,X                ;C - - - - - 0x017A42 0B:BA32: BD 50 05
	BNE loc_0B_BA3D                 ;C - - - - - 0x017A45 0B:BA35: D0 06
	LDA #$08                        ;C - - - - - 0x017A47 0B:BA37: A9 08
	STA objFacing,X                 ;C - - - - - 0x017A49 0B:BA39: 9D 60 04
loc_0B_BA3C:
	RTS                             ;C - - - - - 0x017A4C 0B:BA3C: 60
loc_0B_BA3D:
	LDA objFlags,X                  ;C - - - - - 0x017A4D 0B:BA3D: BD 60 05
	AND #$40                        ;C - - - - - 0x017A50 0B:BA40: 29 40
	BNE loc_0B_BA48                 ;C - - - - - 0x017A52 0B:BA42: D0 04
	LDA #$02                        ;C - - - - - 0x017A54 0B:BA44: A9 02
	BNE loc_0B_BA4A                 ;C - - - - - 0x017A56 0B:BA46: D0 02
loc_0B_BA48:
	LDA #$01                        ;C - - - - - 0x017A58 0B:BA48: A9 01
loc_0B_BA4A:
	STA objFacing,X                 ;C - - - - - 0x017A5A 0B:BA4A: 9D 60 04
	LDA #$00                        ;C - - - - - 0x017A5D 0B:BA4D: A9 00
	STA objSubStep,X                ;C - - - - - 0x017A5F 0B:BA4F: 9D 50 05
	LDA #$24                        ;C - - - - - 0x017A62 0B:BA52: A9 24
	STA objTimer,X                  ;C - - - - - 0x017A64 0B:BA54: 9D D0 05
	LDA #$89                        ;C - - - - - 0x017A67 0B:BA57: A9 89
	STA objActive,X                 ;C - - - - - 0x017A69 0B:BA59: 9D 00 03
	LDA #$12                        ;C - - - - - 0x017A6C 0B:BA5C: A9 12
	JSR QueueSound                  ;C - - - - - 0x017A6E 0B:BA5E: 20 4C F3
	LDA #$C0                        ;C - - - - - 0x017A71 0B:BA61: A9 C0
	LDY #$39                        ;C - - - - - 0x017A73 0B:BA63: A0 39
	JMP SetAnimXChr4                ;C - - - - - 0x017A75 0B:BA65: 4C 49 F4
EnemyRandomJumpTbl_BCEC_05:
	JSR SetBounceVel                ;C - - J - - 0x017A78 0B:BA68: 20 C8 BC
	LDA objXPage,X                  ;C - - - - - 0x017A7B 0B:BA6B: BD 80 03
	CMP #$02                        ;C - - - - - 0x017A7E 0B:BA6E: C9 02
	BEQ loc_0B_BA78                 ;C - - - - - 0x017A80 0B:BA70: F0 06
	LDA #$80                        ;C - - - - - 0x017A82 0B:BA72: A9 80
	STA objActive,X                 ;C - - - - - 0x017A84 0B:BA74: 9D 00 03
	RTS                             ;C - - - - - 0x017A87 0B:BA77: 60
loc_0B_BA78:
	LDA objFacing,X                 ;C - - - - - 0x017A88 0B:BA78: BD 60 04
	CMP #$02                        ;C - - - - - 0x017A8B 0B:BA7B: C9 02
	BNE loc_0B_BA8A                 ;C - - - - - 0x017A8D 0B:BA7D: D0 0B
	JSR ApplyVelXSub                ;C - - - - - 0x017A8F 0B:BA7F: 20 A1 F1
	LDA objX,X                      ;C - - - - - 0x017A92 0B:BA82: BD 60 03
	CMP #$18                        ;C - - - - - 0x017A95 0B:BA85: C9 18
	BCC loc_0B_BA94                 ;C - - - - - 0x017A97 0B:BA87: 90 0B
	RTS                             ;C - - - - - 0x017A99 0B:BA89: 60
loc_0B_BA8A:
	JSR ApplyVelXAdd                ;C - - - - - 0x017A9A 0B:BA8A: 20 83 F1
	LDA objX,X                      ;C - - - - - 0x017A9D 0B:BA8D: BD 60 03
	CMP #$F0                        ;C - - - - - 0x017AA0 0B:BA90: C9 F0
	BCC loc_0B_BA99                 ;C - - - - - 0x017AA2 0B:BA92: 90 05
loc_0B_BA94:
	LDA #$84                        ;C - - - - - 0x017AA4 0B:BA94: A9 84
	STA objActive,X                 ;C - - - - - 0x017AA6 0B:BA96: 9D 00 03
loc_0B_BA99:
	RTS                             ;C - - - - - 0x017AA9 0B:BA99: 60
EnemyRandomJumpTbl_BCEC_06:
	LDA objAnimFrame,X              ;C - - J - - 0x017AAA 0B:BA9A: BD 70 05
	CMP #$01                        ;C - - - - - 0x017AAD 0B:BA9D: C9 01
	BNE loc_0B_BAB0                 ;C - - - - - 0x017AAF 0B:BA9F: D0 0F
	LDA objAnimFlags,X              ;C - - - - - 0x017AB1 0B:BAA1: BD 90 05
	CMP #$01                        ;C - - - - - 0x017AB4 0B:BAA4: C9 01
	BNE loc_0B_BAB0                 ;C - - - - - 0x017AB6 0B:BAA6: D0 08
	JSR SpawnProjectileC7           ;C - - - - - 0x017AB8 0B:BAA8: 20 EC BB
	LDA #$2C                        ;C - - - - - 0x017ABB 0B:BAAB: A9 2C
	JSR QueueSound                  ;C - - - - - 0x017ABD 0B:BAAD: 20 4C F3
loc_0B_BAB0:
	LDA objAnimFrame,X              ;C - - - - - 0x017AC0 0B:BAB0: BD 70 05
	CMP #$03                        ;C - - - - - 0x017AC3 0B:BAB3: C9 03
	BNE loc_0B_BACF                 ;C - - - - - 0x017AC5 0B:BAB5: D0 18
	LDA objAnimFlags,X              ;C - - - - - 0x017AC7 0B:BAB7: BD 90 05
	CMP #$01                        ;C - - - - - 0x017ACA 0B:BABA: C9 01
	BNE loc_0B_BACF                 ;C - - - - - 0x017ACC 0B:BABC: D0 11
	LDA #$08                        ;C - - - - - 0x017ACE 0B:BABE: A9 08
	STA objTimer,X                  ;C - - - - - 0x017AD0 0B:BAC0: 9D D0 05
	INC objCounter,X                ;C - - - - - 0x017AD3 0B:BAC3: FE E0 05
	JSR SetAnimBD                   ;C - - - - - 0x017AD6 0B:BAC6: 20 D9 BC
	LDA objStep,X                   ;C - - - - - 0x017AD9 0B:BAC9: BD 00 05
	STA objActive,X                 ;C - - - - - 0x017ADC 0B:BACC: 9D 00 03
loc_0B_BACF:
	RTS                             ;C - - - - - 0x017ADF 0B:BACF: 60
EnemyRandomJumpTbl_BCEC_07:
	JSR SetFlag40ToPlayer_0B        ;C - - J - - 0x017AE0 0B:BAD0: 20 E1 BB
	DEC objTimer,X                  ;C - - - - - 0x017AE3 0B:BAD3: DE D0 05
	BNE loc_0B_BAE7                 ;C - - - - - 0x017AE6 0B:BAD6: D0 0F
	LDA #$08                        ;C - - - - - 0x017AE8 0B:BAD8: A9 08
	STA objTimer,X                  ;C - - - - - 0x017AEA 0B:BADA: 9D D0 05
	JSR SetAnimBD                   ;C - - - - - 0x017AED 0B:BADD: 20 D9 BC
	LDA objStep,X                   ;C - - - - - 0x017AF0 0B:BAE0: BD 00 05
	STA objActive,X                 ;C - - - - - 0x017AF3 0B:BAE3: 9D 00 03
	RTS                             ;C - - - - - 0x017AF6 0B:BAE6: 60
loc_0B_BAE7:
	RTS                             ;C - - - - - 0x017AF7 0B:BAE7: 60
EnemyRandomJumpTbl_BCEC_08:
	DEC objTimer,X                  ;C - - J - - 0x017AF8 0B:BAE8: DE D0 05
	BNE loc_0B_BAFB                 ;C - - - - - 0x017AFB 0B:BAEB: D0 0E
	JSR SetAnimBD                   ;C - - - - - 0x017AFD 0B:BAED: 20 D9 BC
	LDA #$80                        ;C - - - - - 0x017B00 0B:BAF0: A9 80
	STA objActive,X                 ;C - - - - - 0x017B02 0B:BAF2: 9D 00 03
	LDA #$0F                        ;C - - - - - 0x017B05 0B:BAF5: A9 0F
	STA objDownState,X              ;C - - - - - 0x017B07 0B:BAF7: 9D C0 04
	RTS                             ;C - - - - - 0x017B0A 0B:BAFA: 60
loc_0B_BAFB:
	INC objDownState,X              ;C - - - - - 0x017B0B 0B:BAFB: FE C0 04
	LDA #$C6                        ;C - - - - - 0x017B0E 0B:BAFE: A9 C6
	LDY #$3A                        ;C - - - - - 0x017B10 0B:BB00: A0 3A
	JMP SetAnimXChr4                ;C - - - - - 0x017B12 0B:BB02: 4C 49 F4
EnemyRandomJumpTbl_BCEC_09:
	DEC objTimer,X                  ;C - - J - - 0x017B15 0B:BB05: DE D0 05
	BEQ loc_0B_BB28                 ;C - - - - - 0x017B18 0B:BB08: F0 1E
EnemyAttackHitboxFrame3:
	LDA objAnimFrame,X              ;C - - - - - 0x017B1A 0B:BB0A: BD 70 05
	CMP #$03                        ;C - - - - - 0x017B1D 0B:BB0D: C9 03
	BNE loc_0B_BB22                 ;C - - - - - 0x017B1F 0B:BB0F: D0 11
	LDA objAnimFlags,X              ;C - - - - - 0x017B21 0B:BB11: BD 90 05
	BNE loc_0B_BB22                 ;C - - - - - 0x017B24 0B:BB14: D0 0C
	LDA #$85                        ;C - - - - - 0x017B26 0B:BB16: A9 85
	STA objAtkBox,X                 ;C - - - - - 0x017B28 0B:BB18: 9D 40 04
	LDA #$11                        ;C - - - - - 0x017B2B 0B:BB1B: A9 11
	STA objAtkDamage,X              ;C - - - - - 0x017B2D 0B:BB1D: 9D 50 04
	BNE loc_0B_BB27                 ;C - - - - - 0x017B30 0B:BB20: D0 05
loc_0B_BB22:
	LDA #$00                        ;C - - - - - 0x017B32 0B:BB22: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x017B34 0B:BB24: 9D 40 04
loc_0B_BB27:
	RTS                             ;C - - - - - 0x017B37 0B:BB27: 60
loc_0B_BB28:
	STA objVelXLo,X                 ;C - - - - - 0x017B38 0B:BB28: 9D 00 04
	STA objTimer,X                  ;C - - - - - 0x017B3B 0B:BB2B: 9D D0 05
	LDA #$05                        ;C - - - - - 0x017B3E 0B:BB2E: A9 05
	STA objVelXHi,X                 ;C - - - - - 0x017B40 0B:BB30: 9D 10 04
	LDA #$80                        ;C - - - - - 0x017B43 0B:BB33: A9 80
	STA objVelXLo,X                 ;C - - - - - 0x017B45 0B:BB35: 9D 00 04
	LDA #$01                        ;C - - - - - 0x017B48 0B:BB38: A9 01
	STA objVelYHi,X                 ;C - - - - - 0x017B4A 0B:BB3A: 9D 30 04
	LDA #$A0                        ;C - - - - - 0x017B4D 0B:BB3D: A9 A0
	STA objVelYLo,X                 ;C - - - - - 0x017B4F 0B:BB3F: 9D 20 04
	LDA #$CC                        ;C - - - - - 0x017B52 0B:BB42: A9 CC
	LDY #$39                        ;C - - - - - 0x017B54 0B:BB44: A0 39
	JSR SetAnimXChr4                ;C - - - - - 0x017B56 0B:BB46: 20 49 F4
	LDA objY,X                      ;C - - - - - 0x017B59 0B:BB49: BD C0 03
	STA objParamB,X                 ;C - - - - - 0x017B5C 0B:BB4C: 9D 20 05
	INC objActive,X                 ;C - - - - - 0x017B5F 0B:BB4F: FE 00 03
	RTS                             ;C - - - - - 0x017B62 0B:BB52: 60
EnemyRandomJumpTbl_BCEC_0A:
	LDA #$90                        ;C - - J - - 0x017B63 0B:BB53: A9 90
	STA objAtkBox,X                 ;C - - - - - 0x017B65 0B:BB55: 9D 40 04
	LDA #$34                        ;C - - - - - 0x017B68 0B:BB58: A9 34
	STA objAtkDamage,X              ;C - - - - - 0x017B6A 0B:BB5A: 9D 50 04
	JSR ApplyVelY                   ;C - - - - - 0x017B6D 0B:BB5D: 20 FD F1
	LDA objY,X                      ;C - - - - - 0x017B70 0B:BB60: BD C0 03
	CMP objParamB,X                 ;C - - - - - 0x017B73 0B:BB63: DD 20 05
	BCC loc_0B_BB7F                 ;C - - - - - 0x017B76 0B:BB66: 90 17
	LDA objParamB,X                 ;C - - - - - 0x017B78 0B:BB68: BD 20 05
	STA objY,X                      ;C - - - - - 0x017B7B 0B:BB6B: 9D C0 03
	JSR SetAnimBD                   ;C - - - - - 0x017B7E 0B:BB6E: 20 D9 BC
	LDA #$00                        ;C - - - - - 0x017B81 0B:BB71: A9 00
	STA objAtkBox,X                 ;C - - - - - 0x017B83 0B:BB73: 9D 40 04
	STA objAtkDamage,X              ;C - - - - - 0x017B86 0B:BB76: 9D 50 04
	LDA #$85                        ;C - - - - - 0x017B89 0B:BB79: A9 85
	STA objActive,X                 ;C - - - - - 0x017B8B 0B:BB7B: 9D 00 03
	RTS                             ;C - - - - - 0x017B8E 0B:BB7E: 60
loc_0B_BB7F:
	LDA objFacing,X                 ;C - - - - - 0x017B8F 0B:BB7F: BD 60 04
	CMP #$02                        ;C - - - - - 0x017B92 0B:BB82: C9 02
	BNE loc_0B_BB89                 ;C - - - - - 0x017B94 0B:BB84: D0 03
	JMP ApplyVelXSub                ;C - - - - - 0x017B96 0B:BB86: 4C A1 F1
loc_0B_BB89:
	JMP ApplyVelXAdd                ;C - - - - - 0x017B99 0B:BB89: 4C 83 F1
EnemyRandomJumpTbl_BCE6_01:
	JSR FaceToPlayerFlag            ;C - - J - - 0x017B9C 0B:BB8C: 20 43 F3
	DEC objHitTimer,X               ;C - - - - - 0x017B9F 0B:BB8F: DE E0 04
	LDA objHitTimer,X               ;C - - - - - 0x017BA2 0B:BB92: BD E0 04
	BNE loc_0B_BB9C                 ;C - - - - - 0x017BA5 0B:BB95: D0 05
	LDA #$80                        ;C - - - - - 0x017BA7 0B:BB97: A9 80
	STA objActive,X                 ;C - - - - - 0x017BA9 0B:BB99: 9D 00 03
loc_0B_BB9C:
	CMP #$1C                        ;C - - - - - 0x017BAC 0B:BB9C: C9 1C
	BCS loc_0B_BBAB                 ;C - - - - - 0x017BAE 0B:BB9E: B0 0B
	CMP #$10                        ;C - - - - - 0x017BB0 0B:BBA0: C9 10
	BCC loc_0B_BBAB                 ;C - - - - - 0x017BB2 0B:BBA2: 90 07
	LDA #$C3                        ;C - - - - - 0x017BB4 0B:BBA4: A9 C3
	LDY #$3A                        ;C - - - - - 0x017BB6 0B:BBA6: A0 3A
	JSR SetAnimXChr4                ;C - - - - - 0x017BB8 0B:BBA8: 20 49 F4
loc_0B_BBAB:
	RTS                             ;C - - - - - 0x017BBB 0B:BBAB: 60
EnemyRandomJumpTbl_BCE6_02:
	JSR SetAnimBD                   ;C - - J - - 0x017BBC 0B:BBAC: 20 D9 BC
	JSR SetBounceVel                ;C - - - - - 0x017BBF 0B:BBAF: 20 C8 BC
	LDA objFacing,X                 ;C - - - - - 0x017BC2 0B:BBB2: BD 60 04
	CMP #$01                        ;C - - - - - 0x017BC5 0B:BBB5: C9 01
	BNE loc_0B_BBCA                 ;C - - - - - 0x017BC7 0B:BBB7: D0 11
	LDA objXPage,X                  ;c - - - - - 0x017BC9 0B:BBB9: BD 80 03
	CMP #$02                        ;c - - - - - 0x017BCC 0B:BBBC: C9 02
	BNE loc_0B_BBC7                 ;c - - - - - 0x017BCE 0B:BBBE: D0 07
	LDA objX,X                      ;c - - - - - 0x017BD0 0B:BBC0: BD 60 03
	CMP #$17                        ;c - - - - - 0x017BD3 0B:BBC3: C9 17
	BCS loc_0B_BBDB                 ;c - - - - - 0x017BD5 0B:BBC5: B0 14
loc_0B_BBC7:
	JMP ApplyVelXAdd                ;c - - - - - 0x017BD7 0B:BBC7: 4C 83 F1
loc_0B_BBCA:
	LDA objXPage,X                  ;C - - - - - 0x017BDA 0B:BBCA: BD 80 03
	CMP #$02                        ;C - - - - - 0x017BDD 0B:BBCD: C9 02
	BNE loc_0B_BBD8                 ;C - - - - - 0x017BDF 0B:BBCF: D0 07
	LDA objX,X                      ;C - - - - - 0x017BE1 0B:BBD1: BD 60 03
	CMP #$F1                        ;C - - - - - 0x017BE4 0B:BBD4: C9 F1
	BCC loc_0B_BBDB                 ;C - - - - - 0x017BE6 0B:BBD6: 90 03
loc_0B_BBD8:
	JMP ApplyVelXSub                ;C - - - - - 0x017BE8 0B:BBD8: 4C A1 F1
loc_0B_BBDB:
	LDA #$80                        ;C - - - - - 0x017BEB 0B:BBDB: A9 80
	STA objActive,X                 ;C - - - - - 0x017BED 0B:BBDD: 9D 00 03
	RTS                             ;C - - - - - 0x017BF0 0B:BBE0: 60
SetFlag40ToPlayer_0B:
	JSR DistanceXToPlayer           ;C - - - - - 0x017BF1 0B:BBE1: 20 74 F3
	BCS loc_0B_BBE9                 ;C - - - - - 0x017BF4 0B:BBE4: B0 03
	JMP ClearObjFlag40              ;C - - - - - 0x017BF6 0B:BBE6: 4C 99 F0
loc_0B_BBE9:
	JMP SetObjFlag40                ;C - - - - - 0x017BF9 0B:BBE9: 4C 90 F0
SpawnProjectileC7:
	JSR FindFreeEnemySlot           ;C - - - - - 0x017BFC 0B:BBEC: 20 1A F7
	BCS loc_0B_BC6A                 ;C - - - - - 0x017BFF 0B:BBEF: B0 79
	STY ptr_00                      ;C - - - - - 0x017C01 0B:BBF1: 84 00
	LDA #$C7                        ;C - - - - - 0x017C03 0B:BBF3: A9 C7
	JSR SetAnimY                    ;C - - - - - 0x017C05 0B:BBF5: 20 A0 F2
	LDA objFlags,X                  ;C - - - - - 0x017C08 0B:BBF8: BD 60 05
	AND #$40                        ;C - - - - - 0x017C0B 0B:BBFB: 29 40
	BNE loc_0B_BC08                 ;C - - - - - 0x017C0D 0B:BBFD: D0 09
	LDA #$90                        ;C - - - - - 0x017C0F 0B:BBFF: A9 90
	STA objFlags,Y                  ;C - - - - - 0x017C11 0B:BC01: 99 60 05
	LDA #$02                        ;C - - - - - 0x017C14 0B:BC04: A9 02
	BNE loc_0B_BC0F                 ;C - - - - - 0x017C16 0B:BC06: D0 07
loc_0B_BC08:
	LDA #$D0                        ;C - - - - - 0x017C18 0B:BC08: A9 D0
	STA objFlags,Y                  ;C - - - - - 0x017C1A 0B:BC0A: 99 60 05
	LDA #$01                        ;C - - - - - 0x017C1D 0B:BC0D: A9 01
loc_0B_BC0F:
	STA objFacing,Y                 ;C - - - - - 0x017C1F 0B:BC0F: 99 60 04
	AND #$02                        ;C - - - - - 0x017C22 0B:BC12: 29 02
	TAY                             ;C - - - - - 0x017C24 0B:BC14: A8
	LDA objX,X                      ;C - - - - - 0x017C25 0B:BC15: BD 60 03
	CLC                             ;C - - - - - 0x017C28 0B:BC18: 18
	ADC SpawnProjectileC7Tbl_BD08,Y ;C - - - - - 0x017C29 0B:BC19: 79 08 BD
	PHA                             ;C - - - - - 0x017C2C 0B:BC1C: 48
	LDA objXPage,X                  ;C - - - - - 0x017C2D 0B:BC1D: BD 80 03
	ADC SpawnProjectileC7Tbl_BD09,Y ;C - - - - - 0x017C30 0B:BC20: 79 09 BD
	LDY ptr_00                      ;C - - - - - 0x017C33 0B:BC23: A4 00
	STA objXPage,Y                  ;C - - - - - 0x017C35 0B:BC25: 99 80 03
	PLA                             ;C - - - - - 0x017C38 0B:BC28: 68
	STA objX,Y                      ;C - - - - - 0x017C39 0B:BC29: 99 60 03
	LDA objY,X                      ;C - - - - - 0x017C3C 0B:BC2C: BD C0 03
	SEC                             ;C - - - - - 0x017C3F 0B:BC2F: 38
	SBC #$03                        ;C - - - - - 0x017C40 0B:BC30: E9 03
	STA objY,Y                      ;C - - - - - 0x017C42 0B:BC32: 99 C0 03
	LDA objYPage,X                  ;C - - - - - 0x017C45 0B:BC35: BD E0 03
	STA objYPage,Y                  ;C - - - - - 0x017C48 0B:BC38: 99 E0 03
	LDA #$9D                        ;C - - - - - 0x017C4B 0B:BC3B: A9 9D
	STA objKind,Y                   ;C - - - - - 0x017C4D 0B:BC3D: 99 20 03
	STA objId,Y                     ;C - - - - - 0x017C50 0B:BC40: 99 30 03
	LDA #$03                        ;C - - - - - 0x017C53 0B:BC43: A9 03
	STA objVelXHi,Y                 ;C - - - - - 0x017C55 0B:BC45: 99 10 04
	LDA #$80                        ;C - - - - - 0x017C58 0B:BC48: A9 80
	STA objVelXLo,Y                 ;C - - - - - 0x017C5A 0B:BC4A: 99 00 04
	LDA #$00                        ;C - - - - - 0x017C5D 0B:BC4D: A9 00
	STA objLife,Y                   ;C - - - - - 0x017C5F 0B:BC4F: 99 90 04
	STA objHudLife,Y                ;C - - - - - 0x017C62 0B:BC52: 99 A0 04
	STA objVelYHi,Y                 ;C - - - - - 0x017C65 0B:BC55: 99 30 04
	STA objVelYLo,Y                 ;C - - - - - 0x017C68 0B:BC58: 99 20 04
	LDA #$0C                        ;C - - - - - 0x017C6B 0B:BC5B: A9 0C
	STA objSpriteDown,Y             ;C - - - - - 0x017C6D 0B:BC5D: 99 B0 05
	LDA #$87                        ;C - - - - - 0x017C70 0B:BC60: A9 87
	STA objAtkBox,Y                 ;C - - - - - 0x017C72 0B:BC62: 99 40 04
	LDA #$34                        ;C - - - - - 0x017C75 0B:BC65: A9 34
	STA objAtkDamage,Y              ;C - - - - - 0x017C77 0B:BC67: 99 50 04
loc_0B_BC6A:
	RTS                             ;C - - - - - 0x017C7A 0B:BC6A: 60
EnemyBounceMoveVert:
	LDA objFacing,X                 ;C - - - - - 0x017C7B 0B:BC6B: BD 60 04
	AND #$08                        ;C - - - - - 0x017C7E 0B:BC6E: 29 08
	BEQ loc_0B_BC90                 ;C - - - - - 0x017C80 0B:BC70: F0 1E
	JSR ApplyVelYUpAlt              ;C - - - - - 0x017C82 0B:BC72: 20 DF F1
	LDA objY,X                      ;C - - - - - 0x017C85 0B:BC75: BD C0 03
	CMP #$82                        ;C - - - - - 0x017C88 0B:BC78: C9 82
	BCS loc_0B_BC90                 ;C - - - - - 0x017C8A 0B:BC7A: B0 14
	LDA #$82                        ;C - - - - - 0x017C8C 0B:BC7C: A9 82
	STA objY,X                      ;C - - - - - 0x017C8E 0B:BC7E: 9D C0 03
	JSR SetBounceVel                ;C - - - - - 0x017C91 0B:BC81: 20 C8 BC
	LDA objToggle,X                 ;C - - - - - 0x017C94 0B:BC84: BD F0 05
	BNE loc_0B_BCAE                 ;C - - - - - 0x017C97 0B:BC87: D0 25
loc_0B_BC89:
	LDA #$02                        ;C - - - - - 0x017C99 0B:BC89: A9 02
	STA objFacing,X                 ;C - - - - - 0x017C9B 0B:BC8B: 9D 60 04
	BNE loc_0B_BCB3                 ;C - - - - - 0x017C9E 0B:BC8E: D0 23
loc_0B_BC90:
	LDA objFacing,X                 ;C - - - - - 0x017CA0 0B:BC90: BD 60 04
	AND #$04                        ;C - - - - - 0x017CA3 0B:BC93: 29 04
	BEQ loc_0B_BCB3                 ;C - - - - - 0x017CA5 0B:BC95: F0 1C
	JSR ApplyVelYAdd                ;C - - - - - 0x017CA7 0B:BC97: 20 BF F1
	LDA objY,X                      ;C - - - - - 0x017CAA 0B:BC9A: BD C0 03
	CMP #$AE                        ;C - - - - - 0x017CAD 0B:BC9D: C9 AE
	BCC loc_0B_BCB3                 ;C - - - - - 0x017CAF 0B:BC9F: 90 12
	LDA #$AE                        ;C - - - - - 0x017CB1 0B:BCA1: A9 AE
	STA objY,X                      ;C - - - - - 0x017CB3 0B:BCA3: 9D C0 03
	JSR SetBounceVel                ;C - - - - - 0x017CB6 0B:BCA6: 20 C8 BC
	LDA objToggle,X                 ;C - - - - - 0x017CB9 0B:BCA9: BD F0 05
	BNE loc_0B_BC89                 ;C - - - - - 0x017CBC 0B:BCAC: D0 DB
loc_0B_BCAE:
	LDA #$01                        ;C - - - - - 0x017CBE 0B:BCAE: A9 01
	STA objFacing,X                 ;C - - - - - 0x017CC0 0B:BCB0: 9D 60 04
loc_0B_BCB3:
	LDA objFacing,X                 ;C - - - - - 0x017CC3 0B:BCB3: BD 60 04
	AND #$01                        ;C - - - - - 0x017CC6 0B:BCB6: 29 01
	BEQ loc_0B_BCBD                 ;C - - - - - 0x017CC8 0B:BCB8: F0 03
	JSR ApplyVelXAdd                ;C - - - - - 0x017CCA 0B:BCBA: 20 83 F1
loc_0B_BCBD:
	LDA objFacing,X                 ;C - - - - - 0x017CCD 0B:BCBD: BD 60 04
	AND #$02                        ;C - - - - - 0x017CD0 0B:BCC0: 29 02
	BEQ loc_0B_BCC7                 ;C - - - - - 0x017CD2 0B:BCC2: F0 03
	JSR ApplyVelXSub                ;C - - - - - 0x017CD4 0B:BCC4: 20 A1 F1
loc_0B_BCC7:
	RTS                             ;C - - - - - 0x017CD7 0B:BCC7: 60
SetBounceVel:
	LDA #$03                        ;C - - - - - 0x017CD8 0B:BCC8: A9 03
	STA objVelXHi,X                 ;C - - - - - 0x017CDA 0B:BCCA: 9D 10 04
	LDA #$00                        ;C - - - - - 0x017CDD 0B:BCCD: A9 00
	STA objVelXLo,X                 ;C - - - - - 0x017CDF 0B:BCCF: 9D 00 04
	STA objVelYLo,X                 ;C - - - - - 0x017CE2 0B:BCD2: 9D 20 04
	STA objVelYHi,X                 ;C - - - - - 0x017CE5 0B:BCD5: 9D 30 04
	RTS                             ;C - - - - - 0x017CE8 0B:BCD8: 60
SetAnimBD:
	LDA #$BD                        ;C - - - - - 0x017CE9 0B:BCD9: A9 BD
	CMP objAnim,X                   ;C - - - - - 0x017CEB 0B:BCDB: DD 80 05
	BEQ loc_0B_BCE5                 ;C - - - - - 0x017CEE 0B:BCDE: F0 05
	LDY #$38                        ;C - - - - - 0x017CF0 0B:BCE0: A0 38
	JSR SetAnimXChr4                ;C - - - - - 0x017CF2 0B:BCE2: 20 49 F4
loc_0B_BCE5:
	RTS                             ;C - - - - - 0x017CF5 0B:BCE5: 60
EnemyRandomJumpTbl_BCE6:
	.lobytes EnemyRandomJumpTbl_BCE6_00, EnemyRandomJumpTbl_BCE6_01, EnemyRandomJumpTbl_BCE6_02, EnemyRandomJumpTbl_BCE6_03, EnemyRandomJumpTbl_BCE6_04, EnemyRandomJumpTbl_BCE6_05;- D 1 - - - 0x017CF6 0B:BCE6:
EnemyRandomJumpTbl_BCEC:
	.lobytes EnemyRandomJumpTbl_BCEC_00, EnemyRandomJumpTbl_BCE6_01, EnemyRandomJumpTbl_BCE6_02, EnemyRandomJumpTbl_BCEC_03, EnemyRandomJumpTbl_BCEC_04, EnemyRandomJumpTbl_BCEC_05, EnemyRandomJumpTbl_BCEC_06, EnemyRandomJumpTbl_BCEC_07;- D 1 - - - 0x017CFC 0B:BCEC:
	.lobytes EnemyRandomJumpTbl_BCEC_08, EnemyRandomJumpTbl_BCEC_09, EnemyRandomJumpTbl_BCEC_0A;- D 1 - - - 0x017D04 0B:BCF4:
EnemyRandomJumpTbl_BCF7:
	.hibytes EnemyRandomJumpTbl_BCE6_00, EnemyRandomJumpTbl_BCE6_01, EnemyRandomJumpTbl_BCE6_02, EnemyRandomJumpTbl_BCE6_03, EnemyRandomJumpTbl_BCE6_04, EnemyRandomJumpTbl_BCE6_05;- D 1 - - - 0x017D07 0B:BCF7:
EnemyRandomJumpTbl_BCFD:
	.hibytes EnemyRandomJumpTbl_BCEC_00, EnemyRandomJumpTbl_BCE6_01, EnemyRandomJumpTbl_BCE6_02, EnemyRandomJumpTbl_BCEC_03, EnemyRandomJumpTbl_BCEC_04, EnemyRandomJumpTbl_BCEC_05, EnemyRandomJumpTbl_BCEC_06, EnemyRandomJumpTbl_BCEC_07;- D 1 - - - 0x017D0D 0B:BCFD:
	.hibytes EnemyRandomJumpTbl_BCEC_08, EnemyRandomJumpTbl_BCEC_09, EnemyRandomJumpTbl_BCEC_0A;- D 1 - - - 0x017D15 0B:BD05:
SpawnProjectileC7Tbl_BD08:
	.byte $1A                       ;- D 1 - - - 0x017D18 0B:BD08:
SpawnProjectileC7Tbl_BD09:
	.byte $00,$E6,$FF               ;- D 1 - - - 0x017D19 0B:BD09:
EnemyRandomJumpTbl_BD0C:
	.byte $00,$00,$01,$02,$02,$02,$01,$00,$00,$00,$01,$02,$02,$02,$01,$00;- D 1 - - - 0x017D1C 0B:BD0C:
EnemyRandomJumpTbl_BD1C:
	.byte $00,$F4,$C4,$4F,$80,$4F,$C4,$F4,$00,$F4,$C4,$4F,$80,$4F,$C4,$F4;- D 1 - - - 0x017D2C 0B:BD1C:
EnemyRandomJumpTbl_BD2C:
	.byte $02,$02,$01,$00,$00,$00,$01,$02,$02,$02,$01,$00,$00,$00,$01,$02;- D 1 - - - 0x017D3C 0B:BD2C:
EnemyRandomJumpTbl_BD3C:
	.byte $80,$4F,$C4,$F4,$00,$F4,$C4,$4F,$80,$4F,$C4,$F4,$00,$F4,$C4,$4F;- D 1 - - - 0x017D4C 0B:BD3C:
EnemyRandomJumpTbl_BD4C:
	.byte $04,$05,$06,$07,$88,$09,$0A,$0B,$0C,$0D,$0E,$0F,$80,$01,$02,$03;- D 1 - - - 0x017D5C 0B:BD4C:
EnemyRandomJumpTbl_BD5C:
	.byte $0C,$0D,$0E,$0F,$80,$01,$02,$03,$04,$05,$06,$07,$88,$09,$0A,$0B;- - - - - - 0x017D6C 0B:BD5C:
EnemyRandomJumpTbl_BD6C:
	.byte $03                       ;- D 1 - - - 0x017D7C 0B:BD6C:
	.byte $0A,$08,$0A,$03,$0A,$08,$0A;- - - - - - 0x017D7D 0B:BD6D:
	.byte $03                       ;- D 1 - - - 0x017D84 0B:BD74:
	.byte $0A,$08,$0A,$03,$0A,$08,$0A;- - - - - - 0x017D85 0B:BD75:
EnemyRandomJumpTbl_BD7C:
	.byte $00                       ;- D 1 - - - 0x017D8C 0B:BD7C:
	.byte $04,$08                   ;- - - - - - 0x017D8D 0B:BD7D:
loc_0B_BD7F:
	LDA #$F9                        ;C - - - - - 0x017D8F 0B:BD7F: A9 F9
	STA gameOverFlag                ;C - - - - - 0x017D91 0B:BD81: 85 62
	LDA #$01                        ;C - - - - - 0x017D93 0B:BD83: A9 01
	STA objDownState,X              ;C - - - - - 0x017D95 0B:BD85: 9D C0 04
	LDA objActive,X                 ;C - - - - - 0x017D98 0B:BD88: BD 00 03
	AND #$0F                        ;C - - - - - 0x017D9B 0B:BD8B: 29 0F
	TAY                             ;C - - - - - 0x017D9D 0B:BD8D: A8
	LDA SetAnimBDTbl_BF9F,Y         ;C - - - - - 0x017D9E 0B:BD8E: B9 9F BF
	STA ptr_00                      ;C - - - - - 0x017DA1 0B:BD91: 85 00
	LDA SetAnimBDTbl_BFA7,Y         ;C - - - - - 0x017DA3 0B:BD93: B9 A7 BF
	STA ptr_00+1                    ;C - - - - - 0x017DA6 0B:BD96: 85 01
	JMP (ptr_00)                    ;C - - - - - 0x017DA8 0B:BD98: 6C 00 00
SetAnimBDTbl_BF9F_00:
	LDA #$80                        ;C - - J - - 0x017DAB 0B:BD9B: A9 80
	STA padPressed                  ;C - - - - - 0x017DAD 0B:BD9D: 85 14
	STA padHeld                     ;C - - - - - 0x017DAF 0B:BD9F: 85 16
	LDA #$00                        ;C - - - - - 0x017DB1 0B:BDA1: A9 00
	STA gameAction                  ;C - - - - - 0x017DB3 0B:BDA3: 85 30
	STX objSpriteAir+15             ;C - - - - - 0x017DB5 0B:BDA5: 8E FF 04
	JSR RunGameAction               ;C - - - - - 0x017DB8 0B:BDA8: 20 B9 C9
	LDX objSpriteAir+15             ;C - - - - - 0x017DBB 0B:BDAB: AE FF 04
	LDA #$28                        ;C - - - - - 0x017DBE 0B:BDAE: A9 28
	STA gameAction                  ;C - - - - - 0x017DC0 0B:BDB0: 85 30
	LDA #$CD                        ;C - - - - - 0x017DC2 0B:BDB2: A9 CD
	LDY #$34                        ;C - - - - - 0x017DC4 0B:BDB4: A0 34
	JSR SetAnimXChr4                ;C - - - - - 0x017DC6 0B:BDB6: 20 49 F4
	INC objActive,X                 ;C - - - - - 0x017DC9 0B:BDB9: FE 00 03
	JMP loc_0B_BFAF                 ;C - - - - - 0x017DCC 0B:BDBC: 4C AF BF
SetAnimBDTbl_BF9F_01:
	LDA playerFacing                ;C - - J - - 0x017DCF 0B:BDBF: A5 31
	EOR #$FF                        ;C - - - - - 0x017DD1 0B:BDC1: 49 FF
	AND #$03                        ;C - - - - - 0x017DD3 0B:BDC3: 29 03
	STA ram_0032                    ;C - - - - - 0x017DD5 0B:BDC5: 85 32
	STA padPressed                  ;C - - - - - 0x017DD7 0B:BDC7: 85 14
	STA padHeld                     ;C - - - - - 0x017DD9 0B:BDC9: 85 16
	LDA #$01                        ;C - - - - - 0x017DDB 0B:BDCB: A9 01
	STA gameAction                  ;C - - - - - 0x017DDD 0B:BDCD: 85 30
	STX objSpriteAir+15             ;C - - - - - 0x017DDF 0B:BDCF: 8E FF 04
	JSR RunGameAction               ;C - - - - - 0x017DE2 0B:BDD2: 20 B9 C9
	LDX objSpriteAir+15             ;C - - - - - 0x017DE5 0B:BDD5: AE FF 04
	LDA gameAction                  ;C - - - - - 0x017DE8 0B:BDD8: A5 30
	CMP #$02                        ;C - - - - - 0x017DEA 0B:BDDA: C9 02
	BNE loc_0B_BDE1                 ;C - - - - - 0x017DEC 0B:BDDC: D0 03
	INC objActive,X                 ;C - - - - - 0x017DEE 0B:BDDE: FE 00 03
loc_0B_BDE1:
	LDA #$28                        ;C - - - - - 0x017DF1 0B:BDE1: A9 28
	STA gameAction                  ;C - - - - - 0x017DF3 0B:BDE3: 85 30
	RTS                             ;C - - - - - 0x017DF5 0B:BDE5: 60
SetAnimBDTbl_BF9F_02:
	LDY objParamA,X                 ;C - - J - - 0x017DF6 0B:BDE6: BC 10 05
	LDA objActive,Y                 ;C - - - - - 0x017DF9 0B:BDE9: B9 00 03
	BMI loc_0B_BE22                 ;C - - - - - 0x017DFC 0B:BDEC: 30 34
	LDA #$FF                        ;C - - - - - 0x017DFE 0B:BDEE: A9 FF
	STA gameOverFlag                ;C - - - - - 0x017E00 0B:BDF0: 85 62
	LDA #$0F                        ;C - - - - - 0x017E02 0B:BDF2: A9 0F
	JSR QueueSoundSaved             ;C - - - - - 0x017E04 0B:BDF4: 20 4A F3
	LDA #$50                        ;C - - - - - 0x017E07 0B:BDF7: A9 50
	STA objTimer,X                  ;C - - - - - 0x017E09 0B:BDF9: 9D D0 05
	LDA #$86                        ;C - - - - - 0x017E0C 0B:BDFC: A9 86
	STA objActive,X                 ;C - - - - - 0x017E0E 0B:BDFE: 9D 00 03
	LDA #$83                        ;C - - - - - 0x017E11 0B:BE01: A9 83
	STA objStep,X                   ;C - - - - - 0x017E13 0B:BE03: 9D 00 05
	LDA #$00                        ;C - - - - - 0x017E16 0B:BE06: A9 00
	STA objSubStep                  ;C - - - - - 0x017E18 0B:BE08: 8D 50 05
	STA playerBusy                  ;C - - - - - 0x017E1B 0B:BE0B: 85 6E
	STA flashTimerB                 ;C - - - - - 0x017E1D 0B:BE0D: 85 6A
	LDA #$01                        ;C - - - - - 0x017E1F 0B:BE0F: A9 01
	STA flashTimerA                 ;C - - - - - 0x017E21 0B:BE11: 85 69
	JSR UpdatePlayerFlash           ;C - - - - - 0x017E23 0B:BE13: 20 D1 CE
	LDA playerId                    ;C - - - - - 0x017E26 0B:BE16: A5 34
	STA objParamB,X                 ;C - - - - - 0x017E28 0B:BE18: 9D 20 05
	BNE loc_0B_BE22                 ;C - - - - - 0x017E2B 0B:BE1B: D0 05
	LDA #$D0                        ;C - - - - - 0x017E2D 0B:BE1D: A9 D0
	STA objFlags                    ;C - - - - - 0x017E2F 0B:BE1F: 8D 60 05
loc_0B_BE22:
	RTS                             ;C - - - - - 0x017E32 0B:BE22: 60
SetAnimBDTbl_BF9F_03:
	LDA objFlags                    ;C - - J - - 0x017E33 0B:BE23: AD 60 05
	AND #$FB                        ;C - - - - - 0x017E36 0B:BE26: 29 FB
	STA objFlags                    ;C - - - - - 0x017E38 0B:BE28: 8D 60 05
	LDA playerId                    ;C - - - - - 0x017E3B 0B:BE2B: A5 34
	BEQ loc_0B_BE36                 ;C - - - - - 0x017E3D 0B:BE2D: F0 07
	CMP #$01                        ;C - - - - - 0x017E3F 0B:BE2F: C9 01
	BEQ loc_0B_BE8E                 ;C - - - - - 0x017E41 0B:BE31: F0 5B
	JMP loc_0B_BECE                 ;C - - - - - 0x017E43 0B:BE33: 4C CE BE
loc_0B_BE36:
	LDA objSubStep                  ;C - - - - - 0x017E46 0B:BE36: AD 50 05
	CMP #$01                        ;C - - - - - 0x017E49 0B:BE39: C9 01
	BEQ loc_0B_BE59                 ;C - - - - - 0x017E4B 0B:BE3B: F0 1C
	CMP #$02                        ;C - - - - - 0x017E4D 0B:BE3D: C9 02
	BEQ loc_0B_BE6F                 ;C - - - - - 0x017E4F 0B:BE3F: F0 2E
	CMP #$03                        ;C - - - - - 0x017E51 0B:BE41: C9 03
	BEQ ForcePlayerId2              ;C - - - - - 0x017E53 0B:BE43: F0 34
	JSR FindFreeEnemySlot           ;C - - - - - 0x017E55 0B:BE45: 20 1A F7
	LDA #$80                        ;C - - - - - 0x017E58 0B:BE48: A9 80
	STA objActive,Y                 ;C - - - - - 0x017E5A 0B:BE4A: 99 00 03
	STA objTimer,X                  ;C - - - - - 0x017E5D 0B:BE4D: 9D D0 05
	LDA #$9C                        ;C - - - - - 0x017E60 0B:BE50: A9 9C
	STA objKind,Y                   ;C - - - - - 0x017E62 0B:BE52: 99 20 03
	STA objId,Y                     ;C - - - - - 0x017E65 0B:BE55: 99 30 03
	RTS                             ;C - - - - - 0x017E68 0B:BE58: 60
loc_0B_BE59:
	LDA objTimer,X                  ;C - - - - - 0x017E69 0B:BE59: BD D0 05
	AND #$07                        ;C - - - - - 0x017E6C 0B:BE5C: 29 07
	BNE loc_0B_BE65                 ;C - - - - - 0x017E6E 0B:BE5E: D0 05
	LDA #$13                        ;C - - - - - 0x017E70 0B:BE60: A9 13
	JSR QueueSound                  ;C - - - - - 0x017E72 0B:BE62: 20 4C F3
loc_0B_BE65:
	INC objTimer,X                  ;C - - - - - 0x017E75 0B:BE65: FE D0 05
	INC objX                        ;C - - - - - 0x017E78 0B:BE68: EE 60 03
	INC objX                        ;C - - - - - 0x017E7B 0B:BE6B: EE 60 03
	RTS                             ;C - - - - - 0x017E7E 0B:BE6E: 60
loc_0B_BE6F:
	LDA #$03                        ;C - - - - - 0x017E7F 0B:BE6F: A9 03
	JSR SetPlayerAnim               ;C - - - - - 0x017E81 0B:BE71: 20 94 F2
	LDA #$08                        ;C - - - - - 0x017E84 0B:BE74: A9 08
	JMP SetChrBank2                 ;C - - - - - 0x017E86 0B:BE76: 4C 40 F4
ForcePlayerId2:
	DEC playerLevel                 ;C - - - - - 0x017E89 0B:BE79: C6 6B
	DEC playerLevel                 ;C - - - - - 0x017E8B 0B:BE7B: C6 6B
	LDA #$02                        ;C - - - - - 0x017E8D 0B:BE7D: A9 02
	STA playerId                    ;C - - - - - 0x017E8F 0B:BE7F: 85 34
	LDA #$19                        ;C - - - - - 0x017E91 0B:BE81: A9 19
	STA palBuffer+23                ;C - - - - - 0x017E93 0B:BE83: 8D 17 06
	LDA #$30                        ;C - - - - - 0x017E96 0B:BE86: A9 30
	STA palBuffer+22                ;C - - - - - 0x017E98 0B:BE88: 8D 16 06
	STA palUpdateFlag               ;C - - - - - 0x017E9B 0B:BE8B: 85 18
	RTS                             ;C - - - - - 0x017E9D 0B:BE8D: 60
loc_0B_BE8E:
	LDA #$02                        ;C - - - - - 0x017E9E 0B:BE8E: A9 02
	STA padPressed                  ;C - - - - - 0x017EA0 0B:BE90: 85 14
	STA padHeld                     ;C - - - - - 0x017EA2 0B:BE92: 85 16
	LDA #$00                        ;C - - - - - 0x017EA4 0B:BE94: A9 00
	STA gameAction                  ;C - - - - - 0x017EA6 0B:BE96: 85 30
	STX objSpriteAir+15             ;C - - - - - 0x017EA8 0B:BE98: 8E FF 04
	JSR RunGameAction               ;C - - - - - 0x017EAB 0B:BE9B: 20 B9 C9
	LDX objSpriteAir+15             ;C - - - - - 0x017EAE 0B:BE9E: AE FF 04
	LDA objX                        ;C - - - - - 0x017EB1 0B:BEA1: AD 60 03
	CMP #$1B                        ;C - - - - - 0x017EB4 0B:BEA4: C9 1B
	BCS loc_0B_BEC9                 ;C - - - - - 0x017EB6 0B:BEA6: B0 21
	LDA #$94                        ;C - - - - - 0x017EB8 0B:BEA8: A9 94
	STA objFlags                    ;C - - - - - 0x017EBA 0B:BEAA: 8D 60 05
	JSR ForcePlayerId2              ;C - - - - - 0x017EBD 0B:BEAD: 20 79 BE
	LDA #$9A                        ;C - - - - - 0x017EC0 0B:BEB0: A9 9A
	STA objY                        ;C - - - - - 0x017EC2 0B:BEB2: 8D C0 03
	LDA #$00                        ;C - - - - - 0x017EC5 0B:BEB5: A9 00
	STA objX                        ;C - - - - - 0x017EC7 0B:BEB7: 8D 60 03
	LDA #$83                        ;C - - - - - 0x017ECA 0B:BEBA: A9 83
	STA objStep,X                   ;C - - - - - 0x017ECC 0B:BEBC: 9D 00 05
	LDA #$86                        ;C - - - - - 0x017ECF 0B:BEBF: A9 86
	STA objActive,X                 ;C - - - - - 0x017ED1 0B:BEC1: 9D 00 03
	LDA #$80                        ;C - - - - - 0x017ED4 0B:BEC4: A9 80
	STA objTimer,X                  ;C - - - - - 0x017ED6 0B:BEC6: 9D D0 05
loc_0B_BEC9:
	LDA #$28                        ;C - - - - - 0x017ED9 0B:BEC9: A9 28
	STA gameAction                  ;C - - - - - 0x017EDB 0B:BECB: 85 30
	RTS                             ;C - - - - - 0x017EDD 0B:BECD: 60
loc_0B_BECE:
	LDA #$08                        ;C - - - - - 0x017EDE 0B:BECE: A9 08
	JSR SetChrBank2                 ;C - - - - - 0x017EE0 0B:BED0: 20 40 F4
	LDA objY                        ;C - - - - - 0x017EE3 0B:BED3: AD C0 03
	CMP #$99                        ;C - - - - - 0x017EE6 0B:BED6: C9 99
	BCS loc_0B_BEDE                 ;C - - - - - 0x017EE8 0B:BED8: B0 04
	LDA #$04                        ;C - - - - - 0x017EEA 0B:BEDA: A9 04
	BNE loc_0B_BEF7                 ;C - - - - - 0x017EEC 0B:BEDC: D0 19
loc_0B_BEDE:
	CMP #$9B                        ;C - - - - - 0x017EEE 0B:BEDE: C9 9B
	BCC loc_0B_BEE6                 ;C - - - - - 0x017EF0 0B:BEE0: 90 04
	LDA #$08                        ;C - - - - - 0x017EF2 0B:BEE2: A9 08
	BNE loc_0B_BEF7                 ;C - - - - - 0x017EF4 0B:BEE4: D0 11
loc_0B_BEE6:
	LDA objX                        ;C - - - - - 0x017EF6 0B:BEE6: AD 60 03
	CMP #$97                        ;C - - - - - 0x017EF9 0B:BEE9: C9 97
	BCS loc_0B_BEF1                 ;C - - - - - 0x017EFB 0B:BEEB: B0 04
	LDA #$01                        ;C - - - - - 0x017EFD 0B:BEED: A9 01
	BNE loc_0B_BEF7                 ;C - - - - - 0x017EFF 0B:BEEF: D0 06
loc_0B_BEF1:
	CMP #$99                        ;C - - - - - 0x017F01 0B:BEF1: C9 99
	BCC loc_0B_BF0D                 ;C - - - - - 0x017F03 0B:BEF3: 90 18
	LDA #$02                        ;C - - - - - 0x017F05 0B:BEF5: A9 02
loc_0B_BEF7:
	STA padPressed                  ;C - - - - - 0x017F07 0B:BEF7: 85 14
	STA padHeld                     ;C - - - - - 0x017F09 0B:BEF9: 85 16
	LDA #$00                        ;C - - - - - 0x017F0B 0B:BEFB: A9 00
	STA gameAction                  ;C - - - - - 0x017F0D 0B:BEFD: 85 30
	STX objSpriteAir+15             ;C - - - - - 0x017F0F 0B:BEFF: 8E FF 04
	JSR RunGameAction               ;C - - - - - 0x017F12 0B:BF02: 20 B9 C9
	LDX objSpriteAir+15             ;C - - - - - 0x017F15 0B:BF05: AE FF 04
	LDA #$28                        ;C - - - - - 0x017F18 0B:BF08: A9 28
	STA gameAction                  ;C - - - - - 0x017F1A 0B:BF0A: 85 30
	RTS                             ;C - - - - - 0x017F1C 0B:BF0C: 60
loc_0B_BF0D:
	LDA #$D0                        ;C - - - - - 0x017F1D 0B:BF0D: A9 D0
	STA objFlags                    ;C - - - - - 0x017F1F 0B:BF0F: 8D 60 05
	LDA #$0A                        ;C - - - - - 0x017F22 0B:BF12: A9 0A
	STA gameAction                  ;C - - - - - 0x017F24 0B:BF14: 85 30
	LDA #$7B                        ;C - - - - - 0x017F26 0B:BF16: A9 7B
	STA objKind,X                   ;C - - - - - 0x017F28 0B:BF18: 9D 20 03
	LDA #$50                        ;C - - - - - 0x017F2B 0B:BF1B: A9 50
	STA objTimer,X                  ;C - - - - - 0x017F2D 0B:BF1D: 9D D0 05
	LDA #$84                        ;C - - - - - 0x017F30 0B:BF20: A9 84
	STA objStep,X                   ;C - - - - - 0x017F32 0B:BF22: 9D 00 05
	LDA #$86                        ;C - - - - - 0x017F35 0B:BF25: A9 86
	STA objActive,X                 ;C - - - - - 0x017F37 0B:BF27: 9D 00 03
	RTS                             ;C - - - - - 0x017F3A 0B:BF2A: 60
SetAnimBDTbl_BF9F_04:
	LDA #$90                        ;C - - J - - 0x017F3B 0B:BF2B: A9 90
	STA objFlags,X                  ;C - - - - - 0x017F3D 0B:BF2D: 9D 60 05
	LDA #$01                        ;C - - - - - 0x017F40 0B:BF30: A9 01
	STA objVelXHi,X                 ;C - - - - - 0x017F42 0B:BF32: 9D 10 04
	STA objVelXLo,X                 ;C - - - - - 0x017F45 0B:BF35: 9D 00 04
	LDA #$F8                        ;C - - - - - 0x017F48 0B:BF38: A9 F8
	STA objX,X                      ;C - - - - - 0x017F4A 0B:BF3A: 9D 60 03
	LDA #$98                        ;C - - - - - 0x017F4D 0B:BF3D: A9 98
	STA objY,X                      ;C - - - - - 0x017F4F 0B:BF3F: 9D C0 03
	LDA #$23                        ;C - - - - - 0x017F52 0B:BF42: A9 23
	JSR SetAnimX                    ;C - - - - - 0x017F54 0B:BF44: 20 88 F2
	LDA #$36                        ;C - - - - - 0x017F57 0B:BF47: A9 36
	STA chrBankShadow+3             ;C - - - - - 0x017F59 0B:BF49: 85 EB
	LDA #$15                        ;C - - - - - 0x017F5B 0B:BF4B: A9 15
	STA palBuffer+27                ;C - - - - - 0x017F5D 0B:BF4D: 8D 1B 06
	LDA #$26                        ;C - - - - - 0x017F60 0B:BF50: A9 26
	STA palBuffer+26                ;C - - - - - 0x017F62 0B:BF52: 8D 1A 06
	STA palUpdateFlag               ;C - - - - - 0x017F65 0B:BF55: 85 18
	INC objActive,X                 ;C - - - - - 0x017F67 0B:BF57: FE 00 03
	RTS                             ;C - - - - - 0x017F6A 0B:BF5A: 60
SetAnimBDTbl_BF9F_05:
	JSR ApplyVelXSub                ;C - - J - - 0x017F6B 0B:BF5B: 20 A1 F1
	LDA objX,X                      ;C - - - - - 0x017F6E 0B:BF5E: BD 60 03
	CMP #$B0                        ;C - - - - - 0x017F71 0B:BF61: C9 B0
	BCS loc_0B_BF74                 ;C - - - - - 0x017F73 0B:BF63: B0 0F
	LDA #$22                        ;C - - - - - 0x017F75 0B:BF65: A9 22
	JSR SetAnimX                    ;C - - - - - 0x017F77 0B:BF67: 20 88 F2
	LDA #$FF                        ;C - - - - - 0x017F7A 0B:BF6A: A9 FF
	STA objTimer,X                  ;C - - - - - 0x017F7C 0B:BF6C: 9D D0 05
	LDA #$87                        ;C - - - - - 0x017F7F 0B:BF6F: A9 87
	STA objActive,X                 ;C - - - - - 0x017F81 0B:BF71: 9D 00 03
loc_0B_BF74:
	RTS                             ;C - - - - - 0x017F84 0B:BF74: 60
SetAnimBDTbl_BF9F_06:
	LDA objParamB,X                 ;C - - J - - 0x017F85 0B:BF75: BD 20 05
	CMP playerId                    ;C - - - - - 0x017F88 0B:BF78: C5 34
	BNE loc_0B_BF80                 ;C - - - - - 0x017F8A 0B:BF7A: D0 04
	LDA #$00                        ;C - - - - - 0x017F8C 0B:BF7C: A9 00
	STA gameOverFlag                ;C - - - - - 0x017F8E 0B:BF7E: 85 62
loc_0B_BF80:
	LDA #$28                        ;C - - - - - 0x017F90 0B:BF80: A9 28
	STA gameAction                  ;C - - - - - 0x017F92 0B:BF82: 85 30
	DEC objTimer,X                  ;C - - - - - 0x017F94 0B:BF84: DE D0 05
	BNE loc_0B_BF8F                 ;C - - - - - 0x017F97 0B:BF87: D0 06
	LDA objStep,X                   ;C - - - - - 0x017F99 0B:BF89: BD 00 05
	STA objActive,X                 ;C - - - - - 0x017F9C 0B:BF8C: 9D 00 03
loc_0B_BF8F:
	RTS                             ;C - - - - - 0x017F9F 0B:BF8F: 60
SetAnimBDTbl_BF9F_07:
	DEC objTimer,X                  ;C - - J - - 0x017FA0 0B:BF90: DE D0 05
	BNE loc_0B_BF9E                 ;C - - - - - 0x017FA3 0B:BF93: D0 09
	LDA #$0E                        ;C - - - - - 0x017FA5 0B:BF95: A9 0E
	STA gameAction                  ;C - - - - - 0x017FA7 0B:BF97: 85 30
	LDA objParamB,X                 ;C - - - - - 0x017FA9 0B:BF99: BD 20 05
	STA playerId                    ;C - - - - - 0x017FAC 0B:BF9C: 85 34
loc_0B_BF9E:
	RTS                             ;C - - - - - 0x017FAE 0B:BF9E: 60
SetAnimBDTbl_BF9F:
	.lobytes SetAnimBDTbl_BF9F_00, SetAnimBDTbl_BF9F_01, SetAnimBDTbl_BF9F_02, SetAnimBDTbl_BF9F_03, SetAnimBDTbl_BF9F_04, SetAnimBDTbl_BF9F_05, SetAnimBDTbl_BF9F_06, SetAnimBDTbl_BF9F_07;- D 1 - - - 0x017FAF 0B:BF9F:
SetAnimBDTbl_BFA7:
	.hibytes SetAnimBDTbl_BF9F_00, SetAnimBDTbl_BF9F_01, SetAnimBDTbl_BF9F_02, SetAnimBDTbl_BF9F_03, SetAnimBDTbl_BF9F_04, SetAnimBDTbl_BF9F_05, SetAnimBDTbl_BF9F_06, SetAnimBDTbl_BF9F_07;- D 1 - - - 0x017FB7 0B:BFA7:
loc_0B_BFAF:
	JSR FindFreeEnemySlot           ;C - - - - - 0x017FBF 0B:BFAF: 20 1A F7
	BCS loc_0B_BFED                 ;C - - - - - 0x017FC2 0B:BFB2: B0 39
	LDA objX,X                      ;C - - - - - 0x017FC4 0B:BFB4: BD 60 03
	STA objX,Y                      ;C - - - - - 0x017FC7 0B:BFB7: 99 60 03
	LDA objY,X                      ;C - - - - - 0x017FCA 0B:BFBA: BD C0 03
	STA objY,Y                      ;C - - - - - 0x017FCD 0B:BFBD: 99 C0 03
	LDA #$02                        ;C - - - - - 0x017FD0 0B:BFC0: A9 02
	STA objXPage,Y                  ;C - - - - - 0x017FD2 0B:BFC2: 99 80 03
	LDA #$FF                        ;C - - - - - 0x017FD5 0B:BFC5: A9 FF
	STA ram_001B                    ;C - - - - - 0x017FD7 0B:BFC7: 85 1B
	LDA #$9E                        ;C - - - - - 0x017FD9 0B:BFC9: A9 9E
	STA objKind,Y                   ;C - - - - - 0x017FDB 0B:BFCB: 99 20 03
	STA objId,Y                     ;C - - - - - 0x017FDE 0B:BFCE: 99 30 03
	LDA #$80                        ;C - - - - - 0x017FE1 0B:BFD1: A9 80
	STA objActive,Y                 ;C - - - - - 0x017FE3 0B:BFD3: 99 00 03
	LDA #$FF                        ;C - - - - - 0x017FE6 0B:BFD6: A9 FF
	STA objDownState,Y              ;C - - - - - 0x017FE8 0B:BFD8: 99 C0 04
	LDA #$E0                        ;C - - - - - 0x017FEB 0B:BFDB: A9 E0
	STA objTimer,Y                  ;C - - - - - 0x017FED 0B:BFDD: 99 D0 05
	TXA                             ;C - - - - - 0x017FF0 0B:BFE0: 8A
	STA objStep,Y                   ;C - - - - - 0x017FF1 0B:BFE1: 99 00 05
	LDA #$94                        ;C - - - - - 0x017FF4 0B:BFE4: A9 94
	STA objFlags,Y                  ;C - - - - - 0x017FF6 0B:BFE6: 99 60 05
	TYA                             ;C - - - - - 0x017FF9 0B:BFE9: 98
	STA objParamA,X                 ;C - - - - - 0x017FFA 0B:BFEA: 9D 10 05
loc_0B_BFED:
	RTS                             ;C - - - - - 0x017FFD 0B:BFED: 60
	.byte $10,$00,$86,$84,$00,$00,$02,$00,$0A,$00,$08,$00,$04,$01,$00,$00;- - - - - - 0x017FFE 0B:BFEE:
	.byte $0A,$00                   ;- - - - - - 0x01800E 0B:BFFE:
