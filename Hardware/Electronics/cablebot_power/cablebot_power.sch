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
L Converter_DCDC:OKI-78SR-5_1.5-W36-C U1
U 1 1 60BE57F6
P 8450 1850
AR Path="/60BE57F6" Ref="U1"  Part="1" 
AR Path="/60BD7441/60BE57F6" Ref="U1"  Part="1" 
F 0 "U1" H 8450 2092 50  0000 C CNN
F 1 "OKI-78SR-5_1.5-W36-C" H 8450 2001 50  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_Murata_OKI-78SR_Horizontal" H 8500 1600 50  0001 L CIN
F 3 "https://power.murata.com/data/power/oki-78sr.pdf" H 8450 1850 50  0001 C CNN
F 4 "OK78SR5/1.5W36EC " H 8450 1850 50  0001 C CNN "Manufacturer Ref"
F 5 "https://www.mouser.es/ProductDetail/Murata-Power-Solutions/OKI-78SR-5-15-W36E-C?qs=%2Fha2pyFaduiK3DdfaDQW71rjlssm%252BxqEL9TkmJzo7kpMUFWkNTsnk1tOQ0mL2EnW" H 8450 1850 50  0001 C CNN "Mouser Link"
F 6 " 580-OK78SR5/1.5W36EC " H 8450 1850 50  0001 C CNN "Mouser Ref"
	1    8450 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 60BE57FC
P 1900 2350
AR Path="/60BE57FC" Ref="J2"  Part="1" 
AR Path="/60BD7441/60BE57FC" Ref="J2"  Part="1" 
F 0 "J2" H 1980 2342 50  0000 L CNN
F 1 "POWER_ODRIVE" H 1980 2251 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 1900 2350 50  0001 C CNN
F 3 "~" H 1900 2350 50  0001 C CNN
F 4 "30.602/BLU" H 1900 2350 50  0001 C CNN "Manufacturer Ref"
F 5 "https://www.mouser.es/ProductDetail/Altech/30602-BLUE?qs=%2Fha2pyFaduheMucPzDmf24sQSlM3tFCOuX2Wv2GtnWg%3D" H 1900 2350 50  0001 C CNN "Mouser Link"
F 6 "845-30.602/BLU" H 1900 2350 50  0001 C CNN "Mouser Ref"
	1    1900 2350
	1    0    0    -1  
$EndComp
Text Notes 1200 1550 0    50   ~ 0
BATTERY CONNECTOR\n12AWG - 2mm - 3,31mm2
Text Notes 1150 2250 0    50   ~ 0
OUTPUT ODRIVE\n15AWG - 1,5mm - 1,31mm2
Text GLabel 8350 2450 0    50   Input ~ 0
GND
Text GLabel 1400 2450 0    50   Input ~ 0
GND
Wire Wire Line
	8350 2450 8450 2450
Wire Wire Line
	8450 2450 8450 2150
Text GLabel 9600 1850 2    50   Input ~ 0
VOUT
Wire Wire Line
	7050 1850 7100 1850
Text GLabel 6550 1950 0    50   Input ~ 0
VBATT
Wire Wire Line
	6550 1950 6650 1950
NoConn ~ 6650 1750
Text GLabel 7400 2100 0    50   Input ~ 0
VIN
Wire Wire Line
	7400 2100 7650 2100
Wire Wire Line
	7650 2100 7650 1850
Connection ~ 7650 1850
Wire Wire Line
	7650 1850 8150 1850
Wire Wire Line
	1400 1750 1700 1750
Wire Wire Line
	1400 1650 1700 1650
Text GLabel 1400 1750 0    50   Input ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 60BE5815
P 1900 1650
AR Path="/60BE5815" Ref="J1"  Part="1" 
AR Path="/60BD7441/60BE5815" Ref="J1"  Part="1" 
F 0 "J1" H 1980 1642 50  0000 L CNN
F 1 "BATTERY" H 1980 1551 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 1900 1650 50  0001 C CNN
F 3 "~" H 1900 1650 50  0001 C CNN
F 4 "30.602/BLU" H 1900 1650 50  0001 C CNN "Manufacturer Ref"
F 5 "https://www.mouser.es/ProductDetail/Altech/30602-BLUE?qs=%2Fha2pyFaduheMucPzDmf24sQSlM3tFCOuX2Wv2GtnWg%3D" H 1900 1650 50  0001 C CNN "Mouser Link"
F 6 "845-30.602/BLU" H 1900 1650 50  0001 C CNN "Mouser Ref"
	1    1900 1650
	1    0    0    -1  
