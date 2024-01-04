$fa = 1; // minimum angle
$fs = 0.4; // minimum size
z_layer = 0.24; // layer thickness
z_plate = 14.6; // plate height without lid
z_plate_lid = 16.2; // plate height without lid
wall_plate = 2.3;
z_off = 2; // offset for lid

x_pts = 2.3+1.5;
y_pts = 16.2+2;
thick = 1.2;

pts = [
    [-x_pts*1.3,-x_pts/3],
    [-x_pts*1.2,0],
    [-1,0],
    [0,-1],
    [0, -y_pts],
    [-x_pts, -y_pts],
    [-x_pts, -y_pts/2]
];

linear_extrude(z_layer*6, center = true)
for (p = [0:5]) {
    hull() {
        translate(pts[p]) circle(d = thick, center = true);
        translate(pts[p+1]) circle(d = thick, center = true);
    }
}
