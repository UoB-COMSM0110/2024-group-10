class EnemyOneBoss extends Enemy {
  EnemyOneBoss(float x, float y) {
    super(x, y);
  }
  
  void update() {
    if(frameCount % 300 == 0) isShooting = true;
    shootBullets();
  }
}
