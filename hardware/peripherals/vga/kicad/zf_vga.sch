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
L 74xx:74HC590 U?
U 1 1 62036597
P 3200 3000
F 0 "U?" H 3200 3881 50  0000 C CNN
F 1 "74HC590" H 3200 3790 50  0000 C CNN
F 2 "" H 3200 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 3200 3050 50  0001 C CNN
	1    3200 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC590 U?
U 1 1 62037EC4
P 4950 3000
F 0 "U?" H 4950 3881 50  0000 C CNN
F 1 "74HC590" H 4950 3790 50  0000 C CNN
F 2 "" H 4950 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 4950 3050 50  0001 C CNN
	1    4950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 6204084C
P 3200 1100
F 0 "#PWR?" H 3200 950 50  0001 C CNN
F 1 "VCC" H 3215 1273 50  0000 C CNN
F 2 "" H 3200 1100 50  0001 C CNN
F 3 "" H 3200 1100 50  0001 C CNN
	1    3200 1100
	1    0    0    -1  
$EndComp
NoConn ~ 2900 1400
$Comp
L Oscillator:CXO_DIP14 X?
U 1 1 6203895A
P 3200 1400
F 0 "X?" H 3544 1446 50  0000 L CNN
F 1 "CXO_DIP14" H 3544 1355 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-14" H 3650 1050 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 3100 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62042787
P 3200 1700
F 0 "#PWR?" H 3200 1450 50  0001 C CNN
F 1 "GND" H 3205 1527 50  0000 C CNN
F 2 "" H 3200 1700 50  0001 C CNN
F 3 "" H 3200 1700 50  0001 C CNN
	1    3200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1400 3500 1250
Wire Wire Line
	3500 1250 3650 1250
Text GLabel 3650 1250 2    50   Input ~ 0
PIXEL_CLOCK
Text GLabel 2800 2700 0    50   Input ~ 0
PIXEL_CLOCK
Wire Wire Line
	3600 3400 4050 3400
Wire Wire Line
	4050 3400 4050 2700
Wire Wire Line
	4050 2700 4550 2700
$Comp
L power:GND #PWR?
U 1 1 62045DEB
P 2800 3200
F 0 "#PWR?" H 2800 2950 50  0001 C CNN
F 1 "GND" H 2805 3027 50  0000 C CNN
F 2 "" H 2800 3200 50  0001 C CNN
F 3 "" H 2800 3200 50  0001 C CNN
	1    2800 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620468E4
P 4550 3200
F 0 "#PWR?" H 4550 2950 50  0001 C CNN
F 1 "GND" H 4555 3027 50  0000 C CNN
F 2 "" H 4550 3200 50  0001 C CNN
F 3 "" H 4550 3200 50  0001 C CNN
	1    4550 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
