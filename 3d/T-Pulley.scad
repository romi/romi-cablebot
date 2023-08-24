
include <extrusion.scad>


kTPulleyDrawingsFile = "T-Pulley.dxf";

module TPulley() {
    // Height = 5+1+5.75=11.75  
    // Total height (2 plates) = 2 * 11.75 = 23.5 → M5 x 30
    translate([0, 0, 0])
        Extrusion(kTPulleyDrawingsFile, "Plate-01", 5); 
    translate([0, 0, 5])
        Extrusion(kTPulleyDrawingsFile, "Plate-02", 1); 
    translate([0, 0, 6])
        Extrusion(kTPulleyDrawingsFile, "Plate-03", 5.75); 
}

TPulley();