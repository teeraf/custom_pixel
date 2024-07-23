PImage img;
Pixel[] myPixels;
int cols, rows;
int gridSize = 10; // initial size of each grid cell
int pixelSize = 20; // initial size of each pixel

void setup() {
  size(1400, 800);
  // select image to display
  img = loadImage("abstract1.jpeg"); // upload any image here
  smooth();

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
      // center image in window
      float xpos = x * gridSize + xOffset;
      float ypos = y * gridSize + yOffset;
      myPixels[i] = new Pixel(xpos, ypos, pixelSize, pixelSize);
      i++;
    }
  }
}

void draw() {
  background(255);

  // update gridSize and pixelSize if spacebar is pressed
  if (keyPressed && key == ' ') {
    gridSize = 1;
    pixelSize = 1;
  } else {
    gridSize = 10;
    pixelSize = 20;
  }

  // Recalculate columns and rows based on gridSize
  cols = img.width / gridSize;
  rows = img.height / gridSize;
  myPixels = new Pixel[cols * rows]; // reinitialize array to fit new grid size

  // calculate center relative to image size
  float xOffset = (width - img.width) / 2;
  float yOffset = (height - img.height) / 2;

  int i = 0;
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float xpos = x * gridSize + xOffset;
      float ypos = y * gridSize + yOffset;
      myPixels[i] = new Pixel(xpos, ypos, pixelSize, pixelSize);
      i++;
    }
  }

  // display pixels in the grid
  for (int j = 0; j < myPixels.length; j++) {
    int x = (int)myPixels[j].x - (int)((width - img.width) / 2);
    int y = (int)myPixels[j].y - (int)((height - img.height) / 2);
    if (x >= 0 && x < img.width && y >= 0 && y < img.height) {
      color c = img.get(x, y); // assign color to pixel from image
      float b = brightness(c);
      myPixels[j].setColor(c);
      if (keyPressed && key == ' ') {
        myPixels[j].blendingMode = REPLACE;
      } else {
        myPixels[j].setBlendingMode(b);
      }
    }
    myPixels[j].display();
  }
}
