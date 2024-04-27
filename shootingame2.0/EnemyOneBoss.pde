class EnemyOneBoss extends Enemy {
  int shotTime = 0;
  PImage boss_enemy;
  
  EnemyOneBoss(float x, float y) {
    super(x, y);
    boss_enemy = loadImage("PrototypeImages/boss_enemy1.png");
  }
  
  void update() {
    if(frameCount % 300 == 0) isShooting = true;
    if (shotTime > 30) toBeRemove = true;
    shootBullets();
  }
  
    boolean isHit(PlayerBullet bullet) {
    if(dist(x, y, bullet.x, bullet.y) <= 30) {
      shotTime++;
      if (shotTime > 30) toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void increaseShotTime() {shotTime += 3;}
  void display(){
   imageMode(CENTER); 
   image(boss_enemy, x, y, 82, 95);
  }
  
  @Override
    void shootBullets() {
    int currentFrame = frameCount;  // 获取当前帧数
    int shootInterval = (currentMode.equals("EASY")) ? 120 : 100; // EASY mode射击间隔40帧，Hard mode射击间隔20帧
    if (currentFrame - lastFrame >= shootInterval) {
        int numBullets = (currentMode.equals("EASY")) ? 3 : 4;  // EASY mode发射4颗子弹，Hard mode发射6颗
        float startAngle = (currentMode.equals("EASY")) ? 340 : 350 ; // 下半圈开始的角度
        float angleIncrement = 90 / numBullets;  // 每颗子弹的角度增量
        for (int i = 0; i < numBullets; i++) {
            float angle = startAngle + i * angleIncrement;
            EnemyOneBossBullet bullet = new EnemyOneBossBullet(x, y, angle); // 确保子弹均匀分布
            enemyBullets.add(bullet);
        }
        lastFrame = currentFrame; // 更新上次射击时间，使用currentFrame保持一致性
        shootingTime++;
        if (shootingTime == 5) {
            isShooting = false;  // 结束当前轮射击
            shootingTime = 0;    // 重置射击计数
        }
    }
  }
}
