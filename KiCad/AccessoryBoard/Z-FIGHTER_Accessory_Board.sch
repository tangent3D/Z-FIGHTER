EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 7874 7874
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
Text GLabel 3850 5450 0    50   Input ~ 0
PC7S
Connection ~ 4450 5250
Wire Wire Line
	4250 5250 4450 5250
Wire Wire Line
	4450 4850 4450 4950
Wire Wire Line
	4450 5650 4450 5700
Wire Wire Line
	6150 5000 6150 5100
Wire Wire Line
	6300 5000 6150 5000
$Comp
L pspice:DIODE D2
U 1 1 60409B3A
P 4250 5050
F 0 "D2" H 4250 5315 50  0000 C CNN
F 1 "IN5817" H 4250 5224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4250 5050 50  0001 C CNN
F 3 "~" H 4250 5050 50  0001 C CNN
	1    4250 5050
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q2
U 1 1 604128B3
P 4350 5450
F 0 "Q2" H 4541 5496 50  0000 L CNN
F 1 "BC337" H 4541 5405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4550 5375 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 4350 5450 50  0001 L CNN
	1    4350 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:R RB1
U 1 1 60054E6D
P 5700 5300
F 0 "RB1" V 5493 5300 50  0000 C CNN
F 1 "680Ω" V 5584 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 5300 50  0001 C CNN
F 3 "~" H 5700 5300 50  0001 C CNN
	1    5700 5300
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 600425F1
P 6050 5300
F 0 "Q1" H 6241 5346 50  0000 L CNN
F 1 "BC337" H 6241 5255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 6250 5225 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 6050 5300 50  0001 L CNN
	1    6050 5300
	1    0    0    -1  
$EndComp
Text GLabel 6300 5000 2    50   Input ~ 0
BLK
Wire Wire Line
	4450 5150 4450 5250
$Comp
L power:GND #PWR0102
U 1 1 6005CB0B
P 6150 5500
F 0 "#PWR0102" H 6150 5250 50  0001 C CNN
F 1 "GND" H 6155 5327 50  0000 C CNN
F 2 "" H 6150 5500 50  0001 C CNN
F 3 "" H 6150 5500 50  0001 C CNN
	1    6150 5500
	1    0    0    -1  
$EndComp
Text GLabel 5550 5300 0    50   Input ~ 0
PC3S
$Comp
L Device:Buzzer BZ1
U 1 1 604046D2
P 4550 5050
F 0 "BZ1" H 4702 5079 50  0000 L CNN
F 1 "Buzzer" H 4702 4988 50  0000 L CNN
F 2 "Buzzer_Beeper:MagneticBuzzer_ProSignal_ABT-410-RC" V 4525 5150 50  0001 C CNN
F 3 "~" V 4525 5150 50  0001 C CNN
	1    4550 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 60415471
P 4450 5700
F 0 "#PWR0105" H 4450 5450 50  0001 C CNN
F 1 "GND" H 4455 5527 50  0000 C CNN
F 2 "" H 4450 5700 50  0001 C CNN
F 3 "" H 4450 5700 50  0001 C CNN
	1    4450 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:R RB2
U 1 1 60416247
P 4000 5450
F 0 "RB2" V 3793 5450 50  0000 C CNN
F 1 "820Ω" V 3884 5450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3930 5450 50  0001 C CNN
F 3 "~" H 4000 5450 50  0001 C CNN
	1    4000 5450
	0    1    1    0   
$EndComp
Connection ~ 4450 4850
Text Notes 3400 4850 0    50   ~ 0
Electromagnetic buzzer\n(50mA)
$Comp
L power:VCC #PWR0134
U 1 1 606B2198
P 4450 4800
F 0 "#PWR0134" H 4450 4650 50  0001 C CNN
F 1 "VCC" V 4467 4928 50  0000 L CNN
F 2 "" H 4450 4800 50  0001 C CNN
F 3 "" H 4450 4800 50  0001 C CNN
	1    4450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4800 4450 4850
Wire Wire Line
	4250 4850 4450 4850
