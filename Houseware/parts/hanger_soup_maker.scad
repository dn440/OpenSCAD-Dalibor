$fa = 1;

thick = 4;
x_top = 11/2;
x_bottom = 33/2;
y_bottom = 67;

module hanger() {
    pts = [
        [-x_top,20],
        [-x_top,0],
        [x_top,0],
        [x_top,30],
        [-x_bottom,45],
        [-x_bottom,y_bottom],
        [0,y_bottom+5],
        [x_bottom,y_bottom],
        [x_bottom,y_bottom-12],
    ];

    linear_extrude(10, center = true)
    for (p = [0:7]) {
        hull() {
            translate(pts[p]) circle(d = thick, center = true);
            translate(pts[p+1]) circle(d = thick, center = true);
        }
    }
}

hanger();