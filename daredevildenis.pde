//import processing.sound.*;
GameEnvironment ge;

float gravity = .04;
int platformHeight = 10;
void setup() {
  size(500, 500);
  ge=new GameEnvironment();
}

void draw() {
  
  noStroke();
  background(0);
  ge.show();
}
void keyPressed() {
  ge.keyDown();
}
void keyReleased(){
  ge.keyUp();
}
