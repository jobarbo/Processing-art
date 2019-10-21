import processing.pdf.*;
PImage img;

void setup() {

  size(1000, 1000);

  beginRecord(PDF, "fatline2.pdf"); 
  smooth();
  background(255);  

  fill(255);
  rect(0, 0, width, height/2);

  fill(0);
  rect(0, height/2, width, height);

}

void draw() {


  rectMode(CORNERS);
  strokeWeight(2);
  if (mouseY < height/2) {

    stroke(0);
  } else {
    stroke(255);
  }
  rect(mouseX, height/2, mouseX, mouseY);
}

void mousePressed() {
  saveFrame("#########_sketch.png");
  endRecord();
}
