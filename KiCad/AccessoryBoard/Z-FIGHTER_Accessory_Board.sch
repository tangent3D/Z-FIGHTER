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
L Switch:SW_Push SW2
U 1 1 605EF71C
P 6300 2050
F 0 "SW2" H 6300 2335 50  0000 C CNN
F 1 "Down (A1)" H 6300 2244 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6300 2250 50  0001 C CNN
F 3 "~" H 6300 2250 50  0001 C CNN
	1    6300 2050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 605F4168
P 6300 3250
F 0 "SW5" H 6300 3535 50  0000 C CNN
F 1 "A (A4)" H 6300 3444 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6300 3450 50  0001 C CNN
F 3 "~" H 6300 3450 50  0001 C CNN
	1    6300 3250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 605F50CE
P 6300 3650
F 0 "SW6" H 6300 3935 50  0000 C CNN
F 1 "B (A5)" H 6300 3844 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6300 3850 50  0001 C CNN
F 3 "~" H 6300 3850 50  0001 C CNN
	1    6300 3650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW7
U 1 1 605F66B9
P 6300 4050
F 0 "SW7" H 6300 4335 50  0000 C CNN
F 1 "C (A6)" H 6300 4244 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6300 4250 50  0001 C CNN
F 3 "~" H 6300 4250 50  0001 C CNN
	1    6300 4050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW8
U 1 1 605F80DF
P 6300 4450
F 0 "SW8" H 6300 4735 50  0000 C CNN
F 1 "D (A7)" H 6300 4644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6300 4650 50  0001 C CNN
F 3 "~" H 6300 4650 50  0001 C CNN
	1    6300 4450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6048D225
P 6300 1650
F 0 "SW1" H 6300 1935 50  0000 C CNN
F 1 "Up (A0)" H 6300 1844 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6300 1850 50  0001 C CNN
F 3 "~" H 6300 1850 50  0001 C CNN
	1    6300 1650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 605F12CA
P 6300 2450
F 0 "SW3" H 6300 2735 50  0000 C CNN
F 1 "Left (A2)" H 6300 2644 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_2.00u_Vertical_PCB" H 6300 2650 50  0001 C CNN
F 3 "~" H 6300 2650 50  0001 C CNN
	1    6300 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J9
U 1 1 5FF33E62
P 4650 3300
F 0 "J9" H 4700 4117 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 4700 4026 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x13_P2.54mm_Horizontal" H 4650 3300 50  0001 C CNN
F 3 "~" H 4650 3300 50  0001 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x20_Male J7
U 1 1 6069E929
P 4600 5150
F 0 "J7" H 4708 6231 50  0000 C CNN
F 1 "ST7920 Graphic LCD" H 4708 6140 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Horizontal" H 4600 5150 50  0001 C CNN
F 3 "~" H 4600 5150 50  0001 C CNN
	1    4600 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN4
U 1 1 60568D6B
P 4700 1900
F 0 "RN4" V 5225 1900 50  0000 C CNN
F 1 "10KΩ" V 5134 1900 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5175 1900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4700 1900 50  0001 C CNN
	1    4700 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0108
U 1 1 6056CEA1
P 4500 2300
F 0 "#PWR0108" H 4500 2150 50  0001 C CNN
F 1 "VCC" V 4518 2427 50  0000 L CNN
F 2 "" H 4500 2300 50  0001 C CNN
F 3 "" H 4500 2300 50  0001 C CNN
	1    4500 2300
	0    -1   -1   0   
$EndComp
Text GLabel 4800 4850 2    50   Input ~ 0
PB7S
Text GLabel 4800 4950 2    50   Input ~ 0
PB6S
Text GLabel 4800 5050 2    50   Input ~ 0
PB5S
Text GLabel 4800 5150 2    50   Input ~ 0
PB4S
Text GLabel 4800 5250 2    50   Input ~ 0
PB3S
Text GLabel 4800 5350 2    50   Input ~ 0
PB2S
Text GLabel 4800 5450 2    50   Input ~ 0
PB1S
$Comp
L power:VCC #PWR0151
U 1 1 5FEE6867
P 4800 6050
F 0 "#PWR0151" H 4800 5900 50  0001 C CNN
F 1 "VCC" V 4817 6178 50  0000 L CNN
F 2 "" H 4800 6050 50  0001 C CNN
F 3 "" H 4800 6050 50  0001 C CNN
	1    4800 6050
	0    1    -1   0   
