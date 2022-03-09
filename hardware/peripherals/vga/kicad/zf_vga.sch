EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLegal 14000 8500
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
L power:GND #PWR0123
U 1 1 622538F3
P 4400 5400
F 0 "#PWR0123" H 4400 5150 50  0001 C CNN
F 1 "GND" H 4405 5227 50  0000 C CNN
F 2 "" H 4400 5400 50  0001 C CNN
F 3 "" H 4400 5400 50  0001 C CNN
	1    4400 5400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 4 1 622384DB
P 4900 5000
F 0 "U?" H 4900 5325 50  0001 C CNN
F 1 "74HC00" H 4900 5233 50  0001 C CNN
F 2 "" H 4900 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5000 50  0001 C CNN
	4    4900 5000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0125
U 1 1 62254857
P 5400 5400
F 0 "#PWR0125" H 5400 5250 50  0001 C CNN
F 1 "VCC" H 5415 5573 50  0000 C CNN
F 2 "" H 5400 5400 50  0001 C CNN
F 3 "" H 5400 5400 50  0001 C CNN
	1    5400 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 62186D08
P 4400 3200
F 0 "#PWR0117" H 4400 2950 50  0001 C CNN
F 1 "GND" H 4405 3027 50  0000 C CNN
F 2 "" H 4400 3200 50  0001 C CNN
F 3 "" H 4400 3200 50  0001 C CNN
	1    4400 3200
	1    0    0    -1  
$EndComp
Text Notes 3150 2450 0    50   ~ 0
Line Counter
$Comp
L power:GND #PWR0124
U 1 1 622AB81D
P 7050 2750
F 0 "#PWR0124" H 7050 2500 50  0001 C CNN
F 1 "GND" H 7055 2577 50  0000 C CNN
F 2 "" H 7050 2750 50  0001 C CNN
F 3 "" H 7050 2750 50  0001 C CNN
	1    7050 2750
	1    0    0    -1  
$EndComp
Text GLabel 6550 1550 0    50   Input ~ 0
D3
Text GLabel 6550 1650 0    50   Input ~ 0
D4
Text GLabel 6550 1750 0    50   Input ~ 0
D5
Text GLabel 6550 1850 0    50   Input ~ 0
D6
Text GLabel 6550 1950 0    50   Input ~ 0
D7
$Comp
L power:GND #PWR0129
U 1 1 622758B5
P 7050 5050
F 0 "#PWR0129" H 7050 4800 50  0001 C CNN
F 1 "GND" H 7055 4877 50  0000 C CNN
F 2 "" H 7050 5050 50  0001 C CNN
F 3 "" H 7050 5050 50  0001 C CNN
	1    7050 5050
	1    0    0    -1  
$EndComp
Text GLabel 6550 3650 0    50   Input ~ 0
A2
Text GLabel 6550 3550 0    50   Input ~ 0
A1
Text GLabel 6550 3450 0    50   Input ~ 0
A0
Text GLabel 6550 4350 0    50   Input ~ 0
A9
Text GLabel 6550 4450 0    50   Input ~ 0
A10
Text GLabel 6550 4250 0    50   Input ~ 0
A8
Text GLabel 6550 4150 0    50   Input ~ 0
A7
Text GLabel 6550 4050 0    50   Input ~ 0
A6
Text GLabel 6550 3950 0    50   Input ~ 0
A5
Text GLabel 6550 3850 0    50   Input ~ 0
A4
Text GLabel 6550 3750 0    50   Input ~ 0
A3
Text GLabel 6550 1450 0    50   Input ~ 0
D2
Text GLabel 6550 1350 0    50   Input ~ 0
D1
$Comp
L power:VCC #PWR0103
U 1 1 621BD50A
P 7300 850
F 0 "#PWR0103" H 7300 700 50  0001 C CNN
F 1 "VCC" H 7315 1023 50  0000 C CNN
F 2 "" H 7300 850 50  0001 C CNN
F 3 "" H 7300 850 50  0001 C CNN
	1    7300 850 
	1    0    0    -1  
$EndComp
Text Notes 7100 5050 0    50   ~ 0
SRAM
Wire Wire Line
	7300 850  7050 850 
Wire Wire Line
	6550 4550 6450 4550
$Comp
L power:VCC #PWR0137
U 1 1 62317BEF
P 7300 3250
F 0 "#PWR0137" H 7300 3100 50  0001 C CNN
F 1 "VCC" H 7315 3423 50  0000 C CNN
F 2 "" H 7300 3250 50  0001 C CNN
F 3 "" H 7300 3250 50  0001 C CNN
	1    7300 3250
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:AS6C6264 U?
U 1 1 62268A82
P 7050 4150
F 0 "U?" H 7050 5231 50  0000 C CNN
F 1 "AS6C6264" H 7050 5140 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7050 4050 50  0001 C CNN
F 3 "https://www.futurlec.com/Datasheet/Memory/62256.pdf" H 7050 4050 50  0001 C CNN
	1    7050 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3250 7300 3250
$Comp
L 74xx:74HC165 U?
U 1 1 622A653B
P 7050 1750
F 0 "U?" H 7050 2831 50  0000 C CNN
F 1 "74HC165" H 7050 2740 50  0000 C CNN
F 2 "" H 7050 1750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT165.pdf" H 7050 1750 50  0001 C CNN
	1    7050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4350 7600 4350
Wire Wire Line
	7600 4350 7600 4750
$Comp
L 74xx:74HC04 U?
U 1 1 62230D93
P 4900 1050
F 0 "U?" H 4900 1367 50  0000 C CNN
F 1 "74HC14" H 4900 1276 50  0000 C CNN
F 2 "" H 4900 1050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 1050 50  0001 C CNN
	1    4900 1050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 2 1 622331B8
P 4900 1400
F 0 "U?" H 4900 1717 50  0001 C CNN
F 1 "74HC04" H 4900 1626 50  0001 C CNN
F 2 "" H 4900 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 1400 50  0001 C CNN
	2    4900 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 4 1 62235EDC
P 4900 2100
F 0 "U?" H 4900 2417 50  0001 C CNN
F 1 "74HC04" H 4900 2326 50  0001 C CNN
F 2 "" H 4900 2100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 2100 50  0001 C CNN
	4    4900 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 5 1 62237D89
P 4900 2450
F 0 "U?" H 4900 2767 50  0001 C CNN
F 1 "74HC04" H 4900 2676 50  0001 C CNN
F 2 "" H 4900 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 2450 50  0001 C CNN
	5    4900 2450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0118
U 1 1 62188C3D
P 5400 3200
F 0 "#PWR0118" H 5400 3050 50  0001 C CNN
F 1 "VCC" H 5415 3373 50  0000 C CNN
F 2 "" H 5400 3200 50  0001 C CNN
F 3 "" H 5400 3200 50  0001 C CNN
	1    5400 3200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 7 1 6223AE39
P 4900 3200
F 0 "U?" V 4625 3200 50  0001 C CNN
F 1 "74HC04" V 4624 3200 50  0001 C CNN
F 2 "" H 4900 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 3200 50  0001 C CNN
	7    4900 3200
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC04 U?
U 3 1 62234980
P 4900 1750
F 0 "U?" H 4900 2067 50  0001 C CNN
F 1 "74HC04" H 4900 1976 50  0001 C CNN
F 2 "" H 4900 1750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 1750 50  0001 C CNN
	3    4900 1750
	1    0    0    -1  
