class Level {

  ArrayList<Obstacle> obstacles;
  ArrayList<Platform> platforms;
  ArrayList<Treat> treats;
  
  int playerState;
  Level(int state) {
    obstacles = new ArrayList<Obstacle>();
    platforms = new ArrayList<Platform>();
    treats = new ArrayList<Treat>();
    playerState = state;
    color col;
    if(state==ski){
      col = color(255);
    } else if(state==bike){
      col= color(0,255,0);
    } else if (state==waterSki){
      col=color(0,0,255);
    } else {
      col=color(0);
    }
    
    platforms.add(new Platform(0, 125, col));
    platforms.add(new Platform(0, 250, col));
    platforms.add(new Platform(0, 375, col));
    platforms.add(new Platform(0, height, col));
  }

  void show(DDD d) {

    for (Obstacle o : obstacles) {
      o.show();
      if (!d.hitObstacle) {
        Treat t;
        t=o.move();
        if(t!=null){
          treats.add(t);
        }
        if (hitting(d, o.x,o.y,o.w,o.h)) {
         d.collissionDetected();
        }
      }
    }
    
    for(Treat treat: treats){
      treat.show();
      treat.move();
       if (hitting(d, treat.x,treat.y,treat.w,treat.h)) {
         d.treatDetected(treat.value);
         treat.value = 0;
         treat.nothing=true;
      }
    }

    for (Platform p : platforms) {
      p.show();
    }
  }
  boolean hitting(DDD d, int _x, int _y, int _w, int _h){//  Obstacle o) {
    if (box_box(d.x, d.y, d.x+d.h, d.y+d.h, _x, _y, _x+_w, _y+_h)) {
      //println("CRASH DETECTED");
      return true;
    }
    return false;
  }
}
