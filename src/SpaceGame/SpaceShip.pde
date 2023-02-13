class SpaceShip {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  //Constructor
  SpaceShip() {
    x = 0;
    y = 0;
    w = 90;
    ammo = 1000;
    turretCount = 1;
    health = 1000;
    ship = loadImage("ship.png");
  }

  void display() {
    image(ship, x, y);
    imageMode(CENTER);
    ship.resize(90, 90);
  }

  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<(rock.diam/1.2)) {
      return true;
    } else {
      return false;
    }
  }
}
