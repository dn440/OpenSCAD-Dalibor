use <../parts/gilson_pipette_box_insert.scad>
use <../parts/eppendorf_15mL.scad>
use <../parts/falcon_15mL.scad>
use <../parts/falcon_50mL.scad>
use <../parts/PCR_tube.scad>

// definitions
x_box = 114;
y_box = 78;
n_eps = 5;
y_holes = y_box/3.5;
h_layer = 0.24;

module eps() {
    x_eps = x_box/(n_eps+1);
    y_eps = y_holes;
    pts_ep = [[0,y_eps,0],
    [-1*x_eps,y_eps,0], [-2*x_eps,y_eps,0],
    [1*x_eps,y_eps,0], [2*x_eps,y_eps,0]];

    for (p = pts_ep){
        translate(p) ep_15();
    }
}

difference() {
    insert();
    translate([x_box/3,-y_holes/1,0])
    falcon_15();
    translate([-x_box/4,-y_holes/1.5,0])
    falcon_50();
    eps();
    translate([x_box/3, 0 ,0])
    pcr_tube();
    translate([x_box/6, 0 ,0])
    pcr_tube();
}

// add text labels for reagents
rotate([0,0,180])
translate([12,-35,h_layer*5-0.01])
linear_extrude(h_layer*2)
text("SAM", size = 5);

rotate([0,0,180])
translate([35,-35,h_layer*5-0.01])
linear_extrude(h_layer*2)
text("E", size = 5);

rotate([0,0,180])
translate([-5,-35,h_layer*5-0.01])
linear_extrude(h_layer*2)
text("7A", size = 5);

rotate([0,0,180])
translate([-25,-35,h_layer*5-0.01])
linear_extrude(h_layer*2)
text("HCy", size = 5);

rotate([0,0,180])
translate([-44,-35,h_layer*5-0.01])
linear_extrude(h_layer*2)
text("Cys", size = 5);