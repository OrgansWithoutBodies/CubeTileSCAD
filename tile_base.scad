include <tile_library.scad>
 EXTERNAL_CUBE_SIZE=10;
 CUBE_MODULE_WIDTH=2;
 WINDOW_SUBTRACTION=1;
 PEG_HEIGHT=1;
 $fn=20;
module cube_blade(){
    square_face_size=EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH-WINDOW_SUBTRACTION;
 group(){
 diamond_blade(square_face_size=square_face_size);

 rotate([90,0,0]){
    diamond_blade(square_face_size=square_face_size);

        translate([0,0,EXTERNAL_CUBE_SIZE/2-5*CUBE_MODULE_WIDTH/16]){
    diamond_blade(square_face_size=EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH,height=CUBE_MODULE_WIDTH/8);
    }
 }
 rotate([-90,0,0]){
    diamond_blade(square_face_size=square_face_size);
        translate([0,0,EXTERNAL_CUBE_SIZE/2-5*CUBE_MODULE_WIDTH/16]){
    diamond_blade(square_face_size=EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH,height=CUBE_MODULE_WIDTH/8);
    }

 }
 rotate([0,90,0]){
    diamond_blade(square_face_size=square_face_size);
        translate([0,0,EXTERNAL_CUBE_SIZE/2-5*CUBE_MODULE_WIDTH/16]){
    diamond_blade(square_face_size=EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH,height=CUBE_MODULE_WIDTH/8);
    }

 }
 rotate([0,-90,0]){
    diamond_blade(square_face_size=square_face_size);
    translate([0,0,EXTERNAL_CUBE_SIZE/2-5*CUBE_MODULE_WIDTH/16]){
    diamond_blade(square_face_size=EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH,height=CUBE_MODULE_WIDTH/8);
    }
 }
 }

}
// ======
 module joint_cube(){

 difference(){
 difference(){
    cube(EXTERNAL_CUBE_SIZE,center=true);
    intersection(){
        sphere((EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH)/2+2);
        cube(EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH,center=true);
    }
 }
cube_blade();
 
 }}
//  =====
module bottom_half(){
  difference() {
    union(){
 difference(){
 joint_cube();
// cut off top half
 translate([-10,-10]){
 cube(20);
 }
 }
 group(){

 translate([EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4,EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4,0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 translate([-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 } 
 }

 group(){

 translate([-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4,0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 translate([(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 } }
 }
module top_half(){
    union(){
  difference() {
 difference(){
 joint_cube();
// cut off top half
 translate([-10,-10,-20]){
 cube(20);
 }
 }
 group(){

 translate([EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4,EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4,0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 translate([-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 } 
 }

 group(){

 translate([-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4,0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 translate([(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),-(EXTERNAL_CUBE_SIZE/2-CUBE_MODULE_WIDTH/4),0]){
 cylinder(h = PEG_HEIGHT, r = CUBE_MODULE_WIDTH/8,center=true);
 }
 } }
 }

module hand(){
    scale([1.5/100,1.5/100,1.5/100]){
import(".inputs/hand.stl");
    }
}
module hand_tile(){
    union() {

translate([0,0,CUBE_MODULE_WIDTH/8]){

hand();
}
blank_tile();


    }
}
module blank_tile(){
diamond_blade(height=CUBE_MODULE_WIDTH/8,square_face_size=EXTERNAL_CUBE_SIZE-CUBE_MODULE_WIDTH);

}

//  bottom_half();

// top_half();
hand_tile();

// blank_tile();
