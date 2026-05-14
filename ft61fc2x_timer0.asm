//Deviec:FT61FC2X
//-----------------------Variable---------------------------------
		_PA2		EQU		05H
		_PA3		EQU		05H
		_PA4		EQU		05H
		_PA5		EQU		05H
		_PA6		EQU		05H
		_PA7		EQU		05H
		_PC0		EQU		07H
		_PC1		EQU		07H
		_PC2		EQU		07H
		_PC3		EQU		07H
		_PC4		EQU		07H
		_PC5		EQU		07H
		_PAIF		EQU		0BH
		_INTF		EQU		0BH
		_PAIE		EQU		0BH
		_INTE		EQU		0BH
		_PEIE		EQU		0BH
		_GIE		EQU		0BH
		_TMR2IF		EQU		0CH
		_TMR2ON		EQU		12H
		_SLVREN		EQU		1BH
		_INTEDG		EQU		81H
		_TMR2IE		EQU		8CH
		_LVDEN		EQU		8EH
		_RD		EQU		9CH
		_KEY.key_name		EQU		2FH
		_KEY.last_key_num		EQU		30H
		_KEY.key_num		EQU		31H
		_KEY.key_flag		EQU		32H
		_KEY.key_time		EQU		33H
		_KEY.key_one_row_flag		EQU		35H
		_KEY.key_two_row_flag		EQU		36H
		_KEY.key_three_row_flag		EQU		37H
		_KEY.key_col_num		EQU		38H
		_KEY.key_cnt		EQU		39H
		_KEY		EQU		2FH
		_DATA.function_key		EQU		3AH
		_DATA.data		EQU		3BH
		_DATA.byte_cnt		EQU		3FH
		_DATA		EQU		3AH
		_RF.level_cnt		EQU		20H
		_RF.rf_flag		EQU		21H
		_RF.code_cnt		EQU		22H
		_RF.code_key		EQU		23H
		_RF.code_finish_flag		EQU		24H
		_RF.RF_data		EQU		25H
		_RF.RF_bit		EQU		29H
		_RF.RF_bit_cnt		EQU		2DH
		_RF.RF_temporary_bit		EQU		2EH
		_RF		EQU		20H
		_LED.led_time		EQU		40H
		_LED.time_cnt		EQU		41H
		_LED.led_flag		EQU		43H
		_LED		EQU		40H
		_start_time		EQU		46H
		_start_flag		EQU		45H
		_power_sleep		EQU		48H
		_last_PORTA		EQU		47H
		_interrupt_delay		EQU		44H
		_Addrs_code_EEPROM		EQU		7DH
