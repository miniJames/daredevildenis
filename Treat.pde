class Treat {

  int x, y;
  int h = 30;
  int w = 30;
  int value = 0;
  float vy;
  int level;
  boolean nothing;
  boolean onlyMove = false;
  Treat(int _x, int _y, int _h, int _w, int l, int val, boolean not) {
    h=_h;
    w=_w;
    x=_x;
    y=_y;//-platformHeight-h;
    level = l;
    value = val;
    if(not){
      nothing = true;
    }
      
  }

  Treat(int _x, int _y, int _h, int _w, int l, int val, boolean not, boolean om) {
    h=_h;
    w=_w;
    x=_x;
    y=_y;//-platformHeight-h;
    level = l;
    value = val;
    if(not){
      nothing = true;
    }
    onlyMove =om;
    
      
  }
  void show() {
    if (!nothing) {
      pushMatrix();

      translate(x, y);
      fill(255);
      rect(0, 0, h, w);

      popMatrix();
    }
  }
  void move( ) {
    if (!nothing) {
      //y=level*125;
      vy+=gravity;
      if (y>=(level*125)+105) {
        vy=0;
      }        
      y+=vy;
    }
    if(onlyMove){
      x+=2;  
      if(x>=width){
        x=x%width;
      }
    }
  }
}
