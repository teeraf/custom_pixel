class Pixel {
  float x, y, w, h;
  color c;
  int blendingMode;

  Pixel(float TempX, float TempY, float TempW, float TempH) {
    x = TempX;
    y = TempY;
    w = TempW;
    h = TempH;
    c = color(255);
    blendingMode = BLEND; // default blending mode
  }

  void setColor(color TempC) {
    c = TempC;
  }

  // brightness of color determines blend mode
  void setBlendingMode(float brightness) {
    if (brightness > 230) {
      blendingMode = ADD;
    } else if (brightness > 100) {
      blendingMode = MULTIPLY;
    } else {
      blendingMode = SUBTRACT;
    }
  }

  void display() {
    blendMode(blendingMode); // set blend mode
    fill(c);
    noStroke();
    rect(x, y, w, h);
  }
}
