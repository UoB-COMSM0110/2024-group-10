class EnemyThreeBoss extends EnemyThree {
  PImage boss_enemy3;   
  PImage boss_enemy3re;  
  EnemyThreeBoss(float x, float y) {
    super();
    this.x = x;
    this.y = y;
    boss_enemy3 = loadImage ("PrototypeImages/boss_enemy3.png");
    boss_enemy3re = loadImage ("PrototypeImages/boss_enemy3re.png");
  }

  void update() {
    if (shotTime > 15) toBeRemove = true;

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
  
  boolean isHit(PlayerBullet bullet) {
    if (dist(x, y, bullet.x, bullet.y) <= 60) {
      shotTime++;
      if (shotTime > 15) {
        toBeRemove = true;
        if(random(0,1) > 0.5) {
        Object object = new Object(x, y, true, false);
        objects.add(object);
        }
        else{
          Object object = new Object(x, y, false, true);
          objects.add(object);
        }
      }
      return true;
    }
    return false;
  }
  
  void increaseShotTime() {shotTime += 3;}
  void display() {
        imageMode(CENTER);
        pushMatrix(); 
        translate(x, y); 
        float angle = atan2(player.y - y, player.x - x);
        rotate(angle); 
        imageMode(CENTER);
        image(boss_enemy3re, 50, 0, boss_enemy3re.width*0.8, boss_enemy3re.height*0.8); 
        
        popMatrix(); 
        image(boss_enemy3, x, y, 150, 107); 
        
        
        
        
        
        
        
        
        
    }
}
