void setup(){
  size(1000, 1000);
  /*
  fern
  AffineTransformation at0 = new AffineTransformation(0, 0, 0, 0.16, 0, 0);
  AffineTransformation at1 = new AffineTransformation(0.85, 0.04, -0.04, 0.85, 0, 1.6);
  AffineTransformation at2 = new AffineTransformation(0.2, -0.26, 0.23, 0.22, 0, 1.6);
  AffineTransformation at3 = new AffineTransformation(-0.15, 0.28, 0.26, 0.24, 0, 0.44);
  
  AffineTransformation[] atall = new AffineTransformation[]{at0, at1, at2, at3};
  float[] p = new float[]{0.01, 0.85, 0.07, 0.07};
  */
  
  /*
  tree
  AffineTransformation at0 = new AffineTransformation(0, 0, 0, 0.5, 0, 0);
  AffineTransformation at1 = new AffineTransformation(0.42, -0.42, 0.42, 0.42, 0, 0.2);
  AffineTransformation at2 = new AffineTransformation(0.42, 0.42, -0.42, 0.42, 0, 0.2);
  AffineTransformation at3 = new AffineTransformation(0.1, 0, 0, 0.1, 0, 0.2);
  
  
  AffineTransformation[] atall = new AffineTransformation[]{at0, at1, at2, at3};
  float[] p = new float[]{0.05, 0.4, 0.4, 0.15};
  */
  
  
  IteratedFunctionSystem ifs = new IteratedFunctionSystem(atall, p);
  Coordinate start = new Coordinate(random(width), random(height));
  ArrayList<Coordinate> c = ifs.run(start, 1000000);
  
  background(0);
  stroke(0, 255, 0);
  for(Coordinate f: c){
    point(f.x*1000 + 500, height - f.y*1000);
  }
  
  
}



void draw(){
  
}

AffineTransformation midpoint(Coordinate point){
    // return the affine transformation which sends points halfway to point
  return new AffineTransformation(0.5, 0, 0, 0.5, point.x/2, point.y/2);
}

IteratedFunctionSystem poly(int n, float fraction){
   float angle = 2*PI/n;
   int len = 400;
   AffineTransformation[] atall = new AffineTransformation[n];
   float[] p = new float[n];
   
   for(int i = 0; i < n; i++){
     AffineTransformation at = midpoint(new Coordinate(len*cos(angle*i), len*sin(angle*i)));
     atall[i] = at;
     p[i] = 1.0/n;
   }
   
   return new IteratedFunctionSystem(atall, p);

}
