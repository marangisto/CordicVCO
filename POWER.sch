EESchema Schematic File Version 4
LIBS:Waves-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 11
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
L power:+12V #PWR063
U 1 1 5B5C945C
P 5350 4300
F 0 "#PWR063" H 5350 4150 50  0001 C CNN
F 1 "+12V" H 5350 4440 50  0000 C CNN
F 2 "" H 5350 4300 50  0001 C CNN
F 3 "" H 5350 4300 50  0001 C CNN
	1    5350 4300
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR064
U 1 1 5B5C94D1
P 5350 5500
F 0 "#PWR064" H 5350 5600 50  0001 C CNN
F 1 "-12V" H 5350 5650 50  0000 C CNN
F 2 "" H 5350 5500 50  0001 C CNN
F 3 "" H 5350 5500 50  0001 C CNN
	1    5350 5500
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5B5DAB7A
P 5100 4300
F 0 "#FLG02" H 5100 4375 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 4450 50  0000 C CNN
F 2 "" H 5100 4300 50  0001 C CNN
F 3 "" H 5100 4300 50  0001 C CNN
	1    5100 4300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5B5DABCD
P 5100 5500
F 0 "#FLG03" H 5100 5575 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 5650 50  0000 C CNN
F 2 "" H 5100 5500 50  0001 C CNN
F 3 "" H 5100 5500 50  0001 C CNN
	1    5100 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 4850 5100 4900
Connection ~ 5100 4900
Connection ~ 5100 4550
Connection ~ 5100 5250
Wire Wire Line
	5350 5250 5350 5500
Wire Wire Line
	5350 4300 5350 4550
Wire Wire Line
	5100 5250 5100 5500
Wire Wire Line
	5100 4550 5100 4300
Wire Wire Line
	5100 4900 5100 4950
Wire Wire Line
	5100 4550 5350 4550
Wire Wire Line
	5100 5250 5350 5250
$Comp
L Device:CP C32
U 1 1 5B8C4452
P 5100 4700
F 0 "C32" H 5218 4746 50  0000 L CNN
F 1 "22u" H 5218 4655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 5138 4550 50  0001 C CNN
F 3 "~" H 5100 4700 50  0001 C CNN
	1    5100 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C40
U 1 1 5B8C4492
P 7400 2000
F 0 "C40" H 7518 2046 50  0000 L CNN
F 1 "10u" H 7518 1955 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 7438 1850 50  0001 C CNN
F 3 "~" H 7400 2000 50  0001 C CNN
	1    7400 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5B8C943A
P 6250 5250
F 0 "D3" V 6288 5133 50  0000 R CNN
F 1 "LED" V 6197 5133 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Castellated" H 6250 5250 50  0001 C CNN
F 3 "~" H 6250 5250 50  0001 C CNN
	1    6250 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5B8CA688
P 5750 5250
F 0 "R18" H 5820 5296 50  0000 L CNN
F 1 "1k" H 5820 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5680 5250 50  0001 C CNN
F 3 "~" H 5750 5250 50  0001 C CNN
	1    5750 5250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR067
U 1 1 5B8CB2C3
P 6600 5500
F 0 "#PWR067" H 6600 5250 50  0001 C CNN
F 1 "GND" H 6605 5327 50  0000 C CNN
F 2 "" H 6600 5500 50  0001 C CNN
F 3 "" H 6600 5500 50  0001 C CNN
	1    6600 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR068
U 1 1 5D1A7951
P 7800 1700
F 0 "#PWR068" H 7800 1550 50  0001 C CNN
F 1 "+3.3V" H 7815 1873 50  0000 C CNN
F 2 "" H 7800 1700 50  0001 C CNN
F 3 "" H 7800 1700 50  0001 C CNN
	1    7800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1800 7400 1850
Wire Wire Line
	7800 1800 7800 1700
Wire Wire Line
	6700 1800 6950 1800
