class Block {
  float xpos;
  float ypos;
  float speed;
  color cl;
  float blockWidth = random (10, 60);
  float blockHeight = random (10, 60);

  Block(float tempXpos, float tempYpos, float tempSpeed, color tempcl) {
    xpos = tempXpos;
    ypos = tempYpos;
    speed = tempSpeed;
    cl = tempcl;
  }

  void display() {
    fill(cl);
    rect(xpos, ypos, blockWidth, blockHeight);
  }

  void drive() {
    ypos = ypos + speed;
    if (ypos > height + blockHeight) {
      ypos = -blockHeight;
    }
  }

  float getx() {
    return xpos;
  }
  float gety() {
    return ypos;
  }

  void setx(float tempx) {
    xpos = tempx;
  }
  void sety(float tempy) {
    ypos = tempy;
  }
}
