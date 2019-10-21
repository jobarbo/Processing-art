import processing.pdf.*;

float y;
float x = 0;
float y2;
float x2 = 0;
float spacing = 120;
float strokeW = 3;

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
  size(2750, 1375);

  beginRecord(PDF, "seascape.pdf");
  colorMode(HSB, 360, 100, 100);
  background(0, 9, 94);
  strokeCap(ROUND);

  while (iteration < limit) {
    posX = width/1.3;
    posY = height/1.3;
    rad = random(width, width*1.3);

    for (float i=rad; i>0; i= i - rad/10) {
      drawSun(i, posX, posY);
    }
    iteration++;
  }

  y = (height/1.5);
  y2 = (height/1.5);
  endLegs = width+spacing;
  for (int i=0; i<=3; i++) {
    createWave();
    y2 = y2 + 180;
  }

  endRecord();
}

void createWave() {
  x2 = 0;
  fill(waveHue, waveSat, waveBright);
  beginShape();
  curveVertex(x2, y2-len2);
  while (x2<=endLegs) {
    stroke(waveHue, waveSat, waveBright);
    strokeWeight(strokeW);
    len2 = len2 + random(-20, 20);
    curveVertex(x2, y2-len2);
    x2 = x2 + spacing;
  }
  curveVertex(x2, y2-len2);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  waveHue = waveHue+5;
  waveSat = waveSat+5;
}

void drawSun(float radius, float posX, float posY) {
  noStroke();
  fill(sunHue, sunSat, sunBright, sunAlpha);
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
