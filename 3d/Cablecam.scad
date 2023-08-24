include <units.scad>
include <screws.scad>
include <extrusion.scad>
use <Charger.scad>

kDrawingsFile = "Cablecam.dxf";

kHeightBLDC = 20;
kHeightHeader1 = 7.1;
kHeightPCB = 1.5;
kHeightSpaceBldcToRPi = 8.5 + 2.5;
kHeightSpacersRPiToBoard = 3;
kHeightBatteryBoard = 8;
kHeightBattery = 24;

kHeightRaspberryPiStack = (kHeightBLDC 
                            + kHeightHeader1
                            + kHeightPCB
                            + kHeightSpaceBldcToRPi
                            + kHeightPCB
                            + kHeightSpacersRPiToBoard 
                            + kHeightBatteryBoard 
                            + kHeightBattery);
echo(kHeightRaspberryPiStack);

// Disk
kDiskHeight = 3.9;

// Cover
kCoverHeightBottom = 3;
kCoverHeightInside = kHeightRaspberryPiStack + 3;
kCoverHeightDisk = kDiskHeight + 0.1;
kCoverHeightRing = 9.9;
kCoverHeightToRing = kCoverHeightInside + kCoverHeightBottom + kCoverHeightDisk;

// Window
kWindowHeightRing = 10;
kWindowHeightFullRing = 8;
kWindowHeightGroove = 10;
kWindowHeight = 110;
kWindowTotalHeightRing = (kWindowHeightRing 
                        + kWindowHeightFullRing 
                        + kWindowHeightGroove);
kWindowTotalHeight = (kWindowHeightRing + kWindowHeightFullRing 
                    + kWindowHeightGroove + kWindowHeight);


// 
kArmHolesAngle = 16;
kArmHolesOffset = 4;
kArmHeight = kCoverHeightToRing + kWindowTotalHeightRing + 25;

kCableDiameter = 2.8*mm;

// Cable holder: Cylindric attachment to the cable
kCableHolderDiameter = 20*mm;
kCableHolderRadius = kCableHolderDiameter / 2;
kCableHolderLength = 20*mm;
// How far are the cable holders placed from each other (measure from start to start)

kCableHolderThickness = 6*mm;
kCableHolderScrewOffset = 4*mm;

// Inserts
kInsertM4Height = 8*mm;
kInsertM4Diameter = 5.1*mm;  // TODO: verify!

/********************************************************************/


module CablecamExtrusion(layer, height) {
    Extrusion(kDrawingsFile, layer, height); 
}

module CablecamStackExtrusions(list) {
    StackExtrusions(kDrawingsFile, list); 
}

module CablecamDisk() {
    h = kHeightBLDC + kHeightHeader1;
    translate([0, 0, -h])
        CablecamExtrusion("Disk-02", h); 
    CablecamExtrusion("Disk", 3.9); 
}

/*
module CablecamFoot() {
    CablecamExtrusion("foot1", 5); 
    
    translate([0, 0, 5])
    linear_extrude(height = 100)
       import(file = kDrawingsFile, layer = "foot2", $fn=360); 
    translate([0, 0, 105])
    linear_extrude(height = 5)
       import(file = kDrawingsFile, layer = "foot1", $fn=360); 
}
*/

module CablecamCoverExtrusion() {
    
        *CablecamStackExtrusions([["Cover01", kCoverHeightBottom],
                              ["Cover02", kCoverHeightInside],
                              ["Cover03", kCoverHeightDisk],
                              ["Cover04", kCoverHeightToRing]]);


    union() {
        CablecamExtrusion("Cover01", 1); 
        
        translate([0, 0, 1])
            CablecamExtrusion("Cover01-1", kCoverHeightBottom - 1); 

        d = 12;
        
        translate([0, 0, kCoverHeightBottom])
            CablecamExtrusion("Switch01", 1); 
        translate([0, 0, kCoverHeightBottom + 1])
            CablecamExtrusion("Switch02", 1.5); 
        translate([0, 0, kCoverHeightBottom + 2.5])
            CablecamExtrusion("Switch03", 7); 
        translate([0, 0, kCoverHeightBottom + 9.5])
            CablecamExtrusion("Switch02", 1.5); 
        translate([0, 0, kCoverHeightBottom + 11])
            CablecamExtrusion("Switch01-1", 1); 