//		scanf_key@scan_row		EQU		7CH
//		write_key_function@Addr		EQU		76H
//		write_key_function@Addr		EQU		76H
//		write_key_function@key		EQU		75H
//		write_key_function@Addr		EQU		76H
//		write_bit@byte		EQU		71H
//		write_bit@byte		EQU		71H
//		write_bit@byte		EQU		71H
//		Addr_code@Addrs		EQU		72H
//		Addr_code@i		EQU		73H
//		Addr_code@Addrs		EQU		72H
//		Addr_code@Addrs		EQU		72H
//		EEPROMread@EEAddr		EQU		70H
//		EEPROMread@ReEEPROMread		EQU		71H
//		EEPROMread@EEAddr		EQU		70H
//		EEPROMread@EEAddr		EQU		70H
//-----------------------Variable END---------------------------------

		LJUMP 	10H 			//0000 	3810
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	78H 			//0006 	01F8
		LDR 	FSR,0 			//0007 	0804
		STR 	79H 			//0008 	01F9
		LDR 	PCLATH,0 		//0009 	080A
		STR 	7AH 			//000A 	01FA
		BCR 	STATUS,5 		//000B 	1283
		BCR 	STATUS,6 		//000C 	1303
		LDR 	7FH,0 			//000D 	087F
		STR 	7BH 			//000E 	01FB
		LJUMP 	248H 			//000F 	3A48
		LJUMP 	11H 			//0010 	3811
		LDWI 	1H 			//0011 	2A01
		STR 	48H 			//0012 	01C8
		STR 	7DH 			//0013 	01FD
		LDWI 	20H 			//0014 	2A20
		BCR 	STATUS,7 		//0015 	1383
		STR 	FSR 			//0016 	0184
		LDWI 	47H 			//0017 	2A47
		LCALL 	365H 			//0018 	3365
		CLRR 	7CH 			//0019 	017C
		CLRR 	STATUS 			//001A 	0103
		LJUMP 	31DH 			//001B 	3B1D

		//;FT61FC2x_Timer0.c: 520: static unsigned char scan_row = 0;
		//;FT61FC2x_Timer0.c: 527: PA5 = 0;
		BCR 	5H,5 			//001C 	1285

		//;FT61FC2x_Timer0.c: 528: PC0 = 0;
		BCR 	7H,0 			//001D 	1007

		//;FT61FC2x_Timer0.c: 529: PC4 = 0;
		BCR 	7H,4 			//001E 	1207

		//;FT61FC2x_Timer0.c: 532: if((PC1 == 0) || (PA7 == 0) || (PA2 == 0) || (PA3 == 0))
		BTSC 	7H,1 			//001F 	1487
		BTSS 	5H,7 			//0020 	1F85
		LJUMP 	26H 			//0021 	3826
		BTSS 	5H,2 			//0022 	1D05
		LJUMP 	26H 			//0023 	3826
		BTSC 	5H,3 			//0024 	1585
		LJUMP 	36H 			//0025 	3836

		//;FT61FC2x_Timer0.c: 533: {
		//;FT61FC2x_Timer0.c: 534: KEY.key_flag = 1;
		CLRR 	32H 			//0026 	0132
		INCR	32H,1 			//0027 	09B2

		//;FT61FC2x_Timer0.c: 536: if(PC1 == 0) KEY.key_col_num = 0x03;
		BTSC 	7H,1 			//0028 	1487
		LJUMP 	2CH 			//0029 	382C
		LDWI 	3H 			//002A 	2A03
		STR 	38H 			//002B 	01B8

		//;FT61FC2x_Timer0.c: 537: if(PA7 == 0) KEY.key_col_num = 0x02;
		BTSC 	5H,7 			//002C 	1785
		LJUMP 	30H 			//002D 	3830
		LDWI 	2H 			//002E 	2A02
		STR 	38H 			//002F 	01B8

		//;FT61FC2x_Timer0.c: 538: if(PA2 == 0) KEY.key_col_num = 0x01;
		BTSC 	5H,2 			//0030 	1505
		LJUMP 	34H 			//0031 	3834
		CLRR 	38H 			//0032 	0138
		INCR	38H,1 			//0033 	09B8

		//;FT61FC2x_Timer0.c: 539: if(PA3 == 0) KEY.key_col_num = 0x00;
		BTSS 	5H,3 			//0034 	1D85
		CLRR 	38H 			//0035 	0138

		//;FT61FC2x_Timer0.c: 540: }
		//;FT61FC2x_Timer0.c: 543: if(KEY.key_flag)
		LDR 	32H,0 			//0036 	0832
		BTSS 	STATUS,2 		//0037 	1D03
		LJUMP 	B4H 			//0038 	38B4
		LJUMP 	160H 			//0039 	3960

		//;FT61FC2x_Timer0.c: 547: {
		//;FT61FC2x_Timer0.c: 548: case 0:
		//;FT61FC2x_Timer0.c: 550: PC4 = 1;
		BSR 	7H,4 			//003A 	1A07

		//;FT61FC2x_Timer0.c: 551: if(KEY.key_col_num == 0x00)
		LDR 	38H,0 			//003B 	0838
		BTSS 	STATUS,2 		//003C 	1D03
		LJUMP 	41H 			//003D 	3841

		//;FT61FC2x_Timer0.c: 552: {
		//;FT61FC2x_Timer0.c: 553: if(PA3 == 1)
		BTSC 	5H,3 			//003E 	1585
		LJUMP 	52H 			//003F 	3852
		LJUMP 	55H 			//0040 	3855

		//;FT61FC2x_Timer0.c: 560: else if(KEY.key_col_num == 0x01)
		DECRSZ 	38H,0 		//0041 	0E38
		LJUMP 	46H 			//0042 	3846

		//;FT61FC2x_Timer0.c: 561: {
		//;FT61FC2x_Timer0.c: 562: if(PA2 == 1)
		BTSC 	5H,2 			//0043 	1505
		LJUMP 	52H 			//0044 	3852
		LJUMP 	55H 			//0045 	3855

		//;FT61FC2x_Timer0.c: 568: else if(KEY.key_col_num == 0x02)
		LDWI 	2H 			//0046 	2A02
		XORWR 	38H,0 			//0047 	0438
		BTSS 	STATUS,2 		//0048 	1D03
		LJUMP 	4DH 			//0049 	384D

		//;FT61FC2x_Timer0.c: 569: {
		//;FT61FC2x_Timer0.c: 570: if(PA7 == 1)
		BTSC 	5H,7 			//004A 	1785
		LJUMP 	52H 			//004B 	3852
		LJUMP 	55H 			//004C 	3855

		//;FT61FC2x_Timer0.c: 576: else if(KEY.key_col_num == 0x03)
		LDWI 	3H 			//004D 	2A03
		XORWR 	38H,0 			//004E 	0438
		BTSC 	STATUS,2 		//004F 	1503

		//;FT61FC2x_Timer0.c: 577: {
		//;FT61FC2x_Timer0.c: 578: if(PC1 == 1)
		BTSS 	7H,1 			//0050 	1C87
		LJUMP 	55H 			//0051 	3855

		//;FT61FC2x_Timer0.c: 554: {
		//;FT61FC2x_Timer0.c: 556: KEY.key_num = (0x04 * scan_row) + KEY.key_col_num + 1;
		LCALL 	16FH 			//0052 	316F

		//;FT61FC2x_Timer0.c: 557: KEY.key_one_row_flag = 1;
		CLRR 	35H 			//0053 	0135
		INCR	35H,1 			//0054 	09B5

		//;FT61FC2x_Timer0.c: 582: }
		//;FT61FC2x_Timer0.c: 583: }
		//;FT61FC2x_Timer0.c: 584: PC4 = 0;
		BCR 	7H,4 			//0055 	1207

		//;FT61FC2x_Timer0.c: 585: break;
		LJUMP 	BFH 			//0056 	38BF

		//;FT61FC2x_Timer0.c: 587: case 1:
		//;FT61FC2x_Timer0.c: 589: PC0 = 1;
		BSR 	7H,0 			//0057 	1807

		//;FT61FC2x_Timer0.c: 590: if(KEY.key_col_num == 0x00)
		LDR 	38H,0 			//0058 	0838
		BTSS 	STATUS,2 		//0059 	1D03
		LJUMP 	5EH 			//005A 	385E

		//;FT61FC2x_Timer0.c: 591: {
		//;FT61FC2x_Timer0.c: 592: if(PA3 == 1)
		BTSC 	5H,3 			//005B 	1585
		LJUMP 	6FH 			//005C 	386F
		LJUMP 	72H 			//005D 	3872

		//;FT61FC2x_Timer0.c: 598: else if(KEY.key_col_num == 0x01)
		DECRSZ 	38H,0 		//005E 	0E38
		LJUMP 	63H 			//005F 	3863

		//;FT61FC2x_Timer0.c: 599: {
		//;FT61FC2x_Timer0.c: 600: if(PA2 == 1)
		BTSC 	5H,2 			//0060 	1505
		LJUMP 	6FH 			//0061 	386F
		LJUMP 	72H 			//0062 	3872

		//;FT61FC2x_Timer0.c: 606: else if(KEY.key_col_num == 0x02)
		LDWI 	2H 			//0063 	2A02
		XORWR 	38H,0 			//0064 	0438
		BTSS 	STATUS,2 		//0065 	1D03
		LJUMP 	6AH 			//0066 	386A

		//;FT61FC2x_Timer0.c: 607: {
		//;FT61FC2x_Timer0.c: 608: if(PA7 == 1)
		BTSC 	5H,7 			//0067 	1785
		LJUMP 	6FH 			//0068 	386F
		LJUMP 	72H 			//0069 	3872

		//;FT61FC2x_Timer0.c: 614: else if(KEY.key_col_num == 0x03)
		LDWI 	3H 			//006A 	2A03
		XORWR 	38H,0 			//006B 	0438
		BTSC 	STATUS,2 		//006C 	1503

		//;FT61FC2x_Timer0.c: 615: {
		//;FT61FC2x_Timer0.c: 616: if(PC1 == 1)
		BTSS 	7H,1 			//006D 	1C87
		LJUMP 	72H 			//006E 	3872

		//;FT61FC2x_Timer0.c: 593: {
		//;FT61FC2x_Timer0.c: 594: KEY.key_num = (0x04 * scan_row) + KEY.key_col_num + 1;
		LCALL 	16FH 			//006F 	316F

		//;FT61FC2x_Timer0.c: 595: KEY.key_two_row_flag = 1;
		CLRR 	36H 			//0070 	0136
		INCR	36H,1 			//0071 	09B6

		//;FT61FC2x_Timer0.c: 620: }
		//;FT61FC2x_Timer0.c: 621: }
		//;FT61FC2x_Timer0.c: 622: PC0 = 0;
		BCR 	7H,0 			//0072 	1007

		//;FT61FC2x_Timer0.c: 623: break;
		LJUMP 	BFH 			//0073 	38BF

		//;FT61FC2x_Timer0.c: 625: case 2:
		//;FT61FC2x_Timer0.c: 627: PA5 = 1;
		BSR 	5H,5 			//0074 	1A85

		//;FT61FC2x_Timer0.c: 628: if(KEY.key_col_num == 0x00)
		LDR 	38H,0 			//0075 	0838
		BTSS 	STATUS,2 		//0076 	1D03
		LJUMP 	7BH 			//0077 	387B

		//;FT61FC2x_Timer0.c: 629: {
		//;FT61FC2x_Timer0.c: 630: if(PA3 == 1)
		BTSC 	5H,3 			//0078 	1585
		LJUMP 	8CH 			//0079 	388C
		LJUMP 	8FH 			//007A 	388F

		//;FT61FC2x_Timer0.c: 636: else if(KEY.key_col_num == 0x01)
		DECRSZ 	38H,0 		//007B 	0E38
		LJUMP 	80H 			//007C 	3880

		//;FT61FC2x_Timer0.c: 637: {
		//;FT61FC2x_Timer0.c: 638: if(PA2 == 1)
		BTSC 	5H,2 			//007D 	1505
		LJUMP 	8CH 			//007E 	388C
		LJUMP 	8FH 			//007F 	388F

		//;FT61FC2x_Timer0.c: 644: else if(KEY.key_col_num == 0x02)
		LDWI 	2H 			//0080 	2A02
		XORWR 	38H,0 			//0081 	0438
		BTSS 	STATUS,2 		//0082 	1D03
		LJUMP 	87H 			//0083 	3887

		//;FT61FC2x_Timer0.c: 645: {
		//;FT61FC2x_Timer0.c: 646: if(PA7 == 1)
		BTSC 	5H,7 			//0084 	1785
		LJUMP 	8CH 			//0085 	388C
		LJUMP 	8FH 			//0086 	388F

		//;FT61FC2x_Timer0.c: 652: else if(KEY.key_col_num == 0x03)
		LDWI 	3H 			//0087 	2A03
		XORWR 	38H,0 			//0088 	0438
		BTSC 	STATUS,2 		//0089 	1503

		//;FT61FC2x_Timer0.c: 653: {
		//;FT61FC2x_Timer0.c: 654: if(PC1 == 1)
		BTSS 	7H,1 			//008A 	1C87
		LJUMP 	8FH 			//008B 	388F

		//;FT61FC2x_Timer0.c: 631: {
		//;FT61FC2x_Timer0.c: 632: KEY.key_num = (0x04 * scan_row) + KEY.key_col_num + 1;
		LCALL 	16FH 			//008C 	316F

		//;FT61FC2x_Timer0.c: 633: KEY.key_three_row_flag = 1;
		CLRR 	37H 			//008D 	0137
		INCR	37H,1 			//008E 	09B7

		//;FT61FC2x_Timer0.c: 658: }
		//;FT61FC2x_Timer0.c: 659: }
		//;FT61FC2x_Timer0.c: 660: PA5 = 0;
		BCR 	5H,5 			//008F 	1285

		//;FT61FC2x_Timer0.c: 661: break;
		LJUMP 	BFH 			//0090 	38BF

		//;FT61FC2x_Timer0.c: 666: if((KEY.key_one_row_flag == 0) && (KEY.key_two_row_flag == 0) &
		//+                          & (KEY.key_three_row_flag == 0))
		LDR 	35H,0 			//0091 	0835
		BTSS 	STATUS,2 		//0092 	1D03
		LJUMP 	BFH 			//0093 	38BF
		LDR 	36H,0 			//0094 	0836
		BTSS 	STATUS,2 		//0095 	1D03
		LJUMP 	BFH 			//0096 	38BF
		LDR 	37H,0 			//0097 	0837
		BTSS 	STATUS,2 		//0098 	1D03
		LJUMP 	BFH 			//0099 	38BF

		//;FT61FC2x_Timer0.c: 667: {
		//;FT61FC2x_Timer0.c: 668: if(KEY.key_col_num == 0x00)
		LDR 	38H,0 			//009A 	0838
		BTSS 	STATUS,2 		//009B 	1D03
		LJUMP 	A1H 			//009C 	38A1

		//;FT61FC2x_Timer0.c: 669: {
		//;FT61FC2x_Timer0.c: 670: if(PA3 == 0)KEY.key_num = (0x04 * scan_row) + KEY.key_col_num +
		//+                           1;
		BTSC 	5H,3 			//009D 	1585
		LJUMP 	BFH 			//009E 	38BF
		LCALL 	16FH 			//009F 	316F
		LJUMP 	BFH 			//00A0 	38BF

		//;FT61FC2x_Timer0.c: 672: else if(KEY.key_col_num == 0x01)
		DECRSZ 	38H,0 		//00A1 	0E38
		LJUMP 	A6H 			//00A2 	38A6

		//;FT61FC2x_Timer0.c: 673: {
		//;FT61FC2x_Timer0.c: 674: if(PA2 == 0)KEY.key_num = (0x04 * scan_row) + KEY.key_col_num +
		//+                           1;
		BTSS 	5H,2 			//00A3 	1D05
		LJUMP 	9FH 			//00A4 	389F
		LJUMP 	BFH 			//00A5 	38BF

		//;FT61FC2x_Timer0.c: 676: else if(KEY.key_col_num == 0x02)
		LDWI 	2H 			//00A6 	2A02
		XORWR 	38H,0 			//00A7 	0438
		BTSS 	STATUS,2 		//00A8 	1D03
		LJUMP 	ADH 			//00A9 	38AD

		//;FT61FC2x_Timer0.c: 677: {
		//;FT61FC2x_Timer0.c: 678: if(PA7 == 0)KEY.key_num = (0x04 * scan_row) + KEY.key_col_num +
		//+                           1;
		BTSS 	5H,7 			//00AA 	1F85
		LJUMP 	9FH 			//00AB 	389F
		LJUMP 	BFH 			//00AC 	38BF

		//;FT61FC2x_Timer0.c: 680: else if(KEY.key_col_num == 0x03)
		LDWI 	3H 			//00AD 	2A03
		XORWR 	38H,0 			//00AE 	0438
		BTSS 	STATUS,2 		//00AF 	1D03
		LJUMP 	BFH 			//00B0 	38BF

		//;FT61FC2x_Timer0.c: 681: {
		//;FT61FC2x_Timer0.c: 682: if(PC1 == 0)KEY.key_num = (0x04 * scan_row) + KEY.key_col_num +
		//+                           1;
		BTSS 	7H,1 			//00B1 	1C87
		LJUMP 	9FH 			//00B2 	389F
		LJUMP 	BFH 			//00B3 	38BF

		//;FT61FC2x_Timer0.c: 683: }
		//;FT61FC2x_Timer0.c: 684: break;
		LDR 	7CH,0 			//00B4 	087C
		STR 	FSR 			//00B5 	0184
		LDWI 	4H 			//00B6 	2A04
		SUBWR 	FSR,0 			//00B7 	0C04
		BTSC 	STATUS,0 		//00B8 	1403
		LJUMP 	BFH 			//00B9 	38BF
		LDWI 	3H 			//00BA 	2A03
		STR 	PCLATH 			//00BB 	018A
		LDWI 	7BH 			//00BC 	2A7B
		ADDWR 	FSR,0 			//00BD 	0B04
		STR 	PCL 			//00BE 	0182
		LDWI 	4H 			//00BF 	2A04

		//;FT61FC2x_Timer0.c: 691: scan_row++;
		INCR	7CH,1 			//00C0 	09FC

		//;FT61FC2x_Timer0.c: 692: if(scan_row >= 0x04) scan_row = 0;
		SUBWR 	7CH,0 			//00C1 	0C7C
		BTSC 	STATUS,0 		//00C2 	1403
		CLRR 	7CH 			//00C3 	017C

		//;FT61FC2x_Timer0.c: 694: KEY.key_time++;
		INCR	33H,1 			//00C4 	09B3
		BTSC 	STATUS,2 		//00C5 	1503
		INCR	34H,1 			//00C6 	09B4

		//;FT61FC2x_Timer0.c: 696: if(KEY.key_time == 45)
		LDWI 	2DH 			//00C7 	2A2D
		XORWR 	33H,0 			//00C8 	0433
		IORWR 	34H,0 			//00C9 	0334
		BTSS 	STATUS,2 		//00CA 	1D03
		LJUMP 	CEH 			//00CB 	38CE

		//;FT61FC2x_Timer0.c: 697: {
		//;FT61FC2x_Timer0.c: 698: KEY.last_key_num = KEY.key_num;
		LDR 	31H,0 			//00CC 	0831
		STR 	30H 			//00CD 	01B0

		//;FT61FC2x_Timer0.c: 699: }
		//;FT61FC2x_Timer0.c: 701: if(KEY.key_time == 100)
		LDWI 	64H 			//00CE 	2A64
		XORWR 	33H,0 			//00CF 	0433
		IORWR 	34H,0 			//00D0 	0334
		BTSS 	STATUS,2 		//00D1 	1D03
		LJUMP 	160H 			//00D2 	3960

		//;FT61FC2x_Timer0.c: 702: {
		//;FT61FC2x_Timer0.c: 703: if(KEY.last_key_num == KEY.key_num)
		LDR 	30H,0 			//00D3 	0830
		XORWR 	31H,0 			//00D4 	0431
		BTSS 	STATUS,2 		//00D5 	1D03
		LJUMP 	FBH 			//00D6 	38FB

		//;FT61FC2x_Timer0.c: 704: {
		//;FT61FC2x_Timer0.c: 705: KEY.key_cnt++;
		INCR	39H,1 			//00D7 	09B9

		//;FT61FC2x_Timer0.c: 707: switch(KEY.key_num)
		LJUMP 	EDH 			//00D8 	38ED

		//;FT61FC2x_Timer0.c: 708: {
		//;FT61FC2x_Timer0.c: 709: case 1:
		//;FT61FC2x_Timer0.c: 710: KEY.key_name = 1;
		CLRR 	2FH 			//00D9 	012F
		INCR	2FH,1 			//00DA 	09AF

		//;FT61FC2x_Timer0.c: 711: break;
		LJUMP 	FBH 			//00DB 	38FB

		//;FT61FC2x_Timer0.c: 714: KEY.key_name = 2;
		LDWI 	2H 			//00DC 	2A02
		LJUMP 	EBH 			//00DD 	38EB

		//;FT61FC2x_Timer0.c: 715: break;
		//;FT61FC2x_Timer0.c: 718: KEY.key_name = 3;
		LDWI 	3H 			//00DE 	2A03
		LJUMP 	EBH 			//00DF 	38EB

		//;FT61FC2x_Timer0.c: 719: break;
		//;FT61FC2x_Timer0.c: 722: KEY.key_name = 4;
		LDWI 	4H 			//00E0 	2A04
		LJUMP 	EBH 			//00E1 	38EB

		//;FT61FC2x_Timer0.c: 723: break;
		//;FT61FC2x_Timer0.c: 726: KEY.key_name = 5;
		LDWI 	5H 			//00E2 	2A05
		LJUMP 	EBH 			//00E3 	38EB

		//;FT61FC2x_Timer0.c: 727: break;
		//;FT61FC2x_Timer0.c: 730: KEY.key_name = 6;
		LDWI 	6H 			//00E4 	2A06
		LJUMP 	EBH 			//00E5 	38EB

		//;FT61FC2x_Timer0.c: 731: break;
		//;FT61FC2x_Timer0.c: 734: KEY.key_name = 7;
		LDWI 	7H 			//00E6 	2A07
		LJUMP 	EBH 			//00E7 	38EB

		//;FT61FC2x_Timer0.c: 735: break;
		//;FT61FC2x_Timer0.c: 738: KEY.key_name = 8;
		LDWI 	8H 			//00E8 	2A08
		LJUMP 	EBH 			//00E9 	38EB

		//;FT61FC2x_Timer0.c: 739: break;
		//;FT61FC2x_Timer0.c: 742: KEY.key_name = 9;
		LDWI 	9H 			//00EA 	2A09
		STR 	2FH 			//00EB 	01AF

		//;FT61FC2x_Timer0.c: 743: break;
		LJUMP 	FBH 			//00EC 	38FB
		LDR 	31H,0 			//00ED 	0831
		ADDWI 	FFH 			//00EE 	27FF
		BTSS 	STATUS,0 		//00EF 	1C03
		LJUMP 	FBH 			//00F0 	38FB
		STR 	FSR 			//00F1 	0184
		LDWI 	10H 			//00F2 	2A10
		SUBWR 	FSR,0 			//00F3 	0C04
		BTSC 	STATUS,0 		//00F4 	1403
		LJUMP 	FBH 			//00F5 	38FB
		LDWI 	3H 			//00F6 	2A03
		STR 	PCLATH 			//00F7 	018A
		LDWI 	47H 			//00F8 	2A47
		ADDWR 	FSR,0 			//00F9 	0B04
		STR 	PCL 			//00FA 	0182

		//;FT61FC2x_Timer0.c: 773: }
		//;FT61FC2x_Timer0.c: 775: KEY.key_flag = 0;
		CLRR 	32H 			//00FB 	0132

		//;FT61FC2x_Timer0.c: 776: KEY.key_time = 0;
		CLRR 	33H 			//00FC 	0133
		CLRR 	34H 			//00FD 	0134

		//;FT61FC2x_Timer0.c: 778: KEY.last_key_num = 0;
		CLRR 	30H 			//00FE 	0130

		//;FT61FC2x_Timer0.c: 779: KEY.key_num = 0;
		CLRR 	31H 			//00FF 	0131

		//;FT61FC2x_Timer0.c: 781: KEY.key_one_row_flag = 0;
		CLRR 	35H 			//0100 	0135

		//;FT61FC2x_Timer0.c: 782: KEY.key_two_row_flag = 0;
		CLRR 	36H 			//0101 	0136

		//;FT61FC2x_Timer0.c: 783: KEY.key_three_row_flag = 0;
		CLRR 	37H 			//0102 	0137

		//;FT61FC2x_Timer0.c: 786: INTF = 0;
		BCR 	INTCON,1 		//0103 	108B

		//;FT61FC2x_Timer0.c: 787: PAIF = 0;
		BCR 	INTCON,0 		//0104 	100B
		LJUMP 	160H 			//0105 	3960

		//;FT61FC2x_Timer0.c: 796: if(DATA.function_key)
		LDR 	3AH,0 			//0106 	083A
		BTSC 	STATUS,2 		//0107 	1503
		LJUMP 	10DH 			//0108 	390D

		//;FT61FC2x_Timer0.c: 797: {
		//;FT61FC2x_Timer0.c: 798: write_key_function(Addrs_code_EEPROM,KEY.key_name);
		LDR 	2FH,0 			//0109 	082F
		STR 	75H 			//010A 	01F5
		LDR 	7DH,0 			//010B 	087D
		LCALL 	27EH 			//010C 	327E

		//;FT61FC2x_Timer0.c: 799: }
		//;FT61FC2x_Timer0.c: 800: if(LED.led_flag ^ 1)LED.led_flag ^= 1;
		LDR 	43H,0 			//010D 	0843
		XORWI 	1H 			//010E 	2601
		BTSC 	STATUS,2 		//010F 	1503
		LJUMP 	113H 			//0110 	3913
		LDWI 	1H 			//0111 	2A01
		XORWR 	43H,1 			//0112 	04C3

		//;FT61FC2x_Timer0.c: 801: if(KEY.key_cnt > 1)
		LDWI 	2H 			//0113 	2A02
		SUBWR 	39H,0 			//0114 	0C39
		BTSS 	STATUS,0 		//0115 	1C03
		LJUMP 	11AH 			//0116 	391A

		//;FT61FC2x_Timer0.c: 802: {
		//;FT61FC2x_Timer0.c: 803: LED.led_time = 0;
		CLRR 	40H 			//0117 	0140

		//;FT61FC2x_Timer0.c: 804: LED.time_cnt = 0;
		CLRR 	41H 			//0118 	0141
		CLRR 	42H 			//0119 	0142

		//;FT61FC2x_Timer0.c: 805: }
		//;FT61FC2x_Timer0.c: 806: if(RF.code_finish_flag == 1)
		DECRSZ 	24H,0 		//011A 	0E24
		RET		 					//011B 	0004

		//;FT61FC2x_Timer0.c: 807: {
		//;FT61FC2x_Timer0.c: 809: KEY.key_name = 0;
		CLRR 	2FH 			//011C 	012F

		//;FT61FC2x_Timer0.c: 810: KEY.key_cnt = 0;
		CLRR 	39H 			//011D 	0139
		RET		 					//011E 	0004

		//;FT61FC2x_Timer0.c: 815: if(DATA.function_key)
		LDR 	3AH,0 			//011F 	083A
		BTSC 	STATUS,2 		//0120 	1503
		LJUMP 	126H 			//0121 	3926

		//;FT61FC2x_Timer0.c: 816: {
		//;FT61FC2x_Timer0.c: 817: write_key_function(Addrs_code_EEPROM,KEY.key_name);
		LDR 	2FH,0 			//0122 	082F
		STR 	75H 			//0123 	01F5
		LDR 	7DH,0 			//0124 	087D
		LCALL 	27EH 			//0125 	327E

		//;FT61FC2x_Timer0.c: 818: }
		//;FT61FC2x_Timer0.c: 819: if(LED.led_flag ^ 2)LED.led_flag ^= 2;
		LDR 	43H,0 			//0126 	0843
		XORWI 	2H 			//0127 	2602
		LDWI 	2H 			//0128 	2A02
		BTSC 	STATUS,2 		//0129 	1503
		LJUMP 	114H 			//012A 	3914
		LJUMP 	112H 			//012B 	3912

		//;FT61FC2x_Timer0.c: 824: }
		//;FT61FC2x_Timer0.c: 825: if(RF.code_finish_flag == 1)
		//;FT61FC2x_Timer0.c: 823: LED.time_cnt = 0;
		//;FT61FC2x_Timer0.c: 821: {
		//;FT61FC2x_Timer0.c: 822: LED.led_time = 0;
		//;FT61FC2x_Timer0.c: 820: if(KEY.key_cnt > 1)
		//;FT61FC2x_Timer0.c: 834: if(DATA.function_key)
		LDR 	3AH,0 			//012C 	083A
		BTSC 	STATUS,2 		//012D 	1503
		LJUMP 	133H 			//012E 	3933

		//;FT61FC2x_Timer0.c: 835: {
		//;FT61FC2x_Timer0.c: 836: write_key_function(Addrs_code_EEPROM,KEY.key_name);
		LDR 	2FH,0 			//012F 	082F
		STR 	75H 			//0130 	01F5
		LDR 	7DH,0 			//0131 	087D
		LCALL 	27EH 			//0132 	327E

		//;FT61FC2x_Timer0.c: 837: }
		//;FT61FC2x_Timer0.c: 838: if(LED.led_flag ^ 4)LED.led_flag ^= 4;
		LDR 	43H,0 			//0133 	0843
		XORWI 	4H 			//0134 	2604
		BTSC 	STATUS,2 		//0135 	1503
		LJUMP 	113H 			//0136 	3913
		LDWI 	4H 			//0137 	2A04
		LJUMP 	112H 			//0138 	3912

		//;FT61FC2x_Timer0.c: 843: }
		//;FT61FC2x_Timer0.c: 844: if(RF.code_finish_flag == 1)
		//;FT61FC2x_Timer0.c: 842: LED.time_cnt = 0;
		//;FT61FC2x_Timer0.c: 840: {
		//;FT61FC2x_Timer0.c: 841: LED.led_time = 0;
		//;FT61FC2x_Timer0.c: 839: if(KEY.key_cnt > 1)
		//;FT61FC2x_Timer0.c: 853: if(DATA.function_key)
		LDR 	3AH,0 			//0139 	083A
		BTSC 	STATUS,2 		//013A 	1503
		LJUMP 	140H 			//013B 	3940

		//;FT61FC2x_Timer0.c: 854: {
		//;FT61FC2x_Timer0.c: 855: write_key_function(Addrs_code_EEPROM,KEY.key_name);
		LDR 	2FH,0 			//013C 	082F
		STR 	75H 			//013D 	01F5
		LDR 	7DH,0 			//013E 	087D
		LCALL 	27EH 			//013F 	327E

		//;FT61FC2x_Timer0.c: 856: }
		//;FT61FC2x_Timer0.c: 857: if(LED.led_flag ^ 8)LED.led_flag ^= 8;
		LDR 	43H,0 			//0140 	0843
		XORWI 	8H 			//0141 	2608
		BTSC 	STATUS,2 		//0142 	1503
		LJUMP 	113H 			//0143 	3913
		LDWI 	8H 			//0144 	2A08
		LJUMP 	112H 			//0145 	3912

		//;FT61FC2x_Timer0.c: 862: }
		//;FT61FC2x_Timer0.c: 863: if(RF.code_finish_flag == 1)
		//;FT61FC2x_Timer0.c: 861: LED.time_cnt = 0;
		//;FT61FC2x_Timer0.c: 859: {
		//;FT61FC2x_Timer0.c: 860: LED.led_time = 0;
		//;FT61FC2x_Timer0.c: 858: if(KEY.key_cnt > 1)
		//;FT61FC2x_Timer0.c: 872: if(DATA.function_key)
		LDR 	3AH,0 			//0146 	083A
		BTSC 	STATUS,2 		//0147 	1503
		LJUMP 	14DH 			//0148 	394D

		//;FT61FC2x_Timer0.c: 873: {
		//;FT61FC2x_Timer0.c: 874: write_key_function(Addrs_code_EEPROM,KEY.key_name);
		LDR 	2FH,0 			//0149 	082F
		STR 	75H 			//014A 	01F5
		LDR 	7DH,0 			//014B 	087D
		LCALL 	27EH 			//014C 	327E

		//;FT61FC2x_Timer0.c: 875: }
		//;FT61FC2x_Timer0.c: 876: if(LED.led_flag ^ 16)LED.led_flag ^= 16;
		LDR 	43H,0 			//014D 	0843
		XORWI 	10H 			//014E 	2610
		BTSC 	STATUS,2 		//014F 	1503
		LJUMP 	113H 			//0150 	3913
		LDWI 	10H 			//0151 	2A10
		LJUMP 	112H 			//0152 	3912

		//;FT61FC2x_Timer0.c: 881: }
		//;FT61FC2x_Timer0.c: 882: if(RF.code_finish_flag == 1)
		//;FT61FC2x_Timer0.c: 880: LED.time_cnt = 0;
		//;FT61FC2x_Timer0.c: 878: {
		//;FT61FC2x_Timer0.c: 879: LED.led_time = 0;
		//;FT61FC2x_Timer0.c: 877: if(KEY.key_cnt > 1)
		//;FT61FC2x_Timer0.c: 891: if(DATA.function_key)
		LDR 	3AH,0 			//0153 	083A
		BTSC 	STATUS,2 		//0154 	1503
		LJUMP 	15AH 			//0155 	395A

		//;FT61FC2x_Timer0.c: 892: {
		//;FT61FC2x_Timer0.c: 893: write_key_function(Addrs_code_EEPROM,KEY.key_name);
		LDR 	2FH,0 			//0156 	082F
		STR 	75H 			//0157 	01F5
		LDR 	7DH,0 			//0158 	087D
		LCALL 	27EH 			//0159 	327E

		//;FT61FC2x_Timer0.c: 894: }
		//;FT61FC2x_Timer0.c: 895: if(LED.led_flag ^ 32)LED.led_flag ^= 32;
		LDR 	43H,0 			//015A 	0843
		XORWI 	20H 			//015B 	2620
		BTSC 	STATUS,2 		//015C 	1503
		LJUMP 	113H 			//015D 	3913
		LDWI 	20H 			//015E 	2A20
		LJUMP 	112H 			//015F 	3912

		//;FT61FC2x_Timer0.c: 900: }
		//;FT61FC2x_Timer0.c: 901: if(RF.code_finish_flag == 1)
		//;FT61FC2x_Timer0.c: 899: LED.time_cnt = 0;
		//;FT61FC2x_Timer0.c: 897: {
		//;FT61FC2x_Timer0.c: 898: LED.led_time = 0;
		//;FT61FC2x_Timer0.c: 896: if(KEY.key_cnt > 1)
		LDR 	2FH,0 			//0160 	082F
		ADDWI 	FFH 			//0161 	27FF
		BTSS 	STATUS,0 		//0162 	1C03
		RET		 					//0163 	0004
		STR 	FSR 			//0164 	0184
		LDWI 	6H 			//0165 	2A06
		SUBWR 	FSR,0 			//0166 	0C04
		BTSC 	STATUS,0 		//0167 	1403
		RET		 					//0168 	0004
		LDWI 	3H 			//0169 	2A03
		STR 	PCLATH 			//016A 	018A
		LDWI 	75H 			//016B 	2A75
		ADDWR 	FSR,0 			//016C 	0B04
		STR 	PCL 			//016D 	0182
		RET		 					//016E 	0004
		LDR 	7CH,0 			//016F 	087C
		STR 	77H 			//0170 	01F7
		BCR 	STATUS,0 		//0171 	1003
		RLR 	77H,1 			//0172 	05F7
		BCR 	STATUS,0 		//0173 	1003
		RLR 	77H,1 			//0174 	05F7
		LDR 	38H,0 			//0175 	0838
		ADDWR 	77H,0 			//0176 	0B77
		ADDWI 	1H 			//0177 	2701
		STR 	31H 			//0178 	01B1
		RET		 					//0179 	0004

		//;FT61FC2x_Timer0.c: 402: if(RF.RF_bit_cnt == 24)
		LDWI 	18H 			//017A 	2A18
		XORWR 	2DH,0 			//017B 	042D
		BTSS 	STATUS,2 		//017C 	1D03
		LJUMP 	18DH 			//017D 	398D
		LDWI 	25H 			//017E 	2A25

		//;FT61FC2x_Timer0.c: 403: {
		//;FT61FC2x_Timer0.c: 404: RF.rf_flag = 0;
		CLRR 	21H 			//017F 	0121

		//;FT61FC2x_Timer0.c: 405: RF.RF_data = 0;
		STR 	FSR 			//0180 	0184
		LDWI 	29H 			//0181 	2A29
		BCR 	STATUS,7 		//0182 	1383
		CLRR 	INDF 			//0183 	0100
		INCR	FSR,1 			//0184 	0984
		LCALL 	1DBH 			//0185 	31DB

		//;FT61FC2x_Timer0.c: 406: RF.RF_bit = 0;
		STR 	FSR 			//0186 	0184
		LCALL 	1DBH 			//0187 	31DB
		INCR	FSR,1 			//0188 	0984
		CLRR 	INDF 			//0189 	0100

		//;FT61FC2x_Timer0.c: 407: RF.RF_bit_cnt = 0;
		CLRR 	2DH 			//018A 	012D

		//;FT61FC2x_Timer0.c: 408: if(PA6 != 0)PA6 = 0;
		BTSC 	5H,6 			//018B 	1705
		BCR 	5H,6 			//018C 	1305

		//;FT61FC2x_Timer0.c: 409: }
		//;FT61FC2x_Timer0.c: 411: if(RF.rf_flag == 1)
		DECRSZ 	21H,0 		//018D 	0E21
		RET		 					//018E 	0004

		//;FT61FC2x_Timer0.c: 412: {
		//;FT61FC2x_Timer0.c: 413: if(RF.level_cnt == 0)
		LDR 	20H,0 			//018F 	0820
		BTSS 	STATUS,2 		//0190 	1D03
		LJUMP 	1AEH 			//0191 	39AE

		//;FT61FC2x_Timer0.c: 414: {
		//;FT61FC2x_Timer0.c: 415: RF.RF_temporary_bit = (RF.RF_data & RF.RF_bit) ? 1:0;
		LDWI 	5H 			//0192 	2A05
		ADDWI 	20H 			//0193 	2720
		STR 	FSR 			//0194 	0184
		LDR 	29H,0 			//0195 	0829
		BCR 	STATUS,7 		//0196 	1383
		ANDWR 	INDF,0 		//0197 	0200
		STR 	70H 			//0198 	01F0
		INCR	FSR,1 			//0199 	0984
		LDR 	2AH,0 			//019A 	082A
		ANDWR 	INDF,0 		//019B 	0200
		STR 	71H 			//019C 	01F1
		INCR	FSR,1 			//019D 	0984
		LDR 	2BH,0 			//019E 	082B
		ANDWR 	INDF,0 		//019F 	0200
		STR 	72H 			//01A0 	01F2
		INCR	FSR,1 			//01A1 	0984
		LDR 	2CH,0 			//01A2 	082C
		ANDWR 	INDF,0 		//01A3 	0200
		STR 	73H 			//01A4 	01F3
		IORWR 	72H,0 			//01A5 	0372
		IORWR 	71H,0 			//01A6 	0371
		IORWR 	70H,0 			//01A7 	0370
		BTSC 	STATUS,2 		//01A8 	1503
		LJUMP 	1ACH 			//01A9 	39AC
		LDWI 	1H 			//01AA 	2A01
		LJUMP 	1ADH 			//01AB 	39AD
		LDWI 	0H 			//01AC 	2A00
		STR 	2EH 			//01AD 	01AE

		//;FT61FC2x_Timer0.c: 416: }
		//;FT61FC2x_Timer0.c: 418: RF.level_cnt++;
		INCR	20H,1 			//01AE 	09A0

		//;FT61FC2x_Timer0.c: 421: if(RF.RF_temporary_bit == 0)
		LDR 	2EH,0 			//01AF 	082E
		BTSS 	STATUS,2 		//01B0 	1D03
		LJUMP 	1C0H 			//01B1 	39C0

		//;FT61FC2x_Timer0.c: 422: {
		//;FT61FC2x_Timer0.c: 423: if(RF.level_cnt <= 1)
		LDWI 	2H 			//01B2 	2A02
		SUBWR 	20H,0 			//01B3 	0C20
		BTSS 	STATUS,0 		//01B4 	1C03
		LJUMP 	1CEH 			//01B5 	39CE

		//;FT61FC2x_Timer0.c: 427: else if((RF.level_cnt > 1) && (RF.level_cnt <= 3))
		//;FT61FC2x_Timer0.c: 426: }
		LDWI 	2H 			//01B6 	2A02
		SUBWR 	20H,0 			//01B7 	0C20
		BTSS 	STATUS,0 		//01B8 	1C03
		LJUMP 	1CFH 			//01B9 	39CF
		LDWI 	4H 			//01BA 	2A04
		SUBWR 	20H,0 			//01BB 	0C20
		BTSC 	STATUS,0 		//01BC 	1403
		LJUMP 	1CFH 			//01BD 	39CF

		//;FT61FC2x_Timer0.c: 428: {
		//;FT61FC2x_Timer0.c: 429: PA6 = 1;
		BSR 	5H,6 			//01BE 	1B05
		LJUMP 	1CFH 			//01BF 	39CF

		//;FT61FC2x_Timer0.c: 432: else if(RF.RF_temporary_bit == 1)
		DECRSZ 	2EH,0 		//01C0 	0E2E
		LJUMP 	1CFH 			//01C1 	39CF

		//;FT61FC2x_Timer0.c: 433: {
		//;FT61FC2x_Timer0.c: 434: if(RF.level_cnt <= 1)
		LDWI 	2H 			//01C2 	2A02
		SUBWR 	20H,0 			//01C3 	0C20
		BTSS 	STATUS,0 		//01C4 	1C03
		LJUMP 	1BEH 			//01C5 	39BE

		//;FT61FC2x_Timer0.c: 438: else if((RF.level_cnt > 1) && (RF.level_cnt <= 3))
		LDWI 	2H 			//01C6 	2A02
		SUBWR 	20H,0 			//01C7 	0C20
		BTSS 	STATUS,0 		//01C8 	1C03
		LJUMP 	1CFH 			//01C9 	39CF
		LDWI 	4H 			//01CA 	2A04
		SUBWR 	20H,0 			//01CB 	0C20
		BTSC 	STATUS,0 		//01CC 	1403
		LJUMP 	1CFH 			//01CD 	39CF

		//;FT61FC2x_Timer0.c: 424: {
		//;FT61FC2x_Timer0.c: 425: PA6 = 0;
		BCR 	5H,6 			//01CE 	1305

		//;FT61FC2x_Timer0.c: 441: }
		//;FT61FC2x_Timer0.c: 442: }
		//;FT61FC2x_Timer0.c: 444: if(RF.level_cnt == 3)
		LDWI 	3H 			//01CF 	2A03
		XORWR 	20H,0 			//01D0 	0420
		BTSS 	STATUS,2 		//01D1 	1D03
		RET		 					//01D2 	0004

		//;FT61FC2x_Timer0.c: 445: {
		//;FT61FC2x_Timer0.c: 446: RF.level_cnt = 0;
		CLRR 	20H 			//01D3 	0120

		//;FT61FC2x_Timer0.c: 447: RF.RF_bit >>= 1;
		BCR 	STATUS,0 		//01D4 	1003
		RRR	2CH,1 			//01D5 	06AC
		RRR	2BH,1 			//01D6 	06AB
		RRR	2AH,1 			//01D7 	06AA
		RRR	29H,1 			//01D8 	06A9

		//;FT61FC2x_Timer0.c: 448: RF.RF_bit_cnt++;
		INCR	2DH,1 			//01D9 	09AD
		RET		 					//01DA 	0004
		CLRR 	INDF 			//01DB 	0100
		INCR	FSR,1 			//01DC 	0984
		CLRR 	INDF 			//01DD 	0100
		INCR	FSR,1 			//01DE 	0984
		CLRR 	INDF 			//01DF 	0100
		RET		 					//01E0 	0004

		//;FT61FC2x_Timer0.c: 249: if(LED.led_flag)
		LDR 	43H,0 			//01E1 	0843
		BTSS 	STATUS,2 		//01E2 	1D03

		//;FT61FC2x_Timer0.c: 250: {
		//;FT61FC2x_Timer0.c: 251: LED.led_time++;
		INCR	40H,1 			//01E3 	09C0

		//;FT61FC2x_Timer0.c: 252: }
		//;FT61FC2x_Timer0.c: 256: if(LED.led_time <= 1)
		LDWI 	2H 			//01E4 	2A02
		SUBWR 	40H,0 			//01E5 	0C40
		BTSS 	STATUS,0 		//01E6 	1C03

		//;FT61FC2x_Timer0.c: 257: {
		//;FT61FC2x_Timer0.c: 258: if(LED.led_flag & 1)
		BTSS 	43H,0 			//01E7 	1C43
		LJUMP 	1EDH 			//01E8 	39ED

		//;FT61FC2x_Timer0.c: 259: {
		//;FT61FC2x_Timer0.c: 269: PA4 = 1;
		BSR 	5H,4 			//01E9 	1A05

		//;FT61FC2x_Timer0.c: 270: PC5 = 1;
		BSR 	7H,5 			//01EA 	1A87

		//;FT61FC2x_Timer0.c: 271: PC3 = 1;
		BSR 	7H,3 			//01EB 	1987

		//;FT61FC2x_Timer0.c: 272: PC2 = 0;
		BCR 	7H,2 			//01EC 	1107

		//;FT61FC2x_Timer0.c: 273: }
		//;FT61FC2x_Timer0.c: 274: }
		//;FT61FC2x_Timer0.c: 275: if((LED.led_time > 1) && (LED.led_time <= 1 * 2))
		LDWI 	2H 			//01ED 	2A02
		SUBWR 	40H,0 			//01EE 	0C40
		LDWI 	3H 			//01EF 	2A03
		BTSS 	STATUS,0 		//01F0 	1C03
		LJUMP 	1FBH 			//01F1 	39FB
		SUBWR 	40H,0 			//01F2 	0C40
		BTSS 	STATUS,0 		//01F3 	1C03

		//;FT61FC2x_Timer0.c: 276: {
		//;FT61FC2x_Timer0.c: 277: if(LED.led_flag & 32)
		BTSS 	43H,5 			//01F4 	1EC3
		LJUMP 	1FAH 			//01F5 	39FA

		//;FT61FC2x_Timer0.c: 278: {
		//;FT61FC2x_Timer0.c: 285: PA4 = 0;
		BCR 	5H,4 			//01F6 	1205

		//;FT61FC2x_Timer0.c: 286: PC5 = 0;
		BCR 	7H,5 			//01F7 	1287

		//;FT61FC2x_Timer0.c: 287: PC3 = 0;
		BCR 	7H,3 			//01F8 	1187

		//;FT61FC2x_Timer0.c: 288: PC2 = 1;
		BSR 	7H,2 			//01F9 	1907

		//;FT61FC2x_Timer0.c: 289: }
		//;FT61FC2x_Timer0.c: 290: }
		//;FT61FC2x_Timer0.c: 291: if((LED.led_time > 1 * 2) && (LED.led_time <= 1 * 3))
		LDWI 	3H 			//01FA 	2A03
		SUBWR 	40H,0 			//01FB 	0C40
		LDWI 	4H 			//01FC 	2A04
		BTSS 	STATUS,0 		//01FD 	1C03
		LJUMP 	208H 			//01FE 	3A08
		SUBWR 	40H,0 			//01FF 	0C40
		BTSS 	STATUS,0 		//0200 	1C03

		//;FT61FC2x_Timer0.c: 292: {
		//;FT61FC2x_Timer0.c: 293: if(LED.led_flag & 2)
		BTSS 	43H,1 			//0201 	1CC3
		LJUMP 	207H 			//0202 	3A07

		//;FT61FC2x_Timer0.c: 294: {
		//;FT61FC2x_Timer0.c: 303: PC2 = 0;
		BCR 	7H,2 			//0203 	1107

		//;FT61FC2x_Timer0.c: 304: PC5 = 0;
		BCR 	7H,5 			//0204 	1287

		//;FT61FC2x_Timer0.c: 305: PC3 = 0;
		BCR 	7H,3 			//0205 	1187

		//;FT61FC2x_Timer0.c: 306: PA4 = 1;
		BSR 	5H,4 			//0206 	1A05

		//;FT61FC2x_Timer0.c: 307: }
		//;FT61FC2x_Timer0.c: 308: }
		//;FT61FC2x_Timer0.c: 309: if((LED.led_time > 1 * 3) && (LED.led_time <= 1 * 4))
		LDWI 	4H 			//0207 	2A04
		SUBWR 	40H,0 			//0208 	0C40
		LDWI 	5H 			//0209 	2A05
		BTSS 	STATUS,0 		//020A 	1C03
		LJUMP 	215H 			//020B 	3A15
		SUBWR 	40H,0 			//020C 	0C40
		BTSS 	STATUS,0 		//020D 	1C03

		//;FT61FC2x_Timer0.c: 310: {
		//;FT61FC2x_Timer0.c: 311: if(LED.led_flag & 4)
		BTSS 	43H,2 			//020E 	1D43
		LJUMP 	214H 			//020F 	3A14

		//;FT61FC2x_Timer0.c: 312: {
		//;FT61FC2x_Timer0.c: 318: PC2 = 1;
		BSR 	7H,2 			//0210 	1907

		//;FT61FC2x_Timer0.c: 319: PC5 = 1;
		BSR 	7H,5 			//0211 	1A87

		//;FT61FC2x_Timer0.c: 320: PC3 = 1;
		BSR 	7H,3 			//0212 	1987

		//;FT61FC2x_Timer0.c: 321: PA4 = 0;
		BCR 	5H,4 			//0213 	1205

		//;FT61FC2x_Timer0.c: 322: }
		//;FT61FC2x_Timer0.c: 323: }
		//;FT61FC2x_Timer0.c: 324: if((LED.led_time > 1 * 4) && (LED.led_time <= 1 * 5))
		LDWI 	5H 			//0214 	2A05
		SUBWR 	40H,0 			//0215 	0C40
		LDWI 	6H 			//0216 	2A06
		BTSS 	STATUS,0 		//0217 	1C03
		LJUMP 	222H 			//0218 	3A22
		SUBWR 	40H,0 			//0219 	0C40
		BTSS 	STATUS,0 		//021A 	1C03

		//;FT61FC2x_Timer0.c: 325: {
		//;FT61FC2x_Timer0.c: 326: if(LED.led_flag & 8)
		BTSS 	43H,3 			//021B 	1DC3
		LJUMP 	221H 			//021C 	3A21

		//;FT61FC2x_Timer0.c: 327: {
		//;FT61FC2x_Timer0.c: 337: PC2 = 0;
		BCR 	7H,2 			//021D 	1107

		//;FT61FC2x_Timer0.c: 338: PA4 = 0;
		BCR 	5H,4 			//021E 	1205

		//;FT61FC2x_Timer0.c: 339: PC3 = 0;
		BCR 	7H,3 			//021F 	1187

		//;FT61FC2x_Timer0.c: 340: PC5 = 1;
		BSR 	7H,5 			//0220 	1A87

		//;FT61FC2x_Timer0.c: 341: }
		//;FT61FC2x_Timer0.c: 342: }
		//;FT61FC2x_Timer0.c: 343: if((LED.led_time > 1 * 5) && (LED.led_time <= 1 * 6))
		LDWI 	6H 			//0221 	2A06
		SUBWR 	40H,0 			//0222 	0C40
		BTSS 	STATUS,0 		//0223 	1C03
		LJUMP 	22EH 			//0224 	3A2E
		LDWI 	7H 			//0225 	2A07
		SUBWR 	40H,0 			//0226 	0C40
		BTSS 	STATUS,0 		//0227 	1C03

		//;FT61FC2x_Timer0.c: 344: {
		//;FT61FC2x_Timer0.c: 345: if(LED.led_flag & 16)
		BTSS 	43H,4 			//0228 	1E43
		LJUMP 	22EH 			//0229 	3A2E

		//;FT61FC2x_Timer0.c: 346: {
		//;FT61FC2x_Timer0.c: 353: PC2 = 1;
		BSR 	7H,2 			//022A 	1907

		//;FT61FC2x_Timer0.c: 354: PA4 = 1;
		BSR 	5H,4 			//022B 	1A05

		//;FT61FC2x_Timer0.c: 355: PC3 = 1;
		BSR 	7H,3 			//022C 	1987

		//;FT61FC2x_Timer0.c: 356: PC5 = 0;
		BCR 	7H,5 			//022D 	1287

		//;FT61FC2x_Timer0.c: 357: }
		//;FT61FC2x_Timer0.c: 358: }
		//;FT61FC2x_Timer0.c: 360: if(LED.led_time == 1 * 6)
		LDWI 	6H 			//022E 	2A06
		XORWR 	40H,0 			//022F 	0440
		BTSS 	STATUS,2 		//0230 	1D03
		RET		 					//0231 	0004

		//;FT61FC2x_Timer0.c: 361: {
		//;FT61FC2x_Timer0.c: 368: LED.time_cnt++;
		INCR	41H,1 			//0232 	09C1
		BTSC 	STATUS,2 		//0233 	1503
		INCR	42H,1 			//0234 	09C2
		LDWI 	1H 			//0235 	2A01

		//;FT61FC2x_Timer0.c: 369: LED.led_time = 0;
		CLRR 	40H 			//0236 	0140

		//;FT61FC2x_Timer0.c: 372: if(LED.time_cnt > 282)
		SUBWR 	42H,0 			//0237 	0C42
		LDWI 	1BH 			//0238 	2A1B
		BTSC 	STATUS,2 		//0239 	1503
		SUBWR 	41H,0 			//023A 	0C41
		BTSS 	STATUS,0 		//023B 	1C03
		RET		 					//023C 	0004

		//;FT61FC2x_Timer0.c: 373: {
		//;FT61FC2x_Timer0.c: 378: PC2 = 0;
		BCR 	7H,2 			//023D 	1107

		//;FT61FC2x_Timer0.c: 379: PC3 = 0;
		BCR 	7H,3 			//023E 	1187

		//;FT61FC2x_Timer0.c: 380: PA4 = 0;
		BCR 	5H,4 			//023F 	1205

		//;FT61FC2x_Timer0.c: 381: PC5 = 0;
		BCR 	7H,5 			//0240 	1287

		//;FT61FC2x_Timer0.c: 384: LED.led_time = 0;
		CLRR 	40H 			//0241 	0140

		//;FT61FC2x_Timer0.c: 385: LED.time_cnt = 0;
		CLRR 	41H 			//0242 	0141
		CLRR 	42H 			//0243 	0142

		//;FT61FC2x_Timer0.c: 386: LED.led_flag = 0;
		CLRR 	43H 			//0244 	0143

		//;FT61FC2x_Timer0.c: 389: power_sleep = 1;
		CLRR 	48H 			//0245 	0148
		INCR	48H,1 			//0246 	09C8
		RET		 					//0247 	0004

		//;FT61FC2x_Timer0.c: 1019: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0248 	1A83
		BTSS 	CH,1 			//0249 	1C8C
		LJUMP 	25CH 			//024A 	3A5C
		BCR 	STATUS,5 		//024B 	1283
		BTSS 	CH,1 			//024C 	1C8C
		LJUMP 	25CH 			//024D 	3A5C

		//;FT61FC2x_Timer0.c: 1020: {
		//;FT61FC2x_Timer0.c: 1021: TMR2IF = 0;
		BCR 	CH,1 			//024E 	108C

		//;FT61FC2x_Timer0.c: 1022: start_code();
		LCALL 	2A8H 			//024F 	32A8

		//;FT61FC2x_Timer0.c: 1023: RF_send();
		LCALL 	17AH 			//0250 	317A
		LDWI 	8H 			//0251 	2A08

		//;FT61FC2x_Timer0.c: 1024: interrupt_delay++;
		INCR	44H,1 			//0252 	09C4

		//;FT61FC2x_Timer0.c: 1026: if(interrupt_delay == 8)
		XORWR 	44H,0 			//0253 	0444
		BTSS 	STATUS,2 		//0254 	1D03
		LJUMP 	258H 			//0255 	3A58

		//;FT61FC2x_Timer0.c: 1027: {
		//;FT61FC2x_Timer0.c: 1028: scanf_key();
		LCALL 	1CH 			//0256 	301C

		//;FT61FC2x_Timer0.c: 1029: LED_function();
		LCALL 	1E1H 			//0257 	31E1

		//;FT61FC2x_Timer0.c: 1032: }
		//;FT61FC2x_Timer0.c: 1035: if(interrupt_delay > 8)interrupt_delay = 0;
		LDWI 	9H 			//0258 	2A09
		SUBWR 	44H,0 			//0259 	0C44
		BTSC 	STATUS,0 		//025A 	1403
		CLRR 	44H 			//025B 	0144

		//;FT61FC2x_Timer0.c: 1036: }
		//;FT61FC2x_Timer0.c: 1038: if(INTF == 1)
		BTSS 	INTCON,1 		//025C 	1C8B
		LJUMP 	261H 			//025D 	3A61
		LDWI 	3H 			//025E 	2A03

		//;FT61FC2x_Timer0.c: 1039: {
		//;FT61FC2x_Timer0.c: 1040: power_sleep = 0;
		BCR 	STATUS,5 		//025F 	1283

		//;FT61FC2x_Timer0.c: 1043: DATA.function_key = 1;
		//;FT61FC2x_Timer0.c: 1044: RF.code_finish_flag = 0;
		//;FT61FC2x_Timer0.c: 1045: DATA.byte_cnt = 3;
		LCALL 	278H 			//0260 	3278

		//;FT61FC2x_Timer0.c: 1048: }
		//;FT61FC2x_Timer0.c: 1050: if(PAIF == 1)
		BTSS 	INTCON,0 		//0261 	1C0B
		LJUMP 	26CH 			//0262 	3A6C

		//;FT61FC2x_Timer0.c: 1051: {
		//;FT61FC2x_Timer0.c: 1052: if(PORTA ^ last_PORTA)
		BCR 	STATUS,5 		//0263 	1283
		LDR 	5H,0 			//0264 	0805
		XORWR 	47H,0 			//0265 	0447
		BTSC 	STATUS,2 		//0266 	1503
		LJUMP 	26CH 			//0267 	3A6C
		LDWI 	3H 			//0268 	2A03

		//;FT61FC2x_Timer0.c: 1053: {
		//;FT61FC2x_Timer0.c: 1054: power_sleep = 0;
		//;FT61FC2x_Timer0.c: 1057: DATA.function_key = 1;
		//;FT61FC2x_Timer0.c: 1058: RF.code_finish_flag = 0;
		//;FT61FC2x_Timer0.c: 1059: DATA.byte_cnt = 3;
		LCALL 	278H 			//0269 	3278

		//;FT61FC2x_Timer0.c: 1063: PORTA |= last_PORTA;
		LDR 	47H,0 			//026A 	0847
		IORWR 	5H,1 			//026B 	0385
		LDR 	7BH,0 			//026C 	087B
		BCR 	STATUS,5 		//026D 	1283
		STR 	7FH 			//026E 	01FF
		LDR 	7AH,0 			//026F 	087A
		STR 	PCLATH 			//0270 	018A
		LDR 	79H,0 			//0271 	0879
		STR 	FSR 			//0272 	0184
		SWAPR 	78H,0 			//0273 	0778
		STR 	STATUS 			//0274 	0183
		SWAPR 	7EH,1 			//0275 	07FE
		SWAPR 	7EH,0 			//0276 	077E
		RETI		 			//0277 	0009
		CLRR 	48H 			//0278 	0148
		CLRR 	3AH 			//0279 	013A
		INCR	3AH,1 			//027A 	09BA
		CLRR 	24H 			//027B 	0124
		STR 	3FH 			//027C 	01BF
		RET		 					//027D 	0004
		STR 	76H 			//027E 	01F6

		//;FT61FC2x_Timer0.c: 486: if(key != 0)
		LDR 	75H,0 			//027F 	0875
		BTSC 	STATUS,2 		//0280 	1503
		RET		 					//0281 	0004

		//;FT61FC2x_Timer0.c: 487: {
		//;FT61FC2x_Timer0.c: 488: Addr_code(Addr);
		LDR 	76H,0 			//0282 	0876
		LCALL 	2EAH 			//0283 	32EA

		//;FT61FC2x_Timer0.c: 490: if(RF.code_cnt == 0)
		BCR 	STATUS,5 		//0284 	1283
		BCR 	STATUS,6 		//0285 	1303
		LDR 	22H,0 			//0286 	0822
		BTSS 	STATUS,2 		//0287 	1D03
		LJUMP 	291H 			//0288 	3A91

		//;FT61FC2x_Timer0.c: 491: {
		//;FT61FC2x_Timer0.c: 492: write_bit(DATA.data[DATA.byte_cnt]);
		LDR 	3FH,0 			//0289 	083F
		ADDWI 	3BH 			//028A 	273B
		STR 	FSR 			//028B 	0184
		BCR 	STATUS,7 		//028C 	1383
		LDR 	INDF,0 			//028D 	0800
		LCALL 	2C9H 			//028E 	32C9

		//;FT61FC2x_Timer0.c: 493: RF.code_cnt++;
		INCR	22H,1 			//028F 	09A2

		//;FT61FC2x_Timer0.c: 494: }
		RET		 					//0290 	0004

		//;FT61FC2x_Timer0.c: 495: else if(RF.code_cnt == 1)
		DECRSZ 	22H,0 		//0291 	0E22
		LJUMP 	294H 			//0292 	3A94
		LJUMP 	289H 			//0293 	3A89

		//;FT61FC2x_Timer0.c: 496: {
		//;FT61FC2x_Timer0.c: 497: write_bit(DATA.data[DATA.byte_cnt]);
		//;FT61FC2x_Timer0.c: 500: else if(RF.code_cnt == 2)
		LDWI 	2H 			//0294 	2A02
		XORWR 	22H,0 			//0295 	0422
		BTSS 	STATUS,2 		//0296 	1D03
		RET		 					//0297 	0004

		//;FT61FC2x_Timer0.c: 501: {
		//;FT61FC2x_Timer0.c: 502: DATA.data[DATA.byte_cnt] = key;
		LDR 	3FH,0 			//0298 	083F
		ADDWI 	3BH 			//0299 	273B
		STR 	FSR 			//029A 	0184
		LDR 	75H,0 			//029B 	0875
		BCR 	STATUS,7 		//029C 	1383
		STR 	INDF 			//029D 	0180

		//;FT61FC2x_Timer0.c: 503: write_bit(DATA.data[DATA.byte_cnt]);
		LDR 	3FH,0 			//029E 	083F
		ADDWI 	3BH 			//029F 	273B
		STR 	FSR 			//02A0 	0184
		LDR 	INDF,0 			//02A1 	0800
		LCALL 	2C9H 			//02A2 	32C9

		//;FT61FC2x_Timer0.c: 504: RF.code_cnt = 0;
		CLRR 	22H 			//02A3 	0122

		//;FT61FC2x_Timer0.c: 505: RF.code_finish_flag = 1;
		CLRR 	24H 			//02A4 	0124
		INCR	24H,1 			//02A5 	09A4

		//;FT61FC2x_Timer0.c: 506: DATA.function_key = 0;
		CLRR 	3AH 			//02A6 	013A
		RET		 					//02A7 	0004

		//;FT61FC2x_Timer0.c: 938: if(start_flag)
		LDR 	45H,0 			//02A8 	0845
		BTSC 	STATUS,2 		//02A9 	1503
		RET		 					//02AA 	0004
		LDWI 	1AH 			//02AB 	2A1A

		//;FT61FC2x_Timer0.c: 939: {
		//;FT61FC2x_Timer0.c: 940: start_time++;
		INCR	46H,1 			//02AC 	09C6
		BTSC 	STATUS,2 		//02AD 	1503
		LJUMP 	2B5H 			//02AE 	3AB5
		SUBWR 	46H,0 			//02AF 	0C46
		BTSC 	STATUS,0 		//02B0 	1403
		LJUMP 	2B4H 			//02B1 	3AB4

		//;FT61FC2x_Timer0.c: 943: {
		//;FT61FC2x_Timer0.c: 944: PA6 = 1;
		BSR 	5H,6 			//02B2 	1B05

		//;FT61FC2x_Timer0.c: 945: }
		RET		 					//02B3 	0004

		//;FT61FC2x_Timer0.c: 946: else if((start_time >= 26) && (start_time <= 73))
		LDWI 	1AH 			//02B4 	2A1A
		SUBWR 	46H,0 			//02B5 	0C46
		BTSS 	STATUS,0 		//02B6 	1C03
		LJUMP 	2BEH 			//02B7 	3ABE
		LDWI 	4AH 			//02B8 	2A4A
		SUBWR 	46H,0 			//02B9 	0C46
		BTSC 	STATUS,0 		//02BA 	1403
		LJUMP 	2BEH 			//02BB 	3ABE

		//;FT61FC2x_Timer0.c: 947: {
		//;FT61FC2x_Timer0.c: 948: PA6 = 0;
		BCR 	5H,6 			//02BC 	1305

		//;FT61FC2x_Timer0.c: 949: }
		RET		 					//02BD 	0004
		LDWI 	80H 			//02BE 	2A80

		//;FT61FC2x_Timer0.c: 950: else
		//;FT61FC2x_Timer0.c: 951: {
		//;FT61FC2x_Timer0.c: 952: start_time = 0;
		CLRR 	46H 			//02BF 	0146

		//;FT61FC2x_Timer0.c: 953: start_flag = 0;
		CLRR 	45H 			//02C0 	0145

		//;FT61FC2x_Timer0.c: 956: RF.rf_flag = 1;
		CLRR 	21H 			//02C1 	0121
		INCR	21H,1 			//02C2 	09A1

		//;FT61FC2x_Timer0.c: 957: RF.RF_bit = 0x80000000;
		STR 	2CH 			//02C3 	01AC
		LDWI 	0H 			//02C4 	2A00
		CLRR 	2BH 			//02C5 	012B
		CLRR 	2AH 			//02C6 	012A
		CLRR 	29H 			//02C7 	0129
		RET		 					//02C8 	0004
		STR 	71H 			//02C9 	01F1

		//;FT61FC2x_Timer0.c: 461: if(DATA.byte_cnt > 0)
		LDR 	3FH,0 			//02CA 	083F
		BTSC 	STATUS,2 		//02CB 	1503
		LJUMP 	2E2H 			//02CC 	3AE2

		//;FT61FC2x_Timer0.c: 462: {
		//;FT61FC2x_Timer0.c: 463: RF.RF_data |= byte;
		LDR 	71H,0 			//02CD 	0871
		IORWR 	25H,1 			//02CE 	03A5

		//;FT61FC2x_Timer0.c: 464: RF.RF_data <<= DATA.byte_cnt * 8;
		LDR 	3FH,0 			//02CF 	083F
		STR 	70H 			//02D0 	01F0
		BCR 	STATUS,0 		//02D1 	1003
		RLR 	70H,1 			//02D2 	05F0
		BCR 	STATUS,0 		//02D3 	1003
		RLR 	70H,1 			//02D4 	05F0
		BCR 	STATUS,0 		//02D5 	1003
		RLR 	70H,0 			//02D6 	0570
		ADDWI 	1H 			//02D7 	2701
		LJUMP 	2DEH 			//02D8 	3ADE
		BCR 	STATUS,0 		//02D9 	1003
		RLR 	25H,1 			//02DA 	05A5
		RLR 	26H,1 			//02DB 	05A6
		RLR 	27H,1 			//02DC 	05A7
		RLR 	28H,1 			//02DD 	05A8
		ADDWI 	FFH 			//02DE 	27FF
		BTSS 	STATUS,2 		//02DF 	1D03
		LJUMP 	2D9H 			//02E0 	3AD9

		//;FT61FC2x_Timer0.c: 465: DATA.byte_cnt--;
		DECR 	3FH,1 			//02E1 	0DBF

		//;FT61FC2x_Timer0.c: 466: }
		//;FT61FC2x_Timer0.c: 468: if(DATA.byte_cnt == 0)
		LDR 	3FH,0 			//02E2 	083F
		BTSS 	STATUS,2 		//02E3 	1D03
		RET		 					//02E4 	0004

		//;FT61FC2x_Timer0.c: 469: {
		//;FT61FC2x_Timer0.c: 471: start_flag = 1;
		CLRR 	45H 			//02E5 	0145
		INCR	45H,1 			//02E6 	09C5

		//;FT61FC2x_Timer0.c: 472: RF.RF_bit_cnt = 0;
		CLRR 	2DH 			//02E7 	012D

		//;FT61FC2x_Timer0.c: 473: RF.level_cnt = 0;
		CLRR 	20H 			//02E8 	0120
		RET		 					//02E9 	0004
		STR 	72H 			//02EA 	01F2

		//;FT61FC2x_Timer0.c: 970: for(int i = 0;i < 2 ; i++)
		CLRR 	73H 			//02EB 	0173
		CLRR 	74H 			//02EC 	0174

		//;FT61FC2x_Timer0.c: 971: {
		//;FT61FC2x_Timer0.c: 972: DATA.data[i] = EEPROMread(Addrs);
		LDR 	73H,0 			//02ED 	0873
		ADDWI 	3BH 			//02EE 	273B
		STR 	FSR 			//02EF 	0184
		LDR 	72H,0 			//02F0 	0872
		LCALL 	36DH 			//02F1 	336D
		BCR 	STATUS,7 		//02F2 	1383
		STR 	INDF 			//02F3 	0180

		//;FT61FC2x_Timer0.c: 973: Addrs += 1;
		INCR	72H,1 			//02F4 	09F2
		INCR	73H,1 			//02F5 	09F3
		BTSC 	STATUS,2 		//02F6 	1503
		INCR	74H,1 			//02F7 	09F4
		LDR 	74H,0 			//02F8 	0874
		XORWI 	80H 			//02F9 	2680
		STR 	7FH 			//02FA 	01FF
		LDWI 	80H 			//02FB 	2A80
		SUBWR 	7FH,0 			//02FC 	0C7F
		BTSS 	STATUS,2 		//02FD 	1D03
		LJUMP 	301H 			//02FE 	3B01
		LDWI 	2H 			//02FF 	2A02
		SUBWR 	73H,0 			//0300 	0C73
		BTSC 	STATUS,0 		//0301 	1403
		RET		 					//0302 	0004
		LJUMP 	2EDH 			//0303 	3AED

		//;FT61FC2x_Timer0.c: 174: OSCCON = 0B01100001;
		LDWI 	61H 			//0304 	2A61
		BSR 	STATUS,5 		//0305 	1A83
		STR 	FH 			//0306 	018F

		//;FT61FC2x_Timer0.c: 175: INTCON = 0;
		CLRR 	INTCON 			//0307 	010B

		//;FT61FC2x_Timer0.c: 176: PORTA = 0B10001100;
		LDWI 	8CH 			//0308 	2A8C
		BCR 	STATUS,5 		//0309 	1283
		STR 	5H 			//030A 	0185

		//;FT61FC2x_Timer0.c: 177: TRISA = 0B10001100;
		BSR 	STATUS,5 		//030B 	1A83
		STR 	5H 			//030C 	0185

		//;FT61FC2x_Timer0.c: 179: PORTC = 0B00000010;
		LDWI 	2H 			//030D 	2A02
		BCR 	STATUS,5 		//030E 	1283
		STR 	7H 			//030F 	0187

		//;FT61FC2x_Timer0.c: 180: TRISC = 0B00000010;
		BSR 	STATUS,5 		//0310 	1A83
		STR 	7H 			//0311 	0187

		//;FT61FC2x_Timer0.c: 182: WPUA = 0B10001100;
		LDWI 	8CH 			//0312 	2A8C
		STR 	15H 			//0313 	0195

		//;FT61FC2x_Timer0.c: 184: WPUC = 0B000010;
		LDWI 	2H 			//0314 	2A02
		STR 	8H 			//0315 	0188

		//;FT61FC2x_Timer0.c: 190: OPTION = 0B00000000;
		CLRR 	1H 			//0316 	0101

		//;FT61FC2x_Timer0.c: 192: ANSEL = 0B00000000;
		CLRR 	11H 			//0317 	0111

		//;FT61FC2x_Timer0.c: 194: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0318 	1283
		CLRR 	1BH 			//0319 	011B

		//;FT61FC2x_Timer0.c: 198: CMCON0 = 0B00000111;
		LDWI 	7H 			//031A 	2A07
		STR 	19H 			//031B 	0199
		RET		 					//031C 	0004

		//;FT61FC2x_Timer0.c: 1079: POWER_INITIAL();
		LCALL 	304H 			//031D 	3304

		//;FT61FC2x_Timer0.c: 1081: TIMER2_INITIAL();
		LCALL 	357H 			//031E 	3357

		//;FT61FC2x_Timer0.c: 1085: TMR2IE = 1;
		BSR 	CH,1 			//031F 	188C

		//;FT61FC2x_Timer0.c: 1088: LED.led_flag = 0;
		BCR 	STATUS,5 		//0320 	1283
		CLRR 	43H 			//0321 	0143

		//;FT61FC2x_Timer0.c: 1091: INTEDG = 0;
		BSR 	STATUS,5 		//0322 	1A83
		BCR 	1H,6 			//0323 	1301

		//;FT61FC2x_Timer0.c: 1092: INTE = 1;
		BSR 	INTCON,4 		//0324 	1A0B

		//;FT61FC2x_Timer0.c: 1093: INTF = 0;
		BCR 	INTCON,1 		//0325 	108B

		//;FT61FC2x_Timer0.c: 1094: last_PORTA = PORTA;
		BCR 	STATUS,5 		//0326 	1283
		LDR 	5H,0 			//0327 	0805
		STR 	47H 			//0328 	01C7

		//;FT61FC2x_Timer0.c: 1095: IOCA = 0B10001100;
		LDWI 	8CH 			//0329 	2A8C
		BSR 	STATUS,5 		//032A 	1A83
		STR 	16H 			//032B 	0196

		//;FT61FC2x_Timer0.c: 1096: PAIE = 1;
		BSR 	INTCON,3 		//032C 	198B

		//;FT61FC2x_Timer0.c: 1098: GIE = 1;
		BSR 	INTCON,7 		//032D 	1B8B

		//;FT61FC2x_Timer0.c: 1101: __nop();
		NOP		 					//032E 	0000

		//;FT61FC2x_Timer0.c: 1102: __nop();
		NOP		 					//032F 	0000
		SLEEP	 			//0330 	0002

		//;FT61FC2x_Timer0.c: 1104: __nop();
		NOP		 					//0331 	0000

		//;FT61FC2x_Timer0.c: 1105: __nop();
		NOP		 					//0332 	0000

		//;FT61FC2x_Timer0.c: 1108: {
		//;FT61FC2x_Timer0.c: 1109: Sleep_code();
		LCALL 	335H 			//0333 	3335
		LJUMP 	333H 			//0334 	3B33

		//;FT61FC2x_Timer0.c: 985: if(power_sleep)
		BCR 	STATUS,5 		//0335 	1283
		BCR 	STATUS,6 		//0336 	1303
		LDR 	48H,0 			//0337 	0848
		BTSC 	STATUS,2 		//0338 	1503
		LJUMP 	343H 			//0339 	3B43

		//;FT61FC2x_Timer0.c: 986: {
		//;FT61FC2x_Timer0.c: 987: SLVREN = 0;
		BCR 	1BH,4 			//033A 	121B

		//;FT61FC2x_Timer0.c: 988: LVDEN = 0;
		BSR 	STATUS,5 		//033B 	1A83
		BCR 	EH,3 			//033C 	118E

		//;FT61FC2x_Timer0.c: 990: __nop();
		NOP		 					//033D 	0000

		//;FT61FC2x_Timer0.c: 991: __nop();
		NOP		 					//033E 	0000
		SLEEP	 			//033F 	0002

		//;FT61FC2x_Timer0.c: 993: __nop();
		NOP		 					//0340 	0000

		//;FT61FC2x_Timer0.c: 994: __nop();
		NOP		 					//0341 	0000

		//;FT61FC2x_Timer0.c: 996: }
		RET		 					//0342 	0004

		//;FT61FC2x_Timer0.c: 997: else
		//;FT61FC2x_Timer0.c: 998: {
		//;FT61FC2x_Timer0.c: 999: SLVREN = 1;
		BSR 	1BH,4 			//0343 	1A1B

		//;FT61FC2x_Timer0.c: 1000: LVDEN = 1;
		BSR 	STATUS,5 		//0344 	1A83
		BSR 	EH,3 			//0345 	198E
		RET		 					//0346 	0004
		LJUMP 	D9H 			//0347 	38D9
		LJUMP 	DCH 			//0348 	38DC
		LJUMP 	DEH 			//0349 	38DE
		LJUMP 	E0H 			//034A 	38E0
		LJUMP 	E2H 			//034B 	38E2
		LJUMP 	E4H 			//034C 	38E4
		LJUMP 	E6H 			//034D 	38E6
		LJUMP 	E8H 			//034E 	38E8
		LJUMP 	EAH 			//034F 	38EA
		LJUMP 	D9H 			//0350 	38D9
		LJUMP 	D9H 			//0351 	38D9
		LJUMP 	D9H 			//0352 	38D9
		LJUMP 	D9H 			//0353 	38D9
		LJUMP 	D9H 			//0354 	38D9
		LJUMP 	D9H 			//0355 	38D9
		LJUMP 	D9H 			//0356 	38D9

		//;FT61FC2x_Timer0.c: 227: T2CON = 0B00000001;
		LDWI 	1H 			//0357 	2A01
		STR 	12H 			//0358 	0192

		//;FT61FC2x_Timer0.c: 231: TMR2 = 0;
		CLRR 	11H 			//0359 	0111

		//;FT61FC2x_Timer0.c: 232: PR2 = 138;
		LDWI 	8AH 			//035A 	2A8A
		BSR 	STATUS,5 		//035B 	1A83
		STR 	12H 			//035C 	0192

		//;FT61FC2x_Timer0.c: 234: TMR2ON = 1;
		BCR 	STATUS,5 		//035D 	1283
		BSR 	12H,2 			//035E 	1912

		//;FT61FC2x_Timer0.c: 235: PEIE = 1;
		BSR 	INTCON,6 		//035F 	1B0B

		//;FT61FC2x_Timer0.c: 236: TMR2IF = 0;
		BCR 	CH,1 			//0360 	108C

		//;FT61FC2x_Timer0.c: 237: TMR2IE = 1;
		BSR 	STATUS,5 		//0361 	1A83
		BSR 	CH,1 			//0362 	188C

		//;FT61FC2x_Timer0.c: 238: GIE = 1;
		BSR 	INTCON,7 		//0363 	1B8B
		RET		 					//0364 	0004
		CLRWDT	 			//0365 	0001
		CLRR 	INDF 			//0366 	0100
		INCR	FSR,1 			//0367 	0984
		XORWR 	FSR,0 			//0368 	0404
		BTSC 	STATUS,2 		//0369 	1503
		RETW 	0H 			//036A 	2100
		XORWR 	FSR,0 			//036B 	0404
		LJUMP 	366H 			//036C 	3B66
		STR 	70H 			//036D 	01F0

		//;FT61FC2x_Timer0.c: 923: unsigned char ReEEPROMread;
		//;FT61FC2x_Timer0.c: 924: EEADR = EEAddr;
		BSR 	STATUS,5 		//036E 	1A83
		BCR 	STATUS,6 		//036F 	1303
		STR 	1BH 			//0370 	019B

		//;FT61FC2x_Timer0.c: 925: RD = 1;
		BSR 	1CH,0 			//0371 	181C

		//;FT61FC2x_Timer0.c: 926: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//0372 	081A
		STR 	71H 			//0373 	01F1

		//;FT61FC2x_Timer0.c: 927: return ReEEPROMread;
		RET		 					//0374 	0004
		LJUMP 	106H 			//0375 	3906
		LJUMP 	11FH 			//0376 	391F
		LJUMP 	12CH 			//0377 	392C
		LJUMP 	139H 			//0378 	3939
		LJUMP 	146H 			//0379 	3946
		LJUMP 	153H 			//037A 	3953
		LJUMP 	3AH 			//037B 	383A
		LJUMP 	57H 			//037C 	3857
		LJUMP 	74H 			//037D 	3874
		LJUMP 	91H 			//037E 	3891
			END