$EndComp
Text GLabel 4800 5650 2    50   Input ~ 0
PC0S
Text GLabel 4800 5850 2    50   Input ~ 0
PC2S
Text GLabel 4800 5750 2    50   Input ~ 0
PC1S
Wire Wire Line
	5000 6150 4800 6150
$Comp
L power:VCC #PWR0152
U 1 1 5FF31253
P 4800 4750
F 0 "#PWR0152" H 4800 4600 50  0001 C CNN
F 1 "VCC" V 4817 4878 50  0000 L CNN
F 2 "" H 4800 4750 50  0001 C CNN
F 3 "" H 4800 4750 50  0001 C CNN
	1    4800 4750
	0    1    -1   0   
$EndComp
Text GLabel 4800 5550 2    50   Input ~ 0
PB0S
Text GLabel 4450 3200 0    50   Input ~ 0
PA7S
Text GLabel 4450 3300 0    50   Input ~ 0
PA6S
Text GLabel 4450 3400 0    50   Input ~ 0
PA5S
Text GLabel 4450 3500 0    50   Input ~ 0
PA4S
Text GLabel 4450 3600 0    50   Input ~ 0
PA3S
Text GLabel 4450 3700 0    50   Input ~ 0
PA2S
Text GLabel 4450 3800 0    50   Input ~ 0
PA1S
Text GLabel 4450 3900 0    50   Input ~ 0
PA0S
Text GLabel 4450 3100 0    50   Input ~ 0
PB0S
Text GLabel 4450 3000 0    50   Input ~ 0
PB1S
Text GLabel 4450 2900 0    50   Input ~ 0
PB2S
Text GLabel 4450 2800 0    50   Input ~ 0
PB3S
Text GLabel 4950 2800 2    50   Input ~ 0
PB4S
Text GLabel 4950 2900 2    50   Input ~ 0
PB5S
Text GLabel 4950 3000 2    50   Input ~ 0
PB6S
Text GLabel 4950 3100 2    50   Input ~ 0
PB7S
Text GLabel 4950 3900 2    50   Input ~ 0
PC0S
Text GLabel 4950 3700 2    50   Input ~ 0
PC2S
Text GLabel 4950 3200 2    50   Input ~ 0
PC7S
Text GLabel 4950 3800 2    50   Input ~ 0
PC1S
NoConn ~ 4800 4450
NoConn ~ 4800 4550
NoConn ~ 4800 4650
NoConn ~ 4800 5950
Text GLabel 4900 1600 2    50   Input ~ 0
RN_1
Text GLabel 4900 1700 2    50   Input ~ 0
RN_2
Text GLabel 4900 1800 2    50   Input ~ 0
RN_3
Text GLabel 4900 1900 2    50   Input ~ 0
RN_4
Text GLabel 4900 2300 2    50   Input ~ 0
RN_8
Text GLabel 4900 2200 2    50   Input ~ 0
RN_7
Text GLabel 4900 2100 2    50   Input ~ 0
RN_6
Text GLabel 4900 2000 2    50   Input ~ 0
RN_5
Text GLabel 4950 3600 2    50   Input ~ 0
PC3S
Text GLabel 4800 4250 2    50   Input ~ 0
BLK
Text Notes 5200 5050 0    50   ~ 0
PC0: E\nPC1: R/~W\nPC2: D/~I\nPC3: BL On/~Off\n...\nPC7: Buzzer On/~Off
Text GLabel 6050 5500 0    50   Input ~ 0
PC7S
$Comp
L Device:R RB2
U 1 1 60416247
P 6200 5500
F 0 "RB2" V 5993 5500 50  0000 C CNN
F 1 "820Ω" V 6084 5500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6130 5500 50  0001 C CNN
F 3 "~" H 6200 5500 50  0001 C CNN
	1    6200 5500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 60415471
