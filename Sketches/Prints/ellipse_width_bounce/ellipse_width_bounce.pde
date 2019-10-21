import processing.pdf.*;

float dir = 1;
float circleWidth = 1;

float rectWidth = 1;

int shapeMode = 0;

float mX = -150;
float mY = -150;

float deg = 150;

float alpha = 100;


color elColor2 = color(0,48,73);
color elColor1 = color(247,127,0);
color background = color(234,226,183);

color currentColor = elColor1;

void setup(){
  size(1080, 1080);
  beginRecord(PDF, "shapes.pdf");
  background(background);
  rectMode(CENTER);

}

void draw(){
  mX = mouseX;
  mY = mouseY;

  
  changeDir();
  changeColor();
  if(mousePressed){
    generateShape();
  } 
  println();
  
}

void keyPressed(){
  
  if(key == '1'){
    shapeMode = 1;
  }if(key == '0'){
    shapeMode = 0;
  }if (key == 's') {
    endRecord();
    exit();
  }
}

void changeDir(){

  
  if(shapeMode == 1){
    if(circleWidth <= 0 || circleWidth >= 120){
      dir = dir * -1;
    }
  }
  
  if(shapeMode == 0){
    if(rectWidth <= 0 || rectWidth >= 120){
      dir = dir * -1;
    }
  }
}

void changeColor(){
  if(dir == -1 || dir == -1){
    currentColor = elColor1;
  }else{
    currentColor = elColor2;
  }
}

void generateShape(){
  
    strokeWeight(5);
    fill(currentColor,alpha);
    //stroke(currentColor,alpha);
    //noFill();
    noStroke();
    alpha = constrain(alpha, 0,100);
    if(shapeMode == 0){
      
      pushMatrix();
      translate(mX,mY);
      rotate(deg);
      rect(0,0,rectWidth,rectWidth);
      popMatrix();
      //deg += 0.1;
      rectWidth = rectWidth+dir;
      //alpha = alpha - dir;
    }
 
    if(shapeMode == 1){
      ellipse(mX,mY,circleWidth,circleWidth);
      circleWidth = circleWidth+dir;
      //alpha = alpha - dir;
    }
 
  }
  
