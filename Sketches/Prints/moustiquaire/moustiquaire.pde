import processing.pdf.*;

int spacing = 25;
PImage img;
int c1, c2, c3;
int c;

void settings() {
  img = loadImage("sandbanks.jpg");

  size(1080, 1080);
}

void setup() {
  beginRecord(PDF, "moustiquaire.pdf");

  //rectMode(CORNER);
  ellipseMode(CORNER);

  background(0);
  img.resize(1080, 1080);

  // noprotect
  for (int i = spacing; i < width - (spacing*2); i += spacing) {
    noStroke();
    beginShape();
    for (int j = spacing; j < height - (spacing*2); j += spacing) {
      c = img.get(i, j);
      fill(c);
      //rect(i,j, spacing, spacing,0);
      ellipse(i,j, spacing-5, spacing-5);
    }
    endShape();
  }
}
void draw() {
}

void keyPressed() {
  println("key pressed");
  println(key);
  if (key == 's') {
    endRecord();
    exit();
  }
}
