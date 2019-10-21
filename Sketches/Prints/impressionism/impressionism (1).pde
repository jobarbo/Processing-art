import processing.pdf.*;
int index;
float pixel_brightness;
color redCol,blueCol,greenCol,alphaCol;
color backgroundCol;
PImage img;


int cols;
int rows;
int[][] getPixelArr ;

void settings(){

  img = loadImage("pixel_sunset.jpg");
  //img.resize(img.width/2,img.height/2);
  img.loadPixels();
  size(img.width,img.height); 
  
}
void setup() {

  beginRecord(PDF, "beach.pdf");
  
  cols = img.width;
  rows = img.height;
  
  getPixelArr = new int[cols][rows];
  //printArray(getPixelArr[2]);

  backgroundCol = img.get(10, height/2);
  background(backgroundCol);
  
  vanGogh();
  
  endRecord();
  save("beach.png");
}

void vanGogh() {
  float fractionLen = width/30;
  float fractionWidth = height/80;
  float total = img.width*img.height;
  float singlePix = 0;
  for (int x = 0; x < img.width; x+=1) {
    for (int y = 0; y < img.height; y+=1) {
      
      index = x + y * img.width;
      
      redCol = floor(red(img.pixels[index]));
      blueCol = floor(blue(img.pixels[index]));
      greenCol = floor(green(img.pixels[index]));
      alphaCol = floor(alpha(img.pixels[index]));

      pixel_brightness = (redCol + blueCol + greenCol) / 3;
      
      strokeWeight(fractionWidth * random(0,1));
      stroke(redCol,greenCol,blueCol,alphaCol/(50 * random(0,1)));
      line(x + random(0,1) * random(-5,20),y ,x + 150,y + (50 * random(0,1)));
      singlePix +=1;
     
    }
     println(floor(singlePix/total*100)+"% done!");
  }
}
