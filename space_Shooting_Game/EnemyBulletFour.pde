class EnemyBulletFour extends EnemyBullet {
  EnemyBulletFour (float x, float y) {
    super(x, y, 0);
  }
  
    @Override
    void update() {
        super.blink();
    }
}
