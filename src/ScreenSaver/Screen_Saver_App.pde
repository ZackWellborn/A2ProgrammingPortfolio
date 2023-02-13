// Zack Wellborn | Oct 10 2022 | ScreenSaverApp

float xpos;
float ypos;
float strokeW;
float pointCount;


void setup() {
  size(displayWidth, displayHeight);
  background(100);
  frameRate(300);
  xpos = width/2;
  ypos = height/2;
  fullScreen();
}

void draw() {
  strokeW = random(1, 10);
  pointCount = random(1, 40);
  stroke(random(255), 22, 22);
  strokeWeight(strokeW);
  //if (random(100)>75) {
  //  strokeWeight(strokeW);
  //  moveLeft(xpos, ypos, pointCount);
  //} else if (random(100)>67) {
  //  strokeWeight(strokeW);
  //  moveUp(xpos, ypos, pointCount);
  //} else if (random(100)>55) {
  //  strokeWeight(strokeW);
  //  moveDown(xpos, ypos, pointCount);
  //} else {
  //  strokeWeight(strokeW);
  //  moveRight(xpos, ypos, pointCount);
  //}
  if (xpos >width || xpos<0 || ypos > height || ypos<0) {
    xpos=random(width);
    ypos=(random(height));
  }
  int rand = int(random(4));
  if (rand== 3) {
    strokeWeight(strokeW);
    moveLeft(xpos, ypos, pointCount);
  } else if (rand == 2) {
    strokeWeight(strokeW);
    moveUp(xpos, ypos, pointCount);
  } else if (rand == 1) {
    strokeWeight(strokeW);
    moveDown(xpos, ypos, pointCount);
  } else {
    strokeWeight(strokeW);
    moveRight(xpos, ypos, pointCount);
  }
}




void mousePressed() {
  xpos = mouseX;
  ypos = mouseY;
}
void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX+i;
    ypos = startY;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX-i;
    ypos = startY;
  }
}
void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+1, startY-i);
    xpos = startX;
    ypos = startY-i;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY+i;
  }
}

//class Lines {
//  float xpos;
//  float ypos;
//  float strokeW;
//  float lineLength;

//  // constructor
//  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
//    xpos = tempX;
//    ypos = tempY;
//    strokeW = tempStroke;
//    lineLength = tempLength;
//  }
//  // display
//  void display() {
//    strokeW = random(1, 2);
//    lineLength = random(1, 50);
//    //stroke(random(100,255));
//    stroke(random(200), random(100), random(10));
//    if (xpos > width || xpos < 0 || ypos > height || ypos<0) {
//      xpos = random(width);
//      ypos = random(height);
//    } else {
//      if (random(100)>90) {
//        strokeWeight(strokeW);
//        moveLeft(xpos, ypos, lineLength);
//      } else if (random(100)>80) {
//        strokeWeight(strokeW);
//        moveUp(xpos, ypos, lineLength);
//      }
//    }
//  }
//}
