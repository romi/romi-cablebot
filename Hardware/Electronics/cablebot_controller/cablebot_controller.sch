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
L MCU_Module:Adafruit_Feather_M0_Basic_Proto A1
U 1 1 60BDA368
P 3200 2100
AR Path="/60BDA368" Ref="A1"  Part="1" 
AR Path="/60BD7704/60BDA368" Ref="A1"  Part="1" 
F 0 "A1" H 3200 711 50  0000 C CNN
F 1 "Adafruit_Feather_M0_Basic_Proto" H 2400 650 50  0000 C CNN
F 2 "Module:Adafruit_Feather" H 2400 550 50  0000 C CNN
F 3 "https://cdn-learn.adafruit.com/downloads/pdf/adafruit-feather-m0-basic-proto.pdf" H 3200 900 50  0001 C CNN
	1    3200 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x09_Female JN1
U 1 1 60BDA36E
P 6150 2300
AR Path="/60BDA36E" Ref="JN1"  Part="1" 
AR Path="/60BD7704/60BDA36E" Ref="JN1"  Part="1" 
F 0 "JN1" H 5900 2950 50  0000 L CNN
F 1 "ACCEL" H 5900 2850 50  0000 L CNN
F 2 "fab:Adafruit-LSM6DSOX-PCB" H 6150 2300 50  0001 C CNN
F 3 "~" H 6150 2300 50  0001 C CNN
	1    6150 2300
	1    0    0    -1  
$EndComp
Text GLabel 2950 3750 0    50   Input ~ 0
GND
Wire Wire Line
	2100 2600 2700 2600
Wire Wire Line
	2700 2700 2100 2700
Text GLabel 2100 2700 0    50   Input ~ 0
TX1
Text GLabel 2100 2600 0    50   Input ~ 0
RX1
Wire Wire Line
	2950 3750 3200 3750
Wire Wire Line
	3200 3750 3200 3400
Text GLabel 2100 1300 0    50   Input ~ 0
LED_DIN
Wire Wire Line
	2100 1300 2700 1300
Text GLabel 2100 1400 0    50   Input ~ 0
ENDSTOP_FRONT
Text GLabel 2100 1500 0    50   Input ~ 0
ENDSTOP_BACK
Wire Wire Line
	2100 1400 2700 1400
Wire Wire Line
	2100 1500 2700 1500
Text GLabel 2100 1600 0    50   Input ~ 0
TX0
Text GLabel 2100 1800 0    50   Input ~ 0
RX0
Wire Wire Line
	2100 1600 2700 1600
Wire Wire Line
	2100 1700 2700 1700
Wire Wire Line
	2100 1800 2700 1800
Text GLabel 2100 1700 0    50   Input ~ 0
RC_STR
Text GLabel 2100 1900 0    50   Input ~ 0
RC_THROTTLE
Wire Wire Line
	2100 1900 2700 1900
Text GLabel 4000 2000 2    50   Input ~ 0
ODRIVE_RST
Wire Wire Line
	4000 2000 3700 2000
Text GLabel 4000 2100 2    50   Input ~ 0
USER_BUTTON
Wire Wire Line
	4000 2100 3700 2100
Text GLabel 4000 2200 2    50   Input ~ 0
CHG_ST_HOME
Wire Wire Line
	4000 2200 3700 2200
Text GLabel 4000 2300 2    50   Input ~ 0
ADNS_MOT
Text GLabel 4000 2400 2    50   Input ~ 0
ADNS_SS
Text GLabel 2100 2900 0    50   Input ~ 0
SDA
Wire Wire Line
	2100 2900 2700 2900
Text GLabel 2100 3000 0    50   Input ~ 0
SCL
Wire Wire Line
	2100 3000 2700 3000
Text GLabel 2050 2200 0    50   Input ~ 0
SCK
Text GLabel 2050 2300 0    50   Input ~ 0
MOSI
Text GLabel 2050 2400 0    50   Input ~ 0
MISO
Text GLabel 4000 1300 2    50   Input ~ 0
RST_BUTTON
Wire Wire Line
	3700 1300 4000 1300
Wire Wire Line
	2050 2200 2700 2200
Wire Wire Line
	2050 2400 2700 2400
Text GLabel 3150 650  0    50   Input ~ 0
3V3
Wire Wire Line
	3150 650  3300 650 
Wire Wire Line
	3300 650  3300 900 
Wire Wire Line
	3700 2300 4000 2300
