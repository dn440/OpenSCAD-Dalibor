// load libraries
include <../parts/enclosure.scad>;
use <../parts/lid.scad>;
include <../../Libraries/MAX31865.scad>;
include <../../Libraries/NopSCADlib/vitamins/pcb.scad>;
include <../../Libraries/NopSCADlib/vitamins/pcbs.scad>;

// Arduino
translate([0,l/2-36,d/2])
rotate([0,180,90])
pcb_assembly(ArduinoUno3, height = 4, thickness = 5);

// MAX31865
translate([10,-l/2+2*1.6+0.9,0])
rotate([90,0,0])
pcb(MAX31865);

enclosure();
//lid(width = w, length = l, depth = d, thickness = thick, fillet = fillet);
