class Snowball extends Obstacle {
  Snowball(int _x, int _y, int _w, int _h) {
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
    fill(0, 255, 255);
    circle(13, 13, 25);
    fill(255);
    circle(11, 13, 20);

    popMatrix();
  }
}
