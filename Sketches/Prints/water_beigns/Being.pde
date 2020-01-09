// Jitter class
class Being {
  float x;
  float y; 
  float diameter; 
  float speed; 
  float alpha; 
  float chaosXMinus; 
  float chaosXPlus;
  float chaosYMinus;
  float chaosYPlus;
  float h;
  float s;
  float b;
  Being(float particleX, float particleY,float hue,float randXminus, float randXplus,float randYminus,float randYplus) {
    x = particleX;
    y = particleY;
    diameter = random(20, 30);
    alpha = 155;
    chaosXMinus = random(0, randXminus);
    chaosXPlus = random(0, randXplus);
    chaosYMinus = random(0, randYminus);
    chaosYPlus = random(0, randYplus);
    //h = random(300, 360);
    //s = random(70, 100);
    //b = random(20, 40);
    h = hue;
    s = random(30,60);
    b = random(5,25);
  }

  void move() {
    x += random(-chaosXMinus, chaosXPlus);
    y += random(-chaosYMinus, chaosYPlus);

  }

  void shrink() {
    diameter -= 0.1;
  }

  void display() {
    strokeWeight(1);
    stroke(360, 10);
    //noStroke();
    fill(h, s, b, alpha);
    ellipse(x, y, diameter, diameter);
  }
}
