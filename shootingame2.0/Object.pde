class Object {
  float x,y;
  boolean isLife;
  boolean isPower;
  boolean toBeRemove = false;
  
  Object(float x, float y, boolean isLife, boolean isPower) {
    this.x = x;
    this.y = y;
    this.isLife = isLife;
    this.isPower = isPower;
  }
  
  void update() {
    y += 5;
    checkBoundary();
  }
  
  void display() {
    if(isLife) {
      fill(100, 100, 100);
      ellipse(x,y,20,20);
    }
    if(isPower) {
      fill(200, 200, 200);
      ellipse(x,y,20,20);
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
