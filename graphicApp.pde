import controlP5.*;

UI ui;
Grid grid;
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
  
  input = loadImage("test7.png");
  
  ui.setup();

}

void draw() {

  background(#434242);
  //grid.draw();
  ui.draw();
  
  int inputX = 23 * dw + (width - 23 * dw - input.width) / 2;
  int inputY = (height - input.height) / 2;
  
  image(input, inputX, inputY);
  
}

void mousePressed() {
  //selectInput("Select a file to process:", "fileSelected");

}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}