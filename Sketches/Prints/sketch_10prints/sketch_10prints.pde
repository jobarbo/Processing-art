import processing.pdf.*;

float x = 0;
float y = 0;

//float r = 250;
//float g = 187;
//float b = 187;

float r = 250;
float g = 187;
float b = 187;

float spacing = 15;

//configuration
void setup() {
  size(880, 880);
  beginRecord(PDF, "white-pink-bold-lines.pdf");
  background(255);
}

//loop
void draw() {
  float rand = random(0.5,1);
  strokeCap(ROUND);
  strokeWeight(2);
  if (rand < 0.25) {
    stroke(r,g,b);
    line(x, y, x + 10, y);    
  } else if (rand > 0.25 && rand < 0.5) {
    stroke(r,g,b);
    line(x, y+10 , x, y);
  } else if (rand > 0.5 && rand < 0.75) {
    stroke(r,g,b);
    //line(x, y+10 , x+10, y);
    triangle(x, y+10, x+10, y, x, y);
  } else if (rand > 0.75 && rand < 1) {
    stroke(r,g,b);
    //line(x, y , x+10, y+10);
    triangle(x, y, x+10, y+10, x+10, y);
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
