class Pixel {
  float x, y, w, h;
  color c;

  Pixel(float TempX, float TempY, float TempW, float TempH) {
    x = TempX;
    y = TempY;
    w = TempW;
    h = TempH;
    c = color(255); 
  }

  void setColor(color TempC) {
    c = TempC;
  }

  void display() {
    fill(c);
    noStroke();
    blendMode(EXCLUSION); //set blend mode for pixels
    rect(x, y, w, h);
  }
}