$Comp
L Switch:SW_Push SW2
U 1 1 605EF71C
P 4150 1600
F 0 "SW2" H 4150 1885 50  0000 C CNN
F 1 "Down (A1)" H 4150 1794 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4150 1800 50  0001 C CNN
F 3 "~" H 4150 1800 50  0001 C CNN
	1    4150 1600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 605F4168
P 4150 2800
F 0 "SW5" H 4150 3085 50  0000 C CNN
F 1 "A (A4)" H 4150 2994 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4150 3000 50  0001 C CNN
F 3 "~" H 4150 3000 50  0001 C CNN
	1    4150 2800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 605F50CE
P 4150 3200
F 0 "SW6" H 4150 3485 50  0000 C CNN
F 1 "B (A5)" H 4150 3394 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4150 3400 50  0001 C CNN
F 3 "~" H 4150 3400 50  0001 C CNN
	1    4150 3200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW7
U 1 1 605F66B9
P 4150 3600
F 0 "SW7" H 4150 3885 50  0000 C CNN
F 1 "C (A6)" H 4150 3794 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4150 3800 50  0001 C CNN
F 3 "~" H 4150 3800 50  0001 C CNN
	1    4150 3600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW8
U 1 1 605F80DF
P 4150 4000
F 0 "SW8" H 4150 4285 50  0000 C CNN
F 1 "D (A7)" H 4150 4194 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4150 4200 50  0001 C CNN
F 3 "~" H 4150 4200 50  0001 C CNN
	1    4150 4000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6048D225
P 4150 1200
F 0 "SW1" H 4150 1485 50  0000 C CNN
F 1 "Up (A0)" H 4150 1394 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4150 1400 50  0001 C CNN
F 3 "~" H 4150 1400 50  0001 C CNN
	1    4150 1200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 605F12CA
P 4150 2000
F 0 "SW3" H 4150 2285 50  0000 C CNN
F 1 "Left (A2)" H 4150 2194 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_2.00u_Vertical_PCB" H 4150 2200 50  0001 C CNN
F 3 "~" H 4150 2200 50  0001 C CNN
	1    4150 2000
	1    0    0    -1  
$EndComp
Text Notes 4750 1700 0    50   ~ 0
\nPA0: Up\nPA1: Down\nPA2: Left\nPA3: Right\nPA4: A\nPA5: B\nPA6: C\nPA7: D
$Comp
L Switch:SW_Push SW4
U 1 1 605F29A8
P 4150 2400
F 0 "SW4" H 4150 2685 50  0000 C CNN
F 1 "Right (A3)" H 4150 2594 50  0000 C CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_2.00u_Vertical_PCB" H 4150 2600 50  0001 C CNN
F 3 "~" H 4150 2600 50  0001 C CNN
	1    4150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1200 3950 1200
Connection ~ 3850 1200
Text GLabel 3700 1600 0    50   Input ~ 0
PA1S
Text GLabel 3700 2000 0    50   Input ~ 0
PA2S
Text GLabel 3700 2400 0    50   Input ~ 0
PA3S
Text GLabel 3700 2800 0    50   Input ~ 0
PA4S
Text GLabel 3700 3200 0    50   Input ~ 0
PA5S
Text GLabel 3700 3600 0    50   Input ~ 0
PA6S
Text GLabel 3700 4000 0    50   Input ~ 0
PA7S
Text GLabel 3700 3900 0    50   Input ~ 0
RN_8
Text GLabel 3700 3500 0    50   Input ~ 0
RN_7
Text GLabel 3700 3100 0    50   Input ~ 0
RN_6
Text GLabel 3700 2700 0    50   Input ~ 0
RN_5
Text GLabel 3700 2300 0    50   Input ~ 0
RN_4
Text GLabel 3700 1900 0    50   Input ~ 0
RN_3
Text GLabel 3700 1500 0    50   Input ~ 0
RN_2
Wire Wire Line
	3850 3900 3700 3900
Wire Wire Line
	3850 4000 3950 4000
Connection ~ 3850 4000
Wire Wire Line
	3700 4000 3850 4000
Wire Wire Line
	3850 4000 3850 3900
Wire Wire Line
	3850 3500 3700 3500
Wire Wire Line
	3850 3600 3950 3600
