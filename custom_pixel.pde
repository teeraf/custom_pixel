PImage img;
Pixel[] myPixelsNormal, myPixelsPressed;
int cols, rows;
int gridSizeNormal = 10;
int pixelSizeNormal = 20;
int gridSizePressed = 5;
int pixelSizePressed = 5;
boolean spacePressed = false;

void setup() {
  size(1400, 800);
  // select image to display
  img = loadImage("abstract4.jpeg"); // upload any image here
  smooth();

  // calculate the number of columns and rows based on normal grid size
  cols = img.width / gridSizeNormal;
  rows = img.height / gridSizeNormal;

  // precompute pixels for both states
  myPixelsNormal = new Pixel[cols * rows];
  initializePixels(myPixelsNormal, gridSizeNormal, pixelSizeNormal);

  // recalculate for pressed state
  cols = img.width / gridSizePressed;
  rows = img.height / gridSizePressed;
  myPixelsPressed = new Pixel[cols * rows];
  initializePixels(myPixelsPressed, gridSizePressed, pixelSizePressed);
}

void draw() {
  background(255);

  Pixel[] currentPixels = spacePressed ? myPixelsPressed : myPixelsNormal;

  // display pixels in the grid
  for (int j = 0; j < currentPixels.length; j++) {
    int x = (int)currentPixels[j].x - (int)((width - img.width) / 2);
    int y = (int)currentPixels[j].y - (int)((height - img.height) / 2);
    if (x >= 0 && x < img.width && y >= 0 && y < img.height) {
      color c = img.get(x, y); // assign color to pixel from image
      float b = brightness(c);
      currentPixels[j].setColor(c);
      if (spacePressed) {
        currentPixels[j].blendingMode = REPLACE;
      } else {
        currentPixels[j].setBlendingMode(b);
      }
    }
    currentPixels[j].display();
  }
}

void keyPressed() {
  if (key == ' ') {
    spacePressed = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    spacePressed = false;
  }
}

void initializePixels(Pixel[] pixelsArray, int gridSize, int pixelSize) {
  // calculate center relative to image size
  float xOffset = (width - img.width) / 2;
  float yOffset = (height - img.height) / 2;

  int i = 0;
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float xpos = x * gridSize + xOffset;
      float ypos = y * gridSize + yOffset;
      pixelsArray[i] = new Pixel(xpos, ypos, pixelSize, pixelSize);
      i++;
    }
  }
}
