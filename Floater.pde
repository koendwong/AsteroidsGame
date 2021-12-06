class Floater {

  /////////////////////////////////////////////////////////////////////////////////////////////// declare

  protected int corners, strokeW;
  protected double[] xCorners, yCorners;
  protected double pX, pY, vX, vY, accelerate, direct, aimX, aimY;
  protected color strokeC, fillC;

  /////////////////////////////////////////////////////////////////////////////////////////////// initialize

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

  /////////////////////////////////////////////////////////////////////////////////////////////// accel

  public void accel(double A) {
    accelerate = A;
    vX += A * Math.cos(direct*PI);
    vY += A * Math.sin(direct*PI);
  }

  /////////////////////////////////////////////////////////////////////////////////////////////// turn

  public void turn(double R) {
    direct += R;
  }

  /////////////////////////////////////////////////////////////////////////////////////////////// show

  public void show() {
    strokeWeight(strokeW);
    stroke(strokeC);
    fill(fillC);

    translate((float)pX, (float)pY);
    rotate((float)direct*PI);
    beginShape();
    for (int n = 0; n < corners; n++) {
      vertex((float)xCorners[n], (float)yCorners[n]);
    }
    endShape(CLOSE);
    rotate(-(float)direct*PI);
    translate(-(float)pX, -(float)pY);
  }

  /////////////////////////////////////////////////////////////////////////////////////////////// end Floater
  
}
