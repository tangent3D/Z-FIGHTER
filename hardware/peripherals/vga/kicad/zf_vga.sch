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
L power:VCC #PWR0101
U 1 1 6204084C
P 10200 5450
F 0 "#PWR0101" H 10200 5300 50  0001 C CNN
F 1 "VCC" H 10215 5623 50  0000 C CNN
F 2 "" H 10200 5450 50  0001 C CNN
F 3 "" H 10200 5450 50  0001 C CNN
	1    10200 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 62042787
P 10200 6050
F 0 "#PWR0102" H 10200 5800 50  0001 C CNN
F 1 "GND" H 10205 5877 50  0000 C CNN
F 2 "" H 10200 6050 50  0001 C CNN
F 3 "" H 10200 6050 50  0001 C CNN
	1    10200 6050
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 6203895A
P 10200 5750
F 0 "X?" H 10544 5796 50  0000 L CNN
F 1 "CXO_DIP14" H 10544 5705 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 10650 5400 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 10100 5750 50  0001 C CNN
	1    10200 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5750 10500 5950
Wire Wire Line
	10500 5950 10600 5950
Text GLabel 10600 5950 2    50   Input ~ 0
CLOCK
Text GLabel 2600 4300 0    50   Input ~ 0
L9
Text GLabel 2600 4200 0    50   Input ~ 0
L8
Text GLabel 2600 4100 0    50   Input ~ 0
L7
Text GLabel 2600 4000 0    50   Input ~ 0
L6
Text GLabel 2600 3900 0    50   Input ~ 0
L5
Text GLabel 2600 3800 0    50   Input ~ 0
L4
Text GLabel 2600 3700 0    50   Input ~ 0
L3
Text GLabel 2600 3600 0    50   Input ~ 0
L2
Text GLabel 2600 3500 0    50   Input ~ 0
L1
Text GLabel 2600 3400 0    50   Input ~ 0
L0
Text GLabel 950  4300 0    50   Input ~ 0
P9
Text GLabel 950  4200 0    50   Input ~ 0
P8
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
Wire Wire Line
	1700 3200 1450 3200
Wire Wire Line
	3350 3200 3100 3200
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
Text GLabel 950  3400 0    50   Input ~ 0
P0
Text GLabel 950  3500 0    50   Input ~ 0
P1
Text GLabel 950  3600 0    50   Input ~ 0
P2
Text GLabel 950  3700 0    50   Input ~ 0
P3
Text GLabel 950  3800 0    50   Input ~ 0
P4
Text GLabel 950  3900 0    50   Input ~ 0
P5
Text GLabel 950  4000 0    50   Input ~ 0
P6
Text Notes 1500 4550 0    50   ~ 0
H Decoder
Text Notes 3150 4550 0    50   ~ 0
V Decoder
$Comp
L power:GND #PWR0119
U 1 1 621EA37A
P 3100 6900
F 0 "#PWR0119" H 3100 6650 50  0001 C CNN
F 1 "GND" H 3105 6727 50  0000 C CNN
F 2 "" H 3100 6900 50  0001 C CNN
F 3 "" H 3100 6900 50  0001 C CNN
	1    3100 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 621E617F
P 1450 6900
F 0 "#PWR0122" H 1450 6650 50  0001 C CNN
F 1 "GND" H 1455 6727 50  0000 C CNN
F 2 "" H 1450 6900 50  0001 C CNN
F 3 "" H 1450 6900 50  0001 C CNN
	1    1450 6900
	1    0    0    -1  
$EndComp
Text GLabel 950  5600 0    50   Input ~ 0
P5
Text GLabel 950  5700 0    50   Input ~ 0
P6
Text GLabel 950  5800 0    50   Input ~ 0
P7
Text GLabel 950  5900 0    50   Input ~ 0
P8
Text GLabel 1950 5900 2    50   Input ~ 0
A3
Text GLabel 1950 5800 2    50   Input ~ 0
A2
Text GLabel 1950 5700 2    50   Input ~ 0
A1
Text GLabel 1950 5600 2    50   Input ~ 0
A0
Text GLabel 2600 5600 0    50   Input ~ 0
L2
Text GLabel 2600 5700 0    50   Input ~ 0
L3
Text GLabel 2600 5800 0    50   Input ~ 0
L4
Text GLabel 2600 5900 0    50   Input ~ 0
L5
Text GLabel 2600 6000 0    50   Input ~ 0
L6
Text GLabel 2600 6100 0    50   Input ~ 0
L7
Text GLabel 2600 6200 0    50   Input ~ 0
L8
NoConn ~ 1950 6300
NoConn ~ 1950 6200
NoConn ~ 1950 6100
NoConn ~ 1950 6000
Wire Wire Line
	950  6000 950  6100
Connection ~ 950  6100
Wire Wire Line
	950  6100 950  6200
Connection ~ 950  6200
Wire Wire Line
	950  6200 950  6300
Wire Wire Line
	3100 6900 2550 6900
Wire Wire Line
	2550 6900 2550 6600
Wire Wire Line
	2550 6300 2600 6300
