import processing.pdf.*;

PShape s;
float rad; 
float x = 1;
float y = 1;
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

float hue = 22;
float sat = 88;
float bright = 95;
float alfa = 20;

void setup() {
  size(864, 1296);
  beginRecord(PDF, "sunset.pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(197, 98, 25);
  //frameRate(5);
  //blendMode(SCREEN);

  createBackground();

  for (float debris = 0; debris <= 550; debris++) {
    createDebris();
  }

  while (iteration < limit) {
    //posX = random(100, width-100);
    //posY = random(100, height-100);
    posX = width/2;
    posY = height;
    rad = random(width/3, width/5);
    println(rad);
    for (float i=rad; i>0; i= i - rad/7) {
      drawCircle(i, posX, posY);
      hue = hue + 5;
      bright = bright + 10;
      sat = sat - 10;
      alfa = alfa + 25;
    }
    iteration++;
    hue = 22;
    bright = 95;
    sat = 88;
    alfa = 50;
  }
}

void draw() {
}

void drawCircle(float radius, float posX, float posY) {
  noStroke();
  fill(hue, sat, bright, alfa);
  //noFill();
  //stroke(hue, sat, bright, alfa);
  //strokeWeight(3);
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
    //fill(0);
    //ellipse(x, y, 5, 5);
  }
  endShape(CLOSE);
  //time = time + timeChange;
  pop();
}

void createDebris() {

  float dR = random(5, 10);
  float dX = random(10, width-10);
  float dY = random(10, height-10);
  float dA = map(dY, 0, height-300, random(60, 100), 0);
  noStroke();
  fill(33, 39, 85, dA);
  ellipse(dX, dY, dR, dR);
}

void createBackground() {

  float bHue = 12;
  float bSat = 50;
  float bBright = 100;
  float fade = 100;
  for (float c = height; c>height/2; c=c-1) {
    strokeWeight(1);
    stroke(bHue, bSat, bBright, fade);
    line(0, c, width, c);
    bHue = bHue +0.05;
    bSat = bSat - 0.0561; 
    bBright = bBright -0.0715;
    fade = fade - 0.25;
  }
}

void keyPressed() {
  println("key pressed");
  println(key);
  if (key == 's') {
    endRecord();
    exit();
  }
}
