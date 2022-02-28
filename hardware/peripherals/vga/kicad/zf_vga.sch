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
P 4900 6850
F 0 "#PWR0101" H 4900 6700 50  0001 C CNN
F 1 "VCC" H 4915 7023 50  0000 C CNN
F 2 "" H 4900 6850 50  0001 C CNN
F 3 "" H 4900 6850 50  0001 C CNN
	1    4900 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 62042787
P 4900 7450
F 0 "#PWR0102" H 4900 7200 50  0001 C CNN
F 1 "GND" H 4905 7277 50  0000 C CNN
F 2 "" H 4900 7450 50  0001 C CNN
F 3 "" H 4900 7450 50  0001 C CNN
	1    4900 7450
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 6203895A
P 4900 7150
F 0 "X?" H 5244 7196 50  0000 L CNN
F 1 "CXO_DIP14" H 5244 7105 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5350 6800 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 4800 7150 50  0001 C CNN
	1    4900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 7150 5200 7350
Wire Wire Line
	5200 7350 5300 7350
Text GLabel 5300 7350 2    50   Input ~ 0
CLOCK
NoConn ~ 4600 7150
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
Text GLabel 1050 1450 0    50   Input ~ 0
#PRESET
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
Text GLabel 950  6300 0    50   Input ~ 0
HSTICK
Connection ~ 1450 7500
Wire Wire Line
	950  7500 1450 7500
Wire Wire Line
	950  7200 950  7500
Text GLabel 2600 7200 0    50   Input ~ 0
L9
Text GLabel 1950 6500 2    50   Input ~ 0
HSTICK
Text GLabel 1950 6600 2    50   Input ~ 0
#LOAD
Text GLabel 1950 6400 2    50   Input ~ 0
#HSYNC
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
Text GLabel 1950 6900 2    50   Input ~ 0
P9
Text GLabel 1950 7000 2    50   Input ~ 0
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
Text GLabel 2700 1450 0    50   Input ~ 0
#PRESET
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
Text GLabel 3600 6300 2    50   Input ~ 0
#LRESET
Text GLabel 3600 6400 2    50   Input ~ 0
#VSYNC
Text GLabel 4350 1100 0    50   Input ~ 0
#PRESET
Text GLabel 5450 1100 2    50   Input ~ 0
PRESET
Text GLabel 950  6400 0    50   Input ~ 0
P0
Text GLabel 950  6500 0    50   Input ~ 0
P1
Text GLabel 950  6600 0    50   Input ~ 0
P2
Text GLabel 950  6700 0    50   Input ~ 0
P3
Text GLabel 950  6800 0    50   Input ~ 0
P4
Text GLabel 950  6900 0    50   Input ~ 0
P5
Text GLabel 950  7000 0    50   Input ~ 0
P6
Text GLabel 950  7100 0    50   Input ~ 0
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
P 4400 6300
F 0 "#PWR0123" H 4400 6050 50  0001 C CNN
F 1 "GND" H 4405 6127 50  0000 C CNN
F 2 "" H 4400 6300 50  0001 C CNN
F 3 "" H 4400 6300 50  0001 C CNN
	1    4400 6300
	1    0    0    -1  
$EndComp
Connection ~ 950  4700
$Comp
L 74xx:74HC00 U?
U 1 1 6222CFFF
P 4900 4850
F 0 "U?" H 4900 5175 50  0000 C CNN
F 1 "74HC00" H 4900 5084 50  0000 C CNN
F 2 "" H 4900 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 4850 50  0001 C CNN
	1    4900 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 62236D7F
P 4900 5550
F 0 "U?" H 4900 5875 50  0001 C CNN
F 1 "74HC00" H 4900 5783 50  0001 C CNN
F 2 "" H 4900 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5550 50  0001 C CNN
	3    4900 5550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 4 1 622384DB
P 4900 5900
F 0 "U?" H 4900 6225 50  0001 C CNN
F 1 "74HC00" H 4900 6133 50  0001 C CNN
F 2 "" H 4900 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5900 50  0001 C CNN
	4    4900 5900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 6223A0D4
P 4900 6300
F 0 "U?" V 4625 6300 50  0001 C CNN
F 1 "74HC00" V 4624 6300 50  0001 C CNN
F 2 "" H 4900 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 6300 50  0001 C CNN
	5    4900 6300
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0125
U 1 1 62254857
P 5400 6300
F 0 "#PWR0125" H 5400 6150 50  0001 C CNN
F 1 "VCC" H 5415 6473 50  0000 C CNN
F 2 "" H 5400 6300 50  0001 C CNN
F 3 "" H 5400 6300 50  0001 C CNN
	1    5400 6300
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
L 74xx:74HC04 U?
U 7 1 621DC230
P 4900 4050
F 0 "U?" V 4533 4050 50  0001 C CNN
F 1 "74HC04" V 4624 4050 50  0001 C CNN
F 2 "" H 4900 4050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4900 4050 50  0001 C CNN
	7    4900 4050
	0    1    1    0   
