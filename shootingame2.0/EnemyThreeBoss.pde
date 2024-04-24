class EnemyThreeBoss extends EnemyThree {
  EnemyThreeBoss(float x, float y) {
    super();
    this.x = x;
    this.y = y;
  }

  void update() {
    if (shotTime > 5) toBeRemove = true;

    if (is2Player) {
      if ((!player.isDied)&&(!player2.isDied)) {
        if (random(1)>0.5) {
          float angle = atan2(player.y - y, player.x - x);
          shootingX = x + cos(angle) * 100;
          shootingY = y + sin(angle) * 100;
          if (frameCount % 60 == 0) shootBullets();
        } else {
          float angle = atan2(player2.y - y, player2.x - x);
          shootingX = x + cos(angle) * 100;
          shootingY = y + sin(angle) * 100;
          if (frameCount % 60 == 0) shootBullets();
        }
        return;
      }

      if ((!player.isDied)) {
     
          float angle = atan2(player.y - y, player.x - x);
          shootingX = x + cos(angle) * 100;
          shootingY = y + sin(angle) * 100;
          if (frameCount % 60 == 0) shootBullets();
      
        return;
      }

      if ((!player2.isDied)) {
      
          float angle = atan2(player2.y - y, player2.x - x);
          shootingX = x + cos(angle) * 100;
          shootingY = y + sin(angle) * 100;
          if (frameCount % 60 == 0) shootBullets();
        
        return;
      }
    
    } else {
      float angle = atan2(player.y - y, player.x - x);
      shootingX = x + cos(angle) * 100;
      shootingY = y + sin(angle) * 100;
      if (frameCount % 60 == 0) shootBullets();
    }
  }
  
  void increaseShotTime() {shotTime += 3;}
}