Wire Wire Line
	3700 2400 4000 2400
Text GLabel 5700 1900 0    50   Input ~ 0
3V3
Wire Wire Line
	5700 1900 5950 1900
Text GLabel 5700 2100 0    50   Input ~ 0
GND
Text GLabel 5700 2300 0    50   Input ~ 0
SDA
Text GLabel 5700 2200 0    50   Input ~ 0
SCL
Wire Wire Line
	5700 2100 5950 2100
Wire Wire Line
	5700 2200 5950 2200
Wire Wire Line
	5700 2300 5950 2300
Text GLabel 8350 2350 0    50   Input ~ 0
USER_BUTTON
Wire Wire Line
	8350 2350 8550 2350
Text GLabel 8350 1650 0    50   Input ~ 0
3V3
$Comp
L fab:RES-US1206 R1
U 1 1 60BDD59B
P 8550 2000
AR Path="/60BDD59B" Ref="R1"  Part="1" 
AR Path="/60BD7704/60BDD59B" Ref="R1"  Part="1" 
F 0 "R1" V 8508 2068 45  0000 L CNN
F 1 "1kΩ" V 8592 2068 45  0000 L CNN
F 2 "fab:fab-R1206FAB" H 8580 2150 20  0001 C CNN
F 3 "" H 8550 2000 50  0001 C CNN
	1    8550 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 1650 8550 1650
Wire Wire Line
	8550 1650 8550 1800
Wire Wire Line
	8550 2200 8550 2350
Connection ~ 8550 2350
Text GLabel 9600 2350 2    50   Input ~ 0
GND
Wire Wire Line
	9600 2350 9200 2350
Text GLabel 8350 2950 0    50   Input ~ 0
RST_BUTTON
Text GLabel 9550 2950 2    50   Input ~ 0
GND
Wire Wire Line
	8350 2950 8800 2950
Wire Wire Line
	9200 2950 9550 2950
$Comp
L Switch:SW_SPST SW1
U 1 1 60BDD5AD
P 9000 2350
AR Path="/60BDD5AD" Ref="SW1"  Part="1" 
AR Path="/60BD7704/60BDD5AD" Ref="SW2"  Part="1" 
F 0 "SW1" H 9000 2585 50  0000 C CNN
F 1 "SW_SPST" H 9000 2494 50  0000 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx83-2LFS" H 9000 2350 50  0001 C CNN
F 3 "https://www.mouser.es/datasheet/2/60/pts645-965362.pdf" H 9000 2350 50  0001 C CNN
F 4 "611-PTS645VH832 " H 9000 2350 50  0001 C CNN "Mouser Ref"
F 5 "PTS645VH832 " H 9000 2350 50  0001 C CNN "Manufacturer Ref"
F 6 "https://www.mouser.es/ProductDetail/CK/PTS645VH832LFS?qs=%2Fha2pyFadug0Azfe8RMwGazjOID5WjvH4hiiBXRd5MKGeqlXpWkB5g%3D%3D" H 9000 2350 50  0001 C CNN "Mouser link"
	1    9000 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2350 8800 2350
$Comp
L Switch:SW_SPST SW2
U 1 1 60BDD5B6
P 9000 2950
AR Path="/60BDD5B6" Ref="SW2"  Part="1" 
AR Path="/60BD7704/60BDD5B6" Ref="SW3"  Part="1" 
F 0 "SW2" H 9000 3185 50  0000 C CNN
F 1 "SW_SPST" H 9000 3094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx58-2LFS" H 9000 2950 50  0001 C CNN
F 3 "https://www.mouser.es/datasheet/2/60/pts645-965362.pdf" H 9000 2950 50  0001 C CNN
F 4 "611-PTS645VH582 " H 9000 2950 50  0001 C CNN "Mouser Ref"
F 5 "PTS645VH582 " H 9000 2950 50  0001 C CNN "Manufacturer Ref"
F 6 "https://www.mouser.es/ProductDetail/CK/PTS645VH58-2-LFS?qs=%2Fha2pyFadug0Azfe8RMwGahwjupVr0%2FiBhp2AnDZujzvtBAgWib0DQ%3D%3D" H 9000 2950 50  0001 C CNN "Mouser link"
	1    9000 2950
	1    0    0    -1  
$EndComp
Text Notes 8600 1400 0    50   ~ 0
USER INTERFACE
Text GLabel 3850 5400 0    50   Input ~ 0
LED_DIN
Wire Wire Line
	3850 5400 4000 5400
