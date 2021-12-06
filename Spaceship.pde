class Spaceship extends Floater {
  
  /////////////////////////////////////////////////////////////////////////////////////////////// initialize
  
  public Spaceship() {
    corners = 14;
    xCorners = new double[] {26, 24, 12, -12, -16, -14, -20, -21, -20, -14, -16, -12, 12, 24};
    yCorners = new double[] {0,  -2, -4, -12, -10,  -4,  -2,   0,   2,   4,  10,  12,  4,  2};
    pX = width/2;
    pY = height/2;
    direct = 0;
    vX = 0;
    vY = 0;
    strokeW = 2;
    strokeC = color(0, 255, 0);
    fillC = color(0);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// hyperspace
  
  public void hyperspace() {
    vX = 0;
    vY = 0;
    pX = (int)(Math.random()*(width+1-100))+50;
    pY = (int)(Math.random()*(height+1-100))+50;
    direct = Math.random()*2;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// direction
  
  public void mouseDirect() {
    aimX = mouseX - pX;
    aimY = mouseY - pY;
    if (aimX >= 0)
      direct = (atan((float)aimY/(float)aimX))/PI;
    else
      direct = (PI+atan((float)aimY/(float)aimX))/PI;
  }
  
  public double getDirect() {
    if (direct <= 0)
      direct += 2;
    return 2-direct;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// getVelocity
  
  public void getVelocity() {
    stroke(255, 0, 0);
    line((float)pX, (float)pY, (float)pX+(float)vX*60, (float)pY+(float)vY*60);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// end Spaceship
  
}
