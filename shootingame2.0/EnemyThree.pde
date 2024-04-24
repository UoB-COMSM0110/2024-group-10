class EnemyThree extends Enemy {
  float shootingX, shootingY;
  int shotTime = 0;
  PImage enemy3;
  PImage enemy3re;

  EnemyThree() {
    super(100, 25);
    enemy3 = loadImage("PrototypeImages/enemies/enemy3.png");
    enemy3re = loadImage("PrototypeImages/enemies/enemy3re.png");
  }

  int choose;
  void update() {




    if (is2Player) {
      if ((!player.isDied)&&(!player2.isDied)) {
        if (random(1)<0.5) {

          choose =1;
          float angle = atan2(player.y - y, player.x - x);
          shootingX = x + cos(angle) * 100;
          shootingY = y + sin(angle) * 100;
          if (frameCount % 60 == 0) shootBullets();
          y += 0.5;
          checkBoundary();
        } else {
          choose=2;
          float angle = atan2(player2.y - y, player2.x - x);
          shootingX = x + cos(angle) * 100;
          shootingY = y + sin(angle) * 100;
          if (frameCount % 60 == 0) shootBullets();
          y += 0.5;
          checkBoundary();
        }
        return;
      }

      if ((!player.isDied)) {
        choose =1;
        float angle = atan2(player.y - y, player.x - x);
        shootingX = x + cos(angle) * 100;
        shootingY = y + sin(angle) * 100;
        if (frameCount % 60 == 0) shootBullets();
        y += 0.5;
        checkBoundary();

        return;
      }

      if ((!player2.isDied)) {
        choose =2;
        float angle = atan2(player2.y - y, player2.x - x);
        shootingX = x + cos(angle) * 100;
        shootingY = y + sin(angle) * 100;
        if (frameCount % 60 == 0) shootBullets();
        y += 0.5;
        checkBoundary();

        return;
      }
      float angle = atan2(player2.y - y, player2.x - x);
      shootingX = x + cos(angle) * 100;
      shootingY = y + sin(angle) * 100;
      if (frameCount % 60 == 0) shootBullets();
      y += 0.5;
      checkBoundary();
    } else {
      choose=1;
      float angle = atan2(player.y - y, player.x - x);
      shootingX = x + cos(angle) * 100;
      shootingY = y + sin(angle) * 100;
      if (frameCount % 60 == 0) shootBullets();
      y += 0.5;
      checkBoundary();
    }
  }

  void shootBullets() {
    EnemyBulletThree bullet = new EnemyBulletThree(shootingX, shootingY);
    enemyBullets.add(bullet);
  }

  boolean isHit(PlayerBullet bullet) {
    if (dist(x, y, bullet.x, bullet.y) <= 60) {
      shotTime++;
      if (shotTime > 5) toBeRemove = true;
      return true;
    }
    return false;
  }
 float angle = 0;
  void display() {
    float rectWidth = 100;
    float rectHeight = 5;

    //Draw the bunker
    imageMode(CENTER);
    image(enemy3, x, y, 107, 100);
   
    // Calculate the angle from the bunker to the player

    if (is2Player) {
       
      if ((!player.isDied)&&(!player2.isDied)) {
        
         if (frameCount % 60 == 0){
            if (random(1)<0.5) {

          angle = atan2(player.y - y, player.x - x);
        } else {
          angle = atan2(player2.y - y, player2.x - x);
        }
         }
       
     
      }else

      if ((!player.isDied) && (player2.isDied)) {
        angle = atan2(player.y - y, player.x - x);
  
      }

      else if ((!player2.isDied)&&(player.isDied)) {

        angle = atan2(player2.y - y, player2.x - x);
      
      }
    } else {
      angle = atan2(player.y - y, player.x - x);
    }

    //if (choose==1) {
    //  angle = atan2(player.y - y, player.x - x);
    //} else {
    //  angle = atan2(player2.y - y, player2.x - x);
    //}


    // Translate and rotate the canvas
    pushMatrix(); // Save the current transformation state
    translate(x, y); // Move origin to the bunker's center
    rotate(angle); // Rotate canvas to align with the player

    // Draw the rectangle (barrel)
    /*fill(0, 150, 0);
     rect(rectWidth / 2, -rectHeight / 2, rectWidth, rectHeight);*/    // Starts from center, extends right
    imageMode(CENTER);
    image(enemy3re, rectWidth / 2, -rectHeight / 2, enemy3re.width, enemy3re.height);

    popMatrix(); // Restore the original transformation state
  }
}