Text GLabel 4200 5900 0    50   Input ~ 0
GND
Wire Wire Line
	4200 5900 4300 5900
Wire Wire Line
	4300 5900 4300 5700
Text GLabel 6100 4900 2    50   Input ~ 0
3V3
Wire Wire Line
	6100 4900 5950 4900
Wire Wire Line
	4300 4900 4300 5100
$Comp
L LED:WS2812B D1
U 1 1 60BE121B
P 4300 5400
AR Path="/60BE121B" Ref="D1"  Part="1" 
AR Path="/60BD7704/60BE121B" Ref="D1"  Part="1" 
F 0 "D1" H 4644 5446 50  0000 L CNN
F 1 "WS2812B" H 4644 5355 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4350 5100 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 4400 5025 50  0001 L TNN
F 4 " 474-COM-16346 " H 4300 5400 50  0001 C CNN "Mouser Ref"
F 5 " COM-16346" H 4300 5400 50  0001 C CNN "Manufacturer Ref"
F 6 "https://www.mouser.es/ProductDetail/SparkFun/COM-16346?qs=%2Fha2pyFadugg0pE4GaSNief8VTwhFMAGiXIxARqTxvGAKgbaUKOJXg%3D%3D" H 4300 5400 50  0001 C CNN "Mouser link"
	1    4300 5400
	1    0    0    -1  
$EndComp
Text Notes 4200 4700 0    50   ~ 0
LED
Wire Notes Line
	6950 6150 10700 6150
Wire Notes Line
	10700 6150 10700 3500
Wire Notes Line
	10700 3500 6950 3500
Text Notes 8350 3700 0    50   ~ 0
DATA CONNECTORS\n20-24AWG - 0.511mm - 0.205mm2
Wire Notes Line
	6950 3500 6950 6150
Text GLabel 7700 4050 0    50   Input ~ 0
ODRIVE_RST
Text GLabel 7700 4250 0    50   Input ~ 0
RX1
Text GLabel 7700 4150 0    50   Input ~ 0
TX1
Wire Wire Line
	7700 3850 8000 3850
Wire Wire Line
	7700 3950 8000 3950
Wire Notes Line
	10700 3200 10700 1200
Wire Notes Line
	10700 1200 6950 1200
Wire Notes Line
	10700 3200 6950 3200
Wire Notes Line
	6950 3200 6950 1200
Text GLabel 7700 4550 0    50   Input ~ 0
RC_STR
Text GLabel 7700 4650 0    50   Input ~ 0
RC_THROTTLE
Text GLabel 7700 4350 0    50   Input ~ 0
CHG_ST_HOME
Text GLabel 9200 5450 0    50   Input ~ 0
ENDSTOP_FRONT
Text GLabel 7700 4850 0    50   Input ~ 0
ENDSTOP_BACK
Text GLabel 9200 5850 0    50   Input ~ 0
MISO
Text GLabel 9200 5750 0    50   Input ~ 0
MOSI
Text GLabel 9200 5650 0    50   Input ~ 0
SCK
Text GLabel 9200 5250 0    50   Input ~ 0
ADNS_SS
Text GLabel 9200 5150 0    50   Input ~ 0
ADNS_MOT
Wire Wire Line
	9200 5150 9500 5150
Wire Wire Line
	9200 5550 9500 5550
Wire Wire Line
	9200 5650 9500 5650
Wire Wire Line
	9200 5750 9500 5750
Wire Wire Line
	9200 5450 9500 5450
Text GLabel 9200 5050 0    50   Input ~ 0
3V3
Text GLabel 9200 5550 0    50   Input ~ 0
GND
Wire Wire Line
	9200 5050 9500 5050
Text GLabel 9200 5950 0    50   Input ~ 0
GND
Wire Wire Line
	9200 5850 9500 5850
Wire Wire Line
	9200 5950 9500 5950
$Comp
L Connector:Screw_Terminal_01x06 J3
U 1 1 60C869F4
P 8200 4050
F 0 "J3" H 8280 4042 50  0000 L CNN
F 1 "Screw_Terminal_01x06" H 8280 3951 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-6-2.54_1x06_P2.54mm_Horizontal" H 8200 4050 50  0001 C CNN
F 3 "~" H 8200 4050 50  0001 C CNN
F 4 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1725698?qs=%2Fha2pyFaduhb864E3xGbPRiDKPcyQngayeej%2FHpjvDk%3D" H 8200 4050 50  0001 C CNN "Mouser link"
F 5 "1725698" H 8200 4050 50  0001 C CNN "Manufacturer Ref"
F 6 " 651-1725698" H 8200 4050 50  0001 C CNN "Mouser Ref"
	1    8200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4150 8000 4150
