/* Graphic App. v1.0
   Author: Kike Ramirez
   mail_ kike@espadaysantacruz.com
   Date: 19/09/2016
   */
   
import controlP5.*;

UI ui;
Grid grid;
Engine engine;
PImage input, background;

int ncol = 100;
int nfil = 100;
int dw, dh;

void setup() {
  
  fullScreen();
  ui = new UI(this);

  dw = width/ncol;
  dh = height/nfil;
  grid = new Grid(dw, dh);  
  engine = new Engine();
  
  input = loadImage("test7.png");
  
  
  ui.setup();
  
}

void draw() {

  background(#434242);
  //grid.draw();
  ui.draw();
  engine.updateDraw();
  engine.display();
  

  
}

void mousePressed() {
  //selectInput("Select a file to process:", "fileSelected");
  if (engine.masking) engine.updateMasking();
  
}

void mouseDragged() {

  if (engine.masking) engine.updateMasking();

}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    engine.updateImage(selection.getAbsolutePath());
  }
}

public void Width(String theText) {
  // automatically receives results from controller input
  ui.Width(theText);
}

public void Height(String theText) {
  // automatically receives results from controller input
  ui.Height(theText);
}

public void LoadImg() {

  ui.LoadImg();
  
}

public void DefineMsk() {

  ui.DefineMsk();
  
}

public void DeleteMsk() {

  ui.DeleteMsk();
  
}

public void UpdGrid() {

  ui.UpdGrid();
  
}

public void Exit() {

  exit();
  
}

void keyPressed() {

  if ((key == 'h') || (key == 'H')) engine.showInput = false;
  if ((key == 's') || (key == 'S')) engine.showInput = true;

}