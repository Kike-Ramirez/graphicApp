class Engine {

  PImage input;
  PGraphics canvas;
  int canvasW, canvasH;
  
  Engine() {
  
    canvasW = 1024;
    canvasH = 768;
    
    canvas = createGraphics(canvasW, canvasH);
    input = loadImage("test7.png");

  }

  void updateResolution() {
    
    canvas = createGraphics(canvasW, canvasH);
    
  }
  
  void updateDraw() {

    canvas.beginDraw();
    canvas.background(255);
    canvas.image(input, 0, 0);
    canvas.endDraw();
  
  }
  
  void display() {
    
    int maxWidth = width - 23 * dw; 
    int maxHeight = height;
    int canvasX = 23 * dw + (maxWidth - canvas.width) / 2;
    int canvasY = (maxHeight - canvas.height) / 2;
    
    float ratioMax = maxWidth / maxHeight;
    
    image(canvas, canvasX, canvasY);
  
  }


}