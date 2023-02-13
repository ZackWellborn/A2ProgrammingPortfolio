class PowerUp {
  int x, y, diam, speed, random;
  char type;


  //Constructor
  PowerUp() {
    x = int(random(width));
    y = -50;
    diam = 40;
    speed = int(random(2, 6));
    random = int(random(3));
    if (random==0) {
      type = 'h';
    } else if (random==1) {
      type = 'a';
    } else if (random==2) {
      type = 't';
    }
  }

  void display() {
    ellipse(x, y, diam, diam);
    fill(0);
    textAlign(CENTER);
    text(type, x, y);
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
