import processing.pdf.*;
boolean record;

float h = 255;
float s = 100;
float b = 60;

float sizeRand;
float opacityRand;
float angle;


void setup() {
  size(1000, 1273);
  beginRecord(PDF, "clairdelune_"+width+"x"+height+".pdf");
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

  for (float i = height; i > 10; i = i - 260) {
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

void draw(){

}

void keyPressed() {
  if (key == 's') {
    endRecord();
    save("name_"+width+"x"+height+".png");
    exit();
  }
}
