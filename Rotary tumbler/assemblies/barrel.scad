include <../../Libraries/NopSCADlib/vitamins/ball_bearing.scad>
include <../../Libraries/NopSCADlib/vitamins/ball_bearings.scad>
include <../parts/tube.scad>
include <../parts/axle.scad>

tube();
axle();

translate([0,60,0])
ball_bearing(BB6201);