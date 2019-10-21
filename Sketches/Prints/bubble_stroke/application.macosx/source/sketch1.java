import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch1 extends PApplet {

public void setup(){
  
  background(255);
  
  //antialiasing
  
  
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

public void draw(){

};
  public void settings() {  size(1440,700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
