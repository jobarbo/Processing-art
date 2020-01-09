import processing.pdf.*;

ArrayList<Being> tentacles;
float x, y;
int individuals;
int spacing = 40;
boolean beingCreated = false;
int beingType = 0;
int beingHue = 0;
int beingSaturation = 0;
int beingBright = 0;
int strokeCol = 0;
void setup() {
  size(1080, 1080);
  beginRecord(PDF, "beings"+width+"x"+height+"_.pdf");
  colorMode(HSB, 360, 100, 100, 100);
  individuals = 50;

  tentacles = new ArrayList<Being>();

  makeBackground();
  makeForeGround();
}

void draw() {

  for (Being p : tentacles) {

    p.move();
    p.display();
    p.shrink();
  }
  isBeingDead();
}


void mousePressed() {

  if (beingCreated == false) {
    if (beingType == 0) {
      for (int BeingNum = 0; BeingNum < individuals; BeingNum++) {
        //beingHue = 100;
        beingSaturation = 100;
        beingBright = 90;
        strokeCol = 360;
        float BeingX = mouseX;
        float BeingY = mouseY;
        float randXminus = random(0, 1);
        float randXplus = random(1, 3);
        float randYminus = random(1, 3);
        float randYplus = random(0, 1);
        tentacles.add( new Being(BeingX, BeingY, beingHue,beingSaturation,beingBright,strokeCol, randXminus, randXplus, randYminus, randYplus, beingType));
      }
      beingCreated = true;
    }
    if (beingType == 1) {
      for (int BeingNum = 0; BeingNum < individuals; BeingNum++) {
        //beingHue = 250;
        beingSaturation = 100;
        beingBright = 90;
        strokeCol = 0;
        float BeingX = mouseX;
        float BeingY = mouseY;
        float randXminus = random(1, 3);
        float randXplus = random(0, 1);
        float randYminus = random(0, 1);
        float randYplus = random(1, 3);
        tentacles.add( new Being(BeingX, BeingY, beingHue,beingSaturation,beingBright,strokeCol, randXminus, randXplus, randYminus, randYplus,beingType));
      }
      beingCreated = true;
    }
  } else {
    //makeForeGround();
    return;
  }
}
void isBeingDead() {
  for (int i = 0; i < tentacles.size(); i++) {
    Being p = tentacles.get(i);
    if (p.diameter < 1) {
      tentacles.remove(i);
    }
  }
}
void makeForeGround() {
  float value0 = 10;
  float bright0 = map(value0, 0, 100, 0, height);
  for (int i=0; i < width; i++) {
    strokeWeight(3);
    stroke(220, 100, bright0);
    line(0, i, width, height);
    bright0--;
  }

  for (int i = 0; i < 1000; i++) {

    stroke(360, random(20, 100));
    strokeWeight(random(1, 3));
    point(random(0, width), random(0, height));
  }
}
void makeBackground() {  
  background(0);
  float value1 = 7;

  float bright1 = map(value1, 0, 100, 0, height);

  for (int i=0; i < height; i++) {
    strokeWeight(3);
    stroke(220, bright1, 100);
    line(i, 0, width, height);
    bright1--;
  }

  for (int i = 0; i < 1000; i++) {

    stroke(0, random(20, 100));
    strokeWeight(random(1, 3));
    point(random(0, width), random(0, height));
  }
}

void keyPressed() {
  if (key == 's') {
    endRecord();
    save("beings"+width+"x"+height+".png");
    exit();
  }
  if (key == '1') {
    beingType = 1;
    beingCreated = false;
  }
  if (key == '0') {
    beingType = 0;
    beingCreated = false;
  }
}
