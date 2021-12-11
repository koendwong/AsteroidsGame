class Asteroid extends Floater {
  
  /////////////////////////////////////////////////////////////////////////////////////////////// declare
  
  protected double vertexRadius, AsteroidRotate;

  /////////////////////////////////////////////////////////////////////////////////////////////// initialize

  public Asteroid() {
    corners = (int)(Math.random()*7)+6;
    xCorners = new double[corners];
    yCorners = new double[corners];
    for (int i = 0; i < corners; i++) {
      vertexRadius = (Math.random()*15)+15;
      xCorners[i] = vertexRadius*Math.cos(i*(2*PI/corners));
      yCorners[i] = vertexRadius*Math.sin(i*(2*PI/corners));
    }
    pX = (int)(Math.random()*(width+1));
    pY = (int)(Math.random()*(height+1));
    vX = (Math.random()*2)-1;
    vY = (Math.random()*2)-1;
    AsteroidRotate = (Math.random()*0.05)-0.025;
    direct = Math.random()*2;
    strokeW = 2;
    strokeC = color(255);
    fillC = color(0);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// turn
  
  public void turn() {
    direct += AsteroidRotate;
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// getVelocity
  
  public void getVelocity() {
    stroke(255, 0, 0);
    line((float)pX, (float)pY, (float)pX+(float)vX*60, (float)pY+(float)vY*60);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// hyperspace
  
  public void hyperspace() {
    pX = (int)(Math.random()*(width+1));
    pY = (int)(Math.random()*(height+1));
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////// end Asteroid
  
}