$EndComp
NoConn ~ 7550 1250
$Comp
L 74xx:74HC00 U?
U 3 1 62236D7F
P 4900 4650
F 0 "U?" H 4900 4975 50  0001 C CNN
F 1 "74HC00" H 4900 4883 50  0001 C CNN
F 2 "" H 4900 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4650 50  0001 C CNN
	3    4900 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 6223A0D4
P 4900 5400
F 0 "U?" V 4625 5400 50  0001 C CNN
F 1 "74HC00" V 4624 5400 50  0001 C CNN
F 2 "" H 4900 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5400 50  0001 C CNN
	5    4900 5400
	0    1    1    0   
$EndComp
Connection ~ 7050 2750
Wire Wire Line
	7050 2750 6550 2750
Wire Wire Line
	6550 2750 6550 2450
Text GLabel 6550 2150 0    50   Input ~ 0
#LDPULSE
$Comp
L power:GND #PWR0104
U 1 1 62221546
P 6250 1150
F 0 "#PWR0104" H 6250 900 50  0001 C CNN
F 1 "GND" H 6255 977 50  0000 C CNN
F 2 "" H 6250 1150 50  0001 C CNN
F 3 "" H 6250 1150 50  0001 C CNN
	1    6250 1150
	1    0    0    -1  
$EndComp
Text GLabel 6550 1250 0    50   Input ~ 0
D0
Wire Wire Line
	6250 1150 6550 1150
Wire Wire Line
	4500 7600 4450 7600
Text GLabel 4400 7000 0    50   Input ~ 0
P3
Text GLabel 5200 6900 2    50   Input ~ 0
WRDY
$Comp
L 74xx:74HC74 U?
U 2 1 6243AADD
P 4900 7000
F 0 "U?" H 4900 7481 50  0001 C CNN
F 1 "74HC74" H 4900 7389 50  0001 C CNN
F 2 "" H 4900 7000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4900 7000 50  0001 C CNN
	2    4900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 6700 4900 6700
Wire Wire Line
	5650 6700 5650 7300
Wire Wire Line
	5300 7600 5650 7600
$Comp
L power:VCC #PWR0143
U 1 1 6244F9AC
P 5650 6000
F 0 "#PWR0143" H 5650 5850 50  0001 C CNN
F 1 "VCC" H 5665 6173 50  0000 C CNN
F 2 "" H 5650 6000 50  0001 C CNN
F 3 "" H 5650 6000 50  0001 C CNN
	1    5650 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 6000 5650 6700
Connection ~ 5650 6700
Wire Wire Line
	4900 7300 5650 7300
Connection ~ 5650 7300
Wire Wire Line
	5650 7300 5650 7600
NoConn ~ 5200 7100
NoConn ~ 5200 5000
Text Notes 5150 7250 0    50   ~ 0
Write ready
Text GLabel 5250 6400 2    50   Input ~ 0
#HSYNC
Text GLabel 4400 6900 0    50   Input ~ 0
DATARDY
$Comp
L 4xxx:4040 U?
U 1 1 622EEB18
P 3100 1650
F 0 "U?" H 3100 2631 50  0000 C CNN
F 1 "4040" H 3100 2540 50  0000 C CNN
F 2 "" H 3100 1650 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4020bms-24bms-40bms.pdf" H 3100 1650 50  0001 C CNN
	1    3100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 622EEB1E
P 3100 2550
F 0 "#PWR0106" H 3100 2300 50  0001 C CNN
F 1 "GND" V 3105 2422 50  0000 R CNN
F 2 "" H 3100 2550 50  0001 C CNN
F 3 "" H 3100 2550 50  0001 C CNN
	1    3100 2550
	1    0    0    -1  
$EndComp
Text GLabel 3600 1850 2    50   Input ~ 0
L7
Text GLabel 3600 1750 2    50   Input ~ 0
L6
Text GLabel 3600 1650 2    50   Input ~ 0
L5
Text GLabel 3600 1550 2    50   Input ~ 0
L4
Text GLabel 3600 1450 2    50   Input ~ 0
L3
Text GLabel 3600 1350 2    50   Input ~ 0
L2
Text GLabel 3600 1250 2    50   Input ~ 0
L1
Text GLabel 3600 1150 2    50   Input ~ 0
L0
Text GLabel 3600 1950 2    50   Input ~ 0
L8
Text GLabel 3600 2050 2    50   Input ~ 0
L9
Text GLabel 2600 1450 0    50   Input ~ 0
LRESET
Wire Wire Line
	3350 850  3100 850 
$Comp
L power:VCC #PWR0107
U 1 1 622FC55E
P 3350 850
F 0 "#PWR0107" H 3350 700 50  0001 C CNN
F 1 "VCC" H 3365 1023 50  0000 C CNN
F 2 "" H 3350 850 50  0001 C CNN
F 3 "" H 3350 850 50  0001 C CNN
	1    3350 850 
	1    0    0    -1  
$EndComp
NoConn ~ 3600 2150
NoConn ~ 3600 2250
$Comp
L power:GND #PWR0108
U 1 1 622CDEF0
P 1450 2550
F 0 "#PWR0108" H 1450 2300 50  0001 C CNN
F 1 "GND" V 1455 2422 50  0000 R CNN
F 2 "" H 1450 2550 50  0001 C CNN
F 3 "" H 1450 2550 50  0001 C CNN
	1    1450 2550
	1    0    0    -1  
$EndComp
Text GLabel 950  1150 0    50   Input ~ 0
CLOCK
NoConn ~ 1950 2250
NoConn ~ 1950 2150
$Comp
L 4xxx:4040 U?
U 1 1 622BB2E9
P 1450 1650
F 0 "U?" H 1450 2631 50  0000 C CNN
F 1 "4040" H 1450 2540 50  0000 C CNN
F 2 "" H 1450 1650 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4020bms-24bms-40bms.pdf" H 1450 1650 50  0001 C CNN
	1    1450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 850  1450 850 
$Comp
L power:VCC #PWR0115
U 1 1 621DFC25
P 1700 850
F 0 "#PWR0115" H 1700 700 50  0001 C CNN
F 1 "VCC" H 1715 1023 50  0000 C CNN
F 2 "" H 1700 850 50  0001 C CNN
F 3 "" H 1700 850 50  0001 C CNN
	1    1700 850 
	1    0    0    -1  
$EndComp
Text GLabel 1950 1950 2    50   Input ~ 0
P8
Text GLabel 1950 2050 2    50   Input ~ 0
P9
Text GLabel 1950 1850 2    50   Input ~ 0
P7
Text GLabel 1950 1750 2    50   Input ~ 0
P6
Text GLabel 1950 1650 2    50   Input ~ 0
P5
Text GLabel 1950 1550 2    50   Input ~ 0
P4
Text GLabel 1950 1450 2    50   Input ~ 0
P3
Text GLabel 1950 1350 2    50   Input ~ 0
P2
Text GLabel 1950 1250 2    50   Input ~ 0
P1
Text GLabel 1950 1150 2    50   Input ~ 0
P0
$Comp
L 74xx:74HC04 U?
U 6 1 622397DE
P 4900 2800
F 0 "U?" H 4900 3025 50  0001 C CNN
F 1 "74HC04" H 4900 3026 50  0001 C CNN
F 2 "" H 4900 2800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 2800 50  0001 C CNN
	6    4900 2800
	1    0    0    -1  
