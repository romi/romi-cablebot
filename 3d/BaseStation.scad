include <extrusion.scad>
use <Cablecam.scad>
use <Charger.scad>
include <screws.scad>

kBaseStationDrawingsFile = "BaseStation.dxf";

module BaseStationExtrusion(layer, height) {
    Extrusion(kBaseStationDrawingsFile, layer, height); 
}

module StepperMotor()
{
    color("Black")
    translate([-57/2, -57/2, -56 - 61])
        cube([57, 57, 56]);
    color("Black")
    translate([0, 0, -61])
        cylinder(d = 56, h = 61, $fn=360);
    color("Silver")
    translate([0, 0, 0])
        cylinder(d = 32, h = 2, $fn=360);

    color("Silver")
    translate([0, 0, 2])
        cylinder(d = 12, h = 26, $fn=360);
}

module Wheel()
{
    BaseStationExtrusion("Wheel-01", 2.5);
       
    translate([0, 0, 2.5])
       BaseStationExtrusion("Wheel-02", 4);
       
    translate([0, 0, 6.5])
       BaseStationExtrusion("Wheel-01", 2.5);
}

module WheelHousingBottomReinforcement1(thickness)
{
    color("grey") {
        BaseStationExtrusion("WheelhousingBottom-Reinforcement-01", thickness);
    }
}

module WheelHousingBottomReinforcement2(thickness)
{
    color("grey") {
        BaseStationExtrusion("WheelhousingBottom-Reinforcement-02", thickness);
    }
}

module WheelHousingBottomExtrusion()
{
    union() {
        // height_bottom = 0.8+1.2+2 = 4;
        
        BaseStationExtrusion("WheelHousingBottom-02", 0.8);
        
        translate([0, 0, 0.8])
            BaseStationExtrusion("WheelHousingBottom-02", 1.2);
           
        translate([0, 0, 2])
            BaseStationExtrusion("WheelHousingBottom-03", 2);
        
        // height_center = 6+3+6+3+6 = 24
        
        translate([0, 0, 4])
            BaseStationExtrusion("WheelHousingBottom-04", 6);

        translate([0, 0, 10])
            BaseStationExtrusion("WheelHousingBottom-05", 3);
           
        translate([0, 0, 13])
            BaseStationExtrusion("WheelHousingBottom-06", 6);
           
        translate([0, 0, 19])
            BaseStationExtrusion("WheelHousingBottom-05", 3);
        
        translate([0, 0, 22])
           BaseStationExtrusion("WheelHousingBottom-04", 6);
        
        // height_top = 2+1.2+0.8 = 4
        
        translate([0, 0, 28])
           BaseStationExtrusion("WheelHousingBottom-07", 2);
           
        translate([0, 0, 30])
           BaseStationExtrusion("WheelHousingBottom-08", 1.2);

        translate([0, 0, 31.2])
           BaseStationExtrusion("WheelHousingBottom-09", 0.8);

        // total height: 4+24+4 = 32
           
        // Cylinders for the pulley wheels
        // Height inside = 9 - 4 = 5
        // Height pulley = 11
        // Remaining height (inside) = 24 - 5 - 11 = 8
        BaseStationExtrusion("WheelHousingBottom-10", 9);
    }
}

module WheelHousingBottom()
{
    
