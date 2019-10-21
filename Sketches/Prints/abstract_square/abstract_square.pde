import processing.pdf.*;
color c1 = #fcdd9e;
color c2 = #faab8c;
color c3 = #c69897;
color c4 = #8a838b;
color c5 = #e9e3b4;
color c6 = #007A9D;


color[] colors  = {  
  c1, c2, c3, c4
};

void setup() {
  size(1080, 1080);
  beginRecord(PDF, "###.pdf");     
  smooth();
  rectMode(CENTER);
  background(#48464b);    

  int i = 0;
  
  makeRectangle(i);
}
void draw() {

}
void mousePressed(){
  saveFrame("new_#########.png");
  endRecord();
}

void makeRectangle(int i) {

  while (i<=30) {

    int ranCol= int(random(0, colors.length));
    int ranEl= int(random(0, colors.length));
    float posX = random(250, width-250);
    float posY = random(250, height-250);
    float rectH = random(20, 250);
    float rectW = random(20, 250);
    float radius = random(20, 150);


    if (i % 5 == 0) {
      
      noStroke();
      fill(colors[ranCol]);
      rect(posX, posY, rectW, rectH);
    } else if (i % 7 == 0) {
      strokeWeight(3);
      stroke(colors[ranCol]);
      noFill();
      rect(posX, posY, rectW, rectH);
    } else if (i % 3 == 0) {
      blendMode(EXCLUSION);
      ellipseMode(CENTER);
      noStroke();
      fill(colors[ranEl]);
      ellipse(posX, posY, radius, radius);
    }
    blendMode(BLEND);
    i++;
  }
};
