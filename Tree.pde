class Tree extends Obstacle {

  Tree(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h, tree);
  }

  void drawObstacle() {
    
    pushMatrix();
    translate(x, y);
    fill(255, 64, 0);
    rect(12, 0, 5, h);
    fill(255, 255, 0);
    ellipse(7, 12, 25, 20);
    fill(0, 255, 0);
    ellipse(15, 10, 30, 25);
    popMatrix();

  }
  
  Treat move(){
    return null;  
  }

}
