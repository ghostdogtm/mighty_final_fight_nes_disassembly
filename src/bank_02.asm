.segment "BANK_02"
; 0x004010-0x00600F  CPU $8000-$9FFF

; animation script pointers (128), low bytes; hi at 02:8080
animLo_02:
	.lobytes anim_02_8300, anim_02_8303, anim_02_830F, anim_02_8312, anim_02_831A, anim_02_8324, anim_02_8327, anim_02_832A;- D 0 - - - 0x004010 02:8000:
	.lobytes anim_02_832D, anim_02_8330, anim_02_8340, anim_02_8343, anim_02_8346, anim_02_8349, anim_02_834C, anim_02_834F;- D 0 - - - 0x004018 02:8008:
	.lobytes anim_02_8352, anim_02_835E, anim_02_8365, anim_02_836D, anim_02_8370, anim_02_8373, anim_02_8376, anim_02_8379;- D 0 - - - 0x004020 02:8010:
	.lobytes anim_02_837C, anim_02_837F, anim_02_8397, anim_02_839A, anim_02_83A2, anim_02_83A5, anim_02_83A8, anim_02_83AB;- D 0 - - - 0x004028 02:8018:
	.lobytes anim_02_83AE, anim_02_83B1, anim_02_83B4, anim_02_83BA, anim_02_83C6, anim_02_83CC, anim_02_83CF, anim_02_83D2;- D 0 - - - 0x004030 02:8020:
	.lobytes anim_02_83DA, anim_02_83DE, anim_02_83E1, anim_02_83E4, anim_02_83E7, anim_02_83ED, anim_02_83F0, anim_02_83F3;- D 0 - - - 0x004038 02:8028:
	.lobytes anim_02_83F6, anim_02_83F9, anim_02_83FC, anim_02_83FF, anim_02_8402, anim_02_8405, anim_02_8408, anim_02_840B;- D 0 - - - 0x004040 02:8030:
	.lobytes anim_02_840E, anim_02_8411, anim_02_8414, anim_02_841E, anim_02_8421, anim_02_8424, anim_02_842A, anim_02_842D;- D 0 - - - 0x004048 02:8038:
	.lobytes anim_02_8434, anim_02_843C, anim_02_843F, anim_02_8443, anim_02_8446, anim_02_8449, anim_02_844C, anim_02_844F;- D 0 - - - 0x004050 02:8040:
	.lobytes anim_02_8454, anim_02_845E, anim_02_8461, anim_02_8464, anim_02_8488, anim_02_8490, anim_02_849E, anim_02_84A1;- D 0 - - - 0x004058 02:8048:
	.lobytes anim_02_84A4, anim_02_84AE, anim_02_84DE, anim_02_84FB, anim_02_8504, anim_02_8507, anim_02_850A, anim_02_850D;- - - - - - 0x004060 02:8050:
	.lobytes anim_02_8510, anim_02_8513, anim_02_852D, anim_02_855D, anim_02_8560, anim_02_8564, anim_02_8582, anim_02_8585;- D 0 - - - 0x004068 02:8058:
	.lobytes anim_02_8588, anim_02_858B, anim_02_858E, anim_02_8591, anim_02_8594, anim_02_8597, anim_02_859D, anim_02_85A0;- D 0 - - - 0x004070 02:8060:
	.lobytes anim_02_85A5, anim_02_85A8, anim_02_85B4, anim_02_85B7, anim_02_85BA, anim_02_85BD, anim_02_85C0, anim_02_85C3;- D 0 - - - 0x004078 02:8068:
	.lobytes anim_02_85C6, anim_02_85C9, anim_02_85CC, anim_02_85E4, anim_02_8600, anim_02_861C, anim_02_862A, anim_02_8636;- D 0 - - - 0x004080 02:8070:
	.lobytes anim_02_8639, anim_02_863C, anim_02_863F, anim_02_8642, anim_02_8645, anim_02_8648, anim_02_8652, anim_02_8655;- D 0 - - - 0x004088 02:8078:
animHi_02:
	.hibytes anim_02_8300, anim_02_8303, anim_02_830F, anim_02_8312, anim_02_831A, anim_02_8324, anim_02_8327, anim_02_832A;- D 0 - - - 0x004090 02:8080:
	.hibytes anim_02_832D, anim_02_8330, anim_02_8340, anim_02_8343, anim_02_8346, anim_02_8349, anim_02_834C, anim_02_834F;- D 0 - - - 0x004098 02:8088:
	.hibytes anim_02_8352, anim_02_835E, anim_02_8365, anim_02_836D, anim_02_8370, anim_02_8373, anim_02_8376, anim_02_8379;- D 0 - - - 0x0040A0 02:8090:
	.hibytes anim_02_837C, anim_02_837F, anim_02_8397, anim_02_839A, anim_02_83A2, anim_02_83A5, anim_02_83A8, anim_02_83AB;- D 0 - - - 0x0040A8 02:8098:
	.hibytes anim_02_83AE, anim_02_83B1, anim_02_83B4, anim_02_83BA, anim_02_83C6, anim_02_83CC, anim_02_83CF, anim_02_83D2;- D 0 - - - 0x0040B0 02:80A0:
	.hibytes anim_02_83DA, anim_02_83DE, anim_02_83E1, anim_02_83E4, anim_02_83E7, anim_02_83ED, anim_02_83F0, anim_02_83F3;- D 0 - - - 0x0040B8 02:80A8:
	.hibytes anim_02_83F6, anim_02_83F9, anim_02_83FC, anim_02_83FF, anim_02_8402, anim_02_8405, anim_02_8408, anim_02_840B;- D 0 - - - 0x0040C0 02:80B0:
	.hibytes anim_02_840E, anim_02_8411, anim_02_8414, anim_02_841E, anim_02_8421, anim_02_8424, anim_02_842A, anim_02_842D;- D 0 - - - 0x0040C8 02:80B8:
	.hibytes anim_02_8434, anim_02_843C, anim_02_843F, anim_02_8443, anim_02_8446, anim_02_8449, anim_02_844C, anim_02_844F;- D 0 - - - 0x0040D0 02:80C0:
	.hibytes anim_02_8454, anim_02_845E, anim_02_8461, anim_02_8464, anim_02_8488, anim_02_8490, anim_02_849E, anim_02_84A1;- D 0 - - - 0x0040D8 02:80C8:
	.hibytes anim_02_84A4, anim_02_84AE, anim_02_84DE, anim_02_84FB, anim_02_8504, anim_02_8507, anim_02_850A, anim_02_850D;- - - - - - 0x0040E0 02:80D0:
	.hibytes anim_02_8510, anim_02_8513, anim_02_852D, anim_02_855D, anim_02_8560, anim_02_8564, anim_02_8582, anim_02_8585;- D 0 - - - 0x0040E8 02:80D8:
	.hibytes anim_02_8588, anim_02_858B, anim_02_858E, anim_02_8591, anim_02_8594, anim_02_8597, anim_02_859D, anim_02_85A0;- D 0 - - - 0x0040F0 02:80E0:
	.hibytes anim_02_85A5, anim_02_85A8, anim_02_85B4, anim_02_85B7, anim_02_85BA, anim_02_85BD, anim_02_85C0, anim_02_85C3;- D 0 - - - 0x0040F8 02:80E8:
	.hibytes anim_02_85C6, anim_02_85C9, anim_02_85CC, anim_02_85E4, anim_02_8600, anim_02_861C, anim_02_862A, anim_02_8636;- D 0 - - - 0x004100 02:80F0:
	.hibytes anim_02_8639, anim_02_863C, anim_02_863F, anim_02_8642, anim_02_8645, anim_02_8648, anim_02_8652, anim_02_8655;- D 0 - - - 0x004108 02:80F8:
; frame pointers (256), low bytes; hi at 02:8200
frameLo_02:
	.lobytes frame_02_8658, frame_02_8658, frame_02_8670, frame_02_8684, frame_02_8698, frame_02_86AC, frame_02_86C0, frame_02_86D6;- - - - - - 0x004110 02:8100:
	.lobytes frame_02_86EE, frame_02_8706, frame_02_871C, frame_02_872E, frame_02_8746, frame_02_875C, frame_02_877A, frame_02_8792;- D 0 - - - 0x004118 02:8108:
	.lobytes frame_02_87AA, frame_02_87C0, frame_02_87D6, frame_02_87EC, frame_02_8802, frame_02_8816, frame_02_882C, frame_02_8844;- D 0 - - - 0x004120 02:8110:
	.lobytes frame_02_885C, frame_02_8870, frame_02_8884, frame_02_889C, frame_02_88B0, frame_02_88C6, frame_02_88DA, frame_02_88F0;- D 0 - - - 0x004128 02:8118:
	.lobytes frame_02_8906, frame_02_891C, frame_02_8932, frame_02_8944, frame_02_8958, frame_02_896E, frame_02_8982, frame_02_8994;- D 0 - - - 0x004130 02:8120:
	.lobytes frame_02_89AE, frame_02_89CA, frame_02_89E4, frame_02_89FC, frame_02_8A16, frame_02_8A30, frame_02_8A4E, frame_02_8A64;- D 0 - - - 0x004138 02:8128:
	.lobytes frame_02_8A80, frame_02_8A9A, frame_02_8AB4, frame_02_8ACC, frame_02_8AE2, frame_02_8AF6, frame_02_8B16, frame_02_8B2A;- D 0 - - - 0x004140 02:8130:
	.lobytes frame_02_8B3E, frame_02_8B52, frame_02_8B68, frame_02_8B7E, frame_02_8B96, frame_02_8BAC, frame_02_8BC8, frame_02_8BDE;- D 0 - - - 0x004148 02:8138:
	.lobytes frame_02_8BF8, frame_02_8C10, frame_02_8C26, frame_02_8C3A, frame_02_8C56, frame_02_8C74, frame_02_8C88, frame_02_8C9E;- D 0 - - - 0x004150 02:8140:
	.lobytes frame_02_8CB6, frame_02_8CCA, frame_02_8CE2, frame_02_8CF6, frame_02_8D10, frame_02_8D24, frame_02_8D3A, frame_02_8D4E;- D 0 - - - 0x004158 02:8148:
	.lobytes frame_02_8D70, frame_02_8D92, frame_02_8D98, frame_02_8D9C, frame_02_8DA2, frame_02_8DA8, frame_02_8DAC, frame_02_8DB0;- D 0 - - - 0x004160 02:8150:
	.lobytes frame_02_8DB6, frame_02_8DBC, frame_02_8DC0, frame_02_8DC6, frame_02_8DEA, frame_02_8E0E, frame_02_8E32, frame_02_8E5A;- D 0 - - - 0x004168 02:8158:
	.lobytes frame_02_8E82, frame_02_8EA6, frame_02_8ECC, frame_02_8EF6, frame_02_8F24, frame_02_8F24, frame_02_8F24, frame_02_8F24;- D 0 - - - 0x004170 02:8160:
	.lobytes frame_02_8F46, frame_02_8F6A, frame_02_8F6A, frame_02_8F90, frame_02_8FBC, frame_02_8FE0, frame_02_9000, frame_02_900C;- D 0 - - - 0x004178 02:8168:
	.lobytes frame_02_9014, frame_02_901C, frame_02_9022, frame_02_9028, frame_02_902E, frame_02_9034, frame_02_903A, frame_02_9040;- D 0 - - - 0x004180 02:8170:
	.lobytes frame_02_9046, frame_02_904C, frame_02_9070, frame_02_9096, frame_02_909A, frame_02_90A0, frame_02_90A6, frame_02_90C8;- D 0 - - - 0x004188 02:8178:
	.lobytes frame_02_90EA, frame_02_90EA, frame_02_90F0, frame_02_910A, frame_02_9134, frame_02_9156, frame_02_9178, frame_02_919E;- - - - - - 0x004190 02:8180:
	.lobytes frame_02_91C0, frame_02_91E4, frame_02_9206, frame_02_922A, frame_02_924C, frame_02_926E, frame_02_9290, frame_02_92B4;- - - - - - 0x004198 02:8188:
	.lobytes frame_02_92E0, frame_02_9304, frame_02_9332, frame_02_9354, frame_02_9378, frame_02_939C, frame_02_93BE, frame_02_93E0;- D 0 - - - 0x0041A0 02:8190:
	.lobytes frame_02_9402, frame_02_9426, frame_02_9448, frame_02_946A, frame_02_948C, frame_02_94B0, frame_02_94D8, frame_02_94FE;- D 0 - - - 0x0041A8 02:8198:
	.lobytes frame_02_9522, frame_02_9546, frame_02_956A, frame_02_9592, frame_02_95BA, frame_02_95E8, frame_02_960A, frame_02_962E;- D 0 - - - 0x0041B0 02:81A0:
	.lobytes frame_02_9656, frame_02_9680, frame_02_96AA, frame_02_96D4, frame_02_96FE, frame_02_9728, frame_02_9754, frame_02_9782;- D 0 - - - 0x0041B8 02:81A8:
	.lobytes frame_02_97B0, frame_02_97DC, frame_02_9806, frame_02_9832, frame_02_985E, frame_02_9880, frame_02_989E, frame_02_98C8;- D 0 - - - 0x0041C0 02:81B0:
	.lobytes frame_02_98F4, frame_02_9928, frame_02_9962, frame_02_9998, frame_02_99CE, frame_02_9A04, frame_02_9A3C, frame_02_9A78;- D 0 - - - 0x0041C8 02:81B8:
	.lobytes frame_02_9AB4, frame_02_9AF0, frame_02_9B2E, frame_02_9B68, frame_02_9B98, frame_02_9BD0, frame_02_9C06, frame_02_9C2C;- D 0 - - - 0x0041D0 02:81C0:
	.lobytes frame_02_9C5A, frame_02_9C80, frame_02_9CAC, frame_02_9CB2, frame_02_9CB8, frame_02_9CBE, frame_02_9CC4, frame_02_9CCA;- D 0 - - - 0x0041D8 02:81C8:
	.lobytes frame_02_9CD0, frame_02_9CD6, frame_02_9CDC, frame_02_9D02, frame_02_9D34, frame_02_9D5A, frame_02_9D82, frame_02_9DAA;- D 0 - - - 0x0041E0 02:81D0:
	.lobytes frame_02_9DD2, frame_02_9DEE, frame_02_9E06, frame_02_9E1C, frame_02_9E32, frame_02_9E48, frame_02_9E5E, frame_02_9E84;- D 0 - - - 0x0041E8 02:81D8:
	.lobytes frame_02_9EAE, frame_02_9EDA, frame_02_9F04, frame_02_9F28, frame_02_9F3C, frame_02_9F6E, frame_02_9F88, frame_02_9FA4;- D 0 - - - 0x0041F0 02:81E0:
	.lobytes frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4;- - - - - - 0x0041F8 02:81E8:
	.lobytes frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4;- - - - - - 0x004200 02:81F0:
	.lobytes frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4;- - - - - - 0x004208 02:81F8:
frameHi_02:
	.hibytes frame_02_8658, frame_02_8658, frame_02_8670, frame_02_8684, frame_02_8698, frame_02_86AC, frame_02_86C0, frame_02_86D6;- - - - - - 0x004210 02:8200:
	.hibytes frame_02_86EE, frame_02_8706, frame_02_871C, frame_02_872E, frame_02_8746, frame_02_875C, frame_02_877A, frame_02_8792;- D 0 - - - 0x004218 02:8208:
	.hibytes frame_02_87AA, frame_02_87C0, frame_02_87D6, frame_02_87EC, frame_02_8802, frame_02_8816, frame_02_882C, frame_02_8844;- D 0 - - - 0x004220 02:8210:
	.hibytes frame_02_885C, frame_02_8870, frame_02_8884, frame_02_889C, frame_02_88B0, frame_02_88C6, frame_02_88DA, frame_02_88F0;- D 0 - - - 0x004228 02:8218:
	.hibytes frame_02_8906, frame_02_891C, frame_02_8932, frame_02_8944, frame_02_8958, frame_02_896E, frame_02_8982, frame_02_8994;- D 0 - - - 0x004230 02:8220:
	.hibytes frame_02_89AE, frame_02_89CA, frame_02_89E4, frame_02_89FC, frame_02_8A16, frame_02_8A30, frame_02_8A4E, frame_02_8A64;- D 0 - - - 0x004238 02:8228:
	.hibytes frame_02_8A80, frame_02_8A9A, frame_02_8AB4, frame_02_8ACC, frame_02_8AE2, frame_02_8AF6, frame_02_8B16, frame_02_8B2A;- D 0 - - - 0x004240 02:8230:
	.hibytes frame_02_8B3E, frame_02_8B52, frame_02_8B68, frame_02_8B7E, frame_02_8B96, frame_02_8BAC, frame_02_8BC8, frame_02_8BDE;- D 0 - - - 0x004248 02:8238:
	.hibytes frame_02_8BF8, frame_02_8C10, frame_02_8C26, frame_02_8C3A, frame_02_8C56, frame_02_8C74, frame_02_8C88, frame_02_8C9E;- D 0 - - - 0x004250 02:8240:
	.hibytes frame_02_8CB6, frame_02_8CCA, frame_02_8CE2, frame_02_8CF6, frame_02_8D10, frame_02_8D24, frame_02_8D3A, frame_02_8D4E;- D 0 - - - 0x004258 02:8248:
	.hibytes frame_02_8D70, frame_02_8D92, frame_02_8D98, frame_02_8D9C, frame_02_8DA2, frame_02_8DA8, frame_02_8DAC, frame_02_8DB0;- D 0 - - - 0x004260 02:8250:
	.hibytes frame_02_8DB6, frame_02_8DBC, frame_02_8DC0, frame_02_8DC6, frame_02_8DEA, frame_02_8E0E, frame_02_8E32, frame_02_8E5A;- D 0 - - - 0x004268 02:8258:
	.hibytes frame_02_8E82, frame_02_8EA6, frame_02_8ECC, frame_02_8EF6, frame_02_8F24, frame_02_8F24, frame_02_8F24, frame_02_8F24;- D 0 - - - 0x004270 02:8260:
	.hibytes frame_02_8F46, frame_02_8F6A, frame_02_8F6A, frame_02_8F90, frame_02_8FBC, frame_02_8FE0, frame_02_9000, frame_02_900C;- D 0 - - - 0x004278 02:8268:
	.hibytes frame_02_9014, frame_02_901C, frame_02_9022, frame_02_9028, frame_02_902E, frame_02_9034, frame_02_903A, frame_02_9040;- D 0 - - - 0x004280 02:8270:
	.hibytes frame_02_9046, frame_02_904C, frame_02_9070, frame_02_9096, frame_02_909A, frame_02_90A0, frame_02_90A6, frame_02_90C8;- D 0 - - - 0x004288 02:8278:
	.hibytes frame_02_90EA, frame_02_90EA, frame_02_90F0, frame_02_910A, frame_02_9134, frame_02_9156, frame_02_9178, frame_02_919E;- - - - - - 0x004290 02:8280:
	.hibytes frame_02_91C0, frame_02_91E4, frame_02_9206, frame_02_922A, frame_02_924C, frame_02_926E, frame_02_9290, frame_02_92B4;- - - - - - 0x004298 02:8288:
	.hibytes frame_02_92E0, frame_02_9304, frame_02_9332, frame_02_9354, frame_02_9378, frame_02_939C, frame_02_93BE, frame_02_93E0;- D 0 - - - 0x0042A0 02:8290:
	.hibytes frame_02_9402, frame_02_9426, frame_02_9448, frame_02_946A, frame_02_948C, frame_02_94B0, frame_02_94D8, frame_02_94FE;- D 0 - - - 0x0042A8 02:8298:
	.hibytes frame_02_9522, frame_02_9546, frame_02_956A, frame_02_9592, frame_02_95BA, frame_02_95E8, frame_02_960A, frame_02_962E;- D 0 - - - 0x0042B0 02:82A0:
	.hibytes frame_02_9656, frame_02_9680, frame_02_96AA, frame_02_96D4, frame_02_96FE, frame_02_9728, frame_02_9754, frame_02_9782;- D 0 - - - 0x0042B8 02:82A8:
	.hibytes frame_02_97B0, frame_02_97DC, frame_02_9806, frame_02_9832, frame_02_985E, frame_02_9880, frame_02_989E, frame_02_98C8;- D 0 - - - 0x0042C0 02:82B0:
	.hibytes frame_02_98F4, frame_02_9928, frame_02_9962, frame_02_9998, frame_02_99CE, frame_02_9A04, frame_02_9A3C, frame_02_9A78;- D 0 - - - 0x0042C8 02:82B8:
	.hibytes frame_02_9AB4, frame_02_9AF0, frame_02_9B2E, frame_02_9B68, frame_02_9B98, frame_02_9BD0, frame_02_9C06, frame_02_9C2C;- D 0 - - - 0x0042D0 02:82C0:
	.hibytes frame_02_9C5A, frame_02_9C80, frame_02_9CAC, frame_02_9CB2, frame_02_9CB8, frame_02_9CBE, frame_02_9CC4, frame_02_9CCA;- D 0 - - - 0x0042D8 02:82C8:
	.hibytes frame_02_9CD0, frame_02_9CD6, frame_02_9CDC, frame_02_9D02, frame_02_9D34, frame_02_9D5A, frame_02_9D82, frame_02_9DAA;- D 0 - - - 0x0042E0 02:82D0:
	.hibytes frame_02_9DD2, frame_02_9DEE, frame_02_9E06, frame_02_9E1C, frame_02_9E32, frame_02_9E48, frame_02_9E5E, frame_02_9E84;- D 0 - - - 0x0042E8 02:82D8:
	.hibytes frame_02_9EAE, frame_02_9EDA, frame_02_9F04, frame_02_9F28, frame_02_9F3C, frame_02_9F6E, frame_02_9F88, frame_02_9FA4;- D 0 - - - 0x0042F0 02:82E0:
	.hibytes frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4;- - - - - - 0x0042F8 02:82E8:
	.hibytes frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4;- - - - - - 0x004300 02:82F0:
	.hibytes frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4, frame_02_9FA4;- - - - - - 0x004308 02:82F8:
anim_02_8300:
	.byte $00,$08,$01               ;- D 0 - I - 0x004310 02:8300:
anim_02_8303:
	.byte $09,$04,$02,$02,$03,$03,$03,$04,$04,$05,$05,$05;- D 0 - I - 0x004313 02:8303:
anim_02_830F:
	.byte $00,$10,$06               ;- D 0 - I - 0x00431F 02:830F:
anim_02_8312:
	.byte $05,$04,$07,$08,$09,$09,$08,$07;- D 0 - I - 0x004322 02:8312:
anim_02_831A:
	.byte $07,$04,$0A,$0B,$0C,$0C,$0D,$0D,$D9,$D9;- D 0 - I - 0x00432A 02:831A:
anim_02_8324:
	.byte $00,$08,$0E               ;- D 0 - I - 0x004334 02:8324:
anim_02_8327:
	.byte $00,$08,$0F               ;- D 0 - I - 0x004337 02:8327:
anim_02_832A:
	.byte $00,$08,$10               ;- D 0 - I - 0x00433A 02:832A:
anim_02_832D:
	.byte $00,$08,$11               ;- D 0 - I - 0x00433D 02:832D:
anim_02_8330:
	.byte $0D,$02,$12,$12,$12,$13,$13,$13,$13,$14,$14,$14,$15,$15,$15,$15;- D 0 - I - 0x004340 02:8330:
anim_02_8340:
	.byte $00,$08,$16               ;- D 0 - I - 0x004350 02:8340:
anim_02_8343:
	.byte $00,$10,$17               ;- D 0 - I - 0x004353 02:8343:
anim_02_8346:
	.byte $00,$08,$18               ;- D 0 - I - 0x004356 02:8346:
anim_02_8349:
	.byte $00,$08,$19               ;- D 0 - I - 0x004359 02:8349:
anim_02_834C:
	.byte $00,$08,$1A               ;- D 0 - I - 0x00435C 02:834C:
anim_02_834F:
	.byte $00,$08,$1B               ;- D 0 - I - 0x00435F 02:834F:
anim_02_8352:
	.byte $09,$04,$1D,$1D,$1E,$1E,$1E,$1F,$1F,$1C,$1C,$1C;- D 0 - I - 0x004362 02:8352:
anim_02_835E:
	.byte $04,$06,$D5,$D4,$D4,$D6,$D6;- D 0 - I - 0x00436E 02:835E:
anim_02_8365:
	.byte $05,$02,$20,$20,$21,$21,$21,$20;- D 0 - I - 0x004375 02:8365:
anim_02_836D:
	.byte $00,$08,$23               ;- D 0 - I - 0x00437D 02:836D:
anim_02_8370:
	.byte $00,$08,$22               ;- D 0 - I - 0x004380 02:8370:
anim_02_8373:
	.byte $00,$08,$24               ;- D 0 - I - 0x004383 02:8373:
anim_02_8376:
	.byte $00,$10,$25               ;- D 0 - I - 0x004386 02:8376:
anim_02_8379:
	.byte $00,$08,$26               ;- D 0 - I - 0x004389 02:8379:
anim_02_837C:
	.byte $00,$08,$27               ;- D 0 - I - 0x00438C 02:837C:
anim_02_837F:
	.byte $15,$02,$28,$28,$28,$28,$28,$29,$29,$29,$29,$29,$29,$2A,$2A,$2A;- D 0 - I - 0x00438F 02:837F:
	.byte $2A,$2A,$2B,$2B,$2B,$2B,$2B,$2B;- D 0 - I - 0x00439F 02:838F:
anim_02_8397:
	.byte $00,$08,$D7               ;- - - - - - 0x0043A7 02:8397:
anim_02_839A:
	.byte $05,$04,$2C,$2D,$2D,$2D,$2D,$2C;- D 0 - I - 0x0043AA 02:839A:
anim_02_83A2:
	.byte $00,$08,$2E               ;- D 0 - I - 0x0043B2 02:83A2:
anim_02_83A5:
	.byte $00,$08,$32               ;- D 0 - I - 0x0043B5 02:83A5:
anim_02_83A8:
	.byte $00,$10,$2F               ;- D 0 - I - 0x0043B8 02:83A8:
anim_02_83AB:
	.byte $00,$08,$30               ;- D 0 - I - 0x0043BB 02:83AB:
anim_02_83AE:
	.byte $00,$10,$31               ;- D 0 - I - 0x0043BE 02:83AE:
anim_02_83B1:
	.byte $00,$08,$34               ;- D 0 - I - 0x0043C1 02:83B1:
anim_02_83B4:
	.byte $03,$10,$DA,$DB,$DD,$DC   ;- - - - - - 0x0043C4 02:83B4:
anim_02_83BA:
	.byte $09,$03,$DE,$DF,$E0,$E0,$E0,$E1,$E1,$E1,$E1,$E1;- D 0 - I - 0x0043CA 02:83BA:
anim_02_83C6:
	.byte $03,$07,$36,$37,$38,$39   ;- D 0 - I - 0x0043D6 02:83C6:
anim_02_83CC:
	.byte $00,$08,$3A               ;- D 0 - I - 0x0043DC 02:83CC:
anim_02_83CF:
	.byte $00,$08,$3B               ;- D 0 - I - 0x0043DF 02:83CF:
anim_02_83D2:
	.byte $05,$05,$33,$3C,$3C,$3D,$3E,$3E;- D 0 - I - 0x0043E2 02:83D2:
anim_02_83DA:
	.byte $01,$08,$33,$3F           ;- D 0 - I - 0x0043EA 02:83DA:
anim_02_83DE:
	.byte $00,$08,$40               ;- D 0 - I - 0x0043EE 02:83DE:
anim_02_83E1:
	.byte $00,$08,$41               ;- D 0 - I - 0x0043F1 02:83E1:
anim_02_83E4:
	.byte $00,$08,$42               ;- D 0 - I - 0x0043F4 02:83E4:
anim_02_83E7:
	.byte $03,$02,$43,$44,$35,$D8   ;- D 0 - I - 0x0043F7 02:83E7:
anim_02_83ED:
	.byte $00,$18,$45               ;- - - - - - 0x0043FD 02:83ED:
anim_02_83F0:
	.byte $00,$18,$46               ;- - - - - - 0x004400 02:83F0:
anim_02_83F3:
	.byte $00,$18,$47               ;- - - - - - 0x004403 02:83F3:
anim_02_83F6:
	.byte $00,$18,$48               ;- - - - - - 0x004406 02:83F6:
anim_02_83F9:
	.byte $00,$18,$49               ;- - - - - - 0x004409 02:83F9:
anim_02_83FC:
	.byte $00,$18,$4A               ;- - - - - - 0x00440C 02:83FC:
anim_02_83FF:
	.byte $00,$18,$4B               ;- - - - - - 0x00440F 02:83FF:
anim_02_8402:
	.byte $00,$18,$4C               ;- - - - - - 0x004412 02:8402:
anim_02_8405:
	.byte $00,$18,$4D               ;- - - - - - 0x004415 02:8405:
anim_02_8408:
	.byte $00,$18,$4E               ;- - - - - - 0x004418 02:8408:
anim_02_840B:
	.byte $00,$08,$4F               ;- D 0 - I - 0x00441B 02:840B:
anim_02_840E:
	.byte $00,$18,$50               ;- - - - - - 0x00441E 02:840E:
anim_02_8411:
	.byte $00,$08,$51               ;- D 0 - I - 0x004421 02:8411:
anim_02_8414:
	.byte $07,$03,$52,$53,$55,$54,$56,$57,$59,$58;- D 0 - I - 0x004424 02:8414:
anim_02_841E:
	.byte $00,$08,$5A               ;- D 0 - I - 0x00442E 02:841E:
anim_02_8421:
	.byte $00,$08,$5B               ;- - - - - - 0x004431 02:8421:
anim_02_8424:
	.byte $03,$06,$5C,$5D,$67,$68   ;- D 0 - I - 0x004434 02:8424:
anim_02_842A:
	.byte $00,$08,$E2               ;- D 0 - I - 0x00443A 02:842A:
anim_02_842D:
	.byte $04,$02,$5E,$5F,$60,$61,$5F;- D 0 - I - 0x00443D 02:842D:
anim_02_8434:
	.byte $05,$02,$62,$63,$62,$63,$62,$63;- D 0 - I - 0x004444 02:8434:
anim_02_843C:
	.byte $00,$08,$71               ;- - - - - - 0x00444C 02:843C:
anim_02_843F:
	.byte $01,$04,$7E,$7F           ;- D 0 - I - 0x00444F 02:843F:
anim_02_8443:
	.byte $00,$08,$6A               ;- - - - - - 0x004453 02:8443:
anim_02_8446:
	.byte $00,$08,$6B               ;- D 0 - I - 0x004456 02:8446:
anim_02_8449:
	.byte $00,$08,$6C               ;- D 0 - I - 0x004459 02:8449:
anim_02_844C:
	.byte $00,$08,$6D               ;- D 0 - I - 0x00445C 02:844C:
anim_02_844F:
	.byte $02,$05,$6E,$6F,$70       ;- D 0 - I - 0x00445F 02:844F:
anim_02_8454:
	.byte $07,$03,$71,$72,$73,$74,$75,$76,$77,$78;- D 0 - I - 0x004464 02:8454:
anim_02_845E:
	.byte $00,$18,$79               ;- - - - - - 0x00446E 02:845E:
anim_02_8461:
	.byte $00,$18,$7A               ;- - - - - - 0x004471 02:8461:
anim_02_8464:
	.byte $21,$01,$7B,$7B,$7B,$7B,$7B,$7B,$7B,$7B,$7B,$7B,$7C,$7C,$7C,$7C;- - - - - - 0x004474 02:8464:
	.byte $7C,$7C,$7C,$7C,$7C,$7C,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7D;- - - - - - 0x004484 02:8474:
	.byte $7D,$7D,$7D,$00           ;- - - - - - 0x004494 02:8484:
anim_02_8488:
	.byte $05,$02,$62,$63,$62,$63,$62,$63;- D 0 - I - 0x004498 02:8488:
anim_02_8490:
	.byte $0B,$01,$81,$81,$81,$82,$82,$82,$83,$83,$83,$84,$84,$84;- D 0 - I - 0x0044A0 02:8490:
anim_02_849E:
	.byte $00,$08,$85               ;- - - - - - 0x0044AE 02:849E:
anim_02_84A1:
	.byte $00,$20,$89               ;- D 0 - I - 0x0044B1 02:84A1:
anim_02_84A4:
	.byte $07,$08,$86,$87,$86,$88,$86,$87,$86,$88;- - - - - - 0x0044B4 02:84A4:
anim_02_84AE:
	.byte $2D,$01,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8B;- D 0 - I - 0x0044BE 02:84AE:
	.res 9, $8B                     ;- D 0 - I - 0x0044CE 02:84BE: fill 9 bytes
	.res 13, $8C                    ;- D 0 - I - 0x0044D7 02:84C7: fill 13 bytes
	.res 10, $8D                    ;- D 0 - I - 0x0044E4 02:84D4: fill 10 bytes
