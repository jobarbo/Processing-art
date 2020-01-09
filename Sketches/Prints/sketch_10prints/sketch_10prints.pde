import processing.pdf.*;

float x = 0;
float y = 0;

float r = 255;
float g = 255;
float b = 255;

float spacing = 15;

//configuration
void setup() {
  size(880, 880);
  beginRecord(PDF, "10print_"+width+"x"+height+".pdf");
  background(20);
}

//loop
void draw() {
  float rand = random(0,1);
  strokeCap(ROUND);
  strokeWeight(2);
  if (rand < 0.25) {
    stroke(r,g,b);
    line(x, y, x + spacing, y);    
  } else if (rand > 0.25 && rand < 0.5) {
    stroke(r,g,b);
    line(x, y+spacing , x, y);
  } else if (rand > 0.5 && rand < 0.75) {
    stroke(r,g,b);
    line(x, y+spacing , x+spacing, y);
  } else if (rand > 0.75 && rand < 1) {
    stroke(r,g,b);
    line(x, y , x+spacing, y+spacing);
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
    save("name_"+width+"x"+height+".png");
    exit();
  }
}
