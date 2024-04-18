class EnemyThree extends Enemy {
  float shootingX, shootingY;
  int shotTime = 0;
  
  EnemyThree() {
    super(100, 25);  
  }

  void update() {
    float angle = atan2(player.y - y, player.x - x);
    shootingX = x + cos(angle) * 100;
    shootingY = y + sin(angle) * 100;
    if(frameCount % 60 == 0) shootBullets();
    y += 0.5;
    checkBoundary();
  }
  
  void shootBullets() {
    EnemyBulletThree bullet = new EnemyBulletThree(shootingX, shootingY);
    enemyBullets.add(bullet);
  }
  
  boolean isHit(PlayerBullet bullet) {
    if(dist(x, y, bullet.x, bullet.y) <= 60) {
      shotTime++;
      if(shotTime > 5) toBeRemove = true;
      return true;
    }
    return false;
  }

  void display() {
    float rectWidth = 100;
    float rectHeight = 5;
    
    //Draw the bunker
    fill(25,30,40);
    ellipse(x, y, 100, 100);
      
    // Calculate the angle from the bunker to the player
    float angle = atan2(player.y - y, player.x - x);
  
    // Translate and rotate the canvas
    pushMatrix(); // Save the current transformation state
    translate(x, y); // Move origin to the bunker's center
    rotate(angle); // Rotate canvas to align with the player
  
    // Draw the rectangle (barrel)
    fill(0, 150, 0);
    rect(rectWidth / 2, -rectHeight / 2, rectWidth, rectHeight);  // Starts from center, extends right
  
    popMatrix(); // Restore the original transformation state
  }
}
