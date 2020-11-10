PVector position;
PVector direction1;
PVector direction2;
PVector direction3;
PVector v;
PVector a;
float mag = 30;
Bullet bullet;
int count = 3;
Block[]blocks;
float blockWidth = random (10, 60);
float blockHeight = random (10, 60);

void setup(){
  size(600,600);
  position = new PVector(width/2,500);
  direction1 = new PVector(0, -1);
  direction2 = new PVector(-0.5, .5);
  direction3 = new PVector(0.5, .5);
  v = new PVector(0,0);
  a = new PVector(0,-1);
  a.setMag(.3);
  bullet = new Bullet();
  blocks = new Block[count];
  for (int i = 0; i < count; i = i+1) {
    blocks[i] = new Block(random(0, width), 0, random(1, 3), color(#19E056));
  }
}

void draw(){
  background(255,255,255);
  stroke(0);
  strokeWeight(5);
  direction1.setMag(mag);
  direction2.setMag(mag);
  direction3.setMag(mag);
  position.add(v);
  triangle(position.x + direction1.x, position.y + direction1.y, position.x + direction2.x, position.y + direction2.y, position.x + direction3.x, position.y + direction3.y);
  if(position.x<0){
    position.x = width;
  }else if(position.x > width){
    position.x = 0;
  }else if(position.y > height){
    position.y = 0;
  }else if(position.y < 0){
    position.y = height;
  }
  bullet.display();
  
  for (int j = 0; j<count; j = j +1) {
    blocks[j].drive();
    blocks[j].display();
  }
  
  for (int k = 0; k<count; k ++) {
    if(bullet.getx() <= blocks[k].getx() + blockWidth && bullet.getx() >= blocks[k].getx() && bullet.gety()<= blocks[k].gety() + blockHeight){
      blocks[k].xpos = -999;
      blocks[k].ypos = -999;
    }
  }
}

void keyPressed(){
  if(keyCode == LEFT){
    direction1.rotate(-.1);
    direction2.rotate(-.1);
    direction3.rotate(-.1);
    a.rotate(-.1);
  }
  else if(keyCode == RIGHT){
    direction1.rotate(.1);
    direction2.rotate(.1);
    direction3.rotate(.1);
    a.rotate(.1);
  }
  else if(keyCode == UP){
    v.add(a);
  }
  else if(keyCode == DOWN){
    v.sub(a);
  }
  else if(keyCode == ENTER){
    v.set(0,0);
  }
  if(key == ' '){
    bullet.out = true;
  }
}
