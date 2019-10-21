

float shapeW;
float shapeH;
float divide;
float rad;
int spacing; 
float c1, c2, c3;

void setup() { 
  size(1482, 2000);
  colorMode(HSB, 360, 100, 100, 100);

  rad = 100;
  spacing = 5  ;
  shapeW = width/2;
  shapeH = height/2;
  divide = 2;
  c1 = 180 ;
  c2 = 20;
  c3 = 85;
  background(351 , 16, 100);
  drawLine();
  saveFrame("recursive-######.png");
}

void drawLine() {
  fill(c1, c2, c3);
  noStroke();
  rectMode(CENTER);
  rect(width/2, height/1.5, shapeW, shapeH,rad);
  c1 = c1 +0;
  c2 = c2 +spacing*3;
  c3 = c3 -spacing;
  rad = rad+spacing;
  shapeW = shapeW/divide;
  shapeH = shapeH/divide;
  println(c1);
  if(c1<=0){
    c1=360;
  }
  if (shapeW > 10) {
    drawLine();
  }
}
