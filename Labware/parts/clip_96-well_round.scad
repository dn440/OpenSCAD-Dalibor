$fa = 1; // minimum angle
$fs = 0.4; // minimum size
z_layer = 0.24; // layer thickness
z_plate = 14.6; // plate height without lid
z_off = 2; // offset for lid

s_x = 1; // scale factors for main circle body
s_y = 0.8;

linear_extrude(z_layer*15)
union() {
    difference() {
        s_body = [s_x,s_y,1]; // scale factor for main body
        scale(s_body) circle(r = z_plate-z_off);
        scale(s_body) circle(r = z_plate-z_off*2.2);

        translate([z_plate-1,0,0])
        square(z_plate, center = true); // plate
    }

    // grippers
    d_grip = 6;
    off_grip_x = -(z_plate/2+z_off/2)*s_x; // gripper offset from center
    off_grip_y = -(z_plate/2+z_off/2)*s_y;

    translate([-off_grip_x,off_grip_y,0])
    circle(d = d_grip);
    translate([-off_grip_x,-off_grip_y,0])
    circle(d = d_grip);
}