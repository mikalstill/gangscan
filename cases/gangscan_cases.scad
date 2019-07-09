// Gangscan case
// This is a case built for the gangscan project
// https://github.com/mikalstill/gangscan
// the BebasNeue.ttf font from the gangscan directory needs to be installed to render correctly

// The dimensions of the board are added here as debug objects
// gangscan board
%cube([96,96,1.7]);
// screen board
%translate([8.25,53.75,3.1]) cube([68,40,1.5]);
// screen hole
%translate([21,54.75,4.6]) cube([48,36,5.5]); // 4mm extra to see where the hole goes. Needs to be smaller than the screen bracket
// rfid reader
%translate([8.25,8,3.7]) cube([60,40,1.5]);
// Raspberry Pi Zero W
%translate([8.25,21,-18]) cube([30,65,18]);


module PowerSymbol (thickness) {
    // we need a power symbol on the side
    linear_extrude (height = thickness, center = true, convexity = 1, twist = 0, slices = 10, scale = 1.0, $fn = 100) {
        union() {
            difference () {
                circle (10, $fn=100);
                circle (8, $fn=100);
                translate ([-3,0,0]) square ([6,10]);
            }
            translate ([-1,2,0]) square ([2,10]);
        } 
    }
}// power symbol

module USBSymbol (thickness) {
    // we don't really need a usb symbol
    // but it's a good learning exercise to have done this by hand
    linear_extrude (height = thickness, center = true, convexity = 1, twist = 0, slices = 10, scale = 1.0, $fn = 100) {
    // This array is the points to generate the USB trident without the circles    
        usbTrident=[[0,0],[0,0.5],[6,0.5],[10,5],[15,5], [15,4],[10,4],[7,0.5],[20,0.5],[20,2],[23,0],[20,-2],[20,-0.5],[10,-0.5],[13,-4],[16,-4],[16,-3],[19,-3],[19,-6],[16,-6],[16,-5],[13,-5],[9,-0.5]
    ,[0,-0.5]];
        union () {
            polygon(usbTrident);
            // add the circles to the shape
            circle (2, $fn=50); 
            translate ([15,4.5,0]) circle (1.5, $fn=50); 
        } // union
    } //linear_extrude
}// USBsymbol

module RoundBox (x, y, z, r) {
  $fn=50;
  translate ([r, r, 0]) minkowski()
  {
    cube([x-(2*r), y-(2*r), z]);
    cylinder(r=r, h=z);
  }
} // RoundBox



module Lid (direction) {
// Top Half with the out text
// uncomment the rotate/translate for export
//rotate([180,0,0]) translate ([0, -90, -10])
    difference() {
        union() {
            translate ([-10, -10, 8]) RoundBox(116, 116, 1, 4);  // box height is double the value set
            translate ([20, 53.75, 10]) RoundBox(50, 38, 0.5,1); // Add a border to the screen

            // gangscan text
            translate ([ 48,98, 10]) linear_extrude (height = 3, center = true, convexity = 1, twist = 0, slices = 10, scale = 1.0, $fn = 100) {
    text("GANGSCAN", halign="center", valign="center", font="Bebas Neue:style=Regular");
            }
            // direction text
            translate ([48, 22.5, 10]) linear_extrude (height = 3, center = true, convexity = 1, twist = 0, slices = 10, scale = 1.0, $fn = 100) {
    text(direction, halign="center", valign="center", font="Bebas Neue:style=Regular", size=50);
            }
        }
        // screen hole
        translate([21,54.75,0]) RoundBox(47, 36, 10.5,1);
        // Holes for the screws
        translate ([-4, -4, 3]) cylinder(8, d=3, $fn=50);
        translate ([-4, 100, 3]) cylinder(8, d=3, $fn=50);
        translate ([100, -4, 3]) cylinder(8, d=3, $fn=50);
        translate ([100, 100, 3]) cylinder(8, d=3, $fn=50);
    } // difference
} // lid ()




module Case() {
// Bottom Half
// uncomment the translate to export
    union() {
        difference() {
            translate ([-10, -10, -20]) RoundBox(116, 116, 14, 4);  // box height is double the value set
            // cut out the hole for the board
            translate([-0.5, -0.5, -18]) cube([97,97,28]);
            // and the holes for the screws
            translate ([-4, -4, -15]) cylinder(25, d=3, $fn=50);
            translate ([-4, 100, -15]) cylinder(25, d=3, $fn=50);
            translate ([100, -4, -15]) cylinder(25, d=3, $fn=50);
            translate ([100, 100, -15]) cylinder(25, d=3, $fn=50);
            // USB hole for the raspberry pi
            translate([-10, 25, -18]) cube([20,30,18]);
            // show which side is power
            translate([-10, 15, -10]) rotate ([90,0,-90]) scale ([0.5, 0.5, 1]) PowerSymbol (3);
            // and USB
            translate([-10, 65, -14]) rotate ([90,-90,-90]) scale ([0.5, 0.5, 1]) USBSymbol (3);
            // add some vents
            for (counter = [1:22]) {
                translate([0+(4 * counter), -10, -18]) cube([2,20,24]);
                translate([0+(4 * counter), 86, -18]) cube([2,20,24]);
            }
        } // difference
        // supports for the board
        translate ([-1, -1, -18]) cube([5,5,17]);
        translate ([-1, 91.5, -18]) cube([5,5,17]);
        translate ([91.5, -1, -18]) cube([5,5,17]);
        translate ([91.5, 91.5, -18]) cube([5,5,17]);
    } // union
} // case

// align them nicely
translate ([0, 0, -8]) Lid ("IN");
translate ([0, -120, -8]) Lid ("OUT");
translate ([0, 120, 20]) Case () ;


