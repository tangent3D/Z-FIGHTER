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
Text GLabel 1850 950  2    50   Input ~ 0
P0
Text GLabel 1850 1050 2    50   Input ~ 0
P1
Text GLabel 1850 1150 2    50   Input ~ 0
P2
Text GLabel 1850 1250 2    50   Input ~ 0
P3
Text GLabel 1850 1350 2    50   Input ~ 0
P4
Text GLabel 1850 1450 2    50   Input ~ 0
P5
Text GLabel 1850 1550 2    50   Input ~ 0
P6
Text GLabel 1850 1650 2    50   Input ~ 0
P7
$Comp
L power:VCC #PWR0101
U 1 1 6204084C
P 10200 5550
F 0 "#PWR0101" H 10200 5400 50  0001 C CNN
F 1 "VCC" H 10215 5723 50  0000 C CNN
F 2 "" H 10200 5550 50  0001 C CNN
F 3 "" H 10200 5550 50  0001 C CNN
	1    10200 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 62042787
P 10200 6150
F 0 "#PWR0102" H 10200 5900 50  0001 C CNN
F 1 "GND" H 10205 5977 50  0000 C CNN
F 2 "" H 10200 6150 50  0001 C CNN
F 3 "" H 10200 6150 50  0001 C CNN
	1    10200 6150
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 6203895A
P 10200 5850
F 0 "X?" H 10544 5896 50  0000 L CNN
F 1 "CXO_DIP14" H 10544 5805 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 10650 5500 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 10100 5850 50  0001 C CNN
	1    10200 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5850 10500 6050
Wire Wire Line
	10500 6050 10600 6050
Text GLabel 10600 6050 2    50   Input ~ 0
CLOCK
$Comp
L 74xx:74HC590 U?
U 1 1 6219A492
P 1450 1450
F 0 "U?" H 1450 2331 50  0000 C CNN
F 1 "74HC590" H 1450 2240 50  0000 C CNN
F 2 "" H 1450 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 1450 1500 50  0001 C CNN
	1    1450 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1850 2050 1850
Wire Wire Line
	1050 1650 1050 2050
Wire Wire Line
	1050 2050 1450 2050
Wire Wire Line
	1050 1150 1050 1200
Text GLabel 1000 1200 0    50   Input ~ 0
CLOCK
Wire Wire Line
	1050 1200 1000 1200
Connection ~ 1050 1200
Wire Wire Line
	1050 1200 1050 1250
$Comp
L power:GND #PWR0105
U 1 1 621A7D62
P 1050 950
F 0 "#PWR0105" H 1050 700 50  0001 C CNN
F 1 "GND" V 1055 822 50  0000 R CNN
F 2 "" H 1050 950 50  0001 C CNN
F 3 "" H 1050 950 50  0001 C CNN
	1    1050 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 1850 2050 950 
Wire Wire Line
	2700 1200 2700 1250
Connection ~ 2700 1200
Wire Wire Line
	2700 1200 2650 1200
Wire Wire Line
	2700 1150 2700 1200
Text GLabel 2650 1200 0    50   Input ~ 0
CLOCK
Wire Wire Line
	2700 2050 3100 2050
Wire Wire Line
	2700 1650 2700 2050
$Comp
L 74xx:74HC590 U?
U 1 1 6219E834
P 3100 1450
F 0 "U?" H 3100 2331 50  0000 C CNN
F 1 "74HC590" H 3100 2240 50  0000 C CNN
F 2 "" H 3100 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 3100 1500 50  0001 C CNN
	1    3100 1450
	1    0    0    -1  
