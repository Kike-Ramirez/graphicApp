class UI {

  PApplet applet;
  ControlP5 cp5;
  Accordion accordion;
  PGraphics canvasShape;
  ColorPicker cp, cp2;

  
  UI(PApplet applet_) {
  
    applet = applet_;
    
  }

  void setup() {
    
    
    cp5 = new ControlP5(applet);
  
    int altRes = 2 * dh;
    cp5.addTextfield("Width")
     .setPosition(dw, altRes)
     .setSize(9 * dw, 3 * dh)
     .setColor(color(255))
     .setValue(1024)
     .setAutoClear(false)
     ;

    cp5.addTextfield("Height")
     .setPosition(12 * dw, altRes)
     .setSize(9 * dw, 3 * dh)
     .setColor(color(255))
     .setValue(768)
     .setAutoClear(false)
     ;
  
  int altLoad = 9 * dh;
  cp5.addButton("LoadImg")
     .setPosition(dw, altLoad)
     .setSize(6 *dw, 3 * dh)
     ;

  cp5.addButton("DefineMsk")
     .setPosition(8 * dw, altLoad)
     .setSize(6 *dw, 3 * dh)
     ;

  cp5.addButton("DeleteMsk")
     .setPosition(15 * dw, altLoad)
     .setSize(6 *dw, 3 * dh)
     ;

  int altGrid = 15 * dh;
     
  cp5.addSlider("Density")
     .setPosition(dw, altGrid)
     .setSize(17 * dw, 3 * dh)
     .setRange(2,20)
     .setValue(10)
     .setNumberOfTickMarks(19)
     ;
     
  cp5.addSlider("Noise")
     .setPosition(dw, altGrid + 4 * dh)
     .setSize(17 * dw, 3 * dh)
     .setRange(0,20)
     .setValue(0)
     ;

  cp5.addButton("UpdGrid")
     .setPosition(dw, altGrid + 8 *dh)
     .setSize(20 *dw, 3 * dh)
     ;
     

  int altShapes = 29 * dh;
  
  cp5.addRadioButton("radioButton")
     .setPosition(dw, altShapes)
     .setSize(10 * dw, 2 * dh)
     .setColorForeground(color(120))
     .setColorActive(color(255))
     .setColorLabel(color(255))
     .setItemsPerRow(1)
     .setSpacingColumn(3 * dw)
     .setSpacingRow(dh)
     .addItem("Point",1)
     .addItem("Triangle",2)
     .addItem("Quad",3)
     .addItem("Shape",4)
     .activate("Point")
     ;
  
  int hShape = 11 * dh;
  canvasShape = createGraphics(hShape, hShape);
         
  int altFormat = 44 * dh;
  
  cp5.addSlider("Stroke")
     .setPosition(dw, altFormat)
     .setSize(17 * dw, 3 * dh)
     .setRange(0,2)
     .setValue(0.3)
     ;     
  cp = cp5.addColorPicker("Color")
     .setPosition(dw, altFormat + 5 * dh)
     .setSize(20*dw, 3*dh)
     .setColorValue(color(255))
     ;
     
  int altBackground = 61 * dh;
  cp5.addButton("Load Background")
     .setValue(0)
     .setPosition(dw,altBackground)
     .setSize(9 *dw, 3 * dh)
     ;

  cp5.addButton("Define Background")
     .setValue(0)
     .setPosition(12 * dw, altBackground)
     .setSize(9 *dw, 3 * dh)
     ;
  cp2 = cp5.addColorPicker("Color Background")
     .setPosition(dw, altBackground + 4 * dh)
     .setSize(20*dw, 6*dh)
     .setColorValue(color(0))
     ;
     
  int altExport = 77 * dh;
                
  cp5.addTextfield("Name:")
     .setPosition(dw,altExport)
     .setSize(20 * dw,3 * dh)
     .setColor(color(255))
     .setValue("Name")
     ;

  cp5.addRadioButton("Format Options")
     .setPosition(dw, altExport + 6 * dh)
     .setSize(3 * dw, 3 * dh)
     .setColorForeground(color(120))
     .setColorActive(color(255))
     .setColorLabel(color(255))
     .setItemsPerRow(4)
     .setSpacingColumn(2 * dw)
     .setSpacingRow(dh)
     .addItem("PNG",1)
     .addItem("TIFF",2)
     .addItem("JPEG",3)
     .addItem("PDF",4)
     .activate("PNG")
     ;     

  cp5.addButton("Save File")
     .setValue(0)
     .setPosition(dw, altExport + 11 * dh)
     .setSize(20 *dw, 3 * dh)
     ;
  
  cp5.addButton("Exit")
     .setPosition(dw, altExport + 15 * dh)
     .setSize(20 *dw, 3 * dh)
     ;
  
  //// create a new accordion
  //// add g1, g2, and g3 to the accordion.
  //accordion = cp5.addAccordion("acc")
  //               .setPosition(1 * dw, 1 * dh)
  //               .setWidth(22 * dw)
  //               .addItem(g1)
  //               .setItemHeight(190)
  //               .addItem(g2)
  //               .addItem(g3)
  //               .addItem(g4)
  //               .addItem(g5)
  //               .addItem(g6)
  //               .addItem(g7)
  //               ;
                 
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  //accordion.open(0);
  
  //// use Accordion.MULTI to allow multiple group 
  //// to be open at a time.
  //accordion.setCollapseMode(Accordion.SINGLE);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
  
  }
  
  void draw() {
  
    fill(0, 100);
    noStroke();
    rect(0, 0, 22 * dw, height);
    canvasShape.beginDraw();
    canvasShape.background(0);
    canvasShape.stroke(255);
    canvasShape.noFill();
    canvasShape.ellipse(canvasShape.width/2, canvasShape.height/2, canvasShape.width/2, canvasShape.height/2);
    canvasShape.endDraw();
    
    image(canvasShape, 15 * dw, 29 * dh);

    fill(255);
    text("Press 'S' to show input image, 'H' to hide.", dw, 77*dh +22* dh);
    
  }

public void Width(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
  
  try {
        engine.canvasW = Integer.parseInt(theText);
        engine.updateResolution();
        
  } catch (NumberFormatException e) {
        //Will Throw exception!
        //do something! anything to handle the exception.
        println("error");
  }
}

public void Height(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
  
  try {
        engine.canvasH = Integer.parseInt(theText);
        engine.updateResolution();
        
  } catch (NumberFormatException e) {
        //Will Throw exception!
        //do something! anything to handle the exception.
        println("error");
  }
}

public void LoadImg() {
  
  selectInput("Select a file to process:", "fileSelected");
  
}

public void DefineMsk() {
  
  engine.masking = true;
  
}

public void DeleteMsk() {
  
  engine.deleteMask();
  
}

public void UpdGrid() {
  
  engine.updateGrid();
  
}


}