$EndComp
Text GLabel 1400 2350 0    50   Input ~ 0
VIN
Wire Wire Line
	1400 2350 1700 2350
Wire Wire Line
	1400 2450 1700 2450
Text GLabel 1400 3000 0    50   Input ~ 0
VIN
Wire Wire Line
	1400 3000 1700 3000
Wire Wire Line
	8750 1850 9100 1850
$Comp
L Switch:SW_SPDT SW1
U 1 1 60BE5824
P 6850 1850
AR Path="/60BE5824" Ref="SW1"  Part="1" 
AR Path="/60BD7441/60BE5824" Ref="SW1"  Part="1" 
F 0 "SW1" H 6850 2135 50  0000 C CNN
F 1 "SW_SPDT" H 6850 2044 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 6850 1850 50  0001 C CNN
F 3 "~" H 6850 1850 50  0001 C CNN
F 4 "" H 6850 1850 50  0001 C CNN "Mouser Ref"
F 5 "" H 6850 1850 50  0001 C CNN "Manufacturer Ref"
	1    6850 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1400 3100 1700 3100
Text GLabel 1400 3100 0    50   Input ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 60BE582C
P 1900 3000
AR Path="/60BE582C" Ref="J3"  Part="1" 
AR Path="/60BD7441/60BE582C" Ref="J3"  Part="1" 
F 0 "J3" H 1980 2992 50  0000 L CNN
F 1 "CHARGING_STATION" H 1980 2901 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 1900 3000 50  0001 C CNN
F 3 "~" H 1900 3000 50  0001 C CNN
F 4 "30.602/BLU" H 1900 3000 50  0001 C CNN "Manufacturer Ref"
F 5 "https://www.mouser.es/ProductDetail/Altech/30602-BLUE?qs=%2Fha2pyFaduheMucPzDmf24sQSlM3tFCOuX2Wv2GtnWg%3D" H 1900 3000 50  0001 C CNN "Mouser Link"
F 6 "845-30.602/BLU" H 1900 3000 50  0001 C CNN "Mouser Ref"
	1    1900 3000
	1    0    0    -1  
$EndComp
Text GLabel 1400 1650 0    50   Input ~ 0
VBATT
Text Notes 1250 850  0    50   ~ 0
POWER CONNECTORS \nALTECH AK300 - 22-12AWG
Text GLabel 3900 1700 0    50   Input ~ 0
VOUT
Wire Wire Line
	3900 1700 4200 1700
Text Notes 3600 1550 0    50   ~ 0
FEATHER\n24AWG - 1,5mm - 1,31mm2
Wire Wire Line
	3900 1800 4200 1800
Text GLabel 3900 1800 0    50   Input ~ 0
GND
$Comp
L fab:RES-US1206 R1
U 1 1 60BAE5CD
P 9500 2150
F 0 "R1" V 9458 2218 45  0000 L CNN
F 1 "1kΩ" V 9542 2218 45  0000 L CNN
F 2 "fab:fab-R1206FAB" H 9530 2300 20  0001 C CNN
F 3 "" H 9500 2150 50  0001 C CNN
F 4 "" H 9500 2150 50  0001 C CNN "Manufacturer Ref"
F 5 "" H 9500 2150 50  0001 C CNN "Mouser Link"
F 6 "" H 9500 2150 50  0001 C CNN "Mouser Ref"
	1    9500 2150
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 60BACED4
P 9100 2100
F 0 "D1" V 9150 2250 50  0000 R CNN
F 1 "RED" V 9050 2300 50  0000 R CNN
F 2 "fab:fab-LED1206FAB" H 9100 2100 50  0001 C CNN
F 3 "" H 9100 2100 50  0001 C CNN
F 4 "" H 9100 2100 50  0001 C CNN "Manufacturer Ref"
F 5 "" H 9100 2100 50  0001 C CNN "Mouser Link"
F 6 "" H 9100 2100 50  0001 C CNN "Mouser Ref"
	1    9100 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 60BB6BBA
