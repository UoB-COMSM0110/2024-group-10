class EnemyBulletTwo extends EnemyBullet {
  boolean left;
  
  EnemyBulletTwo(float x, float y, float angle, boolean left) {
    super(x, y, angle);
    this.speed = 5;
    this.left = left;
  }
 
  @Override
  void update() {
    super.blink();
    //System.out.println(angle);
    if(left) x += speed * sin(radians(angle));
    else x -= speed * sin(radians(angle));
    y += speed * cos(radians(angle));
    
    checkBoundary();
  }
  
}
