class Object {
  float x,y;
  boolean isLife;
  boolean isPower;
  boolean toBeRemove = false;
  PImage power;
  PImage lives;
  
  Object(float x, float y, boolean isLife, boolean isPower) {
    this.x = x;
    this.y = y;
    this.isLife = isLife;
    this.isPower = isPower;
    power = loadImage ("PrototypeImages/power.png");
    lives = loadImage ("PrototypeImages/lives.png");
  }
  
  void update() {
    y += 5;
    checkBoundary();
  }
  
  void display() {
    if(isLife) {
      //fill(100, 100, 100);
      //ellipse(x,y,20,20);
      imageMode(CENTER);
      image(lives, x, y, 25, 25);
    }
    if(isPower) {
      //fill(200, 200, 200);
      //ellipse(x,y,20,20);
      imageMode(CENTER);
      image(power, x, y, 25, 25);
    }
  }
  
  boolean isHit(Player player){
    if(dist(x, y, player.x, player.y) <= 25) {
      toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void checkBoundary() {
    if (y < 0 || y > height || x < 0 || x >= width) toBeRemove = true;
  }
}