NoConn ~ 3600 6300
$Comp
L power:GND #PWR0123
U 1 1 622538F3
P 4400 5250
F 0 "#PWR0123" H 4400 5000 50  0001 C CNN
F 1 "GND" H 4405 5077 50  0000 C CNN
F 2 "" H 4400 5250 50  0001 C CNN
F 3 "" H 4400 5250 50  0001 C CNN
	1    4400 5250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 4 1 622384DB
P 4900 4850
F 0 "U?" H 4900 5175 50  0001 C CNN
F 1 "74HC00" H 4900 5083 50  0001 C CNN
F 2 "" H 4900 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4850 50  0001 C CNN
	4    4900 4850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0125
U 1 1 62254857
P 5400 5250
F 0 "#PWR0125" H 5400 5100 50  0001 C CNN
F 1 "VCC" H 5415 5423 50  0000 C CNN
F 2 "" H 5400 5250 50  0001 C CNN
F 3 "" H 5400 5250 50  0001 C CNN
	1    5400 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 6221B23E
P 800 6100
F 0 "#PWR0126" H 800 5850 50  0001 C CNN
F 1 "GND" H 805 5927 50  0000 C CNN
F 2 "" H 800 6100 50  0001 C CNN
F 3 "" H 800 6100 50  0001 C CNN
	1    800  6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 62186D08
P 4400 3050
F 0 "#PWR0117" H 4400 2800 50  0001 C CNN
F 1 "GND" H 4405 2877 50  0000 C CNN
F 2 "" H 4400 3050 50  0001 C CNN
F 3 "" H 4400 3050 50  0001 C CNN
	1    4400 3050
	1    0    0    -1  
$EndComp
Text GLabel 3600 5600 2    50   Input ~ 0
A4
Text GLabel 3600 5700 2    50   Input ~ 0
A5
Text GLabel 3600 5800 2    50   Input ~ 0
A6
Text GLabel 3600 5900 2    50   Input ~ 0
A7
Text GLabel 3600 6000 2    50   Input ~ 0
A8
Text GLabel 3600 6200 2    50   Input ~ 0
A10
Text GLabel 3600 6100 2    50   Input ~ 0
A9
$Comp
L 74xx:74HC541 U?
U 1 1 621D9E12
P 1450 6100
F 0 "U?" H 1450 7081 50  0000 C CNN
F 1 "74HC541" H 1450 6990 50  0000 C CNN
F 2 "" H 1450 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 1450 6100 50  0001 C CNN
	1    1450 6100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0127
U 1 1 621E3CB7
P 1700 5300
F 0 "#PWR0127" H 1700 5150 50  0001 C CNN
F 1 "VCC" H 1715 5473 50  0000 C CNN
F 2 "" H 1700 5300 50  0001 C CNN
F 3 "" H 1700 5300 50  0001 C CNN
	1    1700 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5300 1450 5300
Text Notes 1500 5000 0    50   ~ 0
Line Counter
$Comp
L power:GND #PWR0124
U 1 1 622AB81D
P 6850 2650
F 0 "#PWR0124" H 6850 2400 50  0001 C CNN
F 1 "GND" H 6855 2477 50  0000 C CNN
F 2 "" H 6850 2650 50  0001 C CNN
F 3 "" H 6850 2650 50  0001 C CNN
	1    6850 2650
	1    0    0    -1  
$EndComp
Text GLabel 6350 1450 0    50   Input ~ 0
D3
Text GLabel 6350 1550 0    50   Input ~ 0
D4
Text GLabel 6350 1650 0    50   Input ~ 0
D5
Text GLabel 6350 1750 0    50   Input ~ 0
D6
Text GLabel 6350 1850 0    50   Input ~ 0
D7
Text GLabel 7350 3300 2    50   Input ~ 0
D0
Text GLabel 7350 3400 2    50   Input ~ 0
D1
Text GLabel 7350 3500 2    50   Input ~ 0
D2
Text GLabel 7350 3600 2    50   Input ~ 0
D3
Text GLabel 7350 3700 2    50   Input ~ 0
D4
Text GLabel 7350 3800 2    50   Input ~ 0
D5
Text GLabel 7350 3900 2    50   Input ~ 0
D6
Text GLabel 7350 4000 2    50   Input ~ 0
D7
Wire Wire Line
	6350 4400 6350 4450
$Comp
L power:GND #PWR0129
U 1 1 622758B5
P 6850 4900
F 0 "#PWR0129" H 6850 4650 50  0001 C CNN
F 1 "GND" H 6855 4727 50  0000 C CNN
F 2 "" H 6850 4900 50  0001 C CNN
F 3 "" H 6850 4900 50  0001 C CNN
	1    6850 4900
	1    0    0    -1  
