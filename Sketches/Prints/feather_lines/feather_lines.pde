import processing.pdf.*;
float i;
float elX,elY;

void setup(){
  size(1080,1080);
  
  beginRecord(PDF, "###.pdf");     
  smooth();
  colorMode(HSB, 360);
  
  i = 0;
  background(215,67,34);
  feather(i);
}

void draw(){

  
  
}

void feather(float iteration){
  for(float i = iteration; i<10000;i++){
    if(i % 2 == 0 ){
      elX = (random(200,width-200));
      elY = (random(200,height-200));
      stroke(60+(elX*0.1),360,240,60);
      //fill(140+(elX*0.5),250,140,60);
      line(elX,elY,elY+2,elX+2);
     }
  }
}

void mousePressed(){
  saveFrame("new_#########.png");
  endRecord();
}