        translate([0, 0, kCoverHeightBottom + d])
            CablecamExtrusion("Cover02", kCoverHeightInside - d); 
        
        translate([0, 0, kCoverHeightInside + kCoverHeightBottom])
            CablecamExtrusion("Cover03", kCoverHeightDisk); 
        
        translate([0, 0, kCoverHeightToRing])
        difference() {
            CablecamExtrusion("Cover04", kCoverHeightRing); 
            translate([-90, 0, 3.5+2+1.25]) 
            rotate([0, 90, 0]) 
                cylinder(d=3, h=20, $fn=360);
        }
        translate([55, 0, 0])
        rotate([0, -90, 0])
            FemaleContactBox();
    }
}


module CablecamCoverPerforations() {
    difference() {
        CablecamCoverExtrusion();

        // Holes to attach the arm
        translate([76+3, 0, 10 - kArmHolesOffset])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);

        translate([76+3, 0, 30 + kArmHolesOffset])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);

        translate([76+3, 0, kArmHeight/2])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);

        translate([76+3, 0, kArmHeight - 20 - kArmHolesOffset])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);
        
        translate([76+3, 0, kArmHeight - 10 + kArmHolesOffset])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);
    }
}

module CablecamCover() {
    translate([0, 0, -kCoverHeightToRing])
        CablecamCoverPerforations();
}

module CablecamWindow1Extrusion() {
    
    // The ring that fits into the ring of the cover
    // Part 1: with holes that cover the disk screws
    translate([0, 0, 0])
       CablecamExtrusion("Window1-01", 3.5); 
    
    // Part 2: no holes for disk screws, but insert for fixation screw 
    translate([0, 0, 3.5])
    difference() {
        CablecamExtrusion("Window1-02", 6.5); 
        // hole for insert
        translate([-90, 0, 2+1.25]) 
        rotate([0, 90, 0]) 
            cylinder(d=4, h=20, $fn=360);
    }

    // Fully filled ring
    translate([0, 0, kWindowHeightRing])
       CablecamExtrusion("Window1-03", kWindowHeightFullRing); 


    // Ring with groove for the plastic windows
    translate([0, 0, kWindowHeightRing + kWindowHeightFullRing])
       CablecamExtrusion("Window1-04", kWindowHeightGroove); 
    
    // The arm that exends toward the CablecamWindow2
    translate([0, 0, kWindowHeightRing + kWindowHeightFullRing + kWindowHeightGroove])
       CablecamExtrusion("Window1-05", kWindowHeight);         
}

module CablecamWindow1() {
    difference() {
        CablecamWindow1Extrusion();

        translate([76+3, 0, kArmHeight - 30 - kArmHolesOffset - kCoverHeightToRing])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);
        
        translate([76+3, 0, kArmHeight - 10 + kArmHolesOffset -kCoverHeightToRing])
            rotate([0, 90, 0])
            cylinder(h=20, d=4.1, $fn=360);
    }
}

module CablecamWindow2() {
    // The arm
    translate([0, 0, 0.2]) {
        linear_extrude(height = kWindowHeight - 0.2)
           import(file = kDrawingsFile, layer = "Window2-01", $fn=360); 
    }
    // The groove for the window
    translate([0, 0, kWindowHeight]) {
        linear_extrude(height = kWindowHeightGroove)
           import(file = kDrawingsFile, layer = "Window2-02", $fn=360); 
    }
    // The bottom
    translate([0, 0, kWindowHeight + kWindowHeightGroove]) {
        linear_extrude(height = kCoverHeightBottom - 1)
           import(file = kDrawingsFile, layer = "Window2-03", $fn=360); 
    }
    translate([0, 0, kWindowHeight + kWindowHeightGroove + 1]) {
        linear_extrude(height = 1)
           import(file = kDrawingsFile, layer = "Window2-04", $fn=360); 
    }
}