P 6650 5750
F 0 "#PWR0105" H 6650 5500 50  0001 C CNN
F 1 "GND" H 6655 5577 50  0000 C CNN
F 2 "" H 6650 5750 50  0001 C CNN
F 3 "" H 6650 5750 50  0001 C CNN
	1    6650 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 604046D2
P 6750 5100
F 0 "BZ1" H 6902 5129 50  0000 L CNN
F 1 "Buzzer" H 6902 5038 50  0000 L CNN
F 2 "Buzzer_Beeper:MagneticBuzzer_ProSignal_ABT-410-RC" V 6725 5200 50  0001 C CNN
F 3 "~" V 6725 5200 50  0001 C CNN
	1    6750 5100
	1    0    0    -1  
$EndComp
Text GLabel 7550 5500 0    50   Input ~ 0
PC3S
$Comp
L power:GND #PWR0102
U 1 1 6005CB0B
P 8150 5700
F 0 "#PWR0102" H 8150 5450 50  0001 C CNN
F 1 "GND" H 8155 5527 50  0000 C CNN
F 2 "" H 8150 5700 50  0001 C CNN
F 3 "" H 8150 5700 50  0001 C CNN
	1    8150 5700
	1    0    0    -1  
$EndComp
Text Notes 6850 2150 0    50   ~ 0
PA0: Up\nPA1: Down\nPA2: Left\nPA3: Right\nPA4: A\nPA5: B\nPA6: C\nPA7: D
Wire Wire Line
	6650 5200 6650 5300
Text GLabel 8300 5200 2    50   Input ~ 0
BLK
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 600425F1
P 8050 5500
F 0 "Q1" H 8241 5546 50  0000 L CNN
F 1 "BC337" H 8241 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 8250 5425 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 8050 5500 50  0001 L CNN
	1    8050 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R RB1
U 1 1 60054E6D
P 7700 5500
F 0 "RB1" V 7493 5500 50  0000 C CNN
F 1 "680Ω" V 7584 5500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7630 5500 50  0001 C CNN
F 3 "~" H 7700 5500 50  0001 C CNN
	1    7700 5500
	0    1    1    0   
$EndComp
Text Notes 6900 4950 0    50   ~ 0
Buzzer 50mA
$Comp
L Transistor_BJT:BC547 Q2
U 1 1 604128B3
P 6550 5500
F 0 "Q2" H 6741 5546 50  0000 L CNN
F 1 "BC337" H 6741 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 6750 5425 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 6550 5500 50  0001 L CNN
	1    6550 5500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 601E6F33
P 4950 4350
F 0 "#PWR0103" H 4950 4200 50  0001 C CNN
F 1 "VCC" V 4967 4478 50  0000 L CNN
F 2 "" H 4950 4350 50  0001 C CNN
F 3 "" H 4950 4350 50  0001 C CNN
	1    4950 4350
	0    1    -1   0   
$EndComp
Wire Wire Line
	4800 4350 4950 4350
$Comp
L power:VCC #PWR0134
U 1 1 606B2198
P 6650 4850
F 0 "#PWR0134" H 6650 4700 50  0001 C CNN
F 1 "VCC" V 6667 4978 50  0000 L CNN
F 2 "" H 6650 4850 50  0001 C CNN
F 3 "" H 6650 4850 50  0001 C CNN
	1    6650 4850
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D2
U 1 1 60409B3A
P 6450 5100
F 0 "D2" H 6450 5365 50  0000 C CNN
F 1 "IN5817" H 6450 5274 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6450 5100 50  0001 C CNN
F 3 "~" H 6450 5100 50  0001 C CNN
	1    6450 5100
	0    -1   -1   0   
