PImage img;
PShape globe;


void setup() {
  size(200, 200, P3D);
  img = loadImage("maze_raw.png");
  
}

void draw() {
  background(0);
  translate(100, 100, 0);
  if (mousePressed) {
    lights();
  }
  noStroke();
  fill(255);
  globe = createShape(SPHERE, 50);
  globe.setTexture(img);
}
