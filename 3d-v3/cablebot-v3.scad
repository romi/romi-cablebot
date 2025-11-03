include <units.scad>
include <screws.scad>
include <stepper.scad>
use <pogopins.scad>


// TODO:
// * length motor
// * width holes charger board


pogo_length = (2 * 0.1575 + 2 * 0.1969 + 3 * 0.1575) * inch;
// mesured between centers of screw holes
pogo_length2 = (2 * 0.1969 + 3 * 0.1575) * inch;
pogo_pin_stroke = 0.09 * inch;
pogo_pin_half_stroke = pogo_pin_stroke / 2;
pogo_extrusion_height = 0.124 * inch;
pogo_mf_distance = pogo_pin_half_stroke;

cone_thickness = 2.5;

// cone_pogo_extrusion_r_in = size pogo pin + margin
cone_pogo_extrusion_r_in = (pogo_length + 1) / 2; 
cone_pogo_extrusion_r_out = cone_pogo_extrusion_r_in + cone_thickness; 
cone_height_pogo_extrusion = 5; 
cone_pogo_wall_thickness = pogo_extrusion_height - 0.5; 

cone_depth = 12;
innercone_extra_depth = 4;

cone_r2i = 25;

cone_r1i = cone_pogo_extrusion_r_out + cone_thickness;

cone_r1 = cone_r1i + cone_thickness;
cone_r2 = cone_r2i + cone_thickness;
cone_r1ii = cone_r1i - cone_thickness; // == cone_pogo_extrusion_r_out
cone_r2ii = cone_r2i - cone_thickness;

pi_width = 30;
pi_length1 = 65;
pi_length2 = 65;
r_camera = 20;
r_camera_gs = 23.5;

body_thickness = 3;
body_length = pi_length2 + 2 * body_thickness + 2 * 8 + 2 * 11;
body_r = cone_r1 + 2 + 0.2 + body_thickness;
body_screw_offx = body_length / 10;
body_screw_offy = pi_width/2 + 5.5;

objectif_r = 20;

body_offset_halfs = 0;
body_offset_pi = 12;

magnet_r = 6/2;
magnet_h = 3;
magnet_offset = 7 + 8.4/2;

wheel_r = 25;
wheel_inner_h = 3;
wheel_outer_h = 2;
wheel_h = wheel_inner_h + 2 * wheel_outer_h;
// space between the bottom of the wheel and the bottom arm fixed to motor
wheel_spacing_bottom = 2;
// space between the top of the wheel and the top arm fixed to motor
wheel_spacing_top = 5;
arm_r = 6;
tube_r = 3.0;
cable_r = 2;
cable_z = body_r + arm_r;

motorarm_h = 3;

motor_size = 102;
motor_back_axle_h = 13;
motorbox_internal_space = 4;
conduit_ring_height = 20;
conduit_r = 22/2;

motorbox_thickness = 2.4;
motorbox_size = 72.4 + 0.2 + 2 * motorbox_thickness;
echo("*** motorbox_size ", motorbox_size);
motorbox_height = (motor_size + motorarm_h + motor_back_axle_h + conduit_ring_height 
                    + motorbox_internal_space + motorbox_thickness);

bearing_h1 = 1;
bearing_h2 = 4;
bearing_r1 = 8/2;
bearing_r2 = 10/2;
bearing_r3 = 15/2;

cablehanger_x = 14;
cablehanger_dx = 60;
cablehanger_length = cablehanger_x + cablehanger_dx;

powerboost500_length = 1.4 * inch;
powerboost500_width = 0.85 * inch;
powerboost500_d1 = 0.65 * inch;
powerboost500_d2 = 0.55 * inch;
powerboost1000_length = 1.43 * inch;
powerboost1000_width = 0.9 * inch;
powerboost1000_d1 = 0.7 * inch;
powerboost1000_d2 = 13.5;

ina219_length = 25.4;
ina219_width = 22.0;
ina219_d1 = 20.4;
ina219_d2 = 17.3;
ina219_r = 2.5/2;
        
ina260_length = 24;
ina260_width = 24;
ina260_d = 18;
ina260_r = 2.5/2;
        
scaffold_section = 8;
scaffold_extension = 8.4;
scaffold_length = pi_length1 + 2 * scaffold_extension;
scaffold_width = pi_width + 2;
scaffold_thickness = 3;
//scaffold_insert_offset = 4;
scaffold_insert_offset_x = 3.6;
scaffold_insert_offset_y = 4.2;

assert(cone_r2 > cone_r1);
assert(bearing_h2 > bearing_h1 + 1);
assert(bearing_r2 > bearing_r1);
assert(bearing_r3 > bearing_r2);

module PogoBase() {
}

module ConnectorChargerOuter() 
{
    // NOTE: the outer cone assures the small extra spacings needed for a smooth connection
    // of the two pieces.
    rotate([0, -90, 0]) 
    rotate([0, 0, 90]) 
    union() {
        // The extrusion for the pogo pins
        difference() {
            translate([0, 0, -0.01])
                cylinder(h=cone_height_pogo_extrusion + 0.01 - pogo_mf_distance, 
                        r=cone_pogo_extrusion_r_out - 0.4, $fn=360);  // 0.2mm spacing
            translate([0, 0, -0.02])
                cylinder(h=cone_height_pogo_extrusion + 0.02 - pogo_mf_distance - cone_pogo_wall_thickness, 
                        r=cone_pogo_extrusion_r_in, $fn=360);
            translate([-pogo_length2/2, 0, 
                        cone_height_pogo_extrusion - cone_pogo_wall_thickness - pogo_mf_distance - 0.01])
                PogoBase();
            translate([pogo_length2 / 2, 0, 
                        cone_height_pogo_extrusion - pogo_mf_distance - 0.29])
                M25Countersunk(10, -Z, 0, 0.1, 0.3);
            translate([-pogo_length2 / 2, 0, 
                        cone_height_pogo_extrusion - pogo_mf_distance - 0.29])
                M25Countersunk(10, -Z, 0, 0.1, 0.3);
            // two holes for the magnets
            translate([0, -magnet_offset, 
                    cone_height_pogo_extrusion - pogo_mf_distance - cone_pogo_wall_thickness - 1])
                cylinder(h=magnet_h, r=magnet_r, $fn=360);
            translate([0, magnet_offset, 
                    cone_height_pogo_extrusion - pogo_mf_distance - cone_pogo_wall_thickness - 1])
                cylinder(h=magnet_h, r=magnet_r, $fn=360);
        }

        // outer cylinder receiving the inner cone 
        difference() {
            union() {
                translate([0, 0, -0.01])
                    cylinder(h=body_thickness + 0.02, r=cone_r1+0.8, $fn=8); 
               translate([0, 0, body_thickness])
                    cylinder(h=cone_height_pogo_extrusion - body_thickness + 0.01, r=cone_r1, $fn=360);
                translate([0, 0, body_thickness])
                    cylinder(h=2, r=cone_r1 + 3, $fn=360);
            }
            translate([0, 0, -0.02])
                cylinder(h=cone_height_pogo_extrusion + 0.04, r=cone_r1i + 0.5, $fn=360); // 0.2mm spacing
        }
        
        // bottom ring
        difference() {
            translate([0, 0, -2])
                cylinder(h=2, r=cone_r1 + 1, $fn=360);
            translate([0, 0, -2.01])
                cylinder(h=2.02, r=cone_pogo_extrusion_r_in, $fn=360);    
        }
    
        // add two cylinders for the magnets to the extrusion
        translate([0, -magnet_offset, cone_height_pogo_extrusion - pogo_mf_distance - cone_pogo_wall_thickness - 1]) {
            difference() {
                cylinder(h=magnet_h + .01, r=magnet_r + 2, $fn=360);
                translate([0, 0, -0.1]) cylinder(h=magnet_h + 1, r=magnet_r, $fn=360);
            }
        }
        translate([0, magnet_offset, cone_height_pogo_extrusion - pogo_mf_distance - cone_pogo_wall_thickness - 1]) {
            difference() {
                cylinder(h=magnet_h + .01, r=magnet_r + 2, $fn=360);
                translate([0, 0, -0.1]) cylinder(h=magnet_h+1, r=magnet_r, $fn=360);
            }
        }
        
        // the outer guiding cone
        difference() {
            translate([0, 0, cone_height_pogo_extrusion])
                cylinder(h=cone_depth, r1=cone_r1+3, r2=cone_r2, $fn=360);
            d = cone_depth / 0.75;
            translate([0, cone_pogo_extrusion_r_out, d/2 + cone_height_pogo_extrusion])
                rotate([-90, 0, 0])
                rotate([0, 0, 90])
                cylinder(h=20, r=d / 2 + 0.2, $fn=3);
            translate([0, 0, cone_height_pogo_extrusion-0.01])
                cylinder(h=cone_depth + 0.02, r1=cone_r1i + 0.5, r2=cone_r2i + 0.9, $fn=360);
        }
        
        *translate([-pogo_length2/2, 0, 5.7])
            Pogo4Female();

    }
}

