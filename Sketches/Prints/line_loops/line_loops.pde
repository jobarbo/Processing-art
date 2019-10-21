import processing.pdf.*;

float x,y,x2,y2;
float strokeW, strokeDir;
float r,g,b;

void setup(){
  size(1944, 1368);
  beginRecord(PDF, "shapes.pdf");
  background(20,20,20);
  
  x = width/15;
  y = height/2 - 200;
  x2 = width/15;
  y2 = height/2 + 200;
   
  r = 72;
  g = 148;
  b = 139;
  
  strokeW = 1;
  strokeDir = 1;
  strokeCap(SQUARE);
  
}

void draw(){
  println(x2);
  for(float i = x; i < width-(width/15) ; i = i + 50){
    stroke(r,g,b);
    strokeWeight(strokeW);
    line(x,y,x2,y2);
    x = x + 46;
    x2 = x;
    r = r + 3;
    g = g - 1;
    b = b + 1;
    strokeW = strokeW + strokeDir;
    
    if(strokeW > 18 || strokeW <= 0){
      strokeDir = strokeDir * -1;
    
    }
    
  }
  
}

void keyPressed(){
  if (key == 's') {
    endRecord();
    exit();
  }
}
