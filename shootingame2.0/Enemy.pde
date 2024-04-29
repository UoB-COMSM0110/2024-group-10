class Enemy {
  float x, y;
  boolean toBeRemove = false;
  boolean isShooting = false;
  boolean isStageTwo = false;
  boolean isPlayer2 = false;
  int lastFrame;
  int shootingTime = 0;
  PImage enemy1;
  
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    this.lastFrame = frameCount;
    this.isPlayer2 = is2Player;
    enemy1 = loadImage("PrototypeImages/enemies/enemy1.png");
  }
  
  void display() {
   imageMode(CENTER); 
   image(enemy1, x, y, 50, 50);
  }
  
  //备注：EASY 模式下，敌人将每 6.67 秒开始新一轮射击，每轮射击包括 3 颗子弹，每颗子弹间的发射间隔为 0.67 秒；Hard 模式下，敌人将每 5 秒开始新一轮射击，每轮射击包括 6 颗子弹，每颗子弹间的发射间隔为 0.33 秒。
  void update() {
    // 根据难度设置触发射击的帧数间隔
    int shootTriggerInterval = (currentMode.equals("EASY")) ? 400 : 300; // EASY mode间隔更长一些，例如400帧，Hard mode间隔300帧
    // 每隔一定帧数检查是否触发射击
    if (frameCount % shootTriggerInterval == 0) {
        isShooting = true;  // 开始新一轮射击
    }
    // 如果正在射击，调用射击方法
    if (isShooting) {
        shootBullets();
    }
    y += 1;  // 敌人位置更新
    checkBoundary();  // 检查边界
}

  
  
  void checkBoundary() {
    if (y < 0 || y > height || x < 0 || x >= width) toBeRemove = true;
  }
  
  
  void shootBullets() {
    int currentFrame = frameCount;  // 获取当前帧数
    int shootInterval = (currentMode.equals("EASY")) ? 40 : 20; // EASY mode射击间隔40帧，Hard mode射击间隔20帧
    if (currentFrame - lastFrame >= shootInterval) {
        int numBullets = (currentMode.equals("EASY")) ? 3 : 6;  // EASY mode发射3颗子弹，Hard mode发射6颗
        for (int i = 0; i < numBullets; i++) {
            EnemyBullet bullet = new EnemyBullet(x, y, i * (360 / numBullets)); // 确保子弹均匀分布
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

  
  boolean isHit(PlayerBullet bullet) {
    float chance = random(0,1);
    Object object;
    if(dist(x, y, bullet.x, bullet.y) <= 30) {
      toBeRemove = true;
      if(chance < 0.1) {
        object = new Object(x, y, true, false);
        objects.add(object);
      }
      if(chance > 0.9){
        object = new Object(x, y, false, true);
        objects.add(object);
      }
      return true;
    }
    return false;
  }
  
  boolean hitPlayer(Player player) {
    if(dist(x, y, player.x, player.y) <= 50) {
      toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void increaseShotTime() {}
}
