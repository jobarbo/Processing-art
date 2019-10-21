int squareX, squareY;
import processing.pdf.*;

void settings(){
  size(1080,1080);
}

void setup(){
  
  beginRecord(PDF, "shapes.pdf");
  background(255,255,251);
  
  squareX = width/2;
  squareY = height/2;
  
  
  
  
  for(int i = 0;i<= 2000000; i++){
    
    println(i);
    strokeWeight(1);
    noStroke();
    
    fill(0,48,63,15);
    rect(squareX,squareY,1,1);
    squareX = squareX + int(random(-2,2));
    squareY = squareY + int(random(-2,2));
    
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
