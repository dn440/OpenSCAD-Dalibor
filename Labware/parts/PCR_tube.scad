module pcr_tube() {
    // definitions
    d = 7.5; // tube diameter at the neck
    h = 12;
    d_off = 2; // offset the diameter for spacing
    // model
    cylinder(d = d, h = h, center = true);
}
