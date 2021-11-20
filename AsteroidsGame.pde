Spaceship test = new Spaceship();
Stars [] test2 = new Stars[1000];

public boolean wPress = false;
public boolean aPress = false;
public boolean dPress = false;
public boolean lazySteer = false;

///////////////////////////////////////////////////////////////////////////////////////////////

public void setup() {
  strokeWeight(2);
  //fullScreen();
  size(1000, 1000);
  textSize(25);
  textAlign(CENTER);
  
  for (int i = 0; i < test2.length; i++)
    test2[i] = new Stars();
}

///////////////////////////////////////////////////////////////////////////////////////////////

public void draw() {
  background(0);

  if (wPress)
    test.accel(0.1);
  
  if (lazySteer) {
    test.mouseDirect();
  }
  else {
    if (aPress)
      test.turn(-0.005);
    if (dPress)
      test.turn(0.005);
  }
  
  for (int i = 0; i < test2.length; i++)
    test2[i].show();
  
  test.move();
  test.show();
  
  fill(255);
  text((int)(test.Getdirect()*180) + ", " + lazySteer, 500, 500);
}

///////////////////////////////////////////////////////////////////////////////////////////////

public void keyPressed() {
  if (key == 'w' || key == 'W')
    wPress = true;
  if (key == 'a' || key == 'A')
    aPress = true;
  if (key == 'd' || key == 'D')
    dPress = true;
  
  if (key == 'h' || key == 'H')
    test.hyperspace();
  
  if (key == 'r' || key == 'R')
    lazySteer = true;
}

public void keyReleased() {
  if (key == 'w' || key == 'W')
    wPress = false;
  if (key == 'a' || key == 'A')
    aPress = false;
  if (key == 'd' || key == 'D')
    dPress = false;
  
  if (key == 'r' || key == 'R')
    lazySteer = false;
}
