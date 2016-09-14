class Engine {

  PImage input;
  PGraphics canvas;
  int canvasW, canvasH, canvasX, canvasY;
  boolean masking = false;
  ArrayList<PVector> masks;
  PShape maskShape;
  
  Engine() {
  
    canvasW = 1024;
    canvasH = 768;
    
    canvas = createGraphics(canvasW, canvasH);
    input = null;
    masks = new ArrayList<PVector>();
    maskShape = createShape();

  }

  void updateResolution() {
    
    canvas = createGraphics(canvasW, canvasH);
    masks = new ArrayList<PVector>();
    maskShape = createShape();
    
  }
  
  void deleteMask() {
  
    masking = false;
    masks = new ArrayList<PVector>();
    maskShape = createShape();
    
  }
  
  
  void updateMasking() {
  
    if (masks.size() > 0) {
      if ((abs(mouseX - canvasX - masks.get(0).x) < 5) && (abs(mouseY - canvasY - masks.get(0).y) < 5)) {
        
        masking = false;
        
      }
    }
    
    masks.add(new PVector(mouseX - canvasX, mouseY - canvasY));
    maskShape = createShape();
    maskShape.beginShape();
    if (masking) maskShape.noFill();
    else maskShape.fill(0);
    maskShape.stroke(255,0,0);
//maskShape.strokeWeight(0.1);
    
    for (int i = 0; i < masks.size(); i++ ) {
    
      maskShape.vertex(masks.get(i).x, masks.get(i).y);
      
    }
    maskShape.endShape();
  
  }
  
  void updateImage(String url) {
  
    try {
    PImage input_ = loadImage(url);
    input = input_.copy();
  } catch (Exception e) {
    e.printStackTrace();
  }
    
  }
  
  void updateDraw() {
    
    canvas.beginDraw();
    canvas.background(255);
        
    if (input != null) {
      
      float ratioCanvas = float(canvasW)/canvasH;
      float ratioInput = float(input.width)/input.height;
    
      if (ratioCanvas <= ratioInput) {
      
        canvas.image(input, 0, 0, canvasH * ratioInput, canvasH);
      
      }
      
      else {
      
        canvas.image(input, 0, 0, canvasW, float(canvasW) / ratioInput);
      
      }
    }
    
    else {
      
      canvas.noStroke();
      canvas.fill(0);
      canvas.rect(0, 0, canvasW, canvasH);
    }
    
    canvas.shape(maskShape, 0, 0);
    
    canvas.endDraw();
  
  }
  
  void display() {
    
    int widthArea = width - 24 * dw; 
    int heightArea = height - 2 * dh;
    
    
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