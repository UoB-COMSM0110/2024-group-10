class Controller {
  int lastFrame = frameCount;
  int enemyTwoNumber = 0;
  boolean left;
 
  void campaignMode() {
    background(255);
    player.update();
    player.display();
    
    //Generate basic enemies
    /*if(frameCount % 300 ==0) {
      Enemy enemy = new Enemy(random(25,725), 25);
      enemies.add(enemy);
    }*/
    
    /*//Generate EnemyTwo
    if(frameCount % 600 == 0) {
      left = random(1) > 0.5 ? true : false;
      generateFirstEnemyTwo(left);
    }
    if(enemyTwoNumber < 5) generateEnemyTwo(left); */
    
    //Generate EnemyThree
    /*if(frameCount % 60 ==0) {
      EnemyThree enemy = new EnemyThree();
      enemies.add(enemy);
    }*/
   
    //Update status for each enemy
    for(Enemy enemy : enemies) {
      enemy.update();
      enemy.display();
      if(enemy.toBeRemove) enemiesToRemove.add(enemy); 
    }
    
    //Update the status for each player's bullet
    for(PlayerBullet bullet : playerBullets) {
      bullet.update();
      bullet.display();
      for(Enemy enemy : enemies) {
        if(enemy.isHit(bullet)) {
          bullet.toBeRemove = true;
          break;
        }
      }
      if (bullet.toBeRemove) playerBulletsToRemove.add(bullet);
    }
    
    //Update the status for the enem'ies bullet
    for(EnemyBullet bullet : enemyBullets) {
      bullet.update();
      bullet.display();
      if(bullet.hitPlayer(player)) state = GameState.FINISHED;
      if(bullet.toBeRemove) enemyBulletsToRemove.add(bullet);
    }
    
    //Remove all the collected objects
    for(PlayerBullet bulletToRemove : playerBulletsToRemove) {
      playerBullets.remove(bulletToRemove);
    }
    
    for(EnemyBullet bulletToRemove : enemyBulletsToRemove) {
      enemyBullets.remove(bulletToRemove);
    }
    
    for(Enemy enemyToRemove : enemiesToRemove) {
      enemies.remove(enemyToRemove);
    }
  }
  
  void generateFirstEnemyTwo(boolean left) {
    enemyTwoNumber = 0;
    EnemyTwo enemy = new EnemyTwo(left, 50);
    enemies.add(enemy);
    lastFrame = frameCount;
    enemyTwoNumber ++;
  }
  
  void generateEnemyTwo(boolean left) {
    int currentFrame = frameCount;
    if(currentFrame - lastFrame > 60) {
      EnemyTwo enemy = new EnemyTwo(left, 50 - enemyTwoNumber * 10);
      enemies.add(enemy);
      lastFrame = frameCount;
      enemyTwoNumber ++;
    }
  }
}