$EndComp
NoConn ~ 3500 1150
NoConn ~ 3500 1250
NoConn ~ 3500 1350
NoConn ~ 3500 1450
NoConn ~ 3500 1550
NoConn ~ 3500 1650
Text GLabel 3500 1050 2    50   Input ~ 0
P9
Text GLabel 3500 950  2    50   Input ~ 0
P8
Text GLabel 2600 7200 0    50   Input ~ 0
L9
Text GLabel 1950 6500 2    50   Input ~ 0
#HSET
Text GLabel 1950 6300 2    50   Input ~ 0
#PRESET
Text GLabel 2600 7100 0    50   Input ~ 0
L8
Text GLabel 2600 7000 0    50   Input ~ 0
L7
Text GLabel 2600 6900 0    50   Input ~ 0
L6
Text GLabel 2600 6800 0    50   Input ~ 0
L5
Text GLabel 2600 6700 0    50   Input ~ 0
L4
Text GLabel 2600 6600 0    50   Input ~ 0
L3
Text GLabel 2600 6500 0    50   Input ~ 0
L2
Text GLabel 2600 6400 0    50   Input ~ 0
L1
Text GLabel 2600 6300 0    50   Input ~ 0
L0
Text GLabel 950  7200 0    50   Input ~ 0
P9
Text GLabel 950  7100 0    50   Input ~ 0
P8
$Comp
L power:VCC #PWR0113
U 1 1 62179416
P 1700 6100
F 0 "#PWR0113" H 1700 5950 50  0001 C CNN
F 1 "VCC" H 1715 6273 50  0000 C CNN
F 2 "" H 1700 6100 50  0001 C CNN
F 3 "" H 1700 6100 50  0001 C CNN
	1    1700 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6100 1450 6100
Wire Wire Line
	3350 6100 3100 6100
$Comp
L power:VCC #PWR0121
U 1 1 62262930
P 3350 6100
F 0 "#PWR0121" H 3350 5950 50  0001 C CNN
F 1 "VCC" H 3365 6273 50  0000 C CNN
F 2 "" H 3350 6100 50  0001 C CNN
F 3 "" H 3350 6100 50  0001 C CNN
	1    3350 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6226292A
P 3100 7500
F 0 "#PWR0120" H 3100 7250 50  0001 C CNN
F 1 "GND" H 3105 7327 50  0000 C CNN
F 2 "" H 3100 7500 50  0001 C CNN
F 3 "" H 3100 7500 50  0001 C CNN
	1    3100 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 621750F4
P 1450 7500
F 0 "#PWR0110" H 1450 7250 50  0001 C CNN
F 1 "GND" H 1455 7327 50  0000 C CNN
F 2 "" H 1450 7500 50  0001 C CNN
F 3 "" H 1450 7500 50  0001 C CNN
	1    1450 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 621D957D
P 1050 2050
F 0 "#PWR0109" H 1050 1800 50  0001 C CNN
F 1 "GND" V 1055 1922 50  0000 R CNN
F 2 "" H 1050 2050 50  0001 C CNN
F 3 "" H 1050 2050 50  0001 C CNN
	1    1050 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 621D9B1F
P 2700 2050
F 0 "#PWR0111" H 2700 1800 50  0001 C CNN
F 1 "GND" V 2705 1922 50  0000 R CNN
F 2 "" H 2700 2050 50  0001 C CNN
F 3 "" H 2700 2050 50  0001 C CNN
	1    2700 2050
	1    0    0    -1  
$EndComp
Connection ~ 2700 2050
Wire Wire Line
	2050 950  2700 950 
$Comp
L power:VCC #PWR0115
U 1 1 621DFC25
P 1700 750
F 0 "#PWR0115" H 1700 600 50  0001 C CNN
F 1 "VCC" H 1715 923 50  0000 C CNN
F 2 "" H 1700 750 50  0001 C CNN
F 3 "" H 1700 750 50  0001 C CNN
	1    1700 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 750  1450 750 
$Comp
L power:VCC #PWR0116
U 1 1 621E0C65
P 3350 750
F 0 "#PWR0116" H 3350 600 50  0001 C CNN
F 1 "VCC" H 3365 923 50  0000 C CNN
F 2 "" H 3350 750 50  0001 C CNN
F 3 "" H 3350 750 50  0001 C CNN
	1    3350 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 750  3100 750 
