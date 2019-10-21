// Jitter class
class Particle {
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
  Particle(float particleX, float particleY) {
    x = particleX;
    y = particleY;
    diameter = random(10, 20);
    speed = 1;
    alpha = 255;
    chaosXMinus = random(0, 1);
    chaosXPlus = random(0, 1);
    chaosYMinus = random(0, 1);
    chaosYPlus = random(0, 4);
    h = random(300, 360);
    s = random(70, 130);
    b = random(20, 40);
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
    stroke(360, 20);
    //noStroke();
    fill(h, s, b, alpha);
    ellipse(x, y, diameter, diameter);
  }
}