Connection ~ 3850 3600
Wire Wire Line
	3700 3600 3850 3600
Wire Wire Line
	3850 3600 3850 3500
Wire Wire Line
	3850 3100 3700 3100
Wire Wire Line
	3850 3200 3950 3200
Connection ~ 3850 3200
Wire Wire Line
	3700 3200 3850 3200
Wire Wire Line
	3850 3200 3850 3100
Wire Wire Line
	3850 2700 3700 2700
Wire Wire Line
	3850 2800 3950 2800
Connection ~ 3850 2800
Wire Wire Line
	3700 2800 3850 2800
Wire Wire Line
	3850 2800 3850 2700
Wire Wire Line
	3850 2300 3700 2300
Wire Wire Line
	3850 2400 3950 2400
Connection ~ 3850 2400
Wire Wire Line
	3700 2400 3850 2400
Wire Wire Line
	3850 2400 3850 2300
Wire Wire Line
	3850 1900 3700 1900
Wire Wire Line
	3700 2000 3850 2000
Connection ~ 3850 2000
Wire Wire Line
	3850 2000 3850 1900
Wire Wire Line
	3850 1500 3700 1500
Wire Wire Line
	3700 1600 3850 1600
Connection ~ 3850 1600
Wire Wire Line
	3850 1600 3850 1500
Text GLabel 3700 1200 0    50   Input ~ 0
PA0S
Wire Wire Line
	3850 1100 3700 1100
Wire Wire Line
	3700 1200 3850 1200
Wire Wire Line
	3850 1200 3850 1100
Text GLabel 3700 1100 0    50   Input ~ 0
RN_1
Wire Wire Line
	3850 1600 3950 1600
Wire Wire Line
	3850 2000 3950 2000
$Comp
L power:GND #PWR0112
U 1 1 605EF716
P 4350 1600
F 0 "#PWR0112" H 4350 1350 50  0001 C CNN
F 1 "GND" H 4355 1427 50  0000 C CNN
F 2 "" H 4350 1600 50  0001 C CNN
F 3 "" H 4350 1600 50  0001 C CNN
	1    4350 1600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 605F29A2
P 4350 2400
F 0 "#PWR0117" H 4350 2150 50  0001 C CNN
F 1 "GND" H 4355 2227 50  0000 C CNN
F 2 "" H 4350 2400 50  0001 C CNN
F 3 "" H 4350 2400 50  0001 C CNN
	1    4350 2400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 605F50C8
P 4350 3200
F 0 "#PWR0125" H 4350 2950 50  0001 C CNN
F 1 "GND" H 4355 3027 50  0000 C CNN
F 2 "" H 4350 3200 50  0001 C CNN
F 3 "" H 4350 3200 50  0001 C CNN
	1    4350 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 605F66B3
P 4350 3600
F 0 "#PWR0131" H 4350 3350 50  0001 C CNN
F 1 "GND" H 4355 3427 50  0000 C CNN
F 2 "" H 4350 3600 50  0001 C CNN
F 3 "" H 4350 3600 50  0001 C CNN
	1    4350 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 604B386F
P 4350 1200
F 0 "#PWR0165" H 4350 950 50  0001 C CNN
F 1 "GND" H 4355 1027 50  0000 C CNN
F 2 "" H 4350 1200 50  0001 C CNN
F 3 "" H 4350 1200 50  0001 C CNN
	1    4350 1200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0166
U 1 1 605F12C4
P 4350 2000
F 0 "#PWR0166" H 4350 1750 50  0001 C CNN
F 1 "GND" H 4355 1827 50  0000 C CNN
F 2 "" H 4350 2000 50  0001 C CNN
F 3 "" H 4350 2000 50  0001 C CNN
	1    4350 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 605F4162
P 4350 2800
F 0 "#PWR0124" H 4350 2550 50  0001 C CNN
F 1 "GND" H 4355 2627 50  0000 C CNN
F 2 "" H 4350 2800 50  0001 C CNN
F 3 "" H 4350 2800 50  0001 C CNN
	1    4350 2800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 605F80D9
