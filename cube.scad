/**
 * Copyright 2021 Marc SIBERT
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

module m1(m = 10, d = 2) {
    minkowski() {
        sphere(d=d, $fn=40);
        union() {
            cube([3*m-d,m-d,m-d], center=true);
            translate([0,-m/2,0]) cube([m-d,2*m-d,m-d], center=true);
        }
    }
}

module m2(m = 10, d = 2) {
    rotate([-90,0,90]) m1(m, d);
    minkowski() {
        sphere(d=d, $fn=40);
        translate([-m/2,-m,0]) cube([2*m-d,m-d,m-d], center=true);
    }
}

module m3(m = 10, d = 2) {
    m1(m, d);
    minkowski() {
        sphere(d=d, $fn=40);
        translate([0,-m,m/2]) cube([m-d,m-d,2*m-d], center=true);
    }
}

module m4(m = 10, d = 2) {
    minkowski() {
        sphere(d=d, $fn=40);
        union() {
            cube([m-d,3*m-d,m-d], center=true);
            translate([0,-m,m/2]) cube([m-d,m-d,2*m-d], center=true);
        }
    }
}

module m5(m = 10, d = 2) {
    minkowski() {
        sphere(d=d, $fn=40);
        union() {
            cube([2*m-d,m-d,m-d], center=true);
            translate([m/2,-m/2,0]) cube([m-d,2*m-d,m-d], center=true);
            translate([m/2,-m,m/2]) cube([m-d,m-d,2*m-d], center=true);
        }
    }
}

module m6(m = 10, d = 2) {
    minkowski() {
        sphere(d=d, $fn=40);
        union() {
            cube([2*m-d,m-d,m-d], center=true);
            translate([-m/2,m/2,0]) cube([m-d,2*m-d,m-d], center=true);
            translate([-m/2,0,m/2]) cube([m-d,m-d,2*m-d], center=true);
            translate([-m/2,-m/2,m]) cube([m-d,2*m-d,m-d], center=true);
        }
    }
}

module make_cube(m = 10, d = 2) {
    translate([m/2+0.5,m+1,0]) m5(m, d);
    translate([-m/2-0.5,0,0]) m6(m, d);
    translate([0,m+2,m+1]) rotate([-90,0,0]) m1(m, d);
    translate([m+1,0,2*m+2]) rotate([0,-90,0]) m2(m, d);
    translate([0,-m-1,-1]) rotate([-90,0,0]) m3(m, d);
    translate([-m-1,-1,2*m+2]) rotate([0,90,0]) m4(m, d);
}

module print(m = 10, d = 2) {
    m5(m, d);
    translate([-3*m/2-5,-5,m/2]) rotate([0,-90,90]) m6(m, d);
    translate([-3*m/2-10,m+5,0]) rotate([-180,0,0]) m1(m, d);
    translate([3*m/2+5,-m-5,0]) m2(m, d);
    translate([m/2+5,2*m+10,0]) m3(m, d);
    translate([-1.5*m-10,-2*m-10,0]) rotate([0,-90,-90]) m4(m, d);
}

print(m = 20, d = 5);

