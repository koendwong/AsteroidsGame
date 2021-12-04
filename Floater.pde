class Spaceship extends Floater {
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public Spaceship() {
    corners = 14;
    xCorners = new int[] {26, 24, 12, -12, -16, -14, -20, -21, -20, -14, -16, -12, 12, 24}; // DOUBLE SCALED RIGHT NOW
    yCorners = new int[] {0,  -2, -4, -12, -10,  -4,  -2,   0,   2,   4,  10,  12,  4,  2};
    pX = 500;
    pY = 500;
    direct = 0;
    vX = 0;
    vY = 0;
    strokeW = 2;
    strokeC = color(0, 255, 0);
    fillC = color(0);
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void move() {
    pX += vX;
    pY += vY;
    
    if (pX > 1030)
      pX = -30;
    else if (pX < -30)
      pX = 1030;
    if (pY > 1030)
      pY = -30;
    else if (pY < -30)
      pY = 1030;
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void hyperspace() {
    vX = 0;
    vY = 0;
    pX = (int)(Math.random()*801)+100;
    pY = (int)(Math.random()*801)+100;
    direct = Math.random()*2;
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public double getDirect() {
    if (direct <= 0)
      direct += 2;
    return 2-direct;
  }
  
  public void mouseDirect() {
    aimX = mouseX - pX;
    aimY = mouseY - pY;
    if (aimX >= 0)
      direct = (atan((float)aimY/(float)aimX))/PI;
    else
      direct = (PI+atan((float)aimY/(float)aimX))/PI;
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
}
