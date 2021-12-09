Spaceship test;
Star [] test2 = new Star[1000];
ArrayList <Asteroid> block3 = new ArrayList <Asteroid> ();

public boolean wPress, aPress, dPress, qPress, shiftPress, lazySteer;
public int AsteroidAmount, hyperspaceEffect, hyperspaceCooldown;

///////////////////////////////////////////////////////////////////////////////////////////////// setup

public void setup() {
  //fullScreen();
  size(1500, 900);
  
  AsteroidAmount = 40;
  wPress = false;
  aPress = false;
  dPress = false;
  lazySteer = false;
  hyperspaceEffect = 0;
  hyperspaceCooldown = 0;
  
  test = new Spaceship();
  for (int i = 0; i < test2.length; i++)
    test2[i] = new Star();
  for (int i = 0; i < AsteroidAmount; i++)
    block3.add(i, new Asteroid());
}

///////////////////////////////////////////////////////////////////////////////////////////////// draw

public void draw() {
  background(0);
  
  ////////////////////////////////////////// Star
  for (int i = 0; i < test2.length; i++)
    test2[i].show();
  
  ////////////////////////////////////////// Asteroid
  for (int i = 0; i < block3.size(); i++) {
    block3.get(i).turn();
    block3.get(i).move();
    block3.get(i).show();
    if (dist(test.getPX(), test.getPY(), block3.get(i).getPX(), block3.get(i).getPY()) < 40)
      block3.remove(i);
  }
  
  ////////////////////////////////////////// Spaceship
  if (wPress)
    test.accel(0.05);
  if (lazySteer) {
    test.mouseDirect();
  } else {
    if (aPress)
      test.accelTurn(-0.0002);
    if (dPress)
      test.accelTurn(0.0002);
    if (shiftPress) {
      if (test.getAng() >= 0.0002) 
        test.accelTurn(-0.0002);
      else if (test.getAng() <= -0.0002)
        test.accelTurn(0.0002);
    }
  }
  test.turn();
  test.move();
  test.show();
  test.displayCompass();
  
  ////////////////////////////////////////// hyperspace effects
  if (hyperspaceCooldown > 0)
    hyperspaceCooldown--;
  if (hyperspaceEffect > 0)
    hyperspaceEffect-=10;
  noStroke();
  fill(0, hyperspaceEffect);
  rect(0, 0, width, height);
}

///////////////////////////////////////////////////////////////////////////////////////////////// keyPressed

public void keyPressed() {
  if (key == 'w' || key == 'W')
    wPress = true;
  if (key == 'a' || key == 'A')
    aPress = true;
  if (key == 'd' || key == 'D')
    dPress = true;

  if (key == 'h' || key == 'H') {
    if (hyperspaceCooldown == 0) {
      hyperspaceCooldown = 30;
      hyperspaceEffect = 260;
      test.hyperspace();
      for (int i = 0; i < test2.length; i++)
        test2[i].hyperspace();
      for (int i = 0; i < block3.size(); i++)
        block3.get(i).hyperspace();
    }
  } 
  if (keyCode == SHIFT) {
    shiftPress = true;
  }
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
  if (keyCode == SHIFT)
    shiftPress = false;  
  if (key == 'r' || key == 'R')
    lazySteer = false;
}