$EndComp
Text GLabel 6350 3500 0    50   Input ~ 0
A2
Text GLabel 6350 3400 0    50   Input ~ 0
A1
Text GLabel 6350 3300 0    50   Input ~ 0
A0
Text GLabel 6350 4200 0    50   Input ~ 0
A9
Text GLabel 6350 4300 0    50   Input ~ 0
A10
Text GLabel 6350 4100 0    50   Input ~ 0
A8
Text GLabel 6350 4000 0    50   Input ~ 0
A7
Text GLabel 6350 3900 0    50   Input ~ 0
A6
Text GLabel 6350 3800 0    50   Input ~ 0
A5
Text GLabel 6350 3700 0    50   Input ~ 0
A4
Text GLabel 6350 3600 0    50   Input ~ 0
A3
$Comp
L power:VCC #PWR0131
U 1 1 621F0C91
P 8900 750
F 0 "#PWR0131" H 8900 600 50  0001 C CNN
F 1 "VCC" H 8915 923 50  0000 C CNN
F 2 "" H 8900 750 50  0001 C CNN
F 3 "" H 8900 750 50  0001 C CNN
	1    8900 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 750  8650 750 
Text GLabel 6350 1350 0    50   Input ~ 0
D2
Text GLabel 6350 1250 0    50   Input ~ 0
D1
$Comp
L power:VCC #PWR0103
U 1 1 621BD50A
P 7100 750
F 0 "#PWR0103" H 7100 600 50  0001 C CNN
F 1 "VCC" H 7115 923 50  0000 C CNN
F 2 "" H 7100 750 50  0001 C CNN
F 3 "" H 7100 750 50  0001 C CNN
	1    7100 750 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 622099D9
P 10150 1100
F 0 "J?" H 10200 1417 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 10200 1326 50  0000 C CNN
F 2 "" H 10150 1100 50  0001 C CNN
F 3 "~" H 10150 1100 50  0001 C CNN
	1    10150 1100
	1    0    0    -1  
$EndComp
Text Notes 1500 6800 0    50   ~ 0
Pixel Address Buffer
Text Notes 3150 6800 0    50   ~ 0
Line Address Buffer
Text Notes 6900 4900 0    50   ~ 0
SRAM
Wire Wire Line
	7100 750  6850 750 
Text Notes 8700 2250 0    50   ~ 0
Write Data Buffer
Text GLabel 10700 3550 2    50   Input ~ 0
A8
Text GLabel 10700 3750 2    50   Input ~ 0
A10
Text GLabel 10700 3650 2    50   Input ~ 0
A9
Text GLabel 8150 1050 0    50   Input ~ 0
WD0
Text GLabel 8150 1150 0    50   Input ~ 0
WD1
Text GLabel 8150 1250 0    50   Input ~ 0
WD2
Text GLabel 8150 1350 0    50   Input ~ 0
WD3
Text GLabel 8150 1450 0    50   Input ~ 0
WD4
Text GLabel 8150 1550 0    50   Input ~ 0
WD5
Text GLabel 8150 1650 0    50   Input ~ 0
WD6
Text GLabel 8150 1750 0    50   Input ~ 0
WD7
Text GLabel 9150 1350 2    50   Input ~ 0
D3
Text GLabel 9150 1450 2    50   Input ~ 0
D4
Text GLabel 9150 1550 2    50   Input ~ 0
D5
Text GLabel 9150 1650 2    50   Input ~ 0
D6
Text GLabel 9150 1750 2    50   Input ~ 0
D7
Text GLabel 9150 1250 2    50   Input ~ 0
D2
Text GLabel 9150 1150 2    50   Input ~ 0
D1
Text GLabel 9150 1050 2    50   Input ~ 0
D0
$Comp
L power:GND #PWR0136
U 1 1 6230BCE6
P 10800 2900
F 0 "#PWR0136" H 10800 2650 50  0001 C CNN
F 1 "GND" H 10805 2727 50  0000 C CNN
F 2 "" H 10800 2900 50  0001 C CNN
F 3 "" H 10800 2900 50  0001 C CNN
	1    10800 2900
	1    0    0    -1  
$EndComp
Connection ~ 3100 6900
Wire Wire Line
	3350 5300 3100 5300
$Comp
L 74xx:74HC541 U?
U 1 1 621EA36D
P 3100 6100
F 0 "U?" H 3100 7081 50  0000 C CNN
F 1 "74HC541" H 3100 6990 50  0000 C CNN
F 2 "" H 3100 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 3100 6100 50  0001 C CNN
	1    3100 6100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0128
U 1 1 621EA373
P 3350 5300
F 0 "#PWR0128" H 3350 5150 50  0001 C CNN
F 1 "VCC" H 3365 5473 50  0000 C CNN
F 2 "" H 3350 5300 50  0001 C CNN
F 3 "" H 3350 5300 50  0001 C CNN
	1    3350 5300
	1    0    0    -1  
$EndComp
Connection ~ 6850 4900
Wire Wire Line
	6250 4900 6850 4900
Wire Wire Line
	6350 4450 6250 4450
$Comp
L power:VCC #PWR0137
U 1 1 62317BEF
P 7100 3100
F 0 "#PWR0137" H 7100 2950 50  0001 C CNN
F 1 "VCC" H 7115 3273 50  0000 C CNN
F 2 "" H 7100 3100 50  0001 C CNN
F 3 "" H 7100 3100 50  0001 C CNN
	1    7100 3100
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:AS6C6264 U?
U 1 1 62268A82
P 6850 4000
F 0 "U?" H 6850 5081 50  0000 C CNN
F 1 "AS6C6264" H 6850 4990 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 6850 3900 50  0001 C CNN
F 3 "https://www.futurlec.com/Datasheet/Memory/62256.pdf" H 6850 3900 50  0001 C CNN
	1    6850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3100 7100 3100
