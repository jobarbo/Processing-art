import processing.pdf.*;

float cPosX;
float cPosY;
float cWidth;
float cBright;

void setup() {
  size(1080, 1080);
  
  beginRecord(PDF, "mountain_##.pdf"); 
  colorMode(HSB,360,100,100);
  
  background(19, 19, 100);
  
  createBackground();
  createNoise();
  createSun();
  createMountain();
  
  endRecord();

}

void createBackground() {

  float hue = 69;
  for (int c = 0; c<height; c++) {
      stroke(hue, 16, 99);
      line(0, c, width, c);
      hue = hue +0.2;
  }
}

void createSun() {
  noStroke();
  fill(345, 80, 80);
  ellipse(width/2, height/2, 250, 250);
}

void createMountain() {
  cPosX = width/2;
  fill(223, 69, 27);
  triangle(width/2, height/2, 0, height, width, height);
}

void createNoise() {
  for (int i = 0; i < 8000; i++) {

    stroke(250, 100, 100, 45);
    strokeWeight(random(1, 3));
    point(random(0, width), random(0, height));
  }
}

void mousePressed(){
  saveFrame("mountain_#########.png");

}
