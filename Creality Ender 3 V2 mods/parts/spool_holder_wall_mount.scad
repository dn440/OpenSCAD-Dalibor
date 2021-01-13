// definitions
$fa = 1;
$fs = 0.4;
d_in = 19.8; // inside tube diameter
d_out = 29.9; // outside tube diameter
d_lock = 3.5; // rotating lock diameter
d_screw = 3.6; // screw diameter
l_scrw = 31.5; // distance between screw holes
l_height = 11.7; // base to neck
l_offset = 3.7; // base to lock channel
l_in = 22.4; // inside length
thick = 4; // wall thickness

// set up modules
module screw_hole() {
    rotate([0, 90, 0])
    cylinder(10, d = d_screw, center = true);
}

module locks() {
    rotate([90, 0, 0])
    cylinder(2, d = d_lock, center = true);
    }

module screw_gap() {
    rotate([0, 90, 0])
    cylinder(l_height*1.4, d = d_screw*2, center = true);
}

// build model

difference() {
    union() {
    // wall mount
    difference() {
        translate([0, 0, 0]) // box
        rotate([0, 0, 90])
        cube([d_out+thick, thick, l_scrw+12], center = true);
        
        translate([0, 0, l_scrw/2]) // screw hole top
        screw_hole();
    
        translate([0, 0, -l_scrw/2]) // screw hole bottom
        screw_hole();
        }
    
    // adapter
    difference() {
        translate([thick/2, 0, 0]) // gripper
        rotate([0, 90, 0])
        cylinder(l_height, d = d_out+thick);
    
        translate([thick/4, 0, 0])
        rotate([0, 90, 0])
        cylinder(l_height*2, d = d_out);
        }
    }
    
    translate([thick*2, 0, l_scrw/2])
    screw_gap();
    
    translate([thick*2, 0, -l_scrw/2])
    screw_gap();
}
// locks
translate([thick/2+d_lock/2+l_offset, d_out/2, 0])
locks();
translate([thick/2+d_lock/2+l_offset, -d_out/2, 0])
locks();

// tube mount
translate([thick/2, 0, 0])
rotate([0, 90, 0])
cylinder(l_in, d = d_in);
