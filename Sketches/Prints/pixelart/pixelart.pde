import processing.pdf.*;

PImage img; // Declare variable 'img'.
float divW, divH;
float strokeX, strokeY;
float strokeCol;
float backgroundCol;

void settings() {
  // preload() runs once
  img = loadImage("assets/earth_fire.png"); // Load the image
  img.resize(img.width/2,img.height/2);
  img.loadPixels();
  size(img.width, img.height);
}

void setup() {
  //img.resize(img.width/2, img.height/2);

  backgroundCol = img.get(10, 10);
  divW = width / 75;
  divH = height / 60;
  //rectMode(CENTER);
  ellipseMode(CORNER);
  //image(img, 0, 0);

  background(backgroundCol);
  createGrid();

  endRecord();
  save("earth_pixel.png");
}

void createGrid() {
  for (int i = 0; i < width; i += divW) {
    for (int j = 0; j < height; j += divH) {
      color c = img.get(i, j);
      noStroke();
      fill(c);
      rect(i, j, divW, divH);
    }
  }
}
