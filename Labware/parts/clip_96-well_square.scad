use <../../Libraries/hull.scad>;

$fa = 1; // minimum angle
$fs = 0.4; // minimum size
z_layer = 0.24; // layer thickness
z_plate = 14.6; // plate height without lid
z_plate_lid = 16.2; // plate height without lid
wall_plate = 2.3;
z_off = 2; // offset for lid

s_x = 1; // scale factors for main circle body
s_y = 0.8;

x_pts = 2.3+1.5;
y_pts = 16.2+2;
thick = 1.2;

pts = [
    [-x_pts*1.5,-x_pts/4],
    [0,0],
    [0, -y_pts],
    [-x_pts, -y_pts],
    [-x_pts, -y_pts/2]
];

    linear_extrude(z_layer*6, center = true)
    for (p = [0:3]) {
        hull() {
            translate(pts[p]) circle(d = thick, center = true);
            translate(pts[p+1]) circle(d = thick, center = true);
        }
    }

// sequentialHull(pts)