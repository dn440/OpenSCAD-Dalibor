// definitions
w = 65+2;
l = 115+2;
d = 70;

fillet = 5;
thick = 5; // thickness of the wall

// set up modules

module outer(width, length, depth, fillet) {
    linear_extrude(depth, center = true)
    offset(r = +fillet) offset(delta = -fillet) {
        square([width, length], center = true);
    }
}

//outer(w, l, d, fillet = fillet);

module r_box(width, length, depth, thickness, fillet) {
	difference() {
        // outer
        outer(width = width, length = length, depth = depth, fillet = fillet);
        // inner
        translate([0, 0, thickness])
        scale([width/(width+thickness), length/(length+thickness), 1]) // [x,y,z]
        outer(width = width, length = length, depth = depth, fillet = fillet);
    }
}

r_box(width = w, length = l, depth = d, thickness = thick, fillet = fillet);

module lid(width, length, depth, thickness, fillet) {
    translate([0,0,depth/2+thickness/2])
    linear_extrude(thickness, center = true)
    offset(r = +fillet) offset(delta = -fillet) {
        square([width, length*1.4], center = true);
    }
}

lid(w, l, d, thick, fillet = fillet);