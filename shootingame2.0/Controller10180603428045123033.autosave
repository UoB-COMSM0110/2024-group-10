class Controller {
  int lastFrame = frameCount;
  int enemyTwoNumber = 0;
  boolean left;
  
 
  void campaignMode() {
    noCursor();
    background(background);
    player.update();
    player.display();
    stroke(0);
    
    //Generate basic enemies
    if(frameCount % 300 ==0) {
      Enemy enemy = new Enemy(random(25,725), 25);
      enemies.add(enemy);
    }
    
    //Generate EnemyTwo
    if(frameCount % 600 == 0) {
      left = random(1) > 0.5 ? true : false;
      generateFirstEnemyTwo(left);
    }
    if(enemyTwoNumber < 5) generateEnemyTwo(left); 
    
    //Generate EnemyThree
    if(frameCount % 600 ==0) {
      EnemyThree enemy = new EnemyThree();
      enemies.add(enemy);
    } 
    
    //Generate EnemyFour
      if(frameCount % 300 ==0) {
      EnemyFour enemyOne = new EnemyFour(350, 150, true );
      EnemyFour enemyTwo = new EnemyFour(300, 150, true );
      EnemyFour enemyThree = new EnemyFour(400, 150, false );
      EnemyFour enemyFour = new EnemyFour(450, 150, false );
      
      enemies.add(enemyOne);
      enemies.add(enemyTwo);
      enemies.add(enemyThree);
      enemies.add(enemyFour);
    } 
   
    //Update status for each enemy
    for(Enemy enemy : enemies) {
      if(!enemy.toBeRemove) {
        enemy.update();
        enemy.display();
      }
      else enemiesToRemove.add(enemy); 
    } 
    
    //Update the status for each player's bullet
    for(PlayerBullet bullet : playerBullets) {
      bullet.update();
      bullet.display();
      for(Enemy enemy : enemies) {
        if(enemy.isHit(bullet)) {
          player.score += 1;
          player.energy += 10;
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
      if (bullet.hitPlayer(player)) {
        player.lives -= 1;  // Decrement player's lives
        bullet.toBeRemove = true;  // Mark bullet for removal
        
        if (player.lives <= 0) {
            state = GameState.FINISHED;  // End game if player is out of lives
        } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
        }
      }
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
  
  //Reset game
  void resetGame() {
    // 重置玩家状态
    player.reset();
    player2.reset();

    // 清空所有列表
    enemies.clear();
    enemyBullets.clear();
    playerBullets.clear();
    enemyBulletsToRemove.clear();
    playerBulletsToRemove.clear();
    enemiesToRemove.clear();

    // 重置游戏状态变量
    currentMode = currentMode;  // 或根据需要重置为默认设置
    playerCount = getPlayerCount();  // 根据是否为双人模式重新计算玩家数

    // 重新加载背景或其他资源如果需要
    //background = loadImage("PrototypeImages/background1.png");
    
    // 重置游戏状态到开始或其他适当的状态
    state = GameState.START;
  }
  
  void dispalyIntroduction(){
  if(state == GameState.INTRO) {
    image(introVideo, width / 2, height / 2, width, height); 
    if (introVideo.time() == introVideo.duration()) { 
      introVideo.stop(); 
      state = GameState.START;  
      controller.displayStartScreen();
    }
  }
}

  //Start screen display
  void displayStartScreen(){
      cursor(planecursor);
      currentButton = Button.NONE;
      background(background_start);
      
      textSize(30);
      text("Current Players: " + playerCount, width/2, 250);
      text("Current Difficulty: " + currentMode, width/2, 300);
      
      //navigation buttons
      createButton(width/2, 400, 350, 100, Button.NAMEB);
      fill(255);
      textSize(50);
      text("-START-", width/2, 415);
  
      createButton(width/2, 500, 350, 100, Button.INSTRUCTIONB);
      fill(255);
      textSize(50);
      text("-INSTRUCTIONS-", width/2, 515);
  
      createButton(width/2, 600, 350, 100, Button.MODEB);
      fill(255);
      textSize(50);
      text("-SETTINGS-", width/2, 615);
      
      createButton(width/2, 700, 350, 100, Button.HIGHSCOREB);
      fill(255);
      textSize(50);
      text("-LEADERBOARD-", width/2, 715);
  
      createButton(width/2, 800, 350, 100, Button.EXITB);
      fill(255);
      textSize(50);
      text("-EXIT-", width/2, 815);
      
      //game title
      text("Shooting Game Prototype Title", width/2, 150);
  }
  
  //Name Entry Screen display
  void displayNamingScreen(){
    cursor(planecursor);
    background(background_start);
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
    
    //navigation buttons
    createButton(2*width/3, 800, 250, 100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("CONFIRM", 2*width/3, 815);
    
    createButton(width/3, 800, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("BACK", width/3, 815);
  }
  
  void displayInfoScreen(){
    cursor(planecursor);
    background(background_start);
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
    Player examplePlayer = new Player(0);
    examplePlayer.display();

    for (int i = 0; i < 3; i++) {
      PlayerBullet examplePlayerBullet = new PlayerBullet(width/2, 230 + i*40, 0);
      examplePlayerBullet.display();
    }

    // details on lives and pausing game text
    //for (int i = 0; i < 3; i++) {
    //  image(lives, width/10 + i*40, 500);
    //}
    
    textAlign(LEFT);
    textSize(30);
    fill(255,0,0);
    text("Player life points count - keep these above 0 to stay alive! ", width/10+3*40, 510);

    //image(lives, width/10 + 40, 560);
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
  
  void displayEnemyScreen(){
        cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;

    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);

    stroke(100);
    line(20, 150, width-20, 150);

    //display enemy images
    Enemy basicEnemy = new Enemy(width/6, 250);
    basicEnemy.display();

    //EnemyBullet exampleEnemyBullet = new EnemyBullet(width*.51, 295, 0);
    //exampleEnemyBullet.display();

    //EnemyTwo spaceshipEnemy = new EnemyTwo(width/6, 450);
    //spaceshipEnemy.display();

    //Stalker exampleStalker = new Stalker(width/6,675,null,null);
    //exampleStalker.display();

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
    //Laser exampleEnemyLaser = new Laser(35, -75, false);
    //exampleEnemyLaser.display();
  }
  
  void displaySettingsScreen(){
    cursor(planecursor);
    background(background_start);
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
  
  void displayGameOverScreen(){
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;

    textSize(50);
    text("GAME OVER!", width/2, 200);
    textSize(30);
    text("Oh no! \n You died. The aliens have won. \nBetter luck next time :(", width/2, 300);

    //display player name and score
    textSize(50);
    //text(player.name + "'s Score: " + p1score, width/2, 450);
    text(player.name + "'s Score: " + "placeholder score", width/2, 450);
    //text(player2.name + "'s Score : " + p2score, width/2 , 550);
    text(player2.name + "'s Score: " + "placeholder p2 score", width/2, 550);
    

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
  
  void displayScoreScreen(){
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;
    
    textSize(50);
    text("HIGH SCORES", width/2, 100);
    
    leaderboard.display();
    
    //navigation buttons
    createButton(width/2, 800, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 815);
  }
  
  void displayPauseScreen(){
    cursor(planecursor);
    background(background_start);
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
}
