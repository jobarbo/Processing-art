import processing.pdf.*;

float spacingX = 10;
float spacingY = 10;

int index;
float pixel_brightness;
color redCol, blueCol, greenCol, alphaCol;
color backgroundCol;

int[][] getPixelArr ;

PImage img;

int cols;
int rows;

void settings() {

  img = loadImage("purps.jpg");
  img.resize(img.width, img.height);
  img.loadPixels();
  size(img.width, img.height);
}

void setup() {

  beginRecord(PDF, "name_"+width+"x"+height+".pdf");
  //colorMode(HSB, 360, 100, 100, 100);

  backgroundCol = img.get(10, height/2);
  background(backgroundCol);

  cols = img.width;
  rows = img.height;

  getPixelArr = new int[cols][rows];

  getImgColor();
  paint();
}

void draw() {
}

void getImgColor() {

  for (int x = 0; x < cols; x+=1) {
    for (int y = 0; y < rows; y+=1) {

      index = x + y * img.width;

      redCol = floor(red(img.pixels[index]));
      blueCol = floor(blue(img.pixels[index]));
      greenCol = floor(green(img.pixels[index]));
      alphaCol = floor(alpha(img.pixels[index]));

      //pixel_brightness = (redCol + blueCol + greenCol) / 3;

      getPixelArr[x][y] = color(redCol, greenCol, blueCol,alphaCol);
    }
  }
}

void paint() {
  for (int x=0; x<width; x+=spacingX) {
    for (int y=0; y<height; y+=spacingY) {
      noStroke();
      //int currentX = int(random(0, width));
      //int currentY = int(random(0, height));
      fill(getPixelArr[x][y]);
      //fill(random(0, 360), random(0, 20), random(0, 100));
      ellipse(x, y, random(0,spacingX), random(0,spacingY));
    }
  }
}

void mousePressed(){
  println(get(mouseX,mouseY));
}

void keyPressed() {
  if (key == 's') {
    endRecord();
    save("name_"+width+"x"+height+".png");
    exit();
  }
}
