class EnemyFour extends Enemy {
  boolean left;
  boolean isShooting = false;
  int shootingCount = 0;
  float startX, startY;
  ArrayList<EnemyBulletFour> bulletsToBeCollected = new ArrayList<EnemyBulletFour>();
  PImage enemy4;
  
  
  EnemyFour(float x, float y, boolean left) {
    super(x, y);
    this.left =left;
    this.startX = x;
    this.startY = y;
    enemy4 = loadImage("PrototypeImages/enemies/enemy4.png");
  }
  
  void update() {
    float distance = abs(x - startX);
    if(distance % 150 == 0) isShooting = true;
    if(isShooting) {
      shootBullet();
      shootingCount += 5;
    }
    if(shootingCount > 800) {
      isShooting = false;
      shootingCount = 0;
      for(EnemyBulletFour bullet : bulletsToBeCollected) {
        bullet.toBeRemove = true;
      }
      if(left) x -= 1;
      else x += 1;
    }
    if(!isShooting) {
      if(left) x -= 1;
      else x += 1;
    }
  }
  
  void shootBullet() {
    EnemyBulletFour bullet = new EnemyBulletFour(x, y + 25 + shootingCount);
    enemyBullets.add(bullet);
    bulletsToBeCollected.add(bullet);
  }
  
  boolean isHit(PlayerBullet bullet) {
    if(dist(x, y, bullet.x, bullet.y) <= 30) {
      toBeRemove = true;
      if(random(0,1) > 0.5) {
        Object object = new Object(x, y, true, false);
        objects.add(object);
      }
      else{
        Object object = new Object(x, y, false, true);
        objects.add(object);
      }
      for(EnemyBulletFour bulletToBeRemove : bulletsToBeCollected) {
        bulletToBeRemove.toBeRemove = true;
      }
      return true;
    }
    return false;
  }
  
  void display() {
   imageMode(CENTER); 
   image(enemy4, x, y, 50, 50);
  }
}
