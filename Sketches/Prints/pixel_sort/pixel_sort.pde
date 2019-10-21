PImage img;
PImage sorted;

void settings() {
  size(800, 400);
}

void setup() {
  img = loadImage("landscape.jpg");
  sorted = createImage(img.width, img.height, RGB);
  img.loadPixels();
  sorted = img.get();
  sorted.loadPixels();

  // Selection sort
  for (int i = 0; i < sorted.pixels.length; i++) {
    float record = -1;
    int selectedPixel = i;
    for (int j = i; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      float b = brightness(pix);
      if (b>record) {
        selectedPixel = j ;
        record = b;
      }
    }
    println(sorted.pixels.length - i);
    // Swap selectedPixel with i
    color temp = sorted.pixels[i];
    sorted.pixels[i] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;
  }


  sorted.updatePixels();
}

void draw() {
  background(0);
  image(img, 0, 0);
  image(sorted, width/2, 0);
}
