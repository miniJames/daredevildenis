class Ambulance extends Obstacle {

  Ambulance(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h, ambulance);
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

    fill(255, 255, 255);
    //wheels
    rect(0, h-10, 10, 10);         
    rect(19, h-10, 10, 10); 
    fill(0, 0, 255);
    rect(2, h-8, 5, 5);         
    rect(22, h-8, 5, 5); 
    fill(255);
    //body
    rect(0, 3, h-3, h-10);

    //siren
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
    rect(7, 0, 10, 3);

    //cross
    fill(255, 0, 0);
    rect(10, 7, 5, 13);      
    rect(6, 11, 13, 5);

    //window
    fill(128, 255, 255);
    rect(22, 5, 7, 13);

    //bumper
    fill(255, 255, 0);
    rect(25, 18, 9, 5);
    popMatrix();
  }
}
