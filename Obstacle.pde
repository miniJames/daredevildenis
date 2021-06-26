//int tree = 0, house = 1, ambulance = 2, spider = 3, lighthouse = 4, boat = 5, whale = 6;
//int snowman=7, snowball=8, cabin = 9, police=10, chopper=11, gap=12;
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

    //if (type==house) {
      //drawHouse();
      //} else if (type==tree) {
      //drawTree();
      //} else if (type == ambulance) {
      //drawAmbulance();
      //} else if (type==spider) {
      //drawSpider();
      //} else if (type == lighthouse) {
      //drawLightHouse();
      //} else if (type == boat) {
      //drawBoat();
      //} else if (type ==whale) {
      //drawWhale();
      //} else if (type==snowman) {
      //  drawSnowman();
      //} else if (type==snowball) {
      //drawSnowball();
      //} else if (type==cabin) {
      //drawCabin();
    //} else if (type==chopper) {
    //  drawChopper();
    //}    

  }

  Treat move() {
    return null;
  }


}
