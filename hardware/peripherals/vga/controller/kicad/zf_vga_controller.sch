EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 62453C53
P 2150 1150
F 0 "SW1" H 2150 1435 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 1344 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 1350 50  0001 C CNN
F 3 "~" H 2150 1350 50  0001 C CNN
	1    2150 1150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW3
U 1 1 62457478
P 2150 2400
F 0 "SW3" H 2150 2685 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 2594 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 2600 50  0001 C CNN
F 3 "~" H 2150 2600 50  0001 C CNN
	1    2150 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW4
U 1 1 624580C3
P 2150 3000
F 0 "SW4" H 2150 3285 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 3194 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 3200 50  0001 C CNN
F 3 "~" H 2150 3200 50  0001 C CNN
	1    2150 3000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW2
U 1 1 6245ADC1
P 2150 1800
F 0 "SW2" H 2150 2085 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 1994 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 2000 50  0001 C CNN
F 3 "~" H 2150 2000 50  0001 C CNN
	1    2150 1800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW5
U 1 1 6245CBC1
P 2150 3600
F 0 "SW5" H 2150 3885 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 3794 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 3800 50  0001 C CNN
F 3 "~" H 2150 3800 50  0001 C CNN
	1    2150 3600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW6
U 1 1 6245D585
P 2150 4200
F 0 "SW6" H 2150 4485 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 4394 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 4400 50  0001 C CNN
F 3 "~" H 2150 4400 50  0001 C CNN
	1    2150 4200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 624652B0
P 650 850
F 0 "#PWR0101" H 650 700 50  0001 C CNN
F 1 "VCC" H 665 1023 50  0000 C CNN
F 2 "" H 650 850 50  0001 C CNN
F 3 "" H 650 850 50  0001 C CNN
	1    650  850 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 624719CA
P 4050 2300
F 0 "C1" H 4165 2346 50  0000 L CNN
F 1 "0.1uF" H 4165 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 4088 2150 50  0001 C CNN
F 3 "~" H 4050 2300 50  0001 C CNN
	1    4050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1350 1850 1350
Wire Wire Line
	1850 2000 1950 2000
Wire Wire Line
	1850 2000 1850 2600
Wire Wire Line
	1850 2600 1950 2600
Wire Wire Line
	1850 2600 1850 3200
Wire Wire Line
	1850 3200 1950 3200
Connection ~ 1850 2600
Wire Wire Line
	1850 3200 1850 3800
Wire Wire Line
	1850 3800 1950 3800
Connection ~ 1850 3200
Wire Wire Line
	1850 3800 1850 4400
Wire Wire Line
	1850 4400 1950 4400
Connection ~ 1850 3800
$Comp
L power:GND #PWR0102
U 1 1 62491E55
P 1850 5700
F 0 "#PWR0102" H 1850 5450 50  0001 C CNN
F 1 "GND" H 1855 5527 50  0000 C CNN
F 2 "" H 1850 5700 50  0001 C CNN
F 3 "" H 1850 5700 50  0001 C CNN
	1    1850 5700
	1    0    0    -1  
$EndComp
Connection ~ 1850 4400
Wire Wire Line
	1750 1800 1950 1800
Wire Wire Line
	1150 1800 1450 1800
Wire Wire Line
	1450 3600 1950 3600
Wire Wire Line
	1150 1900 1350 1900
Wire Wire Line
	1350 4200 1950 4200
NoConn ~ 2350 1350
NoConn ~ 2350 2000
NoConn ~ 2350 2600
NoConn ~ 2350 3200
NoConn ~ 2350 3800
NoConn ~ 2350 4400
Text GLabel 4050 1150 2    50   Input ~ 0
PA0
Text GLabel 4050 1250 2    50   Input ~ 0
PA1
Text GLabel 4050 1350 2    50   Input ~ 0
PA2
Text GLabel 4050 1450 2    50   Input ~ 0
PA3
Text GLabel 4050 1550 2    50   Input ~ 0
PA0
Text GLabel 4050 1650 2    50   Input ~ 0
PA1
Text GLabel 4050 1750 2    50   Input ~ 0
PA2
Text GLabel 4050 1850 2    50   Input ~ 0
PA3
Text GLabel 3050 2050 0    50   Input ~ 0
~EN1
Text GLabel 3050 2150 0    50   Input ~ 0
EN2
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 625734B2
P 5100 2850
F 0 "Q1" H 5291 2896 50  0000 L CNN
F 1 "BC547" H 5291 2805 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 5300 2775 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 5100 2850 50  0001 L CNN
	1    5100 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 625734B8