Connection ~ 1050 2050
Text GLabel 5200 900  2    50   Input ~ 0
PRESET
Text GLabel 950  6300 0    50   Input ~ 0
P0
Text GLabel 950  6400 0    50   Input ~ 0
P1
Text GLabel 950  6500 0    50   Input ~ 0
P2
Text GLabel 950  6600 0    50   Input ~ 0
P3
Text GLabel 950  6700 0    50   Input ~ 0
P4
Text GLabel 950  6800 0    50   Input ~ 0
P5
Text GLabel 950  6900 0    50   Input ~ 0
P6
Text GLabel 950  7000 0    50   Input ~ 0
P7
Text Notes 1500 2050 0    50   ~ 0
Pixel Counter
Text Notes 1500 7450 0    50   ~ 0
Pixel Decoder
Text Notes 3150 7450 0    50   ~ 0
Line Decoder
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 62262924
P 3100 6800
F 0 "U?" H 3100 7681 50  0000 C CNN
F 1 "GAL16V8" H 3100 7590 50  0000 C CNN
F 2 "" H 3100 6800 50  0001 C CNN
F 3 "" H 3100 6800 50  0001 C CNN
	1    3100 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 621EA37A
P 3100 5600
F 0 "#PWR0119" H 3100 5350 50  0001 C CNN
F 1 "GND" H 3105 5427 50  0000 C CNN
F 2 "" H 3100 5600 50  0001 C CNN
F 3 "" H 3100 5600 50  0001 C CNN
	1    3100 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 621E617F
P 1450 5600
F 0 "#PWR0122" H 1450 5350 50  0001 C CNN
F 1 "GND" H 1455 5427 50  0000 C CNN
F 2 "" H 1450 5600 50  0001 C CNN
F 3 "" H 1450 5600 50  0001 C CNN
	1    1450 5600
	1    0    0    -1  
$EndComp
Text GLabel 950  4300 0    50   Input ~ 0
P5
Text GLabel 950  4400 0    50   Input ~ 0
P6
Text GLabel 950  4500 0    50   Input ~ 0
P7
Text GLabel 950  4600 0    50   Input ~ 0
P8
Text GLabel 1950 4600 2    50   Input ~ 0
A3
Text GLabel 1950 4500 2    50   Input ~ 0
A2
Text GLabel 1950 4400 2    50   Input ~ 0
A1
Text GLabel 1950 4300 2    50   Input ~ 0
A0
Text GLabel 2600 4300 0    50   Input ~ 0
L2
Text GLabel 2600 4400 0    50   Input ~ 0
L3
Text GLabel 2600 4500 0    50   Input ~ 0
L4
Text GLabel 2600 4600 0    50   Input ~ 0
L5
Text GLabel 2600 4700 0    50   Input ~ 0
L6
Text GLabel 2600 4800 0    50   Input ~ 0
L7
Text GLabel 2600 4900 0    50   Input ~ 0
L8
NoConn ~ 1950 5000
NoConn ~ 1950 4900
NoConn ~ 1950 4800
NoConn ~ 1950 4700
Wire Wire Line
	950  4700 950  4800
Connection ~ 950  4800
Wire Wire Line
	950  4800 950  4900
Connection ~ 950  4900
Wire Wire Line
	950  4900 950  5000
Wire Wire Line
	3100 5600 2550 5600
Wire Wire Line
	2550 5600 2550 5000
Wire Wire Line
	2550 5000 2600 5000
NoConn ~ 3600 5000
$Comp
L power:GND #PWR0123
U 1 1 622538F3
P 4400 5300
F 0 "#PWR0123" H 4400 5050 50  0001 C CNN
F 1 "GND" H 4405 5127 50  0000 C CNN
F 2 "" H 4400 5300 50  0001 C CNN
F 3 "" H 4400 5300 50  0001 C CNN
	1    4400 5300
	1    0    0    -1  
$EndComp
Connection ~ 950  4700
$Comp
L 74xx:74HC00 U?
U 3 1 62236D7F
P 4900 4550
F 0 "U?" H 4900 4875 50  0001 C CNN
F 1 "74HC00" H 4900 4783 50  0001 C CNN
F 2 "" H 4900 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4550 50  0001 C CNN
	3    4900 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 4 1 622384DB
P 4900 4900
F 0 "U?" H 4900 5225 50  0001 C CNN
F 1 "74HC00" H 4900 5133 50  0001 C CNN
F 2 "" H 4900 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4900 50  0001 C CNN
	4    4900 4900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 6223A0D4
