module out_tube() {
    // definitions
    thick = 2; // wall thickness
    l_o = 75; // length (salsa jar height is 74.5)
    d_i = 32; // inside diameter to hold bearing

    l_i = l_o + thick; // length for subtracting cylinder
    d_o = d_i + thick; // outside diameter

    // modeling
    difference() {
        // outer
        cylinder(l_o, d = d_o, center = true);
        // inner
        translate([0,0,-5])
        cylinder(l_i+10, d = d_i, center = true);
    }

}

out_tube();