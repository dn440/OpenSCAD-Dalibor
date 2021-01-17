use <enclosure.scad>

$fa = 1;
$fs = 0.4;

difference() {
    cube([30,30,2], center = true);
    OLED_094();
}