    difference() {
                
        WheelHousingBottomExtrusion();

        translate([0, 0, -0.1]) {
            WheelHousingBottomReinforcement1(3.05);
        } 
        translate([0, 0, 25]) {
            WheelHousingBottomReinforcement2(8.05);
        } 
        
        // holes for the inserts to connect the homing station
        translate([90, -50, 8])
        rotate([0, 90, 0])
            cylinder(h=6.1, r=4.1/2, $fn=360);

        translate([90, -50, 24])
        rotate([0, 90, 0])
            cylinder(h=6.1, r=4.1/2, $fn=360);
        
        translate([90, -86, 8])
        rotate([0, 90, 0])
            cylinder(h=6.1, r=4.1/2, $fn=360);

        translate([90, -86, 24])
        rotate([0, 90, 0])
            cylinder(h=6.1, r=4.1/2, $fn=360);
        
        // holes for the screws to connect the homing station
        translate([78, -50, 8])
        rotate([0, 90, 0])
            cylinder(h=20, r=3/2, $fn=360);

        translate([78, -50, 24])
        rotate([0, 90, 0])
            cylinder(h=20, r=3/2, $fn=360);
        
        translate([78, -86, 8])
        rotate([0, 90, 0])
            cylinder(h=20, r=3/2, $fn=360);

        translate([78, -86, 24])
        rotate([0, 90, 0])
            cylinder(h=20, r=3/2, $fn=360);

        // Extra holes for nuts to connect the homing station
        translate([79.5, -50, 8])
            M3Nut(-X, 0.1, 0);

        translate([79.5, -50, 24])
            M3Nut(-X, 0.1, 0);
    }

    *translate([0, 0, 0]) {
        WheelHousingBottomReinforcement1(3);
    } 
    *translate([0, 0, 30]) {
        WheelHousingBottomReinforcement2(3);
    } 
}

module WheelHousingCoverExtrusion()
{
    union() {
        translate([0, 0, -3])
            BaseStationExtrusion("WheelHousingCover-0012", 2);
        translate([0, 0, -1])
            BaseStationExtrusion("WheelHousingCover-001", 10);
        translate([0, 0, 2])
            BaseStationExtrusion("WheelHousingCover-00", 2.01);
        translate([0, 0, 4])
            BaseStationExtrusion("WheelHousingCover-002", 4.01);
        translate([0, 0, 5.3])
            BaseStationExtrusion("WheelHousingCover-01", 0.7);
        translate([0, 0, 6])
            BaseStationExtrusion("WheelHousingCover-02", 2);
        translate([0, 0, 8])
            BaseStationExtrusion("WheelHousingCover-03", 1);
    }
}


module WheelHousingCover()
{
    difference() {
        WheelHousingCoverExtrusion();
    }
}

module MotorHousingExtrusion()
{
    union() {
        BaseStationExtrusion("MotorHousing-03", 1);
        translate([0, 0, 1])
            BaseStationExtrusion("MotorHousing-02", 2);
        translate([0, 0, 3])
            BaseStationExtrusion("MotorHousing", 139);
    }
}

module MotorHousing()
{
    difference() {
        MotorHousingExtrusion();
        
        translate([45, 0, 120])
        rotate([90, 0, 0])
            cylinder(h=80, d=18.5, $fn=360);
    }
}

module FixationBracketExtrusion()
{
        translate([0, 0, 12.5])
            BaseStationExtrusion("FixationBracket-02", 21);
}

module FixationBracketAlu()
{
    color("grey") {
        rotate([0, 90, 0])
        translate([-23, 0, -90])
            BaseStationExtrusion("FixationBracket-03", 4);
    }
}

module FixationBracket()
{
    *difference() {
        FixationBracketExtrusion();
        translate([-85, 15, 23])
            M5(40, -X, 0.1); 
        translate([-85, -15, 23])
            M5(40, -X, 0.1); 
    }
    FixationBracketAlu();
}

module AngleAdjusterExtrusion()
{
    union() {
        BaseStationExtrusion("AngleAdjuster-01", 5);
        translate([0, 0, 5])
            BaseStationExtrusion("AngleAdjuster-02", 15);
        translate([0, 0, 20])
            BaseStationExtrusion("AngleAdjuster-01", 5);
    }
}

