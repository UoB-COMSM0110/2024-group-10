class Controller {
  void campaignMode() {
    background(255);
    player.update();
    player.display();
    
    if(frameCount % 300 ==0) {
      Enemy enemy = new Enemy(random(25,725), 25);
      enemies.add(enemy);
    }
    
    for(Enemy enemy : enemies) {
      enemy.update();
      enemy.display();
      if(enemy.toBeRemove) enemiesToRemove.add(enemy); 
    }
    
    for(PlayerBullet bullet : playerBullets) {
      bullet.update();
      bullet.display();
      for(Enemy enemy : enemies) {
        if(enemy.isHit(bullet)) bullet.toBeRemove = true;
        break;
      }
      if (bullet.toBeRemove) playerBulletsToRemove.add(bullet);
    }
    
    for(EnemyBullet bullet : enemyBullets) {
      bullet.update();
      bullet.display();
      if(bullet.hitPlayer(player)) state = GameState.FINISHED;
      if(bullet.toBeRemove) enemyBulletsToRemove.add(bullet);
    }
    
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
}
