class EnemyBullet{
  float x, y,  angle, speed, rotationSpeed = 0.5;
  boolean toBeRemove = false;
  
  EnemyBullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = 5;
  }
  
  boolean hitPlayer(Player player) {
    if(dist(x, y, player.x, player.y) <= 30) {
      toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void update() {
    angle += rotationSpeed;  // Continuously increment angle to create a spiral
    x += speed * cos(radians(angle));
    y += speed * sin(radians(angle));
    checkBoundary();
  }
  
  void display() {
    fill(0, 100, 200);
    ellipse(x, y, 10, 10);
  }
  
  void checkBoundary() {
    if (y <= 0 || y >= height || x <= 0 || x >= width) toBeRemove = true;
  }
}