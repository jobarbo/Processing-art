import processing.pdf.*;

float amp = 1; //Max amplitude
int amountOfLines = 50; 
float s; //Separation between liens
float  strokeW = 2;

void setup() {
  size(1080, 1080);
  beginRecord(PDF, "joy-division.pdf");
  s=(height-amp)/amountOfLines;

  background(0);

  pushMatrix();
  translate(width/2, s+amp);

  final int start = -width/2;
  final int end = width/2;

  strokeW = 2;
  for (int i=0; i<amountOfLines; i++) {

    //Black shape under White Line
    fill(0);
    noStroke();

    beginShape();
    curveVertex(start, mFunction(start, i)*amp + i*s);
    for (int x=start; x<end; x+=5) {
      curveVertex(x, mFunction(x, i)*amp + i*s);
    }
    curveVertex(end, mFunction(end, i)*amp + i*s);
    curveVertex(end, mFunction(end, i)*amp + i*s);
    vertex(start, mFunction(start, i)*amp + i*s);
    endShape();



    //White Line
    noFill();
    stroke(255);

    strokeWeight(strokeW);
    beginShape();
    curveVertex(start, mFunction(start, i)*amp + i*s);
    for (int x=start; x<end; x+=5) {
      curveVertex(x, mFunction(x, i)*amp + i*s);
    }
    curveVertex(end, mFunction(end, i)*amp + i*s);
    curveVertex(end, mFunction(end, i)*amp + i*s);
    amp = amp+3;
    endShape();

  }

  popMatrix();

  fill(255);
  endRecord();
}

void draw() {
}

float mFunction(float x, int y) {
  x*=0.015;
  float currentValue = -noise(x+width, frameCount*0.01, y); //Add width (or any number in order to make x postive) so I dont get a symetric function 
  if (x==0) return currentValue;
  return currentValue*pow(sin(x)/x, 2); //currentValue modulated by Sinc, idea from how light difracts
}
