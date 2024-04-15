class Player {
  float x = 350;
  float y = 900;
  boolean movingLeft = false;
  boolean movingRight = false;
  boolean movingUp = false;
  boolean movingDown = false;
  boolean isShooting = false;
   
  void display() {
   rect(x, y, 50, 50);
  }
  
  void update() {
    if(isShooting) shootBullet();
    
    // Update position based on key flags
    if (movingUp) y -= 10;
    if (movingDown) y += 10;
    if (movingLeft) x -= 10;
    if (movingRight) x += 10;
  
    // Prevent the square from moving out of bounds
    x = constrain(x, 0, width - 50 );
    y = constrain(y, 0, height - 50 );
  }
  
  void keyPressed() {
    if (key == ESC) key = 0; 
    if (keyCode == LEFT) movingLeft = true;
    if (keyCode == RIGHT) movingRight = true;
    if (keyCode == UP) movingUp = true;
    if (keyCode == DOWN) movingDown = true;
    if (key == ' ') isShooting = true;
  }
  
  void keyReleased() {
    if (keyCode == LEFT) movingLeft = false;
    if (keyCode == RIGHT) movingRight = false;
    if (keyCode == UP) movingUp = false;
    if (keyCode == DOWN) movingDown = false;
    if (key == ' ') isShooting = false;
  }
}
