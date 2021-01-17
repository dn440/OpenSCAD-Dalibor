$fa = 1;
$fs = 0.4;
// box dimensions
w = 76.2;
l = 90;
d = 40;
thick = 3;
fillet = 3;

module bolts_arduino(diameter, thickness) {
    points = [[0,0,0], [52.1,5.1,0], [1.3,48.3,0], [52.1,33,0]];
    rotate([0,180,90])
    for (p = points){
        translate(p) cylinder(d=diameter, h=thickness, center=true);
    }
}

module bolts_enclosure(diameter, thickness, w, l) {
    x = w/2-fillet;
    y = l/2-fillet;
    points = [[x,y,0], [x,-y,0], [-x,y,0], [-x,-y,0]];
    for (p = points){
        translate(p) cylinder(d=diameter, h=thickness, center=true);
    }
}

module bolts_mount(diameter, thickness, w, l) {
    x = w/2-fillet*1.2;
    y = l*1.4/2-fillet*1.2;
    points = [[x,y,0], [x,-y,0], [-x,y,0], [-x,-y,0]];
    for (p = points){
        translate(p) cylinder(d=diameter, h=thickness, center=true);
    }
}

module lid(width, length, depth, thickness, fillet) {
    difference() {
        union() {
            translate([0,0,depth/2+thickness/2])
            linear_extrude(thickness, center = true)
            offset(r = +fillet) offset(delta = -fillet) {
                square([width, length*1.4], center = true);
            }
            translate([24.1, 29.4, d/2-1.9])
            bolts_arduino(5, 4.2); // arduino board mount
        }
        // arduino bolt holes
        translate([24.1, 29.4, d/2])
        bolts_arduino(3, 16);
        // arduino bolt inserts
        translate([24.1, 29.4, d/2+2.1])
        bolts_arduino(5, 2);
        // enclosure bolt holes
        translate([0,0,d/2])
        bolts_enclosure(diameter=3, thickness=10, w=w, l=l);
        // enclosure bolt inserts 
        translate([0,0,d/2+2.1])
        bolts_enclosure(diameter=5, thickness=2, w=w, l=l);
        // mounting bolt holes
        translate([0,0,d/2+0.5])
        bolts_mount(diameter=3, thickness=10, w=w, l=l);
        // mounting bolt inserts
        translate([0,0,d/2+0.5])
        bolts_mount(diameter=5, thickness=2, w=w, l=l);
    }
}

rotate([180,0,0])
lid(w, l, d, thick, fillet = fillet);