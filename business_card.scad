// definitions
x = 85;
y = 55;
thick_card = 2;
thick_grill = 1.2;

// card
module plate() {
    square([x, y], center = true);
}

module rim() {
    union() {
        difference() {
            plate();
            square([x-thick_card*2, y-thick_card*2], center = true);
        }
        square([x-thick_card*2, y/4], center = true);
    }
}

// pattern
module grill() {
    reps = 60;
    for (i = [-reps:2:reps]) {
        color("green")
        translate([thick_grill*i,0,0])
        rotate([0,0,45])
        square([x,thick_grill], center = true);
    }
}

module card() {
    union() {
        rim();
        intersection() {
            plate();
            grill();
        }
    }
}

// text
module txt() {
    color("black")
    translate([0,0,0])
    text("Dalibor Nakladal", size = 6,
    valign = "center", halign = "center");
}

difference() {
    card();
    txt();
}