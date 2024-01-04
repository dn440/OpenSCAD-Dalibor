$fa = 1; // minimum angle
$fs = 0.4; // minimum size


module frame() {
    z_layer = 0.24; // layer thickness

    x_pts_top = 30;
    x_pts_bot = 40;
    y_pts = 30;
    thick = 2.4;

    pts = [
        [-x_pts_top,y_pts/2],
        [x_pts_top,y_pts/2],
        [x_pts_bot,-y_pts/2],
        [-x_pts_bot,-y_pts/2],
        [-x_pts_top,y_pts/2],
    ];

    linear_extrude(z_layer*6, center = true)
    hull() {
        for (p = [0:3]) {
                translate(pts[p]) circle(d = thick, center = true);
        }
    }
}

// frame();