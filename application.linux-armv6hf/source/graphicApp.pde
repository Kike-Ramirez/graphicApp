import controlP5.*;

UI ui;
int ncol = 100;
int nfil = 100;
int dw, dh;

void setup() {
  
  fullScreen();
  ui = new UI(this);

  dw = width/ncol;
  dh = height/nfil;
  ui.setup();

}

void draw() {

  background(#434242);
  
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