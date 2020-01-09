import processing.pdf.*;

float circleX, circleY;

float randomX, randomY;


void setup() {
  size(1000, 1273);
  beginRecord(PDF, "knot_"+width+"x"+height+".pdf");

  circleX = width/2;
  circleY = height/2;
  background(0);

  makeStars();
}

void draw() {
  makeKnot();

}

void keyPressed() {
  if (key == 's') {
    endRecord();
   save("knot_"+width+"x"+height+".png");
    exit();
  }
}

void mousePressed() {
  makeKnot();
}

void makeKnot(){
  if(mousePressed){
    circleX = mouseX;
    circleY = mouseY;
  }
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse(circleX, circleY, 30, 30);
  circleX += random(-5, 5);
  circleY += random(-5, 5);
}

void makeStars() {
  background(0);

  for (int i = 0; i < 1500; i++) {
    stroke(255, random(70, 175));
    strokeWeight(random(1, 3));
    point(random(0, width), random(0, height));
  }
}
