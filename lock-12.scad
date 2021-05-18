/**
 * Copyright 2020 Marc SIBERT
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

module barre(jeu=0.05) {
    difference() {
        cube([100,20,20], center=true);
        translate([0,0,5]) cube([60+jeu*2,30+jeu*2,10+jeu*2], center=true);
        for (i=[0:3]) {
            rotate([45+i*90,0,0]) translate([0,15,0]) cube([101,5,5], center=true);
        }
        for (i=[-1,1], j=[0,2],k=[0,1]) {
            rotate([k*90,0,0]) rotate([0,45*i+90*j,0]) translate([43.3,0,28*i]) cube([5,21,5], center=true);
        }
    }
}

module barrePercee(jeu=0.05) {
    difference() {
        barre(jeu);
        translate([-10,-5,-5]) cube([20+jeu*2,10+jeu*2,10+jeu*2], center=true);
    }
}

module bank(x=0) {
    for (y=[0:5]) {
        if (x==0 &&  y==0) {
            barrePercee();
        } else
        translate([0,y*21,0]) barre();
    }
}

// bank(x=0);
bank(x=1);
