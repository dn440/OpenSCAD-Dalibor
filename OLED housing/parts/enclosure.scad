// definitions

// box dimensions
w = 76.2;
l = 90;
d = 40;
thick = 3;
fillet = 3;

// points
pts_MAX = [[-30/2,-25/2,0], [-30/2,25/2,0], [30/2,-25/2,0], [30/2,25/2,0]];

// set up modules

module outer(width, length, depth, fillet) {
    linear_extrude(depth, center = true)
    offset(r = +fillet) offset(delta = -fillet) {
        square([width, length], center = true);
    }
}

module bolts_MAX(points, diameter, thickness) {
    points = [[-30/2,-25/2,0], [-30/2,25/2,0], [30/2,-25/2,0], [30/2,25/2,0]];
    for (p = points){
        rotate([90,0,0]) translate(p) cylinder(d=diameter, h=thickness, center=true);
    }
}

module bolt_mounts(w, l, d, fillet, diam) {
    x = w/2-fillet;
    y = l/2-fillet;
    points = [[x,y,0], [x,-y,0], [-x,y,0], [-x,-y,0]];
    module mounts() {
        for (p = points){
            translate(p) cylinder(r=fillet, h=d, center=true);
        }
    }
    module holes() {
        points = [[x,y,0.1], [x,-y,0.1], [-x,y,0.1], [-x,-y,0.1]];
        for (p = points){
            translate(p) cylinder(d=diam, h=d, center=true, $fn = 5);
        }
    }
    difference(){
        mounts();
        holes();
    }
}

module OLED_094() {
    // OLED screw hole distances
    dist_x = 21.6+2;
    dist_y = 22+3.5/2;
    w_OLED = 26.8;
    h_OLED = 16.5;
    pts_OLED = [[-dist_x/2,-dist_y/2,0], [-dist_x/2,dist_y/2,0], [dist_x/2,-dist_y/2,0], [dist_x/2,dist_y/2,0]];
    cube([w_OLED, h_OLED, 8], center = true);
	for (p = pts_OLED){
		translate(p) cylinder(d=2.1, h=8, center=true);
	}
}

module r_box(width, length, depth, thickness, fillet) {
	difference() {
        // main box
        // outer
        outer(width = width, length = length, depth = depth, fillet = fillet);
        // inner
        translate([0, 0, thickness])
        scale([width/(width+thickness), length/(length+thickness), 1]) // [x,y,z]
        outer(width = width, length = length, depth = depth, fillet = fillet);

        // hole for power connector
        translate([-20,-l/2,0])
        rotate([90,0,0])
        cylinder(h = thick+2, d = 15, center = true);

        // window for MAX31865 chip components
        translate([10,-l/2,0])
        cube([27, thick+2, 21], center = true);

        // holes for MAX31865 chip bolts
        translate([10,-l/2,0])
        bolts_MAX(pts_MAX, diameter = 3, thickness = thick+2);

        // window for Arduino USB B plug
        translate([-11.1,l/2,8.9])
        cube([15, thick+2, 13], center = true);

        // window for Arduino barrel power plug
        translate([19,l/2,8.9])
        cube([11, thick+2, 13], center = true);

        // OLED
        rotate([0,0,90])
        translate([0,0,-d/2])
        color("black")
        OLED_094();
    }
}

// enclosure
module enclosure() {
    $fa = 1;
    $fs = 0.4;
    union() {
        r_box(width = w, length = l, depth = d, thickness = thick, fillet = fillet);
        bolt_mounts(w, l, d, fillet = fillet, diam = 2.5);

        difference() {
            translate([10,-l/2+1.9,0])
            bolts_MAX(pts_MAX, diameter = 5, thickness = 1);

            translate([10,-l/2,0])
            bolts_MAX(pts_MAX, diameter = 3, thickness = thick+2);
        }
    }
}

enclosure();