anim_02_84DE:
	.byte $1A,$01,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8B,$8B,$8B,$8B,$8B,$8B,$8C;- D 0 - I - 0x0044EE 02:84DE:
	.byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$8D,$8D,$8D,$8D,$8D,$8D;- D 0 - I - 0x0044FE 02:84EE:
anim_02_84FB:
	.byte $06,$02,$8E,$8E,$8E,$8F,$8F,$8F,$8F;- D 0 - I - 0x00450B 02:84FB:
anim_02_8504:
	.byte $00,$08,$90               ;- D 0 - I - 0x004514 02:8504:
anim_02_8507:
	.byte $00,$08,$91               ;- D 0 - I - 0x004517 02:8507:
anim_02_850A:
	.byte $00,$08,$92               ;- D 0 - I - 0x00451A 02:850A:
anim_02_850D:
	.byte $00,$08,$93               ;- D 0 - I - 0x00451D 02:850D:
anim_02_8510:
	.byte $00,$18,$94               ;- - - - - - 0x004520 02:8510:
anim_02_8513:
	.byte $17,$01,$95,$95,$95,$95,$97,$97,$97,$97,$95,$95,$95,$95,$97,$97;- D 0 - I - 0x004523 02:8513:
	.byte $97,$97,$95,$95,$97,$97,$95,$97,$95,$97;- D 0 - I - 0x004533 02:8523:
anim_02_852D:
	.byte $2D,$01,$98,$98,$98,$98,$98,$98,$98,$98,$98,$98,$98,$98,$98,$99;- D 0 - I - 0x00453D 02:852D:
	.res 9, $99                     ;- D 0 - I - 0x00454D 02:853D: fill 9 bytes
	.res 13, $9A                    ;- D 0 - I - 0x004556 02:8546: fill 13 bytes
	.res 10, $9B                    ;- D 0 - I - 0x004563 02:8553: fill 10 bytes
anim_02_855D:
	.byte $00,$18,$96               ;- - - - - - 0x00456D 02:855D:
anim_02_8560:
	.byte $01,$08,$9C,$9D           ;- D 0 - I - 0x004570 02:8560:
anim_02_8564:
	.byte $1B,$01,$9E,$9E,$9E,$9E,$9E,$9E,$9E,$9E,$9F,$9F,$9F,$9F,$9F,$9F;- D 0 - I - 0x004574 02:8564:
	.byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A1,$A1,$A1,$A1,$A1;- D 0 - I - 0x004584 02:8574:
anim_02_8582:
	.byte $00,$10,$A2               ;- D 0 - I - 0x004592 02:8582:
anim_02_8585:
	.byte $00,$08,$A3               ;- D 0 - I - 0x004595 02:8585:
anim_02_8588:
	.byte $00,$08,$A4               ;- D 0 - I - 0x004598 02:8588:
anim_02_858B:
	.byte $00,$08,$A5               ;- D 0 - I - 0x00459B 02:858B:
anim_02_858E:
	.byte $00,$08,$A6               ;- D 0 - I - 0x00459E 02:858E:
anim_02_8591:
	.byte $00,$18,$A7               ;- - - - - - 0x0045A1 02:8591:
anim_02_8594:
	.byte $00,$08,$A8               ;- D 0 - I - 0x0045A4 02:8594:
anim_02_8597:
	.byte $03,$08,$A9,$AA,$AB,$AC   ;- D 0 - I - 0x0045A7 02:8597:
anim_02_859D:
	.byte $00,$08,$AD               ;- D 0 - I - 0x0045AD 02:859D:
anim_02_85A0:
	.byte $02,$18,$B1,$B2,$B2       ;- D 0 - I - 0x0045B0 02:85A0:
anim_02_85A5:
	.byte $00,$08,$E3               ;- - - - - - 0x0045B5 02:85A5:
anim_02_85A8:
	.byte $09,$01,$AE,$AE,$AF,$AF,$AF,$B0,$B0,$AF,$AF,$AF;- D 0 - I - 0x0045B8 02:85A8:
anim_02_85B4:
	.byte $00,$08,$B3               ;- D 0 - I - 0x0045C4 02:85B4:
anim_02_85B7:
	.byte $00,$08,$B4               ;- D 0 - I - 0x0045C7 02:85B7:
anim_02_85BA:
	.byte $00,$08,$B5               ;- D 0 - I - 0x0045CA 02:85BA:
anim_02_85BD:
	.byte $00,$18,$B6               ;- - - - - - 0x0045CD 02:85BD:
anim_02_85C0:
	.byte $00,$18,$B7               ;- - - - - - 0x0045D0 02:85C0:
anim_02_85C3:
	.byte $00,$08,$B8               ;- D 0 - I - 0x0045D3 02:85C3:
anim_02_85C6:
	.byte $00,$08,$B9               ;- D 0 - I - 0x0045D6 02:85C6:
anim_02_85C9:
	.byte $00,$08,$E4               ;- - - - - - 0x0045D9 02:85C9:
anim_02_85CC:
	.byte $15,$02,$BE,$BE,$BE,$BE,$BE,$BF,$BF,$BF,$BF,$BF,$BF,$C0,$C0,$C0;- D 0 - I - 0x0045DC 02:85CC:
	.byte $C0,$C0,$C1,$C1,$C1,$C1,$C1,$C1;- D 0 - I - 0x0045EC 02:85DC:
anim_02_85E4:
	.byte $19,$01,$BA,$BA,$BA,$BA,$BA,$BA,$BA,$BB,$BB,$BB,$BB,$BB,$BB,$BC;- D 0 - I - 0x0045F4 02:85E4:
	.byte $BC,$BC,$BC,$BC,$BC,$BC,$BD,$BD,$BD,$BD,$BD,$BD;- D 0 - I - 0x004604 02:85F4:
anim_02_8600:
	.byte $19,$01,$BE,$BE,$BE,$BE,$BE,$BE,$BE,$BF,$BF,$BF,$BF,$BF,$BF,$C0;- D 0 - I - 0x004610 02:8600:
	.byte $C0,$C0,$C0,$C0,$C0,$C0,$C1,$C1,$C1,$C1,$C1,$C1;- D 0 - I - 0x004620 02:8610:
anim_02_861C:
	.byte $0B,$02,$B9,$C2,$C3,$C3,$C3,$C3,$C3,$C3,$C3,$C3,$C2,$C2;- D 0 - I - 0x00462C 02:861C:
anim_02_862A:
	.byte $09,$04,$C4,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C4;- D 0 - I - 0x00463A 02:862A:
anim_02_8636:
	.byte $00,$08,$C6               ;- D 0 - I - 0x004646 02:8636:
anim_02_8639:
	.byte $00,$08,$C7               ;- D 0 - I - 0x004649 02:8639:
anim_02_863C:
	.byte $00,$08,$C8               ;- D 0 - I - 0x00464C 02:863C:
anim_02_863F:
	.byte $00,$08,$C9               ;- D 0 - I - 0x00464F 02:863F:
anim_02_8642:
	.byte $00,$18,$D3               ;- - - - - - 0x004652 02:8642:
anim_02_8645:
	.byte $00,$18,$D2               ;- - - - - - 0x004655 02:8645:
anim_02_8648:
	.byte $07,$04,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1;- D 0 - I - 0x004658 02:8648:
anim_02_8652:
	.byte $00,$08,$E5               ;- D 0 - I - 0x004662 02:8652:
anim_02_8655:
	.byte $00,$08,$E6               ;- - - - - - 0x004665 02:8655:
frame_02_8658:
	.byte $8A,$00,$80,$03,$81,$03,$82,$03,$83,$00,$84,$03,$85,$00,$86,$03;- D 0 - I - 0x004668 02:8658:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00;- D 0 - I - 0x004678 02:8668:
frame_02_8670:
	.byte $88,$01,$8B,$03,$8C,$03,$8D,$00,$8E,$03,$8F,$03,$91,$00,$90,$03;- D 0 - I - 0x004680 02:8670:
	.byte $92,$00,$93,$00           ;- D 0 - I - 0x004690 02:8680:
frame_02_8684:
	.byte $88,$02,$8B,$03,$8C,$03,$8D,$00,$8E,$03,$94,$03,$96,$00,$95,$03;- D 0 - I - 0x004694 02:8684:
	.byte $97,$00,$98,$00           ;- D 0 - I - 0x0046A4 02:8694:
frame_02_8698:
	.byte $88,$01,$8B,$03,$8C,$03,$8D,$00,$8E,$03,$99,$03,$9B,$00,$9A,$03;- D 0 - I - 0x0046A8 02:8698:
	.byte $9C,$00,$9D,$00           ;- D 0 - I - 0x0046B8 02:86A8:
frame_02_86AC:
	.byte $88,$03,$8B,$03,$8C,$03,$8D,$00,$8E,$03,$9E,$03,$A0,$00,$9F,$03;- D 0 - I - 0x0046BC 02:86AC:
	.byte $A1,$00,$A2,$00           ;- D 0 - I - 0x0046CC 02:86BC:
frame_02_86C0:
	.byte $89,$09,$A0,$03,$A1,$03,$A2,$03,$A3,$03,$A4,$03,$A5,$00,$A7,$03;- D 0 - I - 0x0046D0 02:86C0:
	.byte $A6,$00,$A8,$00,$A9,$00   ;- D 0 - I - 0x0046E0 02:86D0:
frame_02_86D6:
	.byte $8A,$00,$80,$03,$81,$03,$A3,$03,$83,$00,$84,$03,$A4,$00,$86,$03;- D 0 - I - 0x0046E6 02:86D6:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00;- D 0 - I - 0x0046F6 02:86E6:
frame_02_86EE:
	.byte $8A,$04,$80,$03,$81,$03,$A5,$00,$A6,$03,$A7,$00,$A8,$03,$A9,$00;- D 0 - I - 0x0046FE 02:86EE:
	.byte $AA,$03,$AB,$00,$AC,$00,$AD,$00;- D 0 - I - 0x00470E 02:86FE:
frame_02_8706:
	.byte $89,$05,$80,$03,$81,$03,$AE,$03,$AF,$00,$B0,$03,$B1,$03,$B2,$00;- D 0 - I - 0x004716 02:8706:
	.byte $B3,$00,$AC,$00,$B4,$00   ;- D 0 - I - 0x004726 02:8716:
frame_02_871C:
	.byte $87,$0A,$80,$03,$81,$03,$82,$00,$83,$03,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x00472C 02:871C:
	.byte $87,$00                   ;- D 0 - I - 0x00473C 02:872C:
frame_02_872E:
	.byte $8A,$0B,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$03,$8D,$00,$B4,$00;- D 0 - I - 0x00473E 02:872E:
	.byte $8E,$03,$8F,$00,$90,$03,$91,$00;- D 0 - I - 0x00474E 02:873E:
frame_02_8746:
	.byte $89,$0C,$92,$00,$93,$00,$94,$00,$95,$00,$96,$03,$97,$03,$B5,$03;- D 0 - I - 0x004756 02:8746:
	.byte $98,$00,$99,$00,$9A,$03   ;- D 0 - I - 0x004766 02:8756:
frame_02_875C:
	.byte $8D,$0D,$9B,$03,$9C,$03,$9D,$00,$9E,$03,$9F,$03,$A0,$03,$A1,$00;- D 0 - I - 0x00476C 02:875C:
	.byte $A2,$03,$A3,$00,$A4,$00,$A5,$00,$A6,$03,$A7,$00,$A8,$00;- D 0 - I - 0x00477C 02:876C:
frame_02_877A:
	.byte $8A,$06,$80,$03,$81,$03,$82,$03,$83,$03,$84,$00,$85,$03,$86,$00;- D 0 - I - 0x00478A 02:877A:
	.byte $87,$03,$88,$00,$89,$00,$8A,$00;- D 0 - I - 0x00479A 02:878A:
frame_02_8792:
	.byte $8A,$07,$8B,$03,$8C,$03,$8D,$03,$8E,$00,$8F,$03,$90,$00,$91,$03;- D 0 - I - 0x0047A2 02:8792:
	.byte $92,$00,$93,$00,$94,$03,$95,$03;- D 0 - I - 0x0047B2 02:87A2:
frame_02_87AA:
	.byte $89,$08,$96,$03,$97,$03,$98,$00,$99,$03,$9A,$00,$9B,$03,$9C,$00;- D 0 - I - 0x0047BA 02:87AA:
	.byte $9D,$00,$9E,$03,$9F,$03   ;- D 0 - I - 0x0047CA 02:87BA:
frame_02_87C0:
	.byte $89,$18,$C0,$00,$C1,$00,$C2,$00,$C3,$00,$C4,$00,$C5,$03,$C6,$00;- D 0 - I - 0x0047D0 02:87C0:
	.byte $C7,$03,$C8,$00,$C9,$00   ;- D 0 - I - 0x0047E0 02:87D0:
frame_02_87D6:
	.byte $89,$1A,$C0,$00,$C1,$00,$C2,$00,$C3,$00,$C4,$00,$C5,$03,$CA,$00;- D 0 - I - 0x0047E6 02:87D6:
	.byte $C7,$03,$CB,$00,$CC,$00   ;- D 0 - I - 0x0047F6 02:87E6:
frame_02_87EC:
	.byte $89,$1B,$C0,$00,$C1,$00,$C2,$00,$C3,$00,$C4,$00,$C5,$03,$CD,$00;- D 0 - I - 0x0047FC 02:87EC:
	.byte $CE,$03,$CF,$00,$D0,$00   ;- D 0 - I - 0x00480C 02:87FC:
frame_02_8802:
	.byte $88,$1C,$C0,$00,$C1,$00,$C2,$00,$C3,$00,$C4,$00,$C5,$03,$D1,$00;- D 0 - I - 0x004812 02:8802:
	.byte $C7,$03,$D2,$00           ;- D 0 - I - 0x004822 02:8812:
frame_02_8816:
	.byte $89,$1D,$C0,$00,$C1,$00,$C2,$00,$C3,$00,$C4,$00,$C5,$03,$D3,$00;- D 0 - I - 0x004826 02:8816:
	.byte $C7,$03,$D4,$00,$D5,$00   ;- D 0 - I - 0x004836 02:8826:
frame_02_882C:
	.byte $8A,$1E,$D6,$00,$D7,$00,$D8,$00,$D9,$00,$DA,$00,$DB,$00,$DC,$03;- D 0 - I - 0x00483C 02:882C:
	.byte $DD,$00,$DE,$03,$DF,$00,$E0,$00;- D 0 - I - 0x00484C 02:883C:
frame_02_8844:
	.byte $8A,$20,$DD,$00,$DE,$00,$DF,$00,$E0,$00,$E1,$00,$E2,$03,$E3,$00;- D 0 - I - 0x004854 02:8844:
	.byte $E4,$00,$E5,$03,$E6,$00,$E7,$00;- D 0 - I - 0x004864 02:8854:
frame_02_885C:
	.byte $88,$22,$C0,$00,$C1,$00,$C2,$00,$C3,$00,$C4,$00,$C5,$00,$C6,$00;- D 0 - I - 0x00486C 02:885C:
	.byte $C7,$03,$C8,$00           ;- D 0 - I - 0x00487C 02:886C:
frame_02_8870:
	.byte $88,$24,$C9,$00,$CA,$00,$CB,$00,$CC,$00,$CD,$00,$CE,$00,$CF,$03;- D 0 - I - 0x004880 02:8870:
	.byte $D0,$00,$D1,$00           ;- D 0 - I - 0x004890 02:8880:
frame_02_8884:
	.byte $8A,$26,$D2,$00,$D3,$00,$D4,$00,$D5,$00,$D6,$00,$D7,$00,$D8,$00;- D 0 - I - 0x004894 02:8884:
	.byte $D9,$00,$DA,$03,$DB,$03,$DC,$00;- D 0 - I - 0x0048A4 02:8894:
frame_02_889C:
	.byte $08,$E1,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$02;- D 0 - I - 0x0048AC 02:889C:
	.byte $47,$02,$48,$02           ;- D 0 - I - 0x0048BC 02:88AC:
frame_02_88B0:
	.byte $09,$E3,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$49,$02;- D 0 - I - 0x0048C0 02:88B0:
	.byte $4A,$02,$4B,$02,$48,$02   ;- D 0 - I - 0x0048D0 02:88C0:
frame_02_88C6:
	.byte $08,$E5,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$4C,$02;- D 0 - I - 0x0048D6 02:88C6:
	.byte $4D,$02,$4E,$02           ;- D 0 - I - 0x0048E6 02:88D6:
