thick = 2; // wall thickness
l_o = 20; // length
d_i = 16; // inside diameter to hold beraing

l_i = l_o + thick; // length for subtracting cylinder
d_o = d_i + thick; // outside diameter

module tube() {
    difference() {
        cylinder(l_o, d = d_o, center = true);
        cylinder(l_i, d = d_i, center = true);
    }

}

//tube();