$EndComp
$Comp
L 74xx_IEEE:7404 U?
U 1 1 621C07AC
P 4900 1100
F 0 "U?" H 4900 1566 50  0000 C CNN
F 1 "74HC14" H 4900 1475 50  0000 C CNN
F 2 "" H 4900 1100 50  0001 C CNN
F 3 "" H 4900 1100 50  0001 C CNN
	1    4900 1100
	1    0    0    -1  
$EndComp
Text GLabel 5450 1600 2    50   Input ~ 0
#P1
Text GLabel 4350 1600 0    50   Input ~ 0
P1
$Comp
L power:VCC #PWR0118
U 1 1 62188C3D
P 5400 4050
F 0 "#PWR0118" H 5400 3900 50  0001 C CNN
F 1 "VCC" H 5415 4223 50  0000 C CNN
F 2 "" H 5400 4050 50  0001 C CNN
F 3 "" H 5400 4050 50  0001 C CNN
	1    5400 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 62186D08
P 4400 4050
F 0 "#PWR0117" H 4400 3800 50  0001 C CNN
F 1 "GND" H 4405 3877 50  0000 C CNN
F 2 "" H 4400 4050 50  0001 C CNN
F 3 "" H 4400 4050 50  0001 C CNN
	1    4400 4050
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:7404 U?
U 5 1 621C3A96
P 4900 3100
F 0 "U?" H 4900 3566 50  0001 C CNN
F 1 "7404" H 4900 3475 50  0001 C CNN
F 2 "" H 4900 3100 50  0001 C CNN
F 3 "" H 4900 3100 50  0001 C CNN
	5    4900 3100
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:7404 U?
U 4 1 621C29B6
P 4900 2600
F 0 "U?" H 4900 3066 50  0001 C CNN
F 1 "7404" H 4900 2975 50  0001 C CNN
F 2 "" H 4900 2600 50  0001 C CNN
F 3 "" H 4900 2600 50  0001 C CNN
	4    4900 2600
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:7404 U?
U 3 1 621C218A
P 4900 2100
F 0 "U?" H 4900 2566 50  0001 C CNN
F 1 "7404" H 4900 2475 50  0001 C CNN
F 2 "" H 4900 2100 50  0001 C CNN
F 3 "" H 4900 2100 50  0001 C CNN
	3    4900 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:7404 U?
U 2 1 621C0F70
P 4900 1600
F 0 "U?" H 4900 1975 50  0001 C CNN
F 1 "7404" H 4900 1975 50  0001 C CNN
F 2 "" H 4900 1600 50  0001 C CNN
F 3 "" H 4900 1600 50  0001 C CNN
	2    4900 1600
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
Text GLabel 1050 3100 0    50   Input ~ 0
#LRESET
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
Text GLabel 2700 3100 0    50   Input ~ 0
#LRESET
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
Text GLabel 7350 3350 2    50   Input ~ 0
D0
Text GLabel 7350 3450 2    50   Input ~ 0
D1
Text GLabel 7350 3550 2    50   Input ~ 0
D2
Text GLabel 7350 3650 2    50   Input ~ 0
D3
Text GLabel 7350 3750 2    50   Input ~ 0
D4
Text GLabel 7350 3850 2    50   Input ~ 0
D5
Text GLabel 7350 3950 2    50   Input ~ 0
D6
Text GLabel 7350 4050 2    50   Input ~ 0
D7
Wire Wire Line
	6350 4450 6350 4500
$Comp
L power:GND #PWR0129
U 1 1 622758B5
P 6850 4950
F 0 "#PWR0129" H 6850 4700 50  0001 C CNN
F 1 "GND" H 6855 4777 50  0000 C CNN
F 2 "" H 6850 4950 50  0001 C CNN
F 3 "" H 6850 4950 50  0001 C CNN
	1    6850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4550 7400 4550
Wire Wire Line
	7500 4550 7500 4450
Wire Wire Line
	7500 4450 7350 4450
