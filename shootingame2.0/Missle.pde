class Missle extends PlayerBullet {
  int startFrame;
  PImage missle;
  
  Missle(float x, float y, float speed) {
    super(x, y, speed, 0);
    startFrame = frameCount;
    missle = loadImage("PrototypeImages/missle.png");
  }
  
  void update() {
    y -= speed;
    int currentFrame = frameCount;
    if(currentFrame - startFrame >= 45) explode(); 
  }
  
  void explode() {
    toBeRemove =true;
    if(state == GameState.PLAYING) {
      for(Enemy enemy : enemies) {
        enemy.toBeRemove = true;
      }
    }
    if(state == GameState.BOSS) {
      for(Enemy enemy : enemies) {
        enemy.increaseShotTime();
      }
    }
    for(EnemyBullet bullet : enemyBullets) {
      bullet.toBeRemove = true;
    }
  }
  
  void display() {
    imageMode(CENTER); 
    image(missle, x, y, 40, 250);

  }
}
