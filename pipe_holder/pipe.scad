pipe(10,8,20);


module pipe(dExt,dInt,length) {
    difference() {
        cylinder(d=dExt,length);
        cylinder(d=dInt,length);
    };
}