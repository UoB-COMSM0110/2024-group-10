//Gameplay related vars
Player player;
ArrayList<Bullet> playerBullets;
ArrayList<Bullet> targetBullets;
ArrayList<Target> targets;
ArrayList<TargetTwo> targetsTwo;
ArrayList<Laser> lasers;
ArrayList<Life> lifes;
boolean gameOver = false;
PImage lives;
int score = 0;

ArrayList<Stalker> enemies;
ArrayList<Integer> enemyRemovedTime = new ArrayList<Integer>();

void settings(){
  size(1000, int(displayHeight*0.91));
}

void setup(){
  //UI related
  planecursor = loadImage("PrototypeImages/planecursor.gif");
  background(51);
  textAlign(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  strokeWeight(4);
  

  //Gameplay related
  player = new Player(width / 2, height - 20);
  playerBullets = new ArrayList<Bullet>();
  targetBullets = new ArrayList<Bullet>();
  targets = new ArrayList<Target>();
  targetsTwo = new ArrayList<TargetTwo>();
  lasers = new ArrayList<Laser>();
  lives = loadImage("PrototypeImages/lives.png"); 
  lives.resize(36, 29); 
  
  // enemies
  // come back to, might change the number of enemies
  enemies = new ArrayList<Stalker>();
  for (int i = 0; i < 1; i++) {
    enemies.add(new Stalker(random(0, width), random(0, height), player));
  }
  
  // lives
  lifes = new ArrayList<Life>();
}

void draw() {
  
  //main menu
  if (currentScreen == Screen.START){
    background(51);
    createButton(width/2,500,250,100, Button.GAMEB);
    fill(255);
    textSize(50);
    text("START", width/2, 515);
   
    createButton(width/2, 610,350,100, Button.INSTRUCTIONB);
    fill(255);
    textSize(50);
    text("INSTRUCTIONS", width/2, 625); 
   
    createButton(width/2, 720,250,100, Button.MODEB);
    fill(255);
    textSize(50);
    text("MODES", width/2, 735);
    
    createButton(width/2, 830,250,100, Button.EXITB);
    fill(255);
    textSize(50);
    text("EXIT", width/2, 845);

   
    text("Shooting Game Prototype Title", width/2, 150);
    cursor(planecursor);
    
    //reinitialise game stats
    gameOver = false;
    player.lives = 3;
    player.hitTime = 0; // added this to reset hitTime
    score = 0;
    player.x = width/2;
    player.y = height-20;
  }
  else if (currentScreen == Screen.GAME){
    currentButton = Button.NONE;
    noCursor();
    background(255);
    
    //Main gameplay code start here:
  
    if (!gameOver) {
      // Update and display player
      player.update();
      player.display(); 
      for (int i = 0; i < player.lives; i++) {
           image(lives, 30 + (i * 40), 20); 
            }
      
      // update + display enemies
      for (int i = 0; i < enemies.size(); i++) {
        Stalker enemy = enemies.get(i);
        enemy.update();
        enemy.display();
      }
      
      // display lives
      for (int i = lifes.size() - 1; i >= 0; i--) {
        Life life = lifes.get(i);
        life.update();
        life.display();

        // Check whether the life hit the player
        if (life.hits(player)) {
          player.lives++;
          lifes.remove(i);
        }

        // Remove Life if it's off the screen
          if (life.offscreen()) {
            lifes.remove(i);
          }
       }
      
    fill(0); 
    textSize(20); 
    //text("Lives: " + player.lives, 30, 30); 
    for (int i = 0; i < player.lives; i++) {
    image(lives, 30 + (i * 40), 20); 
}
    text("hit time " + player.hitTime, 300, 30); 
    
    text("Score: " + score, 300, 50);
    
      // Update and display player bullets
      updateAndDisplayBullets(playerBullets);
      
      // Update and display target bullets
      updateAndDisplayBullets(targetBullets);
      
      // Update and display lasers
      updateAndDisplayLasers(lasers);
      
      // Update and display targets
      for (int i = targets.size() - 1; i >= 0; i--) {
        Target target = targets.get(i);
        target.update();
        target.display();
        if (target.offscreen()) {
          targets.remove(i);
        }
      }
      
      for (int i = targetsTwo.size() - 1; i >= 0; i--) {
        TargetTwo targetTwo = targetsTwo.get(i);
        targetTwo.update();
        targetTwo.display();
        if (targetTwo.offscreen()) {
          targetsTwo.remove(i);
        }
      }
      
      // Add new targets randomly
      if (frameCount % 60 == 0) {
        targets.add(new Target(random(width), random(height) / 2));
      }
      
      // Add big target randomly
      if (frameCount % 300 == 0) {
        targetsTwo.add(new TargetTwo(50, 50));
      }
      
      // for new lives every 30 seconds
      if (frameCount % (30 * 60) == 0) {
        lifes.add(new Life(random(width), 0, 3));
      }
      
      // Check for collisions between bullets and targets
      checkCollisions(playerBullets, targets);
      checkCollisions(targetBullets, player);
      checkCollisionsLaser(lasers, player);
      checkCollisionsLaser(playerBullets, targetsTwo);
      removeExplodedTargets(); 
      
      // check for collisions between bullets and enemies
      checkCollisionsEnemy(playerBullets, enemies);
      
      // Remove any enemies that were hit
      for (int i = enemies.size() - 1; i >= 0; i--) {
        Stalker enemy = enemies.get(i);
        if (enemy.isExploding) {
          enemies.remove(i);
          enemyRemovedTime.add(millis());
        }
      }
      
      // Respawn any enemies that were removed more than 30 seconds ago
       for (int i = enemyRemovedTime.size() - 1; i >= 0; i--) {
        int time = enemyRemovedTime.get(i);
        if (millis() - time > 5000) {
          enemyRemovedTime.remove(i);
          enemies.add(new Stalker(random(0, width), random(0, height), player));
        }
      }
     
      // Game over condition
      if (player.hit) {
        player.lives -= 1;
        player.hit = false;
        if (player.lives <= 0) {
          gameOver = true; // 当生命值为0时游戏结束
        }
      }
    } else {
      // Display game over message
      currentScreen = Screen.GAMEOVER;
    }
    
    //pause trigger
    if(keyPressed) {
      if(key == ESC){
        currentScreen = Screen.PAUSE;
      }
    }
  }
  //pause menu
  else if (currentScreen == Screen.PAUSE)
  {
    cursor(planecursor);
    background(51);
    textSize(50);
    text("GAME PAUSED", width/2, 150);
    
    createButton(width/2, 250,250,100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("RESUME", width/2, 265);
    
    createButton(width/2, 360,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("GIVE UP", width/2, 375);
  }
  //gameover screen
  else if (currentScreen == Screen.GAMEOVER)
  {
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("GAME OVER!", width/2, 200);
    
    textSize(30);
    text("Oh no! \n You died. The aliens have won. \nBetter luck next time :(", width/2, 300);
    
    textSize(50);
    text("FINAL SCORE: " + score, width/2, 500);
    
    createButton(width/2, 700,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 715);
  }
  //victory screen
  else if (currentScreen == Screen.VICTORY)
  {
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("CONGRATULATIONS!", width/2, 200);
    
    textSize(30);
    text("A winner is you! \n The aliens have been defeated and the world is saved!", width/2, 300);
    
    textSize(50);
    text("FINAL SCORE: " + score, width/2, 500);
    
    createButton(width/2, 700,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 715);
  }
  //instructions screen - player page
  else if (currentScreen == Screen.INSTRUCTIONS)
  {
    cursor(planecursor);
    background(180);
            
    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);
    
    stroke(100);
    line(20,150,width-20,150);
    
    textSize(30);
    text("Shoot", width/4, 400);
    text("Move", 3*width/4, 400);
    
    //PLACEHOLDER TEXT - needs images from art team
    textSize(15);
    text("Spacebar placeholder\n insert image here", width/4, 250);
    text("Direction key placeholder\n insert image here", 3*width/4, 250);
    text("ESC key placeholder\n insert image here", width/8, 620);
    
    Player examplePlayer = new Player(width/2, 380);
    examplePlayer.display();
    
    for (int i = 0; i < 3; i++){
    Bullet examplePlayerBullet = new Bullet(width/2, 230 +i*40, true);
    examplePlayerBullet.display();
    }
    
    for (int i = 0; i < 3; i++){
      image(lives, width/10 + i*40, 500); 
    }
    textSize(30);
    textAlign(LEFT);
    text("Player life points count - keep these above 0 to stay alive! ", width/10+3*40, 510);
    
    image(lives, width/10 + 40, 560);
    text("Collect falling hearts to heal yourself by 1 point", width/10+3*40, 570);
    
    text("Press ESC to pause game", width/10+3*40, 630);
    
    textAlign(CENTER);

    
    line(20,830,width-20,830);
    
    createButton(width/2, 900,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);  
    
    createButton(3*width/4, 900,250,100, Button.ENEMYB);
    fill(255);
    textSize(40);
    text("ENEMY INFO", 3*width/4, 915);  
  }
  //instructions screen - enemy info page
  else if(currentScreen == Screen.ENEMYINFO){
    cursor(planecursor);
    background(180);
    
    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);
    
    stroke(100);
    line(20,150,width-20,150);
    
    Target basicEnemy = new Target(width/6, 250);
    basicEnemy.display();
    
    Bullet exampleEnemyBullet = new Bullet(width/2, 287, false);
    exampleEnemyBullet.display();
    
    TargetTwo spaceshipEnemy = new TargetTwo(width/6, 450);
    spaceshipEnemy.display();
    
    //PLACEHOLDER TEXT - needs images from art team
    textSize(15);
    text("Stalker placeholder\n insert image here", width/6, 650);
    
    textSize(20);
    textAlign(LEFT);
    fill(0,139,208,255);
    text("Jellyjellies like to float through life like they will your computer screen.\nThey do not think much on account of having no brain and their philosophy to life\nand war is 'random bullets go!'\nBe careful not to touch them they sting!\nAttack type: Jelly Shots          (Warning: do not consume. The developers of this game\nwill not be held liable)", width/3.5, 200);
    fill(81,75,116,255);
    text("Extra-purrestrials have long told legends of 'humans'. Beings who wielded a \ntechnology always just out of the grasp of cat-kind, tormenting their ancestors for \namusement and so called 'likes'. Well, now their descendents are here to return the \nfavour. \nAttack type: Pointier Lasers \nNote: Has developed advanced defensive technologies to protect their fluffy tummies", width/3.5, 400);
    fill(255,0,0);
    text("Huggoctopuses love to chase all the shiny things and hold them close to their heart. \nIncluding your ship. \nAttack type: Don't hug me I'm scared", width/3.5, 650);
    
    textAlign(CENTER);
    
    
    line(20,830,width-20,830);
    
    createButton(width/4, 900,250,100, Button.INSTRUCTIONB);
    fill(255);
    textSize(40);
    text("PLAYER INFO", width/4, 915);  
    
    createButton(width/2, 900,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);  
        
    translate(width/2, 450);
    rotate(radians(90));
    Laser exampleEnemyLaser = new Laser(35, -75, false);
    exampleEnemyLaser.display();    
  } 
//mode select screen
  else if(currentScreen == Screen.MODESELECT){
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("Current Difficulty:", width/2, 150);
    
    createButton(width/3, 300,250,100, Button.EASYB);
    fill(255);
    textSize(40);
    text("EASY", width/3, 315); 
    
    createButton(2*width/3, 300,250,100, Button.HARDB);
    fill(255);
    textSize(40);
    text("HARD", 2*width/3, 315); 
    
    createButton(width/2, 900,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);  
  }
  
}


void keyPressed(){
  //default ESC in processing will close the window. This overrides that.
 if (key == ESC){
   key = 0;
 }
 if (!gameOver && currentScreen == Screen.GAME) {
    if (key == ' ') {
      playerBullets.add(new Bullet(player.x, player.y - 15, true));
    }
 }
}

void mousePressed(){
  if (currentButton == Button.EXITB)
  {
    exit();
  }
  else if (currentButton == Button.GAMEB){
    currentScreen = Screen.GAME;
  }
  else if (currentButton == Button.STARTB){
    currentScreen = Screen.START;
  }
  else if (currentButton == Button.INSTRUCTIONB){
    currentScreen = Screen.INSTRUCTIONS;
  }
  else if (currentButton == Button.ENEMYB){
    currentScreen = Screen.ENEMYINFO;
  }
  else if (currentButton == Button.MODEB){
    currentScreen = Screen.MODESELECT;
  }
  /* code below for difficulty level change, can be used after Antai part is done (implement code for gameplay difficulty changes) 
  else if (currentButton == Button.EASYB){
    change difficulty mode to easy;
  }
  else if (currentButton == Button.HARDB){
    change difficulty mode to hard;
  }
  */
}

//Gameplay related functions below:
void updateAndDisplayBullets(ArrayList<Bullet> bullets) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    bullet.update();
    bullet.display();
    if (bullet.offscreen()) {
      bullets.remove(i);
    }
  }
}

