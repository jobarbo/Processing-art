void setup(){
  size(1440,700);
  background(255);
  
  //antialiasing
  smooth();
  
  //set the rectancle starting point to center
  rectMode(CENTER); 
  
  //set the color of stroke
  stroke(0);
  
  //main body
  fill(150); 
  rect(100,100,20,100);
  
  //the head
  fill(255); 
  ellipse(100,70,60,60);
  
  //the eyes and mouth
  fill(0);
  ellipse(100,80,15,5);
  ellipse(110,60,8,2);
  ellipse(80,60,8,2);
  
  //the feets
  stroke(0); 
  line(90,150,80,160); 
  line(110,150,120,160);
};

void draw(){

};