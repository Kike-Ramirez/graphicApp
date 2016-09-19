import org.processing.wiki.triangulate.*;
import java.util.Collections;

class Engine {

  PImage input;
  PGraphics canvas, layerGrid, layerEffects;
  int canvasW, canvasH, canvasX, canvasY;
  boolean masking = false;
  ArrayList<PVector> masks;
  PShape maskShape;
  ArrayList<Triangle> triangles;
  ArrayList<PVector> points;
  int malla = 5;
  boolean showInput = true;
  
  Engine() {
  
    canvasW = 1024;
    canvasH = 768;
    
    canvas = createGraphics(canvasW, canvasH);
    layerGrid = createGraphics(canvasW, canvasH);
    input = null;
    masks = new ArrayList<PVector>();
    triangles = new ArrayList<Triangle>();
    points = new ArrayList<PVector>();
    maskShape = createShape();

  }

  void updateResolution() {
    
    canvas = createGraphics(canvasW, canvasH);
    layerGrid = createGraphics(canvasW, canvasH);
    masks = new ArrayList<PVector>();
    maskShape = createShape();
    
  }
  
  void updateGrid() {
   
    // Reset values
    triangles = new ArrayList<Triangle>();
    points = new ArrayList<PVector>();
    
    // Implents grid generation logic
        
    for (int i  = 0; i < canvas.width; i = i + int(ui.cp5.getController("Density").getValue())) {  
      
      for (int j = 0; j < canvas.height; j = j + int(ui.cp5.getController("Density").getValue())) {
      
        float noise = ui.cp5.getController("Noise").getValue();
        
        float px = (i + random(-noise, noise));
        float py = (j + random(-noise, noise));
        
        if ((px < 0) || (px > canvas.width)) px = i;
        if ((py < 0) || (py > canvas.height)) py = j;
        
        
        float brillo = brightness(canvas.get(i,j));
        float prob = map(brillo, 0, 255, 0, 1);
        
        if (random(1) < prob) {
          
          points.add(new PVector(px, py));         //canvas.set(i, j, color(brillo));
          // brillos.add(prob);
        }
          
      }
    
    }
    
    // get the triangulated mesh
    triangles = Triangulate.triangulate(points);
    
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
        
    if ((input != null) && (showInput)) {
      
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
    
    displayTriangles();
  
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

  void displayTriangles() {
    
    if (triangles.size() > 0) {
      
      // draw the mesh of triangles
      canvas.noFill();
      canvas.beginDraw();
      canvas.beginShape(TRIANGLES);

      canvas.stroke(color(255)); //ui.cp5.getController("Color").getValue(), 200);
      canvas.strokeWeight(ui.cp5.getController("Stroke").getValue());
     
      for (int i = 0; i < triangles.size(); i++) {

        Triangle t = (Triangle)triangles.get(i);
        
        canvas.vertex(t.p1.x, t.p1.y);
        canvas.vertex(t.p2.x, t.p2.y);
        canvas.vertex(t.p3.x, t.p3.y);
      
      }
      
      canvas.endShape();
      
      canvas.endDraw();
    }
    
  }

}