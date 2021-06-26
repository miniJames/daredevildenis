class Whale extends Obstacle{
  
 Whale(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h );
  } 
  
  Treat move(){
    return null;  
  }
  
  void drawObstacle() {
    pushMatrix();

    translate(x, y);
    //body
    fill(0, 255, 255);
    ellipse(15, 15, 30, 20);

    //tail
    rect(27, 3, 3, 10);

    //eye
    fill(255);
    ellipse(10, 13, 5, 5);

    fill(0);
    ellipse(13, 12, 3, 3);
    //mouth

    rect(0, 16, 7, 2);

    //water
    fill(255);
    stroke(255);

    line(13, 4, 11, 0);
    line(17, 0, 13, 04);
    noStroke();
    popMatrix();
  }

  
  
}
