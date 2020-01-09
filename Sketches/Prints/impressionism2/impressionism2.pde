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

  img = loadImage("pixelart/landscape.jpg");
  img.resize(img.width/3, img.height/3);
  img.loadPixels();
  size(img.width, img.height);
}
void setup() {

  beginRecord(PDF, "landscape2.pdf");

  backgroundCol = 0;
  background(backgroundCol);

  cols = img.width;
  rows = img.height;

  getPixelArr = new int[cols][rows];

  getImgColor();
  shuffleIndex();
  paint();


  endRecord();
  save("landscape2_render.png");
}

void draw() {

}

void shuffleIndex() {
  for (int i = 0; i < img.pixels.length; i++) {
    indexList.append(i);
  }
  indexList.shuffle();
};

void getImgColor() {

  for (int x = 0; x < cols; x+=1) {
    for (int y = 0; y < rows; y+=1) {

      index = x + y * img.width;

      redCol = floor(red(img.pixels[index]));
      blueCol = floor(blue(img.pixels[index]));
      greenCol = floor(green(img.pixels[index]));
      alphaCol = floor(alpha(img.pixels[index])/(5 * random(0, 1)));

      pixel_brightness = (redCol + blueCol + greenCol)/3;

      //getPixelArr[x][y] = color(redCol, greenCol, blueCol, pixel_brightness/(10 * random(0, 1)));
      getPixelArr[x][y] = color(redCol, greenCol, blueCol, alphaCol);
    }
  }
}

void paint() {

  for (int index : indexList) {

    int currentX = index % width;
    int currentY = floor(index / width);

    fractionLen = width/150;
    fractionWidth = height/60;

    strokeWeight(fractionWidth);
    stroke(getPixelArr[currentX][currentY]);
    //line(currentX , currentY, currentX, currentY);
    //line(currentX + random(0, 1) * random(-20, 20), currentY, currentX + fractionLen, currentY + (fractionLen * random(0, 1)));
    line(currentX, currentY, currentX + (fractionLen * random(1, 1)), currentY + (fractionLen * random(0, 1)));
  }
}
