Spaceship test;
Star [] test2 = new Star[1500];
ArrayList <Asteroid> block3 = new ArrayList <Asteroid> ();

public boolean wPress, aPress, dPress, lazySteer;
public int AsteroidAmount, hyperspaceEffect, hyperspaceCooldown;

///////////////////////////////////////////////////////////////////////////////////////////////// setup

public void setup() {
  //fullScreen();
  size(1500, 1000);
  textSize(20);;

  wPress = false;
  aPress = false;
  dPress = false;
  lazySteer = false;
  AsteroidAmount = 50;
  hyperspaceEffect = 0;
  hyperspaceCooldown = 0; // COUNTED IN FRAMES (60 FPS)
  
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
  for (int i = 0; i < AsteroidAmount; i++) {
    block3.get(i).turn();
    block3.get(i).move();
    block3.get(i).show();
    //block3.get(i).getVelocity();
  }
  
  ////////////////////////////////////////// Spaceship
  if (wPress)
    test.accel(0.1);
  if (lazySteer) {
    test.mouseDirect();
  } else {
    if (aPress)
      test.turn(-0.01);
    if (dPress)
      test.turn(0.01);
  }
  test.move();
  test.show();
  //test.getVelocity();
  
  ////////////////////////////////////////// the rest
  stroke(0, 255, 0);
  fill(0, 100);
  rect(30, 30, 250, 65);

  fill(0, 255, 0);
  textAlign(LEFT);
  text((test.getDirect()*180) + "°", 40, 60);
  text("lazySteer = " + lazySteer, 40, 80);

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
      for (int i = 0; i < AsteroidAmount; i++)
        block3.get(i).hyperspace();
    }
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

  if (key == 'r' || key == 'R')
    lazySteer = false;
}
