use <NopSCADlib/vitamins/pcb.scad>

MAX31865 = ["MAX31865", "MAX31865",
    35, 30, 1.6, // length, width, thickness
    3,      // Corner radius
    2.75,   // Mounting hole diameter
    5,    // Pad around mounting hole
    "green",// Color
    true,   // True if the parts should be separate BOM items
    // hole offsets
    [ [2.5, 2.5], [2.5, -2.5], [-2.5, 2.5], [-2.5, -2.5] ],
    // components
    [
        [10, 15, 0, "term35", 4],
        [27,  15, -90, "flat_flex", true],
    ],
];

//pcb(MAX31865);