class EnemyBulletThree extends EnemyBullet {
  float targetX, targetY, angle;
  
  EnemyBulletThree(float x, float y) {
    super(x, y, 0);
    targetX = player.x;
    targetY = player.y;
    angle = atan2(targetY - y, targetX - x);
  }
  
  void update(){
    x += cos(angle) * 10;
    y += sin(angle) * 10;
  }
  
  
}
