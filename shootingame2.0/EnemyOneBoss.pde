class EnemyOneBoss extends Enemy {
  int shotTime = 0;
  
  EnemyOneBoss(float x, float y) {
    super(x, y);
  }
  
  void update() {
    if(frameCount % 300 == 0) isShooting = true;
    if (shotTime > 10) toBeRemove = true;
    shootBullets();
  }
  
    boolean isHit(PlayerBullet bullet) {
    if(dist(x, y, bullet.x, bullet.y) <= 30) {
      if (shotTime > 10) toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void increaseShotTime() {shotTime += 3;}
}