Text GLabel 6350 2250 0    50   Input ~ 0
#P1
Text GLabel 6350 2050 0    50   Input ~ 0
#LOAD
Text GLabel 6350 3550 0    50   Input ~ 0
A2
Text GLabel 6350 3450 0    50   Input ~ 0
A1
Text GLabel 6350 3350 0    50   Input ~ 0
A0
Text GLabel 6350 4250 0    50   Input ~ 0
A9
Text GLabel 6350 4350 0    50   Input ~ 0
A10
Text GLabel 6350 4150 0    50   Input ~ 0
A8
Text GLabel 6350 4050 0    50   Input ~ 0
A7
Text GLabel 6350 3950 0    50   Input ~ 0
A6
Text GLabel 6350 3850 0    50   Input ~ 0
A5
Text GLabel 6350 3750 0    50   Input ~ 0
A4
Text GLabel 6350 3650 0    50   Input ~ 0
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
Text Notes 6900 4950 0    50   ~ 0
SRAM
$Comp
L power:GND #PWR0132
U 1 1 622C61D2
P 7400 4600
F 0 "#PWR0132" H 7400 4350 50  0001 C CNN
F 1 "GND" H 7405 4427 50  0000 C CNN
F 2 "" H 7400 4600 50  0001 C CNN
F 3 "" H 7400 4600 50  0001 C CNN
	1    7400 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 750  6850 750 
Text Notes 8700 2250 0    50   ~ 0
Write Data Buffer
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
$Comp
L power:GND #PWR0135
U 1 1 622D4D53
P 10200 5050
F 0 "#PWR0135" H 10200 4800 50  0001 C CNN
F 1 "GND" H 10205 4877 50  0000 C CNN
F 2 "" H 10200 5050 50  0001 C CNN
F 3 "" H 10200 5050 50  0001 C CNN
	1    10200 5050
	1    0    0    -1  
$EndComp
Text Notes 10250 4950 0    50   ~ 0
Write Address Latch (Hi)
Text Notes 5250 6400 0    50   ~ 0
NAND Gate
Text Notes 3150 3700 0    50   ~ 0
Line Counter
Text Notes 3150 2050 0    50   ~ 0
Pixel Counter
Text GLabel 10700 3750 2    50   Input ~ 0
A8
Text GLabel 10700 3950 2    50   Input ~ 0
A10
Text GLabel 10700 3850 2    50   Input ~ 0
A9
NoConn ~ 10700 4050
NoConn ~ 10700 4150
NoConn ~ 10700 4250
NoConn ~ 10700 4350
NoConn ~ 10700 4450
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
P 10450 2900
F 0 "#PWR0136" H 10450 2650 50  0001 C CNN
F 1 "GND" H 10455 2727 50  0000 C CNN
F 2 "" H 10450 2900 50  0001 C CNN
F 3 "" H 10450 2900 50  0001 C CNN
	1    10450 2900
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
Connection ~ 6850 4950
Wire Wire Line
	6250 4950 6850 4950
Wire Wire Line
	6350 4500 6250 4500
$Comp
L power:VCC #PWR0137
U 1 1 62317BEF
P 7100 3150
F 0 "#PWR0137" H 7100 3000 50  0001 C CNN
F 1 "VCC" H 7115 3323 50  0000 C CNN
F 2 "" H 7100 3150 50  0001 C CNN
F 3 "" H 7100 3150 50  0001 C CNN
	1    7100 3150
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:AS6C6264 U?
U 1 1 62268A82
P 6850 4050
F 0 "U?" H 6850 5131 50  0000 C CNN
F 1 "AS6C6264" H 6850 5040 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 6850 3950 50  0001 C CNN
F 3 "https://www.futurlec.com/Datasheet/Memory/62256.pdf" H 6850 3950 50  0001 C CNN
	1    6850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3150 7100 3150
$Comp
L power:VCC #PWR0138
U 1 1 6231FF13
P 10450 3450
F 0 "#PWR0138" H 10450 3300 50  0001 C CNN
F 1 "VCC" H 10465 3623 50  0000 C CNN
F 2 "" H 10450 3450 50  0001 C CNN
F 3 "" H 10450 3450 50  0001 C CNN
	1    10450 3450
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
P 10200 4250
F 0 "U?" H 10200 5231 50  0000 C CNN
F 1 "74HC573" H 10200 5140 50  0000 C CNN
F 2 "" H 10200 4250 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 10200 4250 50  0001 C CNN
	1    10200 4250
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
Text GLabel 9700 4350 0    50   Input ~ 0
WA6
Text GLabel 9700 4250 0    50   Input ~ 0
WA5
Text GLabel 9700 4150 0    50   Input ~ 0
WA4
Text GLabel 9700 4450 0    50   Input ~ 0
WA7
Text GLabel 9700 4050 0    50   Input ~ 0
WA3
Text GLabel 9700 3750 0    50   Input ~ 0
WA0
Text GLabel 9700 3850 0    50   Input ~ 0
WA1
Text GLabel 9700 3950 0    50   Input ~ 0
WA2
Text GLabel 9800 1800 0    50   Input ~ 0
LL
Text GLabel 9800 1700 0    50   Input ~ 0
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
P 4900 5200
F 0 "U?" H 4900 5433 50  0001 C CNN
F 1 "74HC00" H 4900 5434 50  0001 C CNN
F 2 "" H 4900 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4900 5200 50  0001 C CNN
	2    4900 5200
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
Text GLabel 3750 7000 2    50   Input ~ 0
P9
Text GLabel 3750 6900 2    50   Input ~ 0
ACTVID
Text GLabel 1950 6800 2    50   Input ~ 0
ACTVID
Connection ~ 7500 4450
Wire Wire Line
	7500 4450 7500 4350
