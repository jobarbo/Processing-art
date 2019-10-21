import processing.pdf.*;

float x = 0;
float y = 0;

//float r = 250;
//float g = 187;
//float b = 187;

float r = 72;
float g = 148;
float b = 139;

float spacing = 30;
float colorSpacing = 20;

//configuration
void setup() {
  size(880, 880);
  beginRecord(PDF, "triangles-textures.pdf");
  background(234,181,185);
}

//loop
void draw() {
  float rand = random(0,1);
  strokeCap(ROUND);
  //strokeWeight(2);
  noStroke();
  if (rand < 0.25) {
    fill(r,g-colorSpacing,b);
    //line(x, y, x + 10, y);    
    triangle(x, y+spacing, x+spacing, y+spacing, x+spacing, y);
  } else if (rand > 0.25 && rand < 0.5) {
    fill(r-colorSpacing,g,b);
    //line(x, y+10 , x, y);
    triangle(x, y+spacing, x+spacing, y, x, y);
  } else if (rand > 0.5 && rand < 0.75) {
    fill(r,g+colorSpacing,b);
    //line(x, y+10 , x+10, y);
    triangle(x, y+spacing, x+spacing, y+spacing, x, y);
  } else if (rand > 0.75 && rand < 1) {
    fill(r,g,b-colorSpacing);
    //line(x, y , x+10, y+10);
    triangle(x, y, x+spacing, y+spacing, x+spacing, y);
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