$EndComp
NoConn ~ 4950 3300
NoConn ~ 4950 3400
NoConn ~ 4950 3500
Wire Wire Line
	5100 2700 4950 2700
$Comp
L power:GND #PWR0150
U 1 1 5FEE4F47
P 5000 6150
F 0 "#PWR0150" H 5000 5900 50  0001 C CNN
F 1 "GND" H 5005 5977 50  0000 C CNN
F 2 "" H 5000 6150 50  0001 C CNN
F 3 "" H 5000 6150 50  0001 C CNN
	1    5000 6150
	0    -1   1    0   
$EndComp
Wire Wire Line
	4200 2700 4450 2700
$Comp
L power:GND #PWR0161
U 1 1 5FF33E5B
P 4200 2700
F 0 "#PWR0161" H 4200 2450 50  0001 C CNN
F 1 "GND" H 4205 2527 50  0000 C CNN
F 2 "" H 4200 2700 50  0001 C CNN
F 3 "" H 4200 2700 50  0001 C CNN
	1    4200 2700
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 605F29A8
P 6300 2850
F 0 "SW4" H 6300 3135 50  0000 C CNN
F 1 "Right (A3)" H 6300 3044 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_2.00u_Vertical_PCB" H 6300 3050 50  0001 C CNN
F 3 "~" H 6300 3050 50  0001 C CNN
	1    6300 2850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 6020AF92
P 5100 2700
F 0 "#PWR0104" H 5100 2550 50  0001 C CNN
F 1 "VCC" V 5115 2828 50  0000 L CNN
F 2 "" H 5100 2700 50  0001 C CNN
F 3 "" H 5100 2700 50  0001 C CNN
	1    5100 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 1650 6100 1650
Connection ~ 6000 1650
Text GLabel 5850 2050 0    50   Input ~ 0
PA1S
Text GLabel 5850 2450 0    50   Input ~ 0
PA2S
Text GLabel 5850 2850 0    50   Input ~ 0
PA3S
Text GLabel 5850 3250 0    50   Input ~ 0
PA4S
Text GLabel 5850 3650 0    50   Input ~ 0
PA5S
Text GLabel 5850 4050 0    50   Input ~ 0
PA6S
Text GLabel 5850 4450 0    50   Input ~ 0
PA7S
Text GLabel 5850 4350 0    50   Input ~ 0
RN_8
Text GLabel 5850 3950 0    50   Input ~ 0
RN_7
Text GLabel 5850 3550 0    50   Input ~ 0
RN_6
Text GLabel 5850 3150 0    50   Input ~ 0
RN_5
Text GLabel 5850 2750 0    50   Input ~ 0
RN_4
Text GLabel 5850 2350 0    50   Input ~ 0
RN_3
Text GLabel 5850 1950 0    50   Input ~ 0
RN_2
Wire Wire Line
	6000 4350 5850 4350
Wire Wire Line
	6000 4450 6100 4450
Connection ~ 6000 4450
Wire Wire Line
	5850 4450 6000 4450
Wire Wire Line
	6000 4450 6000 4350
Wire Wire Line
	6000 3950 5850 3950
Wire Wire Line
	6000 4050 6100 4050
Connection ~ 6000 4050
Wire Wire Line
	5850 4050 6000 4050
Wire Wire Line
	6000 4050 6000 3950
Wire Wire Line
	6000 3550 5850 3550
Wire Wire Line
	6000 3650 6100 3650
Connection ~ 6000 3650
Wire Wire Line
	5850 3650 6000 3650
Wire Wire Line
	6000 3650 6000 3550
Wire Wire Line
	6000 3150 5850 3150
Wire Wire Line
	6000 3250 6100 3250
Connection ~ 6000 3250
Wire Wire Line
	5850 3250 6000 3250
Wire Wire Line
	6000 3250 6000 3150
Wire Wire Line
	6000 2750 5850 2750
Wire Wire Line
	6000 2850 6100 2850
Connection ~ 6000 2850
Wire Wire Line
	5850 2850 6000 2850
