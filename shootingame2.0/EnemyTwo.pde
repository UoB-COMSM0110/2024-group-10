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
  
  void update() {
    if(frameCount % 300 == 0) isShooting = true;
    shootBullets();
    if(left) x = circleRadius * sin(radians(angle));
    else x = width -1 - circleRadius * sin(radians(angle));
    y = circleRadius * cos(radians(angle));
    checkBoundary();
    angle += 0.1;
  }
  
  void shootBullets() {
    if(isShooting) {
      int currentFrame = frameCount;
      if(currentFrame - lastFrame >= 20) {
        EnemyBulletTwo bullet = new EnemyBulletTwo(x, y, shootingAngle, left);
        enemyBullets.add(bullet);
        lastFrame = currentFrame;
        shootingTime++;
        if(shootingTime == 5) {
          isShooting = false;
          shootingTime = 0;
        }
      }
    }
  }
}
