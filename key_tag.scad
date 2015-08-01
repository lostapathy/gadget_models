// This module creates a labeled tag for use with keys or luggage

// Works best with 3 or 4 character labels

use <Write.scad>
font="orbitron.dxf";


text="KEY";


font_size=10;
$fn=50;
difference() {
  union() {
    cylinder(d=font_size*len(text),h=2);
    translate([0,0,2.5]) write(text,t=1,h=font_size,font=font,space=1.1, center=true);
  }
  translate([0,30/2-3-2,-1]) cylinder(d=6,h=5);
}