module CablecamHelper() {
        difference() {
            translate([-87, -20, -12]) 
                cube([10, 40, 24]); 
            translate([0, 0, -2.1])
                cylinder(h=4.2, r=84.6, $fn=360);
            translate([-81, 0, -15.1])
                cylinder(h=30.2, d=3.1, $fn=360);
            translate([-87.1, 15, 8])
            rotate([0, 90, 0])
                cylinder(h=10.2, d=4, $fn=360);
            translate([-87.1, 15, -8])
            rotate([0, 90, 0])
                cylinder(h=10.2, d=4, $fn=360);
            translate([-87.1, -15, 8])
            rotate([0, 90, 0])
                cylinder(h=10.2, d=4, $fn=360);
            translate([-87.1, -15, -8])
            rotate([0, 90, 0])
                cylinder(h=10.2, d=4, $fn=360);
        }
}

module CablecamArmExtrusion() {
    length = kArmHeight - 4 - 3;
    
    // Short extension to level with the contacts
    translate([0, 0, 0])
    CablecamExtrusion("Arm05", 10); 
       
    // Short extension to level with the contacts
    translate([0, 0, 10])
    CablecamExtrusion("Arm06", 20); 

    // Short extension to level with the contacts
    translate([0, 0, 30])
    CablecamExtrusion("Arm05", kArmHeight - 60); 

    // Short extension to level with the contacts
    translate([0, 0, kArmHeight - 30])
    CablecamExtrusion("Arm06", 20); 

    translate([0, 0, kArmHeight - 10])
    CablecamExtrusion("Arm05", 10); 
}

module CablecamArm() {
    difference() {
        CablecamArmExtrusion();
        
        length = kCoverHeightToRing + kWindowTotalHeightRing;
        
        // Holes to fix the arm to the cover
        translate([88+3, 0, 10 - kArmHolesOffset])
            M3(20, -X, 0.05, 0.1, 0.1);

        translate([88+3, 0, 30 + kArmHolesOffset])
            M3(20, -X, 0.05, 0.1, 0.1);


        translate([88+3, 0, kArmHeight/2])
            M3(20, -X, 0.05, 0.1, 0.1);
        
        translate([88+3, 0, kArmHeight - 30 - kArmHolesOffset])
            M3(20, -X, 0.05, 0.1, 0.1);
        
        translate([88+3, 0, kArmHeight - 10 + kArmHolesOffset])
            M3(20, -X, 0.05, 0.1, 0.1);


        // Holes to fix the cableholders
        translate([88+3, 0, 20])
            M3(10, X, 0.05, 0.1, 0.5);

        translate([88+3, 0, kArmHeight - 20])
            M3(10, X, 0.05, 0.1, 0.5);
            
        // Hole for M5 to fix the Cablecam arm
        *translate([109, -20, 10]) {
            rotate([-90, 0, 0]) {
                cylinder(d = 5.1, 40, $fn = 360);
            }
        }
        // Hole for M5 to fix the Cablecam arm
        *translate([109, -20, kArmHeight - 10]) {
            rotate([-90, 0, 0]) {
                cylinder(d = 5.1, 40, $fn = 360);
          
            }
        }           
    }
}


module CablecamCableHolderExtrusion()
{
    CablecamExtrusion("Arm04", 20); 
}

module CablecamCableHolder()
{
    difference() {

        CablecamCableHolderExtrusion();
    
        // Hole for M3 insert to press the cable
        translate([114.5, 0, 10]) {
            rotate([-90, 0, 0]) {
                cylinder(d = 4.2*mm, h = 20.1*mm, $fn = 360);
            }
        }
        
        // Hole for M5 for the v-wheel axis
        translate([144, 10, 10]) {
            M5(25, -Y);
        }   
        translate([144, -9, 10]) {
            M5LockNut(Y, 0.1);
        }   
        
        // Hole for M3 insert to fix the holder to the CablecamArm
        translate([90, 0, 10]) {
            rotate([0, 90, 0]) {
                cylinder(d = 4*mm, h = 10.1*mm, $fn = 360);
            }
        }
    }    
}