$Comp
L power:VCC #PWR0138
U 1 1 6231FF13
P 10450 3250
F 0 "#PWR0138" H 10450 3100 50  0001 C CNN
F 1 "VCC" H 10465 3423 50  0000 C CNN
F 2 "" H 10450 3250 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0139
U 1 1 62346482
P 9600 2900
F 0 "#PWR0139" H 9600 2750 50  0001 C CNN
F 1 "VCC" H 9615 3073 50  0000 C CNN
F 2 "" H 9600 2900 50  0001 C CNN
F 3 "" H 9600 2900 50  0001 C CNN
	1    9600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 2900 9950 2900
$Comp
L power:GND #PWR0140
U 1 1 623497DE
P 10450 1300
F 0 "#PWR0140" H 10450 1050 50  0001 C CNN
F 1 "GND" H 10455 1127 50  0000 C CNN
F 2 "" H 10450 1300 50  0001 C CNN
F 3 "" H 10450 1300 50  0001 C CNN
	1    10450 1300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 62235607
P 4900 4150
F 0 "U?" H 4900 4383 50  0001 C CNN
F 1 "74HC00" H 4900 4384 50  0001 C CNN
F 2 "" H 4900 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4150 50  0001 C CNN
	2    4900 4150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0141
U 1 1 62359192
P 9600 1300
F 0 "#PWR0141" H 9600 1150 50  0001 C CNN
F 1 "VCC" H 9615 1473 50  0000 C CNN
F 2 "" H 9600 1300 50  0001 C CNN
F 3 "" H 9600 1300 50  0001 C CNN
	1    9600 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 1300 9600 1300
Text GLabel 3600 3600 2    50   Input ~ 0
#LD
Text GLabel 8150 4250 0    50   Input ~ 0
WA7
Text GLabel 8150 3950 0    50   Input ~ 0
WA4
Text GLabel 8150 4050 0    50   Input ~ 0
WA5
Text GLabel 8150 4150 0    50   Input ~ 0
WA6
Text GLabel 8150 3750 0    50   Input ~ 0
WA2
Text GLabel 8150 3650 0    50   Input ~ 0
WA1
Text GLabel 8150 3550 0    50   Input ~ 0
WA0
Text GLabel 8150 3850 0    50   Input ~ 0
WA3
$Comp
L power:VCC #PWR0142
U 1 1 6231A022
P 8900 3250
F 0 "#PWR0142" H 8900 3100 50  0001 C CNN
F 1 "VCC" H 8915 3423 50  0000 C CNN
F 2 "" H 8900 3250 50  0001 C CNN
F 3 "" H 8900 3250 50  0001 C CNN
	1    8900 3250
	1    0    0    -1  
$EndComp
Text GLabel 9150 3750 2    50   Input ~ 0
A2
Text GLabel 9150 3650 2    50   Input ~ 0
A1
Text GLabel 9150 3550 2    50   Input ~ 0
A0
Text GLabel 9150 4250 2    50   Input ~ 0
A7
Text GLabel 9150 4150 2    50   Input ~ 0
A6
Text GLabel 9150 4050 2    50   Input ~ 0
A5
Text GLabel 9150 3950 2    50   Input ~ 0
A4
Text GLabel 9150 3850 2    50   Input ~ 0
A3
$Comp
L power:GND #PWR0134
U 1 1 622D3D47
P 8650 4900
F 0 "#PWR0134" H 8650 4650 50  0001 C CNN
F 1 "GND" H 8655 4727 50  0000 C CNN
F 2 "" H 8650 4900 50  0001 C CNN
F 3 "" H 8650 4900 50  0001 C CNN
	1    8650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4450 6250 4900
Connection ~ 6350 4450
Wire Wire Line
	6350 4450 6350 4500
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J?
U 1 1 621FEB7B
P 10150 2300
F 0 "J?" H 10200 3117 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 10200 3026 50  0000 C CNN
F 2 "" H 10150 2300 50  0001 C CNN
F 3 "~" H 10150 2300 50  0001 C CNN
	1    10150 2300
	1    0    0    -1  
$EndComp
Text Notes 6900 2600 0    50   ~ 0
Video Output
$Comp
L 74xx:74HC165 U?
U 1 1 622A653B
P 6850 1650
F 0 "U?" H 6850 2731 50  0000 C CNN
F 1 "74HC165" H 6850 2640 50  0000 C CNN
F 2 "" H 6850 1650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT165.pdf" H 6850 1650 50  0001 C CNN
	1    6850 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6500 850  6500
Wire Wire Line
	10800 2900 10450 2900
Wire Wire Line
	10200 3250 10450 3250
NoConn ~ 10700 3850
NoConn ~ 10700 3950
NoConn ~ 10700 4050
NoConn ~ 10700 4150
NoConn ~ 10700 4250
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
	7350 4200 7400 4200
Wire Wire Line
	7400 4200 7400 4600