frame_02_88DA:
	.byte $09,$E7,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$4F,$02;- D 0 - I - 0x0048EA 02:88DA:
	.byte $50,$02,$51,$02,$52,$02   ;- D 0 - I - 0x0048FA 02:88EA:
frame_02_88F0:
	.byte $09,$EB,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$53,$02;- D 0 - I - 0x004900 02:88F0:
	.byte $54,$02,$55,$02,$56,$02   ;- D 0 - I - 0x004910 02:8900:
frame_02_8906:
	.byte $09,$ED,$40,$00,$41,$00,$42,$00,$43,$00,$45,$00,$46,$02,$47,$02;- D 0 - I - 0x004916 02:8906:
	.byte $48,$02,$57,$00,$59,$00   ;- D 0 - I - 0x004926 02:8916:
frame_02_891C:
	.byte $09,$EF,$5A,$00,$5B,$00,$5D,$00,$5E,$00,$5C,$00,$5F,$02,$60,$00;- D 0 - I - 0x00492C 02:891C:
	.byte $61,$02,$62,$02,$73,$02   ;- D 0 - I - 0x00493C 02:892C:
frame_02_8932:
	.byte $07,$F1,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00,$68,$00,$69,$02;- D 0 - I - 0x004942 02:8932:
	.byte $6A,$02                   ;- D 0 - I - 0x004952 02:8942:
frame_02_8944:
	.byte $08,$F3,$6B,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$70,$00,$71,$02;- D 0 - I - 0x004954 02:8944:
	.byte $72,$02,$48,$02           ;- D 0 - I - 0x004964 02:8954:
frame_02_8958:
	.byte $09,$F5,$40,$00,$41,$00,$42,$00,$43,$02,$44,$02,$45,$00,$46,$02;- D 0 - I - 0x004968 02:8958:
	.byte $47,$02,$48,$00,$49,$02   ;- D 0 - I - 0x004978 02:8968:
frame_02_896E:
	.byte $08,$F7,$4A,$00,$4B,$02,$4C,$02,$4D,$00,$4E,$00,$4F,$02,$50,$00;- D 0 - I - 0x00497E 02:896E:
	.byte $51,$00,$52,$00           ;- D 0 - I - 0x00498E 02:897E:
frame_02_8982:
	.byte $07,$F9,$53,$00,$54,$00,$55,$00,$56,$00,$57,$00,$58,$00,$59,$02;- D 0 - I - 0x004992 02:8982:
	.byte $5A,$02                   ;- D 0 - I - 0x0049A2 02:8992:
frame_02_8994:
	.byte $8B,$27,$80,$00,$81,$00,$82,$00,$83,$00,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x0049A4 02:8994:
	.byte $87,$00,$88,$03,$89,$03,$8A,$03,$8B,$03;- D 0 - I - 0x0049B4 02:89A4:
frame_02_89AE:
	.byte $8C,$28,$80,$00,$81,$00,$82,$00,$83,$00,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x0049BE 02:89AE:
	.byte $8C,$00,$8D,$03,$8E,$03,$8F,$03,$90,$03,$91,$03;- D 0 - I - 0x0049CE 02:89BE:
frame_02_89CA:
	.byte $8B,$29,$80,$00,$81,$00,$82,$00,$83,$00,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x0049DA 02:89CA:
	.byte $8C,$00,$92,$03,$93,$03,$94,$03,$95,$03;- D 0 - I - 0x0049EA 02:89DA:
frame_02_89E4:
	.byte $8A,$2A,$80,$00,$81,$00,$82,$00,$83,$00,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x0049F4 02:89E4:
	.byte $8C,$00,$96,$03,$97,$03,$98,$03;- D 0 - I - 0x004A04 02:89F4:
frame_02_89FC:
	.byte $8B,$29,$80,$00,$81,$00,$82,$00,$83,$00,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x004A0C 02:89FC:
	.byte $8C,$00,$99,$03,$9A,$03,$9B,$03,$9C,$03;- D 0 - I - 0x004A1C 02:8A0C:
frame_02_8A16:
	.byte $8B,$2B,$9D,$00,$9E,$00,$9F,$00,$A0,$00,$A1,$00,$A2,$03,$A3,$00;- D 0 - I - 0x004A26 02:8A16:
	.byte $A4,$03,$A5,$03,$A6,$00,$A7,$03,$A8,$03;- D 0 - I - 0x004A36 02:8A26:
frame_02_8A30:
	.byte $8D,$2C,$A9,$00,$AA,$00,$AB,$00,$AC,$00,$AD,$03,$AF,$00,$AE,$03;- D 0 - I - 0x004A40 02:8A30:
	.byte $B0,$00,$B1,$03,$B2,$03,$B3,$03,$B4,$03,$B5,$03,$B6,$03;- D 0 - I - 0x004A50 02:8A40:
frame_02_8A4E:
	.byte $89,$2D,$80,$00,$81,$00,$82,$00,$83,$00,$84,$00,$85,$03,$86,$03;- D 0 - I - 0x004A5E 02:8A4E:
	.byte $87,$00,$88,$03,$89,$03   ;- D 0 - I - 0x004A6E 02:8A5E:
frame_02_8A64:
	.byte $8C,$2E,$8A,$00,$8B,$00,$8C,$00,$8D,$03,$8E,$03,$8F,$03,$90,$00;- D 0 - I - 0x004A74 02:8A64:
	.byte $91,$03,$92,$03,$94,$03,$93,$00,$95,$03,$96,$03;- D 0 - I - 0x004A84 02:8A74:
frame_02_8A80:
	.byte $8B,$2F,$97,$00,$98,$00,$99,$00,$9A,$03,$9B,$03,$9C,$03,$9D,$00;- D 0 - I - 0x004A90 02:8A80:
	.byte $9E,$00,$9F,$03,$A0,$03,$A1,$03,$A2,$00;- D 0 - I - 0x004AA0 02:8A90:
frame_02_8A9A:
	.byte $8B,$30,$A3,$00,$A4,$00,$A5,$03,$A6,$00,$A7,$00,$A8,$03,$AB,$00;- D 0 - I - 0x004AAA 02:8A9A:
	.byte $A9,$03,$AA,$03,$AC,$03,$AD,$03,$AE,$03;- D 0 - I - 0x004ABA 02:8AAA:
frame_02_8AB4:
	.byte $8A,$31,$AF,$00,$B0,$03,$B1,$00,$B2,$00,$B3,$00,$B4,$00,$B5,$03;- D 0 - I - 0x004AC4 02:8AB4:
	.byte $B6,$03,$B7,$03,$B8,$03,$B9,$03;- D 0 - I - 0x004AD4 02:8AC4:
frame_02_8ACC:
	.byte $89,$36,$C0,$03,$C1,$03,$C2,$00,$C3,$03,$CA,$03,$CB,$03,$C6,$03;- D 0 - I - 0x004ADC 02:8ACC:
	.byte $C7,$03,$C8,$03,$C9,$03   ;- D 0 - I - 0x004AEC 02:8ADC:
frame_02_8AE2:
	.byte $88,$36,$C0,$03,$C1,$03,$C2,$00,$C3,$03,$C4,$03,$C5,$03,$C6,$03;- D 0 - I - 0x004AF2 02:8AE2:
	.byte $C7,$03,$C8,$03           ;- D 0 - I - 0x004B02 02:8AF2:
frame_02_8AF6:
	.byte $8E,$46,$DB,$03,$DC,$03,$DD,$03,$DE,$03,$DF,$03,$E0,$03,$E1,$03;- D 0 - I - 0x004B06 02:8AF6:
	.byte $E2,$03,$E5,$00,$E3,$03,$E4,$03,$E6,$03,$E7,$03,$E8,$03,$E9,$03;- D 0 - I - 0x004B16 02:8B06:
frame_02_8B16:
	.byte $88,$38,$C0,$03,$C1,$03,$C2,$00,$C3,$03,$C4,$03,$C5,$03,$CC,$03;- D 0 - I - 0x004B26 02:8B16:
	.byte $CD,$03,$CE,$03           ;- D 0 - I - 0x004B36 02:8B26:
frame_02_8B2A:
	.byte $88,$39,$C0,$03,$C1,$03,$C2,$00,$C3,$03,$C4,$03,$C5,$03,$CF,$03;- D 0 - I - 0x004B3A 02:8B2A:
	.byte $D0,$03,$D1,$03           ;- D 0 - I - 0x004B4A 02:8B3A:
frame_02_8B3E:
	.byte $88,$3A,$C0,$03,$C1,$03,$C2,$00,$C3,$03,$C4,$03,$C5,$03,$D2,$03;- D 0 - I - 0x004B4E 02:8B3E:
	.byte $D3,$03,$D4,$03           ;- D 0 - I - 0x004B5E 02:8B4E:
frame_02_8B52:
	.byte $89,$39,$C0,$03,$C1,$03,$C2,$00,$C3,$03,$C4,$03,$C5,$03,$D5,$03;- D 0 - I - 0x004B62 02:8B52:
	.byte $D6,$03,$FF,$03,$D7,$03   ;- D 0 - I - 0x004B72 02:8B62:
frame_02_8B68:
	.byte $89,$3F,$ED,$03,$EE,$03,$EF,$03,$F0,$00,$F1,$03,$F2,$03,$F3,$03;- D 0 - I - 0x004B78 02:8B68:
	.byte $F4,$03,$F5,$03,$F6,$03   ;- D 0 - I - 0x004B88 02:8B78:
frame_02_8B7E:
	.byte $8A,$43,$DE,$03,$DF,$03,$E0,$03,$E1,$03,$E4,$00,$E2,$03,$E3,$03;- D 0 - I - 0x004B8E 02:8B7E:
	.byte $E5,$03,$E6,$03,$E7,$03,$E8,$03;- D 0 - I - 0x004B9E 02:8B8E:
frame_02_8B96:
	.byte $89,$3B,$C0,$03,$E0,$03,$E1,$03,$C2,$00,$C3,$03,$E2,$03,$C5,$03;- D 0 - I - 0x004BA6 02:8B96:
	.byte $E3,$03,$C7,$03,$C8,$03   ;- D 0 - I - 0x004BB6 02:8BA6:
frame_02_8BAC:
	.byte $8C,$3C,$E4,$03,$E5,$03,$E6,$03,$C1,$03,$E7,$03,$E8,$00,$C3,$03;- D 0 - I - 0x004BBC 02:8BAC:
	.byte $E2,$03,$C5,$03,$E3,$03,$C7,$03,$C8,$03,$E4,$00;- D 0 - I - 0x004BCC 02:8BBC:
frame_02_8BC8:
	.byte $89,$3D,$C0,$03,$C1,$03,$C2,$00,$E9,$03,$EA,$03,$EB,$03,$EC,$03;- D 0 - I - 0x004BD8 02:8BC8:
	.byte $DE,$03,$DF,$03,$C8,$03   ;- D 0 - I - 0x004BE8 02:8BD8:
frame_02_8BDE:
	.byte $8B,$3E,$C0,$03,$C1,$03,$D8,$03,$C2,$00,$D9,$03,$DA,$03,$DB,$03;- D 0 - I - 0x004BEE 02:8BDE:
	.byte $DC,$03,$DD,$03,$DE,$03,$DF,$03,$C8,$03;- D 0 - I - 0x004BFE 02:8BEE:
frame_02_8BF8:
	.byte $8A,$40,$C0,$03,$C1,$03,$C2,$00,$C3,$00,$C4,$00,$C5,$00,$C6,$00;- D 0 - I - 0x004C08 02:8BF8:
	.byte $C7,$03,$C8,$03,$C9,$03,$CA,$03;- D 0 - I - 0x004C18 02:8C08:
frame_02_8C10:
	.byte $89,$41,$CB,$03,$CC,$03,$CD,$03,$CE,$00,$CF,$00,$D0,$03,$D1,$03;- D 0 - I - 0x004C20 02:8C10:
	.byte $D2,$00,$D3,$03,$D4,$03   ;- D 0 - I - 0x004C30 02:8C20:
frame_02_8C26:
	.byte $88,$42,$D5,$03,$D6,$03,$D7,$00,$D8,$00,$D9,$03,$DA,$03,$DB,$00;- D 0 - I - 0x004C36 02:8C26:
	.byte $DC,$00,$DD,$03           ;- D 0 - I - 0x004C46 02:8C36:
frame_02_8C3A:
	.byte $8C,$44,$C0,$03,$C1,$03,$C2,$03,$C3,$03,$C4,$03,$C5,$03,$C6,$03;- D 0 - I - 0x004C4A 02:8C3A:
	.byte $C7,$03,$C8,$03,$C9,$03,$CA,$03,$CB,$03,$CC,$00;- D 0 - I - 0x004C5A 02:8C4A:
frame_02_8C56:
	.byte $8D,$45,$CD,$03,$CE,$03,$CF,$03,$D0,$03,$D2,$00,$D1,$03,$D3,$03;- D 0 - I - 0x004C66 02:8C56:
	.byte $D4,$03,$D5,$03,$D6,$03,$D7,$03,$D8,$03,$D9,$03,$DA,$03;- D 0 - I - 0x004C76 02:8C66:
frame_02_8C74:
	.byte $08,$FD,$48,$C1,$72,$C2,$71,$C2,$70,$C0,$6F,$C0,$6E,$C0,$6D,$C0;- D 0 - I - 0x004C84 02:8C74:
	.byte $6C,$C0,$6B,$C0           ;- D 0 - I - 0x004C94 02:8C84:
frame_02_8C88:
	.byte $89,$33,$89,$C3,$88,$C3,$87,$C0,$86,$C3,$85,$C3,$84,$C0,$83,$C0;- D 0 - I - 0x004C98 02:8C88:
	.byte $82,$C0,$81,$C0,$80,$C0   ;- D 0 - I - 0x004CA8 02:8C98:
frame_02_8C9E:
	.byte $8A,$4C,$8A,$C0,$89,$C0,$88,$C0,$87,$C3,$86,$C0,$85,$C3,$84,$C0;- D 0 - I - 0x004CAE 02:8C9E:
	.byte $83,$C3,$82,$C3,$81,$C3,$80,$C3;- D 0 - I - 0x004CBE 02:8CAE:
frame_02_8CB6:
	.byte $88,$4E,$C8,$C0,$C7,$C3,$C6,$C0,$C5,$C0,$C4,$C0,$C3,$C0,$C2,$C0;- D 0 - I - 0x004CC6 02:8CB6:
	.byte $C1,$C0,$C0,$C0           ;- D 0 - I - 0x004CD6 02:8CC6:
frame_02_8CCA:
	.byte $8A,$50,$CA,$C3,$C9,$C3,$C8,$C3,$C7,$C3,$C6,$C0,$C5,$C0,$C4,$C0;- D 0 - I - 0x004CDA 02:8CCA:
	.byte $C3,$C0,$C2,$C0,$C1,$C3,$C0,$C3;- D 0 - I - 0x004CEA 02:8CDA:
frame_02_8CE2:
	.byte $08,$FB,$48,$82,$46,$82,$47,$82,$44,$80,$45,$80,$42,$80,$43,$80;- D 0 - I - 0x004CF2 02:8CE2:
	.byte $40,$80,$41,$80           ;- D 0 - I - 0x004D02 02:8CF2:
frame_02_8CF6:
	.byte $8B,$32,$8A,$83,$8B,$83,$88,$83,$89,$83,$86,$83,$87,$80,$84,$80;- D 0 - I - 0x004D06 02:8CF6:
	.byte $85,$83,$82,$80,$83,$80,$80,$80,$81,$80;- D 0 - I - 0x004D16 02:8D06:
frame_02_8D10:
	.byte $88,$52,$9C,$80,$9D,$80,$99,$83,$9B,$80,$9A,$83,$8D,$80,$8E,$83;- D 0 - I - 0x004D20 02:8D10:
	.byte $8B,$83,$8C,$83           ;- D 0 - I - 0x004D30 02:8D20:
frame_02_8D24:
	.byte $89,$54,$C0,$80,$C1,$80,$C2,$80,$C3,$80,$C4,$80,$C5,$83,$C6,$80;- D 0 - I - 0x004D34 02:8D24:
	.byte $C7,$83,$C8,$80,$C9,$80   ;- D 0 - I - 0x004D44 02:8D34:
frame_02_8D3A:
	.byte $88,$56,$C8,$83,$C6,$83,$C7,$83,$C4,$83,$C5,$83,$C2,$80,$C3,$83;- D 0 - I - 0x004D4A 02:8D3A:
	.byte $C0,$83,$C1,$83           ;- D 0 - I - 0x004D5A 02:8D4A:
