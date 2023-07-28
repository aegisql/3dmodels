use <pipe.scad>
use <screw_shape.scad>

pipe_holder(dExt=21.4,dInt=15.8);

translate([40,0,0]) strut(15.7,12,15);

//slotted_pipe(100,90,100,80);

baseHeight=10;
dBolt=4;
dWasher=11.5;
dNut=10;
hBoltHead=4.5;
hNut=3.5;
extFit=0.2;
intFit=0.1;
dScrewHead=8;
dScrewThread=4;
screwHeight=20;
screwHoleOffset=17;

module pipe_holder(dExt,dInt) {
    difference() {
        base(dExt,dInt,height=baseHeight);
        cylinder(d=dBolt+extFit,h=baseHeight);
        cylinder(d=dWasher+0.5,h=hBoltHead);
        translate([ 0, 0, baseHeight/2 ]) pipe(dExt+extFit,dInt-intFit,5);
        translate([ screwHoleOffset, 0, baseHeight-screwHeight ]) 
            screw_shape(dScrewHead,dScrewThread,screwHeight);
        rotate(120) 
            translate([ screwHoleOffset, 0, baseHeight-screwHeight ]) 
            screw_shape(dScrewHead,dScrewThread,screwHeight);
        rotate(-120) 
            translate([ screwHoleOffset, 0, baseHeight-screwHeight ]) 
                screw_shape(dScrewHead,dScrewThread,screwHeight);
    }
    translate([ screwHoleOffset, 0, baseHeight ]) pipe(dScrewHead+4,dScrewHead,1);
    rotate(120) translate([ screwHoleOffset, 0, baseHeight ]) pipe(dScrewHead+4,dScrewHead,1);
    rotate(-120) translate([ screwHoleOffset, 0, baseHeight ]) pipe(dScrewHead+4,dScrewHead,1);
    translate([ 0, 0, baseHeight ]) slotted_pipe(dInt-intFit,dInt-2-intFit,15,12);
    pipe(dExt=dBolt+extFit+1,dInt=dBolt+extFit,length=hBoltHead);
}

module base(dExt,dInt,height) {
    cylinder(d=dExt+30,h=height*0.75);
    translate([ 0, 0, height*0.75 ]) cylinder(r1=(dExt+30)/2,r2=(dExt+25)/2,h=height*0.25);
}    

module slotted_pipe(dExt,dInt,length,depth) {
    difference() {
        pipe(dExt,dInt,length);
        translate([ -dExt/2, 0, length-depth ]) cube([dExt,2,depth]);
        rotate([0,0,90]) translate([ -dExt/2, 0, length-depth ]) cube([dExt,2,depth]);
    }
}

module strut(dExt,dInt,length) {
    difference(){
        cylinder(r1=dInt/2,r2=dExt/2,h=length);
        cylinder(d=dBolt+intFit,h=length);        
        translate([0,0,length-hNut]) cylinder(d=dNut+extFit,h=hNut,$fn=6);        
    }
}