$Comp
L power:GND #PWR065
U 1 1 5D1A7963
P 6400 2300
F 0 "#PWR065" H 6400 2050 50  0001 C CNN
F 1 "GND" H 6405 2127 50  0000 C CNN
F 2 "" H 6400 2300 50  0001 C CNN
F 3 "" H 6400 2300 50  0001 C CNN
	1    6400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2300 6400 2200
Connection ~ 7400 1800
Connection ~ 6400 2200
Wire Wire Line
	6400 2200 6400 2100
Wire Wire Line
	6400 2200 6950 2200
Wire Wire Line
	7400 2200 7400 2150
$Comp
L Regulator_Linear:LM1117-3.3 U6
U 1 1 5D1A798F
P 6400 1800
F 0 "U6" H 6400 2042 50  0000 C CNN
F 1 "LM1117-3.3" H 6400 1951 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6400 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 6400 1800 50  0001 C CNN
	1    6400 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C33
U 1 1 5D1A794B
P 5100 5100
F 0 "C33" H 5218 5146 50  0000 L CNN
F 1 "22u" H 5218 5055 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 5138 4950 50  0001 C CNN
F 3 "~" H 5100 5100 50  0001 C CNN
	1    5100 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4800 3100 4900
Connection ~ 3100 4900
Wire Wire Line
	3100 5000 3100 4900
Wire Wire Line
	2600 4900 2600 5000
Connection ~ 2600 4900
Wire Wire Line
	2600 4800 2600 4900
Wire Wire Line
	2600 4700 3100 4700
Wire Wire Line
	2600 4800 3100 4800
Wire Wire Line
	2600 5000 3100 5000
Wire Wire Line
	2600 5100 3100 5100
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J15
U 1 1 5B8C48A5
P 2800 4900
F 0 "J15" H 2850 5317 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 2850 5226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 2800 4900 50  0001 C CNN
F 3 "~" H 2800 4900 50  0001 C CNN
	1    2800 4900
	1    0    0    1   
$EndComp
$Comp
L Device:D D2
U 1 1 5B8C45A3
P 3800 5250
F 0 "D2" H 3800 5466 50  0000 C CNN
F 1 "DFLR1400-7" H 3800 5375 50  0000 C CNN
F 2 "Diode_SMD:D_PowerDI-123" H 3800 5250 50  0001 C CNN
F 3 "~" H 3800 5250 50  0001 C CNN
	1    3800 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5B8C4538
P 3800 4550
F 0 "D1" H 3800 4334 50  0000 C CNN
F 1 "DFLR1400-7" H 3800 4425 50  0000 C CNN
F 2 "Diode_SMD:D_PowerDI-123" H 3800 4550 50  0001 C CNN
F 3 "~" H 3800 4550 50  0001 C CNN
	1    3800 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 4900 2400 4950
Connection ~ 2400 4900
Wire Wire Line
	2400 4850 2400 4900
Wire Wire Line
	3950 4550 4100 4550
Wire Wire Line
	2400 4900 2600 4900
Wire Wire Line
	3950 5250 4350 5250
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5B5DABA7
P 2400 4850
F 0 "#FLG01" H 2400 4925 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 5000 50  0000 C CNN
F 2 "" H 2400 4850 50  0001 C CNN
F 3 "" H 2400 4850 50  0001 C CNN
	1    2400 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR060
U 1 1 5B5C92CF
P 2400 4950
F 0 "#PWR060" H 2400 4700 50  0001 C CNN
F 1 "GND" H 2400 4800 50  0000 C CNN
F 2 "" H 2400 4950 50  0001 C CNN
F 3 "" H 2400 4950 50  0001 C CNN
	1    2400 4950
	1    0    0    -1  
