import processing.pdf.*;

float y;
float x = 50;
float spacing = 25;
float strokeW = 2;
float strokeC1 = 163;
float strokeC2 = 138;
float strokeC3 = 81;
float colorVal = 10;
float len = 300; 
float endLegs;
void setup() {
  size(1080, 1080);
  beginRecord(PDF, "panflute.pdf");
  background(25);
  strokeCap(ROUND);
  y = (height/2)-(len/2);
  endLegs = width - 50;


  while (x<=endLegs) {
    len = len + random(-15, 7);
    stroke(strokeC1, strokeC2, strokeC3);
    strokeWeight(strokeW);
    line(x, y, x, y+len);
    x = x + spacing;
    strokeW = strokeW + 0.5;
    colorVal = colorVal + random(1, 3);
  }
  endRecord();
}
