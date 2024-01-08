$fn = 100; // Setting the resolution for smoother results

// horizontal part
diam = 120;

module base() {
    cylinder(d=diam, h=3);
}

module subtr() {
    translate([0, 0, -1.5])
        cylinder(d=98, h=5);
}

module dents() {
    for (i = [0:5]) {
    rotate([0, 0, i * 360/6])
        translate([diam/2+1, 0, -1.5])
            cylinder(d=16.5, h=5);
    }
}

module slots() {
    for (i = [0:5]) {
    rotate([0, 0, i * 360/6])
        translate([0, diam/2-6, -1.5])
        cube([10.8, 2.8, 10], center=true);
    }
}

module ring() {
    difference() {
        base();
        subtr();
        dents();
        slots();
    }
}

ring();

module cutout() {
    a=35;
    rotate([0,0,45])
    translate([40,40,0])
    cube([a,a,a], center=true);
}

// intersection() {
//     ring();
//     cutout();
// }

// vertical part
feet = 6;
legs = 25;
mid = 25;
press = 18;
module ribs() {
    pts = [
        [0,0], // 1
        [0+feet,0], // 2
        [0+feet+legs,0+press], // 3
        [0+feet+legs+mid,0+press], // 4
        [0+feet+legs+mid+legs,0], // 5
        [0+feet+legs+mid+legs+feet,0], // 6
    ];

    linear_extrude(10, center = true)
    for (p = [0:4]) {
        hull() {
            translate(pts[p]) circle(d = 2, center = true);
            translate(pts[p+1]) circle(d = 2, center = true);
        }
    }
}

//ribs();