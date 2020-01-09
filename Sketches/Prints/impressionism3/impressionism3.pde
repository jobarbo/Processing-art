import processing.pdf.*;

int index;
float pixel_brightness;
color redCol, blueCol, greenCol, alphaCol;
color backgroundCol;
PImage img;

float fractionLen = 0;
float fractionWidth = 0;

int cols;
int rows;
int[][] getPixelArr ;

IntList indexList = new IntList();

void settings() {
  img = loadImage("pixelart/beach.jpg");
  img.resize(img.width, img.height);
  img.loadPixels();
  size(img.width, img.height);
}

void setup() {

  beginRecord(PDF, "paint"+width+"x"+height+"_.pdf");

  backgroundCol = img.get(30, 30);
  background(backgroundCol);

  cols = img.width;
  rows = img.height;

  getPixelArr = new int[cols][rows];

  getImgColor();
}

void draw() {
  if (mouseX > 10 && mouseX < width-10 && mouseY > 10 && mouseY < height-10   ) {
    for (int i=0; i<30; i++) {
      paint();
    }
  } else {
    mouseX = 0;
    mouseY = 0;
  }
}


void getImgColor() {

  for (int x = 0; x < cols; x+=1) {
    for (int y = 0; y < rows; y+=1) {

      index = x + y * img.width;

      redCol = floor(red(img.pixels[index]));
      blueCol = floor(blue(img.pixels[index]));
      greenCol = floor(green(img.pixels[index]));
      alphaCol = floor(alpha(img.pixels[index])/(10 * random(0, 1)));

      pixel_brightness = (redCol + blueCol + greenCol)/3;

      getPixelArr[x][y] = color(redCol, greenCol, blueCol, pixel_brightness/(2 * random(0, 1)));
      //getPixelArr[x][y] = color(redCol, greenCol, blueCol, alphaCol);
    }
  }
}

void paint() {

  fractionLen = map(mouseX, 0, width, 2, 20);
  fractionWidth = map(mouseY, 0, height, 2, 5);
  //fractionLen = 15;
  //fractionWidth = 6;


  float angle = map(mouseX, 0, width, 1, 1.5);

  float c = cos(angle);

  float impasto = random(1, 1.1);

  noStroke();

  pushMatrix();


  int originalX = int(random(0, width));
  int originalY = int(random(0, height));
  float redValue = red(getPixelArr[originalX][originalY]);
  float greenValue = green(getPixelArr[originalX][originalY]);
  float blueValue = blue(getPixelArr[originalX][originalY]);
  float alphaValue = alpha(getPixelArr[originalX][originalY]);



  translate(originalX, originalY);
  
  int currentX = 0;
  int currentY = 0;

  rotate(c);
  noStroke();
  /*fill(0, 0, 0, alphaValue-80);
  ellipse(currentX+fractionLen/8, currentY, fractionLen+fractionWidth/2, fractionWidth/2.5);
  ellipse(currentX+fractionLen/5, currentY-fractionWidth, fractionLen*1.3, fractionWidth/2);
  ellipse(currentX+fractionLen/6, currentY+fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(currentX-fractionLen/13, currentY+fractionWidth, fractionLen*1.5, fractionWidth/1.6);
  ellipse(currentX+fractionLen/4, currentY-fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(currentX-fractionLen/16, currentY+fractionWidth*1.5, fractionLen*1.2, fractionWidth/4);
  ellipse(currentX-fractionLen/17, currentY+fractionWidth*1.4, fractionLen*1.3, fractionWidth/1.6);
  ellipse(currentX-fractionLen/18, currentY-fractionWidth*1.6, fractionLen*1.4, fractionWidth/2.5);
  ellipse(currentX-fractionLen/19, currentY+fractionWidth*1.7, fractionLen*1.7, fractionWidth/4);*/

  /*fill(redValue+80, greenValue+80, blueValue+80, alphaValue-10);
  ellipse(currentX+fractionLen/8, currentY, fractionLen+fractionWidth/2, fractionWidth/2.5);
  ellipse(currentX+fractionLen/8, currentY-fractionWidth, fractionLen*1.3, fractionWidth/2);
  ellipse(currentX+fractionLen/9, currentY+fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(currentX-fractionLen/6, currentY+fractionWidth, fractionLen*1.5, fractionWidth/1.6);
  ellipse(currentX+fractionLen/5, currentY-fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(currentX-fractionLen/12, currentY+fractionWidth*1.5, fractionLen*1.2, fractionWidth/4);
  ellipse(currentX-fractionLen/13, currentY+fractionWidth*1.4, fractionLen*1.3, fractionWidth/1.6);
  ellipse(currentX-fractionLen/14, currentY-fractionWidth*1.6, fractionLen*1.4, fractionWidth/2.5);
  ellipse(currentX-fractionLen/15, currentY+fractionWidth*1.7, fractionLen*1.7, fractionWidth/4);*/
  
  fill(getPixelArr[originalX][originalY]);
  ellipse(currentX, currentY, fractionLen+fractionWidth/2, fractionWidth/2.5);
  ellipse(currentX+fractionLen/10, currentY-fractionWidth, fractionLen*1.3, fractionWidth/2);
  ellipse(currentX+fractionLen/11, currentY+fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(currentX-fractionLen/9, currentY+fractionWidth, fractionLen*1.5, fractionWidth/1.6);
  ellipse(currentX+fractionLen/8, currentY-fractionWidth/2, fractionLen*1.2, fractionWidth/2.5);
  ellipse(currentX-fractionLen/10, currentY+fractionWidth*1.5, fractionLen*1.2, fractionWidth/4);
  ellipse(currentX-fractionLen/11, currentY+fractionWidth*1.4, fractionLen*1.3, fractionWidth/1.6);
  ellipse(currentX-fractionLen/12, currentY-fractionWidth*1.6, fractionLen*1.4, fractionWidth/2.5);
  ellipse(currentX-fractionLen/13, currentY+fractionWidth*1.7, fractionLen*1.7, fractionWidth/4);
  popMatrix();
}

void keyPressed() {
  if (key == 's') {
    endRecord();
    save("paint"+width+"x"+height+".png");
    exit();
  }
  if (key == 'c') {
    background(0);
  }
}
