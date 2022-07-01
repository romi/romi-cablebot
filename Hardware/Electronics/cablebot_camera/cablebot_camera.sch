EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Raspberry Pi Zero (W) uHAT Template Board"
Date "2019-02-28"
Rev "1.0"
Comp ""
Comment1 "This Schematic is licensed under MIT Open Source License."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L cablebot_camera-rescue:Conn_02x20_Odd_Even-Connector_Generic J1
U 1 1 5C77771F
P 8700 2250
F 0 "J1" H 8750 3367 50  0000 C CNN
F 1 "GPIO_CONNECTOR" H 8750 3276 50  0000 C CNN
F 2 "lib:PinSocket_2x20_P2.54mm_Vertical_Centered_Anchor" H 8700 2250 50  0001 C CNN
F 3 "~" H 8700 2250 50  0001 C CNN
	1    8700 2250
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:GND-power #PWR0101
U 1 1 5C777805
P 8300 3400
F 0 "#PWR0101" H 8300 3150 50  0001 C CNN
F 1 "GND" H 8305 3227 50  0001 C CNN
F 2 "" H 8300 3400 50  0001 C CNN
F 3 "" H 8300 3400 50  0001 C CNN
	1    8300 3400
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:GND-power #PWR0102
U 1 1 5C777838
P 9200 3400
F 0 "#PWR0102" H 9200 3150 50  0001 C CNN
F 1 "GND" H 9205 3227 50  0001 C CNN
F 2 "" H 9200 3400 50  0001 C CNN
F 3 "" H 9200 3400 50  0001 C CNN
	1    9200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 1750 8300 1750
Wire Wire Line
	8300 1750 8300 2550
Wire Wire Line
	8500 2550 8300 2550
Connection ~ 8300 2550
Wire Wire Line
	8300 2550 8300 3250
Wire Wire Line
	8500 3250 8300 3250
Connection ~ 8300 3250
Wire Wire Line
	8300 3250 8300 3400
Wire Wire Line
	9000 1550 9200 1550
Wire Wire Line
	9200 1550 9200 1950
Wire Wire Line
	9000 1950 9200 1950
Connection ~ 9200 1950
Wire Wire Line
	9200 1950 9200 2250
Wire Wire Line
	9000 2250 9200 2250
Connection ~ 9200 2250
Wire Wire Line
	9000 2750 9200 2750
Wire Wire Line
	9200 2250 9200 2750
Connection ~ 9200 2750
Wire Wire Line
	9200 2750 9200 2950
Wire Wire Line
	9000 2950 9200 2950
Connection ~ 9200 2950
Wire Wire Line
	9200 2950 9200 3350
$Comp
L cablebot_camera-rescue:+3.3V-power #PWR0103
U 1 1 5C777AB0
P 8250 1250
F 0 "#PWR0103" H 8250 1100 50  0001 C CNN
F 1 "+3.3V" H 8265 1423 50  0000 C CNN
F 2 "" H 8250 1250 50  0001 C CNN
F 3 "" H 8250 1250 50  0001 C CNN
	1    8250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1350 8250 1250
Wire Wire Line
	8500 2150 8250 2150
Wire Wire Line
	8250 2150 8250 1350
Connection ~ 8250 1350
$Comp
L cablebot_camera-rescue:+5V-power #PWR0104
U 1 1 5C777E01
P 9300 1250
F 0 "#PWR0104" H 9300 1100 50  0001 C CNN
F 1 "+5V" H 9315 1423 50  0000 C CNN
F 2 "" H 9300 1250 50  0001 C CNN
F 3 "" H 9300 1250 50  0001 C CNN
	1    9300 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1350 9300 1350
Wire Wire Line
	9300 1350 9300 1250
Wire Wire Line
	9000 1450 9300 1450
Wire Wire Line
	9300 1450 9300 1350
Connection ~ 9300 1350
$Comp
L cablebot_camera-rescue:PWR_FLAG-power #FLG0101
U 1 1 5C77824A
P 7850 1250
F 0 "#FLG0101" H 7850 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 7850 1424 50  0000 C CNN
F 2 "" H 7850 1250 50  0001 C CNN
F 3 "~" H 7850 1250 50  0001 C CNN
	1    7850 1250
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:GND-power #PWR0105
U 1 1 5C778504
P 7900 3500
F 0 "#PWR0105" H 7900 3250 50  0001 C CNN
F 1 "GND" H 7905 3327 50  0001 C CNN
F 2 "" H 7900 3500 50  0001 C CNN
F 3 "" H 7900 3500 50  0001 C CNN
	1    7900 3500
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:PWR_FLAG-power #FLG0102
U 1 1 5C778511
P 7900 3450
F 0 "#FLG0102" H 7900 3525 50  0001 C CNN
F 1 "PWR_FLAG" H 7900 3624 50  0000 C CNN
F 2 "" H 7900 3450 50  0001 C CNN
F 3 "~" H 7900 3450 50  0001 C CNN
	1    7900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3450 7900 3500
