class Spaceship extends Floater {

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// declare

  protected double vAng, vVectL, vDirect;
  protected double[] xThrusterW, yThrusterW;
  protected int pCompassX, pCompassY;
  protected float thrusterOpacity, healthPoints, healthR, healthG;
  protected Explosion[] Gone;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// initialize

  public Spaceship() {
    xCorners = new double[] {26, 24, 12, -12, -16, -14, -20, -21, -20, -14, -16, -12, 12, 24};
    yCorners = new double[] { 0, -2, -4, -12, -10,  -4,  -2,   0,   2,   4,  10,  12,  4,  2};
    xThrusterW = new double[] {-27, -30, -50, -30};
    yThrusterW = new double[] {  0,  -3,   0,   3};
    thrusterOpacity = 0;
    corners = 14;
    pX = width/2;
    pY = height/2;
    direct = 0;
    vAng = 0;
    vX = 0;
    vY = 0;
    healthPoints = 100;
    healthR = 0;
    healthG = 100;
    strokeW = 2;
    strokeC = color(0, 255, 0);
    fillC = color(0);
    pCompassX = 120;
    pCompassY = 120;
    Gone = new Explosion[] {
    new Explosion(26,    0),
    new Explosion(24,   -2), new Explosion(21, -2.5), new Explosion(18, -3), new Explosion(15, -3.5),
    new Explosion(12,   -4), new Explosion(9, -5), new Explosion(6, -6), new Explosion(3, -7), new Explosion(0, -8), new Explosion(-3, -9), new Explosion(-6, -10), new Explosion(-9, -11),
    new Explosion(-12, -12), new Explosion(-14, -11),
    new Explosion(-16, -10), new Explosion(-15, -7),
    new Explosion(-14,  -4), new Explosion(-17, -3),
    new Explosion(-20,  -2),
    new Explosion(-21,   0),
    new Explosion(-20,   2), new Explosion(-17, 3),
    new Explosion(-14,   4), new Explosion(-15, 7),
    new Explosion(-16,  10), new Explosion(-14, 11),
    new Explosion(-12,  12), new Explosion(-9, 11), new Explosion(-6, 10), new Explosion(-3, 9), new Explosion(0, 8), new Explosion(3, 7), new Explosion(6, 6), new Explosion(9, 5),
    new Explosion(12,    4), new Explosion(15, 3.5), new Explosion(18, 3), new Explosion(21, 2.5),
    new Explosion(24,    2)
    };
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// getV

  public double getV() {
    return Math.sqrt((vX*vX)+(vY*vY))*60;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// turn

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

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// getDirection

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
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// show

  public void show() {
    translate((float)pX, (float)pY); //////////
    rotate((float)direct*PI);
    
    //////////////////////////////////////////////////////////////////////////////////// show Spaceship
    strokeC = color(healthR*2.55, healthG*2.55, 0);
    strokeWeight(strokeW);
    stroke(strokeC);
    fill(fillC);
    beginShape();
    for (int n = 0; n < corners; n++) {
      vertex((float)xCorners[n], (float)yCorners[n]);
    }
    endShape(CLOSE);
    
    //////////////////////////////////////////////////////////////////////////////////// show Thruster
    if (wPress) {
      if (thrusterOpacity < 150)
        thrusterOpacity+=15;
      else
        thrusterOpacity = 150;
    }
    else {
      if (thrusterOpacity > 0)
        thrusterOpacity-=15;
      else
        thrusterOpacity = 0;
    }
    stroke(100, 100, 255, thrusterOpacity);
    fill(255, thrusterOpacity);
    beginShape();
    for (int n = 0; n < xThrusterW.length; n++) {
      vertex((float)xThrusterW[n], (float)yThrusterW[n]);
    }
    endShape(CLOSE);
    
    rotate(-(float)direct*PI);
    translate(-(float)pX, -(float)pY); //////////
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// displayCompass

  public void displayCompass() {
    //////////////////////////////////////////////////////////////////////////////////// set up vVectL
    if (vX == 0 && vY == 0)
      vDirect = 0;
    else if (vX >= 0)
      vDirect = Math.atan(vY/vX);
    else
      vDirect = PI+Math.atan(vY/vX);

    vVectL = getV();
    if (vVectL >= 100)
      vVectL = 100;
    
    if (!deathSpaceship) { ////////////////////////////////////////////////////////////////////////////////////
      translate(pCompassX, pCompassY); //////////
      
      noStroke();
      fill(0, 150);
      ellipse(0, 0, 200, 200);
      
      //////////////////////////////////////////////////////////////////////////////////// display vVectL
      rotate((float)vDirect);
      stroke(255, 0, 255);
      line(0, 0, (float)vVectL, 0);
      rotate(-(float)vDirect);
      
      //////////////////////////////////////////////////////////////////////////////////// display Angular
      rotate((float)direct*PI);
      fill(0, 128, 255, 50);
      noStroke();
      if (vAng > 0)
        arc(0, 0, 200, 200, 0, (float)vAng*60*PI);
      else if (vAng < 0)
        arc(0, 0, 200, 200, (float)vAng*60*PI, 0);
      if (lazySteer)
        stroke(0, 255, 255, 150);
      else
        stroke(0, 128, 255, 150);
      line(0, 0, 100, 0);
      rotate(-(float)direct*PI);
      
      translate(-pCompassX, -pCompassY); //////////
      
      stroke(strokeC);
      noFill();
      ellipse(pCompassX, pCompassY, 200, 200);
      fill(0, 200);
      rect(25, 245, 190, 80, 10);
      
      textFont(BankGothic48);
      textAlign(LEFT);
      if (lazySteer)
        fill(0, 255, 255);
      else
        fill(0, 128, 255);
      textSize(12);
      text((getDirect()*180) + "", 40, 270);
      textSize(8);
      text("DEGREES", 40, 280);
      
      textSize(12);
      fill(255, 0, 255);
      text(getV() + "", 40, 300);
      textSize(8);
      text("PIXELS PER SECOND", 40, 310);
    } ////////////////////////////////////////////////////////////////////////////////////
    else {
      stroke(255, 0, 0);
      fill(0, 200);
      translate(pCompassX, pCompassY); //////////
      ellipse(0, 0, 200, 200);
      image(skull, -60, -65);
      translate(-pCompassX, -pCompassY); //////////
      rect(25, 245, 190, 80, 10);
      
      textAlign(CENTER);
      textSize(25);
      fill(255, 0, 0);
      text("GAME OVER", 120, 292);
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// healthPoints
  
  public void healthMinus() {
    if (healthPoints > 0.0)
      healthPoints -= 5; ///////////////////////////////////////////// DAMAGE
    else {
      healthPoints = 0;
      deathSpaceship = true;
    }
    
    if (healthPoints > 50.0)
      healthR = (100-healthPoints)*2;
    else if (healthPoints > 0.0) {
      healthR = 100;
      healthG = (healthPoints)*2;
    }
    else
      healthG = 0;
  }
  
  public void explosion() {
    translate((float)pX, (float)pY);
    rotate((float)direct*PI);
    for(int i = 0; i < Gone.length; i++)
      Gone[i].show();
    rotate(-(float)direct*PI);
    translate(-(float)pX, -(float)pY);
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// hyperspace

  public void hyperspace() {
    vX = 0;
    vY = 0;
    vAng = 0;
    pX = (int)(Math.random()*(width+1-100))+50;
    pY = (int)(Math.random()*(height+1-100))+50;
    direct = Math.random()*2;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// end Spaceship
}
