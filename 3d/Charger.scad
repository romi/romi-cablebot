include <units.scad>
use <screws.scad>
use <PogoPins.scad>

kRotation = 90;

module PogoBase() {
    linear_extrude(height = 3.15 + 0.02)
       import(file = "PogoPins.dxf", layer = "P4-base", $fn=360); 
}

Points1 = [
  [  0,  -13,  -24 ],  //0
  [ 25,  -10,  -21 ],  //1
  [ 25,   10,  -21 ],  //2
  [  0,   13,  -24 ],  //3
  [  0,  -13,  24 ],  //4
  [ 25,  -10,  21 ],  //5
  [ 25,   10,  21 ],  //6
  [  0,   13,  24 ]]; //7
  
Faces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left


module MaleContactBox() {
    rotate([kRotation, 0, 0]) 
    translate([0, 0, 0])
    difference() {
        union() {
            polyhedron(Points1, Faces);
            translate([-3, -15, -26])
                cube([3, 30, 52]);
        }
        
        // Remove material from the back to insert the pogo pin
        translate([-0.1-3, -8, -15.1])
            cube([15.1 - 3.15 + 3 + 0.5, 16, 30.2]);
        
        // Remove material from the front to access the contacts
        translate([15.5, -8, -18])
            cube([10.1, 16, 36]);
        
        translate([15.51, 0, -11])
        rotate([0, -90, 0])
            PogoBase();
        
        translate([15.51, 0, -11])
        rotate([0, -90, 0])
            cylinder(d=4.6, h=2.1, $fn=360);
        
        translate([15.51, 0, 11])
        rotate([0, -90, 0])
            cylinder(d=4.6, h=2.1, $fn=360);
        
    }
}


/////////////////////////////////
// 8.5 x 15.8 x 35.8
Points2 = [
  [  0,  -5,  -16 /*7*/ ],  //0
  [ 8.5,  -7.9,  -17.9 /*5.1*/ ],  //1
  [ 8.5,   7.9,  -17.9 /*5.1*/ ],  //2
  [  0,   5,  -16 ],  //3
  [  0,  -5,  16 /*39*/ ],  //4
  [ 8.5,  -7.9,  17.9 ],  //5
  [ 8.5,   7.9,  17.9 /*40.9*/ ],  //6
  [  0,   5,  16 ]]; //7

module FemaleContactBoxExtrusion() {
    difference() {
        d = 8.5-3.15;
        
        translate([16.5, 0, 0])
            polyhedron(Points2, Faces);
        
        translate([25-d, -4.1, -15.1])
            cube([d+0.01, 8.2, 30.2]);
        
        translate([16.5+3.14+0.02, 0, -11])
           rotate([0, -90, 0])
                PogoBase();
        
        // Holes for M3 screws
        translate([18.5, 0, -11])
        rotate([0, -90, 0])
            cylinder(d=4.6, h=2.1, $fn=360);
        
        translate([18.5, 0, 11])
        rotate([0, -90, 0])
            cylinder(d=4.6, h=2.1, $fn=360);
    }
}

module FemaleContactBoxHousing() {
    difference() {
        translate([0, -16, -26])
            cube([27, 32, 52]);
        
        translate([-0.1, 0, 0])
        resize([25.1, 26.2, 48.2])
            polyhedron(Points1, Faces);
        
        translate([0, -4.1, -15.1])
            cube([30, 8.2, 30.2]);
    }
}

module FemaleContactBox() {
    rotate([kRotation, 0, 0]) {
        FemaleContactBoxHousing();
        FemaleContactBoxExtrusion();
    }
}

FemaleContactBox();
union() {
    translate([19.5, 11, 0])
    rotate([90, 0, 0])
    rotate([0, -90, 0])
        Pogo4Female();
    *translate([18.5, 0, 13])
        M25(10, X);
    *translate([18.5, 0, 18+13])
        M25(10, X);
}

translate([0, 0, 0])
MaleContactBox();
*union() {
    translate([12.5, -11, 0])
    rotate([90, 0, 0])
    rotate([0, 90, 0])
        Pogo4Male();
    *translate([13, 0, 13])
        M25(10, -X);
    *translate([13, 0, 18+13])
        M25(10, -X);
}
