import processing.pdf.*;

float recStartX;
float recStartY;
float recWidth;

PImage img;

float recWidth2;
float direction;
float hue;

void setup() {
  size(560, 700);
  beginRecord(PDF, "transistors.pdf"); 
  colorMode(HSB, 360, 100, 100);
  
  rectMode(CENTER);

  initRect();

  

  background(170, 95, 95);
}

void draw() {
  if (mousePressed) {
    if (recStartX <= width-60) {
      fill(hue, 89, 100);
      rect(recStartX, recStartY, recWidth, recWidth2);
      recStartX = recStartX + direction;
      recWidth = recWidth + random(-10, 10);
      recWidth2 = recWidth2 + random(-10, 10);
      hue = hue + int(random(-10,10));
    }
  }
}

void mousePressed() {
  initRect();
}

void keyPressed(){
  saveFrame("#########_sketch.png");
  endRecord();
}

void initRect() {
  hue = 35;
  
  recStartX = mouseX;
  recStartY = mouseY;
  recWidth = random(5, 20);
  recWidth2 = random(recWidth-5, recWidth+5);
  direction = random(5, 8);
}
