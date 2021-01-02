// noprotect

int rectWidth = 30;

double minX = -2;
double maxX = 1;
double minY = -1;
double maxY = 1;

double map(double value, double min1, double max1, double min2, double max2){
  return (value - min1)*(max2 - min2)/(max1 - min1) + min2;
}

class ComplexNumber{
  double real;
  double imag;
  ComplexNumber(double real,double imag) {
    this.real = real;
    this.imag = imag;
  }
}
ComplexNumber getSquare(ComplexNumber z){
  return new ComplexNumber(z.real *z.real - z.imag *z.imag, 2 * z.real * z.imag);
}

ComplexNumber add(ComplexNumber z1, ComplexNumber z2){
  return new ComplexNumber(z1.real + z2.real, z1.imag + z2.imag);
}


double radius(ComplexNumber z){
  return Math.sqrt(z.real * z.real + z.imag * z.imag);
}

void mouseClicked(){
  
  //double newminX;
  //double newminY;
  //double newmaxX;
  //double newmaxY;
  //to do
  double[] newmin = screen_to_plot(mouseX - rectWidth/2,mouseY - (rectWidth * 2/3)/2);
  double newminX = newmin[0];
  double newminY = newmin[1];
  //[newminX, newminY] = screen_to_plot(mouseX - rectWidth/2,mouseY - (rectWidth * 2/3)/2);
  
  
  double[] newmax = screen_to_plot(mouseX + rectWidth/2,mouseY + (rectWidth * 2/3)/2);
  double newmaxX = newmax[0];
  double newmaxY = newmax[1];
  
  //[newmaxX, newmaxY] = screen_to_plot(mouseX + rectWidth/2,mouseY + (rectWidth * 2/3)/2);
  
  //[minX, minY, maxX, maxY] = [newminX, newmaxY, newmaxX, newminY]
  minX = newminX;
  minY = newmaxY;
  maxX = newmaxX;
  maxY = newminY;
  
  background(100);
  createFractal();

  loadPixels();

}

double[] screen_to_plot(double x,double y) {
  double plot_x = map(x, 0, width, minX, maxX);
  double plot_y = map(y, 0, height, maxY, minY);
  
  return new double[]{plot_x, plot_y};
}

void mouseWheel(MouseEvent event){

  rectWidth += event.getCount()*2;
  if (rectWidth < 10){
    rectWidth = 10;
  }

}

void keyPressed (){
  if (keyCode == 82){
    minX = -2;
    maxX = 1;
    minY = -1;
    maxY = 1;
    background(100);
    createFractal();
    
    loadPixels();
  
  
  }
}

void createFractal(){
 
  for (int x = 0; x <= width; x++){
    for (int y = 0; y <= height; y++){

      double[] smtg = screen_to_plot(x,y);
      double real = smtg[0];
      double imag = smtg[1];
      
      ComplexNumber z = new ComplexNumber(0,0);

      ComplexNumber c = new ComplexNumber(real, imag);
      
      int numIterations = 0;
      
      while (numIterations < divergeBound && radius(z) < 2) {
        z = iterator(z, c);
        numIterations++;
        
      }
      
      
      stroke(numIterations, divergeBound, divergeBound);
      
      point(x,y);
      
    }
  }


}


int divergeBound = 150;

ComplexNumber iterator(ComplexNumber z,ComplexNumber c) {
  return add(getSquare(z),c);
}


void setup() {
  size(900, 600);
  colorMode(HSB, divergeBound, divergeBound, divergeBound);
  createFractal();
  loadPixels();
}


void draw() {

  updatePixels();
  noFill();
  stroke(100);
  rect(mouseX - rectWidth/2, mouseY - (rectWidth * 2/3)/2, rectWidth, rectWidth * 2/3);
  
}
