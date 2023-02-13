// Zack Wellborn | 28 Nov 2022 | SpaceGame
// HIGH SCORE: 12072
import processing.sound.*;
SoundFile blaster, explosion;
SpaceShip ae;
Timer  rockTimer, powerUpTimer, bossTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
Star[] stars = new Star[100];
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Boss> bosses = new ArrayList<Boss>();
int score, level, rockCount, laserCount, rocksPassed;
boolean play;

void setup() {
  blaster = new SoundFile(this, "blaster1.wav");
  //explosion = new SoundFile(this, "explode.wav");
  size(800, 800);
  ae = new SpaceShip();
  rockTimer = new Timer(int(random(700, 1000)));
  rockTimer.start();
  powerUpTimer = new Timer(5000);
  powerUpTimer.start();
  bossTimer = new Timer(15000);
  bossTimer.start();
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);

    // Rendering stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    infoPanel();
    noCursor();

    // Distributing PowerUps
    if (powerUpTimer.isFinished()) {
      powerUps.add(new PowerUp());
      powerUpTimer.start();
      //println("Rocks: " + rocks.size());
    }


    //PowerUp rendering and detecting PowerUp collision
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp p = powerUps.get(i);
      if (p.intersect(ae)) {
        if (p.type == 'a') {
          ae.ammo+=200;
          powerUps.remove(p);
        } else if (p.type == 'h') {
          ae.health+=150;
          powerUps.remove(p);
        } else {
          if (ae.turretCount==5) {
            powerUps.remove(p);
          } else {
            ae.turretCount+=1;
            powerUps.remove(p);
          }
        }
      }
      if (p.reachedBottom()) {
        powerUps.remove(p);
      } else {
        p.display();
        p.move();
      }
    }


    // Distributing Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks: " + rocks.size());
    }


    //Rendering Rocks and detecting ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (ae.intersect(r)) {
        ae.health -=r.diam;
        score-=r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        rocksPassed++;
      } else {
        r.display();
        r.move();
      }
    }


    //Boss Distributing
    if (bossTimer.isFinished()) {
      bosses.add(new Boss());
      bossTimer.start();
    }

    // Boss rendering and Collision
    for (int i = 0; i < bosses.size(); i++) {
      Boss b = bosses.get(i);
      if (b.intersect(ae)) {
        ae.health -=999999;
        bosses.remove(b);
      }
      if (b.reachedBottom()) {
        bosses.remove(b);
        gameOver();
      } else {
        b.display();
        b.move();
      }
    }

    for (int k = 0; k < bosses.size(); k++) {
      Boss b = bosses.get(k);
      for (int i = 0; i < lasers.size(); i++) {
        Laser l = lasers.get(i);
        if (l.bossIntersect(b)) {
          lasers.remove(l);
          b.diam-=2;
          if (b.diam<1) {
            bosses.remove(b);
            score+=2500;
          }
        }
      }
    }

    //Laser rendering and detect Rock and Boss collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          //Todo: add sound to collision
          //Todo: add animation to collision
          lasers.remove(l);
          r.diam-=50;
          if (r.diam<20) {
            rocks.remove(r);
            score+=100;
          }
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }

    //game over render
    if (ae.health<1 || rocksPassed>9) {
      gameOver();
    }

    //Render Spaceship
    ae.display();
    ae.move(mouseX, mouseY);
  }
}

void mousePressed() {
  blaster.stop();
  blaster.play();
  handleEvent();
}


void keyPressed() {
  if (key == ' ') {
    handleEvent();
  }
}

void handleEvent() {
  if (ae.fire() && ae.turretCount == 1) {
    lasers.add(new Laser(ae.x, ae.y));
    println("lasers: " + lasers.size());
  } else if (ae.fire() && ae.turretCount == 2) {
    lasers.add(new Laser(ae.x-10, ae.y));
    lasers.add(new Laser(ae.x+10, ae.y));
  } else if (ae.fire() && ae.turretCount == 3) {
    lasers.add(new Laser(ae.x-10, ae.y));
    lasers.add(new Laser(ae.x, ae.y));
    lasers.add(new Laser(ae.x+10, ae.y));
  } else if (ae.fire() && ae.turretCount == 4) {
    lasers.add(new Laser(ae.x-10, ae.y));
    lasers.add(new Laser(ae.x+20, ae.y));
    lasers.add(new Laser(ae.x+10, ae.y));
    lasers.add(new Laser(ae.x-20, ae.y));
  } else if (ae.fire() && ae.turretCount == 5) {
    lasers.add(new Laser(ae.x-10, ae.y));
    lasers.add(new Laser(ae.x, ae.y));
    lasers.add(new Laser(ae.x+10, ae.y));
    lasers.add(new Laser(ae.x+20, ae.y));
    lasers.add(new Laser(ae.x-20, ae.y));
  }
}


void infoPanel() {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(30);
  textAlign(LEFT);
  text("Score: "+score+" | Ammo: " + ae.ammo+" | Health: "+ae.health+"  |  Rocks Passed: " + rocksPassed, 20, 40);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Click or press any key to start...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(10);
  text("score: " + score, width/2, 550);
  noLoop();
}
