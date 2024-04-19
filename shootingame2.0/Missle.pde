class Missle extends PlayerBullet {
  int startFrame;
  
  Missle(float x, float y, float speed) {
    super(x, y, speed);
    startFrame = frameCount;
  }
  
  void update() {
    y -= speed;
    int currentFrame = frameCount;
    if(currentFrame - startFrame >= 45) explode(); 
  }
  
  void explode() {
    toBeRemove =true;
    for(Enemy enemy : enemies) {
      enemy.toBeRemove = true;
    }
    for(EnemyBullet bullet : enemyBullets) {
      bullet.toBeRemove = true;
    }
  }
  
  void display() {
    fill(0, 150, 50);
    rect(x, y, 20, 100);
  }
}
