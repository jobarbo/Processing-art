import processing.pdf.*;

float y;
float x = 50;
float y2;
float x2 = 50;
float spacing = 10;
float strokeW = 3  ;
float strokeC1 = 162;
float strokeC2 = 141;
float strokeC3 = 98;
float len =  height; 
float len2 = height;
float endLegs;
void setup() {
  size(3483, 896);
  beginRecord(PDF, "golden_flag.pdf");
  background(25);
  strokeCap(ROUND);
  spacing = width/200            ;  
  len =  height/3; 
  len2 = height/6;
  y = (height/2);
  y2 = (height/2);
  endLegs = width - 30        ;
  noFill();
  beginShape();
  curveVertex(x, y+len);
  while (x<=endLegs) {
    stroke(strokeC1, strokeC2, strokeC3);
    strokeWeight(strokeW);
    len = len + random(-20, 20);
    //curveVertex(x,y);
    curveVertex(x, y+len);
    line(x, y, x, y+len);
    x = x + spacing;
  }
  curveVertex(x, y+len);
  endShape();
  beginShape();
  curveVertex(x2, y2-len2);
  while (x2<=endLegs) {
    stroke(strokeC1, strokeC2, strokeC3);
    strokeWeight(strokeW);
    len2 = len2 + random(-20, 20);
    curveVertex(x2, y2-len2);
    line(x2, y2, x2, y2-len2);
    x2 = x2 + spacing;
  }
  curveVertex(x2, y2-len2);
  endShape();
  endRecord();
}
