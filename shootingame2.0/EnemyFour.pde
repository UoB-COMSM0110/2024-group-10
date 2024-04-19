class EnemyFour extends Enemy {
  boolean left;
  boolean isShooting = false;
  int shootingCount = 0;
  float startX, startY;
  ArrayList<EnemyBulletFour> bulletsToBeCollected = new ArrayList<EnemyBulletFour>();
  
  EnemyFour(float x, float y, boolean left) {
    super(x, y);
    this.left =left;
    this.startX = x;
    this.startY = y;
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
      System.out.println(bulletsToBeCollected.size());
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