Text Notes 8050 3900 0    50   ~ 10
If back powering Pi with 5V \nNOTE that the Raspberry Pi 3B+ and Pi Zero \nand ZeroW do not include an input ZVD.
Wire Notes Line
	8000 3600 8000 3950
Wire Notes Line
	8000 3950 9850 3950
Wire Notes Line
	9850 3950 9850 3600
Wire Notes Line
	9850 3600 8000 3600
Wire Wire Line
	8250 1350 8500 1350
Wire Wire Line
	7850 1350 7850 1250
Wire Wire Line
	7850 1350 8250 1350
$Comp
L cablebot_camera-rescue:PWR_FLAG-power #FLG0103
U 1 1 5C77CEFA
P 9650 1250
F 0 "#FLG0103" H 9650 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 9650 1424 50  0000 C CNN
F 2 "" H 9650 1250 50  0001 C CNN
F 3 "~" H 9650 1250 50  0001 C CNN
	1    9650 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1350 9650 1350
Wire Wire Line
	9650 1250 9650 1350
Text Label 7550 1450 0    50   ~ 0
GPIO2_SDA1
Text Label 7550 1550 0    50   ~ 0
GPIO3_SCL1
Text Label 7550 1650 0    50   ~ 0
GPIO4_GPIO_GCLK
Text Label 7550 1850 0    50   ~ 0
GPIO17_GEN0
Text Label 7550 1950 0    50   ~ 0
GPIO27_GEN2
Text Label 7550 2050 0    50   ~ 0
GPIO22_GEN3
Text Label 7550 2250 0    50   ~ 0
GPIO10_SPI_MOSI
Wire Wire Line
	7450 2250 8500 2250
Wire Wire Line
	7450 2350 8500 2350
Wire Wire Line
	7450 2450 8500 2450
Wire Wire Line
	7450 2650 8500 2650
Wire Wire Line
	7450 2750 8500 2750
Wire Wire Line
	7450 2850 8500 2850
Wire Wire Line
	7450 2950 8500 2950
Wire Wire Line
	7450 3050 8500 3050
Wire Wire Line
	7450 3150 8500 3150
Wire Wire Line
	7450 2050 8500 2050
Wire Wire Line
	7450 1950 8500 1950
Wire Wire Line
	7450 1650 8500 1650
Wire Wire Line
	7450 1550 8500 1550
Wire Wire Line
	7450 1450 8500 1450
Text Label 7550 2350 0    50   ~ 0
GPIO9_SPI_MISO
Text Label 7550 2450 0    50   ~ 0
GPIO11_SPI_SCLK
Text Label 7550 2650 0    50   ~ 0
ID_SD
Text Label 7550 2750 0    50   ~ 0
GPIO5
Text Label 7550 2850 0    50   ~ 0
GPIO6
Text Label 7550 2950 0    50   ~ 0
GPIO13
Text Label 7550 3050 0    50   ~ 0
GPIO19
Text Label 7550 3150 0    50   ~ 0
GPIO26
NoConn ~ 7450 1650
NoConn ~ 7450 1950
NoConn ~ 7450 2050
NoConn ~ 7450 2250
NoConn ~ 7450 2350
NoConn ~ 7450 2450
NoConn ~ 7450 2650
NoConn ~ 7450 2750
NoConn ~ 7450 2850
NoConn ~ 7450 2950
NoConn ~ 7450 3050
NoConn ~ 7450 3150
Text Label 9350 1650 0    50   ~ 0
GPIO14_TXD0
Text Label 9350 1750 0    50   ~ 0
GPIO15_RXD0
Text Label 9350 1850 0    50   ~ 0
GPIO18_GEN1
Text Label 9350 2050 0    50   ~ 0
GPIO23_GEN4
Text Label 9350 2150 0    50   ~ 0
GPIO24_GEN5
Text Label 9350 2350 0    50   ~ 0
GPIO25_GEN6
Text Label 9350 2450 0    50   ~ 0
GPIO8_SPI_CE0_N
Text Label 9350 2550 0    50   ~ 0
GPIO7_SPI_CE1_N
Wire Wire Line
	9000 2450 10050 2450
Wire Wire Line
	9000 2550 10050 2550
