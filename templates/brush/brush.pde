void setup() {
  size(660, 660);

  background(255);
}

void draw() {
  float ellipseY = height/2;
  float ellipseX = width/2;
  background(255);

  float fractionLen = map(mouseX, 0, width, 6, 200);
  float fractionWidth = map(mouseY, 0, height, 1, 5);


  fill(0);
  ellipse(ellipseX, ellipseY, fractionLen+fractionWidth/2, fractionWidth/2.5);
  ellipse(ellipseX+fractionLen/10, ellipseY-fractionWidth, fractionLen*1.3, fractionWidth/2);
  ellipse(ellipseX+fractionLen/11, ellipseY+fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(ellipseX-fractionLen/9, ellipseY+fractionWidth, fractionLen*1.5, fractionWidth/1.6);
  ellipse(ellipseX+fractionLen/8, ellipseY-fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(ellipseX-fractionLen/10, ellipseY+fractionWidth*1.5, fractionLen*1.2, fractionWidth/4);
  ellipse(ellipseX-fractionLen/11, ellipseY+fractionWidth*1.4, fractionLen*1.3, fractionWidth/1.6);
  ellipse(ellipseX-fractionLen/12, ellipseY-fractionWidth*1.6, fractionLen*1.4, fractionWidth/2.5);
  ellipse(ellipseX-fractionLen/13, ellipseY+fractionWidth*1.7, fractionLen*1.7, fractionWidth/4);
}
