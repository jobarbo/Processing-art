import processing.pdf.*;

float hillY;
float hillX = 0;
float hillY2;
float hillX2 = 0;

float waveSpacing;
float waveY;
float waveX = 0;
float waveY2;
float waveX2 = 0;
float waveLen = 300; 
float waveLen2 = height/2;

float hillSpacing = 5;
float hillC1 = 15;
float hillC2 = 50;
float hillC3 = 50;
float hillLen = 300; 
float hillLen2 = height/2;

float hillEnd;
float waveEnd;

float strokeW = 3;
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

float sunHue = 4;
float sunSat = 65;
float sunBright = 60;
float sunAlpha = 30;

float waveHue = 45;
float waveSat = 40;
float waveBright = 85;

void setup() {
  size(1411, 1996);

  beginRecord(PDF, "desert.pdf");
  colorMode(HSB, 360, 100, 100);
  background(200, 20, 80);
  strokeCap(ROUND);

  hillSpacing = width/50;
  waveSpacing = width/5;

  while (iteration < limit) {
    posX = width/1.4;
    posY = height/1.4;
    rad = random(height, height+50);
    println(rad);
    for (float i=rad; i>0; i= i - rad/40) {
      drawSun(i, posX, posY);
      sunHue = sunHue +1 ;
      sunBright = sunBright + 1;
      sunSat = sunSat + 1;
      sunAlpha = sunAlpha + 1;
    }
    iteration++;
    sunHue = 22;
    sunBright = 95;
    sunSat = 88;
    sunAlpha = 50;
  }

  hillY = (height/1.56 );
  hillY2 = (height/1.56);
  hillEnd = width+hillSpacing;
  for (int i=0; i<=10; i++) {
    createHills();
    hillC3 = hillC3-5;
    hillC2 = hillC2+7;
    hillC1 = hillC1-5;

    hillY2 = hillY2 + 45;
  }

  waveY = (height/1.1);
  waveY2 = (height/1.1);
  waveEnd = width+waveSpacing;
  for (int i=0; i<=3; i++) {
    createWave();
    waveY2 = waveY2 + 25;
  }

  endRecord();
}

void draw() {
};

void createHills() {
  hillX2 = 0;
  fill(hillC1, hillC2, hillC3);
  beginShape();
  curveVertex(hillX2, hillY2-hillLen2);
  while (hillX2<=hillEnd) {
    stroke(hillC1, hillC2, hillC3);
    strokeWeight(strokeW);
    hillLen2 = hillLen2 + random(-15, 15);
    curveVertex(hillX2, hillY2-hillLen2);
    hillX2 = hillX2 + hillSpacing;
  }
  curveVertex(hillX2, hillY2-hillLen2);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void createWave() {
  waveX2 = 0;
  fill(waveHue, waveSat, waveBright);
  beginShape();
  curveVertex(waveX2, waveY2-waveLen2);
  while (waveX2<=waveEnd) {
    stroke(waveHue, waveSat, waveBright);
    strokeWeight(strokeW);
    waveLen2 = waveLen2 + random(-20, 20);
    curveVertex(waveX2, waveY2-waveLen2);
    waveX2 = waveX2 + waveSpacing;
  }
  curveVertex(waveX2, waveY2-waveLen2);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  waveHue = waveHue-5;
  waveSat = waveSat+5;
  waveBright = waveBright-10;
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
}