Text Label 9350 2650 0    50   ~ 0
ID_SC
Text Label 9350 2850 0    50   ~ 0
GPIO12
Text Label 9350 3050 0    50   ~ 0
GPIO16
Text Label 9350 3150 0    50   ~ 0
GPIO20
Text Label 9350 3250 0    50   ~ 0
GPIO21
Wire Wire Line
	9000 1850 10050 1850
Wire Wire Line
	9000 2050 10050 2050
Wire Wire Line
	9000 2150 10050 2150
Wire Wire Line
	9000 2350 10050 2350
Wire Wire Line
	9000 2650 10050 2650
Wire Wire Line
	9000 2850 10050 2850
Wire Wire Line
	9000 3050 10050 3050
Wire Wire Line
	9000 3150 10050 3150
NoConn ~ 10050 1850
NoConn ~ 10050 2050
NoConn ~ 10050 2150
NoConn ~ 10050 2350
NoConn ~ 10050 2450
NoConn ~ 10050 2550
NoConn ~ 10050 2650
NoConn ~ 10050 2850
NoConn ~ 10050 3050
NoConn ~ 10050 3150
NoConn ~ 10050 3250
Wire Wire Line
	9000 3250 10050 3250
$Comp
L cablebot_camera-rescue:MountingHole-Mechanical H3
U 1 1 5C7C8014
P 10400 3050
F 0 "H3" H 10500 3096 50  0000 L CNN
F 1 "MountingHole" H 10500 3005 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 10400 3050 50  0001 C CNN
F 3 "~" H 10400 3050 50  0001 C CNN
	1    10400 3050
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:MountingHole-Mechanical H4
U 1 1 5C7C8030
P 10400 3250
F 0 "H4" H 10500 3296 50  0000 L CNN
F 1 "MountingHole" H 10500 3205 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 10400 3250 50  0001 C CNN
F 3 "~" H 10400 3250 50  0001 C CNN
	1    10400 3250
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:Adafruit_Feather_M0_Express-MCU_Module A1
U 1 1 60DE2ED2
P 2300 2250
F 0 "A1" H 2300 861 50  0000 C CNN
F 1 "Adafruit_Feather_M0_Express" H 2300 770 50  0000 C CNN
F 2 "Module:Adafruit_Feather" H 2400 900 50  0001 L CNN
F 3 "https://cdn-learn.adafruit.com/downloads/pdf/adafruit-feather-m0-express-designed-for-circuit-python-circuitpython.pdf" H 2300 1050 50  0001 C CNN
	1    2300 2250
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:Conn_01x09_Female-Connector AC1
U 1 1 60DEF187
P 5750 3350
F 0 "AC1" H 5778 3376 50  0000 L CNN
F 1 "ACCEL" H 5778 3285 50  0000 L CNN
F 2 "fab:Adafruit-LSM6DSOX-PCB" H 5750 3350 50  0001 C CNN
F 3 "~" H 5750 3350 50  0001 C CNN
	1    5750 3350
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:OKI-78SR-5_1.5-W36-C-Converter_DCDC U1
U 1 1 60DF084D
P 5350 1500
F 0 "U1" H 5350 1742 50  0000 C CNN
F 1 "OKI-78SR-5_1.5-W36-C" H 5350 1651 50  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_Murata_OKI-78SR_Horizontal" H 5400 1250 50  0001 L CIN
F 3 "https://power.murata.com/data/power/oki-78sr.pdf" H 5350 1500 50  0001 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
Text Notes 6000 2700 0    50   ~ 0
ACCEL
Text GLabel 1850 4850 0    50   Input ~ 0
RX0
Text GLabel 1850 4950 0    50   Input ~ 0
TX0
Wire Wire Line
	1850 4850 2050 4850
Wire Wire Line
	2050 4950 1850 4950
Text GLabel 2100 4000 0    50   Input ~ 0
GND
Wire Wire Line
	2100 4000 2300 4000
Wire Wire Line
	2300 4000 2300 3550
Text GLabel 850  3050 0    50   Input ~ 0
SDA
Text GLabel 1250 3150 0    50   Input ~ 0
SCL
Wire Wire Line
	1250 3150 1450 3150
$Comp
L cablebot_camera-rescue:Screw_Terminal_01x02-Connector J4
U 1 1 60FD4FAE
P 2250 6000
F 0 "J4" H 2330 5992 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 2330 5901 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 2250 6000 50  0001 C CNN
F 3 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1985807?qs=YbgdthCBnKfnTSCcIEjWsg%3D%3D" H 2250 6000 50  0001 C CNN
	1    2250 6000
	1    0    0    -1  
$EndComp
Text GLabel 1850 6100 0    50   Input ~ 0
GND
Text GLabel 1850 6000 0    50   Input ~ 0
VCC
Wire Wire Line
	1850 6000 2050 6000