module ConnectorChargerInner() {
    rotate([0, -90, 0]) 
    rotate([0, 0, 90]) 
    union() {
        // the ring that slides over the pogo extrusion
        {
            // Short conic edge
            difference() {
                translate([0, 0, 0])
                    cylinder(h=2 + 0.01, r1=cone_r1i-1, r2=cone_r1i, $fn=360);
                translate([0, 0, -0.01])
                    cylinder(h=2 + 0.03, r=cone_pogo_extrusion_r_out, $fn=360);
            }
            translate([0, 0, 2])
               Ring(cone_height_pogo_extrusion - 2 + 0.01, cone_r1i, cone_pogo_extrusion_r_out);
        }
        // the guiding cone that includes the pogo pin
        difference() {
            union() {
                translate([0, 0, cone_height_pogo_extrusion])
                    cylinder(h=cone_depth, r1=cone_r1i, r2=cone_r2i, $fn=360);
                
                d = cone_depth / 0.75;
                h = cone_r2i - cone_pogo_extrusion_r_out + 3.1;
                translate([0, cone_pogo_extrusion_r_out, cone_height_pogo_extrusion + d/2])
                rotate([-90, 0, 0])
                rotate([0, 0, 90])
                    cylinder(h=h, r=d/2, $fn=3);
            }
            translate([0, 0, cone_height_pogo_extrusion + cone_pogo_wall_thickness])
                cylinder(h=cone_depth - cone_pogo_wall_thickness + 0.01, 
                        r1=cone_pogo_extrusion_r_out, 
                        r2=cone_r2ii, $fn=360);
            translate([-pogo_length2/2, 0, 
                        cone_height_pogo_extrusion-0.01])
                PogoBase();

            translate([pogo_length2 / 2, 0, 
                        cone_height_pogo_extrusion + 0.29])
                M25Countersunk(10, Z, 0, 0.1, 0.3);
            translate([-pogo_length2 / 2, 0, 
                        cone_height_pogo_extrusion + 0.29])
                M25Countersunk(10, Z, 0, 0.1, 0.3);
            
            //translate([-pogo_length2/2, 0, 
            //            cone_height_pogo_extrusion + kM25Dimensions[2] - 0.9])
            //    M25Countersunk(10, 0.3, 0.1);
            //translate([+pogo_length2/2, 0, 
            //            cone_height_pogo_extrusion + kM25Dimensions[2] - 0.9])
            //    M25Countersunk(10, 0.3, 0.1);
            
            // Magnets
            translate([0, -magnet_offset, cone_height_pogo_extrusion + cone_pogo_wall_thickness - 2]) 
                cylinder(h=magnet_h, r=magnet_r, $fn=360);
            translate([0, magnet_offset, cone_height_pogo_extrusion + cone_pogo_wall_thickness - 2]) 
                cylinder(h=magnet_h + 0.1, r=magnet_r, $fn=360);
        }
        // Short ring at the end
        translate([0, 0, cone_depth + cone_height_pogo_extrusion])
            Ring(innercone_extra_depth, cone_r2i, cone_r2ii); 
        // magnets
        translate([0, -magnet_offset, cone_height_pogo_extrusion + cone_pogo_wall_thickness - 0.01]) 
            Ring(1.1, magnet_r + 2, magnet_r);        
        translate([0, magnet_offset, cone_height_pogo_extrusion + cone_pogo_wall_thickness - 0.01]) 
            Ring(1.1, magnet_r + 2, magnet_r);

        difference() {
            union () {
                h = cone_depth + innercone_extra_depth + 0.01;
                r = 4;
                d = 2;
                dx = cone_r2i - cone_thickness - (r-d) - 1; // add extra 1mm to have more depth for insert
                translate([dx, 0, cone_height_pogo_extrusion + cone_depth + innercone_extra_depth - h]) 
                    Cylinder(h, r, d);
                translate([-dx, 0, cone_height_pogo_extrusion + cone_depth + innercone_extra_depth - h]) 
                    Cylinder(h, r, d);
            }
            translate([0, 0, cone_height_pogo_extrusion - 0.011]) 
                Cone(cone_depth + 0.021, cone_r1i+10, cone_r2i+10, 10);
        }
    }
}
module Can(h, r, d) {
    difference() {
        translate([0, 0, 0]) 
            cylinder(h=h, r=r, $fn=360);
        translate([0, 0, d]) 
            cylinder(h=h-2*d, r=r-d, $fn=360); ///////////////////
    }
}

module Cylinder(h, r, d) {
    assert(h > 0);
    assert(d > 0);
    assert(r > d);
    difference() {
        translate([0, 0, 0]) 
            cylinder(h=h, r=r, $fn=360);
        translate([0, 0, -0.01]) 
            cylinder(h=h+0.02, r=r-d, $fn=360);
    }
}

module Cylinder2(h, r_inside, r_outside) {
    assert(h > 0);
    assert(r_inside >= 0);
    assert(r_outside > r_inside);
    difference() {
        translate([0, 0, 0]) 
            cylinder(h=h, r=r_outside, $fn=360);
        if (r_inside > 0) {
            translate([0, 0, -0.01]) 
                cylinder(h=h+0.02, r=r_inside, $fn=360);
        }
    }
}

module Cone(h, r1, r2, d) {
    assert(h > 0);
    assert(d > 0);
    assert(r1 > d);
    assert(r2 > d);
    difference() {
        translate([0, 0, 0]) 
            cylinder(h=h, r1=r1, r2=r2, $fn=360);
        translate([0, 0, -0.01]) 
            cylinder(h=h+0.02, r1=r1-d, r2=r2-d, $fn=360);
    }
}
module Ring(h, rout, rin) {
    assert(rout > rin);
    Cylinder(h, rout, rout-rin);
}

