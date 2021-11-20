class Stars extends Floater {
  public Stars() {
    pX = Math.random()*1000;
    pY = Math.random()*1000;
  }
  
  public void show() {
    noStroke();
    fill(255);
    ellipse((float)pX, (float)pY, 2, 2);
  }
}
