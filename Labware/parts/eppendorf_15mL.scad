module ep_15() {
    // definitions
    d_ep = 10; // Eppendorf tube diameter at the neck
    h_ep = 39;
    d_off = 2; // offset the diameter for spacing
    // model
    cylinder(d = d_ep+d_off, h = h_ep, center = true);
}
