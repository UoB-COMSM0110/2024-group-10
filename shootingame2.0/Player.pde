class Player {
  float x = 350;
  float y = 900;
  float bulletSpeed = 10;
  int lastFrame = frameCount;
  int currentFrame;
  int shootingGap = 30;
  boolean movingLeft = false;
  boolean movingRight = false;
  boolean movingUp = false;
  boolean movingDown = false;
  boolean isShooting = false;
  boolean isFirstBullet = true;
  String name ="";
  int playerNumber;
  
  Player (int playerNumber){
    this.playerNumber = playerNumber;
  }
   
  void display() {
    fill(256);
    ellipse(x, y, 50, 50);
  }
  
  void update() {
    if(isShooting) {
      if(isFirstBullet) {
        //shoot the first bullet first
        shootBullet();
        //Log the currentFrame
        lastFrame = frameCount;
        isFirstBullet = false;
      }
      int currentFrame = frameCount;
      if(currentFrame - lastFrame >= 60) {
        shootBullet();
        lastFrame = currentFrame;
      }
      
    }
    
    // Update position based on key flags
    if (movingUp) y -= 5;
    if (movingDown) y += 5;
    if (movingLeft) x -= 5;
    if (movingRight) x += 5;
  
    // Prevent the square from moving out of bounds
    x = constrain(x, 25, width - 25 );
    y = constrain(y, 25, height - 25 );
  }
  
  void shootBullet() {
    PlayerBullet bullet = new PlayerBullet(x , y - 25 , bulletSpeed);
    playerBullets.add(bullet);
  }
  
  float getSpeed() {
    return bulletSpeed;
  }
  
  void keyPressed() {
    if (key == ESC) {key = 0; state = GameState.PAUSE;};
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
    if (key == ' ') {
      isShooting = false;
      isFirstBullet = true;
    }
  }
  
    void alterName(){
      if (key == BACKSPACE && name.length() > 0){
        name = name.substring(0, name.length()-1);
      }
      else if (Character.isLetterOrDigit(key)){
        name = name.concat(String.valueOf(key));
      }
    }
}
