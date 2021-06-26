int tree = 0, house = 1, ambulance = 2, spider = 3, lighthouse = 4, boat = 5, whale = 6;
int snowman=7, snowball=8, cabin = 9, police=10, chopper=11, gap=12;
class Obstacle {
  int x, y;
  int h = 30;
  int w = 30;
  int type = 0;
  float vy;
  int spiderDir = 1;
  int level;
  Obstacle(int _x, int _y, int _w, int _h, int _t) {
    x=_x;
    y=_y-platformHeight-h;
    type = _t;
    level=3;
    w = _w;
    h=_h;
  }

  void show() {


    if (type==house) {
      drawHouse();
    } else if (type==tree) {
      drawTree();
    } else if (type == ambulance) {
      drawAmbulance();
    } else if (type==spider) {
      drawSpider();
    } else if (type == lighthouse) {
      drawLightHouse();
    } else if (type == boat) {
      drawBoat();
    } else if (type ==whale) {
      drawWhale();
    } else if (type==snowman) {
      drawSnowman();
    } else if (type==snowball) {
      drawSnowball();
    } else if (type==cabin) {
      drawCabin();
    } else if (type==police) {
      drawPolice();
    } else if (type==chopper) {
      drawChopper();
    }    
    //pushMatrix();
    //noFill();
    //stroke(255);
    //strokeWeight(1);
    //rect(x,y,w,h);
    //noStroke();
    //popMatrix();
  }

  Treat move() {
    Treat rtrn=null;
    if (type==ambulance || type == boat || type == snowball) {
      x+=2;
      if (x==width) { 
        x=0;
      }
    } else if (type==spider) {
      h+=spiderDir;
      //println(spiderDir);
      if (h<30 || h>110) {
        spiderDir *=-1;
      }
    } else if (type==police) {
      vy+=gravity;

      if (y>=83) {
        vy-=1.75;
      }        
      y+=vy;
    } else if (type==chopper) {

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
    }
    return rtrn;
  }

  void drawWhale() {
    pushMatrix();

    translate(x, y);
    //body
    fill(0, 255, 255);
    ellipse(15, 15, 30, 20);

    //tail
    rect(27, 3, 3, 10);

    //eye
    fill(255);
    ellipse(10, 13, 5, 5);

    fill(0);
    ellipse(13, 12, 3, 3);
    //mouth

    rect(0, 16, 7, 2);

    //water
    fill(255);
    stroke(255);

    line(13, 4, 11, 0);
    line(17, 0, 13, 04);
    noStroke();
    popMatrix();
  }

  void drawSnowman() {

    pushMatrix();
    translate(x, y);
    fill(255);
    noStroke();
    //body
    ellipse(15, 22, 31, 20);
    ellipse(15, 9, 18, 10);     

    //hat
    fill(255, 255, 0);
    rect(3, 4, 12, 2);
    rect(8, 0, 7, 5);

    fill(0, 255, 0);
    rect(15, 4, 12, 2);
    rect(15, 0, 7, 5);

    //eyes
    fill(0);
    circle(12, 8, 3);
    circle(18, 8, 3);
    //mouth
    fill(255, 0, 0);
    rect(12, 11, 5, 1);

    //buttons
    fill(0, 0, 255);
    rect(12, 15, 3, 4);
    fill(0);
    rect(15, 15, 3, 4);
    fill(0, 0, 255);
    rect(12, 20, 3, 4);
    fill(0);
    rect(15, 20, 3, 4);
    popMatrix();
  }
  void drawSnowball() {
    pushMatrix();
    translate(x, y);
    fill(0, 255, 255);
    circle(13, 13, 25);
    fill(255);
    circle(11, 13, 20);

    popMatrix();
  }
  void drawCabin() {
    pushMatrix();
    translate(x, y);
    fill(255, 128, 0);
    rect(0, 15, 30, 20);

    //roof
    fill(255, 0, 0);
    beginShape();

    vertex(0, 10);
    vertex(15, 0);

    vertex(30, 10);
    endShape();

    fill(0);
    //rect(3, 12, 8, 6);
    //door
    fill(0, 0, 0);
    rect(3, 20, 8, 10);

    //windows
    fill(0, 0, 0);
    //rect(14, 12, 6, 6);
    //rect(22, 12, 6, 6);
    rect(14, 20, 6, 6);
    rect(22, 20, 6, 6);
    fill(0);
    //rect(18, 12, 5, 6);
    rect(18, 20, 5, 6);

    //snow
    fill(255);
    //under window;
    ellipse(22, 35, 15, 10);
    ellipse(2, 35, 5, 5);

    //roof
    noFill();
    stroke(255);
    strokeWeight(2);
    beginShape();

    vertex(0, 10);
    vertex(15, 0);
    vertex(30, 10);
    endShape();
    noStroke();
    popMatrix();
  }

  void drawHouse() {
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

  void drawPolice() {
    pushMatrix();
    translate(x, y);
    fill(0, 0, 255);
    rect(10, 0, 15, h);
    popMatrix();
  }

  void drawChopper() {
    pushMatrix();
    translate(x, y);
    fill(255, 0, 0);
    ellipse(15, 15, 30, 20);
    popMatrix();
  }

  void drawTree() {
    pushMatrix();
    translate(x, y);
    fill(255, 64, 0);
    rect(12, 0, 5, h);
    fill(255, 255, 0);
    ellipse(7, 12, 25, 20);
    fill(0, 255, 0);
    ellipse(15, 10, 30, 25);
    popMatrix();
  }
  void drawAmbulance() {
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

  void drawSpider() {

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
  void drawLightHouse() {
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
  void drawBoat() {
    pushMatrix();
    translate(x, y);
    //hull
    fill(255);
    circle(20, 20, 30);
    fill(0);
    rect(0, 0, 35, 20);


    //sail 1
    fill(255);
    triangle(20, 0, 5, 18, 20, 18);

    //sail 2
    fill(0, 255, 255);
    triangle(23, 0, 35, 18, 23, 18);

    //red line
    fill(255, 0, 0);
    rect(6, 23, 28, 3);

    //mast
    fill(255, 255, 0);
    rect(20, -5, 3, 23);

    //flag


    popMatrix();
  }
}
