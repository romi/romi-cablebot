include <extrusion.scad>

module TPulley() {
    StackExtrusions("T-Pulley.dxf",
                    [["Plate-01", 5],
                     ["Plate-02", 1],
                     ["Plate-03", 5.75]]);
}

TPulley();