void updateAndDisplayLasers(ArrayList<Laser> lasers) {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    laser.update();
    laser.display();
    if (laser.offscreen()) {
      lasers.remove(i);
    }
  }
}

void removeExplodedTargets() {
    for (int i = targets.size() - 1; i >= 0; i--) {
        if (targets.get(i).shouldBeRemoved) {
            targets.remove(i);
        }
    }
    for (int i = targetsTwo.size() - 1; i >= 0; i--) {
        if (targetsTwo.get(i).shouldBeRemoved) {
            targetsTwo.remove(i);
        }
    }
}


void checkCollisions(ArrayList<Bullet> bullets, ArrayList<Target> targets) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    for (int j = targets.size() - 1; j >= 0; j--) {
      Target target = targets.get(j);
      if (bullet.hits(target)) {
        target.getHit();
        bullets.remove(i);
        //targets.remove(j);
        score += 5;
        break;
      }
    }
  }
}

void checkCollisionsLaser(ArrayList<Bullet> bullets, ArrayList<TargetTwo> targetsTwo) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    for (int j = targetsTwo.size() - 1; j >= 0; j--) {
      TargetTwo targetTwo = targetsTwo.get(j);
      if (bullet.hits(targetTwo)) {
        targetTwo.getHit();
        bullets.remove(i);
        //targetsTwo.remove(j);
        score += 10;
        break;
      }
    }
  }
}

void checkCollisions(ArrayList<Bullet> bullets, Player player) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    if (bullet.hits(player)) {
      player.hit = true;
      player.gotHit() ;
      bullets.remove(i);
    }
  }
}

void checkCollisionsLaser(ArrayList<Laser> lasers, Player player) {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    if (laser.hits(player)) {
      player.hit = true;
      player.gotHit() ;
      lasers.remove(i);
    }
  }
}

void checkCollisionsEnemy(ArrayList<Bullet> bullets, ArrayList<Stalker> enemies) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    for (int j = enemies.size() - 1; j >= 0; j--) {
      Stalker enemy = enemies.get(j);
      if (bullet.hits(enemy)) {
        enemy.getHit();
        bullets.remove(i);
        score += 20; 
        break;
      }
    }
  }
}
