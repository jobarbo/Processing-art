import processing.svg.*;
boolean record;

float h = 255;
float s = 250;
float b = 50;

float sizeRand;
float opacityRand;
float angle;


void setup() {
  //size(1200,160);
  //size(1200,160, SVG, "clairdelune.svg");
  size(1440, 400);
  colorMode(HSB,360,100,100);


  background(270,250,20);


  // Create random stars
  for (float starsCount = 0; starsCount < 350; starsCount = starsCount +1) {
    opacityRand = random(60, 200);
    sizeRand = random(1, 3);
    stroke(255, opacityRand);
    fill(255, opacityRand);
    ellipse(random(0, width), random(0, height), sizeRand, sizeRand);
  }

  noStroke();
  rectMode(CENTER);

  for (float i = height; i > 20; i = i - 40) {
    fill(h, s, b);
    push();
    translate(random(0, width), height);
    rotate(radians(45));      
    rect(0, 0, 20-i, 20-i);
    pop();


    h = h + 3.15;
    s = s + 0;
    b = b + 10;

    h = constrain(h, 0, 350);
    s = constrain(s, 0, 100);
    b = constrain(b, 0, 100);
  }
}

void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(SVG, "frame-####.svg");
  }

  if (record) {
    endRecord();
    record = false;
  }
}

void mousePressed() {
  record = true;
  saveFrame("line-######.png");
}