P 4350 4000
F 0 "#PWR0133" H 4350 3750 50  0001 C CNN
F 1 "GND" H 4355 3827 50  0000 C CNN
F 2 "" H 4350 4000 50  0001 C CNN
F 3 "" H 4350 4000 50  0001 C CNN
	1    4350 4000
	0    -1   -1   0   
$EndComp
Text Notes 2050 4600 0    50   ~ 0
PC0: E\nPC1: R/~W\nPC2: D/~I\nPC3: BL On/~Off\n...\nPC7: Buzzer On/~Off
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J9
U 1 1 5FF33E62
P 1700 2100
F 0 "J9" H 1750 2917 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 1750 2826 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x13_P2.54mm_Horizontal" H 1700 2100 50  0001 C CNN
F 3 "~" H 1700 2100 50  0001 C CNN
	1    1700 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x20_Male J7
U 1 1 6069E929
P 1500 4450
F 0 "J7" H 1608 5531 50  0000 C CNN
F 1 "ST7920 Graphic LCD" H 1608 5440 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Horizontal" H 1500 4450 50  0001 C CNN
F 3 "~" H 1500 4450 50  0001 C CNN
	1    1500 4450
	1    0    0    -1  
$EndComp
Text GLabel 1700 4150 2    50   Input ~ 0
PB7S
Text GLabel 1700 4250 2    50   Input ~ 0
PB6S
Text GLabel 1700 4350 2    50   Input ~ 0
PB5S
Text GLabel 1700 4450 2    50   Input ~ 0
PB4S
Text GLabel 1700 4550 2    50   Input ~ 0
PB3S
Text GLabel 1700 4650 2    50   Input ~ 0
PB2S
Text GLabel 1700 4750 2    50   Input ~ 0
PB1S
$Comp
L power:VCC #PWR0151
U 1 1 5FEE6867
P 1700 5350
F 0 "#PWR0151" H 1700 5200 50  0001 C CNN
F 1 "VCC" V 1717 5478 50  0000 L CNN
F 2 "" H 1700 5350 50  0001 C CNN
F 3 "" H 1700 5350 50  0001 C CNN
	1    1700 5350
	0    1    -1   0   
$EndComp
Text GLabel 1700 4950 2    50   Input ~ 0
PC0S
Text GLabel 1700 5150 2    50   Input ~ 0
PC2S
Text GLabel 1700 5050 2    50   Input ~ 0
PC1S
Wire Wire Line
	1900 5450 1700 5450
$Comp
L power:VCC #PWR0152
U 1 1 5FF31253
P 1700 4050
F 0 "#PWR0152" H 1700 3900 50  0001 C CNN
F 1 "VCC" V 1717 4178 50  0000 L CNN
F 2 "" H 1700 4050 50  0001 C CNN
F 3 "" H 1700 4050 50  0001 C CNN
	1    1700 4050
	0    1    -1   0   
$EndComp
Text GLabel 1700 4850 2    50   Input ~ 0
PB0S
Text GLabel 1500 2000 0    50   Input ~ 0
PA7S
Text GLabel 1500 2100 0    50   Input ~ 0
PA6S
Text GLabel 1500 2200 0    50   Input ~ 0
PA5S
Text GLabel 1500 2300 0    50   Input ~ 0
PA4S
Text GLabel 1500 2400 0    50   Input ~ 0
PA3S
Text GLabel 1500 2500 0    50   Input ~ 0
PA2S
Text GLabel 1500 2600 0    50   Input ~ 0
PA1S
Text GLabel 1500 2700 0    50   Input ~ 0
PA0S
Text GLabel 1500 1900 0    50   Input ~ 0
PB0S
Text GLabel 1500 1800 0    50   Input ~ 0
PB1S
Text GLabel 1500 1700 0    50   Input ~ 0
PB2S
Text GLabel 1500 1600 0    50   Input ~ 0
PB3S
Text GLabel 2000 1600 2    50   Input ~ 0
PB4S
Text GLabel 2000 1700 2    50   Input ~ 0
PB5S
Text GLabel 2000 1800 2    50   Input ~ 0
PB6S
Text GLabel 2000 1900 2    50   Input ~ 0
PB7S
Text GLabel 2000 2700 2    50   Input ~ 0
PC0S
Text GLabel 2000 2500 2    50   Input ~ 0
PC2S
Text GLabel 2000 2000 2    50   Input ~ 0
PC7S
Text GLabel 2000 2600 2    50   Input ~ 0
PC1S
NoConn ~ 1700 3750
NoConn ~ 1700 3850
NoConn ~ 1700 3950
NoConn ~ 1700 5250
Text GLabel 2000 2400 2    50   Input ~ 0
PC3S
Text GLabel 1700 3550 2    50   Input ~ 0
BLK
$Comp
L power:VCC #PWR0103
U 1 1 601E6F33
P 1850 3650
F 0 "#PWR0103" H 1850 3500 50  0001 C CNN
F 1 "VCC" V 1867 3778 50  0000 L CNN
F 2 "" H 1850 3650 50  0001 C CNN
F 3 "" H 1850 3650 50  0001 C CNN
	1    1850 3650
	0    1    -1   0   
