class IteratedFunctionSystem{
  AffineTransformation[] transformations;
  float[] probabilities;
  IteratedFunctionSystem(AffineTransformation[] transformations, float[] probabilities){
    this.transformations = transformations;
    this.probabilities = probabilities;
    
  }
  
  ArrayList<Coordinate> run(Coordinate start, int iterations){
    ArrayList<Coordinate> points = new ArrayList();
    Coordinate current = new Coordinate(start.x, start.y);
    float r;
    float total;
    int tIndex = -1;
    AffineTransformation t;
    for(int i = 0; i < iterations; i++){
      r = random(1);
      total = 0;
      for(int j = 0; j < probabilities.length; j++){
        total += probabilities[j];
        if(r < total){
          tIndex = j;
          break;
        }
        
      }
      if(tIndex == -1){
        tIndex  = probabilities.length - 1;
      }
      t = transformations[tIndex];
      current = t.apply(current);
      points.add(current.copy());
    }
    return points;
  }

}
