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
  
  void updateImage(String url) {
  
    input = loadImage(url);
    
  }
  
  void updateDraw() {

    float ratioCanvas = float(canvasW)/canvasH;
    float ratioInput = float(input.width)/input.height;
    
    canvas.beginDraw();
    canvas.background(255);
    
    if (ratioCanvas <= ratioInput) {
    
      canvas.image(input, 0, 0, canvasH * ratioInput, canvasH);
    
    }
    
    else {
    
      canvas.image(input, 0, 0, canvasW, float(canvasW) / ratioInput);
    
    }
    
    canvas.endDraw();
  
  }
  
  void display() {
    
    int widthArea = width - 24 * dw; 
    int heightArea = height - 2 * dh;
    int canvasX = 0;
    int canvasY = 0;
    
    
    float ratioCanvas = float(canvasW)/canvasH;
    float ratioArea = float(widthArea) / heightArea;
    
    if (ratioArea <= ratioCanvas) {
    
      if ( widthArea >= canvasW) {
      
        canvasX = 23 * dw + (widthArea - canvasW) / 2;
        canvasY = dh + (heightArea - canvasH) / 2;
        image(canvas, canvasX, canvasY);
        println("1) Resolution: " + canvasW + " " + canvasH);
      }
      
      else {
      
        canvasX = 23 * dw;
        canvasY = dh + (int) (heightArea - (float(widthArea) / ratioCanvas)) / 2;
        image(canvas, canvasX, canvasY, widthArea, float(widthArea) / ratioCanvas );
        println("2) Resolution: " + widthArea + " " + float(widthArea) / ratioCanvas);
      
      }
    
    }
    
    else {
    
      if ( heightArea >= canvasH) {
      
        canvasX = 23 * dw + (widthArea - canvasW) / 2;
        canvasY = dh + (heightArea - canvasH) / 2;
        image(canvas, canvasX, canvasY);

      }
      
      else {
      
        canvasX = int(23 * dw + (widthArea - heightArea * ratioCanvas) / 2);
        canvasY = dh;
        image(canvas, canvasX, canvasY, heightArea * ratioCanvas, heightArea );
        
      }    
    
    }
      
  }


}