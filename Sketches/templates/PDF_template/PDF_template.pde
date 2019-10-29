import processing.pdf.*;



void setup() {
  size(1080, 1080);
  beginRecord(PDF, "name_"+width+"x"+height+".pdf");
  colorMode(HSB, 360, 100, 100, 100);

}

void draw() {
  ellipse(width/2,height/2,20,20);

}



void keyPressed() {
  if (key == 's') {
    endRecord();
    save("name_"+width+"x"+height+".png");
    exit();
  }
}
