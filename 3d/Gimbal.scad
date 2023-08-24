include <extrusion.scad>

module GimbalMotor()
{
    difference() {
        cylinder(h = 7, d = 47, $fn = 360);

        translate([0, 0, 3])
        cylinder(h = 5.1, d = 35.6, $fn = 360);
        
        // Hole for insert
        translate([0, -47.2/2, 3.5])
        rotate([-90, 0, 0])
            cylinder(d = 4.0, h = 47.2, $fn=360);

        // Space for M3 screws
        d = 30/2 * cos(45);
        translate([d, d, -0.1])
            cylinder(d = 3.1, h = 6.2, $fn=360);
        translate([d, -d, -0.1])
            cylinder(d = 3.1, h = 6.2, $fn=360);
        translate([-d, d, -0.1])
            cylinder(d = 3.1, h = 6.2, $fn=360);
        translate([-d, -d, -0.1])
            cylinder(d = 3.1, h = 6.2, $fn=360);

        // Space for M3 heads
        translate([d, d, 3.5])
            cylinder(d = 5.6, h = 3.51, $fn=360);
        translate([d, -d, 3.5])
            cylinder(d = 5.6, h = 3.51, $fn=360);
        translate([-d, d, 3.5])
            cylinder(d = 5.6, h = 3.51, $fn=360);
        translate([-d, -d, 3.5])
            cylinder(d = 5.6, h = 3.51, $fn=360);
    }
}

module GimbalPiCamera()
{
    difference() {
        union() {
            cylinder(h = 10, d = 52, $fn = 360);
            translate([-26, 0, 7])
                cube([52, 46, 3]);
        }
        
        translate([0, 0, -0.1])
            cylinder(h = 7.1, d = 47.2, $fn = 360);
        
        // Hole for M3 screw
        translate([0, -52.2/2, 3.5])
        rotate([-90, 0, 0])
            cylinder(d = 3.1, h = 6.1, $fn=360);

        translate([0, 52.2/2, 3.5])
        rotate([90, 0, 0])
            cylinder(d = 3.1, h = 6.1, $fn=360);
        
        // Hole for fixation screws
        translate([21, 21, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);

        translate([-21, 21, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);

        translate([21, 27, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);
            
        translate([-21, 27, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);
            
        translate([21, 33, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);
            
        translate([-21, 33, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);
            
        translate([21, 39, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);
            
        translate([-21, 39, 7-0.1])
        rotate([0, 0, 0])
            cylinder(d = 3.1, h = 3.2, $fn=360);
    }
}

module GimbalPiCamera2()
{
    difference() {
        translate([0, 6.5, 0])
        rotate([90, 0, 0]) {
           translate([0, 0, 0])
                Extrusion("Gimbal.dxf", "picamera2", 2.5); 
           translate([0, 0, 2.5])
                Extrusion("Gimbal.dxf", "picamera", 8); 
        }
        
        translate([21, 0, -0.1])
            cylinder(d = 4, h = 10.1, $fn=360);
        translate([-21, 0, -0.1])
            cylinder(d = 4, h = 10.1, $fn=360);

    }
}

Points1 = [
  [  0,  -28,  -28 ],  //0
  [ 62,  -42,  -37 ],  //1
  [ 62,   42,  -37 ],  //2
  [  0,   28,  -28 ],  //3
  [  0,  -28,  28 ],  //4
  [ 62,  -42,  37 ],  //5
  [ 62,   42,  37 ],  //6
  [  0,   28,  28 ]]; //7

Points2 = [
  [  -0.1,  -27,  -27 ],  //0
  [ 62.1,  -41,  -36 ],  //1
  [ 62.1,   41,  -36 ],  //2
  [  -0.1,   27,  -27 ],  //3
  [  -0.1,  -27,  27 ],  //4
  [ 62.1,  -41,  36 ],  //5
  [ 62.1,   41,  36 ],  //6
  [  -0.1,   27,  27 ]]; //7
  
Faces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left

module GimbalPiCameraCover()
{
    translate([0, 0, 0])
        rotate([0, 90, 0])
        Extrusion("Gimbal.dxf", "cover", 6);         
    
    difference() {
            polyhedron(Points1, Faces);
            polyhedron(Points2, Faces);
    }
 }



*GimbalMotor();
*translate([0, 0, 0])
    GimbalPiCamera();

*translate([0, 21, 10])
    GimbalPiCamera2();

GimbalPiCameraCover();
