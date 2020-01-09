import processing.pdf.*;

ArrayList<Being> tentacles;
float x, y;
int individuals;
int spacing = 40;

void setup() {
  
  size(800, 800);
  beginRecord(PDF, "beings"+width+"x"+height+"_.pdf");
  colorMode(HSB, 360, 100, 100, 100);
  individuals = 200;

  tentacles = new ArrayList<Being>();


  makeBackground();
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
  int beingHue = int(random(0,360));
  for (int BeingNum = 0; BeingNum < individuals; BeingNum++) {

    float BeingX = mouseX;
    float BeingY = mouseY;
    tentacles.add( new Being(BeingX, BeingY,beingHue));
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

void makeBackground() {  
  //background(202, 100, 50 );
  background(202, 0, 5);
  for (int i = 0; i < 1000; i++) {
    stroke(360, random(20, 100));
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
}