P 4900 5300
F 0 "U?" V 4625 5300 50  0001 C CNN
F 1 "74HC00" V 4624 5300 50  0001 C CNN
F 2 "" H 4900 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5300 50  0001 C CNN
	5    4900 5300
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0125
U 1 1 62254857
P 5400 5300
F 0 "#PWR0125" H 5400 5150 50  0001 C CNN
F 1 "VCC" H 5415 5473 50  0000 C CNN
F 2 "" H 5400 5300 50  0001 C CNN
F 3 "" H 5400 5300 50  0001 C CNN
	1    5400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  4700 800  4700
$Comp
L power:GND #PWR0126
U 1 1 6221B23E
P 800 4700
F 0 "#PWR0126" H 800 4450 50  0001 C CNN
F 1 "GND" H 805 4527 50  0000 C CNN
F 2 "" H 800 4700 50  0001 C CNN
F 3 "" H 800 4700 50  0001 C CNN
	1    800  4700
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
Text GLabel 3600 4300 2    50   Input ~ 0
A4
Text GLabel 3600 4400 2    50   Input ~ 0
A5
Text GLabel 3600 4500 2    50   Input ~ 0
A6
Text GLabel 3600 4600 2    50   Input ~ 0
A7
Text GLabel 3600 4700 2    50   Input ~ 0
A8
Text GLabel 3600 4900 2    50   Input ~ 0
A10
Text GLabel 3600 4800 2    50   Input ~ 0
A9
$Comp
L 74xx:74HC541 U?
U 1 1 621D9E12
P 1450 4800
F 0 "U?" H 1450 5781 50  0000 C CNN
F 1 "74HC541" H 1450 5690 50  0000 C CNN
F 2 "" H 1450 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 1450 4800 50  0001 C CNN
	1    1450 4800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0127
U 1 1 621E3CB7
P 1700 4000
F 0 "#PWR0127" H 1700 3850 50  0001 C CNN
F 1 "VCC" H 1715 4173 50  0000 C CNN
F 2 "" H 1700 4000 50  0001 C CNN
F 3 "" H 1700 4000 50  0001 C CNN
	1    1700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4000 1450 4000
Text Notes 1500 3700 0    50   ~ 0
Line Counter
Connection ~ 2700 3700
Connection ~ 1050 3700
Wire Wire Line
	1700 2400 1450 2400
$Comp
L power:VCC #PWR0114
U 1 1 621DE492
P 1700 2400
F 0 "#PWR0114" H 1700 2250 50  0001 C CNN
F 1 "VCC" H 1715 2573 50  0000 C CNN
F 2 "" H 1700 2400 50  0001 C CNN
F 3 "" H 1700 2400 50  0001 C CNN
	1    1700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2400 3100 2400
$Comp
L power:VCC #PWR0112
U 1 1 621DD53E
P 3350 2400
F 0 "#PWR0112" H 3350 2250 50  0001 C CNN
F 1 "VCC" H 3365 2573 50  0000 C CNN
F 2 "" H 3350 2400 50  0001 C CNN
F 3 "" H 3350 2400 50  0001 C CNN
	1    3350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2600 2700 2600
$Comp
L power:GND #PWR0108
U 1 1 621D8D9D
P 2700 3700
F 0 "#PWR0108" H 2700 3450 50  0001 C CNN
F 1 "GND" V 2705 3572 50  0000 R CNN
F 2 "" H 2700 3700 50  0001 C CNN
F 3 "" H 2700 3700 50  0001 C CNN
	1    2700 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 621D86E4
P 1050 3700
F 0 "#PWR0107" H 1050 3450 50  0001 C CNN
F 1 "GND" V 1055 3572 50  0000 R CNN
F 2 "" H 1050 3700 50  0001 C CNN
F 3 "" H 1050 3700 50  0001 C CNN
	1    1050 3700
	1    0    0    -1  
$EndComp
NoConn ~ 3500 3300
NoConn ~ 3500 3200
NoConn ~ 3500 3100
NoConn ~ 3500 3000
NoConn ~ 3500 2900
NoConn ~ 3500 2800
$Comp
L 74xx:74HC590 U?
U 1 1 621AD637
P 3100 3100
F 0 "U?" H 3100 3981 50  0000 C CNN
F 1 "74HC590" H 3100 3890 50  0000 C CNN
F 2 "" H 3100 3150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 3100 3150 50  0001 C CNN
	1    3100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3300 2700 3700
