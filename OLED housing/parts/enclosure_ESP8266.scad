// definitions

// box dimensions
w = 40;
l = 51;
d = 33;
thick = 2;
fillet = 3;

// MAX chip location, used also for bolts and mounts
x_MAX = -w/2+1.3;
y_MAX = 0;
z_MAX = 1;

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
        translate([0, 0, thickness/2])
        scale([width/(width+thickness), length/(length+thickness), 1]) // [x,y,z]
        outer(width = width, length = length, depth = depth, fillet = fillet);

        // window for ESP micro USB A plug
        translate([0,l/2,d/2.4])
        cube([9, thick+2, 6], center = true);

        // hole for power connector
        translate([0,l/2,-2])
        rotate([90,0,0])
        cylinder(h = thick+2, d = 15, center = true);

        // window for MAX31865 chip components
        rotate([0,0,-90])
        translate([0,-l/2.7,1.5])
        cube([27, thick+2, 21], center = true);

        // holes for MAX31865 chip bolts
        translate([x_MAX,y_MAX,z_MAX])
        rotate([0,0,-90])
        bolts_MAX(diameter = 3, thickness = thick+2);

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

        translate([x_MAX,y_MAX,z_MAX])
        rotate([0,0,-90])
        difference() {
            bolts_MAX(diameter = 5, thickness = 1);
            bolts_MAX(diameter = 3, thickness = thick+2);
        }
    }
}

enclosure();