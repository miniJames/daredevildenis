class Obstacle {
  int x, y;
  int h = 30;
  int w = 30;
  int type = 0;
  float vy;

  int level;
  Obstacle(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y-platformHeight-h;
    //type = _t;
    level=3;
    w = _w;
    h=_h;
  }
  void drawObstacle() {
  }
  void show() {
    drawObstacle();
  }

  Treat move() {
    return null;
  }


}