$EndComp
Text GLabel 950  1450 0    50   Input ~ 0
PRESET
Wire Wire Line
	4600 4900 4400 4900
Wire Wire Line
	4400 4900 4400 5100
Connection ~ 4400 5400
Wire Wire Line
	4600 5100 4400 5100
Connection ~ 4400 5100
Wire Wire Line
	4400 5100 4400 5400
Text GLabel 4600 2800 0    50   Input ~ 0
P1
Text GLabel 5200 2800 2    50   Input ~ 0
#P1
Text GLabel 6550 2350 0    50   Input ~ 0
#P1
Wire Wire Line
	5250 6400 5200 6400
$Comp
L 74xx:74HC00 U?
U 1 1 6222CFFF
P 4900 3950
F 0 "U?" H 4900 4275 50  0000 C CNN
F 1 "74HC00" H 4900 4184 50  0000 C CNN
F 2 "" H 4900 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 3950 50  0001 C CNN
	1    4900 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 62235607
P 4900 4300
F 0 "U?" H 4900 4533 50  0001 C CNN
F 1 "74HC00" H 4900 4534 50  0001 C CNN
F 2 "" H 4900 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4300 50  0001 C CNN
	2    4900 4300
	1    0    0    -1  
$EndComp
Text GLabel 4600 4750 0    50   Input ~ 0
#LDPULSE
Text GLabel 4600 4550 0    50   Input ~ 0
#LD
Text GLabel 5800 3950 2    50   Input ~ 0
PRMS
$Comp
L Device:C_Small C?
U 1 1 6235FCD8
P 5300 3950
F 0 "C?" V 5529 3950 50  0001 C CNN
F 1 "C_Small" V 5437 3950 50  0001 C CNN
F 2 "" H 5300 3950 50  0001 C CNN
F 3 "~" H 5300 3950 50  0001 C CNN
	1    5300 3950
	0    -1   -1   0   
$EndComp
Text Notes 5100 4100 0    50   ~ 0
#PRESET pulse
Text GLabel 5800 4300 2    50   Input ~ 0
LRMS
Text Notes 5050 4450 0    50   ~ 0
#LRESET pulse
$Comp
L Device:C_Small C?
U 1 1 623621DE
P 5300 4300
F 0 "C?" V 5529 4300 50  0001 C CNN
F 1 "C_Small" V 5437 4300 50  0001 C CNN
F 2 "" H 5300 4300 50  0001 C CNN
F 3 "~" H 5300 4300 50  0001 C CNN
	1    5300 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 623D14EC
P 5300 4650
F 0 "C?" V 5529 4650 50  0001 C CNN
F 1 "C_Small" V 5437 4650 50  0001 C CNN
F 2 "" H 5300 4650 50  0001 C CNN
F 3 "~" H 5300 4650 50  0001 C CNN
	1    5300 4650
	0    -1   -1   0   
$EndComp
Text Notes 5050 4800 0    50   ~ 0
#LOAD pulse
Text GLabel 4600 4050 0    50   Input ~ 0
#PRPULSE
Text GLabel 4600 3850 0    50   Input ~ 0
#PRESET
Text GLabel 4600 4400 0    50   Input ~ 0
#LRPULSE
Text GLabel 4600 4200 0    50   Input ~ 0
#LRESET
Text GLabel 4600 1050 0    50   Input ~ 0
PRMS
Text GLabel 5200 1050 2    50   Input ~ 0
#PRPULSE
Text GLabel 4600 1400 0    50   Input ~ 0
#PRPULSE
Text GLabel 5200 1400 2    50   Input ~ 0
PRESET
Text GLabel 4600 1750 0    50   Input ~ 0
LRMS
Text GLabel 5200 1750 2    50   Input ~ 0
#LRPULSE
Text GLabel 4600 2100 0    50   Input ~ 0
#LRPULSE
Text GLabel 5200 2100 2    50   Input ~ 0
LRESET
Text GLabel 5200 2450 2    50   Input ~ 0
#LDPULSE
Text GLabel 5800 4650 2    50   Input ~ 0
LDMS
Text GLabel 4600 2450 0    50   Input ~ 0
LDMS
Text GLabel 4400 6600 0    50   Input ~ 0
#HRESET
Text GLabel 4400 6000 0    50   Input ~ 0
#HSET
Wire Wire Line
	4400 6600 4900 6600
Wire Wire Line
	4400 6000 4900 6000
Wire Wire Line
	4400 6900 4600 6900
Wire Wire Line
	4600 7000 4400 7000
Wire Wire Line
	4600 6200 4600 6300
$Comp
L power:GND #PWR0132
U 1 1 6244E28C
P 4450 7600
F 0 "#PWR0132" H 4450 7350 50  0001 C CNN
F 1 "GND" H 4455 7427 50  0000 C CNN
F 2 "" H 4450 7600 50  0001 C CNN
F 3 "" H 4450 7600 50  0001 C CNN
	1    4450 7600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U?
U 3 1 6243E965
P 4900 7600
F 0 "U?" V 4625 7600 50  0001 C CNN
F 1 "74HC74" V 4624 7600 50  0001 C CNN
F 2 "" H 4900 7600 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4900 7600 50  0001 C CNN
	3    4900 7600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 6239333A
P 4450 6300
F 0 "#PWR0109" H 4450 6050 50  0001 C CNN
F 1 "GND" H 4455 6127 50  0000 C CNN
F 2 "" H 4450 6300 50  0001 C CNN
F 3 "" H 4450 6300 50  0001 C CNN
	1    4450 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6300 4450 6300
NoConn ~ 5200 6200
Text GLabel 2600 1150 0    50   Input ~ 0
#PRESET
Wire Wire Line
	7650 4650 7550 4650
Wire Wire Line
	7650 4550 7550 4550
Text GLabel 7650 4650 2    50   Input ~ 0
CE2
Text GLabel 7650 4550 2    50   Input ~ 0
#WE
Wire Wire Line
	7650 4450 7550 4450
Text GLabel 7650 4450 2    50   Input ~ 0
#OE
$Comp
L power:GND #PWR0130
U 1 1 6227127D
P 7600 4750
F 0 "#PWR0130" H 7600 4500 50  0001 C CNN
F 1 "GND" H 7605 4577 50  0000 C CNN
F 2 "" H 7600 4750 50  0001 C CNN
F 3 "" H 7600 4750 50  0001 C CNN
	1    7600 4750
	1    0    0    -1  
