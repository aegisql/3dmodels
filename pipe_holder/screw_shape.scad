screw_shape(10,5,30);

module screw_shape(dHead,dThread,length) {
    
    headHeight = dThread;
    tipHeight = dThread/(2*tan(30));
    
    translate([0,0,tipHeight]) cylinder(d=dThread, h=length-tipHeight);
    translate([0,0,length-dThread]) cylinder(r1=0, r2=dHead/2, h=dThread);
    cylinder(r1=0, r2=dThread/2, h=tipHeight);
}