Wire Wire Line
	7700 4250 8000 4250
Wire Wire Line
	7700 4350 8000 4350
Wire Wire Line
	7700 4450 8000 4450
Wire Wire Line
	7700 4550 8000 4550
Wire Wire Line
	7700 4750 8000 4750
Wire Wire Line
	7700 4050 8000 4050
Wire Wire Line
	7700 4650 8000 4650
Wire Wire Line
	7700 4850 8000 4850
Wire Wire Line
	9200 5250 9500 5250
$Comp
L Connector:Screw_Terminal_01x06 J2
U 1 1 60CB0AA0
P 8200 4650
F 0 "J2" H 8280 4642 50  0000 L CNN
F 1 "Screw_Terminal_01x06" H 8280 4551 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-6-2.54_1x06_P2.54mm_Horizontal" H 8200 4650 50  0001 C CNN
F 3 "~" H 8200 4650 50  0001 C CNN
F 4 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1725698?qs=%2Fha2pyFaduhb864E3xGbPRiDKPcyQngayeej%2FHpjvDk%3D" H 8200 4650 50  0001 C CNN "Mouser link"
F 5 "1725698" H 8200 4650 50  0001 C CNN "Manufacturer Ref"
F 6 " 651-1725698" H 8200 4650 50  0001 C CNN "Mouser Ref"
	1    8200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4950 8000 4950
$Comp
L Connector:Screw_Terminal_01x05 J5
U 1 1 60CE4860
P 9700 5750
F 0 "J5" H 9780 5792 50  0000 L CNN
F 1 "Screw_Terminal_01x05" H 9780 5701 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-5-2.54_1x05_P2.54mm_Horizontal" H 9700 5750 50  0001 C CNN
F 3 "~" H 9700 5750 50  0001 C CNN
F 4 "1725685" H 9700 5750 50  0001 C CNN "Manufacturer Ref"
F 5 " 651-1725685" H 9700 5750 50  0001 C CNN "Mouser Ref"
F 6 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1725685?qs=A%2FKWGUWTCZiuYWt6zAMYZA%3D%3D" H 9700 5750 50  0001 C CNN "Mouser link"
	1    9700 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x05 J4
U 1 1 60CE5712
P 9700 5250
F 0 "J4" H 9780 5292 50  0000 L CNN
F 1 "Screw_Terminal_01x05" H 9780 5201 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-5-2.54_1x05_P2.54mm_Horizontal" H 9700 5250 50  0001 C CNN
F 3 "~" H 9700 5250 50  0001 C CNN
F 4 "1725685" H 9700 5250 50  0001 C CNN "Manufacturer Ref"
F 5 " 651-1725685" H 9700 5250 50  0001 C CNN "Mouser Ref"
F 6 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1725685?qs=A%2FKWGUWTCZiuYWt6zAMYZA%3D%3D" H 9700 5250 50  0001 C CNN "Mouser link"
	1    9700 5250
	1    0    0    -1  
$EndComp
NoConn ~ 3100 900 
Text GLabel 7700 4950 0    50   Input ~ 0
GND
Text GLabel 7700 4750 0    50   Input ~ 0
GND
Wire Wire Line
	2050 2300 2700 2300
Text GLabel 9200 5350 0    50   Input ~ 0
GND
Wire Wire Line
	9200 5350 9500 5350
NoConn ~ 3700 1600
NoConn ~ 3700 1700
NoConn ~ 5950 2400
NoConn ~ 5950 2500
NoConn ~ 5950 2600
NoConn ~ 5950 2700
$Comp
L logos:fablab U1
U 1 1 60E65C9F
P 1500 6750
F 0 "U1" H 1686 6796 50  0000 L CNN
F 1 "fablab" H 1686 6705 50  0000 L CNN
F 2 "logos:fablab" H 1500 6750 50  0001 C CNN
F 3 "" H 1500 6750 50  0001 C CNN
	1    1500 6750
	1    0    0    -1  