$EndComp
Text GLabel 7550 4150 2    50   Input ~ 0
D7
Text GLabel 7550 4050 2    50   Input ~ 0
D6
Text GLabel 7550 3950 2    50   Input ~ 0
D5
Text GLabel 7550 3850 2    50   Input ~ 0
D4
Text GLabel 7550 3750 2    50   Input ~ 0
D3
Text GLabel 7550 3650 2    50   Input ~ 0
D2
Text GLabel 7550 3550 2    50   Input ~ 0
D1
Text GLabel 7550 3450 2    50   Input ~ 0
D0
Text GLabel 7000 5550 0    50   Input ~ 0
PA0
Text GLabel 7000 5650 0    50   Input ~ 0
PA5
$Comp
L power:VCC #PWR0116
U 1 1 622CFD96
P 6650 5850
F 0 "#PWR0116" H 6650 5700 50  0001 C CNN
F 1 "VCC" H 6665 6023 50  0000 C CNN
F 2 "" H 6650 5850 50  0001 C CNN
F 3 "" H 6650 5850 50  0001 C CNN
	1    6650 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 5850 6650 5850
Wire Wire Line
	7000 6050 6650 6050
$Comp
L power:GND #PWR0135
U 1 1 622D919E
P 6650 6050
F 0 "#PWR0135" H 6650 5800 50  0001 C CNN
F 1 "GND" H 6655 5877 50  0000 C CNN
F 2 "" H 6650 6050 50  0001 C CNN
F 3 "" H 6650 6050 50  0001 C CNN
	1    6650 6050
	1    0    0    -1  
$EndComp
Text GLabel 7000 5750 0    50   Input ~ 0
PA1
Text GLabel 7000 5950 0    50   Input ~ 0
PA2
Text GLabel 7000 6150 0    50   Input ~ 0
PA3
Text GLabel 7000 6350 0    50   Input ~ 0
PA4
Text GLabel 7000 6250 0    50   Input ~ 0
PC5
$Comp
L Connector:DB9_Female JOY1
U 1 1 6228DB8D
P 7300 5950
F 0 "JOY1" H 7480 5996 50  0000 L CNN
F 1 "DB9_Male" H 7480 5905 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 7300 5950 50  0001 C CNN
F 3 " ~" H 7300 5950 50  0001 C CNN
	1    7300 5950
	1    0    0    -1  
$EndComp
Text Notes 1500 2450 0    50   ~ 0
Pixel Counter
Wire Wire Line
	5400 3950 5750 3950
$Comp
L Device:R R?
U 1 1 6234883C
P 5750 4100
F 0 "R?" H 5820 4146 50  0000 L CNN
F 1 "R" H 5820 4055 50  0000 L CNN
F 2 "" V 5680 4100 50  0001 C CNN
F 3 "~" H 5750 4100 50  0001 C CNN
	1    5750 4100
	1    0    0    -1  
$EndComp
Connection ~ 5750 3950
Wire Wire Line
	5750 3950 5800 3950
$Comp
L Device:R R?
U 1 1 6234A634
P 5750 4450
F 0 "R?" H 5820 4496 50  0000 L CNN
F 1 "R" H 5820 4405 50  0000 L CNN
F 2 "" V 5680 4450 50  0001 C CNN
F 3 "~" H 5750 4450 50  0001 C CNN
	1    5750 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6234C805
P 5750 4800
F 0 "R?" H 5820 4846 50  0000 L CNN
F 1 "R" H 5820 4755 50  0000 L CNN
F 2 "" V 5680 4800 50  0001 C CNN
F 3 "~" H 5750 4800 50  0001 C CNN
	1    5750 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4250 5650 4250
$Comp
L power:GND #PWR0140
U 1 1 62357B9C
P 5650 5400
F 0 "#PWR0140" H 5650 5150 50  0001 C CNN
F 1 "GND" H 5655 5227 50  0000 C CNN
F 2 "" H 5650 5400 50  0001 C CNN
F 3 "" H 5650 5400 50  0001 C CNN
	1    5650 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4250 5650 4600
Wire Wire Line
	5400 4300 5750 4300
Wire Wire Line
	5750 4300 5800 4300
Connection ~ 5750 4300
Wire Wire Line
	5400 4650 5750 4650
Wire Wire Line
	5800 4650 5750 4650
Connection ~ 5750 4650
Wire Wire Line
	5750 4600 5650 4600
Connection ~ 5650 4600
Wire Wire Line
	5650 4600 5650 4950
Wire Wire Line
	5750 4950 5650 4950
Connection ~ 5650 4950
Wire Wire Line
	5650 4950 5650 5400
Connection ~ 4600 6300
$Comp
L 74xx:74HC74 U?
U 1 1 62437D41
P 4900 6300
F 0 "U?" H 4900 6781 50  0000 C CNN
F 1 "74HC74" H 4900 6690 50  0000 C CNN
F 2 "" H 4900 6300 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4900 6300 50  0001 C CNN
	1    4900 6300
	1    0    0    -1  
$EndComp
Text Notes 5150 6650 0    50   ~ 0
~HSYNC
Connection ~ 7050 5050
Wire Wire Line
	6450 5050 7050 5050
Text Notes 7100 2650 0    50   ~ 0
Video Output
$Comp
L Connector:DB9_Female JOY2
U 1 1 62425F5D
P 9050 5950
F 0 "JOY2" H 9230 5996 50  0000 L CNN
F 1 "DB9_Male" H 9230 5905 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 9050 5950 50  0001 C CNN
F 3 " ~" H 9050 5950 50  0001 C CNN
	1    9050 5950
	1    0    0    -1  
$EndComp
Text Notes 8200 6500 0    50   ~ 0
Controller Port 2
Text Notes 6450 6500 0    50   ~ 0
Controller Port 1
Text Notes 8850 4950 0    50   ~ 0
Lower Write Address Buffer
Text Notes 10500 4950 0    50   ~ 0
Upper Write Address Buffer
Text GLabel 8750 6250 0    50   Input ~ 0
PC6
Text GLabel 8750 6350 0    50   Input ~ 0
PA4
Text GLabel 8750 6150 0    50   Input ~ 0
PA3
Text GLabel 8750 5950 0    50   Input ~ 0
PA2
Text GLabel 8750 5750 0    50   Input ~ 0
PA1
Text GLabel 8750 5650 0    50   Input ~ 0
PA5
Text GLabel 8750 5550 0    50   Input ~ 0
PA0
$Comp
L power:GND #PWR0139
U 1 1 622E4CA3
P 8400 6050
F 0 "#PWR0139" H 8400 5800 50  0001 C CNN
F 1 "GND" H 8405 5877 50  0000 C CNN
F 2 "" H 8400 6050 50  0001 C CNN
F 3 "" H 8400 6050 50  0001 C CNN
	1    8400 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 6050 8400 6050
Wire Wire Line
	8750 5850 8400 5850
$Comp
L power:VCC #PWR0136
U 1 1 622E4C9B
P 8400 5850
F 0 "#PWR0136" H 8400 5700 50  0001 C CNN
F 1 "VCC" H 8415 6023 50  0000 C CNN
F 2 "" H 8400 5850 50  0001 C CNN
F 3 "" H 8400 5850 50  0001 C CNN
	1    8400 5850
	1    0    0    -1  
$EndComp
Text GLabel 10700 2400 2    50   Input ~ 0
PC6
Text GLabel 10700 2500 2    50   Input ~ 0
PC5
Wire Wire Line
	9850 1100 10200 1100
