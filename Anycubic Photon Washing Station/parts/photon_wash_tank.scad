// definitions
$fa = 1;
$fs = 0.4;

width = 65+2; // build plate dimensions
length = 115+2;
depth = 70; // wash box depth

fillet = 5;

offset = 5;
sf = 0.7; // scaling factor

// set up modules

module box() {
    linear_extrude(depth, center = true)
    offset(r = +fillet) offset(delta = -fillet) {
        square([width, length], center = true);
    }
}

module tank() {
	difference() {
        box();

        translate([0, 0, offset])
        scale([width/(width+offset), length/(length+offset), 1])
        box();
    }
}