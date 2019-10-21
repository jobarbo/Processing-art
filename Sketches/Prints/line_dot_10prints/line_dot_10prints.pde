import processing.pdf.*;

float x = 0;
float y = 0;

//float r = 250;
//float g = 187;
//float b = 187;

float r = 156;
float g = 175;
float b = 183;

float spacing = 30;
float colorSpacing = 20;

//configuration
void setup() {
  size(880, 880);
  beginRecord(PDF, "triangles-textures.pdf");
  background(66,129,164);
}

//loop
void draw() {
  float rand = int(random(0,5));
  strokeCap(ROUND);
  strokeWeight(4);
  if (rand == 2) {
    stroke(r,g,b);   
    line(x, y+spacing, x+spacing, y+spacing);
  } else if (rand == 4) {
    fill(r,g,b);
    //noFill();  
    ellipse(x, y+spacing, 10, 10);
  }
  x = x + spacing;

  if (x > width) {
    x = 0;
    y = y + spacing;
  }
  if (y >= height){
    println("done");
  }

}

void keyPressed() {
  if (key == 's') {
    endRecord();
    exit();
  }
}
