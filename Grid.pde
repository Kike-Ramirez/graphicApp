class Grid {
  
  int dh;
  int dw;
  
  Grid (int dw_, int dh_) {
  
    dw = dw_;
    dh = dh_;
    
  
  }

  void draw() {
  
    strokeWeight(0.2);
    stroke(255);
      
    for (int i = 0; i < width; i += dw) line(i, 0, i, height);
    for (int j = 0; j < height; j += dh) line(0, j, width, j);
    
  }    

}