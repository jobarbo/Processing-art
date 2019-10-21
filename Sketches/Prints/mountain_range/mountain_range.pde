import processing.pdf.*;
boolean record;

float h = 167;
float s = 99;
float b = 76;

float h2 = 15;
float s2 = 60;
float b2 = 90;

float sizeRand;
float opacityRand;
float angle;


void setup() {
  //size(1200,160);
  //size(1200,160, SVG, "clairdelune.svg");
  size(1080, 1080);
  beginRecord(PDF, "shapes.pdf");
  colorMode(HSB, 360, 100, 100);
  record = true;

  background(63, 22, 95);


  // Create random stars
  for (float starsCount = 0; starsCount < 350; starsCount = starsCount +1) {
    opacityRand = random(60, 200);
    sizeRand = random(1, 3);
    //stroke(255, opacityRand);
    //fill(255, opacityRand);
    //ellipse(random(0, width), random(0, height), sizeRand, sizeRand);
  }

  noStroke();
  rectMode(CENTER);

  for (float i = width/3; i > 30; i = i - 55) {
    fill(h2, s2, b2);

    ellipse(width-100, 100, 20-i, 20-i);
    //rotate(radians(0.1));
    //translate(0,50);
    h2 = h2 + 4.5;
    //s2 = s2 + 50;
    //b2 = b2 + 20;

    h2 = constrain(h2, 0, 250);
    s2 = constrain(s2, 0, 100);
    b2 = constrain(b2, 0, 100);
  }

  for (float i = height; i > 20; i = i - 70) {
    fill(h, s, b);
    push();
    translate(random(0, width), height);
    rotate(radians(45));      
    rect(0, 0, 20-i, 20-i);
    pop();


    h = h + 0.55;
    s = s + 0;
    b = b - 3;

    h = constrain(h, 0, 350);
    s = constrain(s, 0, 100);
    b = constrain(b, 0, 100);
  }
}

void draw() {
}

void mousePressed() {

  saveFrame("line-######.png");
}

void keyPressed(){
  if (key == 's') {
    endRecord();
    exit();
  }
}
