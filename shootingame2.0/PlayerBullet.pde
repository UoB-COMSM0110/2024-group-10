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
    imageMode(CENTER); 
    image(me_bullet, x, y, 30, 30);
  }
  
  void checkBoundary() {
    if (y <= 0 || y >= height || x <= 0 || x >= width) toBeRemove = true;
  }
}
