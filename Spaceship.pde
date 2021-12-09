class Spaceship extends Floater {
  
  /////////////////////////////////////////////////////////////////////////////////////////////// declare
  
  protected double vAng, vVectL, vDirect;
  protected int pCompassX, pCompassY;
  
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
    pCompassX = 120;
    pCompassY = 120;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// getV
  
  public double getV() {
    return Math.sqrt((vX*vX)+(vY*vY))*60;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// turn
  
  public void accelTurn(double R) {
    vAng += R;
  }
  public void turn() {
    direct += vAng;
  }
  
  public void setAng(double A) {
    vAng = A;
  }
  public double getAng() {
    return vAng;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// getDirection
  
  public void mouseDirect() {
    vAng = 0;
    aimX = mouseX - pX;
    aimY = mouseY - pY;
    if (aimX >= 0)
      direct = (Math.atan(aimY/aimX))/PI;
    else
      direct = (PI+Math.atan(aimY/aimX))/PI;
  }
  
  public double getDirect() {
    if (direct <= 0)
      direct += 2;
    else if (direct > 2)
      direct -= 2;
    return 2-direct;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// displayCompass
  
  public void displayCompass() {
    ////////////////////////////////////////// set up vVectL
    if (vX == 0 && vY == 0)
      vDirect = 0;
    else if (vX >= 0)
      vDirect = Math.atan(vY/vX);
    else
      vDirect = PI+Math.atan(vY/vX);
    
    vVectL = getV();
    if (vVectL >= 100)
      vVectL = 100;
    
    translate((float)pCompassX, (float)pCompassY); //////////
    
    noStroke();
    fill(0, 150);
    ellipse(0, 0, 200, 200);
    
    ////////////////////////////////////////// display vVectL
    rotate((float)vDirect);
    stroke(255, 0, 255);
    line(0, 0, (float)vVectL, 0);
    rotate(-(float)vDirect);
    
    ////////////////////////////////////////// display Angular
    rotate((float)direct*PI);
    fill(0, 128, 255, 50);
    noStroke();
    if (vAng > 0) {
      arc(0, 0, 200, 200, 0, (float)vAng*60*PI);
    }
    else if (vAng < 0) {
      arc(0, 0, 200, 200, (float)vAng*60*PI, 0);
    }
    if (lazySteer)
      stroke(0, 255, 255, 150);
    else
      stroke(0, 128, 255, 150);
    line(0, 0, 100, 0);
    rotate(-(float)direct*PI);
    
    //////////////////////////////////////////
    stroke(strokeC);
    fill(255, 0);
    ellipse(0, 0, 200, 200);
    
    translate(-(float)pCompassX, -(float)pCompassY); //////////
    
    ////////////////////////////////////////// display number data
    stroke(strokeC);
    fill(0, 200);
    rect(25, 245, 190, 80, 10);
  
    textAlign(LEFT);
    textSize(15);
    fill(255, 0, 255);
    text(getV() + "", 35, 300);
    textSize(10);
    text("pixels per second", 35, 310);
  
    if (lazySteer)
      fill(0, 255, 255);
    else
      fill(0, 128, 255);
    textSize(15);
    text((getDirect()*180) + "", 35, 270);
    textSize(10);
    text("degrees", 35, 280);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// hyperspace
  
  public void hyperspace() {
    vX = 0;
    vY = 0;
    vAng = 0;
    pX = (int)(Math.random()*(width+1-100))+50;
    pY = (int)(Math.random()*(height+1-100))+50;
    direct = Math.random()*2;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// end Spaceship
  
}
