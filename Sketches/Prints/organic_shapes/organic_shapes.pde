import processing.pdf.*;

PShape s;
float rad; 
float x = 1;
float y = 1;
float posX;
float posY;
float resolution = 3;

float iteration = 0;
float limit = 1;

float time = 0;
float timeChange = 0.2;

float noiseVal;
float noiseIntensity = 1.5;
float noiseAmplitude = 1.5;

float hue = 22;
float sat = 88;
float bright = 95;
float alfa = 100;

void setup() {
  size(1080, 1080);
  beginRecord(PDF, "mitosis.pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(197, 98, 75);
  //frameRate(5);

  

  for (float debris = 0; debris <= 1050; debris++) {
    createDebris();
  }

  while (iteration < limit) {
    //posX = random(100, width-100);
    //posY = random(100, height-100);
    posX = width/2;
    posY = height;
    rad = random(width/5, width/3);
    println(rad);
    for (float i=rad; i>0; i= i - rad/7) {
      drawCircle(i, posX, posY);
      hue = hue + 5;
      bright = bright + 10;
      sat = sat - 10;
    }
    iteration++;
    hue = 22;
    bright = 95;
    sat = 88;
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
    vertex(x, y);
    //fill(0);
    //ellipse(x, y, 5, 5);
  }
  endShape(CLOSE);
  //time = time + timeChange;
  pop();
}

void createDebris() {
  float dA = random(10, 80);
  float dR = random(5, 10);
  float dX = random(10, width-10);
  float dY = random(10, height-10);
  noStroke();
  fill(33, 39, 85, dA);
  ellipse(dX, dY, dR, dR);
}

void keyPressed() {
  println("key pressed");
  println(key);
  if (key == 's') {
    endRecord();
    exit();
  }
}
