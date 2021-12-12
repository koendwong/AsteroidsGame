class Floater {

  /////////////////////////////////////////////////////////////////////////////////////////////// declare

  protected int corners, strokeW;
  protected float[] xCorners, yCorners;
  protected float pX, pY, vX, vY, direct, aimX, aimY;
  protected color strokeC, fillC;

  /////////////////////////////////////////////////////////////////////////////////////////////// move

  public void move() {
    pX += vX;
    pY += vY;

    if (pX > width+50)
      pX = -50;
    else if (pX < -50)
      pX = width+50;
    if (pY > height+50)
      pY = -50;
    else if (pY < -50)
      pY = height+50;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// getP
  
  public float getPX() {
    return pX;
  }
  public float getPY() {
    return pY;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// accel

  public void accel(float A) {
    vX += A * Math.cos(direct*PI);
    vY += A * Math.sin(direct*PI);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// turn

  public void turn(float R) {
    direct += R;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// show

  public void show() {
    strokeWeight(strokeW);
    stroke(strokeC);
    fill(fillC);

    translate(pX, pY);
    rotate(direct*PI);
    beginShape();
    for (int n = 0; n < corners; n++) {
      vertex(xCorners[n], yCorners[n]);
    }
    endShape(CLOSE);
    rotate(-direct*PI);
    translate(-pX, -pY);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// end Floater
  
}