$Comp
L power:GND #PWR0130
U 1 1 6227127D
P 7400 4600
F 0 "#PWR0130" H 7400 4350 50  0001 C CNN
F 1 "GND" H 7405 4427 50  0000 C CNN
F 2 "" H 7400 4600 50  0001 C CNN
F 3 "" H 7400 4600 50  0001 C CNN
	1    7400 4600
	1    0    0    -1  
$EndComp
Text GLabel 3600 3500 2    50   Input ~ 0
#VSYNC
Text GLabel 7450 4300 2    50   Input ~ 0
#OE
Wire Wire Line
	7450 4300 7350 4300
Text GLabel 7450 4400 2    50   Input ~ 0
#WE
Text GLabel 7450 4500 2    50   Input ~ 0
CE2
Wire Wire Line
	7450 4400 7350 4400
Wire Wire Line
	7450 4500 7350 4500
Text Notes 9250 3000 0    50   ~ 0
Z-Fighter Connectors
$Comp
L 74xx:74HC00 U?
U 1 1 6222CFFF
P 4900 3800
F 0 "U?" H 4900 4125 50  0000 C CNN
F 1 "74HC00" H 4900 4034 50  0000 C CNN
F 2 "" H 4900 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 3800 50  0001 C CNN
	1    4900 3800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 1 1 62230D93
P 4900 900
F 0 "U?" H 4900 1217 50  0000 C CNN
F 1 "74HC14" H 4900 1126 50  0000 C CNN
F 2 "" H 4900 900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 900 50  0001 C CNN
	1    4900 900 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 2 1 622331B8
P 4900 1250
F 0 "U?" H 4900 1567 50  0001 C CNN
F 1 "74HC04" H 4900 1476 50  0001 C CNN
F 2 "" H 4900 1250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 1250 50  0001 C CNN
	2    4900 1250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 4 1 62235EDC
P 4900 1950
F 0 "U?" H 4900 2267 50  0001 C CNN
F 1 "74HC04" H 4900 2176 50  0001 C CNN
F 2 "" H 4900 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 1950 50  0001 C CNN
	4    4900 1950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U?
U 5 1 62237D89
P 4900 2300
F 0 "U?" H 4900 2617 50  0001 C CNN
F 1 "74HC04" H 4900 2526 50  0001 C CNN
F 2 "" H 4900 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 2300 50  0001 C CNN
	5    4900 2300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0118
U 1 1 62188C3D
P 5400 3050
F 0 "#PWR0118" H 5400 2900 50  0001 C CNN
F 1 "VCC" H 5415 3223 50  0000 C CNN
F 2 "" H 5400 3050 50  0001 C CNN
F 3 "" H 5400 3050 50  0001 C CNN
	1    5400 3050
	1    0    0    -1  
$EndComp
NoConn ~ 9900 5750
Wire Wire Line
	950  6100 800  6100
$Comp
L 74xx:74HC04 U?
U 7 1 6223AE39
P 4900 3050
F 0 "U?" V 4625 3050 50  0001 C CNN
F 1 "74HC04" V 4624 3050 50  0001 C CNN
F 2 "" H 4900 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 3050 50  0001 C CNN
	7    4900 3050
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC04 U?
U 3 1 62234980
P 4900 1600
F 0 "U?" H 4900 1917 50  0001 C CNN
F 1 "74HC04" H 4900 1826 50  0001 C CNN
F 2 "" H 4900 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 1600 50  0001 C CNN
	3    4900 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 621F0C8A
P 8650 2350
F 0 "#PWR0133" H 8650 2100 50  0001 C CNN
F 1 "GND" H 8655 2177 50  0000 C CNN
F 2 "" H 8650 2350 50  0001 C CNN
F 3 "" H 8650 2350 50  0001 C CNN
	1    8650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6600 950  6900
Wire Wire Line
	950  6900 1450 6900
Connection ~ 1450 6900
Wire Wire Line
	2600 6500 2500 6500
Wire Wire Line
	2600 6600 2550 6600
Connection ~ 2550 6600
Wire Wire Line
	2550 6600 2550 6300
$Comp
L 74xx:74HC541 U?
U 1 1 621F0C97
P 8650 1550
F 0 "U?" H 8650 2531 50  0000 C CNN
F 1 "74HC541" H 8650 2440 50  0000 C CNN
F 2 "" H 8650 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 8650 1550 50  0001 C CNN
	1    8650 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2050 8150 2350
Wire Wire Line
	8150 2350 8650 2350
Connection ~ 8650 2350
NoConn ~ 7350 1150
Text GLabel 7350 1050 2    50   Input ~ 0
VIDOUT
Text GLabel 750  6500 0    50   Input ~ 0
BUS
Text GLabel 2400 6500 0    50   Input ~ 0
BUS
Text GLabel 8050 4450 0    50   Input ~ 0
#BUS
Text GLabel 9600 4450 0    50   Input ~ 0
#BUS
Text GLabel 8000 1950 0    50   Input ~ 0
#BUS
Text GLabel 4600 3900 0    50   Input ~ 0
#LDPULSE
Text Notes 5050 3950 0    50   ~ 0
#LOAD pulse
$Comp
L Device:C_Small C?
U 1 1 623D14EC
P 5300 3800
F 0 "C?" V 5529 3800 50  0001 C CNN
F 1 "C_Small" V 5437 3800 50  0001 C CNN
F 2 "" H 5300 3800 50  0001 C CNN
F 3 "~" H 5300 3800 50  0001 C CNN
	1    5300 3800
	0    -1   -1   0   
