import processing.pdf.*;

float circleX,circleY;
void setup(){
  size(800,800);
  beginRecord(PDF, "knot.pdf");
  background(0);
  
  circleX = width/2;
  circleY = height/2;
}

void draw(){

  ellipse(circleX,circleY,20,20);
  circleX += random(-5,5);
  circleY += random(-5,5);
  

}

void mousePressed(){
  endRecord();
  save("knot.png");
  exit();
}
