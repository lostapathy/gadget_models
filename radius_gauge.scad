// This module creates a radius gauge with an outside and inside
// radius of the supplied param.  Useful for measuring curves.

// Only useful to a minimum radius of about 15mm

use <Write.scad>
font="orbitron.dxf";

module radius_gauge(radius, thickness=3) {
  $fa=2;
  $fs=0.5;
  offset=10; // between inner and outer radius
  end_r = offset/2 * (1+(offset/radius)/2);

  difference() {
    // This draws the outside radius and round ends
    union() {
      // Intersect to get 90 degrees of arc
      intersection() {
        cylinder(r=radius,h=thickness);
        translate([0,0,-thickness/2])
          cube([2*radius,2*radius,thickness*2]);
      }
      translate([radius-end_r,0,0])
        cylinder(r=end_r,h=thickness);
      translate([0,radius-end_r,0])
        cylinder(r=end_r,h=thickness);
    }
    
    // This removes the inside of the arc
    translate([-offset,-offset,-thickness/2])
      cylinder(r=radius,h=thickness*2);
    // Remove the hole
    translate([radius-5,0,-thickness/2])
      cylinder(r=3,h=thickness*2);
    // Remove the text
    font_size = min(10,radius/4);
    text=str(radius, "mm");
    rotate([0,0,-45])
      translate([-12,radius-12.5,thickness-1])
        write(text,t=15,h=font_size,font=font,space=1.1);
  }
}

radius_gauge(75);
