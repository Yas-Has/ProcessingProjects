class Coordinate{
  float x, y;
  Coordinate(float x, float y){
    this.x = x;
    this.y = y;
  }
  Coordinate copy(){
    return new Coordinate(this.x, this.y);
  }
  
}
