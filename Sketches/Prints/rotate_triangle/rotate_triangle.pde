float x = width/2;
float y = 100;
float r;
float speed = 60;

void setup() {
 size(1000,800);
 background(233,255,112);
 r =0;
}

void draw(){
 move();
 mousePressed();
}

void move(){
 x = mouseX;
 y = mouseY;
}

void mousePressed() {
 if (mousePressed)
 {
   //fill(169,169,169);
   //stroke(0,0,0);
   //ellipse(mouseX, mouseY,5,5);
   noStroke();
   line(mouseX,mouseY,10,10);

   translate(mouseX,mouseY);
   rotate(radians(r));
   noFill();
   strokeWeight(1);
   stroke(255,112,166);
   triangle (mouseX, mouseY, mouseY, 0, 0, 0);
  r += 1;
  println("r: "+r);

 }
}
