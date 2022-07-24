// CSG.scad - Basic example of CSG usage
$fn=50;
width=97;
length=225;
thiccness=22;
tooldepth=3;
sbt1x=135;
sbt1y=7;
sbt2x=sbt1x+13;
sbt2y=sbt1y+13;

module gem(){
    linear_extrude(height = 5, center = true, convexity = 1)offset(delta=0.001)import(file = "gemonly.svg", center = false, dpi = 220);
}
module chamtopcyl(a,b,c){
    union(){
        cylinder(a,b,c);
        translate([0,0,a*0.72]){cylinder(b,b,b*2);};
    };};
module driverholder() {
     union(){
     chamtopcyl(25,8.25,8.25);
            };};
module threadlocker() {
     chamtopcyl(25,10.5,10.5);
            };
module flashlight() {
     chamtopcyl(25,12,12);
            };
module quarter() {
     rotate([0,90,180]){cylinder(2,12,12);};
            };
module stick() {
     chamtopcyl(25,1.1,1.1);
            };
module tweezers() {
     cube([3,12,64]);
     translate([15,0,0]){cube([2,11,64]);};
            };
module twcone() {
    cylinder(25,0.5,2);
};
module tweezers2() {twcone();translate([13,0,0]){twcone();};
translate([1.75,13,0]){twcone();translate([9,0,0]){twcone();}}
};
module bmtool() {
     chamtopcyl(25,2.7,2.7);
            };
module booze() {
     chamtopcyl(25,20.5,20.5);
            };           
module oils() {
     union(){
     chamtopcyl(25,11,11);
     translate([0,27,0]){chamtopcyl(25,12.5,12.5);};
     translate([0,54,0]){chamtopcyl(25,11,11);};
     translate([-29,65,0]){chamtopcyl(25,12.5,12.5);};
     };};

module leatherman() {
     union(){
     cube([20,20,64]);
     translate([33,0,0]){cube([20,20,64]);};
     };}
module sbt() {
     cylinder(30,1.25,1.25);
     translate([0,0,15]){cylinder(30,2.5,2.5);};
            };
module patchholder() {
    union(){
     cube([64,64,64]);
     translate([1,18,2]){gem();};
     translate([32,10,20]){
     rotate([90,0,0]){cylinder(25,20,20);};};
            };};
     
            
module bits(){
    union(){
    cylinder(r=7.75/2,h=15,$fn=6);
    translate([10,0,0]){cylinder(r=7.75/2,h=15,$fn=6);};
    translate([20,0,0]){cylinder(r=7.75/2,h=15,$fn=6);};
    translate([30,0,0]){cylinder(r=7.75/2,h=15,$fn=6);};
    translate([45,0,0]){cylinder(r=7.75/2,h=15,$fn=6);};
    translate([45,0,-14]){cylinder(r=2,h=25);};

        };};
module allenholder() {
    union(){
     cube([31,20,64]);
            };};
module pryholder() {
     cube([10,7.5,64]);
            };
module qtip() {
    difference(){
     cube([38,44,40]);
        translate([1.5,1.5,1]){cube([35,41,50]);};
            };};
 module qtiphole() {
    difference(){
     cube([38,44,50]);
            };};     
module ratbastard() {
     cube([21,7.5,64]);
            };
module baseshapehull() {
    hull(){
     hullrad=11;
     hullrad2=10;
     translate([hullrad,hullrad,0]){cylinder(thiccness,hullrad,hullrad2);};
     translate([length-hullrad,width-hullrad,0]){cylinder(thiccness,hullrad,hullrad2);};
     translate([hullrad,width-hullrad,0]){cylinder(thiccness,hullrad,hullrad2);};
     translate([length-hullrad,hullrad,0]){cylinder(thiccness,hullrad,hullrad2);};
            };};
            
module holder(){
translate([0,0,0]) {
    difference() {
        baseshapehull();
        translate([12,69,tooldepth]){driverholder();};
        translate([31,69,tooldepth]){driverholder();};
        translate([50,69,tooldepth]){driverholder();};
        translate([15,35,tooldepth]){allenholder();};
        translate([11,45,27]){quarter();};
        translate([7,45,27]){quarter();};
        translate([sbt2x,sbt1y,tooldepth]){sbt();};
        translate([(sbt2x+sbt1x)/2,(sbt2y+sbt1y)/2,tooldepth]){stick();};
        translate([62,3,tooldepth]){patchholder();};
        translate([sbt1x,sbt1y,tooldepth]){sbt();};
        translate([sbt2x,sbt1y,tooldepth]){sbt();};
        translate([(sbt2x+sbt1x)/2,(sbt2y+sbt1y)/2,tooldepth]){stick();};
        translate([sbt1x,sbt2y,tooldepth]){sbt();};
        translate([sbt2x,sbt2y,tooldepth]){sbt();};
        translate([(sbt2x+sbt1x)/2,sbt2y+12,tooldepth]){bmtool();};
        translate([(sbt2x+sbt1x)/2-9.5,sbt2y+26,tooldepth]){tweezers2();};
        translate([66,72,tooldepth]){leatherman();};
        translate([50,41,tooldepth]){pryholder();};
        translate([200,73,tooldepth]){booze();};
        translate([164,15,tooldepth]){oils();};
        translate([15,17,tooldepth]){threadlocker();};
        translate([42,17,tooldepth]){flashlight();};
        translate([153,85,tooldepth]){ratbastard();};
        translate([10,90,thiccness-7]){bits();};
        translate([181,5,tooldepth]){qtiphole();};

    };
    union(){
        translate([181,5,tooldepth]){qtip();};

    };

};};

holder();
//gem();