$EndComp
Text GLabel 3600 3400 2    50   Input ~ 0
#LRESET
$Comp
L 74xx:74HC00 U?
U 3 1 62236D7F
P 4900 4500
F 0 "U?" H 4900 4825 50  0001 C CNN
F 1 "74HC00" H 4900 4733 50  0001 C CNN
F 2 "" H 4900 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4500 50  0001 C CNN
	3    4900 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 6223A0D4
P 4900 5250
F 0 "U?" V 4625 5250 50  0001 C CNN
F 1 "74HC00" V 4624 5250 50  0001 C CNN
F 2 "" H 4900 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5250 50  0001 C CNN
	5    4900 5250
	0    1    1    0   
$EndComp
Connection ~ 6850 2650
Wire Wire Line
	6850 2650 6350 2650
Wire Wire Line
	6350 2650 6350 2350
Text GLabel 6350 2050 0    50   Input ~ 0
#LDPULSE
Text GLabel 4600 3700 0    50   Input ~ 0
#LD
$Comp
L power:GND #PWR0104
U 1 1 62221546
P 6050 1050
F 0 "#PWR0104" H 6050 800 50  0001 C CNN
F 1 "GND" H 6055 877 50  0000 C CNN
F 2 "" H 6050 1050 50  0001 C CNN
F 3 "" H 6050 1050 50  0001 C CNN
	1    6050 1050
	1    0    0    -1  
$EndComp
Text GLabel 6350 1150 0    50   Input ~ 0
D0
Wire Wire Line
	6050 1050 6350 1050
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
Text GLabel 3600 3900 2    50   Input ~ 0
P9
Text GLabel 1950 3800 2    50   Input ~ 0
CE2
Text GLabel 1950 3700 2    50   Input ~ 0
#WE
Text GLabel 1950 3600 2    50   Input ~ 0
#OE
Text GLabel 1950 3900 2    50   Input ~ 0
BUS
Text GLabel 1950 3500 2    50   Input ~ 0
HPULSE
Text GLabel 6350 2250 0    50   Input ~ 0
SCLOCK
Text GLabel 1950 4100 2    50   Input ~ 0
WRDY
Text GLabel 3600 3700 2    50   Input ~ 0
SCLOCK
$Comp
L 74xx:74HC74 U?
U 3 1 6243E965
P 4900 7450
F 0 "U?" V 4625 7450 50  0001 C CNN
F 1 "74HC74" V 4624 7450 50  0001 C CNN
F 2 "" H 4900 7450 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4900 7450 50  0001 C CNN
	3    4900 7450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 6244E28C
P 4450 7450
F 0 "#PWR0132" H 4450 7200 50  0001 C CNN
F 1 "GND" H 4455 7277 50  0000 C CNN
F 2 "" H 4450 7450 50  0001 C CNN
F 3 "" H 4450 7450 50  0001 C CNN
	1    4450 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 7450 4450 7450
Text GLabel 4600 6850 0    50   Input ~ 0
P2
Text GLabel 5200 6750 2    50   Input ~ 0
WRDY
Text GLabel 1950 3400 2    50   Input ~ 0
#PRESET
$Comp
L 74xx:74HC74 U?
U 2 1 6243AADD
P 4900 6850
F 0 "U?" H 4900 7331 50  0001 C CNN
F 1 "74HC74" H 4900 7239 50  0001 C CNN
F 2 "" H 4900 6850 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4900 6850 50  0001 C CNN
	2    4900 6850
	1    0    0    -1  
$EndComp
Text GLabel 3600 4100 2    50   Input ~ 0
P1
Text GLabel 950  4100 0    50   Input ~ 0
P7
Text GLabel 3600 4000 2    50   Input ~ 0
P4
NoConn ~ 3600 3800
Wire Wire Line
	5650 6550 4900 6550
Wire Wire Line
	5650 6550 5650 7150
Wire Wire Line
	5300 7450 5650 7450
$Comp
L power:VCC #PWR0143
U 1 1 6244F9AC
P 5650 5850
F 0 "#PWR0143" H 5650 5700 50  0001 C CNN
F 1 "VCC" H 5665 6023 50  0000 C CNN
F 2 "" H 5650 5850 50  0001 C CNN
F 3 "" H 5650 5850 50  0001 C CNN
	1    5650 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5850 5650 6550
Connection ~ 5650 5850
Connection ~ 5650 6550
Wire Wire Line
	4900 6450 4900 6550
Connection ~ 4900 6550
Wire Wire Line
	4900 7150 5650 7150
Connection ~ 5650 7150
Wire Wire Line
	5650 7150 5650 7450
NoConn ~ 5200 6950
Wire Wire Line
	5650 5850 4900 5850