Wire Wire Line
	1850 6100 2050 6100
Text GLabel 5200 2100 0    50   Input ~ 0
GND
Wire Wire Line
	5200 2100 5350 2100
Wire Wire Line
	5350 2100 5350 1800
Text GLabel 4700 1500 0    50   Input ~ 0
VCC
Wire Wire Line
	4700 1500 5050 1500
Text GLabel 6000 1500 2    50   Input ~ 0
5V
Text GLabel 2650 800  2    50   Input ~ 0
5V
Wire Wire Line
	2650 800  2500 800 
Wire Wire Line
	2500 800  2500 1050
Text GLabel 2300 800  0    50   Input ~ 0
3V3
Wire Wire Line
	2300 800  2400 800 
Wire Wire Line
	2400 800  2400 1050
Text GLabel 5200 2950 0    50   Input ~ 0
3V3
Text GLabel 5200 3150 0    50   Input ~ 0
GND
Text GLabel 5200 3350 0    50   Input ~ 0
SDA_IMU
Text GLabel 5200 3250 0    50   Input ~ 0
SCL_IMU
Text GLabel 10050 1450 2    50   Input ~ 0
5V
Wire Wire Line
	10050 1450 9300 1450
Connection ~ 9300 1450
Text GLabel 9400 3350 2    50   Input ~ 0
GND
Wire Wire Line
	9400 3350 9200 3350
Connection ~ 9200 3350
Wire Wire Line
	9200 3350 9200 3400
Text GLabel 10050 1750 2    50   Input ~ 0
RX0
Text GLabel 10050 1650 2    50   Input ~ 0
TX0
Wire Wire Line
	9000 1750 10050 1750
Wire Wire Line
	9000 1650 10050 1650
Wire Wire Line
	5200 3350 5550 3350
Wire Wire Line
	5550 3250 5200 3250
Wire Wire Line
	5200 3150 5550 3150
Wire Wire Line
	5550 2950 5200 2950
NoConn ~ 2200 1050
NoConn ~ 2800 1750
NoConn ~ 2800 1850
NoConn ~ 5550 3450
NoConn ~ 5550 3550
NoConn ~ 5550 3650
NoConn ~ 5550 3750
Text GLabel 7450 1450 0    50   Input ~ 0
SDA
Text GLabel 7450 1550 0    50   Input ~ 0
SCL
$Comp
L cablebot_camera-rescue:Screw_Terminal_01x02-Connector J5
U 1 1 60E0253E
P 2250 4850
F 0 "J5" H 2330 4842 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 2330 4751 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 2250 4850 50  0001 C CNN
F 3 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1985807?qs=YbgdthCBnKfnTSCcIEjWsg%3D%3D" H 2250 4850 50  0001 C CNN
	1    2250 4850
	1    0    0    -1  
$EndComp
Text Notes 3550 5000 0    50   ~ 0
SMALL
$Comp
L cablebot_camera-rescue:DRV8313-SquantorTexasInstruments U3
U 1 1 60E0E6B2
P 6600 5450
F 0 "U3" H 6600 6487 60  0000 C CNN
F 1 "DRV8313" H 6600 6381 60  0000 C CNN
F 2 "SquantorTexasInstruments:SquantorTexasInstruments-HTSSOP-28" H 6450 5600 60  0001 C CNN
F 3 "" H 6450 5600 60  0001 C CNN
F 4 "C92482" H 6600 5450 50  0001 C CNN "LCSC"
	1    6600 5450
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:CAP-UNPOLARIZEDFAB-fab C2
U 1 1 60E12512
P 5150 4700
F 0 "C2" V 5058 4788 45  0000 L CNN
F 1 "0.01uF" V 5142 4788 45  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5180 4850 20  0001 C CNN
F 3 "" H 5150 4700 50  0001 C CNN
F 4 "C28233" H 5150 4700 50  0001 C CNN "LCSC"
	1    5150 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 4500 5150 4450
Wire Wire Line
	5150 4450 5650 4450
Wire Wire Line
	5650 4450 5650 4700
Text GLabel 4950 5250 0    50   Input ~ 0
VCC
$Comp
L cablebot_camera-rescue:CAP-UNPOLARIZEDFAB-fab C3
U 1 1 60E1F5E0
P 5150 5050
F 0 "C3" V 5142 4962 45  0000 R CNN
F 1 "0.1uF" V 5058 4962 45  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5180 5200 20  0001 C CNN
F 3 "" H 5150 5050 50  0001 C CNN
F 4 "C14663" H 5150 5050 50  0001 C CNN "LCSC"
	1    5150 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 5250 5150 5250
Wire Wire Line
	5500 5000 5500 5250
