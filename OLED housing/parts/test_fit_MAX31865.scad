// box dimensions
w = 76.2;
l = 90;
d = 40;
thick = 3;
fillet = 3;
$fa = 1;
$fs = 0.4;

// points
module bolts_MAX(diameter, thickness) {
    points = [[-30/2,-25/2,0], [-30/2,25/2,0], [30/2,-25/2,0], [30/2,25/2,0]];
    for (p = points){
        rotate([90,0,0]) translate(p) cylinder(d=diameter, h=thickness, center=true);
    }
}

rotate([90,0,0])
difference() {
    // base
    cube([37, 1.2, 32], center = true);
    // window for MAX31865 chip components
    cube([27, thick, 21], center = true);

    // holes for MAX31865 chip bolts
    bolts_MAX(diameter = 3, thickness = thick);
}