$Comp
L 74xx:74HC74 U?
U 1 1 62437D41
P 4900 6150
F 0 "U?" H 4900 6631 50  0000 C CNN
F 1 "74HC74" H 4900 6540 50  0000 C CNN
F 2 "" H 4900 6150 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4900 6150 50  0001 C CNN
	1    4900 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6250 5200 6500
Wire Wire Line
	4500 6050 4500 6500
Wire Wire Line
	4500 6050 4600 6050
Wire Wire Line
	4500 6500 5200 6500
Text GLabel 4400 6150 0    50   Input ~ 0
HPULSE
Wire Wire Line
	4600 6150 4400 6150
NoConn ~ 5200 4850
Text Notes 5200 7100 0    50   ~ 0
Write ready
Text Notes 5250 6500 0    50   ~ 0
~HSYNC
Text GLabel 5200 6050 2    50   Input ~ 0
#HSYNC
NoConn ~ 1950 4000
$Comp
L 74xx:74HC541 U?
U 1 1 62245D6C
P 10200 4050
F 0 "U?" H 10200 5031 50  0000 C CNN
F 1 "74HC541" H 10200 4940 50  0000 C CNN
F 2 "" H 10200 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 10200 4050 50  0001 C CNN
	1    10200 4050
	1    0    0    -1  
$EndComp
Text GLabel 9950 1700 0    50   Input ~ 0
WA8
Text GLabel 9950 1800 0    50   Input ~ 0
WA9
Text GLabel 9950 1900 0    50   Input ~ 0
WA10
NoConn ~ 9950 2000
Text GLabel 9950 2100 0    50   Input ~ 0
WRDY
Text GLabel 4600 6750 0    50   Input ~ 0
DATARDY
Wire Wire Line
	8650 3250 8900 3250
Wire Wire Line
	8650 4900 8650 4850
$Comp
L 74xx:74HC541 U?
U 1 1 62242671
P 8650 4050
F 0 "U?" H 8650 5031 50  0000 C CNN
F 1 "74HC541" H 8650 4940 50  0000 C CNN
F 2 "" H 8650 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 8650 4050 50  0001 C CNN
	1    8650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4550 8150 4850
Wire Wire Line
	8150 4850 8650 4850
Connection ~ 8650 4850
Wire Wire Line
	9700 4550 9700 4850
Wire Wire Line
	9700 4850 10200 4850
$Comp
L power:GND #PWR?
U 1 1 6228001F
P 10200 4850
F 0 "#PWR?" H 10200 4600 50  0001 C CNN
F 1 "GND" H 10205 4677 50  0000 C CNN
F 2 "" H 10200 4850 50  0001 C CNN
F 3 "" H 10200 4850 50  0001 C CNN
	1    10200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3850 9700 4250
Wire Wire Line
	9500 3850 9700 3850
$Comp
L power:GND #PWR?
U 1 1 622324B0
P 9500 3850
F 0 "#PWR?" H 9500 3600 50  0001 C CNN
F 1 "GND" H 9505 3677 50  0000 C CNN
F 2 "" H 9500 3850 50  0001 C CNN
F 3 "" H 9500 3850 50  0001 C CNN
	1    9500 3850
	1    0    0    -1  
$EndComp
Text GLabel 9700 3550 0    50   Input ~ 0
WA8
Text GLabel 9700 3650 0    50   Input ~ 0
WA9
Text GLabel 9700 3750 0    50   Input ~ 0
WA10
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
L power:GND #PWR?
U 1 1 622EEB1E
P 3100 2550
F 0 "#PWR?" H 3100 2300 50  0001 C CNN
F 1 "GND" V 3105 2422 50  0000 R CNN
F 2 "" H 3100 2550 50  0001 C CNN
F 3 "" H 3100 2550 50  0001 C CNN
	1    3100 2550
	1    0    0    -1  
$EndComp
Text GLabel 2600 1150 0    50   Input ~ 0
PRESET
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
L power:VCC #PWR?
U 1 1 622FC55E
P 3350 850
F 0 "#PWR?" H 3350 700 50  0001 C CNN
F 1 "VCC" H 3365 1023 50  0000 C CNN
F 2 "" H 3350 850 50  0001 C CNN
F 3 "" H 3350 850 50  0001 C CNN
	1    3350 850 
	1    0    0    -1  
$EndComp
NoConn ~ 3600 2150
NoConn ~ 3600 2250
$Comp
L power:GND #PWR?
U 1 1 622CDEF0
P 1450 2550
F 0 "#PWR?" H 1450 2300 50  0001 C CNN
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
Text GLabel 4600 4400 0    50   Input ~ 0
#LRESET
$Comp
L Device:R_Small_US R?
U 1 1 623E1086
P 5700 3900
F 0 "R?" V 5813 3900 50  0001 C CNN
F 1 "R_Small_US" V 5814 3900 50  0001 C CNN
F 2 "" H 5700 3900 50  0001 C CNN
F 3 "~" H 5700 3900 50  0001 C CNN
	1    5700 3900
	-1   0    0    1   
