//Gameplay related vars
Player player;
ArrayList<Bullet> playerBullets;
ArrayList<Bullet> targetBullets;
ArrayList<Target> targets;
ArrayList<TargetTwo> targetsTwo;
ArrayList<Laser> lasers;
boolean gameOver = false;
PImage lives;

void setup(){
  //UI related
  size(1000, 1000);
  planecursor = loadImage("PrototypeImages/planecursor.gif");
  background(51);
  textAlign(CENTER);
  rectMode(CENTER);
  

  //Gameplay related
  player = new Player(width / 2, height - 20);
  playerBullets = new ArrayList<Bullet>();
  targetBullets = new ArrayList<Bullet>();
  targets = new ArrayList<Target>();
  targetsTwo = new ArrayList<TargetTwo>();
  lasers = new ArrayList<Laser>();
  lives = loadImage("PrototypeImages/lives.png"); 
  lives.resize(36, 29); 
}

void draw() {
  
  if (currentScreen == Screen.START){
    background(51);
    createButton(mouseX,mouseY,500,500,250,100, Button.GAMEB);
    fill(255);
    textSize(50);
    text("START", 500, 515);
   
    createButton(mouseX,mouseY,500,610,250,100, Button.EXITB);
    fill(255);
    textSize(50);
    text("EXIT", 500, 625); 
   
    text("Shooting Game Prototype Title", 500, 150);
    cursor(planecursor);
    
    //reinitialise game stats
    gameOver = false;
    player.lives = 3;
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
      
    fill(0); 
    textSize(20); 
    //text("Lives: " + player.lives, 30, 30); 
    for (int i = 0; i < player.lives; i++) {
    image(lives, 30 + (i * 40), 20); 
}
    text("hit time " + player.hitTime, 300, 30); 
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
      
      // Check for collisions between bullets and targets
      checkCollisions(playerBullets, targets);
      checkCollisions(targetBullets, player);
      checkCollisionsLaser(lasers, player);
      checkCollisionsLaser(playerBullets, targetsTwo);
      removeExplodedTargets(); 
      
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
  else if (currentScreen == Screen.PAUSE)
  {
    cursor(planecursor);
    background(51);
    textSize(50);
    text("GAME PAUSED", 500, 150);
    
    createButton(mouseX,mouseY,500,250,250,100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("RESUME", 500, 265);
    
    createButton(mouseX,mouseY,500,360,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("GIVE UP", 500, 375);
  }
  else if (currentScreen == Screen.GAMEOVER)
  {
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("GAME OVER!", 500, 200);
    
    textSize(30);
    text("Oh no! \n You died. The aliens have won. \nBetter luck next time :(", 500, 300);
    
    textSize(50);
    text("FINAL SCORE:", 500, 500);
    
    createButton(mouseX,mouseY,500,700,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", 500, 715);
  }
  else if (currentScreen == Screen.VICTORY)
  {
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("CONGRATULATIONS!", 500, 200);
    
    textSize(30);
    text("A winner is you! \n The aliens have been defeated and the world is saved!", 500, 300);
    
    textSize(50);
    text("FINAL SCORE:", 500, 500);
    
    createButton(mouseX,mouseY,500,700,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", 500, 715);
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
