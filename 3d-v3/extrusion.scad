
module Extrusion(file, layer, height) {
    linear_extrude(height = height)
       import(file = file, layer = layer, $fn=360); 
}

module StackExtrusions(file, list) {
    // Generate the list with the z offsets of each layer
    z = [ for (v = 0, i = 0; i < len(list); v = v + list[i][1], i = i + 1) v ];

    union() {
        for (i = [0:1:len(list)-1]) {
            translate([0, 0, z[i]])
                Extrusion(file, list[i][0], list[i][1]);
        }
    }
}