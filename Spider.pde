class Spider extends Obstacle {
  int spiderDir = 1;
  Spider(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }
  Treat move() {
    h+=spiderDir;
    //println(spiderDir);
    if (h<30 || h>110) {
      spiderDir *=-1;
    }
    return null;
  }
  void drawObstacle() {

    pushMatrix();
    translate(x, y);
    int spacer = 15;
    //web
    fill(255, 255, 0);
    rect(12, 0, 5, h-20);

    //body
    fill(255, 0, 0);
    ellipse(15, h-17, 20, 15);

    //legs
    fill(0);
    int start = 4;
    int starty = 3;

    rect(0+start, h-spacer + starty, 4, 4);
    rect(4+start, 4+h-spacer + starty, 4, 4);
    rect(8+start, h-spacer + starty, 4, 4);
    rect(12+start, 4+h-spacer + starty, 4, 4);
    rect(16+start, h-spacer + starty, 4, 4);
    fill(0, 255, 255); 
    rect(0+start, h+4-spacer + starty, 4, 4);
    rect(4+start, h -spacer+ starty, 4, 4);
    rect(8+start, 4+h-spacer + starty, 4, 4);
    rect(12+start, h -spacer+ starty, 4, 4);
    rect(16+start, 4+h-spacer + starty, 4, 4);

    //eyes
    fill(255, 255, 0);
    rect(8, h-spacer-4, 4, 4);
    rect(16, h-4-spacer, 4, 4);
    fill(0);

    int num =(frameCount/2) % 4;
    if (num==1) {
      rect(10, h-spacer-2, 3, 3);
      rect(18, h-spacer-2, 3, 3);
    } else {
      rect(8, h-spacer-2, 3, 3);
      rect(16, h-spacer-2, 3, 3);
    }
    popMatrix();
  }
}
