import processing.pdf.*;

int spacing = 10;

void setup() {
  size(1080, 1080);
  beginRecord(PDF, "name_"+width+"x"+height+".pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(360);

  const rectWidth = width/36;
  const spacing = width/24;
  let saturation = 100;
  let brightness = 10;

  for(x=spacing;x<width;x+=spacing){
    let hue = random(0,360);
    for(y=spacing;y<height;y+=spacing){
      stroke(hue,saturation,brightness);
      fill(hue,saturation,brightness);
      ellipse(x,y,rectWidth,rectWidth);
      hue+=10;
      if(hue>=360 ){
        hue = 0;
      }
    }
  }

  for(lineNum = 0;lineNum < 60;lineNum++){
    let randomX = random(0,width);
    let randomY = random(0,height);
    let diffX = random(-randomX,randomX);
    let diffY = random(-randomY,randomY);
    strokeWeight(random(5,10));
    strokeCap(round);
    stroke(360)
    line(randomX,randomY,randomX+diffX,randomY+diffY);
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
