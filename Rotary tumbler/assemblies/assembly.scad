include <../../Libraries/NopSCADlib/vitamins/ball_bearing.scad>
include <../../Libraries/NopSCADlib/vitamins/ball_bearings.scad>
use <../parts/tube.scad>
use <../parts/axle.scad>
use <../parts/bearing_mimic.scad>
use <../parts/frame.scad>

ax_spacing = 20; // distance between the axes of the barrels

module barrel() {
    // tube that rolls jar
    out_tube();

    // axles
    translate([0,0,-75/2-20])
    axle();
    translate([0,0,75/2-10])
    axle();

    // bearings
    translate([0,0,-75/2+5])
    ball_bearing(BB608);
    translate([0,0,75/2-5])
    ball_bearing(BB608);
}

rotate([90,0,0])
translate([-ax_spacing,0,0])
barrel();

rotate([90,0,0])
translate([ax_spacing,0,0])
barrel();

// one out of 4 ends will be connected to motor
translate([20,-75/2+4.9,0])
rotate([90,0,0])
bearing_mimic();

rotate([90,0,0])
translate([0,0,75/2+5])
frame();