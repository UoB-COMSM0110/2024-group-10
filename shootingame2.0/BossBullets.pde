class BossBullet extends EnemyBullet {
  BossBullet(float x, float y, float angle) {
    super(x, y, angle);
    this.speed = 5;
  }
  
  void update() {
    x += speed * sin(radians(angle));
    y += speed * cos(radians(angle));
  }
}