Wire Wire Line
	9850 1100 9850 1800
NoConn ~ 10700 2300
Text GLabel 10700 3000 2    50   Input ~ 0
PC0
Text GLabel 10700 2900 2    50   Input ~ 0
PC1
Text GLabel 10700 2800 2    50   Input ~ 0
PC2
Text GLabel 10200 2200 0    50   Input ~ 0
PB0
Text GLabel 10200 2100 0    50   Input ~ 0
PB1
Text GLabel 10200 2000 0    50   Input ~ 0
PB2
Text GLabel 10200 1900 0    50   Input ~ 0
PB3
NoConn ~ 10700 1200
NoConn ~ 10700 1300
NoConn ~ 10700 1400
NoConn ~ 10200 1400
NoConn ~ 10200 1300
Text GLabel 10200 1200 0    50   Input ~ 0
#INT
Connection ~ 11000 1100
Wire Wire Line
	11000 1100 10700 1100
Wire Wire Line
	11000 1800 10700 1800
Wire Wire Line
	11000 1100 11000 1800
$Comp
L power:GND #PWR0114
U 1 1 622D7A61
P 9850 1800
F 0 "#PWR0114" H 9850 1550 50  0001 C CNN
F 1 "GND" H 9855 1627 50  0000 C CNN
F 2 "" H 9850 1800 50  0001 C CNN
F 3 "" H 9850 1800 50  0001 C CNN
	1    9850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0112
U 1 1 622CC803
P 11000 1100
F 0 "#PWR0112" H 11000 950 50  0001 C CNN
F 1 "VCC" H 11015 1273 50  0000 C CNN
F 2 "" H 11000 1100 50  0001 C CNN
F 3 "" H 11000 1100 50  0001 C CNN
	1    11000 1100
	1    0    0    -1  
$EndComp
NoConn ~ 10700 2700
Text GLabel 10700 2600 2    50   Input ~ 0
DATARDY
Text GLabel 10950 3750 2    50   Input ~ 0
A8
Text GLabel 10950 3950 2    50   Input ~ 0
A10
Text GLabel 10950 3850 2    50   Input ~ 0
A9
$Comp
L power:VCC #PWR0138
U 1 1 6231FF13
P 10700 3450
F 0 "#PWR0138" H 10700 3300 50  0001 C CNN
F 1 "VCC" H 10715 3623 50  0000 C CNN
F 2 "" H 10700 3450 50  0001 C CNN
F 3 "" H 10700 3450 50  0001 C CNN
	1    10700 3450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0142
U 1 1 6231A022
P 9050 3450
F 0 "#PWR0142" H 9050 3300 50  0001 C CNN
F 1 "VCC" H 9065 3623 50  0000 C CNN
F 2 "" H 9050 3450 50  0001 C CNN
F 3 "" H 9050 3450 50  0001 C CNN
	1    9050 3450
	1    0    0    -1  
$EndComp
Text GLabel 9300 3950 2    50   Input ~ 0
A2
Text GLabel 9300 3850 2    50   Input ~ 0
A1
Text GLabel 9300 3750 2    50   Input ~ 0
A0
Text GLabel 9300 4450 2    50   Input ~ 0
A7
Text GLabel 9300 4350 2    50   Input ~ 0
A6
Text GLabel 9300 4250 2    50   Input ~ 0
A5
Text GLabel 9300 4150 2    50   Input ~ 0
A4
Text GLabel 9300 4050 2    50   Input ~ 0
A3
Wire Wire Line
	10450 3450 10700 3450
NoConn ~ 10950 4050
NoConn ~ 10950 4150
NoConn ~ 10950 4250
NoConn ~ 10950 4350
NoConn ~ 10950 4450
Wire Wire Line
	8800 3450 9050 3450
$Comp
L 74xx:74HC541 U?
U 1 1 62242671
P 8800 4250
F 0 "U?" H 8800 5231 50  0000 C CNN
F 1 "74HC541" H 8800 5140 50  0000 C CNN
F 2 "" H 8800 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 8800 4250 50  0001 C CNN
	1    8800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4750 8300 5050
Wire Wire Line
	9950 4750 9950 5050
Wire Wire Line
	9750 4050 9950 4050
$Comp
L power:GND #PWR0111
U 1 1 622324B0
P 9750 4050
F 0 "#PWR0111" H 9750 3800 50  0001 C CNN
F 1 "GND" H 9755 3877 50  0000 C CNN
F 2 "" H 9750 4050 50  0001 C CNN
F 3 "" H 9750 4050 50  0001 C CNN
	1    9750 4050
	1    0    0    -1  
$EndComp
Text GLabel 8300 4650 0    50   Input ~ 0
#WE
Text GLabel 9950 4650 0    50   Input ~ 0
#WE
Text GLabel 9950 3750 0    50   Input ~ 0
PC0
Text GLabel 9950 3850 0    50   Input ~ 0
PC1
Text GLabel 9950 3950 0    50   Input ~ 0
PC2
Text GLabel 8300 3750 0    50   Input ~ 0
PB0
Text GLabel 8300 3850 0    50   Input ~ 0
PB1
Text GLabel 8300 3950 0    50   Input ~ 0
PB2
Text GLabel 8300 4050 0    50   Input ~ 0
PB3
Text GLabel 8300 4450 0    50   Input ~ 0
PB7
Text GLabel 8300 4350 0    50   Input ~ 0
PB6
Text GLabel 8300 4250 0    50   Input ~ 0
PB5
Text GLabel 8300 4150 0    50   Input ~ 0
PB4
Connection ~ 8800 5050
Text GLabel 10700 1900 2    50   Input ~ 0
PB4
Text GLabel 10700 2000 2    50   Input ~ 0
PB5
Text GLabel 10700 2100 2    50   Input ~ 0
PB6
Text GLabel 10700 2200 2    50   Input ~ 0
PB7
Text GLabel 8300 1850 0    50   Input ~ 0
PA7
Text GLabel 8300 1750 0    50   Input ~ 0
PA6
Text GLabel 8300 1650 0    50   Input ~ 0
PA5
Text GLabel 8300 1550 0    50   Input ~ 0
PA4
Text GLabel 8300 1450 0    50   Input ~ 0
PA3
Text GLabel 8300 1350 0    50   Input ~ 0
PA2
Text GLabel 8300 1250 0    50   Input ~ 0
PA1
Text GLabel 8300 1150 0    50   Input ~ 0
PA0
Text GLabel 10200 2300 0    50   Input ~ 0
PA7
Text GLabel 10200 2400 0    50   Input ~ 0
PA6
Text GLabel 10200 2500 0    50   Input ~ 0
PA5
Text GLabel 10200 2600 0    50   Input ~ 0
PA4
Text GLabel 10200 2700 0    50   Input ~ 0
PA3
Text GLabel 10200 2800 0    50   Input ~ 0
PA2
Text GLabel 10200 2900 0    50   Input ~ 0
PA1
Text GLabel 10200 3000 0    50   Input ~ 0
PA0
Text GLabel 8300 2050 0    50   Input ~ 0
#WE
$Comp
L power:GND #PWR0105
U 1 1 6228001F
P 10450 5050
F 0 "#PWR0105" H 10450 4800 50  0001 C CNN
F 1 "GND" H 10455 4877 50  0000 C CNN
F 2 "" H 10450 5050 50  0001 C CNN
F 3 "" H 10450 5050 50  0001 C CNN
	1    10450 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 5050 10450 5050
