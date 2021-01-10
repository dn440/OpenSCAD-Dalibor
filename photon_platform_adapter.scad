// definitions
$fa = 1;
$fs = 0.4;

fillet = 5;

diff = 1.1;
a = 24.8-0.4;
b = a-2*diff;
h = 20.5;

d1 = 17.54;
d2 = 15.98;

// set up modules
module adapter() {
    linear_extrude(h, center = true, scale = b/a)
        offset(r = +fillet) offset(delta = -fillet) {
            square(a, center = true);
        }
}

// build model
difference() {
    adapter();

    scale([0.95, 0.95, 1])
    translate([0, 0, -5])
    adapter();
}
