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