Wire Wire Line
	8300 5050 8800 5050
Wire Wire Line
	8800 5100 8800 5050
Connection ~ 8800 2450
Wire Wire Line
	8300 2450 8800 2450
Wire Wire Line
	8300 2150 8300 2450
$Comp
L 74xx:74HC541 U?
U 1 1 621F0C97
P 8800 1650
F 0 "U?" H 8800 2631 50  0000 C CNN
F 1 "74HC541" H 8800 2540 50  0000 C CNN
F 2 "" H 8800 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 8800 1650 50  0001 C CNN
	1    8800 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 621F0C8A
P 8800 2450
F 0 "#PWR0133" H 8800 2200 50  0001 C CNN
F 1 "GND" H 8805 2277 50  0000 C CNN
F 2 "" H 8800 2450 50  0001 C CNN
F 3 "" H 8800 2450 50  0001 C CNN
	1    8800 2450
	1    0    0    -1  
$EndComp
NoConn ~ 10150 5900
Text Notes 10050 3150 0    50   ~ 0
Z-Fighter Connectors
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J?
U 1 1 621FEB7B
P 10400 2400
F 0 "J?" H 10450 3217 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 10450 3126 50  0000 C CNN
F 2 "" H 10400 2400 50  0001 C CNN
F 3 "~" H 10400 2400 50  0001 C CNN
	1    10400 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 622D3D47
P 8800 5100
F 0 "#PWR0134" H 8800 4850 50  0001 C CNN
F 1 "GND" H 8805 4927 50  0000 C CNN
F 2 "" H 8800 5100 50  0001 C CNN
F 3 "" H 8800 5100 50  0001 C CNN
	1    8800 5100
	1    0    0    -1  
$EndComp
Text GLabel 9300 1150 2    50   Input ~ 0
D0
Text GLabel 9300 1250 2    50   Input ~ 0
D1
Text GLabel 9300 1350 2    50   Input ~ 0
D2
Text GLabel 9300 1850 2    50   Input ~ 0
D7
Text GLabel 9300 1750 2    50   Input ~ 0
D6
Text GLabel 9300 1650 2    50   Input ~ 0
D5
Text GLabel 9300 1550 2    50   Input ~ 0
D4
Text GLabel 9300 1450 2    50   Input ~ 0
D3
Text Notes 8850 2350 0    50   ~ 0
Write Data Buffer
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 622099D9
P 10400 1200
F 0 "J?" H 10450 1517 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 10450 1426 50  0000 C CNN
F 2 "" H 10400 1200 50  0001 C CNN
F 3 "~" H 10400 1200 50  0001 C CNN
	1    10400 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 850  8800 850 
$Comp
L power:VCC #PWR0131
U 1 1 621F0C91
P 9050 850
F 0 "#PWR0131" H 9050 700 50  0001 C CNN
F 1 "VCC" H 9065 1023 50  0000 C CNN
F 2 "" H 9050 850 50  0001 C CNN
F 3 "" H 9050 850 50  0001 C CNN
	1    9050 850 
	1    0    0    -1  
$EndComp
Text GLabel 10850 6150 2    50   Input ~ 0
CLOCK
Wire Wire Line
	10750 6150 10850 6150
Wire Wire Line
	10750 5950 10750 6150
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 6203895A
P 10450 5950
F 0 "X?" H 10794 5996 50  0000 L CNN
F 1 "CXO_DIP14" H 10794 5905 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 10900 5600 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 10350 5950 50  0001 C CNN
	1    10450 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 62042787
P 10450 6250
F 0 "#PWR0102" H 10450 6000 50  0001 C CNN
F 1 "GND" H 10455 6077 50  0000 C CNN
F 2 "" H 10450 6250 50  0001 C CNN
F 3 "" H 10450 6250 50  0001 C CNN
	1    10450 6250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 6204084C
P 10450 5650
F 0 "#PWR0101" H 10450 5500 50  0001 C CNN
F 1 "VCC" H 10465 5823 50  0000 C CNN
F 2 "" H 10450 5650 50  0001 C CNN
F 3 "" H 10450 5650 50  0001 C CNN
	1    10450 5650
	1    0    0    -1  
$EndComp
Text Notes 10550 6300 0    50   ~ 0
25.175 MHz Oscillator
Connection ~ 10450 5050
$Comp
L 74xx:74HC541 U?
U 1 1 62245D6C
P 10450 4250
F 0 "U?" H 10450 5231 50  0000 C CNN
F 1 "74HC541" H 10450 5140 50  0000 C CNN
F 2 "" H 10450 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 10450 4250 50  0001 C CNN
	1    10450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4550 6450 4650
Wire Wire Line
	6550 4650 6450 4650
Connection ~ 6450 4650
Wire Wire Line
	6450 4650 6450 5050
Wire Wire Line
	9950 4050 9950 4150
Connection ~ 9950 4050
Wire Wire Line
	9950 4250 9950 4150
Connection ~ 9950 4150
Wire Wire Line
	9950 4250 9950 4350
Connection ~ 9950 4250
Wire Wire Line
	9950 4350 9950 4450
Connection ~ 9950 4350
Text GLabel 2500 6400 0    50   Input ~ 0
#OE
Text GLabel 850  6400 0    50   Input ~ 0
#OE
NoConn ~ 1950 4000
Text GLabel 1950 3900 2    50   Input ~ 0
#HRESET
NoConn ~ 3600 3700
NoConn ~ 3600 3800
Text GLabel 3600 4000 2    50   Input ~ 0
P5
Text GLabel 3600 4100 2    50   Input ~ 0
P4
Text GLabel 950  4100 0    50   Input ~ 0
P7
Text GLabel 1950 3400 2    50   Input ~ 0
#PRESET
Text GLabel 1950 4100 2    50   Input ~ 0
WRDY
Text GLabel 1950 3500 2    50   Input ~ 0
#HSET
Text GLabel 1950 3600 2    50   Input ~ 0
#OE
Text GLabel 1950 3700 2    50   Input ~ 0
#WE
Text GLabel 1950 3800 2    50   Input ~ 0
CE2
Text GLabel 3600 3900 2    50   Input ~ 0
P9
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 62262924
P 3100 3900
F 0 "U?" H 3100 4781 50  0000 C CNN
F 1 "GAL16V8" H 3100 4690 50  0000 C CNN
F 2 "" H 3100 3900 50  0001 C CNN
F 3 "" H 3100 3900 50  0001 C CNN
	1    3100 3900
	1    0    0    -1  
$EndComp
Text GLabel 3600 3400 2    50   Input ~ 0
#LRESET
Wire Wire Line
	2550 6500 2550 6200
Connection ~ 2550 6500
Wire Wire Line
	2600 6500 2550 6500
Wire Wire Line
	2600 6400 2500 6400
Connection ~ 1450 6800
Wire Wire Line
	950  6800 1450 6800
Wire Wire Line
	950  6500 950  6800
