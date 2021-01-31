use <NopSCADlib/vitamins/pcb.scad>

ESP8266 = ["ESP8266", "ESP8266",
    47.5, 26, 1.6, // length, width, thickness
    3,      // Corner radius
    3,   // Mounting hole diameter
    5,    // Pad around mounting hole
    "green",// Color
    false,   // True if the parts should be separate BOM items
    // hole offsets
    [ [2.5, 2.5], [2.5, -2.5], [-2.5, 2.5], [-2.5, -2.5] ],
    // components
    [
        [47.5/2, 26-2, 0, "2p54header", 15, 1],
        [47.5/2, -(26-2), 0, "2p54header", 15, 1],
        [0, 26/2, 180, "-usb_uA"],
    ],
];

// pcb(ESP8266);