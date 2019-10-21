int squareX, squareY;
int squareW,squareH;
PImage pic;
import processing.pdf.*;

void settings(){
  pic = loadImage("plage.jpg");
  size(pic.width,pic.height);
}

void setup(){
  
  beginRecord(PDF, "shapes.pdf");
  background(0);
  
  squareX = width/2;
  squareY = height/2;
  squareW = 100;
  squareH = 100;
  
  
  
  for(int i = 0;i<= 100000; i++){
    
    println(i);
    strokeWeight(1);
    noStroke();
    
    color pix = pic.get(squareX,squareY);
    fill(pix,15);
    rect(squareX,squareY,squareW,squareH);
    squareX = squareX + int(random(-100,100));
    squareY = squareY + int(random(-100,100));
    squareW = squareW + int(random(-50,50));
    squareH = squareH + int(random(-50,50));
    
    if(squareX <= 0){
      squareX = 0;
    }else if(squareX >= width){
      squareX = width;
    }
    
    if(squareY <= 0){
      squareY = 0;
    }else if (squareY >= height){
      squareY = height;
    }
  }
}

void draw(){
  
}

void keyPressed(){
  if (key == 's') {
    endRecord();
    exit();
  }
}
