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
  float strokeCol;
  float beingType ;
  Being(float particleX, float particleY, float hue, float saturation, float brightness, float stroke, float randXminus, float randXplus, float randYminus, float randYplus, float type) {
    x = particleX;
    y = particleY;
    diameter = random(20, 30);
    alpha = 155;
    chaosXMinus = random(0, randXminus);
    chaosXPlus = random(0, randXplus);
    chaosYMinus = random(0, randYminus);
    chaosYPlus = random(0, randYplus);
    h = random(220, 240);
    s = saturation;
    b = brightness;
    strokeCol = stroke;
    beingType = type;
  }

  void move() {
    x += random(-chaosXMinus, chaosXPlus);
    y += random(-chaosYMinus, chaosYPlus);
  }

  void shrink() {
    diameter -= 0.1;
    if (beingType == 0) {
      s -= 0.5;
      b -= 0.5;
    } else {
      s -=  0.5;
      b +=  0.5;
    }
  }

  void display() {
    strokeWeight(1);
    stroke(strokeCol, 10);
    //noStroke();
    fill(h, s, b, alpha);
    ellipse(x, y, diameter, diameter);
  }
}
