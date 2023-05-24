// Zack Wellborn | Oct 24 2022 | Cars App

Car ae1;
Car ae2;
Car[] cars = new Car[1000];

void setup() {
  size(displayWidth, displayHeight);
  ae1 = new Car();
  ae2 = new Car();
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car();
  }
}

void mousePressed() {
  for (int i = 0; i<1000; i++) {
    cars[i].xspeed = 102;
  }
}
void draw () {
  background(127);
  ae1.display();
  ae1.drive();
  ae2.display();
  ae2.drive();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
  if (mousePressed) {
    for (int i = 0; i<1000; i++) {
      cars[i].xspeed = 102; //l cope seethe
    }
  }
}