frame_02_8D4E:
	.byte $8F,$58,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x004D5E 02:8D4E:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$02,$4D,$02,$4E,$00;- D 0 - I - 0x004D6E 02:8D5E:
	.byte $4F,$00                   ;- D 0 - I - 0x004D7E 02:8D6E:
frame_02_8D70:
	.byte $8F,$5A,$4E,$80,$4F,$80,$4C,$82,$4D,$82,$49,$80,$4A,$80,$4B,$80;- D 0 - I - 0x004D80 02:8D70:
	.byte $46,$80,$47,$80,$48,$80,$43,$80,$44,$80,$45,$80,$40,$80,$41,$80;- D 0 - I - 0x004D90 02:8D80:
	.byte $42,$80                   ;- D 0 - I - 0x004DA0 02:8D90:
frame_02_8D92:
	.byte $01,$56,$FE,$03,$F8,$03   ;- D 0 - I - 0x004DA2 02:8D92:
frame_02_8D98:
	.byte $00,$58,$F8,$03           ;- D 0 - I - 0x004DA8 02:8D98:
frame_02_8D9C:
	.byte $01,$5A,$FC,$03,$FD,$03   ;- D 0 - I - 0x004DAC 02:8D9C:
frame_02_8DA2:
	.byte $01,$5C,$FA,$03,$FB,$03   ;- D 0 - I - 0x004DB2 02:8DA2:
frame_02_8DA8:
	.byte $00,$5E,$F9,$03           ;- D 0 - I - 0x004DB8 02:8DA8:
frame_02_8DAC:
	.byte $00,$60,$F8,$C3           ;- D 0 - I - 0x004DBC 02:8DAC:
frame_02_8DB0:
	.byte $01,$62,$FD,$C3,$FC,$C3   ;- D 0 - I - 0x004DC0 02:8DB0:
frame_02_8DB6:
	.byte $01,$64,$FB,$C3,$FA,$C3   ;- D 0 - I - 0x004DC6 02:8DB6:
frame_02_8DBC:
	.byte $00,$66,$F9,$C3           ;- D 0 - I - 0x004DCC 02:8DBC:
frame_02_8DC0:
	.byte $01,$8C,$FA,$03,$F7,$03   ;- D 0 - I - 0x004DD0 02:8DC0:
frame_02_8DC6:
	.byte $90,$5D,$80,$03,$81,$00,$82,$03,$83,$00,$84,$00,$85,$02,$86,$03;- D 0 - I - 0x004DD6 02:8DC6:
	.byte $89,$00,$87,$02,$88,$02,$8A,$03,$8B,$03,$8C,$02,$8D,$00,$8E,$03;- D 0 - I - 0x004DE6 02:8DD6:
	.byte $8F,$02,$90,$00           ;- D 0 - I - 0x004DF6 02:8DE6:
frame_02_8DEA:
	.byte $90,$5F,$80,$03,$81,$00,$82,$03,$83,$00,$84,$00,$85,$02,$86,$03;- D 0 - I - 0x004DFA 02:8DEA:
	.byte $89,$00,$87,$02,$88,$02,$8A,$03,$91,$03,$92,$02,$93,$00,$96,$02;- D 0 - I - 0x004E0A 02:8DFA:
	.byte $94,$03,$95,$00           ;- D 0 - I - 0x004E1A 02:8E0A:
frame_02_8E0E:
	.byte $90,$60,$80,$03,$81,$00,$82,$03,$83,$00,$84,$00,$85,$02,$86,$03;- D 0 - I - 0x004E1E 02:8E0E:
	.byte $89,$00,$87,$02,$88,$02,$8A,$03,$97,$03,$98,$02,$8D,$00,$99,$03;- D 0 - I - 0x004E2E 02:8E1E:
	.byte $9A,$00,$9B,$02           ;- D 0 - I - 0x004E3E 02:8E2E:
frame_02_8E32:
	.byte $92,$65,$80,$03,$81,$00,$A3,$03,$A4,$03,$83,$00,$84,$00,$85,$02;- D 0 - I - 0x004E42 02:8E32:
	.byte $A5,$03,$A6,$03,$89,$00,$87,$02,$88,$02,$A7,$03,$A8,$03,$8C,$02;- D 0 - I - 0x004E52 02:8E42:
	.byte $8D,$00,$8E,$03,$8F,$02,$90,$00;- D 0 - I - 0x004E62 02:8E52:
frame_02_8E5A:
	.byte $92,$67,$80,$03,$81,$00,$A9,$03,$AC,$03,$83,$00,$84,$00,$85,$02;- D 0 - I - 0x004E6A 02:8E5A:
	.byte $AA,$03,$AB,$03,$89,$00,$87,$02,$88,$02,$A7,$03,$A8,$03,$8C,$02;- D 0 - I - 0x004E7A 02:8E6A:
	.byte $8D,$00,$8E,$03,$8F,$02,$90,$00;- D 0 - I - 0x004E8A 02:8E7A:
frame_02_8E82:
	.byte $90,$69,$80,$03,$81,$00,$AC,$03,$83,$00,$84,$00,$85,$02,$B1,$03;- D 0 - I - 0x004E92 02:8E82:
	.byte $89,$00,$87,$02,$88,$02,$A7,$03,$A8,$03,$8C,$02,$8D,$00,$8E,$03;- D 0 - I - 0x004EA2 02:8E92:
	.byte $8F,$02,$90,$00           ;- D 0 - I - 0x004EB2 02:8EA2:
frame_02_8EA6:
	.byte $91,$6B,$80,$03,$81,$00,$AC,$03,$83,$00,$84,$00,$85,$02,$B2,$03;- D 0 - I - 0x004EB6 02:8EA6:
	.byte $B1,$03,$89,$00,$87,$02,$88,$02,$A7,$03,$A8,$03,$8C,$02,$8D,$00;- D 0 - I - 0x004EC6 02:8EB6:
	.byte $8E,$03,$8F,$02,$90,$00   ;- D 0 - I - 0x004ED6 02:8EC6:
frame_02_8ECC:
	.byte $93,$62,$80,$03,$81,$03,$83,$03,$84,$00,$85,$00,$95,$03,$89,$02;- D 0 - I - 0x004EDC 02:8ECC:
	.byte $8A,$02,$8B,$02,$96,$03,$97,$02,$98,$02,$91,$03,$92,$02,$82,$00;- D 0 - I - 0x004EEC 02:8EDC:
	.byte $86,$03,$8C,$00,$99,$00,$93,$00,$94,$03;- D 0 - I - 0x004EFC 02:8EEC:
frame_02_8EF6:
	.byte $95,$5E,$80,$03,$81,$03,$83,$03,$84,$00,$85,$00,$88,$03,$89,$02;- D 0 - I - 0x004F06 02:8EF6:
	.byte $8A,$02,$8B,$02,$FF,$03,$8D,$03,$8E,$02,$8F,$02,$91,$03,$92,$02;- D 0 - I - 0x004F16 02:8F06:
	.byte $82,$00,$86,$03,$8C,$00,$90,$00,$93,$00,$FF,$03,$87,$03;- D 0 - I - 0x004F26 02:8F16:
frame_02_8F24:
	.byte $8F,$61,$80,$03,$81,$00,$82,$03,$83,$00,$84,$00,$85,$02,$86,$03;- D 0 - I - 0x004F34 02:8F24:
	.byte $89,$00,$87,$02,$88,$02,$8A,$03,$9C,$02,$9D,$02,$9E,$00,$9F,$00;- D 0 - I - 0x004F44 02:8F34:
	.byte $A0,$03                   ;- D 0 - I - 0x004F54 02:8F44:
frame_02_8F46:
	.byte $90,$63,$80,$03,$81,$00,$82,$03,$83,$00,$84,$00,$85,$02,$86,$03;- D 0 - I - 0x004F56 02:8F46:
	.byte $89,$00,$87,$02,$88,$02,$8A,$03,$A1,$02,$A2,$02,$AD,$00,$AE,$03;- D 0 - I - 0x004F66 02:8F56:
	.byte $AF,$02,$B0,$00           ;- D 0 - I - 0x004F76 02:8F66:
frame_02_8F6A:
	.byte $91,$66,$80,$03,$81,$00,$82,$00,$84,$03,$85,$00,$88,$03,$89,$03;- D 0 - I - 0x004F7A 02:8F6A:
	.byte $8A,$00,$8B,$00,$8E,$00,$8F,$03,$90,$00,$91,$02,$83,$02,$87,$02;- D 0 - I - 0x004F8A 02:8F7A:
	.byte $86,$02,$8C,$03,$8D,$02   ;- D 0 - I - 0x004F9A 02:8F8A:
frame_02_8F90:
	.byte $94,$68,$9E,$03,$9F,$03,$A0,$02,$A1,$00,$A3,$03,$A4,$03,$A5,$03;- D 0 - I - 0x004FA0 02:8F90:
	.byte $A6,$03,$A9,$00,$AA,$00,$AB,$02,$AC,$03,$AD,$02,$AE,$02,$B0,$02;- D 0 - I - 0x004FB0 02:8FA0:
	.byte $B1,$00,$A2,$00,$A7,$02,$A8,$02,$AF,$00,$B2,$00;- D 0 - I - 0x004FC0 02:8FB0:
frame_02_8FBC:
	.byte $90,$6A,$92,$00,$93,$02,$94,$00,$95,$03,$96,$03,$97,$02,$98,$02;- D 0 - I - 0x004FCC 02:8FBC:
	.byte $99,$00,$9A,$00,$9D,$00,$9E,$00,$9F,$02,$A0,$00,$A1,$00,$9B,$03;- D 0 - I - 0x004FDC 02:8FCC:
	.byte $9C,$03,$A2,$03           ;- D 0 - I - 0x004FEC 02:8FDC:
frame_02_8FE0:
	.byte $8E,$6C,$A3,$00,$A4,$00,$A5,$00,$A7,$03,$A9,$02,$AA,$02,$AB,$03;- D 0 - I - 0x004FF0 02:8FE0:
	.byte $AC,$02,$AD,$02,$AF,$03,$B0,$02,$B1,$00,$A6,$03,$A8,$00,$AE,$00;- D 0 - I - 0x005000 02:8FF0:
frame_02_9000:
	.byte $84,$6E,$B3,$03,$B4,$03,$B5,$00,$B6,$03,$B7,$03;- D 0 - I - 0x005010 02:9000:
frame_02_900C:
	.byte $82,$6E,$B3,$03,$B4,$03,$B8,$00;- D 0 - I - 0x00501C 02:900C:
frame_02_9014:
	.byte $82,$6E,$B3,$03,$B4,$03,$B5,$00;- D 0 - I - 0x005024 02:9014:
frame_02_901C:
	.byte $01,$5C,$B3,$03,$B4,$03   ;- D 0 - I - 0x00502C 02:901C:
frame_02_9022:
	.byte $01,$0E,$B9,$03,$BA,$03   ;- D 0 - I - 0x005032 02:9022:
frame_02_9028:
	.byte $01,$5A,$BB,$03,$BC,$03   ;- D 0 - I - 0x005038 02:9028:
frame_02_902E:
	.byte $01,$56,$BE,$03,$BD,$03   ;- D 0 - I - 0x00503E 02:902E:
frame_02_9034:
	.byte $01,$5C,$B4,$C3,$B3,$C3   ;- D 0 - I - 0x005044 02:9034:
frame_02_903A:
	.byte $01,$0E,$BA,$C3,$B9,$C3   ;- D 0 - I - 0x00504A 02:903A:
frame_02_9040:
	.byte $01,$5A,$BC,$C3,$BB,$C3   ;- D 0 - I - 0x005050 02:9040:
frame_02_9046:
	.byte $01,$56,$BD,$C3,$BE,$C3   ;- D 0 - I - 0x005056 02:9046:
frame_02_904C:
	.byte $90,$70,$8E,$83,$8F,$82,$90,$80,$8A,$83,$8B,$83,$8C,$82,$8D,$80;- - - - - - 0x00505C 02:904C:
	.byte $86,$83,$89,$80,$87,$82,$88,$82,$82,$83,$83,$80,$84,$80,$85,$82;- - - - - - 0x00506C 02:905C:
	.byte $80,$83,$81,$80           ;- - - - - - 0x00507C 02:906C:
frame_02_9070:
	.byte $91,$72,$91,$C2,$90,$C0,$8F,$C3,$8E,$C0,$8B,$C0,$8A,$C0,$89,$C3;- D 0 - I - 0x005080 02:9070:
	.byte $88,$C3,$86,$C2,$87,$C2,$84,$C3,$82,$C0,$81,$C0,$80,$C3,$8D,$C2;- D 0 - I - 0x005090 02:9080:
	.byte $8C,$C3,$85,$C0,$83,$C2   ;- D 0 - I - 0x0050A0 02:9090:
frame_02_9096:
	.byte $00,$5E,$B4,$03           ;- - - - - - 0x0050A6 02:9096:
frame_02_909A:
	.byte $01,$5C,$B5,$03,$B6,$03   ;- - - - - - 0x0050AA 02:909A:
frame_02_90A0:
	.byte $01,$5C,$B7,$03,$B8,$03   ;- - - - - - 0x0050B0 02:90A0:
frame_02_90A6:
	.byte $8F,$77,$80,$03,$81,$00,$82,$03,$83,$00,$84,$00,$85,$03,$86,$00;- D 0 - I - 0x0050B6 02:90A6:
	.byte $87,$02,$88,$02,$89,$03,$8A,$03,$8B,$02,$8C,$00,$8D,$03,$8E,$02;- D 0 - I - 0x0050C6 02:90B6:
	.byte $8F,$00                   ;- D 0 - I - 0x0050D6 02:90C6:
frame_02_90C8:
	.byte $8F,$79,$88,$02,$89,$03,$8C,$00,$8D,$03,$8E,$02,$8F,$00,$90,$00;- D 0 - I - 0x0050D8 02:90C8:
	.byte $91,$00,$92,$03,$93,$00,$94,$00,$96,$00,$95,$03,$97,$02,$98,$03;- D 0 - I - 0x0050E8 02:90D8:
	.byte $99,$02                   ;- D 0 - I - 0x0050F8 02:90E8:
frame_02_90EA:
	.byte $01,$5C,$80,$00,$81,$00   ;- D 0 - I - 0x0050FA 02:90EA:
frame_02_90F0:
	.byte $8B,$74,$82,$00,$83,$00,$84,$00,$85,$00,$86,$00,$87,$00,$8A,$00;- D 0 - I - 0x005100 02:90F0:
	.byte $8B,$00,$8C,$00,$88,$02,$89,$02,$8D,$02;- D 0 - I - 0x005110 02:9100:
frame_02_910A:
	.byte $13,$FC,$93,$00,$94,$00,$9A,$00,$9B,$00,$95,$00,$9C,$00,$8E,$00;- D 0 - I - 0x00511A 02:910A:
	.byte $8F,$00,$90,$00,$91,$00,$92,$00,$99,$00,$9E,$00,$9F,$00,$A0,$00;- D 0 - I - 0x00512A 02:911A:
	.byte $A1,$00,$96,$02,$97,$02,$98,$02,$9D,$02;- D 0 - I - 0x00513A 02:912A:
frame_02_9134:
	.byte $0F,$FC,$A7,$00,$A8,$00,$AB,$00,$AC,$00,$A9,$00,$AD,$00,$A2,$00;- D 0 - I - 0x005144 02:9134:
	.byte $A3,$00,$A4,$00,$A5,$00,$A6,$00,$AA,$00,$AE,$00,$AF,$00,$B0,$00;- D 0 - I - 0x005154 02:9144:
	.byte $B1,$00                   ;- D 0 - I - 0x005164 02:9154:
frame_02_9156:
	.byte $0F,$FC,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$B0,$40,$B1,$40,$AE,$00;- - - - - - 0x005166 02:9156:
	.byte $AF,$00,$AF,$40,$AE,$40,$B0,$00,$B1,$00,$B2,$00,$B3,$00,$B3,$40;- - - - - - 0x005176 02:9166:
	.byte $B2,$40                   ;- - - - - - 0x005186 02:9176:
frame_02_9178:
	.byte $91,$76,$80,$00,$81,$00,$83,$00,$84,$00,$85,$00,$87,$03,$88,$02;- - - - - - 0x005188 02:9178:
	.byte $89,$02,$8A,$00,$8B,$03,$8C,$03,$8D,$00,$8E,$00,$82,$03,$FF,$00;- - - - - - 0x005198 02:9188:
	.byte $86,$03,$8F,$02,$BD,$02   ;- - - - - - 0x0051A8 02:9198:
