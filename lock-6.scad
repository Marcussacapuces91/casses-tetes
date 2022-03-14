module base(u) {
    difference() {
        cube([6*u,2*u,2*u], center=true);
        for (a=[45,135,225,315]) rotate([a,0,0]) translate([0,0,1.85*u]) cube([6.5*u,u,u], center=true);
        for (x=[-1,1],a=[0,90,180,270]) rotate([a,0,0]) translate([3.385*x*u,0,1.25*x*u]) rotate([0,45,0]) cube([u,2.5*u,u], center=true);
    }
}

module un(u) {
    color("red") difference() {
        base(u);
        translate([0,0,0.75*u]) cube([4*u,2.5*u,1.5*u], center=true);
        translate([-0.5*u,0.75*u,-0.5*u]) cube([1*u,1.5*u,1.5*u], center=true);
    }
}

module deux(u) {
    color("green") difference() {
        base(u);
        translate([0,0,0.75*u]) cube([4*u,2.5*u,1.5*u], center=true);
        translate([0*u,0.75*u,-0.5*u]) cube([2*u,1.5*u,1.5*u], center=true);
    }
}

module trois(u) {
    color("blue") difference() {
        base(u);
        translate([0,u,0.75*u]) cube([4*u,2*u,1.5*u], center=true);
        translate([1*u,0.75*u,-0.5*u]) cube([2*u,1.5*u,1.5*u], center=true);
        translate([0,-0.5*u,0.75*u]) cube([2*u,1.5*u,1.5*u], center=true);
    }
}

module quatre(u) {
    color("blue") difference() {
        base(u);
        translate([-u,0,0.75*u]) cube([2*u,2.5*u,1.5*u], center=true);
        translate([1.5*u,0,0.75*u]) cube([1*u,2.5*u,1.5*u], center=true);
    }
}

module cinq(u) {
    color("green") difference() {
        base(u);
        translate([0,0,0.75*u]) cube([2*u,2.5*u,1.5*u], center=true);
        translate([-1*u,0.75*u,0]) cube([2*u,1.5*u,2.5*u], center=true);
    }
}

module six(u) {
    color("red") base(u);
}

translate([0,11,0]) six(10);
translate([0,-11,0]) un(10);
translate([0,-33,0]) deux(10);
translate([0,33,0]) trois(10);

translate([-42,0,0]) rotate([0,0,90]) quatre(10);
translate([42,0,0]) rotate([0,0,-90]) cinq(10);