module CameraBottom() {
    difference() {
        union() {
            difference() {
                union() {
                    rotate([0, 90, 0]) 
                        Can(body_length, body_r, body_thickness);
                    translate([body_screw_offx, body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    translate([body_screw_offx, -body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    translate([body_length - body_screw_offx, body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    translate([body_length - body_screw_offx, -body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    // bars to hold the Raspberry Pi
                    *translate([0, -pi_width/2 - 2, -body_offset_pi - 14])
                        cube([body_length, 10, 14]);
                    *translate([0, pi_width/2 - 8, -body_offset_pi - 14])
                        cube([body_length, 10, 14]);
                }
                
                translate([body_screw_offx, body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);
                translate([body_screw_offx, -body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);
                translate([body_length - body_screw_offx, body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);
                translate([body_length - body_screw_offx, -body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);

                // the holes for the inserts ti fix the Raspberry Pi
                *translate([11, -pi_width / 2, -body_offset_pi - 6]) { 
                    translate([3.5, 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                    translate([3.5, pi_width - 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                    translate([pi_length1 - 3.5, 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                    translate([pi_length1 - 3.5, pi_width - 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                }
                
                // carve out the whole for the camera
                translate([body_length/2 + 18, 0, -106]) 
                    cylinder(h=100.2, r=r_camera + 2.1, $fn=360);
                // carve out the whole for the connector
                translate([-0.01, 0, 0]) 
                    rotate([0, 90, 0]) 
                    cylinder(h=4, r=cone_r1+1.4, $fn=8);
                // remove the top half
                d = 2 * body_r + 6;
                translate([-0.01, -d/2 - 0.01, -body_offset_halfs + 0.01]) 
                    cube([body_length + .02, d + 0.02, d/2 + body_offset_halfs + 0.01]);
            }
            // border between top and bottom half
            dx = sqrt((body_r - 3) * (body_r - 3) - body_offset_halfs * body_offset_halfs);
            *translate([3, dx - 2, -12])
                cube([body_length-6, 2, 1]);
            *translate([3, -dx, -12])
                cube([body_length-6, 2, 1]);
            *translate([3, -dx, -6 - body_offset_halfs])
                cube([2, 2 * dx, 7]);
            *translate([body_length - 3 - 2, -dx, -6 - body_offset_halfs])
                cube([2, 2 * dx, 7]);
            
        }
        // remove the parts of the bars that stick out
        translate([-0.01, 0, 0])
        rotate([0, 90, 0]) 
            Cylinder(body_length + 0.02, body_r + 10, 10);

    }
}

module CameraBottomGS() {
    difference() {
        union() {
            difference() {
                union() {
                    rotate([0, 90, 0]) 
                        Can(body_length, body_r, body_thickness);
                    translate([body_screw_offx, body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    translate([body_screw_offx, -body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    translate([body_length - body_screw_offx, body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    translate([body_length - body_screw_offx, -body_screw_offy, -body_r - 0.7])
                        Cylinder2(body_r, 1.7, 4.1);
                    // bars to hold the Raspberry Pi
                    *translate([0, -pi_width/2 - 2, -body_offset_pi - 14])
                        cube([body_length, 10, 14]);
                    *translate([0, pi_width/2 - 8, -body_offset_pi - 14])
                        cube([body_length, 10, 14]);
                }
                
                translate([body_screw_offx, body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);
                translate([body_screw_offx, -body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);
                translate([body_length - body_screw_offx, body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);
                translate([body_length - body_screw_offx, -body_screw_offy, -body_r - 10])
                    cylinder(h=body_r, r=kM3Dimensions[kDiameterHead]/2 + 0.2, $fn=360);

                // the holes for the inserts ti fix the Raspberry Pi
                *translate([11, -pi_width / 2, -body_offset_pi - 6]) { 
                    translate([3.5, 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                    translate([3.5, pi_width - 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                    translate([pi_length1 - 3.5, 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                    translate([pi_length1 - 3.5, pi_width - 3.5, -0.01]) cylinder(h=10.02, r=4.6/2, $fn=360);
                }
                
                // carve out the whole for the camera
                translate([body_length/2 + 18, 0, -86]) 
                    cylinder(h=100.2, r=r_camera_gs + 2.1, $fn=360);
                // carve out the whole for the connector
                translate([-0.01, 0, 0]) 
                    rotate([0, 90, 0]) 
                    cylinder(h=4, r=cone_r1+1.4, $fn=8);
                // remove the top half
                d = 2 * body_r + 6;
                translate([-0.01, -d/2 - 0.01, -body_offset_halfs + 0.01]) 
                    cube([body_length + .02, d + 0.02, d/2 + body_offset_halfs + 0.01]);
            }
            // border between top and bottom half
            dx = sqrt((body_r - 3) * (body_r - 3) - body_offset_halfs * body_offset_halfs);
            *translate([3, dx - 2, -12])
                cube([body_length-6, 2, 1]);
            *translate([3, -dx, -12])
                cube([body_length-6, 2, 1]);
            *translate([3, -dx, -6 - body_offset_halfs])
                cube([2, 2 * dx, 7]);
            *translate([body_length - 3 - 2, -dx, -6 - body_offset_halfs])
                cube([2, 2 * dx, 7]);
            
        }
        // remove the parts of the bars that stick out
        translate([-0.01, 0, 0])
        rotate([0, 90, 0]) 
            Cylinder(body_length + 0.02, body_r + 10, 10);

    }
}


module Wing(width, height, length)
{
    union() {
        translate([(length - height)/2, 0, height/2])
            rotate([-90, 0, 0])
            cylinder(h=width, d=height, $fn=360);
        translate([-(length - height)/2, 0, 0])
            cube([length - height, width, height]);
        translate([-(length - height)/2, 0, height/2])
            rotate([-90, 0, 0])
            cylinder(h=width, d=height, $fn=360);
    }
}

module CameraTop() {
    difference() {
        e = (body_length - cablehanger_length) / 2;
        union() {
            rotate([0, 90, 0]) 
                Can(body_length, body_r, body_thickness);
            
            // support for inserts for the cablehanger
            for (i = [0 : 3]) {
                translate([e + 4 + i * cablehanger_dx / 3, 0, body_r - 9 - 0.5]) 
                    rotate([0, 0, 0]) 
                    cylinder(h=9, r=5, $fn=360);
            }
            *translate([e + 4 + 1 * cablehanger_dx / 3, 0, body_r - 9 - 0.5]) 
                rotate([0, 0, 0]) 
                cylinder(h=9, r=5, $fn=360);
            *translate([e + 4 + 2 * cablehanger_dx / 3, 0, body_r - 9 - 0.5]) 
                rotate([0, 0, 0]) 
                cylinder(h=9, r=5, $fn=360);
            *translate([e + 4 + 3 * cablehanger_dx / 3, 0, body_r - 9 - 0.5]) 
                rotate([0, 0, 0]) 
                cylinder(h=9, r=5, $fn=360);

            translate([body_length/2, body_r-0.01, 0]) 
                Wing(8, 3, 40);
            translate([body_length/2, -body_r - 8 + 0.01, 0]) 
                Wing(8, 3, 40);
            
            difference() {
                union() {
                    translate([body_screw_offx, body_screw_offy, 0.7])
                        Cylinder(body_r, 4, 2);
                    translate([body_screw_offx, -body_screw_offy, 0.7])
                        Cylinder(body_r, 4, 2);
                    translate([body_length - body_screw_offx, body_screw_offy, 0.7])
                        Cylinder(body_r, 4, 2);
                    translate([body_length - body_screw_offx, -body_screw_offy, 0.7])
                        Cylinder(body_r, 4, 2);
                }
                // remove the parts of the bars that stick out
                translate([-0.01, 0, 0])
                    rotate([0, 90, 0]) 
                    Cylinder(body_length + 0.02, body_r + 10, 10);
            }
        }
        // carve out the whole for the connector
        translate([-0.01, 0, 0]) 
            rotate([0, 90, 0]) 
            cylinder(h=4, r=cone_r1+1.4, $fn=8);
        
        // remove the bottom half
        d = 2 * body_r + 6;
        translate([-0.01, -d/2 - 0.01, -d - body_offset_halfs - 0.01]) 
            cube([body_length + .02, d + 0.02, d + 0.02]);
        
        // holes for inserts for the cablehanger
        for (i = [0 : 3]) {
            translate([e + 4 + i * cablehanger_dx / 3, 0, body_r - 9 +1]) 
                rotate([0, 0, 0]) 
                cylinder(h=9, r=4.3/2, $fn=360);
        }
    }
}


module CableHangerArm() {
    dy = wheel_r + cable_r;
    dx_cube = (2 * arm_r - 8) / 2;
    difference() {
        union() {
            translate([0, dy, 0]) 
                cylinder(h=cablehanger_x, r=arm_r, $fn=360);
            translate([0, -dy, 0]) 
                cylinder(h=cablehanger_x, r=arm_r, $fn=360);
            translate([-dx_cube, -dy, 0])
                cube([8, 2 * wheel_r + 2 * cable_r, cablehanger_x]); 
            translate([0, dy + arm_r + 2, cablehanger_x/2]) 
                rotate([90, 0, 0])
                cylinder(h=arm_r + 2, r=arm_r, $fn=360);
        }    
        translate([0, dy, -0.01]) {
            cylinder(h=cablehanger_x + 0.02, r=cable_r, $fn=360);
        }
        translate([0, -dy, -0.01]) {
            //cylinder(h=cablehanger_x + 0.02, r=tube_r, $fn=360);
            cylinder(h=cablehanger_x + 0.02, r=cable_r, $fn=360);
        }
        dx = 3;
        d = 1.5;
        w = 2 * cable_r - d;
        translate([0, dy - cable_r + d, -0.01]) {
            cube([6.01, w, cablehanger_x - dx]);
        }
        translate([0, dy - cable_r, dx + 0.01]) {
            cube([6.01, w, cablehanger_x - dx]);
        }
        translate([0, -dy - cable_r, -0.01]) {
            cube([6.01, w, cablehanger_x - dx]);
        }
        translate([0, -dy + cable_r - w, dx + 0.01]) {
            cube([6.01, w, cablehanger_x - dx]);
        }
        translate([0, dy + 4.99 + 4, cablehanger_x/2]) 
        rotate([90, 0, 0])
            cylinder(h=9.02, r=4.0/2, $fn=360);
    }
}

module CableHanger() {
    translate([0, 0, arm_r]) 
    rotate([0, 90, 0]) 
    difference() {
        union() {
            CableHangerArm();
            dx_cube = (2 * arm_r - 8) / 2;
            translate([-dx_cube, -4, 0])
                cube([8, 8, cablehanger_dx + cablehanger_x]); 
            translate([0, 0, cablehanger_dx])
                CableHangerArm();
        }
    }
}


module WheelInterior() {
    color("lightgrey")
    linear_extrude(height = wheel_inner_h)
       import(file = "cablebot-v3.dxf", layer = "wheel-interior", $fn=360); 
}

module WheelExterior() {
    color("lightgrey")
    linear_extrude(height = wheel_outer_h)
       import(file = "cablebot-v3.dxf", layer = "wheel-exterior", $fn=360); 
}

module Wheel() {
    union() {
        translate([0, 0, 1.5])
            WheelExterior();
        translate([0, 0, -1.5])
            WheelInterior();
        translate([0, 0, -1.5 - 2])
            WheelExterior();
    }
}

module Bearing() {
        color("beige")
        difference() {
            union() {
                translate([0, 0, 0]) 
                    cylinder(h=bearing_h2, r=bearing_r2, $fn=360);
                translate([0, 0, 0]) 
                    cylinder(h=bearing_h1, r=bearing_r3, $fn=360);
            }
            translate([0, 0, -0.01]) cylinder(h=4.02, r=bearing_r1, $fn=360);
        }
}

module Frame(size, d, h) {
    difference() {
        cube([size, size, h]);
        translate([d, d, -0.01]) cube([size-2*d, size-2*d, h+0.02]);
    }
}

module MotorCoverBottom() {
    dz1 = wheel_inner_h/2 + wheel_outer_h + wheel_spacing_bottom;
    union() {
        difference() {
            union() {
                 translate([-motorbox_size/2, -motorbox_size/2, 0]) 
                    cube([motorbox_size, motorbox_size, motorbox_height]);
                // ring for connector
                translate([motorbox_size/2 - 0.01, 0, motorbox_height - cable_z + dz1]) 
                    rotate([0, 90, 0]) 
                    Ring(1.01, cone_r2i + 2, cone_r2i + 0.7);            
                
                // For the Slide
//                translate([motorbox_size/2, -body_r - 3, motorbox_height - cable_z + dz1 - 32 + 15]) 
//                    rotate([0, -90, 0])
//                    cylinder(h=5, d=12, $fn=360);
//                translate([motorbox_size/2, body_r + 3, motorbox_height - cable_z + dz1 - 32 + 15]) 
//                    rotate([0, -90, 0])
//                    cylinder(h=5, d=12, $fn=360);
            }
            d = motorbox_size - 2 * motorbox_thickness;
            // carve inside
            translate([-d/2, -d/2, 2]) cube([d, d, motorbox_height]);
            // carve space for arm
            translate([-100, -10.1, motorbox_height-3.05]) 
                cube([100, 20.2, 3.1]);            
            // carve space for cables going to connector
            translate([motorbox_size/2 - 4, 0, motorbox_height - cable_z + dz1]) 
                rotate([0, 90, 0]) 
                cylinder(h=5, r=14, $fn=360);   
            // hole for cable conduit
            translate([0, 0, -1.99]) 
                cylinder(h=6, r=conduit_r, $fn=360);
            // holes to fix the connector
            dy = cone_r2i - cone_thickness - 2 - 1; // add extra 1mm to have more depth for insert
            translate([0, dy, motorbox_height - cable_z + dz1]) 
                rotate([0, 90, 0]) 
                cylinder(h=100, r=3/2, $fn=360);
            translate([0, -dy, motorbox_height - cable_z + dz1]) 
                rotate([0, 90, 0]) 
                cylinder(h=100, r=3/2, $fn=360);    

            // For the Slide
            translate([motorbox_size/2 + 0.1, -body_r - 3, motorbox_height - cable_z + dz1 - 42]) 
                rotate([0, -90, 0])
                cylinder(h=5.2, d=4, $fn=360);
            translate([motorbox_size/2 + 0.1, body_r + 3, motorbox_height - cable_z + dz1 - 42]) 
                rotate([0, -90, 0])
                cylinder(h=5.2, d=4, $fn=360);
        }
        
        // Small border to clips into the top piece
        size = motorbox_size - 2 * (motorbox_thickness - 1);
        translate([-size/2, -size/2, motorbox_height]) {
            difference() { 
                Frame(size, 1, 1);
                // unfortunately, we have to remove some space for the arm
                translate([-10, size/2 - 10.1, -0.1]) 
                    cube([20, 20.2, 10]);   
            }
        }
        
        // four cylinders for the fixation screws
        translate([-motorbox_size/2 + motorbox_thickness + 4, 
                    -motorbox_size/2 + motorbox_thickness + 4, 0]) {
            Cylinder2(motorbox_height - 3.1, 2, 4.1); 
        }
        difference() {
            translate([motorbox_size/2 - motorbox_thickness - 4, 
                        -motorbox_size/2 + motorbox_thickness + 4, 0]) {
                Cylinder2(motorbox_height - 3.1, 2, 4.1); 
            }   
            translate([motorbox_size/2, -body_r - 3, motorbox_height - cable_z + dz1 - 42]) {
                // Screw to fix the slide
                rotate([0, -90, 0])
                    translate([0, 0, 7.4]) 
                    M3(20, -Z, 0, 0, 1);
            }
        }
        difference() {
            translate([motorbox_size/2 - motorbox_thickness - 4, 
                        motorbox_size/2 - motorbox_thickness - 4, 0]) {
                Cylinder2(motorbox_height - 3.1, 2, 4.1);
            }
            translate([motorbox_size/2, body_r + 3, motorbox_height - cable_z + dz1 - 42]) {
                // Screw to fix the slide
                rotate([0, -90, 0])
                    translate([0, 0, 7.4])
                    M3(20, -Z, 0, 0, 1);
            }
        }
        translate([-motorbox_size/2 + motorbox_thickness + 4, 
                        motorbox_size/2 - motorbox_thickness - 4, 0]) {
            Cylinder2(motorbox_height - 3.1, 2, 4.1); 
        }
        
        difference() {
            dz = 0; //motorbox_height - cable_z + dz1 - 12;
            union() {
                translate([-motorbox_size/2 - 11, 0, dz]) 
                    cylinder(h=12, r=10, $fn=360);
                translate([-motorbox_size/2 - 11, -10, dz]) 
                    cube([11.1, 20, 12]);
            }
            translate([-motorbox_size/2 -11, 0, dz + kM5Dimensions[kHeightHead]])
                M5(20, Z, 0.2, 0, 0.1);
        }
        
        // For the Slide
        translate([motorbox_size/2, -body_r - 3, motorbox_height - cable_z + dz1 - 42]) 
            rotate([0, -90, 0])
            difference() {
                Cylinder2(10.5, 0, 6); //cylinder(h=5, d=12, $fn=360);
                // Screw to fix the slide
                translate([0, 0, 7.4]) M3(20, -Z, 0, 0, 1);
            }
        translate([motorbox_size/2, body_r + 3, motorbox_height - cable_z + dz1 - 42]) 
            rotate([0, -90, 0])
            difference() {
                Cylinder2(10.5, 0, 6);
                // Screw to fix the slide
                translate([0, 0, 7.4]) M3(20, -Z, 0, 0, 1);
            }
    }
}
module MotorCoverCenter() {
    h = wheel_spacing_bottom + wheel_inner_h + 2 * wheel_outer_h + wheel_spacing_top + motorarm_h;
    zc = wheel_spacing_bottom + wheel_outer_h + wheel_inner_h / 2;
    union() {
        difference() {
            translate([-motorbox_size/2, -motorbox_size/2, 0]) 
                cube([motorbox_size, motorbox_size, h]);
            d = motorbox_size - 2 * motorbox_thickness;
            // carve inside
            translate([-d/2, -d/2, -0.01]) 
                cube([d, d, h + 0.02]);
            // carve space for arm
            translate([-100, -10.1, h - motorarm_h - 0.02]) 
                cube([100, 20.2, motorarm_h + 0.1]);   
            // holes for the cable
            translate([0, wheel_r + cable_r, zc])
                rotate([0, 90, 0])
                cylinder(h=1000, r=cable_r, $fn=360);   
            translate([0, -wheel_r - cable_r, zc])
                rotate([0, 90, 0])
                cylinder(h=1000, r=cable_r - 0.1, $fn=360);               
            // carve space for small border
            size = motorbox_size - 2 * (motorbox_thickness - 1.2);
            translate([-size/2, -size/2, -0.01]) 
                Frame(size, 1.21, 1.21);
        }
        // two cylinders for the cable guides with slit for water evacuation
        cableguide_h = 10;
        difference() {
            translate([motorbox_size/2 - 0.01, wheel_r + cable_r, zc])
                rotate([0, 90, 0])
                cylinder(h=cableguide_h, r=cable_r+2, $fn=360);   
            translate([motorbox_size/2 - 0.02, wheel_r + cable_r, zc])
                rotate([0, 90, 0])
                cylinder(h=cableguide_h + 2, r=cable_r+0.25, $fn=360);   
            translate([motorbox_size/2 - 0.02, wheel_r + cable_r - 0.5, zc - 5])
                cube([cableguide_h + 2, 1, 5]);   
        }
        difference() {
            translate([motorbox_size/2 - 0.01, -wheel_r - cable_r, zc])
                rotate([0, 90, 0])
                cylinder(h=cableguide_h, r=cable_r+2, $fn=360);   
            translate([motorbox_size/2 - 0.02, -wheel_r - cable_r, zc])
                rotate([0, 90, 0])
                cylinder(h=cableguide_h + 2, r=cable_r+0.25, $fn=360);   
            translate([motorbox_size/2 - 0.02, -wheel_r - cable_r - 0.5, zc - 5])
                cube([cableguide_h + 2, 1, 5]);   
        }

        // four cylinders for the fixation screws
        translate([-motorbox_size/2 + motorbox_thickness + 4, 
                    -motorbox_size/2 + motorbox_thickness + 4, 0]) 
                Cylinder2(h, 1.6, 4.1);
        translate([-motorbox_size/2 + motorbox_thickness + 4, 
                    motorbox_size/2 - motorbox_thickness - 4, 0]) 
                Cylinder2(h, 1.6, 4.1);
        r_reduc = 3;
        difference() {
            union() {
                translate([motorbox_size/2 - motorbox_thickness - 4, 
                            -motorbox_size/2 + motorbox_thickness + 4, 0]) 
                    cylinder(h=h, r=r_reduc, $fn=360);
                translate([motorbox_size/2 - motorbox_thickness - 4, 
                            -motorbox_size/2 + motorbox_thickness + 4 - r_reduc, 1.21]) 
                    cube([6, 2*r_reduc, h-1.21]);
            }
            translate([motorbox_size/2 - motorbox_thickness - 4, 
                        -motorbox_size/2 + motorbox_thickness + 4, 
                        -0.01]) 
                cylinder(h=h+0.02, r=1.6, $fn=360);
        }
        difference() {
            union() {
                translate([motorbox_size/2 - motorbox_thickness - 4, 
                            motorbox_size/2 - motorbox_thickness - 4, 0]) 
                    cylinder(h=h, r=r_reduc, $fn=360);
                translate([motorbox_size/2 - motorbox_thickness - 4, 
                            motorbox_size/2 - motorbox_thickness - 4 - r_reduc, 1.21]) 
                    cube([6, 2*r_reduc, h - 1.21]);
            }
            translate([motorbox_size/2 - motorbox_thickness - 4, 
                        motorbox_size/2 - motorbox_thickness - 4, 
                        -0.01]) 
                cylinder(h=h+0.02, r=1.6, $fn=360);
        }
        
        // Small border to clips into the top piece
        size = motorbox_size - 2 * (motorbox_thickness - 1);
        translate([-size/2, -size/2, h]) 
            difference() { 
                Frame(size, 1, 1);
                // unfortunately, we have to remove some space for the arm
                translate([-10, size/2 - 10.1, -0.1]) 
                    cube([20, 20.2, 10]);   
            }
    }
}


module MotorCoverTop() {
    height = 15;
    h = wheel_spacing_bottom + wheel_inner_h + 2 * wheel_outer_h + bearing_h1 + motorarm_h;
    size = motorbox_size - 2 * (motorbox_thickness - 1.2);
    union() {
        difference() {
            translate([-motorbox_size/2, -motorbox_size/2, 0]) 
                cube([motorbox_size, motorbox_size, height]);
            d = motorbox_size - 2 * motorbox_thickness;
            // carve inside
            translate([-d/2, -d/2, -0.01]) 
                cube([d, d, height - 5 + 0.01]);
            // carve space for small border
            translate([-size/2, -size/2, -0.01]) 
                Frame(size, 1.21, 1.21);
            
            // carve space for screws
            translate([-motorbox_size/2 + motorbox_thickness + 4, 
                        -motorbox_size/2 + motorbox_thickness + 4, 
                        height - kM3Dimensions[kHeightHead]]) 
                M3(10, -Z, 0.1, 0.2, 1.01);
            translate([motorbox_size/2 - motorbox_thickness - 4, 
                        -motorbox_size/2 + motorbox_thickness + 4, 
                        height - kM3Dimensions[kHeightHead]]) 
                M3(10, -Z, 0.1, 0.2, 0.01);
            translate([motorbox_size/2 - motorbox_thickness - 4, 
                        motorbox_size/2 - motorbox_thickness - 4, 
                        height - kM3Dimensions[kHeightHead]]) 
                M3(10, -Z, 0.1, 0.2, 0.01);
            translate([-motorbox_size/2 + motorbox_thickness + 4, 
                        motorbox_size/2 - motorbox_thickness - 4, 
                        height - kM3Dimensions[kHeightHead]]) 
                M3(10, -Z, 0.1, 0.2, 0.01);
            
            // to fix the umbrella
            translate([size/2 - motorbox_thickness, -14, height-10]) 
                M3(20, X, 0, 0, 0);
            translate([size/2 - motorbox_thickness, 14, height-10]) 
                M3(20, X, 0, 0, 0);

        }
                
        // cylinder around the axis, to keep the arm in place
        translate([0, 0, 0.50]) 
            Cylinder(height - 0.5, bearing_r3, bearing_r3-4.5);
            
        // four cylinders for the fixation screws
        translate([-motorbox_size/2 + motorbox_thickness + 4, 
                    -motorbox_size/2 + motorbox_thickness + 4, 0]) 
            Cylinder2(height-4, 1.6, 3.95); 
        translate([motorbox_size/2 - motorbox_thickness - 4, 
                    -motorbox_size/2 + motorbox_thickness + 4, 0]) 
            Cylinder2(height-4, 1.6, 3.95); 
        translate([motorbox_size/2 - motorbox_thickness - 4, 
                    motorbox_size/2 - motorbox_thickness - 4, 0]) 
            Cylinder2(height-4, 1.6, 3.95); 
        translate([-motorbox_size/2 + motorbox_thickness + 4, 
                    motorbox_size/2 - motorbox_thickness - 4, 0]) 
            Cylinder2(height-4, 1.6, 3.95);         

        // reinforcement for the screws that fix the umbrella
        translate([size/2 + 1.4 - motorbox_thickness - 3, -24, 1.5])
            difference() {  
                cube([3, 20, 12]);
                translate([0, 10, height - 10 - 1.5])
                    M3(20, X);
            }
        translate([size/2 + 1.4 - motorbox_thickness - 3, 4, 1.5])
            difference() {  
                cube([3, 20, 12]);
                translate([0, 10, height - 10 - 1.5])
                    M3(20, X);
            }
    }
}

module Motor() {
    eh = lookup(NemaRoundExtrusionHeight, Nema23);
    dz = -motorarm_h - wheel_inner_h/2 - wheel_outer_h - wheel_spacing_bottom + eh;
    motor(model=Nema23, size=NemaLong, dualAxis=true, 
            pos=[0, 0, dz], orientation = [0, 180, 0]);
}

module MotorArm1() {
    color("lightgrey")
    linear_extrude(height = motorarm_h)
       import(file = "cablebot-v3.dxf", layer = "arm-1", $fn=360); 
}

module MotorArm2() {
    color("lightgrey")
    linear_extrude(height = motorarm_h)
       import(file = "cablebot-v3.dxf", layer = "arm-2", $fn=360); 
}

module MotorAssembly() {
    Wheel();
    Motor();
    
    dz1 = motorarm_h + wheel_inner_h/2 + wheel_outer_h + wheel_spacing_bottom;
    translate([0, 0, -dz1])
        MotorArm1();

    dz2 = wheel_inner_h/2 + wheel_outer_h + wheel_spacing_top;
    translate([0, 0, dz2 - bearing_h1]) 
        Bearing();

    translate([0, 0, dz2]) 
        MotorArm2();
    
}

module BaseStation() {
    dx = cone_height_pogo_extrusion + cone_depth + innercone_extra_depth + motorbox_size/2;
    translate([dx, 0, 0]) 
        ConnectorChargerInner();

    translate([0, 0, cable_z]) {
        *translate([0, 0, 0])
            MotorAssembly();

        dz1 = wheel_inner_h/2 + wheel_outer_h + wheel_spacing_bottom;
        translate([0, 0, -motorbox_height - dz1]) 
            MotorCoverBottom();

        translate([0, 0, -dz1]) 
            MotorCoverCenter();
        
        dz2 = wheel_inner_h/2 + wheel_outer_h + bearing_h1 + motorarm_h;
        translate([0, 0, dz2]) 
            MotorCoverTop();
        
        translate([motorbox_size/2, 0, dz2 + 15]) 
            Umbrella();
        
        translate([motorbox_size/2, 0, -cable_z]) 
            Slide();

    }
    
    x = -motorbox_size/2 - 11.8 + 0.1; // FIXME
    z = cable_z + wheel_inner_h/2 + wheel_outer_h + bearing_h1 + motorarm_h + 10;
    translate([x, 0, z])
        M5(70, -Z);
}

module Hinge() {
    width = 20;
    t = wheel_spacing_bottom + wheel_outer_h + wheel_inner_h/2;
    dz0 = 0;
    h0 = cable_z - t - motorarm_h - 0.1;
    dz1 = cable_z - t;
    h1 = wheel_spacing_bottom + wheel_inner_h + 2 * wheel_outer_h + wheel_spacing_top;
    dz2 = dz1 + h1 + motorarm_h;
    h2 = 10;
    //h3 = h2 + dz2 + 12 + 2 * 14;
    h3 = motorbox_height + h1 + motorarm_h + h2 + 2 * 15;
    
    difference()  {
        union() {
            dx = 14;

            translate([0, 0, h0 - 18 - 0.1])
                cylinder(h=18, r=width/2, $fn=360);
            translate([-dx, -width/2, h0 - 18 - 0.1])
                cube([dx, width, 18]);

            translate([0, 0, dz1])
                cylinder(h=h1, r=width/2, $fn=360);
            translate([-dx, -width/2, dz1])
                cube([dx, width, h1]);
            
            translate([0, 0, dz2])
                cylinder(h=h2, r=width/2, $fn=360);
            translate([-dx, -width/2, dz2])
                cube([dx, width, h2]);

            translate([0, 0, -motorbox_height - t + cable_z + 12.2])
                cylinder(h=12, r=width/2, $fn=360);
            translate([-dx, -width/2, -motorbox_height - t + cable_z + 12.2])
                cube([dx, width, 12]);
                
            thickness = 6;
            profile_width = 40;
            translate([-dx - thickness, -profile_width/2, -motorbox_height - t + cable_z - 15])
                cube([thickness, profile_width, h3]);

        }
        // Top hinge screw
        translate([0, 0, dz2 + h2 - kM5Dimensions[kHeightHead]])
            M5(40, -Z, 0.2, 0, 0.1);
        translate([0, 0, h0 - 18 + kM5LockNutDimensions[kNutHeight]])
            M5LockNut(Z, 0.2, 0.2);
        
        // Bottom hinge screw
        translate([0, 0, -motorbox_height - t + cable_z + kM5Dimensions[kHeightHead]]) // 
            M5(20, Z, 0.2, 0, 0.1);
        translate([0, 0, -motorbox_height - t + cable_z + 2 * 12.2 - kM5LockNutDimensions[kNutHeight]])
            M5LockNut(-Z, 0.2, 0.2);
        
        // Fixation screws
        translate([-14, 0, dz2 + h2 + 7])
            M5(10, -X, 0.2, 0, 0);
        translate([-14, 0, -12-5])
            M5(10, -X, 0.2, 0, 0);
        translate([-14, 0, -motorbox_height - t + cable_z - 7])
            M5(10, -X, 0.2, 0, 0);
    }
}

module PiZero() {
    color("red")
        translate([-65/2, -30/2, 0])
        cube([65, 30, 2]);
}

module Battery500mAh() {
    color("silver")
        translate([0, -15, 0])
        cube([30, 30, 6]);
}

module Battery1600mAh() {
    color("silver")
        translate([0, -15, 0])
        cube([49, 30, 10]);
}

module PowerBoost500() {
    color("red")
        translate([0, -powerboost500_width/2, 0])
        cube([powerboost500_length, powerboost500_width, 2]);
}

module PowerBoost1000() {
    color("red")
        translate([0, -powerboost1000_width/2, 0])
        cube([powerboost1000_length, powerboost1000_width, 2]);
}

module INA219() {
    color("red")
        translate([-ina219_length/2, -ina219_width/2, 0])
        difference() {
            dx = (ina219_length - ina219_d1) / 2;
            dy = (ina219_width - ina219_d2) / 2;
            cube([ina219_length, ina219_width, 2]);
            translate([0, 0, -0.1]) {
                translate([dx, dy, -0.1]) cylinder(h=3, r=ina219_r, $fn=360);
                translate([ina219_length-dx, dy, -0.1]) cylinder(h=3, r=ina219_r, $fn=360);
                translate([dx, ina219_width-dy, -0.1]) cylinder(h=3, r=ina219_r, $fn=360);
                translate([ina219_length-dx, ina219_width-dy, -0.1]) cylinder(h=3, r=ina219_r, $fn=360);
            }
        }
}

module INA260() {
    color("red") 
        translate([-ina260_length/2, -ina260_width/2, 0])
        difference() {
            dx = (ina260_length - ina260_d) / 2;
            cube([ina260_length, ina260_width, 2]);
            translate([0, 0, -0.1]) {
                translate([dx, dx, -0.1]) cylinder(h=3, r=ina260_r, $fn=360);
                translate([ina260_length-dx, dx, -0.1]) cylinder(h=3, r=ina260_r, $fn=360);
            }
        }
}

module ScaffoldingBase() {
    translate([-scaffold_length/2, -scaffold_width/2, 0]) {
        difference() {
            cube([scaffold_length, scaffold_width, scaffold_thickness]);
            translate([scaffold_section, scaffold_section, -0.01])
                cube([scaffold_length - 2 * scaffold_section, 
                        scaffold_width - 2 * scaffold_section, scaffold_thickness + 0.02]);
            
            insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
            insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
            translate([scaffold_length - scaffold_insert_offset_x, scaffold_width - scaffold_insert_offset_y, 0]) 
                M3(20, Z, 0, 0, 0);
            translate([scaffold_insert_offset_x, scaffold_width - scaffold_insert_offset_y, 0]) 
                M3(20, Z, 0, 0, 0);
            translate([scaffold_length - scaffold_insert_offset_x, scaffold_insert_offset_y, 0]) 
                M3(20, Z, 0, 0, 0);
            translate([scaffold_insert_offset_x, scaffold_insert_offset_y, 0]) 
                M3(20, Z, 0, 0, 0);
       }
    }
}

module ScaffoldingPiZero() { // For Raspberry Pi Zero
    union() {
        ScaffoldingBase();

            // spacers for the pi board
//        r0 = 4/2;
//        translate([-pi_length1/2 + 3.5, -pi_width/2 + 3.5, -0.01])
//            cylinder(h=scaffold_thickness + 2, r=r0, $fn=360);
//        translate([pi_length1/2 - 3.5, -pi_width/2 + 3.5, -0.01])
//            cylinder(h=scaffold_thickness + 2, r=r0, $fn=360);
//        translate([pi_length1/2 - 3.5, pi_width/2 - 3.5, -0.01])
//            cylinder(h=scaffold_thickness + 2, r=r0, $fn=360);
//        translate([-pi_length1/2 + 3.5, pi_width/2 - 3.5, -0.01])
//            cylinder(h=scaffold_thickness + 2, r=r0, $fn=360);

        r1 = 2.76/2;
        translate([-pi_length1/2 + 3.5, -pi_width/2 + 3.5, -0.01])
            cylinder(h=10, r=r1, $fn=360);
        translate([pi_length1/2 - 3.5, -pi_width/2 + 3.5, -0.01])
            cylinder(h=10, r=r1, $fn=360);
        translate([pi_length1/2 - 3.5, pi_width/2 - 3.5, -0.01])
            cylinder(h=10, r=r1, $fn=360);
        translate([-pi_length1/2 + 3.5, pi_width/2 - 3.5, -0.01])
            cylinder(h=10, r=r1, $fn=360);
            
        // Spacers
        insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
        insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
        translate([insert_dx, insert_dy, 0.01]) 
            Cylinder(13.99, 2.5, 1);
        translate([insert_dx, -insert_dy, 0.01]) 
            Cylinder(13.99, 2.5, 1);
        translate([-insert_dx, insert_dy, 0.01]) 
            Cylinder(13.99, 2.5, 1);
        translate([-insert_dx, -insert_dy, 0.01]) 
            Cylinder(13.99, 2.5, 1);
    }
}


module ScaffoldingPowerBoost500() { // For battery and battery charger
    union() {
        difference() {
            ScaffoldingBase();
            
            insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
            insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
            translate([insert_dx, -insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0, 1);
            translate([insert_dx, insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0, 0);
            translate([-insert_dx, -insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0, 0);
            translate([-insert_dx, insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0, 0);
        }
                
        x0 = scaffold_length/2 - scaffold_extension + 1.5;

        s = 5;
        translate([-x0, 0, 0]) {
            translate([0.1 * inch, -powerboost500_d1/2, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([0.1 * inch, powerboost500_d1/2, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([0.1 * inch, -powerboost500_d1/2, -0.01])
                cylinder(h=scaffold_thickness + 5, r=0.1*inch/2, $fn=360);
            translate([0.1 * inch, powerboost500_d1/2, -0.01])
                cylinder(h=scaffold_thickness + 5, r=0.1*inch/2, $fn=360);
        }
        
        d_holes = 0.5 * inch; // TODO: measure
        
        translate([-x0 + powerboost500_length, 0, 0]) {
            translate([-0.1 * inch, -powerboost500_d1/2, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([-0.1 * inch, powerboost500_d1/2, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([-0.1 * inch, -d_holes/2, -0.01])
                cylinder(h=scaffold_thickness + 5, r=0.1*inch/2, $fn=360);
            translate([-0.1 * inch, d_holes/2, -0.01])
                cylinder(h=scaffold_thickness + 5, r=0.1*inch/2, $fn=360);
        }
    }
}

module ScaffoldingPowerBoost1000() { // For battery and battery charger
    union() {
        difference() {
            ScaffoldingBase();
            
            insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
            insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
            translate([insert_dx, -insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0.3, 1);
            translate([insert_dx, insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0.3, 1);
            translate([-insert_dx, -insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0.3, 1);
            translate([-insert_dx, insert_dy, 1])
                rotate([0, 0, 30])
                M3LockNut(-Z, 0.3, 1);
        }

        // Add two support extrusions to lift the battery above the screws
        translate([-scaffold_extension, 
                    scaffold_width / 2 - scaffold_section, 
                    scaffold_thickness - 0.01])
            cube([scaffold_length/2, scaffold_section, 3.01]);
        translate([-scaffold_extension, 
                    -scaffold_width / 2, 
                    scaffold_thickness - 0.01])
            cube([scaffold_length/2, scaffold_section, 3.01]);
                
        x0 = scaffold_length/2 - scaffold_extension + 1.5;

        //
        s = 5;
        translate([-x0 + 1.5, 0, 0]) {                                                 // FIXME:  1.5?????
            translate([0.1 * inch, powerboost1000_length/2 - 0.1*inch, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([powerboost1000_width - 0.1 * inch, powerboost1000_length/2 - 0.1*inch, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);

            translate([0.1 * inch, powerboost1000_length/2 - 0.1*inch, -0.01])
                cylinder(h=scaffold_thickness + 5, r=0.1*inch/2, $fn=360);
            translate([powerboost1000_width - 0.1*inch, powerboost1000_length/2 - 0.1*inch, -0.01])
                cylinder(h=scaffold_thickness + 5, r=0.1*inch/2, $fn=360);
        }
        
        d2 = (powerboost1000_width - powerboost1000_d2) / 2;
        
        translate([-x0 + 1.5, 0, 0]) {
            translate([d2, -powerboost1000_length/2 + 0.1*inch, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([powerboost1000_width - d2, -powerboost1000_length/2 + 0.1*inch, -0.01])
                translate([-s/2, -s/2, 0])
                cube([s, s, scaffold_thickness]);
            translate([d2, -powerboost1000_length/2 + 0.1*inch, -0.01])
                cylinder(h=scaffold_thickness + 5, r=1, $fn=360);
            translate([powerboost1000_width - d2, -powerboost1000_length/2 + 0.1*inch, -0.01])
                cylinder(h=scaffold_thickness + 5, r=1, $fn=360);
        }
    }
}


module ScaffoldingCameraGS() {  // For camera
    difference() {
        union() {
            difference() {
                ScaffoldingBase();
                
                translate([10, 0, 0]) { // FIXME
                    // nut holes camera
                    d_holes_x = 30;
                    d_holes_y = 30;
                    offset = 0; 

                    translate([-d_holes_y/2 - offset, -d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                    translate([-d_holes_y/2 - offset, +d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                    translate([+d_holes_y/2 - offset, -d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                    translate([+d_holes_y/2 - offset, +d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);

                    // holes for status LEDS
                    /*
                    *translate([-2.6, -r_camera_gs + 2.8, -2]) 
                        cylinder(h=6, r=4.1/2, $fn=360);
                    *translate([-2.6, -r_camera_gs + 2.8, -0.1]) 
                        cylinder(h=1.7, r=5.1/2, $fn=360);
                    *translate([2.6, -r_camera_gs + 2.8, -2]) 
                        cylinder(h=6, r=4.1/2, $fn=360);
                    *translate([2.6, -r_camera_gs + 2.8, -0.1]) 
                        cylinder(h=1.7, r=5.1/2, $fn=360);
                    */
                    
                    // lens hole camera
                     translate([0, 0, -5]) 
                        cylinder(h=10, r=36.5/2, $fn=360);
                }

                
                // to fix the INA219 
                // FIXME: copy of holes below...
                
                dy = ina219_d2 / 2;
                translate([-scaffold_length/2 + scaffold_section + 1.3, 0, 0.29]) {
                        translate([0, dy, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                        translate([0, -dy, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
                
                // to fix INA260
                /*
                dx1 = (ina260_length - ina260_d) / 2;
                dx2 = ina260_d / 2;
                translate([-22, -ina260_width/2 + dx1 - 3, 0.29]) {
                        translate([-dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                        translate([dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
                translate([-22, ina260_width/2 - dx1 + 3, 0.29]) {
                        translate([-dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                        translate([dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
                */
            }
            
            
            // status LEDs
            /*
            *translate([4.4, -r_camera_gs + 3, 1.5])
                rotate([0, 180, -2])
                linear_extrude(height = 2)
                text("B", font = "Liberation Sans", size=3, $fn=360);

            *translate([18.5, -r_camera_gs + 3, 1.5])
                rotate([0, 180, -2])
                linear_extrude(height = 2)
                text("C", font = "Liberation Sans", size=3, $fn=360);
            */
            
            // to fix the INA219 
            
            translate([-scaffold_length/2 + scaffold_section, 0, 0]) {
                difference() {
                    dy = ina219_d2 / 2;
                    translate([-0.1, -scaffold_width/2, 0]) 
                        cube([7.1, scaffold_width, scaffold_thickness]);
                    translate([1.3, dy, 0.29])
                        M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                    translate([1.3, -dy, 0.29])
                        M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
            }
            
                        
            translate([10, 0, 0]) 
            difference() {
                translate([0, 0, -10]) 
                    cylinder(h=13, r=r_camera_gs + 2, $fn=360);
            
                // carve cylinder
                translate([0, 0, -10.1]) 
                    cylinder(h=10.09, r=r_camera_gs, $fn=360);

                translate([-22.5, -6.5, -0.1])
                    cube([30, 13, 5]);

                // nut holes camera  // FIXME: same holes as above, 2x...
                d_holes_x = 30;
                d_holes_y = 30;
                offset = 0; 

                translate([-d_holes_y/2 - offset, -d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                translate([-d_holes_y/2 - offset, +d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                translate([+d_holes_y/2 - offset, -d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                translate([+d_holes_y/2 - offset, +d_holes_x/2, 2]) M25(10, Z, 0, 0, 0.02);
                
                // lens hole camera
                translate([0, 0, -5]) 
                    cylinder(h=10, r=36.5/2, $fn=360);
                
                // holes for status LEDS
                /*
                translate([-2.6, -r_camera_gs + 2.8, -2]) 
                    cylinder(h=6, r=4.1/2, $fn=360);
                translate([-2.6, -r_camera_gs + 2.8, -0.1]) 
                    cylinder(h=1.7, r=5.1/2, $fn=360);
                translate([2.6, -r_camera_gs + 2.8, -2]) 
                    cylinder(h=6, r=4.1/2, $fn=360);
                translate([2.6, -r_camera_gs + 2.8, -0.1]) 
                    cylinder(h=1.7, r=5.1/2, $fn=360);
                */
            }
            
            translate([10, 0, 0]) 
            difference() {
                translate([0, 0, 0]) 
                    cylinder(h=8, r=r_camera_gs + 2, $fn=360);
            
                // carve cylinder
                translate([0, 0, 0]) 
                    cylinder(h=8.1, r=r_camera_gs, $fn=360);

                translate([-50, -21, -0.1])
                    cube([100, 42, 13.1]);
            }
        }
        
        insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
        insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
        translate([insert_dx, insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([insert_dx, -insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([-insert_dx, insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([-insert_dx, -insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
    }
}

module ScaffoldingCameraV3() {  // For camera
    difference() {
        union() {
            difference() {
                ScaffoldingBase();
                
                translate([10, 0, 0]) { // FIXME
                    // nut holes camera
                    d_holes_x = 21;
                    d_holes_y = 12.5;
                    offset = 0.2 + 12.1/2; 

                    translate([-d_holes_y/2 - offset, -d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                    translate([-d_holes_y/2 - offset, +d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                    translate([+d_holes_y/2 - offset, -d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                    translate([+d_holes_y/2 - offset, +d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);

                    // holes for status LEDS
                    translate([-2.6, -r_camera + 2.8, -2]) 
                        cylinder(h=6, r=4.1/2, $fn=360);
                    translate([-2.6, -r_camera + 2.8, -0.1]) 
                        cylinder(h=1.7, r=5.1/2, $fn=360);
                    translate([2.6, -r_camera + 2.8, -2]) 
                        cylinder(h=6, r=4.1/2, $fn=360);
                    translate([2.6, -r_camera + 2.8, -0.1]) 
                        cylinder(h=1.7, r=5.1/2, $fn=360);
                }

                
                // to fix the INA219 
                // FIXME: copy of holes below...
                
                dy = ina219_d2 / 2;
                translate([-scaffold_length/2 + scaffold_section + 3.5, 0, 0.29]) {
                        translate([0, dy, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                        translate([0, -dy, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
                
                // to fix INA260
                /*
                dx1 = (ina260_length - ina260_d) / 2;
                dx2 = ina260_d / 2;
                translate([-22, -ina260_width/2 + dx1 - 3, 0.29]) {
                        translate([-dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                        translate([dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
                translate([-22, ina260_width/2 - dx1 + 3, 0.29]) {
                        translate([-dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                        translate([dx2, 0, 0])
                            M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
                */
            }
            
            
            // status LEDs
            translate([4.6, -r_camera + 5, 1.5])
                rotate([0, 180, -2])
                linear_extrude(height = 2)
                text("BAT", font = "Liberation Sans", size=2, $fn=360);

            translate([21.5, -r_camera + 5, 1.5])
                rotate([0, 180, -2])
                linear_extrude(height = 2)
                text("CAM", font = "Liberation Sans", size=2, $fn=360);
            
            // to fix the INA219 
            
            translate([-scaffold_length/2 + scaffold_section, 0, 0]) {
                difference() {
                    dy = ina219_d2 / 2;
                    translate([-0.1, -scaffold_width/2, 0]) 
                        cube([7.1, scaffold_width, scaffold_thickness]);
                    translate([3.5, dy, 0.29])
                        M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                    translate([3.5, -dy, 0.29])
                        M25Countersunk(6, Z, 0.0, 0.1, 0.3);
                }
            }
            
                        
            translate([10, 0, 0]) 
            difference() {
                translate([0, 0, -10]) 
                    cylinder(h=13, r=r_camera+2, $fn=360);
            
                // carve cylinder
                translate([0, 0, -10.1]) 
                    cylinder(h=10.09, r=r_camera, $fn=360);

                // nut holes camera  // FIXME: same holes as above, 2x...
                d_holes_x = 21;
                d_holes_y = 12.5;
                offset = 0.2 + 12.1/2; 

                translate([-d_holes_y/2 - offset, -d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                translate([-d_holes_y/2 - offset, +d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                translate([+d_holes_y/2 - offset, -d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                translate([+d_holes_y/2 - offset, +d_holes_x/2, 2]) M2(10, Z, 0, 0, 0.02);
                
                // lens hole camera
                translate([-12.1/2, -12.1/2, -40]) cube([12.1, 12.1, 50]);
                
                // holes for status LEDS
                
                translate([-2.6, -r_camera + 2.8, -2]) 
                    cylinder(h=6, r=4.1/2, $fn=360);
                translate([-2.6, -r_camera + 2.8, -0.1]) 
                    cylinder(h=1.7, r=5.1/2, $fn=360);
                translate([2.6, -r_camera + 2.8, -2]) 
                    cylinder(h=6, r=4.1/2, $fn=360);
                translate([2.6, -r_camera + 2.8, -0.1]) 
                    cylinder(h=1.7, r=5.1/2, $fn=360);
                
            }
        }
        
        insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
        insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
        translate([insert_dx, insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([insert_dx, -insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([-insert_dx, insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([-insert_dx, -insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
    }
}

module PiModule() {

    ScaffoldingPiZero();
    *translate([0, 0, 4])
        PiZero(); // Pi is 4.5mm high + solderings at bottom

    translate([0, 0, 14])
    union() {
        x0 = scaffold_length/2 - scaffold_extension + 1.5;               // FIXME:  1.5???
        
        if (true) {
            *translate([-x0 + 13, -powerboost1000_length/2, 3])           // FIXME:  13???
                rotate([0, 0, 90])
                PowerBoost1000();
            *translate([-8, 0, 3+3])
                #Battery1600mAh();
            ScaffoldingPowerBoost1000();
        } else {
            translate([-x0, 0, 3])
                PowerBoost500();
            translate([3.5, 0, 3])
                Battery500mAh();
            ScaffoldingPowerBoost500();
        }
    }

    translate([0, 0, -8]) {
        ScaffoldingCameraGS();


        *translate([-19.5, 0, 3])
            rotate([0, 0, 0])
            INA219();
        
        translate([-22, -3, 3])
            rotate([0, 0, 0])
            INA260();
        
        
        // Spacers for Pi scaffold, printed separately
        union() {
            insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
            insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
            h = 9 - scaffold_thickness;
            translate([insert_dx, insert_dy, scaffold_thickness]) 
                Cylinder2(h, 1.6, 2.6);
            translate([insert_dx, -insert_dy, scaffold_thickness]) 
                Cylinder2(h, 1.6, 2.6);
            translate([-insert_dx, insert_dy, scaffold_thickness]) 
                Cylinder2(h, 1.6, 2.6);
            translate([-insert_dx, -insert_dy, scaffold_thickness]) 
                Cylinder2(h, 1.6, 2.6);
        }
        
        
        // Spacers for camera module, printed separately
        *union() {
            insert_dx = 0;
            insert_dy = 0;
            h = 2;
            translate([insert_dx, insert_dy, 0]) 
                Cylinder2(h, 1.1, 2.2);
            translate([insert_dx, -insert_dy, 0]) 
                Cylinder2(h, 1.1, 2.2);
            translate([-insert_dx, insert_dy, 0]) 
                Cylinder2(h, 1.1, 2.2);
            translate([-insert_dx, -insert_dy, 0]) 
                Cylinder2(h, 1.1, 2.2);
        }
    }

    *translate([0, 0, -8]) {
        insert_dx = scaffold_length/2 - scaffold_insert_offset_x;
        insert_dy = scaffold_width/2 - scaffold_insert_offset_y;
        translate([insert_dx, insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([insert_dx, -insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([-insert_dx, insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
        translate([-insert_dx, -insert_dy, scaffold_thickness - 1]) 
            M3(20, Z, 0, 0, 0);
    }
}

module CablebotCamera(x=0) {
    translate([x, 0, 0]) {
        *CameraTop();
        CameraBottomGS();
        translate([body_length/2 + 8, 0, -10]) 
            PiModule();
        e = (body_length - cablehanger_length) / 2;
        translate([e, 0, body_r]) 
            CableHanger();
        translate([body_thickness, 0, 0]) 
            ConnectorChargerOuter();
    }
}

module Cables() {
    color("lightblue") {
        translate([0, wheel_r + cable_r, cable_z])
            rotate([0, 90, 0])
            cylinder(h=5500, r=cable_r, $fn=360);   
        translate([0, -wheel_r - cable_r, cable_z])
            rotate([0, 90, 0])
            cylinder(h=5500, r=cable_r, $fn=360);               
    }
}

module Cablebot(x) {
    x0 = motorbox_size/2 + innercone_extra_depth + cone_height_pogo_extrusion - body_thickness + cone_depth;
    
    translate([-49.3, 0, 0])
        Hinge();
    
    BaseStation();
    CablebotCamera(x0 + x);
    *Cables();
}

module SlideArmRight(width) 
{
    intersection() {
        translate([0, 60, 0])
            rotate([90, 0, 0])
            linear_extrude(height = 60)
                import(file = "Slide.svg", $fn=360); 
        linear_extrude(height = 60)
            import(file = "Slide-right.svg", $fn=360); 
//        translate([5.01, 15, width/2])
//            M3(10, -X, 0, 0, 0);
    }
    
}

module SlideArmLeft(width) 
{
    intersection() {
        translate([0, 0, 0])
            rotate([90, 0, 0])
                linear_extrude(height = 60)
                import(file = "Slide.svg", $fn=360); 
        translate([0, 0, 60])
            rotate([180, 0, 0])
            linear_extrude(height = 60)
                import(file = "Slide-right.svg", $fn=360); 
//        translate([5.01, 15, width/2])
//            M3(10, -X, 0, 0, 0);
    }
}

module Slide() {
    h = 7;
    difference() {
        union() {
            translate([0, body_r, -60])
                SlideArmRight(h);
            translate([0, -body_r, -60])
                SlideArmLeft(h);

            translate([0, -body_r - 0.4, -body_r - 3.8 - 28])
                difference() {
                    cube([6, 2*body_r + 2 * 0.4, 45]);
                    translate([-0.1, body_r + 0.4, cable_z + 10])
                        rotate([0, 90, 0])
                        cylinder(h=7, r=body_r + 0.2, $fn=360);
                    translate([-0.1, 0, cable_z + 10])
                        cube([7, 2*body_r + 2 * 0.4, 22.5]);
                }
        }
        translate([6, body_r + 3.5, -42])
            M3(10, -X, 0.6, 0, 0);
        translate([6, -body_r - 3.5, -42])
            M3(10, -X, 0.6, 0, 0);
    }
}


umbrella_thickness = 2;
umbrella_length = body_length + 10 + 30;
umbrella_r = motorbox_size/2 + 10;
umbrella_r_out = umbrella_r + umbrella_thickness;

module UmbrellaSupport() {
    len = umbrella_length/2 + motorbox_size;
    translate([-motorbox_size, 0, 0])
        union() {
            intersection() {
                translate([0, 0, 0])
                    rotate([0, 90, 0])
                    Cylinder2(len, umbrella_r - 3, umbrella_r - 0.2); 
                translate([0, -10, umbrella_r-5])
                    cube([len, 20, 10]);
            }
            translate([0, -10, umbrella_r-5])
                cube([len, 20, 3]);
        }
}



module UmbrellaSurface() {
    rotate([0, 90, 0]) {
        rotate([0, 0, 90]) {
            union() {
                linear_extrude(height = 4)
                   import(file = "cablebot-v3.dxf", layer = "umbrella-2", $fn=360); 
                linear_extrude(height = umbrella_length)
                   import(file = "cablebot-v3.dxf", layer = "umbrella-1", $fn=360); 
                *linear_extrude(height = umbrella_length - 30)
                   import(file = "cablebot-v3.dxf", layer = "umbrella-3", $fn=360); 
            }
        }
    }
}

module UmbrellaFix() {
    difference() {
        union() {
            translate([0, -6, -4])
                cube([8, 12, 12]);
        }
        translate([-0.1, 0, 0])
            M3(20, X, 0, 0, 0);
        translate([4.1, 0, 0])
            M3LockNut(-X);
    }
}

module Umbrella() {
    difference() {
        union() {
            UmbrellaSurface();
            translate([0, 14, -10]) {
                UmbrellaFix();
            }
            translate([0, -14, -10]) {
                UmbrellaFix();
            }
        }
    }
}

function position_at(t) = (t < 0.5)? 2 * t * 5000 : (2 - 2 * t) * 5000;

// All
*Cablebot(position_at($t) + 0);
*CablebotCamera();
*PiModule();

// For export/printing
// Camera components
*CameraTop();
*CameraBottom();
*CameraBottomGS();
*ConnectorChargerOuter();
*CableHanger();
*ScaffoldingPiZero();
*ScaffoldingPowerBoost1000();
*ScaffoldingCameraV3();
ScaffoldingCameraGS();
*Cylinder2(h, 1.6, 2.6); // Spacer ScaffoldingCamera 
*Cylinder2(h, 1.1, 2.2); // Spacer ScaffoldingCamera (camera)

// Base station components
*ConnectorChargerInner();
*MotorCoverBottom();
*MotorCoverCenter();
*MotorCoverTop();
*Hinge();
*Slide();
*Umbrella();

// WheelSpacerBottom
*Ring(3.5, 10/2, 8.2/2);

// WheelSpacerTop
*Ring(4, 10/2, 8.2/2);

*Wing(4, 3, 20);



