float elipsX = -20;
float elipsY = -20;

float elipsH = 140;
float elipsS = 250;
float elipsB = 360;

float hueDir = 0.3;

float rectX = 0;
float rectY = 0;

float separator = 40;


float rectH = 140;
float rectS = 250;
float rectB = 360;

void setup() {


  size(1080, 1080);
  colorMode(HSB,360,360,360);
  background(0);
}

void draw() {
  for(int i = 0; i<20;i++){
    fill(rectH,rectS,rectB);
    noStroke();
    rect(rectX,rectY,width,separator);
    rectY += separator;
    rectH = rectH + 3;
  }
  stroke(elipsH-30,elipsS,elipsB);
  fill(elipsH,elipsS,elipsB);
  elipsH = elipsH - hueDir;
  rect(elipsX, elipsY, mouseX, mouseY);
  elipsX += 1;
  elipsY += 1;
  
  if(elipsH <= 0 || elipsH >= 360){
    hueDir = hueDir * -1;
  }
}
