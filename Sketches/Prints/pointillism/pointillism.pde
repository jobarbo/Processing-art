PImage painting;

void settings() {
  painting = loadImage("purps.jpg");
  size(painting.width,painting.height);

}

void setup() {


  background(255);
  colorMode(HSB);
  
  for(int i = 0; i < 150; i++){
    float x = random(width);
    float y1 = random(height);
    float y = random(height);
    float w = random(80,250);
    color c = painting.get(int(x),int(y));
    
    println(c);
    fill(c);
    noStroke();
    rect(x,y,w,w);
  }
}

void draw(){
  

}