P 5200 3050
F 0 "#PWR0103" H 5200 2800 50  0001 C CNN
F 1 "GND" H 5205 2877 50  0000 C CNN
F 2 "" H 5200 3050 50  0001 C CNN
F 3 "" H 5200 3050 50  0001 C CNN
	1    5200 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 625734BF
P 4750 2850
F 0 "R1" H 4820 2896 50  0000 L CNN
F 1 "1KΩ" H 4820 2805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4680 2850 50  0001 C CNN
F 3 "~" H 4750 2850 50  0001 C CNN
	1    4750 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 625734C6
P 5200 2500
F 0 "R2" H 5270 2546 50  0000 L CNN
F 1 "1KΩ" H 5270 2455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5130 2500 50  0001 C CNN
F 3 "~" H 5200 2500 50  0001 C CNN
	1    5200 2500
	1    0    0    -1  
$EndComp
Text GLabel 5500 2650 2    50   Input ~ 0
~EN1
Wire Wire Line
	5200 2650 5500 2650
Connection ~ 5200 2650
$Comp
L power:GND #PWR0104
U 1 1 625846A3
P 3550 2450
F 0 "#PWR0104" H 3550 2200 50  0001 C CNN
F 1 "GND" H 3555 2277 50  0000 C CNN
F 2 "" H 3550 2450 50  0001 C CNN
F 3 "" H 3550 2450 50  0001 C CNN
	1    3550 2450
	1    0    0    -1  
$EndComp
Text GLabel 4600 2850 0    50   Input ~ 0
EN1
$Comp
L power:VCC #PWR0105
U 1 1 62591AB9
P 5200 2350
F 0 "#PWR0105" H 5200 2200 50  0001 C CNN
F 1 "VCC" H 5215 2523 50  0000 C CNN
F 2 "" H 5200 2350 50  0001 C CNN
F 3 "" H 5200 2350 50  0001 C CNN
	1    5200 2350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW7
U 1 1 62593E59
P 2150 4850
F 0 "SW7" H 2150 5135 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 5044 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 5050 50  0001 C CNN
F 3 "~" H 2150 5050 50  0001 C CNN
	1    2150 4850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW8
U 1 1 625960E7
P 2150 5500
F 0 "SW8" H 2150 5785 50  0000 C CNN
F 1 "SW_Push_Dual" H 2150 5694 50  0000 C CNN
F 2 "zf_vga_controller:SW_B3F-4050" H 2150 5700 50  0001 C CNN
F 3 "~" H 2150 5700 50  0001 C CNN
	1    2150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5700 1850 5700
Wire Wire Line
	1850 4400 1850 5050
Connection ~ 1850 5700
Wire Wire Line
	1950 5050 1850 5050
Connection ~ 1850 5050
Wire Wire Line
	1850 5050 1850 5700
Wire Wire Line
	1150 2000 1250 2000
NoConn ~ 2350 5050
NoConn ~ 2350 5700
Wire Wire Line
	1150 5500 1950 5500
Text GLabel 3050 1150 0    50   Input ~ 0
1A1
Text GLabel 3050 1250 0    50   Input ~ 0
1A2
Text GLabel 3050 1350 0    50   Input ~ 0
1A3
Text GLabel 3050 1450 0    50   Input ~ 0
1A4
Text GLabel 3050 1850 0    50   Input ~ 0
2A4
Text GLabel 3050 1750 0    50   Input ~ 0
2A3
Text GLabel 3050 1650 0    50   Input ~ 0
2A2
Text GLabel 3050 1550 0    50   Input ~ 0
2A1
Text GLabel 2350 1150 2    50   Input ~ 0
1A1
Text GLabel 2350 1800 2    50   Input ~ 0
1A2
Text GLabel 2350 2400 2    50   Input ~ 0
1A3
Text GLabel 2350 3000 2    50   Input ~ 0
1A4
Text GLabel 2350 5500 2    50   Input ~ 0
2A4
Text GLabel 2350 4850 2    50   Input ~ 0
2A3
Text GLabel 2350 4200 2    50   Input ~ 0
2A2
Text GLabel 2350 3600 2    50   Input ~ 0
2A1
$Comp
L power:VCC #PWR0106
U 1 1 62586918
P 4400 850
F 0 "#PWR0106" H 4400 700 50  0001 C CNN
F 1 "VCC" H 4415 1023 50  0000 C CNN
F 2 "" H 4400 850 50  0001 C CNN
F 3 "" H 4400 850 50  0001 C CNN
	1    4400 850 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC241 U1
