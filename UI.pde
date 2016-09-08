class UI {

  PApplet applet;
  ControlP5 cp5;
  Accordion accordion;
  
  UI(PApplet applet_) {
  
    applet = applet_;
    
  }

  void setup() {
    cp5 = new ControlP5(applet);

      // group number 1, contains 2 bangs
  Group g1 = cp5.addGroup("Resolucion")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(2 * dh)
                ;
  
  cp5.addTextfield("Width:")
     .setPosition(dw,dh)
     .setSize(6 * dw,3 * dh)
     .setColor(color(255))
     .setValue(1024)
     .moveTo(g1)
     ;

     cp5.addTextfield("Height:")
     .setPosition(8 * dw,dh)
     .setSize(6 * dw, 3 * dh)
     .setColor(color(255))
     .setValue(768)
     .moveTo(g1)
     ;
     
  // group number 2, contains a radiobutton
  Group g2 = cp5.addGroup("Work Image")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(4 * dh)
                ;
  
  cp5.addButton("Load Image")
     .setValue(0)
     .setPosition(dw,dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g2)
     ;

  cp5.addButton("Define Mask")
     .setValue(0)
     .setPosition(dw, 5 * dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g2)
     ;

  cp5.addButton("Delete Mask")
     .setValue(0)
     .setPosition(dw, 9 * dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g2)
     ;

  // group number 3, contains a bang and a slider
  Group g3 = cp5.addGroup("Grid point")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(4*dh)
                ;
     
  cp5.addSlider("Density")
     .setPosition(dw,dh)
     .setSize(10 * dw, 3 * dh)
     .setRange(4,100)
     .setValue(10)
     .moveTo(g3)
     ;
     
  cp5.addSlider("Noise")
     .setPosition(dw, 5 * dh)
     .setSize(10 * dw, 3 * dh)
     .setRange(0,100)
     .setValue(0)
     .moveTo(g3)
     ;

  cp5.addButton("Reset Grid")
     .setValue(0)
     .setPosition(dw, 9 *dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g3)
     ;
     
  // group number 3, contains a bang and a slider
  Group g4 = cp5.addGroup("Shapes")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(4*dh)
                ;
  cp5.addRadioButton("radioButton")
     .setPosition(dw, dh)
     .setSize(2 * dw, 2 * dh)
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
     .moveTo(g4)
     ;
         
  // group number 5, contains formatting options
  Group g5 = cp5.addGroup("Format")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(4*dh)
                ;
  cp5.addSlider("Stroke")
     .setPosition(dw,dh)
     .setSize(10 * dw, 3 * dh)
     .setRange(1,100)
     .setValue(1)
     .moveTo(g5)
     ;     
  cp5.addColorPicker("Color")
     .setPosition(dw, 5 * dh)
     .setSize(13*dw, 6*dh)
     .setColorValue(color(255))
     .moveTo(g5);

  // group number 6, contains formatting options
  Group g6 = cp5.addGroup("Background")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(6*dh)
                ;
  cp5.addButton("Load Background")
     .setValue(0)
     .setPosition(dw,dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g6)
     ;

  cp5.addButton("Define Background")
     .setValue(0)
     .setPosition(dw, 5 * dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g6)
     ;
  cp5.addColorPicker("Color Background")
     .setPosition(dw, 9 * dh)
     .setSize(13*dw, 6*dh)
     .setColorValue(color(255))
     .moveTo(g6);

  // group number 6, contains formatting options
  Group g7 = cp5.addGroup("Export")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(16*dh)
                ;
                
  cp5.addTextfield("Name:")
     .setPosition(dw,dh)
     .setSize(13 * dw,3 * dh)
     .setColor(color(255))
     .setValue("Name")
     .moveTo(g7)
     ;

  cp5.addButton("Save File")
     .setValue(0)
     .setPosition(dw, 7 * dh)
     .setSize(13 *dw, 3 * dh)
     .moveTo(g7)
     ;

  cp5.addRadioButton("Format Options")
     .setPosition(dw, 11 * dh)
     .setSize(2 * dw, 2 * dh)
     .setColorForeground(color(120))
     .setColorActive(color(255))
     .setColorLabel(color(255))
     .setItemsPerRow(2)
     .setSpacingColumn(3 * dw)
     .setSpacingRow(dh)
     .addItem("PNG",1)
     .addItem("TIFF",2)
     .addItem("JPEG",3)
     .addItem("PDF",4)
     .moveTo(g7)
     ;     

     
  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
                 .setPosition(1 * dw, 1 * dh)
                 .setWidth(15 * dw)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g4)
                 .addItem(g5)
                 .addItem(g6)
                 .addItem(g7)
                 ;
                 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  accordion.open(0,1,2, 3, 4, 5, 6);
  
  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
  
  }
  
  void draw() {
  
  }

}