Wire Wire Line
	950  6000 800  6000
Text GLabel 3600 3500 2    50   Input ~ 0
#VSYNC
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 62173FE1
P 1450 3900
F 0 "U?" H 1450 4781 50  0000 C CNN
F 1 "GAL16V8" H 1450 4690 50  0000 C CNN
F 2 "" H 1450 3900 50  0001 C CNN
F 3 "" H 1450 3900 50  0001 C CNN
	1    1450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6400 850  6400
Text GLabel 3600 3600 2    50   Input ~ 0
#LD
$Comp
L power:VCC #PWR0128
U 1 1 621EA373
P 3350 5200
F 0 "#PWR0128" H 3350 5050 50  0001 C CNN
F 1 "VCC" H 3365 5373 50  0000 C CNN
F 2 "" H 3350 5200 50  0001 C CNN
F 3 "" H 3350 5200 50  0001 C CNN
	1    3350 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC541 U?
U 1 1 621EA36D
P 3100 6000
F 0 "U?" H 3100 6981 50  0000 C CNN
F 1 "74HC541" H 3100 6890 50  0000 C CNN
F 2 "" H 3100 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 3100 6000 50  0001 C CNN
	1    3100 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 5200 3100 5200
Connection ~ 3100 6800
Text Notes 3150 6700 0    50   ~ 0
Upper Address Buffer
Text Notes 1500 6700 0    50   ~ 0
Lower Address Buffer
Wire Wire Line
	1700 5200 1450 5200
$Comp
L power:VCC #PWR0127
U 1 1 621E3CB7
P 1700 5200
F 0 "#PWR0127" H 1700 5050 50  0001 C CNN
F 1 "VCC" H 1715 5373 50  0000 C CNN
F 2 "" H 1700 5200 50  0001 C CNN
F 3 "" H 1700 5200 50  0001 C CNN
	1    1700 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC541 U?
U 1 1 621D9E12
P 1450 6000
F 0 "U?" H 1450 6981 50  0000 C CNN
F 1 "74HC541" H 1450 6890 50  0000 C CNN
F 2 "" H 1450 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 1450 6000 50  0001 C CNN
	1    1450 6000
	1    0    0    -1  
$EndComp
Text GLabel 3600 6000 2    50   Input ~ 0
A9
Text GLabel 3600 6100 2    50   Input ~ 0
A10
Text GLabel 3600 5900 2    50   Input ~ 0
A8
Text GLabel 3600 5800 2    50   Input ~ 0
A7
Text GLabel 3600 5700 2    50   Input ~ 0
A6
Text GLabel 3600 5600 2    50   Input ~ 0
A5
Text GLabel 3600 5500 2    50   Input ~ 0
A4
$Comp
L power:GND #PWR0126
U 1 1 6221B23E
P 800 6000
F 0 "#PWR0126" H 800 5750 50  0001 C CNN
F 1 "GND" H 805 5827 50  0000 C CNN
F 2 "" H 800 6000 50  0001 C CNN
F 3 "" H 800 6000 50  0001 C CNN
	1    800  6000
	1    0    0    -1  
$EndComp
NoConn ~ 3600 6200
Wire Wire Line
	2550 6200 2600 6200
Wire Wire Line
	2550 6800 2550 6500
Wire Wire Line
	3100 6800 2550 6800
Wire Wire Line
	950  6100 950  6200
Connection ~ 950  6100
Wire Wire Line
	950  6000 950  6100
Connection ~ 950  6000
Wire Wire Line
	950  5900 950  6000
NoConn ~ 1950 5900
NoConn ~ 1950 6000
NoConn ~ 1950 6100
NoConn ~ 1950 6200
Text GLabel 2600 6100 0    50   Input ~ 0
L8
Text GLabel 2600 6000 0    50   Input ~ 0
L7
Text GLabel 2600 5900 0    50   Input ~ 0
L6
Text GLabel 2600 5800 0    50   Input ~ 0
L5
Text GLabel 2600 5700 0    50   Input ~ 0
L4
Text GLabel 2600 5600 0    50   Input ~ 0
L3
Text GLabel 2600 5500 0    50   Input ~ 0
L2
Text GLabel 1950 5500 2    50   Input ~ 0
A0
Text GLabel 1950 5600 2    50   Input ~ 0
A1
Text GLabel 1950 5700 2    50   Input ~ 0
A2
Text GLabel 1950 5800 2    50   Input ~ 0
A3
Text GLabel 950  5800 0    50   Input ~ 0
P8
Text GLabel 950  5700 0    50   Input ~ 0
P7
Text GLabel 950  5600 0    50   Input ~ 0
P6
Text GLabel 950  5500 0    50   Input ~ 0
P5
$Comp
L power:GND #PWR0122
U 1 1 621E617F
P 1450 6800
F 0 "#PWR0122" H 1450 6550 50  0001 C CNN
F 1 "GND" H 1455 6627 50  0000 C CNN
F 2 "" H 1450 6800 50  0001 C CNN
F 3 "" H 1450 6800 50  0001 C CNN
	1    1450 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 621EA37A
P 3100 6800
F 0 "#PWR0119" H 3100 6550 50  0001 C CNN
F 1 "GND" H 3105 6627 50  0000 C CNN
F 2 "" H 3100 6800 50  0001 C CNN
F 3 "" H 3100 6800 50  0001 C CNN
	1    3100 6800
	1    0    0    -1  
$EndComp
Text Notes 3150 4550 0    50   ~ 0
V Decoder
Text Notes 1500 4550 0    50   ~ 0
H Decoder
Text GLabel 950  4000 0    50   Input ~ 0
P6
Text GLabel 950  3900 0    50   Input ~ 0
P5
Text GLabel 950  3800 0    50   Input ~ 0
P4
Text GLabel 950  3700 0    50   Input ~ 0
P3
Text GLabel 950  3600 0    50   Input ~ 0
P2
Text GLabel 950  3500 0    50   Input ~ 0
P1
Text GLabel 950  3400 0    50   Input ~ 0
P0
$Comp
L power:GND #PWR0110
U 1 1 621750F4
P 1450 4600
F 0 "#PWR0110" H 1450 4350 50  0001 C CNN
F 1 "GND" H 1455 4427 50  0000 C CNN
F 2 "" H 1450 4600 50  0001 C CNN
F 3 "" H 1450 4600 50  0001 C CNN
	1    1450 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6226292A
P 3100 4600
F 0 "#PWR0120" H 3100 4350 50  0001 C CNN
F 1 "GND" H 3105 4427 50  0000 C CNN
F 2 "" H 3100 4600 50  0001 C CNN
F 3 "" H 3100 4600 50  0001 C CNN
	1    3100 4600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0121
U 1 1 62262930
P 3350 3200
F 0 "#PWR0121" H 3350 3050 50  0001 C CNN
F 1 "VCC" H 3365 3373 50  0000 C CNN
F 2 "" H 3350 3200 50  0001 C CNN
F 3 "" H 3350 3200 50  0001 C CNN
	1    3350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3200 3100 3200
Wire Wire Line
	1700 3200 1450 3200