$EndComp
Connection ~ 2600 4800
Connection ~ 2600 5000
Connection ~ 3100 4800
Connection ~ 3100 5000
$Comp
L Device:Ferrite_Bead FB1
U 1 1 5DBD1577
P 4500 4550
F 0 "FB1" V 4226 4550 50  0000 C CNN
F 1 "Ferrite_Bead" V 4317 4550 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4430 4550 50  0001 C CNN
F 3 "~" H 4500 4550 50  0001 C CNN
	1    4500 4550
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead FB2
U 1 1 5DBD27F7
P 4500 5250
F 0 "FB2" V 4226 5250 50  0000 C CNN
F 1 "Ferrite_Bead" V 4317 5250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4430 5250 50  0001 C CNN
F 3 "~" H 4500 5250 50  0001 C CNN
	1    4500 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 5250 5100 5250
Wire Wire Line
	3100 4900 5100 4900
Wire Wire Line
	4650 4550 5100 4550
Wire Wire Line
	7400 1800 7800 1800
$Comp
L Device:C C36
U 1 1 5D1A796C
P 5850 2000
F 0 "C36" H 5965 2046 50  0000 L CNN
F 1 "100n" H 5965 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5888 1850 50  0001 C CNN
F 3 "~" H 5850 2000 50  0001 C CNN
	1    5850 2000
	1    0    0    -1  
$EndComp
Connection ~ 5850 1800
Wire Wire Line
	5850 2200 6400 2200
Wire Wire Line
	5850 2150 5850 2200
Wire Wire Line
	5850 1800 6100 1800
Wire Wire Line
	5850 1850 5850 1800
$Comp
L Device:C C38
U 1 1 5DBE066A
P 6950 2000
F 0 "C38" H 7065 2046 50  0000 L CNN
F 1 "100n" H 7065 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6988 1850 50  0001 C CNN
F 3 "~" H 6950 2000 50  0001 C CNN
	1    6950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1800 5400 1800
Wire Wire Line
	5400 1850 5400 1800
Connection ~ 5400 1800
Wire Wire Line
	5400 1800 5850 1800
Wire Wire Line
	5400 2150 5400 2200
Wire Wire Line
	5400 2200 5850 2200
Connection ~ 5850 2200
Wire Wire Line
	6950 1850 6950 1800
Connection ~ 6950 1800
Wire Wire Line
	6950 1800 7400 1800
Wire Wire Line
	6950 2150 6950 2200
Connection ~ 6950 2200
Wire Wire Line
	6950 2200 7400 2200
Wire Wire Line
	4100 1800 4100 3250
Connection ~ 4100 4550
Wire Wire Line
	4100 4550 4350 4550
$Comp
L Device:CP C41
U 1 1 5DC262C9
P 7400 3450
F 0 "C41" H 7518 3496 50  0000 L CNN
F 1 "10u" H 7518 3405 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 7438 3300 50  0001 C CNN
F 3 "~" H 7400 3450 50  0001 C CNN
	1    7400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3250 7400 3300
Wire Wire Line
	7800 3250 7800 3150
Wire Wire Line
	6700 3250 6950 3250
Wire Wire Line
	6400 3750 6400 3650
Connection ~ 7400 3250
Connection ~ 6400 3650
Wire Wire Line
	6400 3650 6400 3550
Wire Wire Line
	6400 3650 6950 3650
Wire Wire Line
	7400 3650 7400 3600
$Comp
L Regulator_Linear:LM1117-3.3 U7
U 1 1 5DC262F0
P 6400 3250
F 0 "U7" H 6400 3492 50  0000 C CNN
F 1 "LM1117-3.3" H 6400 3401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6400 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 6400 3250 50  0001 C CNN
	1    6400 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3250 7800 3250
$Comp
L Device:C C37
U 1 1 5DC262FB
P 5850 3450
F 0 "C37" H 5965 3496 50  0000 L CNN
F 1 "100n" H 5965 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5888 3300 50  0001 C CNN
F 3 "~" H 5850 3450 50  0001 C CNN
	1    5850 3450
	1    0    0    -1  
$EndComp
Connection ~ 5850 3250
Wire Wire Line
	5850 3650 6400 3650
Wire Wire Line
	5850 3600 5850 3650
Wire Wire Line
	5850 3250 6100 3250
Wire Wire Line
	5850 3300 5850 3250
