class Player {
  float x, y;
  float speed = 5;
  boolean hit = false;
  int lives = 3;
  //render player
  PImage imgNormal;
  PImage imgHit;
  boolean isInvincible = false; // 新增：标记玩家是否无敌
  int invincibleDuration = 2000; // 新增：无敌持续时间，单位毫秒
  int hitTime = -2000; // 记录被击中的时间，初始化为一个足够小的值
  int score = 0;
  int invincibleStartTime = -2000; // 新增：无敌开始的时间
  long lastShootTime = 0; 
  int shootInterval = 50; 
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
    imgNormal = loadImage("PrototypeImages/me.png");
    imgHit = loadImage("PrototypeImages/me_hit.png");
  }
  
    void update() {
      if (this == player) {
        if (p1movingLeft) this.x -= this.speed;
        if (p1movingRight) this.x += this.speed;
        if (p1movingUp) this.y -= this.speed;
        if (p1movingDown) this.y += this.speed;
      } else if (this == player2) {
        if (p2movingLeft) this.x -= this.speed;
        if (p2movingRight) this.x += this.speed;
        if (p2movingUp) this.y -= this.speed;
        if (p2movingDown) this.y += this.speed;
      }
      

     this.x = constrain(this.x, 0, width);
     this.y = constrain(this.y, 0, height);


    if (isInvincible && millis() - invincibleStartTime > invincibleDuration) {
      isInvincible = false; // 无敌时间结束
    }
  }
  
    void display() {
      if (lives > 0) {
        imageMode(CENTER);
         if(millis() - hitTime <= 500) {
           image(imgHit, x, y);
         }else {
           image(imgNormal, x, y);
         }
       }
    }
       // 新增一个方法来处理被击中的状态
   void gotHit() {
    if (!isInvincible) {
      hit = true; // 标记为被击中
      isInvincible = true; // 设置玩家为无敌状态
      invincibleStartTime = millis(); // 记录无敌开始时间
      hitTime = millis(); // 更新被击中的时间戳
    }
     
    }
     
}
