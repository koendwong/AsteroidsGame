class Asteroid extends Floater {
  
  protected double vertexRadius, R;
  protected double[] xCorners, yCorners;

  ///////////////////////////////////////////////////////////////////////////////////////////////

  public Asteroid() {
    pX = Math.random()*1000;
    pY = Math.random()*1000;
    vX = (Math.random()*2)-1;
    vY = (Math.random()*2)-1;
    R = (Math.random()*0.05)-0.025;
    direct = Math.random()*2;
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
      vertexRadius = (Math.random()*20)+10;
      xCorners[i] = vertexRadius*cos(i*(2*PI/corners));
      yCorners[i] = vertexRadius*sin(i*(2*PI/corners));
    }
  }
  
  ///////////////////////////////////////////////////////////////////////////////////////////////
  
  public void turn() {
    direct += R;
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
