// libraries for parts/mods the the resin 3D printer Anycubic Photon
$fa = 1;
$fs = 0.4;

// build platform adapter
fillet = 5;

diff = 1.1;
a = 24.8-0.4;
b = a-2*diff;
h = 20.5;

d1 = 17.54;
d2 = 15.98;

module adapter() {
    linear_extrude(h, center = true, scale = b/a)
        offset(r = +fillet) offset(delta = -fillet) {
            square(a, center = true);
        }
}