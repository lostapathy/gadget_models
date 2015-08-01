// This module creates a labeled tag for use with keys or luggage

use <Write.scad>
font="orbitron.dxf";


module key_tag(text) {
  font_size=10;
  $fn=100;
  hole_d=6;
  wall=2;
  thickness=2;
  difference() {
    union() {
      hull() {
        translate([-font_size*len(text)*0.5,0,0])
          cylinder(d=hole_d+2*wall,h=thickness);
        translate([-font_size*len(text)*0.33,0,0])
          cylinder(d=font_size+2*wall,h=thickness);
        translate([ font_size*len(text)*0.33,0,0])
          cylinder(d=font_size+2*wall,h=thickness);
      }
      translate([0,0,2.5]) write(text,t=1,h=font_size,font=font,space=1.1, center=true);
    }
    translate([-font_size*len(text)*0.5,0,-1]) cylinder(d=hole_d,h=5);
  }
}



key_tag("KEYS");
