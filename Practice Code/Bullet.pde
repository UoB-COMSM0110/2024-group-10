class Bullet {
  
  int x;
  int y;
  int d;
  
  int speed; 
  boolean deleteBullet;
  
  Bullet(int startingX, int startingY) {
    x = startingX;
    y = startingY;
    d = 7;
    speed = 15; 
    deleteBullet = false;
  }
  
  void render() {
    circle(x, y, d);
  } 
  
  void move() {
    y -= speed;
  }

  void checkBullet() {
    if (y < 0) {
      deleteBullet = true;
    }
  }
}
