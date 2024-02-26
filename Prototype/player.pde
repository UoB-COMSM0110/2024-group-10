class Player {
  float x, y;
  float speed = 5;
  boolean hit = false;
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    if (keyPressed) {
       if (keyCode == LEFT) x -= speed;
      else if (keyCode == RIGHT) x += speed;
      else if (keyCode == UP) y -= speed;
      else if (keyCode == DOWN) y += speed;
    }
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
   void display() {
    fill(0);
    rectMode(CENTER);
    rect(x, y, 30, 30);
  }
}
