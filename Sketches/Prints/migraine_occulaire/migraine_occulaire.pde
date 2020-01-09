import processing.pdf.*;

int spacing = 10;

void setup() {
  size(1080, 1080);
  beginRecord(PDF, "name_"+width+"x"+height+".pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(360);

  float rectWidth = width/36;
  float spacing = width/24;
  int saturation = 100;
  int brightness = 0;

  for(float x=spacing;x<width;x+=spacing){
    float hue = random(0,360);
    for(float y=spacing;y<height;y+=spacing){
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
    stroke(360);
    line(randomX,randomY,randomX+diffX,randomY+diffY);
  }
}

void draw() {
 
}



void keyPressed() {
  if (key == 's') {
    endRecord();
    save("name_"+width+"x"+height+".png");
    exit();
  }
}
