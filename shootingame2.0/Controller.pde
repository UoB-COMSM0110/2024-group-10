class Controller {
  int lastFrame = frameCount;
  int startFrame = frameCount;
  int enemyTwoNumber = 0;
  boolean left;
  boolean hasBoss = false;
  boolean isHard;

  void campaignMode() {
    int currentFrame = frameCount;

    noCursor();
    background(background);
    if (!player.isDied) {
      player.update();
      player.display();
      
    }



    stroke(0);

    //Generate basic enemies
    if (frameCount % 300 ==0) {
      Enemy enemy = new Enemy(random(25, 725), 25);
      enemies.add(enemy);
    }

    if (currentFrame - startFrame >= 600) {
      //Generate EnemyTwo
      if (frameCount % 600 == 0) {
        left = random(1) > 0.5 ? true : false;
        generateFirstEnemyTwo(left);
      }
      if (enemyTwoNumber < 5) generateEnemyTwo(left);
    }

    if (currentFrame - startFrame >= 1200) {
      //Generate EnemyThree
      if (frameCount % 600 ==0) {
        EnemyThree enemy = new EnemyThree();
        enemies.add(enemy);
      }
    }

    //Generate EnemyFour
    if (currentFrame - startFrame >= 1800) {
      if (frameCount % 300 ==0) {
        EnemyFour enemyOne = new EnemyFour(350, 150, true );
        EnemyFour enemyTwo = new EnemyFour(300, 150, true );
        EnemyFour enemyThree = new EnemyFour(400, 150, false );
        EnemyFour enemyFour = new EnemyFour(450, 150, false );

        enemies.add(enemyOne);
        enemies.add(enemyTwo);
        enemies.add(enemyThree);
        enemies.add(enemyFour);
      }
    }
    
    if (frameCount % 60 ==0) {
        Stalker stalker;
        if(random(0,1) > 0.5) stalker = new Stalker(20,20);
        else stalker = new Stalker(980,100);
        enemies.add(stalker);
     }

    //Update status for each enemy
    for (Enemy enemy : enemies) {
      if (!enemy.toBeRemove) {
        enemy.update();
        enemy.display();
        if(enemy.hitPlayer(player)) {
          player.lives -= 1;
          enemy.toBeRemove = true;
        }
        if(enemy.hitPlayer(player2)) {
          player2.lives -= 1;
          enemy.toBeRemove = true;
        }
      } else enemiesToRemove.add(enemy);
    }

    //Update the status for each player's bullet
    for (PlayerBullet bullet : playerBullets) {
      bullet.update();
      bullet.display();
      for (Enemy enemy : enemies) {
        if (enemy.isHit(bullet)) {
          player.score += 1;
          player.energy += 10;
          bullet.toBeRemove = true;
          break;
        }
      }
      if (bullet.toBeRemove) playerBulletsToRemove.add(bullet);
    }

    for (PlayerBullet bullet : playerBullets2) {
      bullet.update();
      bullet.display();
      for (Enemy enemy : enemies) {
        if (enemy.isHit(bullet)) {
          player2.score += 1;
          player2.energy += 10;
          bullet.toBeRemove = true;

          break;
        }
      }
      if (bullet.toBeRemove) playerBulletsToRemove2.add(bullet);
    }

    for (EnemyBullet bullet : enemyBullets) {
      bullet.update();
      bullet.display();
      if (bullet.hitPlayer(player)) {
        player.lives -= 1;  // Decrement player's lives
        bullet.toBeRemove = true;  // Mark bullet for removal

        if (is2Player) {
          if (player.lives <= 0) {
            player.isDied=true;
          }
          if ((player.lives <= 0) &&((player2.lives <= 0))) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        } else {
          if (player.lives <= 0) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        }
      }
      if (bullet.toBeRemove) enemyBulletsToRemove.add(bullet);
    }

    if (!player2.isDied) {
      for (EnemyBullet bullet : enemyBullets) {
      bullet.update();
      bullet.display();
      if (bullet.hitPlayer(player2)) {
        player2.lives -= 1;  // Decrement player's lives
        bullet.toBeRemove = true;  // Mark bullet for removal

        if (is2Player) {
          if (player2.lives <= 0) {
            player2.isDied=true;
          }
          if ((player.lives <= 0) &&((player2.lives <= 0))) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        } else {
          if (player.lives <= 0) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        }
      }
      if (bullet.toBeRemove) enemyBulletsToRemove.add(bullet);
      }
    }


    if (currentFrame - startFrame >= 6000) {
      for (Enemy enemy : enemies) {
        enemy.toBeRemove = true;
      }
      for (EnemyBullet bullet : enemyBullets) {
        bullet.toBeRemove = true;
      }
      state = GameState.BOSS;
    }
    
    for(Object object : objects) {
      if (!object.toBeRemove) {
        object.update();
        object.display();
        if(object.isHit(player)) {
          object.toBeRemove = true;
          player.hitObject(object);
        }
        if(object.isHit(player2)) {
          object.toBeRemove = true;
          player2.hitObject(object);
        }
      } else objectsToReomve.add(object);
    }

    //Remove all the collected objects
    for (PlayerBullet bulletToRemove : playerBulletsToRemove) {
      playerBullets.remove(bulletToRemove);
    }

    for (PlayerBullet bulletToRemove : playerBulletsToRemove2) {
      playerBullets2.remove(bulletToRemove);
    }

    for (EnemyBullet bulletToRemove : enemyBulletsToRemove) {
      enemyBullets.remove(bulletToRemove);
    }

    for (Enemy enemyToRemove : enemiesToRemove) {
      if(random(0,1) > 0.5) {
        Object object = new Object(enemyToRemove.x, enemyToRemove.y, true, false);
        objects.add(object);
      }
      else{
        Object object = new Object(enemyToRemove.x, enemyToRemove.y, false, true);
        objects.add(object);
      }
      enemies.remove(enemyToRemove);
    }
    
    for (Object objectToRemove : objectsToReomve) {
      objects.remove(objectToRemove);
    }
    
    enemyBulletsToRemove.clear();
    playerBulletsToRemove.clear();
    enemiesToRemove.clear();
    objectsToReomve.clear();

    if (is2Player) {
      if (!player2.isDied) {
        player2.update();
        player2.display();
      }
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
    if (currentFrame - lastFrame > 60) {
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
    playerBullets2.clear();
    enemyBulletsToRemove.clear();
    playerBulletsToRemove.clear();
    enemiesToRemove.clear();
    objects.clear();
    objectsToReomve.clear();

    // 重置游戏状态变量
    currentMode = currentMode;  // 或根据需要重置为默认设置
    playerCount = getPlayerCount();  // 根据是否为双人模式重新计算玩家数

    // 重新加载背景或其他资源如果需要
    //background = loadImage("PrototypeImages/background1.png");

    // 重置游戏状态到开始或其他适当的状态
    state = GameState.START;
  }

  void dispalyIntroduction() {
    if (state == GameState.INTRO) {
      image(introVideo, width / 2, height / 2, width, height);
      if (introVideo.time() == introVideo.duration()) {
        introVideo.stop();
        state = GameState.START;
        controller.displayStartScreen();
      }
    }
  }

  //Start screen display
  void displayStartScreen() {
    cursor(planecursor);
    currentButton = Button.NONE;
    background(background_start);

    textSize(30);
    fill(127, 198, 199);
    fill(255);
    //text("Current Players: " + playerCount, width/2, 250);
    text("Current Players: ", width/2, 250);
    text("Current Difficulty: " + currentMode, width/2, 300);

    Player ExamplePlayer = new Player(0);
    image(ExamplePlayer.me, width*.63, 230, 50, 50);
    if (is2Player) {
      image(ExamplePlayer.me, width*.63 + 60, 230, 50, 50);
    }

    PImage exampleStalker = loadImage("PrototypeImages/stalker.png");
    if (currentMode == "HARD") {
      image(exampleStalker, width*.7, 290, 50, 50);
    }

    PImage jellyEnemy = loadImage("PrototypeImages/enemies/enemy1.png");
    image(jellyEnemy, width*.17, 120, 50, 50);
    image(jellyEnemy, width*.11, 150, 50, 50);
    image(jellyEnemy, width*.83, 120, 50, 50);
    image(jellyEnemy, width*.89, 150, 50, 50);
    //image(jellyEnemy, width*.5 , 50);
    //image(jellyEnemy, width*.5 , 920);

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
    fill (255, 195, 0) ;
    //fill(255);
    text("SPACE SWARM SHOOTERS!", width/2, 150);
    fill (255, 50) ;
    text("SPACE SWARM SHOOTERS!", width/2, 153);
  }

  //Name Entry Screen display
  void displayNamingScreen() {
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
    fill(255, 0, 255);
    text(player.name, width/2, 450);

    // adds player 2 part if in 2 player mode
    if (is2Player) {
      fill(255);
      textSize(50);
      text("Player 2 name:", width/2, 550);
      textSize(30);
      text("(Press TAB to switch player)", width/2, 150);
      textSize(40);
      text("Currently naming:", width/3, 250);
      fill(255, 0, 255);
      text("Player " + playerToName.playerNumber, width*.57, 250);
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
  //Player instructions display screen
  void displayInfoScreen() {
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;

    //create backdrop for text readability
    stroke(50, 255);
    strokeWeight(4);
    fill(2, 30, 54, 120);
    rect(width/2, height/2, width*9, 660);

    fill(255);
    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);

    //stroke(100);
    //line(20, 150, width-20, 150);

    //player controls visualisation
    textSize(30);
    //fill (255, 195, 0) ;
    fill(70,240,161);
    text("Shoot", width/3, 410);
    fill(255);
    text("Move", 2*width/3, 410);
    fill(255);
    text("You", width/2, 420);

    text("Player 1", width/10, 250);
    text("Player 2", width/10, 350);

    // TODO PLACEHOLDER TEXT - needs images from art team
    textSize(15);

    //spacebar img for p1 shoot controls
    PImage spacebar = loadImage("PrototypeImages/keys/space.gif");
    image(spacebar, width/3, 250, 150, 50);

    //up left down right keys imgs for p1 move controls
    PImage dir = loadImage("PrototypeImages/keys/dirkeys.png");
    image(dir, 2*width/3, 230, 150, 100);

    //2nd player control images
    PImage fkey = loadImage("PrototypeImages/keys/f.png");
    image(fkey, width/3, 340, 50, 50);
    PImage wasd = loadImage("PrototypeImages/keys/wasd.png");
    image(wasd, 2*width/3, 330, 150, 100);

    //esc button img for pause instructions
    PImage esc = loadImage("PrototypeImages/keys/esc.gif");
    image(esc, width/8, 620, 70, 50);

    //missile img for missile controls instruction
    PImage mkey = loadImage("PrototypeImages/keys/m.png");
    textSize(50);
    text("+", 240, 750);
    textSize(30);
    text("p1:", 300, 720);
    image(mkey, 350, 710, 50, 50);

    PImage gkey = loadImage("PrototypeImages/keys/g.png");
    text("p2:", 300, 770);
    image(gkey, 350, 760, 50, 50);

    //player spaceship and bullets visualisation
    Player examplePlayer = new Player(0);
    image(examplePlayer.me, width/2, 360, 50, 50);

    for (int i = 0; i < 3; i++) {
      PlayerBullet examplePlayerBullet = new PlayerBullet(width/2, 230 + i*40, 0, 0);
      examplePlayerBullet.display();
    }

    // details on lives and pausing game text
    PImage lives = loadImage("PrototypeImages/lives.png");
    for (int i = 0; i < 3; i++) {
      image(lives, width/12 + i*40, 500, 40, 30);
    }

    textAlign(LEFT);
    textSize(30);
    fill(255, 0, 0);
    text("Player life points count - keep these above 0 to stay alive! ", width/10+3*40, 510);

    PImage star = loadImage("PrototypeImages/power.png");
    image(star, width/6-20, 555, 30, 30);
    image(lives, width/12+20, 560, 40, 30);
    text("Collect falling hearts to heal", width/10+3*40, 570);
    fill(253,198,91);
    text("/ stars to power up!", 580, 570);


    fill(255);
    text("Press ESC to pause game", width/10+3*40, 630);
    text("Energy bar. Charge up to full and \nPress -M- (player 1)\n        or -G- (player 2) \nto launch a special move!", 450, 700);

    image(examplePlayer.energyImages[10], 120, 740, 150, 18);


    textFont(mainFont);
    textAlign(CENTER);

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
  //Enemy info display
  void displayEnemyScreen() {
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;
    
    stroke(50, 255);
    strokeWeight(4);
    fill(2, 30, 54, 200);
    rect(width/2, height/2, width*9, 660);

    fill(255);

    textSize(30);
    text("Aliens are attacking!! \nShoot the enemies to defeat them and gain points \nAvoid enemy attacks and survive until the end!", width/2, 50);

    //stroke(100);
    //line(20, 150, width-20, 150);

    //display enemy images
    Enemy basicEnemy = new Enemy(width/6, 250);
    basicEnemy.display();

    //EnemyBullet exampleEnemyBullet = new EnemyBullet(width*.51, 295, 0);
    //exampleEnemyBullet.display();

    PImage purpleEnemy = loadImage("PrototypeImages/enemies/enemy2.png"); 
    image(purpleEnemy, width/6, 450);
    
    //EnemyThreeBoss spaceshipEnemy = new EnemyThreeBoss(width/6, 450);
    //spaceshipEnemy.display();

    PImage exampleStalker = loadImage("PrototypeImages/stalker.png");    
    image(exampleStalker, width/6, 700);
    

    //display enemy description text
    textFont(infoFont);
    textSize(20);
    textAlign(LEFT);
    fill(0, 139, 208, 255);
    text("Jellyjellies like to float through life like they will your computer screen.\nThey do not think much on account of having no brain and their philosophy\nto life and war is 'random bullets go!'\nBe careful not to touch them they sting!\n\nAttack type: Jelly Shots            \n(Warning: do not consume. The developers of this game will not be held liable)", width/3.5, 200);
    //fill(81, 75, 116, 255);
    //text("Extra-purrestrials have long told legends of 'humans'. Beings who wielded a \ntechnology always just out of the grasp of cat-kind, tormenting their \nancestors for amusement and so called 'likes'. Well, now their descendants\nare here to return the favour. \n\nAttack type: Pointier Lasers \n\nNote: Has developed advanced defensive technologies to protect their \nfluffy tummies", width/3.5, 400);
    fill(181,47,205);
    text("\nOctotos love line dancing. When performing they throw out \nglitter in a beautiful fan shape to their adoring audiences. \nUnfortunately that glitter is rather lethal to humans. \nIt's okay though they never appreciated the Octoto Tango anyway. \n\nAttack type: Glitter Bomb-ardment", width/3.5, 400);
    fill(255, 0, 0);
    text("Huggoctopuses love to chase all the shiny things and hold them close\nto their heart. \nIncluding your ship. \n\nAttack type: Free hugs :)", width/3.5, 650);
    textFont(mainFont);
    textAlign(CENTER);

    //line(20, 830, width-20, 830);

    // navigation buttons
    createButton(width/4, 900, 250, 100, Button.INSTRUCTIONB);
    fill(255);
    textSize(40);
    text("PLAYER INFO", width/4, 915);

    createButton(width/2, 900, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 915);

  }
  //Settings display
  void displaySettingsScreen() {
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
  //Game over display
  void displayGameOverScreen() {
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;

    textSize(50);
    text("GAME OVER!", width/2, 200);
    textSize(30);
    text("Oh no! \n You died. The aliens have won. \nBetter luck next time :(", width/2, 300);

    //display player name and score
    textSize(50);
    text(player.name + "'s Score: " + player.score, width/2, 450);

    // adds player 2 part if in 2 player mode
    if (is2Player) {
      text(player2.name + "'s Score : " + player2.score, width/2, 550);
    }


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
  //High score display
  void displayScoreScreen() {
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;

    textSize(60);
    text("HIGH SCORES", width/2, 150);

    PImage crown = loadImage("PrototypeImages/goldcrown.png");
    image(crown, width/2, 240, 50, 50);

    leaderboard.display();

    //navigation buttons
    createButton(width/2, 800, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 815);
  }
  // Pause screen display
  void displayPauseScreen() {
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;
    imageMode(CENTER);

    //backdrop for controls visualisation
    //stroke(6,49,53);
    stroke(50, 100);
    strokeWeight(4);
    fill(2, 30, 54, 120);
    rect(width/2, height, width+100, 1100);

    // navigation buttons
    createButton(width/2, 250, 250, 100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("RESUME", width/2, 265);

    createButton(width/2, 360, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("GIVE UP", width/2, 375);

    //player controls visualisation
    textSize(30);
    fill(70,240,161);
    text("Shoot", width/3, 510);
    fill(255);
    text("Move", 2*width/3, 510);

    text("Player 1", width/10, 600);
    text("Player 2", width/10, 720);


    //spacebar img for p1 shoot controls
    PImage spacebar = loadImage("PrototypeImages/keys/space.gif");
    image(spacebar, width/3, 600, 150, 50);

    //up left down right keys imgs for p1 move controls
    PImage dir = loadImage("PrototypeImages/keys/dirkeys.png");
    image(dir, 2*width/3, 580, 150, 100);

    //2nd player control images
    PImage fkey = loadImage("PrototypeImages/keys/f.png");
    image(fkey, width/3, 710, 50, 50);
    PImage wasd = loadImage("PrototypeImages/keys/wasd.png");
    image(wasd, 2*width/3, 700, 150, 100);

    //missile img for missile controls instruction
    PImage mkey = loadImage("PrototypeImages/keys/m.png");
    textSize(50);
    text("+", 240, 850);
    image(mkey, 360, 810, 50, 50);
    textSize(30);
    text("p1:", 300, 820);

    PImage gkey = loadImage("PrototypeImages/keys/g.png");
    text("p2:", 300, 880);
    image(gkey, 360, 880, 50, 50);
    textSize(30);
    text("Energy bar. Charge up to full and \nPress -M- (player 1) or -G- (player 2) \nto launch a special move!", width/2+150, 810);
    Player examplePlayer = new Player(0);
    image(examplePlayer.energyImages[10], 120, 840, 150, 18);

    textSize(60);
    text("GAME PAUSED", width/2, 150);
  }
  //Victory screen display
  void displayVictoryScreen() {
    cursor(planecursor);
    background(background_start);
    currentButton = Button.NONE;

    textSize(60);
    text("CONGRATULATIONS!!!", width/2, 200);
    textSize(30);
    text("A winner is you! \n The aliens have been defeated and the world is saved!", width/2, 300);

    //display player final score
    textSize(50);
    // adds player 2 part if in 2 player mode
    if (is2Player) {
      text("FINAL SCORE: ", width/2, 500);
      text(player2.name +  "'s Score : " + player.score, width/2, 600);
      text(player2.name + "'s Score : " + player2.score, width/2, 700);
    } else text("FINAL SCORE: " + player.score, width/2, 500);

    //navigation buttons
    createButton(width/2, 800, 250, 100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", width/2, 815);

    PImage crown = loadImage("PrototypeImages/goldcrown.png");
    image(crown, width/2, 240, 50, 50);
  }

  void bossFight() {
    if (enemies.size() >0) {
      if (hasBoss && enemies.size() == 1) enemies.get(0).isStageTwo = true;
    }
    EnemyThreeBoss enemyThree;
    EnemyOneBoss enemyOne;

    noCursor();
    background(background);
    if (!player.isDied) {
      player.update();
      player.display();
    }

    stroke(0);

    if (!hasBoss) {
      Boss boss = new Boss(500, 200);
      enemies.add(boss);
      enemyOne = new EnemyOneBoss(200, 125);
      enemies.add(enemyOne);
      enemyOne = new EnemyOneBoss(800, 125);
      enemies.add(enemyOne);
      for (int i = 0; i < 3; i++) {
        if (i == 1) enemyThree = new EnemyThreeBoss(500, 100);
        else enemyThree = new EnemyThreeBoss(250 + i * 250, 300);
        enemies.add(enemyThree);
      }
      for (int i = 0; i < 9; i++) {
        if (i % 2 == 0) {
          enemyOne = new EnemyOneBoss(300 + i*50, 250);
          enemies.add(enemyOne);
        }
      }
      hasBoss = true;
    }

    //Update status for each enemy
    for (Enemy enemy : enemies) {
      if (!enemy.toBeRemove) {
        enemy.update();
        enemy.display();
      } else enemiesToRemove.add(enemy);
    }

    //Update the status for each player's bullet
    for (PlayerBullet bullet : playerBullets) {
      bullet.update();
      bullet.display();
      for (Enemy enemy : enemies) {
        if (enemy.isHit(bullet)) {
          player.score += 1;
          player.energy += 10;
          bullet.toBeRemove = true;

          break;
        }
      }
      if (bullet.toBeRemove) playerBulletsToRemove.add(bullet);
    }

    for (PlayerBullet bullet : playerBullets2) {
      bullet.update();
      bullet.display();
      for (Enemy enemy : enemies) {
        if (enemy.isHit(bullet)) {
          player2.score += 1;
          player2.energy += 10;
          bullet.toBeRemove = true;

          break;
        }
      }
      if (bullet.toBeRemove) playerBulletsToRemove2.add(bullet);
    }

    //Update the status for the enem'ies bullet
    for (EnemyBullet bullet : enemyBullets) {
      bullet.update();
      bullet.display();
      if (bullet.hitPlayer(player)) {
        player.lives -= 1;  // Decrement player's lives
        bullet.toBeRemove = true;  // Mark bullet for removal

        if (is2Player) {
          if (player.lives <= 0) {
            player.isDied=true;
          }
          if ((player.lives <= 0) &&((player2.lives <= 0))) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        } else {
          if (player.lives <= 0) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        }
      }
      if (bullet.toBeRemove) enemyBulletsToRemove.add(bullet);
    }

    if (!player2.isDied) {
      for (EnemyBullet bullet : enemyBullets) {
      bullet.update();
      bullet.display();
      if (bullet.hitPlayer(player2)) {
        player2.lives -= 1;  // Decrement player's lives
        bullet.toBeRemove = true;  // Mark bullet for removal

        if (is2Player) {
          if (player2.lives <= 0) {
            player2.isDied=true;
          }
          if ((player.lives <= 0) &&((player2.lives <= 0))) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        } else {
          if (player.lives <= 0) {
            state = GameState.FINISHED;  // End game if player is out of lives
          } else {
            // Optional: Trigger some effect or sound to indicate hit but not dead
          }
        }
      }
      if (bullet.toBeRemove) enemyBulletsToRemove.add(bullet);
    }
      
    }
    

    //Remove all the collected objects
    for (PlayerBullet bulletToRemove : playerBulletsToRemove) {
      playerBullets.remove(bulletToRemove);
    }
    for (PlayerBullet bulletToRemove : playerBulletsToRemove2) {
      playerBullets2.remove(bulletToRemove);
    }

    for (EnemyBullet bulletToRemove : enemyBulletsToRemove) {
      enemyBullets.remove(bulletToRemove);
    }

    for (Enemy enemyToRemove : enemiesToRemove) {
      enemies.remove(enemyToRemove);
    }
    if (is2Player) {
      if (!player2.isDied) {
        player2.update();
        player2.display();
      }
    }
  }
}