Wire Wire Line
	2700 3700 3100 3700
Wire Wire Line
	2700 2800 2700 2850
Wire Wire Line
	2700 2850 2650 2850
Connection ~ 2700 2850
Wire Wire Line
	2700 2850 2700 2900
Text GLabel 3500 2600 2    50   Input ~ 0
L8
Text GLabel 3500 2700 2    50   Input ~ 0
L9
Text GLabel 2650 2850 0    50   Input ~ 0
PRESET
Text GLabel 1000 2850 0    50   Input ~ 0
PRESET
Text GLabel 1850 3300 2    50   Input ~ 0
L7
Text GLabel 1850 3200 2    50   Input ~ 0
L6
Text GLabel 1850 3100 2    50   Input ~ 0
L5
Text GLabel 1850 3000 2    50   Input ~ 0
L4
Text GLabel 1850 2900 2    50   Input ~ 0
L3
Text GLabel 1850 2800 2    50   Input ~ 0
L2
Text GLabel 1850 2700 2    50   Input ~ 0
L1
Text GLabel 1850 2600 2    50   Input ~ 0
L0
$Comp
L power:GND #PWR0106
U 1 1 621AD650
P 1050 2600
F 0 "#PWR0106" H 1050 2350 50  0001 C CNN
F 1 "GND" V 1055 2472 50  0000 R CNN
F 2 "" H 1050 2600 50  0001 C CNN
F 3 "" H 1050 2600 50  0001 C CNN
	1    1050 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 2850 1050 2900
Connection ~ 1050 2850
Wire Wire Line
	1050 2850 1000 2850
Wire Wire Line
	1050 2800 1050 2850
Wire Wire Line
	1050 3700 1450 3700
Wire Wire Line
	1050 3300 1050 3700
Wire Wire Line
	2050 3500 2050 2600
Wire Wire Line
	1850 3500 2050 3500
$Comp
L 74xx:74HC590 U?
U 1 1 621AD629
P 1450 3100
F 0 "U?" H 1450 3981 50  0000 C CNN
F 1 "74HC590" H 1450 3890 50  0000 C CNN
F 2 "" H 1450 3150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 1450 3150 50  0001 C CNN
	1    1450 3100
	1    0    0    -1  
$EndComp
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
Wire Wire Line
	6850 2650 6350 2650
Wire Wire Line
	6350 2650 6350 2350
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
Text GLabel 6350 2250 0    50   Input ~ 0
#P1
Text GLabel 6350 2050 0    50   Input ~ 0
#LOAD
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
L power:GND #PWR0104
U 1 1 62221546
P 6200 1050
F 0 "#PWR0104" H 6200 800 50  0001 C CNN
F 1 "GND" H 6205 877 50  0000 C CNN
F 2 "" H 6200 1050 50  0001 C CNN
F 3 "" H 6200 1050 50  0001 C CNN
	1    6200 1050
	0    1    1    0   
$EndComp
Text GLabel 6350 1150 0    50   Input ~ 0
D0
Wire Wire Line
	6200 1050 6350 1050
Text GLabel 7350 1050 2    50   Input ~ 0
SERIAL
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
Text Notes 1500 5500 0    50   ~ 0
Pixel Address Buffer
Text Notes 3150 5500 0    50   ~ 0
Line Address Buffer
Text Notes 6900 4900 0    50   ~ 0
SRAM
Wire Wire Line
	7100 750  6850 750 
Text Notes 8700 2250 0    50   ~ 0
Write Data Buffer
$Comp
L power:GND #PWR0135
U 1 1 622D4D53
P 10200 4900
F 0 "#PWR0135" H 10200 4650 50  0001 C CNN
F 1 "GND" H 10205 4727 50  0000 C CNN
F 2 "" H 10200 4900 50  0001 C CNN
F 3 "" H 10200 4900 50  0001 C CNN
	1    10200 4900
	1    0    0    -1  
