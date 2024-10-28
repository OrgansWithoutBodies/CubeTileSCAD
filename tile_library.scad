
 module diamond_blade(aspect_ratio=1,square_face_size=10,height=20){
    linear_extrude(height = height) {
diamond(aspect_ratio,square_face_size);
    }
 }
 module diamond(aspect_ratio,square_face_size){

hypotenuse = sqrt(2*((square_face_size/2)^2));
    scale(hypotenuse){
    scale([1,aspect_ratio]){
    rotate([0,0,45]){
        translate([-0.5,-0.5]){

    square();
        }}
    }
}}

 