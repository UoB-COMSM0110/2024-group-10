// Gameplay related vars
String currentMode = "HARD";
boolean is2Player = false;
int playerCount;

Player player;
Player player2;

ArrayList<Bullet> playerBullets;
ArrayList<Bullet> player2Bullets;

ArrayList<Bullet> targetBullets;
ArrayList<Target> targets;
ArrayList<TargetTwo> targetsTwo;
ArrayList<Laser> lasers;
ArrayList<Life> lifes;
boolean gameOver = false;
PImage lives;
PImage bgImage;
int p1score = 0;
int p2score = 0;

boolean p1movingLeft = false;
boolean p1movingRight = false;
boolean p1movingUp = false;
boolean p1movingDown = false;
boolean p1isShooting = false;

boolean p2movingLeft = false;
boolean p2movingRight = false;
boolean p2movingUp = false;
boolean p2movingDown = false;
boolean p2isShooting = false;

ArrayList<Stalker> enemies;
ArrayList<Integer> enemyRemovedTime = new ArrayList<Integer>();

Player playerToName;


void settings() {
  size(1000, int(displayHeight*0.88));
  bgImage = loadImage("PrototypeImages/bgImage.png"); 
  bgImage.resize(width, height); 
}

void setup() {
  // UI related
  planecursor = loadImage("PrototypeImages/planecursor.gif");
  background(51);
  textAlign(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  strokeWeight(4);
  mainFont = createFont("Techno.otf", 80);
  infoFont = createFont("PlainRegular.ttf", 80);
  textFont(mainFont);

  // Gameplay related
  player = new Player(width / 4, height - 25, 1 );
  player2 = new Player((width / 4) * 3, height - 25, 2);

  playerBullets = new ArrayList<Bullet>();
  player2Bullets = new ArrayList<Bullet>(); // Initialize player 2 bullets ArrayList

  targetBullets = new ArrayList<Bullet>();
  targets = new ArrayList<Target>();
  targetsTwo = new ArrayList<TargetTwo>();
  lasers = new ArrayList<Laser>();
  lives = loadImage("PrototypeImages/lives.png"); 
  lives.resize(36, 29); 
  
  // Initialize enemies
  enemies = new ArrayList<Stalker>();
  if (currentMode.equals("HARD")) {
    for (int i = 0; i < 1; i++) {
      enemies.add(new Stalker(random(0, width), random(0, height), player, player2));
    }
  }
  
  // Initialize lifes
  lifes = new ArrayList<Life>();
  
  // Initialize background music
  minim = new Minim(this);
  bgm = minim.loadFile("PrototypeBgm/bgm_game_test.mp3"); 
  
  //Set naming screen to name player 1 first
  playerToName = player;
}


void draw() {
    if(is2Player){
      playerCount = 2;
    }
    else{
      playerCount=1;
    }
    
  // Main menu
  if (currentScreen == Screen.START) {
    cursor(planecursor);
    currentButton = Button.NONE;
    background(51);
    
    //navigation buttons
    createButton(width/2, 500, 250, 100, Button.NAMEB);
    fill(255);
    textSize(50);
    text("START", width/2, 515);

    createButton(width/2, 610, 350, 100, Button.INSTRUCTIONB);
    fill(255);
    textSize(50);
    text("INSTRUCTIONS", width/2, 625);

    createButton(width/2, 720, 250, 100, Button.MODEB);
    fill(255);
    textSize(50);
    text("MODES", width/2, 735);

    createButton(width/2, 830, 250, 100, Button.EXITB);
    fill(255);
    textSize(50);
    text("EXIT", width/2, 845);
    
    //game title
    text("Shooting Game Prototype Title", width/2, 150);
    

    // Increase mode
    textSize(30);
    text("Current Players: " + playerCount, width/2, 250);
    text("Current Difficulty: " + currentMode, width/2, 300);

    // Reinitialize game stats
    gameOver = false;
    player.lives = 3;
    player.hitTime = 0; // added this to reset hitTime
    p1score = 0;
    player.x = width/2;
    player.y = height-20;
  } else if (currentScreen == Screen.GAME) {
    currentButton = Button.NONE;
    noCursor();
    background(255);
    image(bgImage, width/2, height/2);
    // Main gameplay code starts here:

    if (!gameOver) {
      // Update and display players
      player.update();
      player.display();

      player2.update();
      player2.display();

      if (p1isShooting) {
        long currentTimeP1 = millis();
        if (currentTimeP1 - player.lastShootTime > player.shootInterval) {
          playerBullets.add(new Bullet(player.x, player.y - 15, true, player)); // Pass player object
          player.lastShootTime = currentTimeP1;
        }
      }

      if (p2isShooting) {
        long currentTimeP2 = millis();
        if (currentTimeP2 - player2.lastShootTime > player2.shootInterval) {
          player2Bullets.add(new Bullet(player2.x, player2.y - 15, true, player2)); // Pass player2 object
          player2.lastShootTime = currentTimeP2;
        }
      }

      // Display lives for players
      for (int i = 0; i < player.lives; i++) {
        image(lives, 30 + (i * 40), 40);
      }
      for (int i = 0; i < player2.lives; i++) {
        image(lives, 800 + (i * 40), 40);
      }

      textSize(20);
      fill(255, 255, 255);
      text("Player 1 Lives", 69, 20);
      text("Player 2 Lives", 837, 20);

      // Update and display enemies
      for (int i = 0; i < enemies.size(); i++) {
        Stalker enemy = enemies.get(i);
        enemy.update();
        enemy.display();
      }

      // Display lives
      for (int i = lifes.size() - 1; i >= 0; i--) {
        Life life = lifes.get(i);
        life.update();
        life.display();

        // Check whether the life hit the players
        if (life.hits(player)) {
          player.lives++;
          lifes.remove(i);
        }

        if (life.hits(player2)) {
          player2.lives++;
          lifes.remove(i);
        }

        // Remove Life if it's off the screen
        if (life.offscreen()) {
          lifes.remove(i);
        }
      }

      fill(0);
      textSize(20);

      fill(255, 255, 255);
      text("Player 1 Score: " + p1score, 80, 70);
      text("Player 2 Score: " + p2score, 850, 70);

      // Update and display player bullets
      updateAndDisplayBullets(playerBullets);

      // Update and display target bullets
      updateAndDisplayBullets(targetBullets);
      
      updateAndDisplayBullets(player2Bullets);
      checkCollisionsEnemy(player2Bullets, enemies);
      checkCollisionsWithTarget(player2Bullets, targets, player, player2);

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

      // For new lives every 30 seconds
      if (frameCount % (30 * 60) == 0) {
        lifes.add(new Life(random(width), 0, 3));
      }

      // Check for collisions between bullets and targets
      checkCollisionsWithTarget(playerBullets, targets, player, player2);
      checkCollisions(targetBullets, player, player2);
      checkCollisionsLaser(lasers, player, player2);
      checkCollisionsLaser(playerBullets, targetsTwo);
      removeExplodedTargets();

      // Check for collisions between bullets and enemies
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
      if (currentMode.equals("HARD")) {
        for (int i = enemyRemovedTime.size() - 1; i >= 0; i--) {
          int time = enemyRemovedTime.get(i);
          if (millis() - time > 5000) {
            enemyRemovedTime.remove(i);
            enemies.add(new Stalker(random(0, width), random(0, height), player, player2));
          }
        }
      }

      // Game over condition
      if (player.hit) {
        player.lives -= 1;
        player.hit = false;
      }
      if (player2.hit) {
        player2.lives -= 1;
        player2.hit = false;
      }
      if (player.lives <= 0 && player2.lives <= 0) {
        gameOver = true; // When both player's lives are 0, game over
      }
    } else {
      // Display game over message
      currentScreen = Screen.GAMEOVER;
    }

    // Pause trigger
    if (keyPressed) {
      if (key == ESC) {
        currentScreen = Screen.PAUSE;
      }
    }
  } 
  // Pause screen menu
  else if (currentScreen == Screen.PAUSE) {
    cursor(planecursor);
    background(51);
    textSize(50);
    text("GAME PAUSED", width/2, 150);

    // navigation buttons
    createButton(width/2, 250, 250, 100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("RESUME", width/2, 265);

    createButton(width/2, 360, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("GIVE UP", width/2, 375);
  }
  // Game over screen
  else if (currentScreen == Screen.GAMEOVER) {
    cursor(planecursor);
    background(51);
    currentButton = Button.NONE;

    textSize(50);
    text("GAME OVER!", width/2, 200);
    textSize(30);
    text("Oh no! \n You died. The aliens have won. \nBetter luck next time :(", width/2, 300);

    //display player name and score
    textSize(50);
    text(player.name + "'s Score: " + p1score, width/2, 450);
    text(player2.name + "'s Score : " + p2score, width/2 , 550);

    //navigation buttons
    createButton(width/3, 700, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/3, 715);
    
    createButton(2*width/3, 700, 250, 100, Button.NAMEB);
    fill(255);
    textSize(40);
    text("RETRY", 2*width/3, 715);
  }
  // Victory screen
  else if (currentScreen == Screen.VICTORY) {
    cursor(planecursor);
    background(51);
    currentButton = Button.NONE;

    textSize(50);
    text("CONGRATULATIONS!", width/2, 200);
    textSize(30);
    text("A winner is you! \n The aliens have been defeated and the world is saved!", width/2, 300);
    
    //display player final score
    textSize(50);
    text("FINAL SCORE: " + p1score, width/2, 500);

    //navigation buttons
    createButton(width/2, 700, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 715);
  }
  // Instructions screen - player page
  else if (currentScreen == Screen.INSTRUCTIONS) {
    cursor(planecursor);
    background(180);
    currentButton = Button.NONE;

    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);

    stroke(100);
    line(20, 150, width-20, 150);
    
    //player controls visualisation
    textSize(30);
    fill (255, 195, 0) ;
    text("Shoot", width/4, 400);
    fill(255);
    text("Move", 3*width/4, 400);
    
    text("Player 1", width/10, 250);
    text("Player 2", width/10, 350);

    // TODO PLACEHOLDER TEXT - needs images from art team
    textSize(15);
    text("Spacebar placeholder\n insert image here", width/4, 220);
    text("Direction key placeholder\n insert image here", 3*width/4, 220);
    
    text("F key placeholder\n insert image here", width/4, 320);
    text("WASD keys placeholder\n insert image here", 3*width/4, 320);
    text("ESC key placeholder\n insert image here", width/8, 620);

    //player spaceship and bullets visualisation
    Player examplePlayer = new Player(width/2, 380, 0);
    examplePlayer.display();

    for (int i = 0; i < 3; i++) {
      Bullet examplePlayerBullet = new Bullet(width/2, 230 + i*40, true, player);
      examplePlayerBullet.display();
    }

    // details on lives and pausing game text
    for (int i = 0; i < 3; i++) {
      image(lives, width/10 + i*40, 500);
    }
    
    textAlign(LEFT);
    textSize(30);
    fill(255,0,0);
    text("Player life points count - keep these above 0 to stay alive! ", width/10+3*40, 510);

    image(lives, width/10 + 40, 560);
    text("Collect falling hearts to heal yourself by 1 point", width/10+3*40, 570);
    
    fill(255);
    text("Press ESC to pause game", width/10+3*40, 630);
    textFont(mainFont);

    textAlign(CENTER);

    line(20, 830, width-20, 830);

    //navigation buttons
    createButton(width/2, 900, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);

    createButton(3*width/4, 900, 250, 100, Button.ENEMYB);
    fill(255);
    textSize(40);
    text("ENEMY INFO", 3*width/4, 915);
  }
  // Instructions screen - enemy info page
  else if (currentScreen == Screen.ENEMYINFO) {
    cursor(planecursor);
    background(180);
    currentButton = Button.NONE;

    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);

    stroke(100);
    line(20, 150, width-20, 150);

    //display enemy images
    Target basicEnemy = new Target(width/6, 250);
    basicEnemy.display();

    Bullet exampleEnemyBullet = new Bullet(width*.51, 295, false, player);
    exampleEnemyBullet.display();

    TargetTwo spaceshipEnemy = new TargetTwo(width/6, 450);
    spaceshipEnemy.display();

    Stalker exampleStalker = new Stalker(width/6,675,null,null);
    exampleStalker.display();

    //display enemy description text
    textFont(infoFont);
    textSize(20);
    textAlign(LEFT);
    fill(0, 139, 208, 255);
    text("Jellyjellies like to float through life like they will your computer screen.\nThey do not think much on account of having no brain and their philosophy\nto life and war is 'random bullets go!'\nBe careful not to touch them they sting!\n\nAttack type: Jelly Shots            \n(Warning: do not consume. The developers of this game will not be held liable)", width/3.5, 200);
    fill(81, 75, 116, 255);
    text("Extra-purrestrials have long told legends of 'humans'. Beings who wielded a \ntechnology always just out of the grasp of cat-kind, tormenting their \nancestors for amusement and so called 'likes'. Well, now their descendants\nare here to return the favour. \n\nAttack type: Pointier Lasers \n\nNote: Has developed advanced defensive technologies to protect their \nfluffy tummies", width/3.5, 400);
    fill(255, 0, 0);
    text("Huggoctopuses love to chase all the shiny things and hold them close\nto their heart. \nIncluding your ship. \n\nAttack type: Free hugs :)", width/3.5, 650);
    textFont(mainFont);
    textAlign(CENTER);

    line(20, 830, width-20, 830);

    // navigation buttons
    createButton(width/4, 900, 250, 100, Button.INSTRUCTIONB);
    fill(255);
    textSize(40);
    text("PLAYER INFO", width/4, 915);

    createButton(width/2, 900, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);
    
    //display laser attack image
    translate(width/2+50, 462);
    rotate(radians(90));
    Laser exampleEnemyLaser = new Laser(35, -75, false);
    exampleEnemyLaser.display();
  }
  // Mode select screen
  else if (currentScreen == Screen.MODESELECT) {
    cursor(planecursor);
    background(51);
    currentButton = Button.NONE;

    textSize(50);
    text("Current Difficulty: " + currentMode, width/2, 150);
    text("Player Number: " + playerCount, width/2, 450);

    //button selection for difficulty level
    createButton(width/3, 300, 250, 100, Button.EASYB);
    fill(255);
    textSize(40);
    text("EASY", width/3, 315);

    createButton(2*width/3, 300, 250, 100, Button.HARDB);
    fill(255);
    textSize(40);
    text("HARD", 2*width/3, 315);
    
    // button selection for number of players
    createButton(width/3, 550, 250, 100, Button.ONEPLAYERB);
    fill(255);
    textSize(40);
    text("1 Player", width/3, 565);

    createButton(2*width/3, 550, 250, 100, Button.TWOPLAYERB);
    fill(255);
    textSize(40);
    text("2 Player", 2*width/3, 565);
    
    //navigation buttons
    createButton(width/2, 900, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);
  }
  else if (currentScreen == Screen.NAMEENTRY) {
    cursor(planecursor);
    background(51);
    currentButton = Button.NONE;

    //header
    textSize(40);
    text("Type to input name", width/2, 100);
    
    //player 1 input
    fill(255);
    textSize(50);
    text("Player 1 name:", width/2, 350);
    textSize(40);   
    fill(255,0,255);
    text(player.name, width/2, 450);
    
    // adds player 2 part if in 2 player mode
    if (is2Player){
      fill(255);
      textSize(50);
      text("Player 2 name:", width/2, 550);
      textSize(30);
      text("(Press TAB to switch player)", width/2, 150);
      textSize(40);
      text("Currently naming:", width/3, 250);
      fill(255,0,255);
      text("Player " + playerToName.playerNumber , width*.57, 250);
      text(player2.name, width/2, 650);
    }
    
    //buttons
    createButton(2*width/3, 800, 250, 100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("CONFIRM", 2*width/3, 815);
    
    createButton(width/3, 800, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("BACK", width/3, 815);
    
  }

  // BGM related
  if (currentScreen == Screen.GAME) {
    if (!bgm.isPlaying()) {
      bgm.loop(); // If the current screen is the game screen and music is not playing, start looping music
    }
  } else {
    if (bgm.isPlaying()) {
      bgm.pause(); // If not in the game screen and music is playing, pause music
    }
  }
}


void keyPressed() {
  //name input screen keypresses
  if (currentScreen == Screen.NAMEENTRY){
     if(key== TAB && is2Player){
       if (playerToName == player){
         playerToName = player2;
       }
       else if (playerToName == player2){
         playerToName = player;
       }
     }
     if(!is2Player){
       playerToName = player;
     }
     playerToName.alterName();
  }
  
  //player 1 movement keypress
  if (key == ESC) 
    key = 0; 
  if (keyCode == LEFT) 
    p1movingLeft = true;
  if (keyCode == RIGHT) 
    p1movingRight = true;
  if (keyCode == UP) 
    p1movingUp = true;
  if (keyCode == DOWN) 
    p1movingDown = true;
  if (key == ' ') 
    p1isShooting = true;
  
  //player 2 movement keypress
  if (key == 'a' || key == 'A') 
    p2movingLeft = true;
  if (key == 'd' || key == 'D') 
    p2movingRight = true;
  if (key == 'w' || key == 'W') 
    p2movingUp = true;
  if (key == 's' || key == 'S') 
    p2movingDown = true;
  if (key == 'f' || key == 'F') 
    p2isShooting = true;
  
}

void keyReleased() {
  if (keyCode == LEFT) 
    p1movingLeft = false;
  if (keyCode == RIGHT) 
    p1movingRight = false;
  if (keyCode == UP) 
    p1movingUp = false;
  if (keyCode == DOWN) 
    p1movingDown = false;
  if (key == ' ') 
    p1isShooting = false;
  
  if (key == 'a' || key == 'A') 
    p2movingLeft = false;
  if (key == 'd' || key == 'D') 
    p2movingRight = false;
  if (key == 'w' || key == 'W') 
    p2movingUp = false;
  if (key == 's' || key == 'S') 
    p2movingDown = false;
  if (key == 'f' || key == 'F') 
    p2isShooting = false;
}


void mousePressed(){
  // menu navigation button clicks:
  if (currentButton == Button.EXITB)
  {
    exit();
  }
  else if (currentButton == Button.GAMEB){
    currentScreen = Screen.GAME;
    resetGame();
  }
  else if (currentButton == Button.STARTB){
    resetGame(); 
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
  else if (currentButton == Button.NAMEB) { 
    currentScreen = Screen.NAMEENTRY;
  }
  // mode select button clicks:
  else if (currentButton == Button.EASYB) {
    currentMode = "EASY";  
  } else if (currentButton == Button.HARDB) {
    currentMode = "HARD"; 
  }
  else if (currentButton == Button.ONEPLAYERB) {
    is2Player = false; 
  }
  else if (currentButton == Button.TWOPLAYERB) {
    is2Player = true; 
  }

}


//game inside funcitons below:
//reload game when retart game after gameover and pasu-giveup
void resetGame() {
    //player = new Player(width / 4, height - 25); // 重新初始化玩家
    //player2 = new Player(width / 4 * 3, height - 25); // 

    // reset player 1
    player.lives = 3;
    player.score = 0;
    player.isInvincible = false;
    player.invincibleStartTime = -2000;
    player.hitTime = -2000;
    player.x = width / 4; 
    player.y = height - 25;    

    // reset player 2
    player2.lives = 3;
    player2.score = 0;
    player2.isInvincible = false;
    player2.invincibleStartTime = -2000;
    player2.hitTime = -2000;
    player2.x = width / 4 * 3; 
    player2.y = height - 25;

    playerBullets.clear(); // 清空玩家子弹列表
    targetBullets.clear(); // 清空目标子弹列表
    targets.clear(); // 清空目标列表
    targetsTwo.clear(); // 清空第二类目标列表
    lasers.clear(); // 清空激光列表
    lifes.clear(); // 清空生命列表
    enemies.clear(); // 清空敌人列表
    enemyRemovedTime.clear(); // 清空敌人移除时间列表
    gameOver = false; // 重置游戏结束标志
    p1score = 0; // 重置得分

    if (currentMode.equals("HARD")) {
        for (int i = 0; i < 1; i++) {
            enemies.add(new Stalker(random(0, width), random(0, height), player, player2));
        }
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


void checkCollisionsWithTarget(ArrayList<Bullet> bullets, ArrayList<Target> targets, Player player, Player player2) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    for (int j = targets.size() - 1; j >= 0; j--) {
      Target target = targets.get(j);
      if (bullet.hits(target)) {
        target.getHit();
        bullets.remove(i);
        if (bullet.getShooter() == player) {
          p1score += 5;
        } else if (bullet.getShooter() == player2) {
          p2score += 5; // Adjust as needed
        }
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
        if (bullet.getShooter() == player) {
          p1score += 10;
        } else if (bullet.getShooter() == player2) {
          p2score += 10; // Adjust as needed
        }
        //p1score += 10;
        break;
      }
    }
  }
}

void checkCollisions(ArrayList<Bullet> bullets, Player player, Player player2) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    if (bullet.hits(player) && !player.isInvincible) { 
      player.hit = true;
      player.gotHit();
      bullets.remove(i);
    } else if (bullet.hits(player2) && !player2.isInvincible) { 
      player2.hit = true;
      player2.gotHit();
      bullets.remove(i);
    }
  }
}

void checkCollisionsLaser(ArrayList<Laser> lasers, Player player, Player player2) {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    if (laser.hits(player) && !player.isInvincible) { 
      player.hit = true;
      player.gotHit();
      lasers.remove(i);
    } else if (laser.hits(player2) && !player2.isInvincible) {
      player2.hit = true;
      player2.gotHit();
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
        if (bullet.getShooter() == player) {
          p1score += 20;
        } else if (bullet.getShooter() == player2) {
          p2score += 20;
        }
        //score += 20; 
        break;
      }
    }
  }
}
