class Chopper extends Obstacle {

  Chopper(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }

  Treat move() {
    Treat rtrn=null;
    //add a treat.
    if (random(1000)<5) {
      //Treat t;
      rtrn=new Treat(x, y, 20, 10, level, 120, false);
    }
    x-=2;
    if (x==0) { 
      x=width;
      y-=125;
      level--;
      if (level<0) {
        level=3;
      }
      if (y<=0) {
        y=425;
      }
    }
    return rtrn;
  }

  void drawChopper() {
    pushMatrix();
    translate(x, y);
    fill(255, 0, 0);
    ellipse(15, 15, 30, 20);
    popMatrix();
  }
}