$Comp
L Device:C C39
U 1 1 5DC2630A
P 6950 3450
F 0 "C39" H 7065 3496 50  0000 L CNN
F 1 "100n" H 7065 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6988 3300 50  0001 C CNN
F 3 "~" H 6950 3450 50  0001 C CNN
	1    6950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3250 5400 3250
$Comp
L Device:Ferrite_Bead FB3
U 1 1 5DC2631F
P 5050 3250
F 0 "FB3" V 4776 3250 50  0000 C CNN
F 1 "Ferrite_Bead" V 4867 3250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4980 3250 50  0001 C CNN
F 3 "~" H 5050 3250 50  0001 C CNN
	1    5050 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 3300 5400 3250
Connection ~ 5400 3250
Wire Wire Line
	5400 3250 5850 3250
Wire Wire Line
	5400 3600 5400 3650
Wire Wire Line
	5400 3650 5850 3650
Connection ~ 5850 3650
Wire Wire Line
	6950 3300 6950 3250
Connection ~ 6950 3250
Wire Wire Line
	6950 3250 7400 3250
Wire Wire Line
	6950 3600 6950 3650
Connection ~ 6950 3650
Wire Wire Line
	6950 3650 7400 3650
Wire Wire Line
	4900 3250 4100 3250
Wire Wire Line
	4100 3250 4100 4550
Connection ~ 4100 3250
$Comp
L power:+3.3VA #PWR069
U 1 1 5DC2F8AA
P 7800 3150
F 0 "#PWR069" H 7800 3000 50  0001 C CNN
F 1 "+3.3VA" H 7815 3323 50  0000 C CNN
F 2 "" H 7800 3150 50  0001 C CNN
F 3 "" H 7800 3150 50  0001 C CNN
	1    7800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1850 4450 1800
Connection ~ 4450 1800
Wire Wire Line
	4450 1800 4100 1800
Wire Wire Line
	4450 2150 4450 2200
Wire Wire Line
	4450 2200 5400 2200
Connection ~ 5400 2200
$Comp
L pspice:INDUCTOR L1
U 1 1 5DC3FD6D
P 4950 1800
F 0 "L1" H 4950 2015 50  0000 C CNN
F 1 "33u" H 4950 1924 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 4950 1800 50  0001 C CNN
F 3 "~" H 4950 1800 50  0001 C CNN
	1    4950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1800 4450 1800
$Comp
L Device:C C31
U 1 1 5DC604B5
P 4450 2000
F 0 "C31" H 4565 2046 50  0000 L CNN
F 1 "22u" H 4565 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4488 1850 50  0001 C CNN
F 3 "~" H 4450 2000 50  0001 C CNN
	1    4450 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C34
U 1 1 5DC60C05
P 5400 2000
F 0 "C34" H 5515 2046 50  0000 L CNN
F 1 "22u" H 5515 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5438 1850 50  0001 C CNN
F 3 "~" H 5400 2000 50  0001 C CNN
	1    5400 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C35
U 1 1 5DC61435
P 5400 3450
F 0 "C35" H 5515 3496 50  0000 L CNN
F 1 "22u" H 5515 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5438 3300 50  0001 C CNN
F 3 "~" H 5400 3450 50  0001 C CNN
	1    5400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5250 5600 5250
Connection ~ 5350 5250
Wire Wire Line
	5900 5250 6100 5250
Wire Wire Line
	6400 5250 6600 5250
Wire Wire Line
	6600 5250 6600 5500
Wire Wire Line
	3100 4700 3400 4700
Wire Wire Line
	3400 4700 3400 4550
Wire Wire Line
	3400 4550 3650 4550
Connection ~ 3100 4700
Wire Wire Line
	3400 5250 3650 5250
Wire Wire Line
	3100 5100 3400 5100
Wire Wire Line
	3400 5100 3400 5250
