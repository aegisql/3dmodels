$fn=360;
difference() {
    body(88.5);
//translate([0,0,20])
//    cone();
    //translate([0,0,-19]) screw_hole();
    cylinder(h=50, d=14.5, center=true);
    translate([-50,0,-10]) cube([100,50,30]);
    translate([0,-25,-9.99]) screw(20,9.5,5);
    rotate(60) translate([0,-25,-9.99]) screw(20,9.5,5);
    rotate(-60) translate([0,-25,-9.99]) screw(20,9.5,5);
}
translate([0,-25,3]) ring(rh=1,d1=13.5,d2=9.5);
rotate(60) translate([0,-25,3]) ring(rh=1,d1=13.5,d2=9.5);
rotate(-60) translate([0,-25,3]) ring(rh=1,d1=13.5,d2=9.5);


module body(bh) {
    cylinder(d=bh, h=5, center=true);
    translate([0,0,10]) cylinder(h=15, d=24.5, center=true);
    translate([0,0,3]) ring(rh=1,d1=bh,d2=bh-10);
    translate([0,0,2.5])
        rotate_extrude(angle = 360, convexity = 2) {
            translate([12.25,0,0])
                difference() {
                square(5);
                translate([5,5,0]) circle(5);
            }
    }
}

module cone() {
    cylinder(h=15, r1=30, r2=0, center=true);

}

module screw_hole() {
    cylinder(d=10, h=50, center=true);
    translate([0,0,20]) cylinder(h=10, r1=0, r2=15, center=true);
    
}

module screw(sh,d1,d2) {
    cylinder(d=d1/2, h=sh, center=true);
    translate([0,0,sh/2]) cylinder(h=d2, r1=0, r2=d1/2, center=true);
    
}

module ring(rh,d1,d2) {
difference() {
    cylinder(d=d1, h=rh, center=true);
    cylinder(d=d2, h=rh+1, center=true);    
    }    
}    