frame_02_919E:
	.byte $8F,$78,$90,$00,$91,$00,$93,$00,$94,$00,$96,$02,$87,$03,$88,$02;- - - - - - 0x0051AE 02:919E:
	.byte $89,$02,$8A,$00,$8B,$03,$8C,$03,$8D,$00,$8E,$00,$92,$03,$95,$03;- - - - - - 0x0051BE 02:91AE:
	.byte $8F,$02                   ;- - - - - - 0x0051CE 02:91BE:
frame_02_91C0:
	.byte $90,$7A,$97,$00,$98,$00,$9B,$03,$9C,$00,$9D,$00,$87,$03,$88,$02;- - - - - - 0x0051D0 02:91C0:
	.byte $89,$02,$8A,$00,$8B,$03,$8C,$03,$8D,$00,$8E,$00,$99,$03,$9A,$03;- - - - - - 0x0051E0 02:91D0:
	.byte $9E,$02,$8F,$02           ;- - - - - - 0x0051F0 02:91E0:
frame_02_91E4:
	.byte $8F,$76,$9F,$03,$A0,$00,$A2,$03,$A3,$00,$A4,$00,$A6,$03,$A7,$00;- D 0 - I - 0x0051F4 02:91E4:
	.byte $A8,$00,$A9,$00,$AA,$03,$AB,$03,$AC,$00,$AD,$00,$FF,$00,$A1,$03;- D 0 - I - 0x005204 02:91F4:
	.byte $A5,$00                   ;- D 0 - I - 0x005214 02:9204:
frame_02_9206:
	.byte $90,$7C,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x005216 02:9206:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$50,$00,$52,$02,$51,$00;- D 0 - I - 0x005226 02:9216:
	.byte $53,$00,$54,$00           ;- D 0 - I - 0x005236 02:9226:
frame_02_922A:
	.byte $8F,$7E,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x00523A 02:922A:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$59,$02,$5A,$02,$5B,$00;- D 0 - I - 0x00524A 02:923A:
	.byte $5C,$00                   ;- D 0 - I - 0x00525A 02:924A:
frame_02_924C:
	.byte $8F,$80,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x00525C 02:924C:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$56,$02,$57,$02,$55,$00;- D 0 - I - 0x00526C 02:925C:
	.byte $58,$00                   ;- D 0 - I - 0x00527C 02:926C:
frame_02_926E:
	.byte $8F,$81,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x00527E 02:926E:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$5D,$02,$5E,$02,$60,$00;- D 0 - I - 0x00528E 02:927E:
	.byte $5F,$00                   ;- D 0 - I - 0x00529E 02:928E:
frame_02_9290:
	.byte $90,$82,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x0052A0 02:9290:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$4D,$02,$4E,$02;- D 0 - I - 0x0052B0 02:92A0:
	.byte $4F,$00,$50,$00           ;- D 0 - I - 0x0052C0 02:92B0:
frame_02_92B4:
	.byte $94,$84,$51,$00,$52,$00,$53,$00,$54,$00,$55,$00,$56,$00,$57,$00;- D 0 - I - 0x0052C4 02:92B4:
	.byte $58,$00,$59,$00,$5A,$00,$5B,$00,$5C,$00,$5D,$00,$5E,$00,$5F,$00;- D 0 - I - 0x0052D4 02:92C4:
	.byte $60,$00,$61,$02,$62,$02,$63,$02,$64,$00,$65,$00;- D 0 - I - 0x0052E4 02:92D4:
frame_02_92E0:
	.byte $90,$86,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x0052F0 02:92E0:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$02,$4E,$00,$4F,$00;- D 0 - I - 0x005300 02:92F0:
	.byte $4D,$02,$50,$00           ;- D 0 - I - 0x005310 02:9300:
frame_02_9304:
	.byte $95,$88,$5B,$00,$5C,$00,$5D,$00,$5E,$00,$5F,$00,$60,$00,$61,$00;- D 0 - I - 0x005314 02:9304:
	.byte $62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$02,$68,$02,$69,$00;- D 0 - I - 0x005324 02:9314:
	.byte $6A,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$6B,$00,$70,$00;- D 0 - I - 0x005334 02:9324:
frame_02_9332:
	.byte $8F,$8A,$40,$02,$41,$00,$42,$00,$43,$00,$44,$00,$45,$02,$46,$00;- D 0 - I - 0x005342 02:9332:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$4D,$00,$4E,$00;- D 0 - I - 0x005352 02:9342:
	.byte $4F,$00                   ;- D 0 - I - 0x005362 02:9352:
frame_02_9354:
	.byte $90,$8C,$56,$00,$57,$00,$58,$00,$59,$00,$5A,$00,$5B,$00,$5C,$00;- D 0 - I - 0x005364 02:9354:
	.byte $5D,$00,$5E,$00,$5F,$00,$60,$00,$61,$00,$62,$00,$63,$02,$64,$02;- D 0 - I - 0x005374 02:9364:
	.byte $65,$00,$66,$00           ;- D 0 - I - 0x005384 02:9374:
frame_02_9378:
	.byte $90,$8E,$50,$C0,$4D,$C2,$4F,$C0,$4E,$C0,$4C,$C2,$4B,$C0,$4A,$C0;- D 0 - I - 0x005388 02:9378:
	.byte $49,$C0,$48,$C0,$47,$C0,$46,$C0,$45,$C0,$44,$C0,$43,$C0,$42,$C0;- D 0 - I - 0x005398 02:9388:
	.byte $41,$C0,$40,$C0           ;- D 0 - I - 0x0053A8 02:9398:
frame_02_939C:
	.byte $8F,$58,$61,$00,$62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00;- D 0 - I - 0x0053AC 02:939C:
	.byte $68,$00,$69,$00,$49,$00,$4A,$00,$4B,$00,$4C,$02,$4D,$02,$4E,$00;- D 0 - I - 0x0053BC 02:93AC:
	.byte $4F,$00                   ;- D 0 - I - 0x0053CC 02:93BC:
frame_02_93BE:
	.byte $8F,$5A,$4E,$80,$4F,$80,$4C,$82,$4D,$82,$49,$80,$4A,$80,$4B,$80;- D 0 - I - 0x0053CE 02:93BE:
	.byte $67,$80,$68,$80,$69,$80,$64,$80,$65,$80,$66,$80,$61,$80,$62,$80;- D 0 - I - 0x0053DE 02:93CE:
	.byte $63,$80                   ;- D 0 - I - 0x0053EE 02:93DE:
frame_02_93E0:
	.byte $8F,$58,$6A,$00,$6B,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$70,$00;- D 0 - I - 0x0053F0 02:93E0:
	.byte $71,$00,$69,$00,$49,$00,$4A,$00,$4B,$00,$4C,$02,$4D,$02,$4E,$00;- D 0 - I - 0x005400 02:93F0:
	.byte $4F,$00                   ;- D 0 - I - 0x005410 02:9400:
frame_02_9402:
	.byte $90,$7C,$61,$00,$62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00;- D 0 - I - 0x005412 02:9402:
	.byte $68,$00,$69,$00,$49,$00,$4A,$00,$4B,$00,$50,$00,$52,$02,$51,$00;- D 0 - I - 0x005422 02:9412:
	.byte $53,$00,$54,$00           ;- D 0 - I - 0x005432 02:9422:
frame_02_9426:
	.byte $8F,$7E,$61,$00,$62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00;- D 0 - I - 0x005436 02:9426:
	.byte $68,$00,$69,$00,$49,$00,$4A,$00,$4B,$00,$59,$02,$5A,$02,$5B,$00;- D 0 - I - 0x005446 02:9436:
	.byte $5C,$00                   ;- D 0 - I - 0x005456 02:9446:
frame_02_9448:
	.byte $8F,$80,$61,$00,$62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00;- D 0 - I - 0x005458 02:9448:
	.byte $68,$00,$69,$00,$49,$00,$4A,$00,$4B,$00,$56,$02,$57,$02,$55,$00;- D 0 - I - 0x005468 02:9458:
	.byte $58,$00                   ;- D 0 - I - 0x005478 02:9468:
frame_02_946A:
	.byte $8F,$81,$61,$00,$62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00;- D 0 - I - 0x00547A 02:946A:
	.byte $68,$00,$69,$00,$49,$00,$4A,$00,$4B,$00,$5D,$02,$5E,$02,$60,$00;- D 0 - I - 0x00548A 02:947A:
	.byte $5F,$00                   ;- D 0 - I - 0x00549A 02:948A:
frame_02_948C:
	.byte $90,$82,$66,$00,$67,$00,$68,$00,$69,$00,$6A,$00,$6B,$00,$46,$00;- D 0 - I - 0x00549C 02:948C:
	.byte $47,$00,$6C,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$4D,$02,$4E,$02;- D 0 - I - 0x0054AC 02:949C:
	.byte $4F,$00,$50,$00           ;- D 0 - I - 0x0054BC 02:94AC:
frame_02_94B0:
	.byte $92,$85,$6D,$00,$6E,$00,$6F,$00,$70,$00,$57,$00,$58,$00,$71,$00;- D 0 - I - 0x0054C0 02:94B0:
	.byte $72,$00,$5B,$00,$5C,$00,$5D,$00,$73,$00,$74,$00,$60,$00,$61,$02;- D 0 - I - 0x0054D0 02:94C0:
	.byte $62,$02,$63,$02,$64,$00,$65,$00;- D 0 - I - 0x0054E0 02:94D0:
frame_02_94D8:
	.byte $91,$90,$6A,$00,$6B,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$72,$00;- D 0 - I - 0x0054E8 02:94D8:
	.byte $73,$00,$74,$00,$75,$00,$76,$00,$77,$00,$78,$00,$50,$00,$52,$02;- D 0 - I - 0x0054F8 02:94E8:
	.byte $51,$00,$53,$00,$54,$00   ;- D 0 - I - 0x005508 02:94F8:
frame_02_94FE:
	.byte $90,$92,$6A,$00,$6B,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$72,$00;- D 0 - I - 0x00550E 02:94FE:
	.byte $73,$00,$74,$00,$75,$00,$76,$00,$77,$00,$78,$00,$59,$02,$5A,$02;- D 0 - I - 0x00551E 02:950E:
	.byte $5B,$00,$5C,$00           ;- D 0 - I - 0x00552E 02:951E:
frame_02_9522:
	.byte $90,$94,$6A,$00,$6B,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$72,$00;- D 0 - I - 0x005532 02:9522:
	.byte $73,$00,$74,$00,$75,$00,$76,$00,$77,$00,$78,$00,$56,$02,$57,$02;- D 0 - I - 0x005542 02:9532:
	.byte $55,$00,$58,$00           ;- D 0 - I - 0x005552 02:9542:
frame_02_9546:
	.byte $90,$95,$6A,$00,$6B,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$72,$00;- - - - - - 0x005556 02:9546:
	.byte $73,$00,$74,$00,$75,$00,$76,$00,$77,$00,$78,$00,$5D,$02,$5E,$02;- - - - - - 0x005566 02:9556:
	.byte $60,$00,$5F,$00           ;- - - - - - 0x005576 02:9566:
frame_02_956A:
	.byte $92,$85,$75,$00,$76,$00,$77,$00,$78,$00,$57,$00,$58,$00,$79,$00;- D 0 - I - 0x00557A 02:956A:
	.byte $7A,$00,$5B,$00,$5C,$00,$5D,$00,$73,$00,$74,$00,$60,$00,$61,$02;- D 0 - I - 0x00558A 02:957A:
	.byte $62,$02,$63,$02,$64,$00,$65,$00;- D 0 - I - 0x00559A 02:958A:
frame_02_9592:
	.byte $92,$86,$53,$00,$54,$00,$55,$00,$56,$00,$57,$00,$58,$00,$46,$00;- D 0 - I - 0x0055A2 02:9592:
	.byte $59,$00,$5A,$00,$49,$00,$4A,$00,$4B,$00,$4C,$02,$4E,$00,$4F,$00;- D 0 - I - 0x0055B2 02:95A2:
	.byte $4D,$02,$50,$00,$51,$00,$52,$00;- D 0 - I - 0x0055C2 02:95B2:
frame_02_95BA:
	.byte $95,$88,$FF,$00,$71,$00,$72,$00,$5E,$00,$73,$00,$74,$00,$75,$00;- D 0 - I - 0x0055CA 02:95BA:
	.byte $62,$00,$63,$00,$64,$00,$76,$00,$77,$00,$67,$02,$68,$02,$69,$00;- D 0 - I - 0x0055DA 02:95CA:
	.byte $6A,$00,$6C,$00,$6D,$00,$6E,$00,$6F,$00,$6B,$00,$70,$00;- D 0 - I - 0x0055EA 02:95DA:
frame_02_95E8:
	.byte $8F,$8A,$40,$02,$41,$00,$42,$00,$43,$00,$44,$00,$45,$02,$46,$00;- D 0 - I - 0x0055F8 02:95E8:
	.byte $50,$00,$51,$00,$52,$00,$4A,$00,$4B,$00,$4C,$00,$53,$00,$54,$00;- D 0 - I - 0x005608 02:95F8:
	.byte $55,$00                   ;- D 0 - I - 0x005618 02:9608:
frame_02_960A:
	.byte $90,$8C,$67,$00,$68,$00,$69,$00,$6A,$00,$6B,$00,$6C,$00,$6D,$00;- D 0 - I - 0x00561A 02:960A:
	.byte $5D,$00,$5E,$00,$5F,$00,$60,$00,$61,$00,$62,$00,$63,$02,$64,$02;- D 0 - I - 0x00562A 02:961A:
	.byte $65,$00,$66,$00           ;- D 0 - I - 0x00563A 02:962A:
frame_02_962E:
	.byte $92,$8E,$50,$C0,$4D,$C2,$4F,$C0,$4E,$C0,$4C,$C2,$4B,$C0,$4A,$C0;- D 0 - I - 0x00563E 02:962E:
	.byte $49,$C0,$5A,$C0,$59,$C0,$46,$C0,$58,$C0,$57,$C0,$56,$C0,$55,$C0;- D 0 - I - 0x00564E 02:963E:
	.byte $54,$C0,$53,$C0,$52,$C0,$51,$C0;- D 0 - I - 0x00565E 02:964E:
frame_02_9656:
	.byte $93,$96,$80,$00,$81,$00,$84,$02,$82,$00,$85,$02,$83,$00,$86,$00;- D 0 - I - 0x005666 02:9656:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$8E,$00;- D 0 - I - 0x005676 02:9666:
	.byte $8F,$03,$90,$03,$91,$00,$92,$00,$93,$00;- D 0 - I - 0x005686 02:9676:
frame_02_9680:
	.byte $93,$97,$80,$00,$81,$00,$84,$02,$82,$00,$85,$02,$83,$00,$86,$00;- D 0 - I - 0x005690 02:9680:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$94,$03;- D 0 - I - 0x0056A0 02:9690:
	.byte $95,$03,$96,$03,$97,$00,$98,$00,$99,$00;- D 0 - I - 0x0056B0 02:96A0:
frame_02_96AA:
	.byte $93,$98,$80,$00,$81,$00,$84,$02,$82,$00,$85,$02,$83,$00,$86,$00;- D 0 - I - 0x0056BA 02:96AA:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$9A,$03;- D 0 - I - 0x0056CA 02:96BA:
	.byte $9B,$03,$9C,$03,$97,$00,$9D,$00,$9E,$00;- D 0 - I - 0x0056DA 02:96CA:
frame_02_96D4:
	.byte $93,$99,$80,$00,$81,$00,$84,$02,$82,$00,$85,$02,$83,$00,$86,$00;- D 0 - I - 0x0056E4 02:96D4:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$9F,$03;- D 0 - I - 0x0056F4 02:96E4:
	.byte $A0,$03,$A1,$03,$97,$00,$A2,$00,$A3,$00;- D 0 - I - 0x005704 02:96F4:
frame_02_96FE:
	.byte $93,$9A,$80,$00,$81,$00,$84,$02,$82,$00,$85,$02,$83,$00,$86,$00;- D 0 - I - 0x00570E 02:96FE:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$A4,$03;- D 0 - I - 0x00571E 02:970E:
	.byte $A5,$03,$A6,$03,$97,$00,$A7,$00,$A8,$00;- D 0 - I - 0x00572E 02:971E:
