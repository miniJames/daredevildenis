class Lighthouse extends Obstacle {

  Lighthouse(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }

  Treat move() {
    return null;
  }

  void drawObstacle() {
    pushMatrix();
    translate(x, y);
    //base
    fill(0, 255, 0);
    ellipse(20, 30, 35, 20);
    //tower
    fill(255);
    rect(10, 0, 10, 22);
    fill(225, 225, 225);
    rect(20, 0, 10, 22);
    //light
    color c;
    int num = frameCount % 8;
    if (num==0) {
      c=color(0, 0, 0);
    } else if (num==1) {
      c=color(255, 0, 0);
    } else if (num==2) {
      c=color(0, 255, 0);
    } else if (num==3) {
      c=color(0, 0, 255);
    } else if (num==4) {
      c=color(255, 255, 0);
    } else if (num==5) {
      c=color(255, 0, 255);
    } else if (num==6) {
      c=color(0, 255, 255);
    } else if (num==7) {
      c=color(255, 255, 255);
    } else {
      c=color(255, 255, 0);
    }
    fill(c);

    rect(15, 5, 10, 6);
    //stripes
    fill(0, 255, 255);
    rect(10, 12, 10, 3);
    rect(10, 17, 10, 3);

    fill(0, 0, 255);
    rect(20, 12, 10, 3);
    rect(20, 17, 10, 3);


    popMatrix();
  }
}
