class Bullet {

  PVector position1 = new PVector(width/2,500);
  PVector direction;
  PVector velocity = new PVector(0,1);
  boolean out = false;
  
  void display(){
    if (out == false){
      position1.set(position.x + direction1.x, position.y+direction1.y);
      velocity.set(direction1);
      velocity.setMag(10);
    }else if(out == true){
      position1.add(velocity);
    }
  ellipse(position1.x, position1.y, 10, 10);
  if(position1.x<=0 || position1.x >= 600 || position1.y <=0 || position.y >= 600){
    out = false;
  }
  }
  
  float getx() {
    return position.x + direction1.x;
  }
  float gety() {
    return position.y+direction1.y;
  }
}

  
