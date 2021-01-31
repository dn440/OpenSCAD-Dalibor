// load libraries
include <../../Libraries/NopSCADlib/vitamins/pcb.scad>;
include <../../Libraries/NopSCADlib/vitamins/pcbs.scad>;
include <../../Libraries/NopSCADlib/vitamins/cameras.scad>;
use <../vitamins/battery.scad>;


pcb(RPI3);

translate([0,-16.5,20])
rotate([0,0,90])
camera(rpi_camera);

translate([0,0,-25])
battery();