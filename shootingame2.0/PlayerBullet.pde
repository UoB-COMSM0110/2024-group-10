class PlayerBullet{
  float x, y, speed;
  boolean toBeRemove = false;
  
  PlayerBullet (float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed =speed;
  }
  
  void update() {
    y -= speed;
    checkBoundary();
  }
  
  void display() {
    fill(200, 150, 50);
    ellipse(x, y, 10, 10);
  }
  
  void checkBoundary() {
    if (y <= 0 || y >= height || x <= 0 || x >= width) toBeRemove = true;
  }
}