module CablecamBoardExtrusion() {
    CablecamStackExtrusions([["Board01", 3],
                             ["Board02", 2],
                             ["Board03", 3]]);
}

module CablecamBoard() {
    difference() {
        union() {
            linear_extrude(height = 3)
               import(file = "raspberry-pi-4.dxf", layer = "base", $fn=360); 

            translate([0, 0, 3])
            linear_extrude(height = 5)
               import(file = "raspberry-pi-4.dxf", layer = "base2", $fn=360); 
        }
        
        // Holes for inserts
        
        translate([15, 47/2-3+0.1, 4])
        rotate([90, 0, 0])
            cylinder(d=4, h=10.1, $fn=360);

        translate([15, -(47/2-3+0.1), 4])
        rotate([-90, 0, 0])
            cylinder(d=4, h=10.1, $fn=360);

        // Holes for m3 nuts
        translate([20+3.5, 56/2-3.5, 8.1])
        rotate([0, 0, 0])
            M3LockNut(Z, 0.4, 0.1);
 
        translate([20+3.5, -(56/2-3.5), 8.1])
        rotate([0, 0, 0])
            M3LockNut(Z, 0.4, 0.1);
    
        translate([20+3.5+58, 56/2-3.5, 8.1])
        rotate([0, 0, 0])
            M3LockNut(Z, 0.4, 0.1);
 
        translate([20+3.5+58, -(56/2-3.5), 8.1])
        rotate([0, 0, 0])
            M3LockNut(Z, 0.4, 0.1);
    }
}

module CablecamPCB() {
   CablecamExtrusion("BLDC-Board", 1.5); 
}

module CablecamPi4() {
    CablecamExtrusion("RPi4-Board", 1.5); 
    translate([0, 0, 1.5])
        CablecamExtrusion("RPi4-Ethernet", 13.5); 
    translate([0, 0, 1.5])
        CablecamExtrusion("RPi4-USB", 16); 
    translate([0, 0, 1.5])
        CablecamExtrusion("RPi4-Header", 2.4); 
}

module CablecamElectronics()
{
    h = kHeightBLDC + kHeightHeader1;
    ref_height = -1.5 - 0.1 - 3.9 - h; // The bottom of the BLDC board
    
    //translate([0, 0, -h - 3.9 - 1.5 - 0.1])
    translate([0, 0, -1.5 - 0.1 - 3.9 - h])
        CablecamPCB();
    
    *translate([0, 0, ref_height - 1.5 - 2.5 - 8.5])
    rotate([0, 0, 0])
        CablecamPi4();
    
    *translate([0, 0, ref_height - 1.5 - 2.5 - 8.5 - 3])
    rotate([180, 0, 0])
        CablecamBoardExtrusion();

    
    *translate([-11, 0, ref_height -1.5 - 2.5 - 8.5 - 3 - 8 - 18.7/2])
        BatteryPack();
}

module BatteryPack() {
    translate([0, 33.1, 0])
    rotate([90, 0, 0])
        cylinder(d = 18.7, h = 66.2, $fn = 360);
    
    translate([18, 33.1, 0])
    rotate([90, 0, 0])
        cylinder(d = 18.7, h = 66.2, $fn = 360);
    
    translate([-18, 33.1, 0])
    rotate([90, 0, 0])
        cylinder(d = 18.7, h = 66.2, $fn = 360);
}

module Cablecam()
{
    CablecamCover();

    *translate([0, 0, -kCoverHeightDisk])
        CablecamDisk();

    *CablecamWindow1();

    *translate([0, 0, kWindowTotalHeightRing])
        CablecamWindow2();

    *translate([0, 0, -kCoverHeightToRing])
        CablecamArm();
    *translate([0, 0, -kCoverHeightToRing + 10])
        CablecamCableHolder();
    *translate([0, 0, -kCoverHeightToRing + kArmHeight - 30])
        CablecamCableHolder();
}

Cablecam();

*CablecamElectronics();
