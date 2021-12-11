public class Explosion {
  
  protected double pX, pY, V, direct;
  protected int opacity;
  protected color fillC;
  
  public Explosion(double x, double y) {
    fillC = color(255, 0, 0);
    opacity = 255;
    pX = x;
    pY = y;
    V = Math.random();
    if (pX >= 0)
      direct = Math.atan(pY/pX);
    else
      direct = PI+Math.atan(pY/pX);
  }
  
  public Explosion() {
    fillC = color(255);
    opacity = 255;
    direct = Math.random()*2*PI;
    pX = (Math.random()*15+15)*Math.cos(direct);
    pY = (Math.random()*15+15)*Math.sin(direct);
    V = Math.random();
  }

  public void show() {
    noStroke();
    fill(fillC, opacity);
    ellipse((float)pX, (float)pY, 3, 3);
    pX += V*Math.cos(direct);
    pY += V*Math.sin(direct);
    if (opacity > 0)
      opacity-=5;
    else
      opacity = 0;
  }
}
