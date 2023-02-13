class Laser {
  int x, y, w, h, speed;



  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 2;
    h = 20;
    speed = 14;
  }

  void display() {
    rectMode(CENTER);
    fill(255, 0, 0);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
  boolean bossIntersect(Boss boss) {
    float d = dist(x, y, boss.x, boss.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
