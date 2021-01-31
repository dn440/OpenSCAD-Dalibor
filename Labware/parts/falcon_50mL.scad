module falcon_50() {
    // definitions
    d_fal = 30; // Eppendorf tube diameter at the neck
    h_fal = 115;
    d_off = 2; // offset the diameter for spacing
    // model
    cylinder(d = d_fal+d_off, h = h_fal, center = true);
}
