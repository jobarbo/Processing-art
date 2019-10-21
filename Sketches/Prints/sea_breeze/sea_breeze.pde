import processing.pdf.*;

float x = 0;
float y = 0;

//float r = 250;
//float g = 187;
//float b = 187;

float r = 156;
float g = 175;
float b = 183;

float spacing = 60;
float colorSpacing = 20;

//configuration
void setup() {
  size(1080, 1669);
  beginRecord(PDF, "triangles-textures.pdf");
  background(66,129,164);
}

//loop
void draw() {
  float rand = random(0,1);
  strokeCap(ROUND);
  strokeWeight(10);
  if (rand < 0.25) {
    stroke(r,g,b);   
    line(x, y+spacing, x+spacing, y+spacing);
  } else if (rand > 0.25 && rand < 0.5) {
    //fill(r-colorSpacing,g,b);
    //noFill();  
    //ellipse(x, y+spacing, 20, 20);
  }
  x = x + spacing;

  if (x > width) {
    x = 0;
    y = y + spacing;
  }
  if (y >= height-spacing){
    println("done");
  }

}

void keyPressed() {
  if (key == 's') {
    endRecord();
    exit();
  }
}
