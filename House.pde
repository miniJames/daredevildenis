class House extends Obstacle {

  House(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }

  void drawObstacle() {
    pushMatrix();
    translate(x, y);
    fill(255);
    rect(0, 15, 30, 20);

    //roof
    fill(255, 0, 0);
    beginShape();
    vertex(0, 15);
    vertex(15, 0);
    vertex(30, 15);
    endShape();

    fill(0);
    rect(3, 17, 8, 6);
    //door
    fill(0, 0, 255);
    rect(3, 25, 8, 10);

    //windows
    fill(0, 255, 0);
    rect(14, 17, 6, 6);
    rect(22, 17, 6, 6);
    rect(14, 25, 6, 6);
    rect(22, 25, 6, 6);
    fill(0);
    rect(18, 17, 5, 6);
    rect(18, 25, 5, 6);
    popMatrix();
  }

  Treat move() {
    return null;
  }
}
