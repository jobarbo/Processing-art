import processing.pdf.*;

float y;
float x = 100;
float y2;
float x2 = 100;
float spacing = 20 ;
float strokeW = 3  ;
float strokeC1 = 3;
float strokeC2 = 150;
float strokeC3 = 166;
float len = 300; 
float len2 = height/2;
float endLegs;
void setup() {
  size(1527, 1200);
  beginRecord(PDF, "glacier_"+width+"x"+height+".pdf");
  background(242,220,220);
  strokeCap(ROUND);
  
  y = (height/2);
  y2 = (height/2);
  endLegs = width - x;

  noFill();
  beginShape();
  curveVertex(x, y+len);
  while (x<=endLegs) {
    stroke(strokeC1, strokeC2, strokeC3);
    strokeWeight(strokeW);
    len = len + random(-15, 7);
    //curveVertex(x,y);
    //curveVertex(x, y+len);
    line(x, y, width/2, height/2+350);
    x = x + spacing;
  }
  curveVertex(x, y+len);
  endShape();
  beginShape();
  curveVertex(x2, y2-len2);
  while (x2<=endLegs) {
    stroke(strokeC1, strokeC2, strokeC3);
    strokeWeight(strokeW);
    len2 = len2 + random(-7, 15);
    curveVertex(x2, y2-len2);
    line(x2, y2, x2, y2-len2);
    x2 = x2 + spacing;
  }
  curveVertex(x2, y2-len2);
  endShape();
  save("glacier_"+width+"x"+height+".png");
  endRecord();
}