Wire Wire Line
	6000 2850 6000 2750
Wire Wire Line
	6000 2350 5850 2350
Wire Wire Line
	5850 2450 6000 2450
Connection ~ 6000 2450
Wire Wire Line
	6000 2450 6000 2350
Wire Wire Line
	6000 1950 5850 1950
Wire Wire Line
	5850 2050 6000 2050
Connection ~ 6000 2050
Wire Wire Line
	6000 2050 6000 1950
Text GLabel 5850 1650 0    50   Input ~ 0
PA0S
Wire Wire Line
	6000 1550 5850 1550
Wire Wire Line
	5850 1650 6000 1650
Wire Wire Line
	6000 1650 6000 1550
Text GLabel 5850 1550 0    50   Input ~ 0
RN_1
Wire Wire Line
	6000 2050 6100 2050
Wire Wire Line
	6000 2450 6100 2450
$Comp
L power:GND #PWR0112
U 1 1 605EF716
P 6500 2050
F 0 "#PWR0112" H 6500 1800 50  0001 C CNN
F 1 "GND" H 6505 1877 50  0000 C CNN
F 2 "" H 6500 2050 50  0001 C CNN
F 3 "" H 6500 2050 50  0001 C CNN
	1    6500 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 605F29A2
P 6500 2850
F 0 "#PWR0117" H 6500 2600 50  0001 C CNN
F 1 "GND" H 6505 2677 50  0000 C CNN
F 2 "" H 6500 2850 50  0001 C CNN
F 3 "" H 6500 2850 50  0001 C CNN
	1    6500 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 605F50C8
P 6500 3650
F 0 "#PWR0125" H 6500 3400 50  0001 C CNN
F 1 "GND" H 6505 3477 50  0000 C CNN
F 2 "" H 6500 3650 50  0001 C CNN
F 3 "" H 6500 3650 50  0001 C CNN
	1    6500 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 605F66B3
P 6500 4050
F 0 "#PWR0131" H 6500 3800 50  0001 C CNN
F 1 "GND" H 6505 3877 50  0000 C CNN
F 2 "" H 6500 4050 50  0001 C CNN
F 3 "" H 6500 4050 50  0001 C CNN
	1    6500 4050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 604B386F
P 6500 1650
F 0 "#PWR0165" H 6500 1400 50  0001 C CNN
F 1 "GND" H 6505 1477 50  0000 C CNN
F 2 "" H 6500 1650 50  0001 C CNN
F 3 "" H 6500 1650 50  0001 C CNN
	1    6500 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0166
U 1 1 605F12C4
P 6500 2450
F 0 "#PWR0166" H 6500 2200 50  0001 C CNN
F 1 "GND" H 6505 2277 50  0000 C CNN
F 2 "" H 6500 2450 50  0001 C CNN
F 3 "" H 6500 2450 50  0001 C CNN
	1    6500 2450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 605F4162
P 6500 3250
F 0 "#PWR0124" H 6500 3000 50  0001 C CNN
F 1 "GND" H 6505 3077 50  0000 C CNN
F 2 "" H 6500 3250 50  0001 C CNN
F 3 "" H 6500 3250 50  0001 C CNN
	1    6500 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 605F80D9
P 6500 4450
F 0 "#PWR0133" H 6500 4200 50  0001 C CNN
F 1 "GND" H 6505 4277 50  0000 C CNN
F 2 "" H 6500 4450 50  0001 C CNN
F 3 "" H 6500 4450 50  0001 C CNN
	1    6500 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 5200 8150 5200
Wire Wire Line
	8150 5200 8150 5300
Wire Wire Line
	6650 5700 6650 5750
Wire Wire Line
	6650 4850 6650 4900
Wire Wire Line
	6450 4900 6650 4900
Connection ~ 6650 4900
Wire Wire Line
	6650 4900 6650 5000
Wire Wire Line
	6450 5300 6650 5300
Connection ~ 6650 5300
$EndSCHEMATC
