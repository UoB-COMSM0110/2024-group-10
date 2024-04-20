class Player {
  float x = 350;
  float y = 900;
  float bulletSpeed = 10;
  int lastFrame = frameCount;
  int currentFrame;
  int shootingGap = 30;
  boolean movingLeft = false;
  boolean movingRight = false;
  boolean movingUp = false;
  boolean movingDown = false;
  boolean isShooting = false;
  boolean isFirstBullet = true;
  boolean isMissileReady = false;
  boolean shootingMissle = false;
  int energyBarLength = 0;
  String name ="";
  int playerNumber;
  int energy = 0;
  int lives = 3;
  int score = 0;  
  PImage me;
  PImage[] energyImages = new PImage[11];
  
  Player (int playerNumber){
    this.playerNumber = playerNumber;
    me = loadImage("PrototypeImages/me.png");
    for (int i = 0; i <= 10; i++) {
        energyImages[i] = loadImage("PrototypeImages/energybar/" +(i * 10) + ".png");
    }
  }
   
  void display() {
    imageMode(CENTER); 
    image(me, x, y, 50, 50);
    imageMode(CORNER); 
    displayLives(); 
    displayScore();
    int energyIndex = energy / 10;  
    if (energyIndex > 10) energyIndex = 10;  
    image(energyImages[energyIndex], 20, height - 18 -20, 150, 18);
  }
  
  void displayLives() {
    fill(255, 0, 0); // 设置文本颜色为红色
    textSize(20); // 设置文本大小
    text("Lives: " + lives, 50, 30); // 在屏幕左上角显示生命值
  }

  void displayScore() {
    fill(255); // 白色字体
    textSize(20);
    text("Score: " + score, 50, 60); // 在屏幕右上角显示得分
}

  void update(){
    isMissileReady = (energy >= 100);
    
    //Shoot Bullet
    if(isShooting) {
      if(isFirstBullet) {
        //shoot the first bullet first
        shootBullet();
        //Log the currentFrame
        lastFrame = frameCount;
        isFirstBullet = false;
      }
      int currentFrame = frameCount;
      if(currentFrame - lastFrame >= 30) {
        shootBullet();
        lastFrame = currentFrame;
      }
    }
    
    // Update position based on key flags
    if (movingUp) y -= 5;
    if (movingDown) y += 5;
    if (movingLeft) x -= 5;
    if (movingRight) x += 5;
    
    //Shooting Missle
    if (shootingMissle) shootMissle();
  
    // Prevent the square from moving out of bounds
    x = constrain(x, 25, width - 25 );
    y = constrain(y, 25, height - 25 );
  }
  
  void shootMissle() {
    if(!isMissileReady) return;
    Missle missle = new Missle (x, y - 25, 10);
    playerBullets.add(missle);
    energy = 0;
    isMissileReady = false;
  }
  
  void shootBullet() {
    PlayerBullet bullet = new PlayerBullet(x , y - 25 , bulletSpeed);
    playerBullets.add(bullet);
  }
  
  float getSpeed() {
    return bulletSpeed;
  }
  
  void keyPressed() {
    if (key == ESC) {key = 0; state = GameState.PAUSE;};
    if (keyCode == LEFT) movingLeft = true;
    if (keyCode == RIGHT) movingRight = true;
    if (keyCode == UP) movingUp = true;
    if (keyCode == DOWN) movingDown = true;
    if (key == 'M' || key == 'm') shootingMissle = true;
    if (key == ' ') isShooting = true;
  }
  
  void keyReleased() {
    if (keyCode == LEFT) movingLeft = false;
    if (keyCode == RIGHT) movingRight = false;
    if (keyCode == UP) movingUp = false;
    if (keyCode == DOWN) movingDown = false;
    if (key == 'M' || key == 'm') shootingMissle = false;
    if (key == ' ') {
      isShooting = false;
      isFirstBullet = true;
    }
  }
  
    void alterName(){
      if (key == BACKSPACE && name.length() > 0){
        name = name.substring(0, name.length()-1);
      }
      else if (Character.isLetterOrDigit(key)){
        name = name.concat(String.valueOf(key));
      }
    }

  void reset() {
    // 重置玩家的位置
    x = 350;  // 初始X位置
    y = 900;  // 初始Y位置

    // 重置玩家的能量和得分
    energy = 100;  // 假设起始能量为100
    lives = 3;
    score = 0;     // 分数重置为0

    // 重置移动和射击相关的状态
    movingLeft = false;
    movingRight = false;
    movingUp = false;
    movingDown = false;
    isShooting = false;
    isFirstBullet = true;
    isMissileReady = false;
    shootingMissle = false;

    // 重置能量条长度（如果有需要）
    energyBarLength = 0;  // 假设的能量条长度属性

    // 可能还需要重置其他游戏相关的状态
  }

}


