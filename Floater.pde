class Floater {
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  protected int corners;
  protected int[] xCorners, yCorners;
  protected double pX, pY, vX, vY, direct, aimX, aimY;
  protected color strokeC, fillC;
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void move() {
    pX += vX;
    pY += vY;
    
    if (pX > 1050)
      pX = -50;
    else if (pX < -50)
      pX = 1050;
    if (pY > 1050)
      pY = -50;
    else if (pY < -50)
      pY = 1050;
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void accel(double A) {
    vX += A * Math.cos(direct*PI);
    vY += A * Math.sin(direct*PI);
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void turn(double R) {
    direct += R;
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void show() {
    stroke(strokeC);
    fill(fillC);
    translate((float)pX, (float)pY);
    rotate((float)direct*PI);
    
    beginShape();
    for (int n = 0; n < corners; n++)
    {
      vertex(1*xCorners[n], 1*yCorners[n]);
    }
    endShape(CLOSE);
    
    rotate(-(float)direct*PI);
    translate(-(float)pX, -(float)pY);
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
}
