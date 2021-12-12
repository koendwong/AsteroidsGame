class Spaceship extends Floater {

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// declare

  protected float vAng, vVectL, vDirect;
  protected float[] xThrusterW, yThrusterW;
  protected int pCompassX, pCompassY;
  protected float thrusterOpacity, healthPoints, healthR, healthG;
  protected Explosion[] Gone;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// initialize

  public Spaceship() {
    xCorners = new float[] {26, 24, 12, -12, -16, -14, -20, -21, -20, -14, -16, -12, 12, 24};
    yCorners = new float[] { 0, -2, -4, -12, -10,  -4,  -2,   0,   2,   4,  10,  12,  4,  2};
    xThrusterW = new float[] {-27, -30, -50, -30};
    yThrusterW = new float[] {  0,  -3,   0,   3};
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

  public float getV() {
    return (float)Math.sqrt((vX*vX)+(vY*vY))*60;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// turn

  public void accelTurn(float R) {
    vAng += R;
  }
  public void turn() {
    direct += vAng;
  }

  public void setAng(float A) {
    vAng = A;
  }
  public float getAng() {
    return vAng;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// getDirection

  public void mouseDirect() {
    vAng = 0;
    aimX = mouseX - pX;
    aimY = mouseY - pY;
    if (aimX >= 0)
      direct = ((float)Math.atan(aimY/aimX))/PI;
    else
      direct = (PI+(float)Math.atan(aimY/aimX))/PI;
  }

  public float getDirect() {
    if (direct <= 0)
      direct += 2;
    else if (direct > 2)
      direct -= 2;
    return 2-direct;
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// show

  public void show() {
    translate(pX, pY); //////////
    rotate(direct*PI);
    
    //////////////////////////////////////////////////////////////////////////////////// show Spaceship
    strokeC = color(healthR*2.55, healthG*2.55, 0);
    strokeWeight(strokeW);
    stroke(strokeC);
    fill(fillC);
    beginShape();
    for (int n = 0; n < corners; n++) {
      vertex(xCorners[n], yCorners[n]);
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
      vertex(xThrusterW[n], yThrusterW[n]);
    }
    endShape(CLOSE);
    
    rotate(-direct*PI);
    translate(-pX, -pY); //////////
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// displayCompass

  public void displayCompass() {
    //////////////////////////////////////////////////////////////////////////////////// set up vVectL
    if (vX == 0 && vY == 0)
      vDirect = 0;
    else if (vX >= 0)
      vDirect = (float)Math.atan(vY/vX);
    else
      vDirect = PI+(float)Math.atan(vY/vX);

    vVectL = getV();
    if (vVectL >= 100)
      vVectL = 100;
    
    if (!deathSpaceship) { ////////////////////////////////////////////////////////////////////////////////////
      translate(pCompassX, pCompassY); //////////
      
      noStroke();
      fill(0, 150);
      ellipse(0, 0, 200, 200);
      
      //////////////////////////////////////////////////////////////////////////////////// display vVectL
      rotate(vDirect);
      stroke(255, 0, 255);
      line(0, 0, vVectL, 0);
      rotate(-vDirect);
      
      //////////////////////////////////////////////////////////////////////////////////// display Angular
      rotate(direct*PI);
      fill(0, 128, 255, 50);
      noStroke();
      if (vAng > 0)
        arc(0, 0, 200, 200, 0, vAng*60*PI);
      else if (vAng < 0)
        arc(0, 0, 200, 200, vAng*60*PI, 0);
      if (lazySteer)
        stroke(0, 255, 255, 150);
      else
        stroke(0, 128, 255, 150);
      line(0, 0, 100, 0);
      rotate(-direct*PI);
      
      translate(-pCompassX, -pCompassY); //////////
      
      stroke(strokeC);
      noFill();
      ellipse(pCompassX, pCompassY, 200, 200);
      fill(0, 200);
      rect(25, 245, 190, 80, 10);
      
      textFont(BankGothicBold);
      textAlign(LEFT);
      textSize(20);
      fill(255, 0, 255);
      text(getV() + "", 35, 300);
      textSize(10);
      text("PIXELS PER SECOND", 35, 310);
  
      if (lazySteer)
        fill(0, 255, 255);
      else
        fill(0, 128, 255);
      textSize(20);
      text((getDirect()*180) + "", 35, 270);
      textSize(10);
      text("DEGREES", 35, 280);
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
      text("GAME OVER", 120, 290);
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// healthPoints
  
  public void healthMinus() {
    if (healthPoints > 0.0)
      healthPoints -= 20; ///////////////////////////////////////////// DAMAGE
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
    translate(pX, pY);
    rotate(direct*PI);
    for(int i = 0; i < Gone.length; i++)
      Gone[i].show();
    rotate(-direct*PI);
    translate(-pX, -pY);
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// hyperspace

  public void hyperspace() {
    vX = 0;
    vY = 0;
    vAng = 0;
    pX = (int)(Math.random()*(width+1-100))+50;
    pY = (int)(Math.random()*(height+1-100))+50;
    direct = (float)Math.random()*2;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// end Spaceship
}
