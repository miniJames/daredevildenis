class Platform {
  int x, y, w;
  color c;

  Platform(int _x, int _y, color _c) {
  
    x=_x;
    y=_y;
    w=-platformHeight;
    c = _c;
  }

  void show() {
    pushMatrix();
    translate(x, y);
    fill(c);
    rect(0, 0, width, w);
    popMatrix();
  }  

}


boolean box_box(float ax0, float ay0, float ax1, float ay1, float bx0, float by0, float bx1, float by1){
    float topA = (float) Math.min(ay0, ay1);
    float botA = (float) Math.max(ay0, ay1);
    float leftA = (float) Math.min(ax0, ax1);
    float rightA = (float) Math.max(ax0, ax1);
    float topB = (float) Math.min(by0, by1);
    float botB = (float) Math.max(by0, by1);
    float leftB = (float) Math.min(bx0, bx1);
    float rightB = (float) Math.max(bx0, bx1);
    if(botA < topB  || botB < topA || rightA < leftB || rightB < leftA)
        return false;
    return true;   
}
   
float[] box_box_p(float ax0, float ay0, float ax1, float ay1, float bx0, float by0, float bx1, float by1){
    float[] result = new float[0];
    float topA = (float) Math.min(ay0, ay1);
    float botA = (float) Math.max(ay0, ay1);
    float leftA = (float) Math.min(ax0, ax1);
    float rightA = (float) Math.max(ax0, ax1);
    float topB = (float) Math.min(by0, by1);
    float botB = (float) Math.max(by0, by1);
    float leftB = (float) Math.min(bx0, bx1);
    float rightB = (float) Math.max(bx0, bx1);
   
    if(botA < topB  || botB < topA || rightA < leftB || rightB < leftA)
        return result;
    float leftO = (leftA < leftB) ? leftB : leftA;
    float rightO = (rightA > rightB) ? rightB : rightA;
    float botO = (botA > botB) ? botB : botA;
    float topO = (topA < topB) ? topB : topA;
    result =  new float[] {leftO, topO, rightO, botO};
    return result;
}
