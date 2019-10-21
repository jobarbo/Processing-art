import processing.pdf.*;

float y;
float x = 0;
float y2;
float x2 = 0;
float spacing = 120;
float strokeW = 3;
float sw = 100;

float dividedBy =25;

float len = 300; 
float len2 = height/2;
float endLegs;

float rad; 

float posX;
float posY;
float resolution = 150;

float iteration = 0;
float limit = 1;

float time = 0;
float timeChange = 0.2;

float noiseVal;
float noiseIntensity = 0.8;
float noiseAmplitude = 1.5;

float sunHue = 0;
float sunSat = 9;
float sunBright = 95;
float sunAlpha = 20;

float waveHue = 186;
float waveSat = 70;
float waveBright = 65;

void setup() {
  size(1764, 2495);

  beginRecord(PDF, "tree_rings_blue.pdf");
  colorMode(HSB, 360, 100, 100);
  //background(0, 9, 94);
  background(203, 100, 31);
  strokeCap(ROUND);

  while (iteration < limit) {
    posX = width+50;
    posY = height+50;
    rad = random(width*1.5, width*1.5);

    for (float i=rad; i>0; i= i - rad/20) {
      drawSun(i, posX, posY,sw);
      sw = sw/1.17;
    }
    
    iteration++;
  }

  endRecord();
}


void drawSun(float radius, float posX, float posY,float sw) {
  //noStroke();
  noFill();
  strokeWeight(sw);
  stroke(0,0,100);
  push();
  translate( posX, posY);
  strokeJoin(ROUND);
  beginShape();
  time = time + timeChange;
  for (float a = 0; a < TWO_PI; a+=TWO_PI/resolution) {
    float noiseVal = map(noise(cos(a)*noiseIntensity+1, sin(a)*noiseIntensity+1, time), 0, 1, noiseAmplitude, 1.0);
    float r = radius + noiseVal;
    float x = cos(a) * r * noiseVal;
    float y = sin(a) * r * noiseVal;
    curveVertex(x, y);
  }
  endShape(CLOSE);
  pop();
  sunHue = sunHue +1 ;
  sunBright = sunBright + 8;
  sunSat = sunSat + 5;
  sunAlpha = sunAlpha + 6;
  
  
}
