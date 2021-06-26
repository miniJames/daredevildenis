class Boat extends Obstacle {

  Boat(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }

  Treat move() {
    x+=2;
    if (x==width) { 
      x=0;
    }
    return null;
  }
  void drawObstacle() {
    pushMatrix();
    translate(x, y);
    //hull
    fill(255);
    circle(20, 20, 30);
    fill(0);
    rect(0, 0, 35, 20);


    //sail 1
    fill(255);
    triangle(20, 0, 5, 18, 20, 18);

    //sail 2
    fill(0, 255, 255);
    triangle(23, 0, 35, 18, 23, 18);

    //red line
    fill(255, 0, 0);
    rect(6, 23, 28, 3);

    //mast
    fill(255, 255, 0);
    rect(20, -5, 3, 23);

    //flag


    popMatrix();
  }
}
