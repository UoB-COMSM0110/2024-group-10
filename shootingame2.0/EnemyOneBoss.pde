class EnemyOneBoss extends Enemy {
  int shotTime = 0;
  PImage boss_enemy;
  
  EnemyOneBoss(float x, float y) {
    super(x, y);
    boss_enemy = loadImage("PrototypeImages/boss_enemy1.png");
  }
  
  void update() {
    if(frameCount % 300 == 0) isShooting = true;
    if (shotTime > 10) toBeRemove = true;
    shootBullets();
  }
  
    boolean isHit(PlayerBullet bullet) {
    if(dist(x, y, bullet.x, bullet.y) <= 30) {
      shotTime++;
      if (shotTime > 10) toBeRemove = true;
      return true;
    }
    return false;
  }
  
  void increaseShotTime() {shotTime += 3;}
  void display(){
   imageMode(CENTER); 
   image(boss_enemy, x, y, 82, 95);
  }
}