$EndComp
Wire Wire Line
	1700 3650 1850 3650
NoConn ~ 2000 2100
NoConn ~ 2000 2200
NoConn ~ 2000 2300
Wire Wire Line
	2150 1500 2000 1500
$Comp
L power:GND #PWR0150
U 1 1 5FEE4F47
P 1900 5450
F 0 "#PWR0150" H 1900 5200 50  0001 C CNN
F 1 "GND" H 1905 5277 50  0000 C CNN
F 2 "" H 1900 5450 50  0001 C CNN
F 3 "" H 1900 5450 50  0001 C CNN
	1    1900 5450
	0    -1   1    0   
$EndComp
Wire Wire Line
	1250 1500 1500 1500
$Comp
L power:GND #PWR0161
U 1 1 5FF33E5B
P 1250 1500
F 0 "#PWR0161" H 1250 1250 50  0001 C CNN
F 1 "GND" H 1255 1327 50  0000 C CNN
F 2 "" H 1250 1500 50  0001 C CNN
F 3 "" H 1250 1500 50  0001 C CNN
	1    1250 1500
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 6020AF92
P 2150 1500
F 0 "#PWR0104" H 2150 1350 50  0001 C CNN
F 1 "VCC" V 2165 1628 50  0000 L CNN
F 2 "" H 2150 1500 50  0001 C CNN
F 3 "" H 2150 1500 50  0001 C CNN
	1    2150 1500
	0    1    1    0   
$EndComp
Text Notes 1350 3250 0    50   ~ 0
LCD interface
Text Notes 5300 4800 0    50   ~ 0
Backlight (software controllable)
Text Notes 1250 1150 0    50   ~ 0
To Z-Fighter mainboard
Text Notes 5350 2950 0    50   ~ 0
Pull-ups for key switches
Text GLabel 6100 3700 2    50   Input ~ 0
RN_5
Text GLabel 6100 3800 2    50   Input ~ 0
RN_6
Text GLabel 6100 3900 2    50   Input ~ 0
RN_7
Text GLabel 6100 4000 2    50   Input ~ 0
RN_8
Text GLabel 6100 3600 2    50   Input ~ 0
RN_4
Text GLabel 6100 3500 2    50   Input ~ 0
RN_3
Text GLabel 6100 3400 2    50   Input ~ 0
RN_2
Text GLabel 6100 3300 2    50   Input ~ 0
RN_1
$Comp
L power:VCC #PWR0108
U 1 1 6056CEA1
P 5700 4000
F 0 "#PWR0108" H 5700 3850 50  0001 C CNN
F 1 "VCC" V 5718 4127 50  0000 L CNN
F 2 "" H 5700 4000 50  0001 C CNN
F 3 "" H 5700 4000 50  0001 C CNN
	1    5700 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Network08_US RN4
U 1 1 60568D6B
P 5900 3600
F 0 "RN4" V 6425 3600 50  0000 C CNN
F 1 "10KΩ" V 6334 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 6375 3600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5900 3600 50  0001 C CNN
	1    5900 3600
	0    -1   -1   0   
$EndComp
Text Notes 3800 800  0    50   ~ 0
Key switches x8
$EndSCHEMATC
