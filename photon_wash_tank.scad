// load libs
use <photon_platform_adapter.scad>

// definitions
$fa = 1;
$fs = 0.4;

pl_width = 65+2; // build plate dimensions
pl_length = 115+2;

depth = 70; // wash box depth

offset = 5;

// set up modules
module tank() {
	difference() {
    cube([pl_width+offset, pl_length+offset, depth],
    center = true);
    
    translate([0, 0, offset])
    cube([pl_width, pl_length, depth],
    center = true);
    }
}

// build model

tank();
adapter();