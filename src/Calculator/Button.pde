class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(127);
    c2 = color(180);
    on = false;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 8);
    fill(0);
    textAlign(CENTER);
    textSize(20);
    if (val == 'C') {
      text("Clear", x+30, y+35);
    } else if (val == 's') {
      text("x²", x+30, y+35);
    } else {
      text(val, x+30, y+35);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+60);
  }
}
