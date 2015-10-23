// This is a simple stand to hold a woodworking plane on it's back
// to aid in removing flash or other faults from 3d printed parts.

// Design is built around Stanley 12-960 Contractor Grade Low Angle Plane

epsilon = 0.1;
knob_d = 25.5;
knob_base_h = 22.5;
knob_inset=8;

plane_w = 45.75;
base_h = 53;
base_l = 75;

taper = 20; // how far to flare the base out

$fn=200;

translate([0,0,5]) {

  // Cone base for adjustment knob
  difference() {
    cylinder(d1=plane_w+2*taper,d2=knob_d+8,h=knob_base_h+knob_inset);
    translate([0,0,knob_base_h+epsilon]) cylinder(d=knob_d,h=knob_inset+epsilon);
  }


  //translate([-plane_w/2,-25,0]) cube([plane_w,base_l,base_h]);
  difference() {
    hull() {
      cylinder(d1=plane_w+2*taper,d2=plane_w+2*7.5,h=base_h);
      translate([0,base_l,0]) cylinder(d1=plane_w+2*taper,d2=plane_w+2*7.5,h=base_h);
    }
    hull() {
      translate([-plane_w/2,-50,base_h-27+epsilon]) cube([plane_w,base_l*3,30]);
      translate([0,-50,33/2+epsilon]) rotate([-90,0,0]) cylinder(d=33,h=base_l*3);
    }
  }

  // Non-tapered base
  translate([0,0,-5]) hull() {
    cylinder(d=plane_w+2*taper,h=5+epsilon/2);
    translate([0,base_l,0]) cylinder(d=plane_w+2*taper,h=5+epsilon/2);
  }
}

// Cut-off tabs to aid in getting print off of bed.
*hull() {
  translate([-50,0,0]) cylinder(r=8,h=1);
  translate([ 50,0,0]) cylinder(r=8,h=1);
}


