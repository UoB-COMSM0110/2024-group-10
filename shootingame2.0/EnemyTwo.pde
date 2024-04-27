class EnemyTwo extends Enemy {
  boolean left;
  float angle = 0;
  float circleRadius = 500;
  float shootingAngle;
  PImage enemy2;
  
  EnemyTwo(boolean left, float shootingAngle) {
    super(0, 0);  
    this.left = left;
    this.shootingAngle = shootingAngle;
    enemy2 = loadImage("PrototypeImages/enemies/enemy2.png");
  }
  
  void display() {
   imageMode(CENTER); 
   image(enemy2, x, y, 50, 50);
  }
  
  //备注：在 EASY 模式 下，EnemyTwo 类的敌人每 8.33 秒开始新一轮射击，每轮射击中发射 3 颗子弹，每颗子弹之间的间隔为 0.67 秒;在 HARD 模式 下，EnemyTwo 类的敌人每 5 秒开始新一轮射击，每轮射击中发射 6 颗子弹，每颗子弹之间的间隔为 0.08 秒。
  @Override
  void update() {
    int shootTriggerInterval = (currentMode.equals("EASY")) ? 500 : 300; // 组间间隔：EASY mode500帧，Hard mode300帧
    if (frameCount % shootTriggerInterval == 0) {
        isShooting = true;  // 开始新一轮射击
    }
    if (isShooting) {
        shootBullets();
    }
    if(left) x = circleRadius * sin(radians(angle));
    else x = width -1 - circleRadius * sin(radians(angle));
    y = circleRadius * cos(radians(angle));
    checkBoundary();
    angle += 0.1;
  }
  

  @Override
  void shootBullets() {
    if(isShooting) {
      int currentFrame = frameCount;
      int maxShootingTimes = currentMode.equals("EASY") ? 3 : 6; 
      int shootInterval = (currentMode.equals("EASY")) ? 40 : 5; // 组内间隔：EASY mode40帧，Hard mode5帧
      if (currentFrame - lastFrame >= shootInterval) { 
        EnemyBulletTwo bullet = new EnemyBulletTwo(x, y, shootingAngle, left);
        enemyBullets.add(bullet);
        lastFrame = currentFrame;
        shootingTime++;
        if(shootingTime == maxShootingTimes) {
          isShooting = false;
          shootingTime = 0;
        }
      }
    }
  }
}
