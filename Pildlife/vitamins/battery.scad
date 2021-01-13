// battery dimensions
wide = 75;
long = 117;
thick = 23;

// USB out
usb_w = 12.5;
usb_h = 5;
usb_d = 5;

// micro USB in
m_usb_w = 7;
m_usb_h = 2;

points = [[0,0,0], [0,wide,0], [long,0,0], [long,wide,0]];
fillet = 5;
 
module battery(points, radius, height){
    union() {
        // battery enclosure
        translate([-(long/2),-(wide/2),0])
        hull(){
            for (p = points){
                translate(p) cylinder(r=radius, h=height);
            }
        }
        // USB out
        translate([(long/2+usb_d),1.25,10])
        rotate([0,0,90])
        cube([usb_w, usb_d, usb_h], center = true);
        // micro USB in
        translate([(long/2+usb_d),18,10])
        rotate([0,0,90])
        cube([m_usb_w, usb_d, m_usb_h], center = true);
    }
}

battery(points, fillet, thick);