Connection ~ 3100 5100
$Comp
L Reference_Voltage:LM4040DBZ-10 D4
U 1 1 5C03F10C
P 9000 4950
F 0 "D4" V 8954 5029 50  0000 L CNN
F 1 "LM4040DBZ-10" V 9045 5029 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9000 4750 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm4040-n.pdf" H 9000 4950 50  0001 C CIN
	1    9000 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5C03F1FD
P 9000 4500
F 0 "R19" H 9070 4546 50  0000 L CNN
F 1 "2k2" H 9070 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8930 4500 50  0001 C CNN
F 3 "~" H 9000 4500 50  0001 C CNN
	1    9000 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4650 9000 4700
Wire Wire Line
	9000 4200 9000 4350
Wire Wire Line
	9350 4700 9000 4700
Connection ~ 9000 4700
Wire Wire Line
	9000 4700 9000 4800
Text GLabel 9350 4700 2    50   Input ~ 0
VRef-10
$Comp
L power:-12V #PWR070
U 1 1 5C03F3AF
P 9000 4200
F 0 "#PWR070" H 9000 4300 50  0001 C CNN
F 1 "-12V" H 9015 4373 50  0000 C CNN
F 2 "" H 9000 4200 50  0001 C CNN
F 3 "" H 9000 4200 50  0001 C CNN
	1    9000 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C42
U 1 1 5DCC93BA
P 8600 4950
F 0 "C42" H 8715 4996 50  0000 L CNN
F 1 "1u" H 8715 4905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8638 4800 50  0001 C CNN
F 3 "~" H 8600 4950 50  0001 C CNN
	1    8600 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4800 8600 4700
Wire Wire Line
	8600 4700 9000 4700
$Comp
L power:GNDA #PWR066
U 1 1 5E324223
P 6400 3750
F 0 "#PWR066" H 6400 3500 50  0001 C CNN
F 1 "GNDA" H 6405 3577 50  0000 C CNN
F 2 "" H 6400 3750 50  0001 C CNN
F 3 "" H 6400 3750 50  0001 C CNN
	1    6400 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR071
U 1 1 5E324E98
P 9000 5350
F 0 "#PWR071" H 9000 5100 50  0001 C CNN
F 1 "GNDA" H 9005 5177 50  0000 C CNN
F 2 "" H 9000 5350 50  0001 C CNN
F 3 "" H 9000 5350 50  0001 C CNN
	1    9000 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5250 9000 5250
Wire Wire Line
	9000 5100 9000 5250
Wire Wire Line
	8600 5100 8600 5250
Wire Wire Line
	9000 5250 9000 5350
Connection ~ 9000 5250
$Comp
L power:GND #PWR061
U 1 1 5E32C8A8
P 3900 6900
F 0 "#PWR061" H 3900 6650 50  0001 C CNN
F 1 "GND" H 3905 6727 50  0000 C CNN
F 2 "" H 3900 6900 50  0001 C CNN
F 3 "" H 3900 6900 50  0001 C CNN
	1    3900 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR062
U 1 1 5E32CE4B
P 4600 6900
F 0 "#PWR062" H 4600 6650 50  0001 C CNN
F 1 "GNDA" H 4605 6727 50  0000 C CNN
F 2 "" H 4600 6900 50  0001 C CNN
F 3 "" H 4600 6900 50  0001 C CNN
	1    4600 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6900 3900 6800
Wire Wire Line
	4600 6800 4600 6900
$Comp
L power:PWR_FLAG #FLG04
U 1 1 5E3342B6
P 5850 1800
F 0 "#FLG04" H 5850 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 5850 1950 50  0000 C CNN
F 2 "" H 5850 1800 50  0001 C CNN
F 3 "" H 5850 1800 50  0001 C CNN
	1    5850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG05
U 1 1 5E33515B
P 5850 3250
F 0 "#FLG05" H 5850 3325 50  0001 C CNN
F 1 "PWR_FLAG" H 5850 3400 50  0000 C CNN
F 2 "" H 5850 3250 50  0001 C CNN
F 3 "" H 5850 3250 50  0001 C CNN
	1    5850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6800 4600 6800
$EndSCHEMATC