Connection ~ 5150 5250
$Comp
L cablebot_camera-rescue:CAP-UNPOLARIZEDFAB-fab C1
U 1 1 60E32363
P 5150 5350
F 0 "C1" V 5142 5262 45  0000 R CNN
F 1 "0.1uF" V 5058 5262 45  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5180 5500 20  0001 C CNN
F 3 "" H 5150 5350 50  0001 C CNN
F 4 "C14663" H 5150 5350 50  0001 C CNN "LCSC"
	1    5150 5350
	0    -1   -1   0   
$EndComp
$Comp
L cablebot_camera-rescue:Screw_Terminal_01x03-Connector J8
U 1 1 60E397F8
P 2250 5650
F 0 "J8" H 2330 5642 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 2330 5551 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-3-3.5-H_1x03_P3.50mm_Horizontal" H 2250 5650 50  0001 C CNN
F 3 "~" H 2250 5650 50  0001 C CNN
	1    2250 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4700 6150 4700
Wire Wire Line
	5150 4800 6150 4800
Wire Wire Line
	5150 4900 6150 4900
Wire Wire Line
	5500 5000 6150 5000
Text GLabel 5850 5100 0    50   Input ~ 0
OUT1
Text GLabel 5850 5400 0    50   Input ~ 0
OUT2
Text GLabel 5850 5500 0    50   Input ~ 0
OUT3
Wire Wire Line
	5850 5500 6150 5500
Wire Wire Line
	6150 5400 5850 5400
Wire Wire Line
	5850 5100 6150 5100
Text GLabel 1850 5750 0    50   Input ~ 0
OUT1
Text GLabel 1850 5650 0    50   Input ~ 0
OUT2
Text GLabel 1850 5550 0    50   Input ~ 0
OUT3
Wire Wire Line
	1850 5750 2050 5750
Wire Wire Line
	1850 5650 2050 5650
Wire Wire Line
	1850 5550 2050 5550
Text GLabel 4950 5700 0    50   Input ~ 0
VCC
$Comp
L cablebot_camera-rescue:CAP-UNPOLARIZEDFAB-fab C4
U 1 1 60E83D49
P 5150 6000
F 0 "C4" V 5150 5900 45  0000 R CNN
F 1 "100uF" V 5050 5900 45  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 5180 6150 20  0001 C CNN
F 3 "" H 5150 6000 50  0001 C CNN
	1    5150 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 5700 5150 5700
Wire Wire Line
	5150 5800 5150 5700
Connection ~ 5150 5700
Wire Wire Line
	5150 5700 5500 5700
Wire Wire Line
	5500 5800 5500 5700
Connection ~ 5500 5700
Wire Wire Line
	5500 5700 6150 5700
Text GLabel 4950 6200 0    50   Input ~ 0
GND
Wire Wire Line
	4950 6200 5150 6200
Wire Wire Line
	5500 6200 5500 6100
Wire Wire Line
	5150 6100 5150 6200
Connection ~ 5150 6200
Wire Wire Line
	5150 6200 5500 6200
$Comp
L cablebot_camera-rescue:CAP-UNPOLARIZEDFAB-fab C5
U 1 1 60E833A1
P 5500 5900
F 0 "C5" V 5500 6050 45  0000 R CNN
F 1 "0.1uF" V 5400 6150 45  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5530 6050 20  0001 C CNN
F 3 "" H 5500 5900 50  0001 C CNN
F 4 "C14663" H 5500 5900 50  0001 C CNN "LCSC"
	1    5500 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 5800 6000 5900
Wire Wire Line
	6000 6000 6150 6000
Wire Wire Line
	6000 5800 6150 5800
Wire Wire Line
	6150 5900 6000 5900
Connection ~ 6000 5900
Wire Wire Line
	6000 5900 6000 6000
Wire Wire Line
	6000 6000 6000 6200
Wire Wire Line
	6000 6200 6150 6200
Connection ~ 6000 6000
Text GLabel 7300 5600 2    50   Input ~ 0
GND
Wire Wire Line
	7050 5400 7200 5400
Wire Wire Line
	7200 5400 7200 5500
Wire Wire Line
	7200 5600 7300 5600
Wire Wire Line
	7050 5600 7200 5600
Connection ~ 7200 5600
Wire Wire Line
	7050 5500 7200 5500
Connection ~ 7200 5500
Wire Wire Line
	7200 5500 7200 5600
Text GLabel 7300 5800 2    50   Input ~ 0
SLEEP
Text GLabel 7300 5900 2    50   Input ~ 0
RESET
Wire Wire Line
	7050 5800 7300 5800
Wire Wire Line
	7050 5900 7300 5900