P 7350 1850
F 0 "F1" V 7153 1850 50  0000 C CNN
F 1 "Fuse" V 7244 1850 50  0000 C CNN
F 2 "Fuse:Fuseholder_Littelfuse_Nano2_154x" V 7280 1850 50  0001 C CNN
F 3 "~" H 7350 1850 50  0001 C CNN
	1    7350 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 1850 7650 1850
Wire Wire Line
	3950 2400 4250 2400
Text Notes 3650 2300 0    50   ~ 0
RC\n24AWG - 1,5mm - 1,31mm2
Wire Wire Line
	3950 2500 4250 2500
Text GLabel 3950 2500 0    50   Input ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 60C01550
P 4450 2400
AR Path="/60C01550" Ref="J5"  Part="1" 
AR Path="/60BD7441/60C01550" Ref="J?"  Part="1" 
F 0 "J5" H 4530 2392 50  0000 L CNN
F 1 "OUTPUT" H 4530 2301 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 4450 2400 50  0001 C CNN
F 3 "~" H 4450 2400 50  0001 C CNN
F 4 "1985807" H 4450 2400 50  0001 C CNN "Manufacturer Ref"
F 5 " 651-1985807" H 4450 2400 50  0001 C CNN "Mouser Ref"
F 6 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1985807?qs=YbgdthCBnKfnTSCcIEjWsg%3D%3D" H 4450 2400 50  0001 C CNN "Mouser Link"
	1    4450 2400
	1    0    0    -1  
$EndComp
Text Notes 1200 2900 0    50   ~ 0
CHARGING STATION\n15AWG - 1,5mm - 1,31mm2
Wire Wire Line
	9100 1950 9100 1850
Connection ~ 9100 1850
Wire Wire Line
	9100 1850 9600 1850
Wire Wire Line
	9100 2250 9100 2350
Wire Wire Line
	9100 2350 9300 2350
Wire Wire Line
	9300 2350 9300 1900
Wire Wire Line
	9300 1900 9500 1900
Wire Wire Line
	8450 2450 9500 2450
Wire Wire Line
	9500 2450 9500 2350
Connection ~ 8450 2450
Wire Notes Line
	600  600  2950 600 
Wire Notes Line
	2950 600  2950 4300
Wire Notes Line
	2950 4300 600  4300
Wire Notes Line
	600  4300 600  600 
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 60C1D3C6
P 4400 1700
AR Path="/60C1D3C6" Ref="J4"  Part="1" 
AR Path="/60BD7441/60C1D3C6" Ref="J?"  Part="1" 
F 0 "J4" H 4480 1692 50  0000 L CNN
F 1 "OUTPUT" H 4480 1601 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 4400 1700 50  0001 C CNN
F 3 "~" H 4400 1700 50  0001 C CNN
F 4 "1985807" H 4400 1700 50  0001 C CNN "Manufacturer Ref"
F 5 " 651-1985807" H 4400 1700 50  0001 C CNN "Mouser Ref"
F 6 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1985807?qs=YbgdthCBnKfnTSCcIEjWsg%3D%3D" H 4400 1700 50  0001 C CNN "Mouser Link"
	1    4400 1700
	1    0    0    -1  
$EndComp
Text Notes 3650 850  0    50   ~ 0
LOGIC POWER CONNECTORS \nALTECH AK300 - 26-16AWG 
Wire Notes Line
	5400 600  5400 3600
Wire Notes Line
	5400 3600 3050 3600
Wire Notes Line
	3050 3600 3050 600 
Wire Notes Line
	3050 600  5400 600 
Text GLabel 3950 2400 0    50   Input ~ 0
VOUT
Wire Wire Line
	9500 1900 9500 1950
