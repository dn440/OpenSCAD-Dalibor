epsilon = 0.001; // magic number

// 96-well plate F-bottom standard
A = 127.76; // length
B = 85.48; // width
C = 11.24; // A1 row offset
D = 14.38; // A1 column offset
E = 9.0; // well spacing (center to center)
F = 10.9; // well depth
G = 14.6; // thickness bottom to top
H = 6.96; // well diameter top
H1 = 6.39; // well diameter bottom

fillet = 2;
points = [[0,0,0], [0,B,0], [A,0,0], [A,B,0]];
 
module base() {
    // base
//    translate([-(A/2),-(B/2),0])
    linear_extrude(G)
    offset(r = +fillet) offset(delta = -fillet) {
        square([B, A]);
    }
}

//color("magenta")
//base();

module well() {
    translate([C,D,G-F+epsilon])
    cylinder(F, d1 = H, d2 = H1, center = false);
}
//well();

module rectangular_array(rows, cols, distance) {
    for ( i= [0:1:rows-1])  {
        for ( j= [0:1:cols-1]) {
            translate([distance*i,distance*j,0,]) 
            children();
        }
    }
}

module plate_96_well() {
    difference() {
        base();
        rectangular_array(8, 12, E) well();
    }
}
plate_96_well();