U 1 1 6253C189
P 3550 1650
F 0 "U1" H 3550 2631 50  0000 C CNN
F 1 "74HC241" H 3550 2540 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3550 1700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74hc241.pdf?ts=1649544826667&ref_url=https%253A%252F%252Fwww.google.com%252F" H 3550 1700 50  0001 C CNN
	1    3550 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2450 4050 2450
Connection ~ 3550 2450
Wire Wire Line
	4050 2150 4400 2150
Wire Wire Line
	4400 2150 4400 850 
Connection ~ 4400 850 
Wire Wire Line
	3550 850  4400 850 
$Comp
L Connector:DB9_Female J1
U 1 1 625E8A9C
P 5500 1450
F 0 "J1" H 5680 1496 50  0000 L CNN
F 1 "DB9_Female" H 5680 1405 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 5500 1450 50  0001 C CNN
F 3 " ~" H 5500 1450 50  0001 C CNN
	1    5500 1450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 625EBF3C
P 5200 1050
F 0 "#PWR0107" H 5200 900 50  0001 C CNN
F 1 "VCC" H 5215 1223 50  0000 C CNN
F 2 "" H 5200 1050 50  0001 C CNN
F 3 "" H 5200 1050 50  0001 C CNN
	1    5200 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 625ED51D
P 4850 1150
F 0 "#PWR0108" H 4850 900 50  0001 C CNN
F 1 "GND" H 4855 977 50  0000 C CNN
F 2 "" H 4850 1150 50  0001 C CNN
F 3 "" H 4850 1150 50  0001 C CNN
	1    4850 1150
	1    0    0    -1  
$EndComp
Text GLabel 5200 1250 0    50   Input ~ 0
PA0
Text GLabel 5200 1450 0    50   Input ~ 0
PA1
Text GLabel 5200 1650 0    50   Input ~ 0
PA2
Text GLabel 5200 1850 0    50   Input ~ 0
PA3
Text GLabel 5200 1350 0    50   Input ~ 0
EN1
Text GLabel 5200 1550 0    50   Input ~ 0
EN2
NoConn ~ 5200 1750
Wire Wire Line
	5200 1150 4850 1150
$Comp
L Device:R_Network04 RN1
U 1 1 62631E7E
P 950 1350
F 0 "RN1" V 533 1350 50  0000 C CNN
F 1 "R_Network04" V 624 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP5" V 1225 1350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 950 1350 50  0001 C CNN
	1    950  1350
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Network04 RN2
U 1 1 626381AB
P 950 2000
F 0 "RN2" V 533 2000 50  0000 C CNN
F 1 "R_Network04" V 624 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP5" V 1225 2000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 950 2000 50  0001 C CNN
	1    950  2000
	0    -1   1    0   
$EndComp
Wire Wire Line
	1150 2100 1150 5500
Wire Wire Line
	1350 1900 1350 4200
Wire Wire Line
	1450 1800 1450 3600
Wire Wire Line
	1250 2000 1250 4850
Wire Wire Line
	1250 4850 1950 4850
Wire Wire Line
	650  850  650  1150
Wire Wire Line
	650  1150 650  1800
Connection ~ 650  1150
Wire Wire Line
	650  1150 750  1150
Wire Wire Line
	650  1800 750  1800
Text GLabel 1150 1450 2    50   Input ~ 0
SW3
Text GLabel 1150 1350 2    50   Input ~ 0
SW1
Text GLabel 1150 1250 2    50   Input ~ 0
SW2
Text GLabel 1150 1150 2    50   Input ~ 0
SW4
Text GLabel 1750 1150 0    50   Input ~ 0
SW1
Text GLabel 1750 1800 0    50   Input ~ 0
SW2
Connection ~ 1850 2000
Wire Wire Line
	1850 1350 1850 2000
Wire Wire Line
	1950 1150 1750 1150
Text GLabel 1750 2400 0    50   Input ~ 0
SW3
Wire Wire Line
	1750 2400 1950 2400
Text GLabel 1750 3000 0    50   Input ~ 0
SW4
Wire Wire Line
	1750 3000 1950 3000
$EndSCHEMATC
