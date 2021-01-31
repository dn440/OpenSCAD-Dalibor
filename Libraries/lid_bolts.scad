$fa = 1;
$fs = 0.4;

// box dimensions
w = 40;
l = 51;
d = 33;
thick = 2;
fillet = 3;

x_board = 26/2-2.5;
y_board = 47.5/2-2.5;

module bolts_board(diameter, thickness) {
    points = [[-x_board,-y_board,0], [x_board,y_board,0], [x_board,-y_board,0], [-x_board,y_board,0]];
    // rotate([0,180,90])
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
            translate([0, 0, d/2-1.9])
            bolts_board(5, 4.2); // board board mount
        }
        // board bolt holes
        translate([0, 0, d/2])
        bolts_board(3, 16);
        // board bolt inserts
        translate([0, 0, d/2+2.1])
        bolts_board(5, 2);
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