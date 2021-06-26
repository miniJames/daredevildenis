class Snowman extends Obstacle{
  Snowman(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  } 
  Treat move(){
    return null;
  }
  
  
  void drawObstacle() {

    pushMatrix();
    translate(x, y);
    fill(255);
    noStroke();
    //body
    ellipse(15, 22, 31, 20);
    ellipse(15, 9, 18, 10);     

    //hat
    fill(255, 255, 0);
    rect(3, 4, 12, 2);
    rect(8, 0, 7, 5);

    fill(0, 255, 0);
    rect(15, 4, 12, 2);
    rect(15, 0, 7, 5);

    //eyes
    fill(0);
    circle(12, 8, 3);
    circle(18, 8, 3);
    //mouth
    fill(255, 0, 0);
    rect(12, 11, 5, 1);

    //buttons
    fill(0, 0, 255);
    rect(12, 15, 3, 4);
    fill(0);
    rect(15, 15, 3, 4);
    fill(0, 0, 255);
    rect(12, 20, 3, 4);
    fill(0);
    rect(15, 20, 3, 4);
    popMatrix();
  }
}
