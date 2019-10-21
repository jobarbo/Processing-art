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

void settings() {

  img = loadImage("monet/paint.jpg");
  img.resize(img.width, img.height);
  img.loadPixels();
  size(img.width, img.height);
}
void setup() {

  beginRecord(PDF, "paint.pdf");

  backgroundCol = img.get(10, height/2);
  background(backgroundCol);

  //tint(255, 150);
  //image(img, 0, 0);

  cols = img.width;
  rows = img.height;

  getPixelArr = new int[cols][rows];

  getImgColor();
  paint();

  endRecord();
  save("paint_render.png");
}

void draw() {
  //paintMouse();
}

void getImgColor() {

  for (int x = 0; x < cols; x+=1) {
    for (int y = 0; y < rows; y+=1) {

      index = x + y * img.width;

      redCol = floor(red(img.pixels[index]));
      blueCol = floor(blue(img.pixels[index]));
      greenCol = floor(green(img.pixels[index]));
      alphaCol = floor(alpha(img.pixels[index]));

      pixel_brightness = (redCol + blueCol + greenCol) / 3;

      getPixelArr[x][y] = color(redCol, greenCol, blueCol, pixel_brightness/(10 * random(0, 1)));
    }
  }
}

void paint() {

  for (int i = 0; i <(cols*rows); i++) {

    int currentX = int(random(0, width));
    int currentY = int(random(0, height));

    fractionLen = random(5, 10);
    fractionWidth = random(5, 13);


    strokeWeight(fractionWidth * random(0, 1));
    stroke(getPixelArr[currentX][currentY]);
    //line(currentX + random(0, 1) * random(-20, 20), currentY, currentX + fractionLen, currentY + (fractionLen * random(0, 1)));
    line(currentX, currentY, currentX + (fractionLen * random(1, 1)), currentY + (fractionLen * random(0, 1)));
  }
}

void paintMouse() {

    int currentX = int(random(mouseX-5,mouseX+5));
    int currentY = int(random(mouseY-5,mouseY+5));

    if(currentX <=0){
      currentX = 0;
    }
    if (currentX >= width){
      currentX = width-1;
    }
    if(currentY<=0){
      currentY = 0;
    }
    if (currentY >= height){
      currentY = height-1;
    }
    fractionLen = random(5, 10);
    fractionWidth = random(5, 13);
    
    strokeWeight(fractionWidth * random(0, 1));
    stroke(getPixelArr[currentX][currentY]);
    //line(currentX + random(0, 1) * random(-20, 20), currentY, currentX + fractionLen, currentY + (fractionLen * random(0, 1)));
    line(currentX, currentY, currentX + (fractionLen * random(1, 1)), currentY + (fractionLen * random(0, 1)));

}
