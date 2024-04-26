class Boss extends Enemy {
  int shotTime = 0;
  PImage boss;
  PImage boss_damage1;
  PImage boss_damage2;
  
  Boss(float x, float y) {
    super(x,y);
    boss = loadImage("PrototypeImages/boss.png");
    boss_damage1 = loadImage("PrototypeImages/boss1.png");
    boss_damage2 = loadImage("PrototypeImages/boss2.png");
  }
  
  void update() {
    if(isStageTwo) {
      if(shotTime > 20) {
          toBeRemove = true;
          state = GameState.VICTORY;
        }
      if(frameCount % 300 == 0) shootBullets();
    }
  }
  
  void shootBullets() {
    for(int i = 0; i < 50; i++) {
      BossBullet bullet = new BossBullet(random(200, 800), 300, random(-45, 45));
      enemyBullets.add(bullet);
    }
  }
  
  void display() {
    //fill(200,200,200);
    //rect(x,y,750,300);
    imageMode(CENTER);
    if(isStageTwo) {
      image(boss_damage2, x, y+30, 850, 450);
    }
    else{
    image (boss, x, y+30, 850, 450);
    }
  }
  
  boolean isHit(PlayerBullet bullet) {
    if(isStageTwo) {
      if(bullet.y <= 400) {
        shotTime++;
        if(shotTime > 20) {
          toBeRemove = true;
          state = GameState.VICTORY;
        }
        return true;
      }
      return false;
    }
    return false;
  }
  
  void increaseShotTime() {shotTime += 3;}
}
