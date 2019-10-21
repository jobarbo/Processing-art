import processing.pdf.*;

ArrayList<Particle> particles;
float x, y;
int individuals;
int spacing = 40;

void setup() {
  size(1280, 720);
  beginRecord(PDF, "beings.pdf");
  colorMode(HSB,360,100,100,100);
  individuals = 200;

  particles = new ArrayList<Particle>();

  background(202, 100,50 );
  //makeBackground();
}

void draw() {

  for (Particle p : particles) {

    p.move();
    p.display();
    p.shrink();
    
  }
  isParticleDead();
}

void mousePressed() {
  for (int particleNum = 0; particleNum < individuals; particleNum++) {

    float particleX = mouseX;
    float particleY = mouseY;
    particles.add( new Particle(particleX, particleY));
  }
}

void isParticleDead() {
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    if (p.diameter < 1) {
      particles.remove(i);
    }
  }
}

void makeBackground(){
  //background(70, 166, 200);
  for(int x = 0; x < width;x += spacing){
    for(int y = 0; y < height; y += spacing){
      noStroke();
      fill(random(0,255));
      rect(x,y,spacing,spacing);
      
    }
  }
}

void keyPressed(){
  if (key == 's') {
    endRecord();
    exit();
  }
}
