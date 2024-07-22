PImage img;
Pixel[] myPixels;
int cols, rows;
int gridSize = 4; // size of each grid cell
int pixelSize = 12; // size of each pixel

void setup() {
  size(500, 500);
  // select image to display
  img = loadImage("BenMe-InNYC Small.jpeg");

  // calculate the number of columns and rows based on image size
  cols = img.width / gridSize;
  rows = img.height / gridSize;
  myPixels = new Pixel[cols * rows];

  // calculate center relative to image size
  float xOffset = (width - img.width) / 2;
  float yOffset = (height - img.height) / 2;

  // initialize pixels in an even grid pattern
  int i = 0;
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
     //center image in window
      float xpos = x * gridSize + xOffset;
      float ypos = y * gridSize + yOffset;
      myPixels[i] = new Pixel(xpos, ypos, pixelSize, pixelSize);
      i++;
    }
  }
}

void draw() {
  background(255);

 // display pixels in the grid
  for (int i = 0; i < myPixels.length; i++) {
    int x = (int)myPixels[i].x - (int)((width - img.width) / 2);
    int y = (int)myPixels[i].y - (int)((height - img.height) / 2);
    if (x >= 0 && x < img.width && y >= 0 && y < img.height) {
      color c = img.get(x, y); //assign color to pixel from image
      myPixels[i].setColor(c);
    }
    myPixels[i].display();
  }
}