$EndComp
$Comp
L logos:fablab U2
U 1 1 60E6659B
P 2450 6750
F 0 "U2" H 2636 6796 50  0000 L CNN
F 1 "romi" H 2636 6705 50  0000 L CNN
F 2 "logos:ROMI_LOGO" H 2450 6750 50  0001 C CNN
F 3 "" H 2450 6750 50  0001 C CNN
	1    2450 6750
	1    0    0    -1  
$EndComp
$Comp
L Graphic:Logo_Open_Hardware_Small OSH1
U 1 1 60E671E8
P 3300 6750
F 0 "OSH1" H 3300 7025 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 3300 6525 50  0001 C CNN
F 2 "Symbol:OSHW-Logo2_9.8x8mm_SilkScreen" H 3300 6750 50  0001 C CNN
F 3 "~" H 3300 6750 50  0001 C CNN
	1    3300 6750
	1    0    0    -1  
$EndComp
Text GLabel 3450 650  2    50   Input ~ 0
5V
Wire Wire Line
	3450 650  3400 650 
Wire Wire Line
	3400 650  3400 900 
Text GLabel 7700 4450 0    50   Input ~ 0
5V
$Comp
L LED:WS2812B D2
U 1 1 60E00885
P 5150 5400
AR Path="/60E00885" Ref="D2"  Part="1" 
AR Path="/60BD7704/60E00885" Ref="D?"  Part="1" 
F 0 "D2" H 5494 5446 50  0000 L CNN
F 1 "WS2812B" H 5494 5355 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5200 5100 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5250 5025 50  0001 L TNN
F 4 " 474-COM-16346 " H 5150 5400 50  0001 C CNN "Mouser Ref"
F 5 " COM-16346" H 5150 5400 50  0001 C CNN "Manufacturer Ref"
F 6 "https://www.mouser.es/ProductDetail/SparkFun/COM-16346?qs=%2Fha2pyFadugg0pE4GaSNief8VTwhFMAGiXIxARqTxvGAKgbaUKOJXg%3D%3D" H 5150 5400 50  0001 C CNN "Mouser link"
	1    5150 5400
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D3
U 1 1 60E00C2A
P 5950 5400
AR Path="/60E00C2A" Ref="D3"  Part="1" 
AR Path="/60BD7704/60E00C2A" Ref="D?"  Part="1" 
F 0 "D3" H 6294 5446 50  0000 L CNN
F 1 "WS2812B" H 6294 5355 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6000 5100 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6050 5025 50  0001 L TNN
F 4 " 474-COM-16346 " H 5950 5400 50  0001 C CNN "Mouser Ref"
F 5 " COM-16346" H 5950 5400 50  0001 C CNN "Manufacturer Ref"
F 6 "https://www.mouser.es/ProductDetail/SparkFun/COM-16346?qs=%2Fha2pyFadugg0pE4GaSNief8VTwhFMAGiXIxARqTxvGAKgbaUKOJXg%3D%3D" H 5950 5400 50  0001 C CNN "Mouser link"
	1    5950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5400 4850 5400
Wire Wire Line
	5450 5400 5650 5400
Wire Wire Line
	4300 5900 5150 5900
Wire Wire Line
	5150 5900 5150 5700
Connection ~ 4300 5900
Wire Wire Line
	5150 5900 5950 5900
Wire Wire Line
	5950 5900 5950 5700
Connection ~ 5150 5900
Wire Wire Line
	5950 5100 5950 4900
Connection ~ 5950 4900
Wire Wire Line
	5950 4900 5150 4900
Wire Wire Line
	5150 5100 5150 4900
Connection ~ 5150 4900
Wire Wire Line
	5150 4900 4300 4900
NoConn ~ 6250 5400
Wire Notes Line
	3100 4550 6800 4550
Wire Notes Line
	6800 4550 6800 6150
Wire Notes Line
	6800 6150 3100 6150
Wire Notes Line
	3100 6150 3100 4550
Text GLabel 7700 3950 0    50   Input ~ 0
RX0
Text GLabel 7700 3850 0    50   Input ~ 0
TX0
Text Notes 1200 2700 0    50   ~ 0
ODRIVE_CONTROL
Wire Notes Line
	1850 1600 1600 1600
Wire Notes Line
	1600 1600 1600 1800
Wire Notes Line
	1600 1800 1850 1800
Text Notes 1150 1700 0    50   ~ 0
RPI_COM
Wire Notes Line
	1600 1700 1500 1700
NoConn ~ 5950 2000
$EndSCHEMATC
