void setup(){
  
}



void draw(){
  
}

AffineTransformation midpoint(Coordinate point){
    // return the affine transformation which sends points halfway to point
  return new AffineTransformation(0.5, 0, 0, 0.5, point.x/2, point.y/2);
}
