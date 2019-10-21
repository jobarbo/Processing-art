float leftX, leftY, leftX2, leftY2;
float rightX, rightY, rightX2, rightY2;
float dist, dir;
float r,g,b;


void setup() {
  size(1080, 1080);

  dist = 0;
  dir = 1;
  r = 15;
  g = 114;
  b = 85;
  background(220, 199, 190);
}

void draw() {

  if (mousePressed == true) {
    println(dist);
    leftX = mouseX - dist;
    leftY = mouseY;
    leftX2 = mouseX-1;
    leftY2 = mouseY;
    rightX = mouseX + dist;
    rightY = mouseY;
    rightX2 = mouseX+1;
    rightY2 = mouseY;

    strokeWeight(3);
    stroke(r,g,b);
    line(leftX, leftY, leftX2, leftY2);
    line(rightX, rightY, rightX2, rightY2);
    dist = dist + dir;
    
    if(dist >=60 || dist <= 0){
      dir = dir * -1;
    }
  }
}
