import processing.pdf.*;
float linePosX,linePosY, linePosX2, linePosY2;

void setup() {
  size(400, 400);
  beginRecord(PDF, "everything.pdf");
  background(0);

  linePosX = mouseX -200;
  linePosY = height;

  linePosX2 = mouseX +200;
  linePosY2 = 0;
}

void draw() {

  if (mousePressed){
    stroke(255,255,255,25);
    line(mouseX, linePosY, mouseY, linePosY2);
  }

}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
