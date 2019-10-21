import processing.pdf.*;

boolean record;

int cols, rows;
int scl = 60;
int w = 5100;
int h = 3600;

float circleX = width -50;
float circleY = 50;

float flying = 0;

float [][] terrain;



void setup() {
  size(3300, 5100, P3D);

  beginRecord(PDF, "sea-wave.pdf");
  
  colorMode(HSB, 360, 100, 100, 100); 
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];

  background(185, 80, 80);
 
  flying -= 1.4;

  float yOff = flying;
  for (int y = 0; y< rows; y++) {
    float xOff = 5;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, -50, 50);
      xOff += 0.1;
    }
    yOff += 0.1;
  }

  translate(width/2, height/2);

  pushMatrix();
  translate(-width/2, -height, -400);
  float hue = 180;
  float alpha = 25;
  for (int c = 0; c<height; c++) {
    stroke(hue, 100, 99, alpha);
    line(-width/2, c, width*2, c);
    hue = hue -0.1;
    alpha = alpha - 0.12;
  }

  popMatrix();

  pushMatrix();
  translate(250, -300, -390);
  fill(340, 70, 80, 100);
  noStroke();
  ellipse(0, 0, width/4, width/4);
  popMatrix();

  rotateX(PI/3);


  stroke(340, 0, 100);
  //fill(340, 70, 80);
  fill(340, 0, 100);

  float stW = 1;

  translate(-w/2, -h/4);
  for (int y = 0; y< rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    strokeWeight(stW);
    stW ++;
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}

void draw() {

  
}

void mousePressed() {
  saveFrame("new_#########.png");
  exit();

}

void keyPressed() {
  if (key == 's') {
    endRecord();
    exit();
  }
}