Text GLabel 7300 4800 2    50   Input ~ 0
IN1
Text GLabel 7300 4900 2    50   Input ~ 0
EN1
Text GLabel 7300 5000 2    50   Input ~ 0
IN2
Text GLabel 7300 5100 2    50   Input ~ 0
EN2
Text GLabel 7300 5200 2    50   Input ~ 0
IN3
Text GLabel 7300 5300 2    50   Input ~ 0
EN3
Wire Wire Line
	7050 4800 7300 4800
Wire Wire Line
	7300 4900 7050 4900
Wire Wire Line
	7050 5000 7300 5000
Wire Wire Line
	7300 5100 7050 5100
Wire Wire Line
	7050 5200 7300 5200
Wire Wire Line
	7300 5300 7050 5300
$Comp
L cablebot_camera-rescue:Screw_Terminal_01x02-Connector J6
U 1 1 60F4AEB1
P 2250 5200
F 0 "J6" H 2330 5192 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 2330 5101 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 2250 5200 50  0001 C CNN
F 3 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1985807?qs=YbgdthCBnKfnTSCcIEjWsg%3D%3D" H 2250 5200 50  0001 C CNN
	1    2250 5200
	1    0    0    -1  
$EndComp
Text GLabel 1850 5300 0    50   Input ~ 0
GND
Text GLabel 1850 5200 0    50   Input ~ 0
5V
Wire Wire Line
	1850 5200 2050 5200
Wire Wire Line
	1850 5300 2050 5300
$Comp
L cablebot_camera-rescue:CAP-UNPOLARIZEDFAB-fab C6
U 1 1 60F7CAD6
P 5850 1750
F 0 "C6" V 5850 1900 45  0000 R CNN
F 1 "0.1uF" V 5750 2000 45  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5880 1900 20  0001 C CNN
F 3 "" H 5850 1750 50  0001 C CNN
F 4 "C14663" H 5850 1750 50  0001 C CNN "LCSC"
	1    5850 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 2100 5850 2100
Wire Wire Line
	5850 2100 5850 1950
Connection ~ 5350 2100
Wire Wire Line
	5850 1650 5850 1500
Wire Wire Line
	5650 1500 5850 1500
Connection ~ 5850 1500
Wire Wire Line
	5850 1500 6000 1500
$Comp
L cablebot_camera-rescue:Conn_01x06_Male-Connector J3
U 1 1 60FB61A4
P 2500 6650
F 0 "J3" H 2400 6650 50  0000 L CNN
F 1 "Conn_01x06_Male" H 1800 6750 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 2500 6650 50  0001 C CNN
F 3 "~" H 2500 6650 50  0001 C CNN
	1    2500 6650
	-1   0    0    1   
$EndComp
Text GLabel 1850 6650 0    50   Input ~ 0
SCK_Z
Text GLabel 1850 6450 0    50   Input ~ 0
MISO
Text GLabel 1600 2550 0    50   Input ~ 0
MISO
Text GLabel 1600 2450 0    50   Input ~ 0
MOSI_B
Text GLabel 3050 2150 2    50   Input ~ 0
CN_PWM_A
Wire Wire Line
	1600 2350 1800 2350
Wire Wire Line
	1800 2450 1600 2450
Wire Wire Line
	1600 2550 1800 2550
Text GLabel 3050 2250 2    50   Input ~ 0
PWM
Text GLabel 3050 2450 2    50   Input ~ 0
SCL_IMU
Text GLabel 3050 2350 2    50   Input ~ 0
SDA_IMU
Text GLabel 3050 2550 2    50   Input ~ 0
SLEEP
Text GLabel 1600 2050 0    50   Input ~ 0
IN1
Text GLabel 1600 1950 0    50   Input ~ 0
EN1
Text GLabel 1600 1850 0    50   Input ~ 0
IN2
Text GLabel 1600 1750 0    50   Input ~ 0
EN2
Text GLabel 1600 1550 0    50   Input ~ 0
IN3
Text GLabel 1600 1450 0    50   Input ~ 0
EN3
Text GLabel 3050 2050 2    50   Input ~ 0
RESET
Text GLabel 3050 1450 2    50   Input ~ 0
FEATHER_RESET
Wire Wire Line
	2800 1450 3050 1450
Wire Wire Line
	1600 1450 1800 1450
Wire Wire Line
	1600 1550 1800 1550
Wire Wire Line
	1600 1750 1800 1750
Wire Wire Line
	1600 1850 1800 1850
Wire Wire Line
	1600 1950 1800 1950
Wire Wire Line
	1600 2050 1800 2050
Wire Wire Line
	2800 2450 3050 2450
Wire Wire Line
	2800 2550 3050 2550