$Comp
L Device:Fuse F2
U 1 1 60D9F0B9
P 7350 1500
F 0 "F2" V 7153 1500 50  0000 C CNN
F 1 "Fuse" V 7244 1500 50  0000 C CNN
F 2 "fab:GENERIC_4010_10228" V 7280 1500 50  0001 C CNN
F 3 "~" H 7350 1500 50  0001 C CNN
	1    7350 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 1500 7100 1500
Wire Wire Line
	7100 1500 7100 1850
Connection ~ 7100 1850
Wire Wire Line
	7100 1850 7200 1850
Wire Wire Line
	7500 1500 7650 1500
Wire Wire Line
	7650 1500 7650 1850
Text GLabel 1400 3650 0    50   Input ~ 0
VIN
Wire Wire Line
	1400 3650 1700 3650
Wire Wire Line
	1400 3750 1700 3750
Text GLabel 1400 3750 0    50   Input ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 60DC4B80
P 1900 3650
AR Path="/60DC4B80" Ref="J6"  Part="1" 
AR Path="/60BD7441/60DC4B80" Ref="J?"  Part="1" 
F 0 "J6" H 1980 3642 50  0000 L CNN
F 1 "CAMERA MODULE" H 1980 3551 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 1900 3650 50  0001 C CNN
F 3 "~" H 1900 3650 50  0001 C CNN
F 4 "1985807 " H 1900 3650 50  0001 C CNN "Manufacturer Ref"
F 5 "https://www.mouser.es/ProductDetail/Phoenix-Contact/1985807?qs=YbgdthCBnKfnTSCcIEjWsg%3D%3D" H 1900 3650 50  0001 C CNN "Mouser Link"
F 6 " 651-1985807 " H 1900 3650 50  0001 C CNN "Mouser Ref"
	1    1900 3650
	1    0    0    -1  
$EndComp
Text Notes 1200 3550 0    50   ~ 0
CAMERA MODULE
$Comp
L Graphic:Logo_Open_Hardware_Small OSH1
U 1 1 60DB42E4
P 6050 4500
F 0 "OSH1" H 6050 4775 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 6050 4275 50  0001 C CNN
F 2 "Symbol:OSHW-Logo2_7.3x6mm_SilkScreen" H 6050 4500 50  0001 C CNN
F 3 "~" H 6050 4500 50  0001 C CNN
	1    6050 4500
	1    0    0    -1  
$EndComp
$Comp
L logos:fablab U2
U 1 1 60DB49D7
P 6800 4500
F 0 "U2" H 6986 4546 50  0000 L CNN
F 1 "fablab" H 6986 4455 50  0000 L CNN
F 2 "logos:fablab" H 6800 4500 50  0001 C CNN
F 3 "" H 6800 4500 50  0001 C CNN
	1    6800 4500
	1    0    0    -1  
$EndComp
$Comp
L logos:fablab U3
U 1 1 60DB5004
P 7600 4500
F 0 "U3" H 7786 4546 50  0000 L CNN
F 1 "fablab" H 7786 4455 50  0000 L CNN
F 2 "logos:ROMI_LOGO" H 7600 4500 50  0001 C CNN
F 3 "" H 7600 4500 50  0001 C CNN
	1    7600 4500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 610F4909
P 850 4600
F 0 "H1" H 950 4646 50  0000 L CNN
F 1 "MountingHole" H 950 4555 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 850 4600 50  0001 C CNN
F 3 "~" H 850 4600 50  0001 C CNN
	1    850  4600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 610F4B9C
P 850 4850
F 0 "H2" H 950 4896 50  0000 L CNN
F 1 "MountingHole" H 950 4805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 850 4850 50  0001 C CNN
F 3 "~" H 850 4850 50  0001 C CNN
	1    850  4850
	1    0    0    -1  
$EndComp
Wire Notes Line
	10800 3600 5550 3600
Wire Notes Line
	5550 3600 5550 600 
Wire Notes Line
	5550 600  10800 600 
Wire Notes Line
	10800 600  10800 3600
Text Notes 8100 800  0    50   ~ 0
POWER
$EndSCHEMATC
