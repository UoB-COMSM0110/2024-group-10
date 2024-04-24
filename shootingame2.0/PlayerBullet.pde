class PlayerBullet{
  float x, y, speed, angle;
  boolean toBeRemove = false;
  
  PlayerBullet (float x, float y, float speed, float angle) {
    this.x = x;
    this.y = y;
    this.speed =speed;
    this.angle = angle;
  }
  
  void update() {
    x += speed * sin(radians(angle));
    y -= speed * cos(radians(angle));
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
