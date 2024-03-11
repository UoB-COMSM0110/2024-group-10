class Target {
  float x, y;
  float speed = 2;
  float angle;
  boolean isExploding = false;
  int explosionStartTime; 
  int explosionDuration = 250; 
  boolean shouldBeRemoved = false;
  PImage enemy1;
  PImage enemy2;
  PImage enemy1_damaged;
  PImage enemy2_damaged;
  
  
  Target(float x, float y) {
    this.x = x;
    this.y = y;
    this.angle = random(0, TWO_PI);
    enemy1 = loadImage("PrototypeImages/enemy1.png");
    enemy1.resize(42,35 );
    enemy2 = loadImage("PrototypeImages/enemy2.png");
    enemy2.resize(162,111 );
    enemy1_damaged = loadImage("PrototypeImages/enemy1_damaged.png");
    enemy1_damaged.resize(45,47 );
    enemy2_damaged = loadImage("PrototypeImages/enemy2_damaged.png");
    enemy2_damaged.resize(154,151 );
  }
  
  void update() {
   if (isExploding) {
        if (millis() - explosionStartTime >= explosionDuration) {
            shouldBeRemoved = true; 
            isExploding = false;  
        }
    } else {
    y += cos(angle) * speed;
    x += sin(angle) * speed;
    
    // Shoot bullet
    if (frameCount % 60 == 0) {
      targetBullets.add(new Bullet(x, y, false));
    }
  }
  }
  
    void getHit() {
    isExploding = true;
    explosionStartTime = millis();
  }
  
  void display() {
    if (shouldBeRemoved) return;
    if (isExploding) {
        if (millis() - explosionStartTime < explosionDuration) {
            image(enemy1_damaged, x, y, 47, 45); 
        }
    } else {
          image(enemy1, x, y);
    }
}
  
  boolean offscreen() {
    return y < 0 || x < 0 || y > height || x > width;
  }
}

class TargetTwo extends Target {
  int hitTimes;
  
  TargetTwo (float x, float y) {
    super(x, y);
    this.hitTimes = 0;
  }
  void update() {
    x += speed;
    
    // Shoot Laser
    if (frameCount % 60 == 0 && !isExploding) {
      lasers.add(new Laser(x, y, false));
    }
  }
   void display() {
     if (shouldBeRemoved) return;
    if (isExploding) {
        if (millis() - explosionStartTime < explosionDuration) {
            image(enemy2_damaged, x, y, 154, 151); 
        }
    } else {
          image(enemy2, x, y);
    }
}
}
