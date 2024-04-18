class Enemy {
  float x, y;
  boolean toBeRemove = false;
  boolean isShooting = false;
  int lastFrame;
  int shootingTime = 0;
  
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    this.lastFrame = frameCount;
  }
  
  void display() {
    fill(150,150,150);
    ellipse(x, y, 50, 50);
  }
  
  void update() {
    if(frameCount % 300 == 0) isShooting = true;
    shootBullets();
    y += 1;
    checkBoundary();
  }
  
  void checkBoundary() {
    if (y < 0 || y > height || x < 0 || x >= width) toBeRemove = true;
  }
  
  void shootBullets() {
    if(isShooting) {
      int currentFrame = frameCount;
      if(currentFrame - lastFrame >= 20) {
        for (int i = 0; i < 6; i++) {
          EnemyBullet bullet = new EnemyBullet(x, y, i * 60);
          enemyBullets.add(bullet);
        }
        lastFrame = currentFrame;
        shootingTime++;
        if(shootingTime == 5) {
          isShooting = false;
          shootingTime = 0;
        }
      }
    }
  }
  
  boolean isHit(PlayerBullet bullet) {
    if(dist(x, y, bullet.x, bullet.y) <= 30) {
      toBeRemove = true;
      return true;
    }
    return false;
  }
}
