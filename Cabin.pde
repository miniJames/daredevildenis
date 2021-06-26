class Cabin extends Obstacle{
  Cabin(int _x, int _y, int _w, int _h) {
    super(_x, _y, _w, _h);
  }  
  Treat move(){
    return null;  
  }
  void drawObstacle(){
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
}
