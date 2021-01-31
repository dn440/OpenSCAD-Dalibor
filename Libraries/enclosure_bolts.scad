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

module r_box(width, length, depth, thickness, fillet) {
	difference() {
        // main box
        // outer
        outer(width = width, length = length, depth = depth, fillet = fillet);
        // inner
        translate([0, 0, thickness/2])
        scale([width/(width+thickness), length/(length+thickness), 1]) // [x,y,z]
        outer(width = width, length = length, depth = depth, fillet = fillet);
    }
}

// enclosure
module enclosure() {
    $fa = 1;
    $fs = 0.4;
    union() {
        r_box(width = w, length = l, depth = d, thickness = thick, fillet = fillet);
        bolt_mounts(w, l, d, fillet = fillet, diam = 2.5);
    }
}

enclosure();