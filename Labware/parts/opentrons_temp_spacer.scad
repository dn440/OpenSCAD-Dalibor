
$fa = 1; // minimum angle
$fs = 0.4; // minimum size
z_layer = 0.24; // layer thickness

x_pts = 8;
y_pts = 8;
thick = 0.6;

pts = [
    [x_pts,0],
    [0,0],
    [0,y_pts],
];

linear_extrude(z_layer*16, center = true)
for (p = [0:2]) {
    hull() {
        translate(pts[p]) circle(d = thick, center = true);
        translate(pts[p+1]) circle(d = thick, center = true);
    }
}