$EndComp
Text Notes 10250 4750 0    50   ~ 0
Write Address Latch (Hi)
Text Notes 3150 3700 0    50   ~ 0
Line Counter
Text Notes 3150 2050 0    50   ~ 0
Pixel Counter
Text GLabel 10700 3550 2    50   Input ~ 0
A8
Text GLabel 10700 3750 2    50   Input ~ 0
A10
Text GLabel 10700 3650 2    50   Input ~ 0
A9
Text GLabel 10450 1700 2    50   Input ~ 0
WD0
Text GLabel 10450 1800 2    50   Input ~ 0
WD1
Text GLabel 10450 1900 2    50   Input ~ 0
WD2
Text GLabel 10450 2000 2    50   Input ~ 0
WD3
Text GLabel 10450 2100 2    50   Input ~ 0
WD4
Text GLabel 10450 2200 2    50   Input ~ 0
WD5
Text GLabel 10450 2300 2    50   Input ~ 0
WD6
Text GLabel 10450 2400 2    50   Input ~ 0
WD7
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
Connection ~ 3100 5600
Wire Wire Line
	3350 4000 3100 4000
$Comp
L 74xx:74HC541 U?
U 1 1 621EA36D
P 3100 4800
F 0 "U?" H 3100 5781 50  0000 C CNN
F 1 "74HC541" H 3100 5690 50  0000 C CNN
F 2 "" H 3100 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 3100 4800 50  0001 C CNN
	1    3100 4800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0128
U 1 1 621EA373
P 3350 4000
F 0 "#PWR0128" H 3350 3850 50  0001 C CNN
F 1 "VCC" H 3365 4173 50  0000 C CNN
F 2 "" H 3350 4000 50  0001 C CNN
F 3 "" H 3350 4000 50  0001 C CNN
	1    3350 4000
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
Text GLabel 10450 2800 2    50   Input ~ 0
WA3
Text GLabel 10450 2500 2    50   Input ~ 0
WA0
Text GLabel 10450 2600 2    50   Input ~ 0
WA1
Text GLabel 10450 2700 2    50   Input ~ 0
WA2
$Comp
L 74xx:74LS573 U?
U 1 1 622882D1
P 10200 4050
F 0 "U?" H 10200 5031 50  0000 C CNN
F 1 "74HC573" H 10200 4940 50  0000 C CNN
F 2 "" H 10200 4050 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 10200 4050 50  0001 C CNN
	1    10200 4050
	1    0    0    -1  
$EndComp
Text GLabel 9950 2500 0    50   Input ~ 0
WA7
Text GLabel 9950 2800 0    50   Input ~ 0
WA4
Text GLabel 9950 2700 0    50   Input ~ 0
WA5
Text GLabel 9950 2600 0    50   Input ~ 0
WA6
Text GLabel 9700 4150 0    50   Input ~ 0
WA6
Text GLabel 9700 4050 0    50   Input ~ 0
WA5
Text GLabel 9700 3950 0    50   Input ~ 0
WA4
Text GLabel 9700 4250 0    50   Input ~ 0
WA7
Text GLabel 9700 3850 0    50   Input ~ 0
WA3
Text GLabel 9700 3550 0    50   Input ~ 0
WA0
Text GLabel 9700 3650 0    50   Input ~ 0
WA1
Text GLabel 9700 3750 0    50   Input ~ 0
WA2
Text GLabel 9950 1800 0    50   Input ~ 0
LL
Text GLabel 9950 1700 0    50   Input ~ 0
LU
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
P 4900 4200
F 0 "U?" H 4900 4433 50  0001 C CNN
F 1 "74HC00" H 4900 4434 50  0001 C CNN
F 2 "" H 4900 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4200 50  0001 C CNN
	2    4900 4200
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
Text GLabel 3600 6500 2    50   Input ~ 0
#ACTVID
Text GLabel 4600 4650 0    50   Input ~ 0
LL
Text GLabel 9700 4450 0    50   Input ~ 0
LU
Text GLabel 4600 4450 0    50   Input ~ 0
LU
Text GLabel 9950 1900 0    50   Input ~ 0
CC
Text GLabel 9950 2000 0    50   Input ~ 0
CL
Text GLabel 9950 2100 0    50   Input ~ 0
CD1
Text GLabel 9950 2200 0    50   Input ~ 0
CD2
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
Text GLabel 8150 4450 0    50   Input ~ 0
LL
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
Wire Wire Line
	8650 3250 8900 3250
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
Text Notes 8700 4750 0    50   ~ 0
Write Address Latch (Lo)
$Comp
L 74xx:74LS573 U?
U 1 1 622253F3
P 8650 4050
F 0 "U?" H 8650 5031 50  0000 C CNN
F 1 "74HC573" H 8650 4940 50  0000 C CNN
F 2 "" H 8650 4050 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 8650 4050 50  0001 C CNN
	1    8650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1950 8150 2000