$Comp
L power:VCC #PWR0113
U 1 1 62179416
P 1700 3200
F 0 "#PWR0113" H 1700 3050 50  0001 C CNN
F 1 "VCC" H 1715 3373 50  0000 C CNN
F 2 "" H 1700 3200 50  0001 C CNN
F 3 "" H 1700 3200 50  0001 C CNN
	1    1700 3200
	1    0    0    -1  
$EndComp
Text GLabel 950  4200 0    50   Input ~ 0
P8
Text GLabel 950  4300 0    50   Input ~ 0
P9
Text GLabel 2600 3400 0    50   Input ~ 0
L0
Text GLabel 2600 3500 0    50   Input ~ 0
L1
Text GLabel 2600 3600 0    50   Input ~ 0
L2
Text GLabel 2600 3700 0    50   Input ~ 0
L3
Text GLabel 2600 3800 0    50   Input ~ 0
L4
Text GLabel 2600 3900 0    50   Input ~ 0
L5
Text GLabel 2600 4000 0    50   Input ~ 0
L6
Text GLabel 2600 4100 0    50   Input ~ 0
L7
Text GLabel 2600 4200 0    50   Input ~ 0
L8
Text GLabel 2600 4300 0    50   Input ~ 0
L9
$Comp
L Device:C_Small C?
U 1 1 62510662
P 11900 2700
F 0 "C?" H 12129 2700 50  0000 C CNN
F 1 "C_Small" V 12037 2700 50  0001 C CNN
F 2 "" H 11900 2700 50  0001 C CNN
F 3 "~" H 11900 2700 50  0001 C CNN
	1    11900 2700
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6251404A
P 12100 2700
F 0 "C?" H 12329 2700 50  0000 C CNN
F 1 "C_Small" H 12237 2700 50  0001 C CNN
F 2 "" H 12100 2700 50  0001 C CNN
F 3 "~" H 12100 2700 50  0001 C CNN
	1    12100 2700
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 624D11F1
P 11750 2300
F 0 "R?" V 11957 2300 50  0000 C CNN
F 1 "R" V 11866 2300 50  0000 C CNN
F 2 "" V 11680 2300 50  0001 C CNN
F 3 "~" H 11750 2300 50  0001 C CNN
	1    11750 2300
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 624C6475
P 11750 2100
F 0 "R?" V 11957 2100 50  0000 C CNN
F 1 "R" V 11866 2100 50  0000 C CNN
F 2 "" V 11680 2100 50  0001 C CNN
F 3 "~" H 11750 2100 50  0001 C CNN
	1    11750 2100
	0    -1   -1   0   
$EndComp
Text GLabel 11600 2300 0    50   Input ~ 0
#VSYNC
Text GLabel 11600 2100 0    50   Input ~ 0
#HSYNC
Wire Wire Line
	11900 2300 12100 2300
$Comp
L power:GND #PWR0141
U 1 1 6254E82D
P 11900 2900
F 0 "#PWR0141" H 11900 2650 50  0001 C CNN
F 1 "GND" H 11905 2727 50  0000 C CNN
F 2 "" H 11900 2900 50  0001 C CNN
F 3 "" H 11900 2900 50  0001 C CNN
	1    11900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	11900 2100 12550 2100
Wire Wire Line
	11900 2900 12100 2900
Wire Wire Line
	11900 2800 11900 2900
Connection ~ 11900 2900
Wire Wire Line
	12100 2800 12100 2900
Connection ~ 12100 2900
Wire Wire Line
	12100 2900 12450 2900
Wire Wire Line
	12100 2600 12100 2300
Connection ~ 12100 2300
Wire Wire Line
	12100 2300 12550 2300
Wire Wire Line
	11900 2600 11900 2300
Connection ~ 11900 2300
Connection ~ 12450 2600
Wire Wire Line
	12450 2600 12450 2900
Connection ~ 12450 2000
Wire Wire Line
	12450 1500 12550 1500
Wire Wire Line
	12450 2000 12450 1500
Connection ~ 12450 2200
Wire Wire Line
	12450 2000 12550 2000
Wire Wire Line
	12450 2200 12450 2000
Connection ~ 12450 2400
Wire Wire Line
	12450 2200 12550 2200
Wire Wire Line
	12450 2400 12450 2200
Wire Wire Line
	12450 2400 12550 2400
Wire Wire Line
	12450 2600 12450 2400
Wire Wire Line
	12550 2600 12450 2600
Wire Wire Line
	12350 1600 12550 1600
Wire Wire Line
	12350 1400 12550 1400
Wire Wire Line
	12350 1200 12350 1400
Wire Wire Line
	12550 850  12550 1200
Wire Wire Line
	12350 850  12550 850 
Wire Wire Line
	11900 1600 12050 1600
Wire Wire Line
	11900 1050 11900 1600
Wire Wire Line
	12050 950  12050 1200
Wire Wire Line
	11900 950  12050 950 
Wire Wire Line
	11900 850  12050 850 
Connection ~ 11300 950 
Wire Wire Line
	11300 950  11300 850 
$Comp
L Device:R R?
U 1 1 624A50DB
P 12200 1600
F 0 "R?" V 12407 1600 50  0000 C CNN
F 1 "R" V 12316 1600 50  0000 C CNN
F 2 "" V 12130 1600 50  0001 C CNN
F 3 "~" H 12200 1600 50  0001 C CNN
	1    12200 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11300 950  11300 1050
$Comp
L Device:R R?
U 1 1 6246552C
P 12200 1200
F 0 "R?" V 12407 1200 50  0000 C CNN
F 1 "R" V 12316 1200 50  0000 C CNN
F 2 "" V 12130 1200 50  0001 C CNN
F 3 "~" H 12200 1200 50  0001 C CNN
	1    12200 1200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 62460BDF
P 12200 850
F 0 "R?" V 12407 850 50  0000 C CNN
F 1 "R" V 12316 850 50  0000 C CNN
F 2 "" V 12130 850 50  0001 C CNN
F 3 "~" H 12200 850 50  0001 C CNN
	1    12200 850 
	0    -1   -1   0   
$EndComp
$Comp
L Connector:DB15_Female J?
U 1 1 6240CE1A
P 12850 1900
F 0 "J?" H 13004 1946 50  0000 L CNN
F 1 "DB15_Female" H 13004 1855 50  0000 L CNN
F 2 "" H 12850 1900 50  0001 C CNN
F 3 " ~" H 12850 1900 50  0001 C CNN
	1    12850 1900
	1    0    0    -1  
$EndComp
NoConn ~ 12550 1800
NoConn ~ 12550 1700
NoConn ~ 12550 1900
NoConn ~ 12550 1300
NoConn ~ 12550 2500
$Comp
L Switch:SW_DIP_x03 SW?
U 1 1 6243C8F9
P 11600 1050
F 0 "SW?" H 11600 1517 50  0000 C CNN
F 1 "SW_DIP_x03" H 11600 1426 50  0000 C CNN
F 2 "" H 11600 1050 50  0001 C CNN
F 3 "~" H 11600 1050 50  0001 C CNN
	1    11600 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1150 7550 600 
Wire Wire Line
	7550 600  11300 600 
Wire Wire Line
	11300 600  11300 850 
Connection ~ 11300 850 
$EndSCHEMATC
