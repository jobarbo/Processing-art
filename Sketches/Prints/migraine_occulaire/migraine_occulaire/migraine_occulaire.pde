import processing.pdf.*;

int spacing = 10;

void setup() {
  size(1080, 1080);
  beginRecord(PDF, "migraine-oculaire_"+width+"x"+height+".pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(40,5,95);

  float rectWidth = width/36;
  float spacing = width/24;
  float margin = spacing*2;
  int saturation = 0;
  int brightness = 20;

  for(float x=margin;x<=(width-margin);x+=spacing){
    float hue = random(0,360);
    for(float y=margin;y<=(height-margin);y+=spacing){
      stroke(hue,saturation,brightness);
      fill(hue,saturation,brightness);
      ellipse(x,y,rectWidth,rectWidth);
      hue+=10;
      if(hue>=360 ){
        hue = 0;
      }
    }
  }

  for(float lineNum = 0;lineNum < 60;lineNum++){
    float randomX = random(0,width);
    float randomY = random(0,height);
    float diffX = random(-randomX,randomX);
    float diffY = random(-randomY,randomY);
    strokeWeight(random(5,10));
    strokeCap(ROUND);
    stroke(40,5,95);
    line(randomX,randomY,randomX+diffX,randomY+diffY);
  }
}

void draw() {
 
}



void keyPressed() {
  if (key == 's') {
    endRecord();
    save("migraine-oculaire_"+width+"x"+height+".png");
    exit();
  }
}
