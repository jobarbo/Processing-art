import processing.pdf.*;

void setup() {
  size(1478,2000);
  rectMode(CENTER);
  beginRecord(PDF, "fractals.pdf");
  colorMode(HSB,360,100,100);
  background(230,30,25);
  for(int i = 0; i < 2000; i++){
    makeStars();
  }
}

void draw() {

  drawCircleUp(width/2,height/2-150,width/3,300,20,45);
  drawCircleDown(width/2,height/2+150,width/3,300,20,45);
  endRecord();
  noLoop();
}

void drawCircleUp(float x, float y, float d,float h,float s, float b) {
  noStroke();
  fill(h,s,b);
  ellipse(x,y,d,d);
  if(d > 5){

    drawCircleUp(x+d/2,y,d/2,h/1.1,s*1.02,b*1.2);
    drawCircleUp(x-d/2,y,d/2,h/1.1,s*1.02,b*1.2);
    drawCircleUp(x,y-d/2,d/2,h/1.3,s*1.02,b*1.2);
    //drawCircle(x,y,d/2,h/1.6,s*1.02,b*1.2);
  }
}

void drawCircleDown(float x, float y, float d,float h,float s, float b) {
  noStroke();
  fill(h,s,b);
  ellipse(x,y,d,d);
  if(d > 5){
    println(g);

    drawCircleDown(x+d/2,y,d/2,h/1.1,s*1.02,b*1.2);
    drawCircleDown(x-d/2,y,d/2,h/1.1,s*1.02,b*1.2);
    //drawCircle(x,y-d/2,d/2,h/1.3,s*1.02,b*1.2);
    drawCircleDown(x,y+d/2,d/2,h/1.3,s*1.02,b*1.2);
  }
}

void makeStars(){
  float starSize = random(2,4);
  float starAlpha = random(20,255);
  noStroke();
  fill(255,starAlpha);
  ellipse(random(0,width),random(0,height),starSize,starSize);
  
}