Text Notes 10350 1950 0    50   ~ 0
TO CONNECT
Wire Notes Line
	550  550  4300 550 
Wire Notes Line
	4300 550  4300 4150
Wire Notes Line
	4300 4150 550  4150
Wire Notes Line
	550  4150 550  550 
Wire Notes Line
	6550 550  11150 550 
Wire Notes Line
	11150 550  11150 4150
Wire Notes Line
	11150 4150 6550 4150
Wire Notes Line
	6550 4150 6550 550 
Wire Notes Line
	4400 550  6450 550 
Wire Notes Line
	6450 550  6450 2400
Wire Notes Line
	6450 2400 4400 2400
Wire Notes Line
	4400 2400 4400 550 
Wire Notes Line
	4400 2500 6450 2500
Wire Notes Line
	6450 2500 6450 4150
Wire Notes Line
	6450 4150 4400 4150
Wire Notes Line
	4400 4150 4400 2500
Wire Notes Line
	4400 4250 8500 4250
Wire Notes Line
	8500 4250 8500 6400
Wire Notes Line
	8500 6400 4400 6400
Wire Notes Line
	4400 6400 4400 4250
Wire Notes Line
	550  4250 4300 4250
Wire Notes Line
	4300 4250 4300 7500
Wire Notes Line
	4300 7500 550  7500
Wire Wire Line
	6000 5800 6000 5600
Connection ~ 6000 5800
Wire Wire Line
	6000 5300 6150 5300
Wire Wire Line
	6000 5300 6000 5200
Wire Wire Line
	6000 5200 6150 5200
Connection ~ 6000 5300
Wire Wire Line
	7200 5400 7200 4700
Connection ~ 7200 5400
Wire Wire Line
	7200 4700 7050 4700
Wire Wire Line
	6150 5600 6000 5600
Connection ~ 6000 5600
Wire Wire Line
	6000 5600 6000 5300
Wire Wire Line
	6000 6200 5500 6200
Connection ~ 6000 6200
Connection ~ 5500 6200
Wire Wire Line
	5150 5550 5150 5600
Wire Wire Line
	5150 5600 6000 5600
Wire Wire Line
	5150 4900 5150 4950
Wire Wire Line
	5500 5250 5150 5250
Text Notes 10250 750  0    50   ~ 0
RASPBERRY PI ZERO
Text Notes 6050 750  0    50   ~ 0
DCDC
Text Notes 8100 4400 0    50   ~ 0
DRV8313
Text Notes 3700 4450 0    50   ~ 0
CONNECTORS
Wire Wire Line
	7250 1850 8500 1850
Text GLabel 7250 1850 0    50   Input ~ 0
FEATHER_RESET
Wire Wire Line
	3050 2350 2800 2350
Wire Wire Line
	3050 2150 2800 2150
Wire Wire Line
	3050 2250 2800 2250
Wire Wire Line
	3050 2050 2800 2050
Text Notes 3450 2400 0    50   ~ 0
SERCOM0_ALT_PAD0
Text Notes 3450 2500 0    50   ~ 0
SERCOM0_ALT_PAD1
Text Notes 10350 1750 0    50   ~ 0
RPI_SERIAL
Text Notes 2750 7350 0    50   ~ 0
ENCODER (three types supported):\n-SPI (MISO, MOSI, SCK, CN, 3V3, GND)\n- PWM (PWM, 3V3, GND)\n- INCREMENTAL (A, B, Z, 3V3, GND)
Text GLabel 1850 6850 0    50   Input ~ 0
GND
Text GLabel 1850 6750 0    50   Input ~ 0
3V3
$Comp
L cablebot_camera-rescue:MountingHole-Mechanical H6
U 1 1 613F444A
P 10400 3450
F 0 "H6" H 10500 3496 50  0000 L CNN
F 1 "MountingHole" H 10500 3405 50  0000 L CNN
F 2 "lib:MountingHole_2.7mm_M2.5_uHAT_RPi" H 10400 3450 50  0001 C CNN
F 3 "~" H 10400 3450 50  0001 C CNN
	1    10400 3450
	1    0    0    -1  
$EndComp
Wire Notes Line
	550  7500 550  4250