frame_02_9728:
	.byte $94,$9B,$A9,$00,$AA,$00,$AC,$02,$AB,$00,$AD,$00,$B1,$02,$AE,$00;- D 0 - I - 0x005738 02:9728:
	.byte $AF,$00,$B0,$00,$B2,$00,$B3,$00,$B4,$00,$B5,$00,$B6,$03,$B9,$00;- D 0 - I - 0x005748 02:9738:
	.byte $B7,$03,$B8,$03,$BA,$00,$BB,$00,$BC,$03,$BD,$00;- D 0 - I - 0x005758 02:9748:
frame_02_9754:
	.byte $95,$9C,$80,$00,$81,$00,$82,$00,$83,$00,$86,$02,$84,$00,$85,$00;- D 0 - I - 0x005764 02:9754:
	.byte $87,$00,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$8E,$00;- D 0 - I - 0x005774 02:9764:
	.byte $8F,$00,$90,$03,$93,$00,$91,$03,$92,$03,$94,$00,$95,$00;- D 0 - I - 0x005784 02:9774:
frame_02_9782:
	.byte $95,$9D,$96,$00,$97,$00,$98,$00,$99,$00,$9A,$00,$9B,$02,$84,$00;- D 0 - I - 0x005792 02:9782:
	.byte $85,$00,$9C,$00,$9D,$00,$9E,$00,$9F,$00,$A0,$00,$A1,$00,$A2,$00;- D 0 - I - 0x0057A2 02:9792:
	.byte $A3,$00,$A4,$00,$A5,$03,$A7,$00,$A6,$03,$A8,$00,$A9,$00;- D 0 - I - 0x0057B2 02:97A2:
frame_02_97B0:
	.byte $94,$9E,$AA,$00,$AB,$00,$AC,$00,$AD,$00,$AF,$02,$AE,$00,$B0,$00;- D 0 - I - 0x0057C0 02:97B0:
	.byte $B1,$00,$B2,$00,$B3,$00,$B4,$00,$B5,$00,$B6,$00,$B7,$00,$B8,$00;- D 0 - I - 0x0057D0 02:97C0:
	.byte $B9,$03,$BC,$00,$BA,$03,$BB,$03,$BD,$00,$BE,$00;- D 0 - I - 0x0057E0 02:97D0:
frame_02_97DC:
	.byte $93,$9F,$80,$00,$81,$00,$82,$00,$83,$00,$86,$02,$84,$00,$85,$00;- D 0 - I - 0x0057EC 02:97DC:
	.byte $87,$00,$88,$00,$8B,$02,$89,$00,$8A,$00,$8C,$00,$8D,$00,$8E,$00;- D 0 - I - 0x0057FC 02:97EC:
	.byte $8F,$00,$90,$03,$91,$03,$92,$00,$93,$00;- D 0 - I - 0x00580C 02:97FC:
frame_02_9806:
	.byte $94,$A0,$94,$00,$97,$02,$95,$00,$96,$00,$98,$00,$99,$00,$9C,$02;- D 0 - I - 0x005816 02:9806:
	.byte $9A,$00,$9B,$00,$9D,$00,$A1,$03,$9E,$00,$9F,$00,$A0,$00,$A2,$03;- D 0 - I - 0x005826 02:9816:
	.byte $A3,$03,$A6,$00,$A4,$03,$A5,$03,$A7,$00,$A8,$00;- D 0 - I - 0x005836 02:9826:
frame_02_9832:
	.byte $94,$A1,$80,$00,$81,$00,$82,$00,$83,$00,$86,$02,$84,$00,$85,$00;- D 0 - I - 0x005842 02:9832:
	.byte $87,$02,$88,$00,$89,$00,$8A,$00,$8B,$00,$8C,$00,$8D,$00,$8E,$00;- D 0 - I - 0x005852 02:9842:
	.byte $8F,$00,$90,$03,$92,$00,$91,$03,$93,$00,$94,$00;- D 0 - I - 0x005862 02:9852:
frame_02_985E:
	.byte $8F,$A2,$95,$00,$96,$00,$97,$00,$98,$03,$99,$00,$9A,$00,$9B,$00;- D 0 - I - 0x00586E 02:985E:
	.byte $9C,$02,$9D,$00,$9E,$00,$9F,$00,$A0,$00,$A1,$02,$A2,$00,$A3,$00;- D 0 - I - 0x00587E 02:986E:
	.byte $A4,$00                   ;- D 0 - I - 0x00588E 02:987E:
frame_02_9880:
	.byte $8D,$A3,$A5,$03,$A6,$00,$A7,$00,$A8,$00,$A9,$03,$AA,$03,$AB,$00;- D 0 - I - 0x005890 02:9880:
	.byte $AC,$00,$AD,$00,$AE,$00,$AF,$00,$B0,$00,$B1,$00,$B2,$02;- D 0 - I - 0x0058A0 02:9890:
frame_02_989E:
	.byte $93,$A4                   ;- - - - - - 0x0058AE 02:989E: unused animation script data: (frame id, flags) pairs
	.byte $92,$80                   ;- - - - - - 0x0058B0 02:98A0: unused animation script data: (frame id, flags) pairs
	.byte $93,$80                   ;- - - - - - 0x0058B2 02:98A2: unused animation script data: (frame id, flags) pairs
	.byte $8E,$80                   ;- - - - - - 0x0058B4 02:98A4: unused animation script data: (frame id, flags) pairs
	.byte $8F,$83                   ;- - - - - - 0x0058B6 02:98A6: unused animation script data: (frame id, flags) pairs
	.byte $90,$83                   ;- - - - - - 0x0058B8 02:98A8: unused animation script data: (frame id, flags) pairs
	.byte $91,$80                   ;- - - - - - 0x0058BA 02:98AA: unused animation script data: (frame id, flags) pairs
	.byte $8A,$80                   ;- - - - - - 0x0058BC 02:98AC: unused animation script data: (frame id, flags) pairs
	.byte $8B,$80                   ;- - - - - - 0x0058BE 02:98AE: unused animation script data: (frame id, flags) pairs
	.byte $8C,$80                   ;- - - - - - 0x0058C0 02:98B0: unused animation script data: (frame id, flags) pairs
	.byte $8D,$80                   ;- - - - - - 0x0058C2 02:98B2: unused animation script data: (frame id, flags) pairs
	.byte $86,$80                   ;- - - - - - 0x0058C4 02:98B4: unused animation script data: (frame id, flags) pairs
	.byte $87,$80                   ;- - - - - - 0x0058C6 02:98B6: unused animation script data: (frame id, flags) pairs
	.byte $88,$80                   ;- - - - - - 0x0058C8 02:98B8: unused animation script data: (frame id, flags) pairs
	.byte $89,$80                   ;- - - - - - 0x0058CA 02:98BA: unused animation script data: (frame id, flags) pairs
	.byte $84,$82                   ;- - - - - - 0x0058CC 02:98BC: unused animation script data: (frame id, flags) pairs
	.byte $82,$80                   ;- - - - - - 0x0058CE 02:98BE: unused animation script data: (frame id, flags) pairs
	.byte $85,$82                   ;- - - - - - 0x0058D0 02:98C0: unused animation script data: (frame id, flags) pairs
	.byte $83,$80                   ;- - - - - - 0x0058D2 02:98C2: unused animation script data: (frame id, flags) pairs
	.byte $80,$80                   ;- - - - - - 0x0058D4 02:98C4: unused animation script data: (frame id, flags) pairs
	.byte $81,$80                   ;- - - - - - 0x0058D6 02:98C6: unused animation script data: (frame id, flags) pairs
frame_02_98C8:
	.byte $94,$A5                   ;- - - - - - 0x0058D8 02:98C8: unused animation script data: (frame id, flags) pairs
	.byte $81,$C0                   ;- - - - - - 0x0058DA 02:98CA: unused animation script data: (frame id, flags) pairs
	.byte $80,$C0                   ;- - - - - - 0x0058DC 02:98CC: unused animation script data: (frame id, flags) pairs
	.byte $82,$C0                   ;- - - - - - 0x0058DE 02:98CE: unused animation script data: (frame id, flags) pairs
	.byte $84,$C0                   ;- - - - - - 0x0058E0 02:98D0: unused animation script data: (frame id, flags) pairs
	.byte $83,$C0                   ;- - - - - - 0x0058E2 02:98D2: unused animation script data: (frame id, flags) pairs
	.byte $85,$C0                   ;- - - - - - 0x0058E4 02:98D4: unused animation script data: (frame id, flags) pairs
	.byte $86,$C2                   ;- - - - - - 0x0058E6 02:98D6: unused animation script data: (frame id, flags) pairs
	.byte $88,$C0                   ;- - - - - - 0x0058E8 02:98D8: unused animation script data: (frame id, flags) pairs
	.byte $87,$C2                   ;- - - - - - 0x0058EA 02:98DA: unused animation script data: (frame id, flags) pairs
	.byte $8A,$C0                   ;- - - - - - 0x0058EC 02:98DC: unused animation script data: (frame id, flags) pairs
	.byte $89,$C0                   ;- - - - - - 0x0058EE 02:98DE: unused animation script data: (frame id, flags) pairs
	.byte $8C,$C0                   ;- - - - - - 0x0058F0 02:98E0: unused animation script data: (frame id, flags) pairs
	.byte $8B,$C0                   ;- - - - - - 0x0058F2 02:98E2: unused animation script data: (frame id, flags) pairs
	.byte $8E,$C0                   ;- - - - - - 0x0058F4 02:98E4: unused animation script data: (frame id, flags) pairs
	.byte $8D,$C0                   ;- - - - - - 0x0058F6 02:98E6: unused animation script data: (frame id, flags) pairs
	.byte $8F,$C0                   ;- - - - - - 0x0058F8 02:98E8: unused animation script data: (frame id, flags) pairs
	.byte $91,$C3                   ;- - - - - - 0x0058FA 02:98EA: unused animation script data: (frame id, flags) pairs
	.byte $90,$C3                   ;- - - - - - 0x0058FC 02:98EC: unused animation script data: (frame id, flags) pairs
	.byte $92,$C0                   ;- - - - - - 0x0058FE 02:98EE: unused animation script data: (frame id, flags) pairs
	.byte $94,$C0                   ;- - - - - - 0x005900 02:98F0: unused animation script data: (frame id, flags) pairs
	.byte $93,$C0                   ;- - - - - - 0x005902 02:98F2: unused animation script data: (frame id, flags) pairs
frame_02_98F4:
	.byte $98,$B1,$FF,$00,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005904 02:98F4:
	.byte $86,$02,$87,$02,$88,$02,$B8,$00,$8C,$02,$8F,$00,$8D,$03,$B9,$00;- D 0 - I - 0x005914 02:9904:
	.byte $BA,$02,$93,$00,$96,$02,$94,$00,$95,$00,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005924 02:9914:
	.byte $92,$02,$97,$02           ;- D 0 - I - 0x005934 02:9924:
frame_02_9928:
	.byte $9B,$B1,$F3,$42,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005938 02:9928:
	.byte $86,$02,$87,$02,$88,$02,$8B,$00,$8C,$02,$8F,$00,$8D,$03,$90,$00;- D 0 - I - 0x005948 02:9938:
	.byte $91,$02,$93,$00,$96,$02,$94,$00,$95,$00,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005958 02:9948:
	.byte $92,$02,$97,$02,$EF,$02,$F0,$02,$F4,$42;- D 0 - I - 0x005968 02:9958:
frame_02_9962:
	.byte $99,$B2,$FF,$00,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005972 02:9962:
	.byte $86,$02,$87,$02,$88,$02,$B8,$00,$8C,$02,$8F,$00,$8D,$03,$B9,$00;- D 0 - I - 0x005982 02:9972:
	.byte $98,$02,$9B,$00,$99,$02,$9C,$02,$9D,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005992 02:9982:
	.byte $9A,$00,$9E,$00,$9F,$00   ;- D 0 - I - 0x0059A2 02:9992:
frame_02_9998:
	.byte $99,$B3,$FF,$00,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x0059A8 02:9998:
	.byte $86,$02,$87,$02,$88,$02,$B8,$00,$8C,$02,$8F,$00,$8D,$03,$B9,$00;- D 0 - I - 0x0059B8 02:99A8:
	.byte $A0,$02,$A1,$02,$A2,$02,$A5,$02,$A6,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x0059C8 02:99B8:
	.byte $A3,$00,$A4,$00,$A7,$00   ;- D 0 - I - 0x0059D8 02:99C8:
frame_02_99CE:
	.byte $99,$B2,$FF,$00,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x0059DE 02:99CE:
	.byte $86,$02,$87,$02,$88,$02,$B8,$00,$8C,$02,$8F,$00,$8D,$03,$B9,$00;- D 0 - I - 0x0059EE 02:99DE:
	.byte $A8,$02,$AA,$00,$A9,$02,$AC,$02,$AD,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x0059FE 02:99EE:
	.byte $AB,$00,$AE,$00,$AF,$00   ;- D 0 - I - 0x005A0E 02:99FE:
frame_02_9A04:
	.byte $9A,$B4,$FF,$00,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005A14 02:9A04:
	.byte $86,$02,$87,$02,$88,$02,$B8,$00,$8C,$02,$8F,$00,$8D,$03,$B9,$00;- D 0 - I - 0x005A24 02:9A14:
	.byte $B0,$02,$B1,$02,$B2,$02,$B4,$02,$B7,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005A34 02:9A24:
	.byte $9B,$00,$B3,$00,$B5,$00,$B6,$00;- D 0 - I - 0x005A44 02:9A34:
frame_02_9A3C:
	.byte $9C,$B2,$F3,$42,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005A4C 02:9A3C:
	.byte $86,$02,$87,$02,$88,$02,$8B,$00,$8C,$02,$8F,$00,$8D,$03,$90,$00;- D 0 - I - 0x005A5C 02:9A4C:
	.byte $98,$02,$9B,$00,$99,$02,$9C,$02,$9D,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005A6C 02:9A5C:
	.byte $9A,$00,$9E,$00,$9F,$00,$EF,$02,$F0,$02,$F4,$42;- D 0 - I - 0x005A7C 02:9A6C:
frame_02_9A78:
	.byte $9C,$B3,$F3,$42,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005A88 02:9A78:
	.byte $86,$02,$87,$02,$88,$02,$8B,$00,$8C,$02,$8F,$00,$8D,$03,$90,$00;- D 0 - I - 0x005A98 02:9A88:
	.byte $A0,$02,$A1,$02,$A2,$02,$A5,$02,$A6,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005AA8 02:9A98:
	.byte $A3,$00,$A4,$00,$A7,$00,$EF,$02,$F0,$02,$F4,$42;- D 0 - I - 0x005AB8 02:9AA8:
frame_02_9AB4:
	.byte $9C,$B2,$F3,$42,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005AC4 02:9AB4:
	.byte $86,$02,$87,$02,$88,$02,$8B,$00,$8C,$02,$8F,$00,$8D,$03,$90,$00;- D 0 - I - 0x005AD4 02:9AC4:
	.byte $A8,$02,$AA,$00,$A9,$02,$AC,$02,$AD,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005AE4 02:9AD4:
	.byte $AB,$00,$AE,$00,$AF,$00,$EF,$02,$F0,$02,$F4,$42;- D 0 - I - 0x005AF4 02:9AE4:
frame_02_9AF0:
	.byte $9D,$B4,$F3,$42,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00;- D 0 - I - 0x005B00 02:9AF0:
	.byte $86,$02,$87,$02,$88,$02,$8B,$00,$8C,$02,$8F,$00,$8D,$03,$90,$00;- D 0 - I - 0x005B10 02:9B00:
	.byte $B0,$02,$B1,$02,$B2,$02,$B4,$02,$B7,$02,$84,$02,$89,$03,$8E,$03;- D 0 - I - 0x005B20 02:9B10:
	.byte $9B,$00,$B3,$00,$B5,$00,$B6,$00,$EF,$02,$F0,$02,$F4,$42;- D 0 - I - 0x005B30 02:9B20:
frame_02_9B2E:
	.byte $9B,$B5,$F3,$42,$80,$00,$81,$00,$83,$00,$85,$02,$C0,$02,$87,$02;- D 0 - I - 0x005B3E 02:9B2E:
	.byte $88,$02,$C1,$00,$8C,$02,$8F,$00,$8D,$03,$90,$00,$91,$02,$93,$00;- D 0 - I - 0x005B4E 02:9B3E:
	.byte $96,$02,$94,$00,$95,$00,$84,$02,$89,$03,$8E,$03,$92,$02,$97,$02;- D 0 - I - 0x005B5E 02:9B4E:
	.byte $F5,$02,$F6,$02,$C3,$00,$C2,$02,$F4,$42;- D 0 - I - 0x005B6E 02:9B5E:
