module insert() {
    // definitions
    x_box = 114;
    y_box = 78;
    h_layer = 0.24;
    thick = h_layer*5;
    fillet = 3;

    // model
    linear_extrude(thick, center = true)
    offset(r = +fillet) offset(delta = -fillet) {
        square([x_box, y_box], center = true);
    }
}


insert();