module AngleAdjuster()
{
    difference() {
        AngleAdjusterExtrusion();
        
        // Holes to fix to the pole
        translate([-95, 33-150, 12.5])
            M5(40, -X, 0.1); 
        translate([-95, -33-150, 12.5])
            M5(40, -X, 0.1); 
        // Hole for M5 screw to adjust angle
        translate([-95+180-4, -150, 12.5])
            rotate([0, -90, 0])
            cylinder(d=5.5, h=40, $fn=360); 
        // Hole for M5 nut
        translate([-95+155.1, -150, 12.5])
            #M5Nut(X, 0.05, 2.5); 
    }
}

module HomeCone()
{
    difference() {
        cylinder(r1 = 90.5, r2 = 102, h = 102, $fn = 260);
        translate([0, 0, -0.01]) 
            cylinder(r1 = 88.5, r2 = 100, h = 120.02, $fn = 260);
    }
}

module CarvedHomeCone()
{
    difference() {
        
        HomeCone();
        
        translate([-120, -6, -0.1])
            cube([120, 12.2, 120]);
        
        translate([-120, -6, 10])
        rotate([5, 0, 0]) 
            cube([120, 12, 120]);
        translate([-120, -6, 10])
        rotate([-5, 0, 0]) 
            cube([120, 12, 120]);

        translate([-120, -6, 50])
        rotate([20, 0, 0]) 
            cube([120, 12, 120]);
        translate([-120, -6, 50])
        rotate([-20, 0, 0]) 
            cube([120, 12, 120]);

        translate([-120, -6, 25])
        rotate([10, 0, 0]) 
            cube([120, 12, 120]);
        translate([-120, -6, 25])
        rotate([-10, 0, 0]) 
            cube([120, 12, 120]);

        translate([0, 0, 105])
        rotate([0, 29, 0]) 
            cube([280, 280, 100], center = true);
    }
}

module HomeStationBack()
{
    union() {
        BaseStationExtrusion("HomeStationBack-03", 1.8);
        
        translate([0, 0, 1.8])
            BaseStationExtrusion("HomeStationBack-02", 1.2);

        translate([0, 0, 3])
            BaseStationExtrusion("HomeStationBack-01", 2);
        
        translate([-55, 0, 6])
        rotate([0, -90, 0])
            MaleContactBox();
    }
}

module HomeStation()
{
    difference() {
        union() {
            CarvedHomeCone();
            translate([0, 0, -5])
                HomeStationBack();
        }
    }
}

module BaseStation()
{
    translate([0, 15, 0])
    rotate([90, 0, 0]) {
        offset_cable = 4 + 12; // height_bottom + height_center/2
        wheel_height = 9;
        
        *translate([0, 0, offset_cable - wheel_height/2])
            Wheel();

        *WheelHousingBottom();  // REPRINT

        *WheelHousingBottomReinforcement1(3);
    
        *translate([0, 0, 25])
            WheelHousingBottomReinforcement2(3);

        *translate([0, 0, 26])
            WheelHousingCover(); // REPRINT

        *translate([0, 0, 0])
            StepperMotor();

        *translate([0, 0, -142+1])
            MotorHousing();

        translate([0, 0, -7])
            FixationBracket(); // REPRINT

        *translate([0, 0, -7])
            AngleAdjuster();

        *translate([101, -123, 16])
            rotate([-90, 0, 0]) 
            rotate([0, 90, 0]) 
                HomeStation();
    }   
}

module SpacerWheel()
{
    difference() {
        cylinder(h=0.5, r=10);
        translate([0, 0, -0.01])
            cylinder(h=0.52, r=6.1);
    }
}

module SpacerWheelWithPin()
{
    difference() {
        cylinder(h=0.5, r=10);
        translate([0, 0, -0.01])
            cylinder(h=0.52, r=6.1);
        translate([-2, 4.1, -0.01])
            cube([4, 4, 0.52]);
    }
}

*SpacerWheelWithPin();
BaseStation();

*translate([400, 0, -123])
rotate([0, 0, 180]) 
rotate([0, -90, 0]) {
    Cablecam();
}

