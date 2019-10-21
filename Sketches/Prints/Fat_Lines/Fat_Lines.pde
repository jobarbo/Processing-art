import processing.pdf.*;
float h = 15;
float s = 250;
float b = 250;

float angle;


void setup(){
   
  size(1000,1000);
  //size(1920,600);
  
  beginRecord(PDF, "fatline.pdf"); 
  colorMode(HSB);

  background(130,150,220);
  noStroke();

  rectMode(CENTER);
  
 
  for(float i = width+20 ; i > 30; i = i - 55){
    fill(h,s,b);

    ellipse(width/2,0,20-i,20-i);
    //rotate(radians(0.1));
    translate(0,50);
    h = h + 2.5;
    //s = s + 50;
    //b = b + 20;
    
    h = constrain(h,0,250);
    s = constrain(s,0,250);
    b = constrain(b,0,250);
  }
  
  
 
}

void draw(){
  
 
}

void mousePressed(){
  saveFrame("#########_fat_lines.png");
  endRecord();
}