frame_02_9B68:
	.byte $96,$B6,$C4,$00,$C5,$02,$C6,$02,$C7,$00,$C8,$02,$C9,$02,$CA,$03;- D 0 - I - 0x005B78 02:9B68:
	.byte $CB,$00,$CC,$02,$CD,$00,$CE,$02,$CF,$03,$D0,$02,$D3,$00,$D4,$02;- D 0 - I - 0x005B88 02:9B78:
	.byte $D7,$00,$D5,$02,$D8,$00,$D6,$02,$D1,$00,$D2,$02,$F9,$02,$FA,$02;- D 0 - I - 0x005B98 02:9B88:
frame_02_9B98:
	.byte $9A,$B7,$80,$00,$81,$00,$82,$00,$83,$00,$85,$02,$8A,$00,$86,$02;- D 0 - I - 0x005BA8 02:9B98:
	.byte $87,$02,$88,$02,$C0,$00,$C1,$02,$C2,$00,$C3,$03,$C4,$00,$C5,$00;- D 0 - I - 0x005BB8 02:9BA8:
	.byte $C6,$02,$C7,$02,$A5,$02,$A6,$02,$84,$02,$89,$03,$C8,$00,$A7,$00;- D 0 - I - 0x005BC8 02:9BB8:
	.byte $F2,$42,$F1,$42,$EF,$02,$F0,$02;- D 0 - I - 0x005BD8 02:9BC8:
frame_02_9BD0:
	.byte $99,$B8,$C9,$00,$CA,$00,$CB,$00,$CC,$02,$CD,$00,$CE,$02,$CF,$02;- D 0 - I - 0x005BE0 02:9BD0:
	.byte $D0,$00,$D1,$03,$D2,$03,$D3,$00,$D4,$02,$D6,$03,$D8,$02,$D7,$03;- D 0 - I - 0x005BF0 02:9BE0:
	.byte $D9,$02,$DA,$00,$DB,$02,$DC,$02,$DD,$02,$DE,$02,$D5,$02,$DF,$00;- D 0 - I - 0x005C00 02:9BF0:
	.byte $E0,$00,$F8,$42,$F7,$42   ;- D 0 - I - 0x005C10 02:9C00:
frame_02_9C06:
	.byte $91,$B9,$80,$00,$81,$00,$82,$00,$83,$02,$84,$02,$85,$03,$86,$02;- D 0 - I - 0x005C16 02:9C06:
	.byte $87,$02,$88,$03,$89,$00,$8A,$00,$8C,$02,$8B,$00,$8D,$02,$8E,$02;- D 0 - I - 0x005C26 02:9C16:
	.byte $8F,$02,$90,$00,$91,$00   ;- D 0 - I - 0x005C36 02:9C26:
frame_02_9C2C:
	.byte $95,$BA,$92,$00,$93,$02,$94,$00,$95,$00,$96,$02,$98,$00,$97,$02;- D 0 - I - 0x005C3C 02:9C2C:
	.byte $99,$03,$9A,$02,$9B,$02,$9C,$00,$9D,$02,$9F,$00,$9E,$02,$A0,$00;- D 0 - I - 0x005C4C 02:9C3C:
	.byte $A1,$03,$A2,$02,$A3,$02,$A4,$00,$A5,$02,$A6,$00,$A7,$00;- D 0 - I - 0x005C5C 02:9C4C:
frame_02_9C5A:
	.byte $91,$BB,$A8,$03,$A9,$02,$AA,$02,$AB,$00,$AC,$02,$AF,$02,$AE,$03;- D 0 - I - 0x005C6A 02:9C5A:
	.byte $B0,$02,$B1,$00,$B2,$02,$B3,$00,$B4,$02,$B5,$00,$B6,$03,$B8,$02;- D 0 - I - 0x005C7A 02:9C6A:
	.byte $B9,$00,$AD,$03,$B7,$02   ;- D 0 - I - 0x005C8A 02:9C7A:
frame_02_9C80:
	.byte $94,$BC,$D9,$00,$DA,$02,$DB,$02,$DC,$02,$DD,$00,$DE,$02,$DF,$02;- D 0 - I - 0x005C90 02:9C80:
	.byte $E0,$03,$E1,$00,$E2,$02,$E3,$00,$E4,$02,$E5,$02,$E6,$02,$E8,$00;- D 0 - I - 0x005CA0 02:9C90:
	.byte $E9,$00,$EA,$02,$EB,$02,$E7,$03,$EC,$00,$ED,$00;- D 0 - I - 0x005CB0 02:9CA0:
frame_02_9CAC:
	.byte $81,$BF,$EF,$02,$F0,$02   ;- D 0 - I - 0x005CBC 02:9CAC:
frame_02_9CB2:
	.byte $81,$C0,$F7,$02,$F8,$02   ;- D 0 - I - 0x005CC2 02:9CB2:
frame_02_9CB8:
	.byte $81,$C1,$F1,$02,$F2,$02   ;- D 0 - I - 0x005CC8 02:9CB8:
frame_02_9CBE:
	.byte $81,$C2,$FB,$02,$FC,$02   ;- D 0 - I - 0x005CCE 02:9CBE:
frame_02_9CC4:
	.byte $81,$BF,$F3,$02,$F4,$02   ;- D 0 - I - 0x005CD4 02:9CC4:
frame_02_9CCA:
	.byte $81,$C0,$F9,$02,$FA,$02   ;- D 0 - I - 0x005CDA 02:9CCA:
frame_02_9CD0:
	.byte $81,$C1,$F5,$02,$F6,$02   ;- D 0 - I - 0x005CE0 02:9CD0:
frame_02_9CD6:
	.byte $81,$C2,$FD,$02,$FE,$02   ;- D 0 - I - 0x005CE6 02:9CD6:
frame_02_9CDC:
	.byte $91,$BE,$8F,$C2,$8E,$C2,$8D,$C2,$8B,$C0,$8C,$C2,$8A,$C0,$89,$C0;- D 0 - I - 0x005CEC 02:9CDC:
	.byte $88,$C3,$87,$C2,$86,$C2,$85,$C3,$84,$C2,$83,$C2,$82,$C0,$81,$C0;- D 0 - I - 0x005CFC 02:9CEC:
	.byte $80,$C0,$91,$C0,$90,$C0   ;- D 0 - I - 0x005D0C 02:9CFC:
frame_02_9D02:
	.byte $97,$BD,$96,$82,$94,$80,$95,$80,$B9,$80,$BA,$82,$93,$80,$92,$82;- D 0 - I - 0x005D12 02:9D02:
	.byte $B8,$80,$8C,$82,$8F,$80,$8D,$83,$8A,$80,$86,$82,$87,$82,$88,$82;- D 0 - I - 0x005D22 02:9D12:
	.byte $89,$83,$82,$80,$83,$80,$85,$82,$80,$80,$81,$80,$97,$82,$8E,$83;- D 0 - I - 0x005D32 02:9D22:
	.byte $84,$82                   ;- D 0 - I - 0x005D42 02:9D32:
frame_02_9D34:
	.byte $91,$C3,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x005D44 02:9D34:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$00,$4C,$00,$4D,$02,$4E,$02;- D 0 - I - 0x005D54 02:9D44:
	.byte $50,$00,$4F,$02,$51,$00   ;- D 0 - I - 0x005D64 02:9D54:
frame_02_9D5A:
	.byte $92,$C4,$40,$00,$41,$00,$60,$00,$44,$00,$45,$00,$61,$00,$62,$00;- D 0 - I - 0x005D6A 02:9D5A:
	.byte $63,$00,$48,$00,$49,$00,$64,$00,$65,$00,$4B,$00,$4C,$00,$4D,$02;- D 0 - I - 0x005D7A 02:9D6A:
	.byte $4E,$02,$50,$00,$4F,$02,$51,$00;- D 0 - I - 0x005D8A 02:9D7A:
frame_02_9D82:
	.byte $92,$C5,$52,$00,$53,$00,$54,$00,$55,$00,$56,$00,$57,$00,$58,$00;- D 0 - I - 0x005D92 02:9D82:
	.byte $59,$00,$5A,$00,$5B,$00,$5C,$00,$5D,$00,$5E,$00,$5F,$00,$4D,$02;- D 0 - I - 0x005DA2 02:9D92:
	.byte $4E,$02,$50,$00,$4F,$02,$51,$00;- D 0 - I - 0x005DB2 02:9DA2:
frame_02_9DAA:
	.byte $92,$C6,$66,$00,$67,$00,$68,$00,$69,$00,$6A,$00,$6B,$00,$6C,$00;- D 0 - I - 0x005DBA 02:9DAA:
	.byte $6D,$00,$6E,$00,$6F,$00,$70,$00,$71,$00,$72,$00,$73,$00,$75,$02;- D 0 - I - 0x005DCA 02:9DBA:
	.byte $78,$02,$76,$00,$77,$00,$74,$02;- D 0 - I - 0x005DDA 02:9DCA:
frame_02_9DD2:
	.byte $8C,$47,$EA,$03,$EB,$03,$EC,$03,$ED,$03,$EE,$03,$EF,$03,$F0,$03;- D 0 - I - 0x005DE2 02:9DD2:
	.byte $F1,$03,$F2,$03,$F4,$00,$F3,$03,$E6,$03,$E7,$03;- D 0 - I - 0x005DF2 02:9DE2:
frame_02_9DEE:
	.byte $8A,$0E,$A9,$03,$AA,$03,$AB,$03,$AC,$00,$AD,$03,$AE,$03,$AF,$03;- D 0 - I - 0x005DFE 02:9DEE:
	.byte $B0,$00,$B1,$00,$B2,$00,$B3,$00;- D 0 - I - 0x005E0E 02:9DFE:
frame_02_9E06:
	.byte $09,$1B,$E1,$00,$E2,$00,$E3,$00,$E4,$00,$E5,$00,$E6,$00,$E7,$00;- D 0 - I - 0x005E16 02:9E06:
	.byte $E8,$00,$E9,$00,$EA,$03   ;- D 0 - I - 0x005E26 02:9E16:
frame_02_9E1C:
	.byte $09,$DD,$65,$00,$66,$00,$67,$00,$68,$00,$69,$00,$6A,$00,$6B,$02;- D 0 - I - 0x005E2C 02:9E1C:
	.byte $6C,$00,$6D,$02,$6E,$02   ;- D 0 - I - 0x005E3C 02:9E2C:
frame_02_9E32:
	.byte $09,$DF,$5B,$00,$5C,$00,$5D,$00,$5E,$00,$5F,$00,$60,$00,$61,$02;- D 0 - I - 0x005E42 02:9E32:
	.byte $62,$02,$63,$02,$64,$02   ;- D 0 - I - 0x005E52 02:9E42:
frame_02_9E48:
	.byte $09,$1D,$EB,$00,$EC,$00,$ED,$00,$EE,$00,$EF,$00,$F0,$00,$F1,$00;- D 0 - I - 0x005E58 02:9E48:
	.byte $F2,$00,$F3,$00,$F4,$00   ;- D 0 - I - 0x005E68 02:9E58:
frame_02_9E5E:
	.byte $91,$C9,$40,$00,$41,$00,$42,$00,$43,$00,$44,$00,$45,$00,$46,$00;- D 0 - I - 0x005E6E 02:9E5E:
	.byte $47,$00,$48,$00,$49,$00,$4A,$00,$4B,$02,$4C,$02,$4D,$00,$4E,$00;- D 0 - I - 0x005E7E 02:9E6E:
	.byte $4F,$00,$50,$02,$51,$00   ;- D 0 - I - 0x005E8E 02:9E7E:
frame_02_9E84:
	.byte $93,$CA,$40,$00,$41,$00,$42,$00,$45,$00,$46,$00,$48,$00,$49,$00;- D 0 - I - 0x005E94 02:9E84:
	.byte $4B,$02,$4C,$02,$4D,$00,$4F,$00,$50,$02,$51,$00,$52,$00,$53,$00;- D 0 - I - 0x005EA4 02:9E94:
	.byte $54,$00,$55,$00,$56,$00,$57,$00,$58,$00;- D 0 - I - 0x005EB4 02:9EA4:
frame_02_9EAE:
	.byte $94,$CB,$59,$00,$5A,$00,$5B,$00,$5C,$00,$5D,$00,$5E,$00,$5F,$00;- D 0 - I - 0x005EBE 02:9EAE:
	.byte $60,$00,$61,$00,$62,$00,$63,$00,$64,$00,$65,$00,$66,$00,$67,$00;- D 0 - I - 0x005ECE 02:9EBE:
	.byte $68,$00,$69,$02,$6A,$02,$6B,$00,$6D,$00,$6C,$00;- D 0 - I - 0x005EDE 02:9ECE:
frame_02_9EDA:
	.byte $93,$CC,$59,$00,$5A,$00,$5C,$00,$5D,$00,$61,$00,$64,$00,$65,$00;- D 0 - I - 0x005EEA 02:9EDA:
	.byte $66,$00,$67,$00,$68,$00,$69,$02,$6A,$02,$6B,$00,$6D,$00,$6C,$00;- D 0 - I - 0x005EFA 02:9EEA:
	.byte $60,$00,$6E,$00,$6F,$00,$70,$00,$71,$00;- D 0 - I - 0x005F0A 02:9EFA:
frame_02_9F04:
	.byte $10,$21,$A3,$00,$A4,$00,$A5,$00,$A6,$00,$A7,$03,$A8,$00,$A9,$00;- D 0 - I - 0x005F14 02:9F04:
	.byte $AA,$03,$AB,$03,$AF,$03,$AE,$00,$AC,$03,$AD,$03,$B0,$03,$B1,$03;- D 0 - I - 0x005F24 02:9F14:
	.byte $B2,$03,$B3,$03           ;- D 0 - I - 0x005F34 02:9F24:
frame_02_9F28:
	.byte $08,$D3,$B5,$03,$B6,$03,$B7,$03,$B8,$03,$B9,$00,$BA,$00,$BB,$03;- D 0 - I - 0x005F38 02:9F28:
	.byte $BC,$00,$BD,$00           ;- D 0 - I - 0x005F48 02:9F38:
frame_02_9F3C:
	.byte $17,$D1,$80,$00,$81,$00,$82,$00,$83,$02,$84,$02,$85,$02,$86,$02;- D 0 - I - 0x005F4C 02:9F3C:
	.byte $87,$00,$88,$03,$89,$03,$8A,$03,$8B,$02,$8C,$02,$8D,$00,$8E,$00;- D 0 - I - 0x005F5C 02:9F4C:
	.byte $8F,$00,$90,$02,$91,$02,$92,$02,$93,$02,$94,$00,$95,$00,$96,$02;- D 0 - I - 0x005F6C 02:9F5C:
	.byte $97,$02                   ;- D 0 - I - 0x005F7C 02:9F6C:
frame_02_9F6E:
	.byte $0B,$00,$98,$00,$99,$00,$9A,$00,$9B,$02,$9C,$00,$9D,$02,$9E,$00;- D 0 - I - 0x005F7E 02:9F6E:
	.byte $9F,$02,$A0,$00,$A1,$02,$A2,$02,$A3,$02;- D 0 - I - 0x005F8E 02:9F7E:
frame_02_9F88:
	.byte $0C,$31,$64,$02,$65,$02,$66,$00,$67,$00,$68,$02,$69,$02,$6A,$02;- D 0 - I - 0x005F98 02:9F88:
	.byte $6B,$00,$6C,$00,$6D,$02,$6E,$02,$6F,$02,$70,$02;- D 0 - I - 0x005FA8 02:9F98:
frame_02_9FA4:
	.byte $87,$08,$49,$00,$52,$45,$70,$81,$AE,$40,$FE,$10,$99,$00,$63,$14;- - - - - - 0x005FB4 02:9FA4:
	.byte $D9,$51,$10,$10,$00,$40,$40,$40,$1E,$44,$58,$00,$00,$40,$41,$42;- - - - - - 0x005FC4 02:9FB4:
	.byte $0C,$10,$00,$00,$B5,$00,$52,$40,$80,$75,$F4,$00,$30,$04,$08,$15;- - - - - - 0x005FD4 02:9FC4:
	.byte $00,$40,$C1,$00,$97,$41,$70,$00,$16,$50,$A8,$01,$01,$41,$99,$10;- - - - - - 0x005FE4 02:9FD4:
	.byte $8D,$45,$15,$15,$28,$05,$2D,$41,$8C,$11,$D7,$41,$41,$04,$08,$00;- - - - - - 0x005FF4 02:9FE4:
	.byte $10,$40,$80,$01,$23,$00,$05,$40,$8A,$04,$12,$00;- - - - - - 0x006004 02:9FF4:
