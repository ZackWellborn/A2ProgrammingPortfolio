class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean bruh;

  //Constructor
  Car() {
    c = color(random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(height);
    xspeed = 0.02*xpos;
    if(random(2)>1){
      bruh = true;
    }
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-6, ypos+7, 6, 3);
    rect(xpos-6, ypos-7, 6, 3);
    rect(xpos+6, ypos+7, 6, 3);
    rect(xpos+6, ypos-7, 6, 3);
    fill(255);
    rect(xpos+7, ypos, 3, 8);
    fill(50);
    rect(xpos-4, ypos, 5, 5);
  }

  void drive() {
    if (bruh){
      xspeed = 0.02*xpos;
    } else {
      xspeed = -0.02*(width-xpos);
    }
    c = color(0, random(xpos), random(xpos));
    xpos += xspeed;
    if (xpos>width+1) {
      xpos = 1;
    } else if (xpos<-1) {
      xpos=width-1;
    }
  }
}
