import processing.pdf.*;

float circleX;
float circleY;
float c1,c2,c3,circleW;

// Your basic setup
void setup() {
  
  //this is the size of the canvas
  size(400,400);
  
  //we are initializing the var circleX
  circleX = width;
  
  //same but with Y of circle
  circleY = height/2;
  
  c1= 121;
  c2= 78;
  c3= 178;
  
  circleW = 30;
  
  background(255);
  
  beginRecord(PDF, "mendala.pdf");  

}
void draw() {
  

  noStroke();
  fill(c1,c2,c3,random(0,100));
  ellipse(circleX,circleY,circleW,circleW);
  
  //logic
  c1 = c1 + random(-5,5);
  c2 = c2 + random(-5,5);
  c3 = c3 + random(-5,5);
  circleX = circleX - random(.01,1);// random(-5,5);
  circleY = circleY + random(-2,2);
  circleW = circleW + random(-1,1.1);
  
}

void mousePressed() {
  saveFrame("###########_sketch.png");
  endRecord();
}
