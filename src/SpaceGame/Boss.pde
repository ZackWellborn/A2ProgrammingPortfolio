class Boss {
  int x, y, diam, speed;
  PImage rock;



  //Constructor
  Boss() {
    x = width/2;
    y = -50;
    diam = 200;
    speed = 1;
    rock = loadImage("rock.png");
  }

  void display() {
    rock.resize(diam, diam);
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<(ship.w/1.2)) {
      return true;
    } else {
      return false;
    }
  }
}
