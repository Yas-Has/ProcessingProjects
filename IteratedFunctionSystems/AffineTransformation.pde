class AffineTransformation{
  float a,b,c,d,e,f;
  AffineTransformation(float a, float b, float c, float d, float e, float f){
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
    this.e = e;
    this.f = f;
  
  }
  
  Coordinate apply(Coordinate pt){
    float newX = a*pt.x + b*pt.y + e;
    float newY = c*pt.x + d*pt.y + f;
    return new Coordinate(newX, newY);
  
  }
  
  
  

}