$EndComp
Text GLabel 4600 4050 0    50   Input ~ 0
#PRESET
Text Notes 5050 4300 0    50   ~ 0
#PRESET pulse
$Comp
L Device:C_Small C?
U 1 1 6235FCD8
P 5300 4150
F 0 "C?" V 5529 4150 50  0001 C CNN
F 1 "C_Small" V 5437 4150 50  0001 C CNN
F 2 "" H 5300 4150 50  0001 C CNN
F 3 "~" H 5300 4150 50  0001 C CNN
	1    5300 4150
	0    -1   -1   0   
$EndComp
Text GLabel 5800 4500 2    50   Input ~ 0
LRMS
Connection ~ 5700 4150
$Comp
L power:GND #PWR?
U 1 1 6235FCE1
P 5700 4350
F 0 "#PWR?" H 5700 4100 50  0001 C CNN
F 1 "GND" H 5705 4177 50  0000 C CNN
F 2 "" H 5700 4350 50  0001 C CNN
F 3 "" H 5700 4350 50  0001 C CNN
	1    5700 4350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 6235FCE7
P 5700 4250
F 0 "R?" V 5813 4250 50  0001 C CNN
F 1 "R_Small_US" V 5814 4250 50  0001 C CNN
F 2 "" H 5700 4250 50  0001 C CNN
F 3 "~" H 5700 4250 50  0001 C CNN
	1    5700 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5800 4150 5700 4150
Text Notes 5050 4650 0    50   ~ 0
#LRESET pulse
$Comp
L Device:C_Small C?
U 1 1 623621DE
P 5300 4500
F 0 "C?" V 5529 4500 50  0001 C CNN
F 1 "C_Small" V 5437 4500 50  0001 C CNN
F 2 "" H 5300 4500 50  0001 C CNN
F 3 "~" H 5300 4500 50  0001 C CNN
	1    5300 4500
	0    -1   -1   0   
$EndComp
Text GLabel 5800 4150 2    50   Input ~ 0
PRMS
Connection ~ 5700 4500
$Comp
L power:GND #PWR?
U 1 1 623621E7
P 5700 4700
F 0 "#PWR?" H 5700 4450 50  0001 C CNN
F 1 "GND" H 5705 4527 50  0000 C CNN
F 2 "" H 5700 4700 50  0001 C CNN
F 3 "" H 5700 4700 50  0001 C CNN
	1    5700 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 623621ED
P 5700 4600
F 0 "R?" V 5813 4600 50  0001 C CNN
F 1 "R_Small_US" V 5814 4600 50  0001 C CNN
F 2 "" H 5700 4600 50  0001 C CNN
F 3 "~" H 5700 4600 50  0001 C CNN
	1    5700 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5800 4500 5700 4500
NoConn ~ 5200 2650
Text GLabel 5200 1950 2    50   Input ~ 0
#LRPULSE
Text GLabel 4600 1950 0    50   Input ~ 0
LRMS
Text GLabel 5200 900  2    50   Input ~ 0
#LDPULSE
Text GLabel 4600 900  0    50   Input ~ 0
P4MS
Text GLabel 5200 1250 2    50   Input ~ 0
#PRPULSE
Text GLabel 4600 1250 0    50   Input ~ 0
PRMS
$Comp
L 74xx:74HC04 U?
U 6 1 622397DE
P 4900 2650
F 0 "U?" H 4900 2875 50  0001 C CNN
F 1 "74HC04" H 4900 2876 50  0001 C CNN
F 2 "" H 4900 2650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 2650 50  0001 C CNN
	6    4900 2650
	1    0    0    -1  
$EndComp
Text GLabel 4600 1600 0    50   Input ~ 0
#PRPULSE
Text GLabel 5200 1600 2    50   Input ~ 0
PRESET
Text GLabel 4600 2300 0    50   Input ~ 0
#LRPULSE
Text GLabel 5200 2300 2    50   Input ~ 0
LRESET
Text GLabel 4600 4250 0    50   Input ~ 0
#PRPULSE
Text GLabel 4600 4600 0    50   Input ~ 0
#LRPULSE
Connection ~ 5700 3800
Wire Wire Line
	5800 3800 5700 3800
$Comp
L power:GND #PWR0144
U 1 1 623D8172
P 5700 4000
F 0 "#PWR0144" H 5700 3750 50  0001 C CNN
F 1 "GND" H 5705 3827 50  0000 C CNN
F 2 "" H 5700 4000 50  0001 C CNN
F 3 "" H 5700 4000 50  0001 C CNN
	1    5700 4000
	0    -1   -1   0   
$EndComp
Text GLabel 5800 3800 2    50   Input ~ 0
P4MS
Wire Wire Line
	5400 4150 5700 4150
Wire Wire Line
	5400 4500 5700 4500
Wire Wire Line
	5400 3800 5700 3800
Text GLabel 950  1450 0    50   Input ~ 0
PRESET
Wire Wire Line
	4600 4750 4400 4750
Wire Wire Line
	4400 4750 4400 4950
Connection ~ 4400 5250
Wire Wire Line
	4600 4950 4400 4950
Connection ~ 4400 4950
Wire Wire Line
	4400 4950 4400 5250
Text Notes 5750 5500 0    100  ~ 0
Get rid of BUS/#BUS and use #OE and #WE instead.
$EndSCHEMATC
