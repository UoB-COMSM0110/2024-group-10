class EnemyThreeBoss extends EnemyThree {
  EnemyThreeBoss(float x, float y) {
    super();
    this.x = x;
    this.y = y;
  }
  
  void update() {
    float angle = atan2(player.y - y, player.x - x);
    shootingX = x + cos(angle) * 100;
    shootingY = y + sin(angle) * 100;
    if(frameCount % 60 == 0) shootBullets();
  }
}
