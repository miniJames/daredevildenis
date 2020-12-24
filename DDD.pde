int bike = 0, waterSki = 1, ski = 2, crashing = 3;
class DDD {
  int state;// = 0;

  int x, y, h; 
  int level; 
  int origState;
  boolean moving = false;
  ArrayList<Platform> platforms;  
  float acceleration=0;
  float rate = 0.006;
  boolean movingLeft = false, movingRight = false;// jumping = false;
  float vy=0, vx=0;
  float maxSpeed = 6;
  boolean hitObstacle = false;
  boolean foundTreat = false;
  int treatValue = 0;
  int frameStartCrash = 0;
  boolean shiftPressed = false, spacePressed = false, enterPressed = false;
  DDD(ArrayList<Platform> p) {
    //x=ix;
    y=85;
    platforms = p;
    h=30;
  }
  void reset() {
    y=84;
    x=3;
    level=0;
    vx=0;
    vy=0;
    hitObstacle=false;
    shiftPressed = false; 
    spacePressed = false; 
    enterPressed = false;
  }
  void movement(int k) {
    if (state != crashing) {

      if (k==SHIFT) {
        shiftPressed = true;
      } 
      if (k==' ') {
        println("SPACE PRESSED:" + k);
        spacePressed = true;
      }
      if (k==ENTER) {
        enterPressed = true;
      }
      if (shiftPressed) {
        if (!movingLeft && !movingRight || movingRight) {
          right();
        } else if (movingLeft) {
          stopX();
          movingLeft=false;
        }
      } 
      if (spacePressed) {
        up();
      } 
      if (k==DOWN) {
        down();
      } 
      if (enterPressed) {
        stopX();
      }
    }
  }

  void keyUp(int k) {
    if (k==SHIFT) {
      shiftPressed = false;
    }
    if (k==' ') {
      spacePressed = false;
    }
    if (k==ENTER) {
      enterPressed = false;
    }
  }
  void show() {
    if (state == bike) {
      pushMatrix();
      fill(255);
      translate(x, y);
      //hair
      fill(255, 0, 0);
      rect(0, 0, 20, 8);
      //body
      fill(0, 255, 0);
      rect(5, 8, 12, 15);
      //legs
      fill(255, 0, 0);
      rect(5, 22, 15, 3);

      //wheels
      fill(255);
      rect(0, h-10, 10, 10);         
      rect(19, h-10, 10, 10); 
      fill(0, 0, 255);
      rect(2, h-8, 5, 5);         
      rect(22, h-8, 5, 5); 

      //arms
      fill(255, 255, 0);
      rect(10, 12, 15, 3);

      //bike
      fill(255);
      rect(22, 15, 3, 10);

      //face
      fill(255, 0, 255);
      rect(5, 5, 17, 5);
      
      //eye
      fill(0,0,255);
      rect(15,5,5,2);
      popMatrix();
    } else if (state == waterSki) {
      //println("WATERSKI");
      pushMatrix();


      fill(255);

      translate(x, y);

      //water ski.
      fill(255);
      ellipse(15, 22, 31, 15);

      fill(0);
      rect(0, 15, 35, 7);
      fill(255);
      rect(25, 12, 5, 10);


      //hair
      fill(255, 0, 0);
      rect(0, 0, 20, 8);
      //body
      fill(0, 255, 0);
      rect(5, 8, 12, 15);

      //arms
      fill(255, 255, 0);
      rect(10, 12, 15, 3);
      //face
      fill(255, 0, 255);
      rect(5, 5, 17, 5);

      fill(255, 0, 0);
      rect(0, 20, 30, 2);

      popMatrix();
    } else if (state == ski) {
      pushMatrix();


      fill(255);

      translate(x, y);
      //hair
      fill(255, 0, 0);
      rect(0, 0, 20, 8);
      //body
      fill(0, 255, 0);
      rect(5, 8, 12, 13);
      //face
      fill(255, 0, 255);
      rect(5, 5, 17, 5);

      //legs
      fill(0, 255, 0);
      rect(13, 20, 5, 4);
      rect(10, 24, 5, 4);
      //boot
      fill(255, 0, 0);
      rect(10, 27, 5, 3);
      //arm
      fill(255, 255, 0);
      rect(8, 11, 3, 10);

      //skipole
      fill(255);
      rect(2, 18, 18, 2);

      //skis
      stroke(255);
      strokeWeight(2);
      line(3, h, 0, h-3);
      line(20, h, 23, h-3);
      line(3, h, 20, h);
      noStroke();
      popMatrix();
    } else if (state == crashing) { 
      pushMatrix();
      translate(x, y);
      ellipseMode(CENTER);  

      for (int counter=5; counter>-1; counter--) {
        float fillColor = map(abs(counter), 0, 5, 0, 255);
        fill(255, fillColor, 0);
        float circleSize = abs(counter)*9;
        circle(10, 10, circleSize);
      }
      popMatrix();


      //println("CRASH SEQUENCE***");
    }
  }
  int getPlatformHeight() {
    int rtrn = 0;
    try {
      rtrn= platforms.get(level).y - h - platformHeight;
    } 
    catch (Exception e) {
      stop();
    }
    return rtrn;
  }
  void jump() {
    moving = true;
    //println("JUMP");

    int h;
    h= getPlatformHeight();
    if (y==h) {
      vy=-1.45;
      //jumping=true;
    }
  }
  void left() {
    moving=true;
    vx+=-acceleration;    
    movingRight = false;
    movingLeft = true;
    if (movingLeft) {
      acceleration -=rate;
    }
  }
  void right() {
    moving =true;
    vx+=acceleration;
    acceleration +=rate;
    //println("right");
  }
  void stopX() {
    vx=0;
    acceleration=0;    
    //println("STOP");
    //vy=0;
  }
  void up() {
    jump();
  }
  void down() {
  }
  void move() {
    if (moving) {  
      y+=vy;
      x+=vx;

      vy+=gravity;
      if (level==3 && x+30 > width) {
        //stop();
      }
      int h;
      h= getPlatformHeight();
      if (y<=h) {
      }
      if (y>h) {
        y=h;
        //jumping = false;   
        //println(y);
      }   
      //println("VX" + vx);
      //println("max speed:"+ maxSpeed);
      if (vx>maxSpeed ) {
        vx=maxSpeed;
        acceleration=0;
      } else if ( -vx < -maxSpeed) {
        vx=-maxSpeed;
      }

      if (x+30 > width ) {
        level++;
        x=1;
        y+=125;
      }
    }
    if (hitObstacle) {
      state = crashing;
      vx=0;
      vy=0;
    }
  }
  void collissionDetected() {
    origState=state;
    hitObstacle=true;
    state = 3;
    frameStartCrash = frameCount;  
    hitObstacle=true;
    vx = 0;
    vy = 0;
  }
  void treatDetected(int value) {
    foundTreat=true;
    treatValue = value;
  }
}
