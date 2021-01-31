module battery(){
    // battery dimensions
    bt_x = 117;
    bt_y = 75;
    bt_z = 23;

    // USB out
    usb_w = 12.5;
    usb_h = 5;
    usb_d = 5;

    // micro USB in
    m_usb_w = 7;
    m_usb_h = 2;

    fillet = 5;
    pts = [[0,0,0], [0,bt_y,0], [bt_x,0,0], [bt_x,bt_y,0]];

    union() {
        // battery enclosure
        translate([-(bt_x/2),-(bt_y/2),0])
        hull(){
            for (p = pts){
                translate(p) cylinder(r=fillet, h=bt_z);
            }
        }
        // USB out
        translate([(bt_x/2+usb_d),1.25,10])
        rotate([0,0,90])
        cube([usb_w, usb_d, usb_h], center = true);
        // micro USB in
        translate([(bt_x/2+usb_d),18,10])
        rotate([0,0,90])
        cube([m_usb_w, usb_d, m_usb_h], center = true);
    }
}

battery();