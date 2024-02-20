class Player {
  int x;
  int y;
  int w;
  int h;
  
  boolean moveLeft;
  boolean moveRight;
  boolean shooting;
  
  int speed; 

  // constructor
  Player(int startingX, int startingY, int startingW, int startingH) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    moveLeft = false;
    moveRight = false;
    shooting = false;
    speed = 10;
  }
  
  void render() {
   rect(x, y, w, h); 
  }
    
  void move() {
    if (moveLeft == true) {
      x -= speed; 
    }
    if (moveRight == true) {
      x += speed;
    }
  }
  
  void shoot() {
    bulletList.add(new Bullet(x + w /2, y));
  }
  
  void startShooting() {
    shooting = true;
    shoot();
  }
  
  void stopShooting() {
    shooting = false;
  }
}
