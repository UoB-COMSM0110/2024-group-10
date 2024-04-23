class Boss extends Enemy {
  int shotTime = 0;
  
  Boss(float x, float y) {
    super(x,y);
  }
  
  void update() {
    if(isStageTwo) {
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
    fill(200,200,200);
    rect(x,y,750,300);
  }
  
  boolean isHit(PlayerBullet bullet) {
    if(isStageTwo) {
      if(bullet.y <= 400) {
        shotTime++;
        if(shotTime > 20) {
          toBeRemove = true;
          state = GameState.FINISHED;
        }
        return true;
      }
      return false;
    }
    return false;
  }
  
}
