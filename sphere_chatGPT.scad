$fn = 100; // Setting the resolution for smoother results

module hole() {
    cylinder(h = 5, d = 2); // Create a hole with a diameter of 2mm and a height of 5mm
}

difference() {
    sphere(10); // Create the main sphere with a 10mm outer diameter

    for (i = [0:19]) {
        rotate([0, 0, i * 360 / 20]) {
            translate([8, 0, 0]) {
                hole(); // Create holes uniformly distributed around the sphere
            }
        }
    }
}
