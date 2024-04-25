class EnemyBullet {
  float x, y, angle, speed, rotationSpeed = 0.5;
  boolean toBeRemove = false;
  int alpha = 255; // 初始透明度
  boolean fading = false; // 用于控制淡入淡出

  EnemyBullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    adjustSpeed();
  }
  
  boolean hitPlayer(Player player) {
    if(dist(x, y, player.x, player.y) <= 30) {
      toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void update() {
    adjustSpeed(); 
    angle += rotationSpeed;
    x += speed * cos(radians(angle));
    y += speed * sin(radians(angle));
    checkBoundary();
    blink(); // 更新透明度
  }



  void display() {
    imageMode(CENTER);
    tint(255, alpha); // 应用透明度
    image(enemy1_bullet, x, y, 20, 20);
    noTint(); // 清除透明度设置
  }

  void checkBoundary() {
    if (y <= 0 || y >= height || x <= 0 || x >= width) toBeRemove = true;
  }
  
  void blink() {
    if (fading) { alpha -= 15; } ///减少透明度以实现淡出
    else {alpha += 15;}// 增加透明度以实现淡入


    // 透明度边界检查
    if (alpha <= 100) {
      alpha = 100;
      fading = false;
    } else if (alpha >= 255) {
      alpha = 255;
      fading = true;
    }
  }
  
    void adjustSpeed() {
      if (currentMode.equals("EASY")) {
      this.speed = 2;
      } else if (currentMode.equals("HARD")) {
      this.speed = 5;
    }
  }
  
}
