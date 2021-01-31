module falcon_15() {
    // definitions
    d_fal = 17; // Eppendorf tube diameter at the neck
    h_fal = 120;
    d_off = 2; // offset the diameter for spacing
    // model
    cylinder(d = d_fal+d_off, h = h_fal, center = true);
}
