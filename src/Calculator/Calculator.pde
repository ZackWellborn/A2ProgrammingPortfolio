// Zack Wellborn | Oct 26 2022 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
boolean left = true;
float l, r, result;
char op = ' ';
boolean done = false;

void setup() {
  size(340, 620);
  numButtons[0] = new Button(20, 540, 60, 60, '0');
  numButtons[1] = new Button(20, 460, 60, 60, '1');
  numButtons[2] = new Button(100, 460, 60, 60, '2');
  numButtons[3] = new Button(180, 460, 60, 60, '3');
  numButtons[4] = new Button(20, 380, 60, 60, '4');
  numButtons[5] = new Button(100, 380, 60, 60, '5');
  numButtons[6] = new Button(180, 380, 60, 60, '6');
  numButtons[7] = new Button(20, 300, 60, 60, '7');
  numButtons[8] = new Button(100, 300, 60, 60, '8');
  numButtons[9] = new Button(180, 300, 60, 60, '9');

  opButtons[0] = new Button(180, 540, 140, 60, '=');
  opButtons[1] = new Button(100, 540, 60, 60, '.');
  opButtons[2] = new Button(20, 140, 140, 60, 'C');
  opButtons[3] = new Button(180, 140, 60, 60, 's');
  opButtons[4] = new Button(260, 140, 60, 60, '√');
  opButtons[5] = new Button(100, 220, 60, 60, '%');
  opButtons[6] = new Button(180, 220, 60, 60, '±');
  opButtons[7] = new Button(260, 220, 60, 60, 'x');
  opButtons[8] = new Button(260, 300, 60, 60, '÷');
  opButtons[9] = new Button(260, 380, 60, 60, '+');
  opButtons[10] = new Button(260, 460, 60, 60, '-');
  opButtons[11] = new Button(20, 220, 60, 60, 'π');
}

void draw () {
  background(50);
  for (int i =0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i =0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}


void keyPressed() {
  println("key: " + key);
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 106) {
    handleEvent("x", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 56 || keyCode == 106) {
    handleEvent(".", false);
  } else if (keyCode == 67 || keyCode == 110) {
    handleEvent("C", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 20) {
    if (dVal.equals("0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = "0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals("x")) {
    op = 'x';
    dVal = "0";
    left = false;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mouseReleased() {
  for (int i =0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i =0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("x", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = l*l;
        dVal = str(l);
      } else {
        r = r*r;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left) {
        l = l*0.01;
        dVal = str(l);
      } else {
        r = r*0.01;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    }
  }
  println("l: " + l + " r: " + r + " op: " + op + " result: " + result + " left: " + left);
}

void updateDisplay () {
  fill(180);
  rect(20, 20, 300, 80);
  fill(0);
  textSize(25);
  textAlign(RIGHT);
  if (dVal.length() < 6) {
    textSize(42);
  } else if (dVal.length() < 12) {
    textSize(34);
  } else if (dVal.length() < 16) {
    textSize(30);
  } else {
    textSize(26);
  }
  text(dVal, 300, 80);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l/r;
  }
  dVal = str(result);
  l = result;
  left = true;
  done = true;
}
