// load libraries
include <../parts/enclosure_ESP8266.scad>;
use <../parts/lid_ESP8266.scad>;
include <../../Libraries/ESP8266.scad>;
include <../../Libraries/MAX31865.scad>;
include <../../Libraries/NopSCADlib/vitamins/pcb.scad>;
include <../../Libraries/NopSCADlib/vitamins/pcbs.scad>;

// main board
// translate([0,0,d/2])
// rotate([0,180,90])
// pcb_assembly(ESP8266, height = 4, thickness = 5); // with mounts

translate([0,0,d/2-4])
rotate([0,180,90])
pcb(ESP8266); // without mounts

// MAX31865
translate([x_MAX+2.1,y_MAX,z_MAX])
rotate([-90,0,90])
pcb(MAX31865);

// enclosure();
// lid(width = w, length = l, depth = d, thickness = thick, fillet = fillet);
