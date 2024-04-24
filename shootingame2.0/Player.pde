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
  int shootingLevel = 0;
  PImage me;
  PImage[] energyImages = new PImage[11];

  boolean isPlayer2=false;

  boolean isDied=false;

  Player (int playerNumber) {
    this.playerNumber = playerNumber;
    me = loadImage("PrototypeImages/me.png");
    for (int i = 0; i <= 10; i++) {
      energyImages[i] = loadImage("PrototypeImages/energybar/" +(i * 10) + ".png");
    }
  }

  void display() {

    if (isDied) {
      return;
    }
    imageMode(CENTER);
    image(me, x, y, 50, 50);
    imageMode(CORNER);
    displayLives();
    displayScore();

    if (isPlayer2) {

      int energyIndex = energy / 10;
      if (energyIndex > 10) energyIndex = 10;
      image(energyImages[energyIndex], width-150-20, height - 18 -20, 150, 18);
    } else {
      int energyIndex = energy / 10;
      if (energyIndex > 10) energyIndex = 10;
      image(energyImages[energyIndex], 20, height - 18 -20, 150, 18);
    }
  }

  void displayLives() {


    if (isPlayer2) {
      fill(255, 0, 0); // 设置文本颜色为红色
      textSize(20); // 设置文本大小
      text("Lives: " + lives, width-100, 30); // 在屏幕左上角显示生命值
    } else {
      fill(255, 0, 0); // 设置文本颜色为红色
      textSize(20); // 设置文本大小
      text("Lives: " + lives, 50, 30); // 在屏幕左上角显示生命值
    }
  }

  void displayScore() {


    if (isPlayer2) {
      fill(255); // 白色字体
      textSize(20);
      text("Score: " + score, width-100, 60); // 在屏幕右上角显示得分
    } else {
      fill(255); // 白色字体
      textSize(20);
      text("Score: " + score, 50, 60); // 在屏幕右上角显示得分
    }
  }

  void update() {
    if (isDied) {
      lives =0;
    }
    isMissileReady = (energy >= 100);

    //Shoot Bullet
    if (isShooting) {
      if (isFirstBullet) {
        //shoot the first bullet first
        shootBullet();
        //Log the currentFrame
        lastFrame = frameCount;
        isFirstBullet = false;
      }
      int currentFrame = frameCount;
      if (currentFrame - lastFrame >= 30) {
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



    if (!isMissileReady) return;
    Missle missle = new Missle (x, y - 25, 10);
    playerBullets2.add(missle);
    energy = 0;
    isMissileReady = false;
  }

  void shootBullet() {
    if(shootingLevel == 0) {
      if (isPlayer2) {
        PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed, 0);
        playerBullets2.add(bullet);
      } else {
        PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed, 0);
        playerBullets.add(bullet);
      }
    }
    if(shootingLevel == 1) {
      if (isPlayer2) {
        PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed * 2, 0);
        playerBullets2.add(bullet);
      } else {
        PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed * 2, 0);
        playerBullets.add(bullet);
      }
    }
    if(shootingLevel == 2) {
      if (isPlayer2) {
        for(int i = -1; i < 2; i++) {
          PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed * 2, 30 * i);
          playerBullets2.add(bullet);
        }
      } else {
        for(int i = -1; i < 2; i++) {
          PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed * 2, 30 * i);
          playerBullets.add(bullet);
        }
      }
    }
    if(shootingLevel >= 3) {
      if (isPlayer2) {
        for(int i = -2; i < 3; i++) {
          PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed * 2, 20 * i);
          playerBullets2.add(bullet);
        }
      } else {
        for(int i = -2; i < 3; i++) {
          PlayerBullet bullet = new PlayerBullet(x, y - 25, bulletSpeed * 2, 20 * i);
          playerBullets.add(bullet);
        }
      }
    }
  }

  float getSpeed() {
    return bulletSpeed;
  }

  void keyPressed() {
  }

  void keyReleased() {
  }

  void alterName() {
    if (key == BACKSPACE && name.length() > 0) {
      name = name.substring(0, name.length()-1);
    } else if (Character.isLetterOrDigit(key)) {
      name = name.concat(String.valueOf(key));
    }
  }

  void reset() {
    isDied =false;
    if (isPlayer2) {
      x = 700;  // 初始X位置
    } else {
      // 重置玩家的位置
      x = 350;  // 初始X位置
    }

    y = 900;  // 初始Y位置

    // 重置玩家的能量和得分
    energy = 0;  // 假设起始能量为100
    if (isPlayer2) {
      lives = 30;
    } else {
      lives = 5;
    }

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
  
  void hitObject(Object object) {
    if(object.isPower == true) {
      increaseShootingLevel();
    }
  }
  
  void increaseShootingLevel() {
    if(shootingLevel < 3) shootingLevel++;
  }
}
