class Target {
  float x, y;
  float speed = 2;
  float angle;
  
  Target(float x, float y) {
    this.x = x;
    this.y = y;
    this.angle = random(0, TWO_PI);
  }
  
  void update() {
    y += cos(angle) * speed;
    x += sin(angle) * speed;
    
    // Shoot bullet
    if (frameCount % 60 == 0) {
      targetBullets.add(new Bullet(x, y, false));
    }
  }
  
  void display() {
    fill(0, 0, 255);
    ellipse(x, y, 30, 30);
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
    if (frameCount % 60 == 0) {
      lasers.add(new Laser(x, y, false));
    }
  }
  void display() {
    fill(200, 200, 200);
    ellipse(x, y, 100, 100);
  }
}