$Comp
L power:VCC #PWR0130
U 1 1 62277C38
P 7500 4350
F 0 "#PWR0130" H 7500 4200 50  0001 C CNN
F 1 "VCC" H 7515 4523 50  0000 C CNN
F 2 "" H 7500 4350 50  0001 C CNN
F 3 "" H 7500 4350 50  0001 C CNN
	1    7500 4350
	1    0    0    -1  
$EndComp
Text GLabel 3750 6700 2    50   Input ~ 0
LL
Text GLabel 9700 4650 0    50   Input ~ 0
LU
Text GLabel 3750 6800 2    50   Input ~ 0
LU
Text GLabel 3750 6600 2    50   Input ~ 0
#WRDY
Text GLabel 9800 1900 0    50   Input ~ 0
CC
Text GLabel 9800 2000 0    50   Input ~ 0
CL
Text GLabel 9800 2100 0    50   Input ~ 0
CD1
Text GLabel 9800 2200 0    50   Input ~ 0
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
Text GLabel 8150 4650 0    50   Input ~ 0
LL
Text GLabel 8150 4450 0    50   Input ~ 0
WA7
Text GLabel 8150 4150 0    50   Input ~ 0
WA4
Text GLabel 8150 4250 0    50   Input ~ 0
WA5
Text GLabel 8150 4350 0    50   Input ~ 0
WA6
Text GLabel 8150 3950 0    50   Input ~ 0
WA2
Text GLabel 8150 3850 0    50   Input ~ 0
WA1
Text GLabel 8150 3750 0    50   Input ~ 0
WA0
Text GLabel 8150 4050 0    50   Input ~ 0
WA3
$Comp
L power:VCC #PWR0142
U 1 1 6231A022
P 8900 3450
F 0 "#PWR0142" H 8900 3300 50  0001 C CNN
F 1 "VCC" H 8915 3623 50  0000 C CNN
F 2 "" H 8900 3450 50  0001 C CNN
F 3 "" H 8900 3450 50  0001 C CNN
	1    8900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3450 8900 3450
Text GLabel 9150 3950 2    50   Input ~ 0
A2
Text GLabel 9150 3850 2    50   Input ~ 0
A1
Text GLabel 9150 3750 2    50   Input ~ 0
A0
Text GLabel 9150 4450 2    50   Input ~ 0
A7
Text GLabel 9150 4350 2    50   Input ~ 0
A6
Text GLabel 9150 4250 2    50   Input ~ 0
A5
Text GLabel 9150 4150 2    50   Input ~ 0
A4
Text GLabel 9150 4050 2    50   Input ~ 0
A3
$Comp
L power:GND #PWR0134
U 1 1 622D3D47
P 8650 5050
F 0 "#PWR0134" H 8650 4800 50  0001 C CNN
F 1 "GND" H 8655 4877 50  0000 C CNN
F 2 "" H 8650 5050 50  0001 C CNN
F 3 "" H 8650 5050 50  0001 C CNN
	1    8650 5050
	1    0    0    -1  
$EndComp
Text Notes 8700 4950 0    50   ~ 0
Write Address Latch (Lo)
$Comp
L 74xx:74LS573 U?
U 1 1 622253F3
P 8650 4250
F 0 "U?" H 8650 5231 50  0000 C CNN
F 1 "74HC573" H 8650 5140 50  0000 C CNN
F 2 "" H 8650 4250 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 8650 4250 50  0001 C CNN
	1    8650 4250
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
	6250 4500 6250 4950
Connection ~ 6350 4500
Wire Wire Line
	6350 4500 6350 4550
Connection ~ 7400 4550
Wire Wire Line
	7400 4550 7500 4550
Wire Wire Line
	7350 4250 7350 4300
Wire Wire Line
	7400 4300 7350 4300
Wire Wire Line
	7400 4300 7400 4550
Connection ~ 7350 4300
Wire Wire Line
	7350 4300 7350 4350
Text Notes 9250 3000 0    50   ~ 0
Z-Fighter Connectors
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
Text Notes 5250 4200 0    50   ~ 0
Inverter
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
$Comp
L 74xx_IEEE:7404 U?
U 6 1 621C4F03
P 4900 3600
F 0 "U?" H 4900 4066 50  0001 C CNN
F 1 "7404" H 4900 3975 50  0001 C CNN
F 2 "" H 4900 3600 50  0001 C CNN
F 3 "" H 4900 3600 50  0001 C CNN
	6    4900 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
