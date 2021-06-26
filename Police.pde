class Police extends Obstacle{
  Police(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }
  Treat move(){
    
    vy+=gravity;

      if (y>=83) {
        vy-=1.75;
      }        
      y+=vy;
    return null;
  }
  
  void drawObstacle(){
     pushMatrix();
    translate(x, y);
    fill(0, 0, 255);
    rect(10, 0, 15, h);
    popMatrix(); 
  }
}
