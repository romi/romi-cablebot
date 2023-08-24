
// Mill-Max Manufacturing Corp.
// Product Number 868-10-003-00-012000	
// https://www.mill-max.com/catalog/download/2019-12%3A019.78.pdf
// https://www.mill-max.com/catalog/download/2018-09:019.79M_0.pdf
// 
module Pogo3Female() {
    outerHeight = 6.91 - 3.15;
    translate([0, 0, -outerHeight])
    color("black")
    linear_extrude(height = outerHeight)
       import(file = "PogoPins.dxf", layer = "P3-outer", $fn=360); 

    color("black")
    linear_extrude(height = 3.15)
       import(file = "PogoPins.dxf", layer = "P3-inner", $fn=360); 

    color("gold")
    translate([0, 0, -6.05 - outerHeight])
    linear_extrude(height = 13.21)
       import(file = "PogoPins.dxf", layer = "P3-pins", $fn=360); 
}

// 868-22-003-00-011101
// https://www.mill-max.com/catalog/download/2019-01:019.78M.pdf
module Pogo3Male() {
    outerHeight = 6.91 - 3.15;
    translate([0, 0, -outerHeight])
    color("black")
    linear_extrude(height = outerHeight)
       import(file = "PogoPins.dxf", layer = "P3-outer", $fn=360); 

    color("black")
    linear_extrude(height = 3.15)
       import(file = "PogoPins.dxf", layer = "P3-inner", $fn=360); 

    color("gold")
    translate([0, 0, -6.05 - outerHeight])
    linear_extrude(height = 15.24)
       import(file = "PogoPins.dxf", layer = "P3-pins", $fn=360); 
}

// Product Number 868-10-004-00-012000	
module Pogo4Female() {
    outerHeight = 6.91 - 3.15;
    translate([0, 0, -outerHeight])
    color("black")
    linear_extrude(height = outerHeight)
       import(file = "PogoPins.dxf", layer = "P4-outer", $fn=360); 

    color("black")
    linear_extrude(height = 3.15)
       import(file = "PogoPins.dxf", layer = "P4-inner", $fn=360); 

    color("gold")
    translate([0, 0, -6.05 - outerHeight])
    linear_extrude(height = 13.21)
       import(file = "PogoPins.dxf", layer = "P4-pins", $fn=360); 
}

// 868-22-004-00-011101
// https://www.mill-max.com/catalog/download/2019-01:019.78M.pdf
module Pogo4Male() {
    outerHeight = 6.91 - 3.15;
    translate([0, 0, -outerHeight])
    color("black")
    linear_extrude(height = outerHeight)
       import(file = "PogoPins.dxf", layer = "P4-outer", $fn=360); 

    color("black")
    linear_extrude(height = 3.15)
       import(file = "PogoPins.dxf", layer = "P4-inner", $fn=360); 

    color("gold")
    translate([0, 0, -6.05 - outerHeight])
    linear_extrude(height = 15.24)
       import(file = "PogoPins.dxf", layer = "P4-pins", $fn=360); 
}

Pogo3Male();

translate([0, 20, 0])
    Pogo3Female();

Pogo3Male();

translate([0, 40, 0])
    Pogo4Male();

translate([0, 60, 0])
    Pogo4Female();