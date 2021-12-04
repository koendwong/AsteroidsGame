class Asteroid extends Floater {
  
  protected double vertexRadius;
  protected double[] xCorners, yCorners;

  ///////////////////////////////////////////////////////////////////////////////////////////////

  public Asteroid() {
    pX = Math.random()*1000;
    pY = Math.random()*1000;
    strokeW = 2;
    strokeC = color(255);
    fillC = color(0);
    create();
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  private void create() {
    corners = (int)(Math.random()*7)+6;
    
    xCorners = new double[corners];
    yCorners = new double[corners];

    for (int i = 0; i < corners; i++) {
      vertexRadius = (Math.random()*15)+10;
      xCorners[i] = vertexRadius*cos(i*(2*PI/corners));
      yCorners[i] = vertexRadius*sin(i*(2*PI/corners));
    }
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void show() {
    strokeWeight(strokeW);
    stroke(strokeC);
    fill(fillC);
    translate((float)pX, (float)pY);
    rotate((float)direct*PI);
    
    beginShape();
    for (int n = 0; n < corners; n++)
    {
      vertex((float)xCorners[n], (float)yCorners[n]);
    }
    endShape(CLOSE);
    
    rotate(-(float)direct*PI);
    translate(-(float)pX, -(float)pY);
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void hyperspace() {
    pX = Math.random()*1000;
    pY = Math.random()*1000;
    create();
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
}