NoConn ~ 1800 2750
NoConn ~ 1800 2850
Text Notes 4700 4700 0    50   ~ 0
AT LEAST\n100V
Text Notes 4700 5100 0    50   ~ 0
AT LEAST\n16V
Text Notes 7200 6300 0    50   ~ 0
OUTPUT ONLY\nINTERNAL\nREGULATOR
$Comp
L cablebot_camera-rescue:Logo_Open_Hardware_Small-Graphic LOGO1
U 1 1 60ECB90D
P 9700 5400
F 0 "LOGO1" H 9700 5675 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 9700 5175 50  0001 C CNN
F 2 "Symbol:OSHW-Logo2_7.3x6mm_SilkScreen" H 9700 5400 50  0001 C CNN
F 3 "~" H 9700 5400 50  0001 C CNN
	1    9700 5400
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:fablab-logos LOGO2
U 1 1 60ECC2F8
P 10450 5400
F 0 "LOGO2" H 10636 5446 50  0000 L CNN
F 1 "fablab" H 10636 5355 50  0000 L CNN
F 2 "logos:fablab" H 10450 5400 50  0001 C CNN
F 3 "" H 10450 5400 50  0001 C CNN
	1    10450 5400
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:fablab-logos LOGO3
U 1 1 60ECC626
P 10450 5900
F 0 "LOGO3" H 10636 5946 50  0000 L CNN
F 1 "ROMI" H 10636 5855 50  0000 L CNN
F 2 "logos:ROMI_LOGO" H 10450 5900 50  0001 C CNN
F 3 "" H 10450 5900 50  0001 C CNN
	1    10450 5900
	1    0    0    -1  
$EndComp
Text GLabel 1850 6350 0    50   Input ~ 0
CN_PWM_A
Text GLabel 1850 6550 0    50   Input ~ 0
MOSI_B
Wire Wire Line
	1850 6350 2300 6350
Wire Wire Line
	1850 6450 2300 6450
Wire Wire Line
	1850 6550 2300 6550
Wire Wire Line
	1850 6650 2300 6650
Wire Wire Line
	1850 6750 2300 6750
Wire Wire Line
	1850 6850 2300 6850
Text GLabel 1600 2350 0    50   Input ~ 0
SCK_Z
$Comp
L cablebot_camera-rescue:fablab-logos LOGO4
U 1 1 60EF4B68
P 9650 5900
F 0 "LOGO4" H 9836 5946 50  0000 L CNN
F 1 "SONYLOGO" H 9836 5855 50  0000 L CNN
F 2 "logos:SONY_CSL_LOGO" H 9650 5900 50  0001 C CNN
F 3 "" H 9650 5900 50  0001 C CNN
	1    9650 5900
	1    0    0    -1  
$EndComp
$Comp
L cablebot_camera-rescue:RES-US1206FAB-fab R2
U 1 1 60F6E978
P 1000 2850
F 0 "R2" V 958 2918 45  0000 L CNN
F 1 "10kΩ" V 1042 2918 45  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" H 1030 3000 20  0001 C CNN
F 3 "" H 1000 2850 50  0001 C CNN
	1    1000 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	850  3050 1000 3050
Connection ~ 1000 3050
Wire Wire Line
	1000 3050 1800 3050
Text GLabel 850  2650 0    50   Input ~ 0
3V3
Wire Wire Line
	850  2650 1000 2650
Connection ~ 1450 3150
Wire Wire Line
	1450 3150 1800 3150
Wire Wire Line
	1000 2650 1450 2650
Connection ~ 1000 2650
Wire Wire Line
	1450 3150 1450 3100
Wire Wire Line
	1450 2650 1450 2700
$Comp
L cablebot_camera-rescue:RES-US1206FAB-fab R3
U 1 1 60FB0E24
P 1450 2900
F 0 "R3" V 1408 2968 45  0000 L CNN
F 1 "10kΩ" V 1492 2968 45  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" H 1480 3050 20  0001 C CNN
F 3 "" H 1450 2900 50  0001 C CNN
	1    1450 2900
	0    1    1    0   
$EndComp
$Comp
L cablebot_camera-rescue:RES-US1206FAB-fab R1
U 1 1 60EEDD3D
P 7850 5400
F 0 "R1" V 7808 5468 45  0000 L CNN
F 1 "10kΩ" V 7892 5468 45  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" H 7880 5550 20  0001 C CNN
F 3 "" H 7850 5400 50  0001 C CNN
	1    7850 5400
	0    -1   -1   0   
$EndComp
NoConn ~ 7050 6000
Text GLabel 7950 5200 2    50   Input ~ 0
3V3
Wire Wire Line
	7950 5200 7850 5200
Text GLabel 7900 5700 2    50   Input ~ 0
FAULT
Wire Wire Line
	7900 5700 7850 5700
Wire Wire Line
	7850 5700 7050 5700
Connection ~ 7850 5700
Wire Wire Line
	7850 5700 7850 5600
Text GLabel 1600 1650 0    50   Input ~ 0
FAULT
Wire Wire Line
	1800 1650 1600 1650
NoConn ~ 5550 3050
$EndSCHEMATC
