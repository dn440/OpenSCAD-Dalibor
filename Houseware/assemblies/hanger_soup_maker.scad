use <../vitamins/handle_kitchen_cabinet.scad>;
use <../vitamins/handle_soup_cooker.scad>;
use <../parts/hanger_soup_maker.scad>;

$fa = 1; // minimum angle
$fs = 0.4; // minimum size

translate([0,0,40])
handle_cabinet();
handle_cooker();

color("green")
translate([0,0,56])
rotate([-90,0,90])
hanger();