Wire Wire Line
	8150 2000 8100 2000
Connection ~ 8150 2000
Wire Wire Line
	8150 2000 8150 2050
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
Connection ~ 6850 2650
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
	2600 5250 2500 5250
Wire Wire Line
	2600 5200 2600 5250
Wire Wire Line
	2600 5250 2600 5300
Connection ~ 2600 5250
Wire Wire Line
	950  5250 850  5250
Wire Wire Line
	950  5200 950  5250
Wire Wire Line
	950  5250 950  5300
Connection ~ 950  5250
Wire Wire Line
	10800 2900 10450 2900
$Comp
L power:GND #PWR0133
U 1 1 621F0C8A
P 8650 2650
F 0 "#PWR0133" H 8650 2400 50  0001 C CNN
F 1 "GND" H 8655 2477 50  0000 C CNN
F 2 "" H 8650 2650 50  0001 C CNN
F 3 "" H 8650 2650 50  0001 C CNN
	1    8650 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 3250 10450 3250
Wire Wire Line
	8650 4900 8650 4850
Wire Wire Line
	10200 4850 10200 4900
Wire Wire Line
	8650 2350 8650 2650
NoConn ~ 10700 3850
NoConn ~ 10700 3950
NoConn ~ 10700 4050
NoConn ~ 10700 4150
NoConn ~ 10700 4250
Text GLabel 4600 3600 0    50   Input ~ 0
#HSET
Text GLabel 4600 4300 0    50   Input ~ 0
#HRESET
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 62173FE1
P 1450 6800
F 0 "U?" H 1450 7681 50  0000 C CNN
F 1 "GAL16V8" H 1450 7590 50  0000 C CNN
F 2 "" H 1450 6800 50  0001 C CNN
F 3 "" H 1450 6800 50  0001 C CNN
	1    1450 6800
	1    0    0    -1  
$EndComp
Text GLabel 1950 6400 2    50   Input ~ 0
#HRESET
Text GLabel 1950 7000 2    50   Input ~ 0
#WRDY
Text Notes 5050 5050 0    50   ~ 0
CE2 low during addr. transitions
Wire Wire Line
	7350 4200 7400 4200
Wire Wire Line
	7400 4200 7400 4600
$Comp
L power:GND #PWR?
U 1 1 6227127D
P 7400 4600
F 0 "#PWR?" H 7400 4350 50  0001 C CNN
F 1 "GND" H 7405 4427 50  0000 C CNN
F 2 "" H 7400 4600 50  0001 C CNN
F 3 "" H 7400 4600 50  0001 C CNN
	1    7400 4600
	1    0    0    -1  
$EndComp
Text GLabel 3600 6400 2    50   Input ~ 0
#VSYNC
Text GLabel 3600 6300 2    50   Input ~ 0
#LRESET
Text GLabel 5200 4550 2    50   Input ~ 0
#WRDY
Text GLabel 5300 3700 2    50   Input ~ 0
#HSYNC
Text GLabel 4600 900  0    50   Input ~ 0
#PRESET
Text GLabel 1050 1450 0    50   Input ~ 0
#PRESET
Text GLabel 2700 1450 0    50   Input ~ 0
#PRESET
Text GLabel 2700 3100 0    50   Input ~ 0
#LRESET
Text GLabel 1050 3100 0    50   Input ~ 0
#LRESET
Text GLabel 5200 1250 2    50   Input ~ 0
#P1
Text GLabel 850  5250 0    50   Input ~ 0
P1
Text GLabel 2500 5250 0    50   Input ~ 0
P1
Text GLabel 8150 4550 0    50   Input ~ 0
#P1
Text GLabel 9700 4550 0    50   Input ~ 0
#P1
Text GLabel 8100 2000 0    50   Input ~ 0
#P1
Text GLabel 7450 4300 2    50   Input ~ 0
P1
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
Text GLabel 1950 6700 2    50   Input ~ 0
#WE
Text GLabel 4600 4800 0    50   Input ~ 0
#P0
Text GLabel 4600 5000 0    50   Input ~ 0
P1
Text GLabel 5200 4900 2    50   Input ~ 0
CE2
Text Notes 5050 4700 0    50   ~ 0
Write ready
Text Notes 5950 5500 0    50   ~ 0
Read Cycle: /OE low, /CE low, /WE high, CE2 high\nWrite Cycle: /CE low, /WE low, CE2 high\n"WE#, CE# must be high or CE2 must be low\nduring all address transitions."
Text GLabel 5200 1600 2    50   Input ~ 0
#P0
Text GLabel 4600 1600 0    50   Input ~ 0
P0
Text GLabel 4600 1250 0    50   Input ~ 0
P1
Text Notes 9250 3000 0    50   ~ 0
Z-Fighter Connectors
NoConn ~ 9950 2300
NoConn ~ 9950 2400
$Comp
L 74xx:74HC00 U?
U 1 1 6222CFFF
P 4900 3700
F 0 "U?" H 4900 4025 50  0000 C CNN
F 1 "74HC00" H 4900 3934 50  0000 C CNN
F 2 "" H 4900 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 3700 50  0001 C CNN
	1    4900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3900 5200 3700
Wire Wire Line
	5200 4000 5200 4200
Wire Wire Line
	4600 4000 5200 3900
Wire Wire Line
	4600 4000 4600 4100
Wire Wire Line
	4600 3900 5200 4000
Wire Wire Line
	4600 3800 4600 3900
Text Notes 5050 4350 0    50   ~ 0
#HSYNC latch
Wire Wire Line
	5300 3700 5200 3700
Connection ~ 5200 3700
Text GLabel 3600 7000 2    50   Input ~ 0
P9
$Comp
L 74xx:74HC04 U?
U 1 1 62230D93
P 4900 900
F 0 "U?" H 4900 1217 50  0000 C CNN
F 1 "74HC04" H 4900 1126 50  0000 C CNN
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
$Comp
L 74xx:74HC00 U?
U 3 1 622E29EA
P 4900 6650
F 0 "U?" H 4900 6975 50  0001 C CNN
F 1 "74HC00" H 4900 6883 50  0001 C CNN
F 2 "" H 4900 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 6650 50  0001 C CNN
	3    4900 6650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 4 1 622E29F0
P 4900 7000
F 0 "U?" H 4900 7325 50  0001 C CNN
F 1 "74HC00" H 4900 7233 50  0001 C CNN
F 2 "" H 4900 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 7000 50  0001 C CNN
	4    4900 7000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 622E29FC
P 5400 7400
F 0 "#PWR?" H 5400 7250 50  0001 C CNN
F 1 "VCC" H 5415 7573 50  0000 C CNN
F 2 "" H 5400 7400 50  0001 C CNN
F 3 "" H 5400 7400 50  0001 C CNN
	1    5400 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 622E2A03
P 4900 6300
F 0 "U?" H 4900 6533 50  0001 C CNN
F 1 "74HC00" H 4900 6534 50  0001 C CNN
F 2 "" H 4900 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 6300 50  0001 C CNN
	2    4900 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 1 1 622E2A14
P 4900 5950
F 0 "U?" H 4900 6275 50  0000 C CNN
F 1 "74HC00" H 4900 6184 50  0000 C CNN
F 2 "" H 4900 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5950 50  0001 C CNN
	1    4900 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 622E29F6
P 4900 7400
F 0 "U?" V 4625 7400 50  0001 C CNN
F 1 "74HC00" V 4624 7400 50  0001 C CNN
F 2 "" H 4900 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 7400 50  0001 C CNN
	5    4900 7400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 622E29E4
P 4400 7400
F 0 "#PWR?" H 4400 7150 50  0001 C CNN
F 1 "GND" H 4405 7227 50  0000 C CNN
F 2 "" H 4400 7400 50  0001 C CNN
F 3 "" H 4400 7400 50  0001 C CNN
	1    4400 7400
	1    0    0    -1  
$EndComp
Text GLabel 1950 6600 2    50   Input ~ 0
#LOAD
$EndSCHEMATC
