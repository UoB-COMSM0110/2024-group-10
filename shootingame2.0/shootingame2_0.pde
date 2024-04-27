//import processing.video.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>//
Player player;
Player player2;
Controller controller;
Leaderboard leaderboard;
GameState state;
//Movie introVideo;
ArrayList<EnemyBullet> enemyBullets;
ArrayList<PlayerBullet> playerBullets;
ArrayList<PlayerBullet> playerBullets2;
ArrayList<Enemy> enemies;
ArrayList<EnemyBullet> enemyBulletsToRemove;
ArrayList<PlayerBullet> playerBulletsToRemove;
ArrayList<PlayerBullet> playerBulletsToRemove2;
ArrayList<Enemy> enemiesToRemove;
ArrayList<Object> objectsToReomve;
ArrayList<Object> objects;
PImage background;
PImage background_start;
PImage background_boss;
String currentMode = "HARD";
GameState lastState = GameState.START;
GameState previousState;
boolean scoreAdded = false;
public static boolean is2Player = false;
int playerCount;
PImage enemy1_bullet;
PImage me_bullet;
PImage[] introFrames;
int currentFrameIndex = 0;
int frameChangeInterval = 1; 
int frameCounter = 0;
PImage enemy_background1;
PImage enemy_background2;
PImage enemy_background3;
PImage enemy_background4;

Player playerToName;
EnemyTest enemyTest;



void settings() {
  size(1000, 1000, P2D);
}

void setup() {
  thread("loadResources");
  //introVideo = new Movie(this, "intro1.mp4");
  //introVideo.loop();
  background_start = loadImage("PrototypeImages/background_start.png");
  //state = GameState.INTRO;
  state = GameState.INTRO;
  background = loadImage("PrototypeImages/background1.png");
  background_boss = loadImage("PrototypeImages/background_boss.png");
  controller = new Controller();
  leaderboard = new Leaderboard();
  player = new Player(1);
  player2 = new Player(2);
  enemyBullets = new ArrayList<EnemyBullet>();
  playerBullets = new ArrayList<PlayerBullet>();
  playerBullets2 = new ArrayList<PlayerBullet>();
  enemies = new ArrayList<Enemy>();
  enemyBulletsToRemove = new ArrayList<EnemyBullet>();
  playerBulletsToRemove = new ArrayList<PlayerBullet>();
  playerBulletsToRemove2 = new ArrayList<PlayerBullet>();
  enemiesToRemove = new ArrayList<Enemy>();
  objects = new ArrayList<Object>();
  objectsToReomve = new ArrayList<Object>();
  enemy_background1 = loadImage("PrototypeImages/enemy_bg1.png");
  enemy_background2 = loadImage("PrototypeImages/enemy_bg2.png");
  enemy_background3 = loadImage("PrototypeImages/enemy_bg3.png");
  enemy_background4 = loadImage("PrototypeImages/enemy_bg4.png");
  
   //bgm
  minim = new Minim(this);
  bgm = minim.loadFile("PrototypeBgm/bgm_game_test.mp3"); 
  bossbgm = minim.loadFile("PrototypeBgm/bossbgm.mp3"); 
  alarm = minim.loadFile("PrototypeBgm/alarm.mp3"); 
  glass = minim.loadFile("PrototypeBgm/glasscrack.mp3"); 
  shatter = minim.loadFile("PrototypeBgm/glassbreak.mp3");
  gameoverbgm = minim.loadFile("PrototypeBgm/gameover.mp3");
  winbgm = minim.loadFile("PrototypeBgm/victorysfx.mp3");
  introbgm = minim.loadFile("PrototypeBgm/intro.mp3");
  menubgm = minim.loadFile("PrototypeBgm/menubgm.mp3");

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
  //Set naming screen to name player 1 first
  playerToName = player;

  enemy1_bullet = loadImage("PrototypeImages/enemy1_bullet.png");
  me_bullet = loadImage("PrototypeImages/me_bullet.png");
  
      //test
    enemyTest = new EnemyTest(this); 
    enemyTest.testIsHit();
    enemyTest.testHitPlayer(); 
}

void loadResources() {
   introFrames = new PImage[209]; 
  for (int i = 0; i < introFrames.length; i++) {
    introFrames[i] = loadImage("PrototypeImages/frame/" + (i + 1) + ".png");
  }
}

void draw() {
  //println(playerCount+"------"+is2Player);
  playerCount = getPlayerCount();
  if (state == GameState.INTRO) controller.dispalyIntroduction();
  if (state == GameState.START) controller.displayStartScreen();
  if (state == GameState.NAMEENTRY) controller.displayNamingScreen();
  if (state == GameState.PLAYING) controller.campaignMode();
  if (state == GameState.PAUSE) controller.displayPauseScreen();
  if (state == GameState.MODESELECT) controller.displaySettingsScreen();
  if (state == GameState.INSTRUCTIONS) controller.displayInfoScreen();
  if (state == GameState.ENEMYINFO) controller.displayEnemyScreen();
  if (state == GameState.ENEMYINFO2) controller.displayEnemy2ndScreen();
  if (state == GameState.HIGHSCORE) controller.displayScoreScreen();
  if (state == GameState.TRANSITION) controller.bossTransition();
  if (state == GameState.BOSS) controller.bossFight();


  if (state != lastState && (state == GameState.FINISHED || state == GameState.VICTORY)) {
    scoreAdded = false;  // 状态变为FINISHED时重置
    if (!scoreAdded) {  // 假设scoreAdded是一个防止多次添加的标志
      if (leaderboard.isHighScore(player.score)) { // 检查是否为高分
        leaderboard.addScore(player.name, player.score);
        scoreAdded = true; // 设置标志
      }
    }

    scoreAdded = false;  // 状态变为FINISHED时重置
    if (!scoreAdded) {  // 假设scoreAdded是一个防止多次添加的标志
      if (is2Player) {
        if (leaderboard.isHighScore(player2.score)) { // 检查是否为高分
          leaderboard.addScore(player2.name, player2.score);
          scoreAdded = true; // 设置标志
        }
      }
    }
  }
  lastState = state;  // 更新上一个状态

  if (state == GameState.FINISHED) controller.displayGameOverScreen();
  if (state == GameState.VICTORY) controller.displayVictoryScreen();
  
  setAudio();

  
}

void keyPressed() {

  if (state == GameState.PLAYING || state == GameState.BOSS) {
    if (key == ESC) {
      key = 0;
      state = GameState.PAUSE;
      player.stopMotion();
      player2.stopMotion();
    }
    if (keyCode == LEFT) player. movingLeft = true;
    if (keyCode == RIGHT) player.movingRight = true;
    if (keyCode == UP) player.movingUp = true;
    if (keyCode == DOWN) player.movingDown = true;
    if (key == 'M' || key == 'm') player.shootingMissle = true;
    if (key == ' ') player.isShooting = true;


    if (is2Player) {

      if (key == 'a' || key == 'A') {
        player2.movingLeft = true;
      }
      if (key == 'd' || key == 'D') player2.movingRight = true;
      if (key == 'w' || key == 'W') player2.movingUp = true;
      if (key == 's' || key == 'S')player2. movingDown = true;
      if (key == 'F' || key == 'f') player2.isShooting = true;
      if (key == 'G' || key == 'g') player2.shootingMissle = true;
    }
  }

  if (key == ESC) key = 0;

  if (state == GameState.NAMEENTRY) {
    //use TAB to swap which player name is changed
    if (key== TAB && is2Player) {
      if (playerToName == player) {
        playerToName = player2;
      } else if (playerToName == player2) {
        playerToName = player;
      }
    }
    //defaults to player 1 name input if not 2 player mode
    if (!is2Player) {
      playerToName = player;
    }

    //add or delete char depending on input key
    playerToName.alterName();
  }
}

void keyReleased() {
  if (state == GameState.PLAYING || state == GameState.BOSS) {
    if (keyCode == LEFT) player.movingLeft = false;
    if (keyCode == RIGHT) player.movingRight = false;
    if (keyCode == UP) player.movingUp = false;
    if (keyCode == DOWN) player.movingDown = false;
    if (key == 'M' || key == 'm')player. shootingMissle = false;
    if (key == ' ') {
      player.isShooting = false;
      player. isFirstBullet = true;
    }
    if (is2Player) {
      if (key == 'a' || key == 'A') player2.movingLeft = false;
      if (key == 'd' || key == 'D') player2.movingRight = false;
      if (key == 'w' || key == 'W') player2.movingUp = false;
      if (key == 's' || key == 'S') player2.movingDown =false;

      if (key == 'G' || key == 'g')player. shootingMissle = false;
      if (key == 'F' || key == 'f') {
        player2. isShooting = false;
        player2.isFirstBullet = true;
      }
    }
  }
}

void mousePressed() {
  // menu navigation button clicks:
  if (currentButton == Button.EXITB)
  {
    exit();
  } else if (currentButton == Button.GAMEB) {
    state = GameState.PLAYING;
    controller.startFrame = frameCount;
    controller.hasBoss = false;
  } else if (currentButton == Button.STARTB) {
    controller.resetGame();
    state = GameState.START;
  } else if (currentButton == Button.INSTRUCTIONB) {
    state = GameState.INSTRUCTIONS;
  } else if (currentButton == Button.ENEMYB) {
    state = GameState.ENEMYINFO;
  }else if (currentButton == Button.ENEMY2B) {
    state = GameState.ENEMYINFO2;
  }
  else if (currentButton == Button.MODEB) {
    state = GameState.MODESELECT;
  } else if (currentButton == Button.NAMEB) {
    controller.resetGame();
    state = GameState.NAMEENTRY;
  } else if (currentButton == Button.HIGHSCOREB) {
    state = GameState.HIGHSCORE;
  }else if (currentButton == Button.RETURNB) {
    state = previousState;
  }
  // mode select button clicks:
  else if (currentButton == Button.EASYB) {
    currentMode = "EASY";
  } else if (currentButton == Button.HARDB) {
    currentMode = "HARD";
  } else if (currentButton == Button.ONEPLAYERB) {
    is2Player = false;
  } else if (currentButton == Button.TWOPLAYERB) {
    player2.isPlayer2=true;
    for (Enemy enemy : enemies) {
        enemy.isPlayer2 = true;
    }
    is2Player = true;
  }
}

/*void movieEvent(Movie m) {
  m.read();
}*/

void setAudio(){
  
    if (!bgm.isPlaying() && state == (GameState.PLAYING)) {
      bgm.loop();       
  }  else  if (state != GameState.PLAYING) {
      bgm.pause(); 
      if (state != GameState.PAUSE) bgm.rewind(); 
  }
  
  if (!bossbgm.isPlaying() && (state == GameState.TRANSITION || state == GameState.BOSS)){
        bossbgm.setGain(-5);
        bossbgm.loop();
  } else if (state != GameState.TRANSITION && state != GameState.BOSS){
        bossbgm.pause(); 
        if (state != GameState.PAUSE) bossbgm.rewind(); 
  }

  if (state == GameState.VICTORY){
        winbgm.play();
  } else{
        winbgm.pause(); 
        winbgm.rewind();
  }
  
  if (state == GameState.FINISHED){
        gameoverbgm.play();
  } else{
        gameoverbgm.pause(); 
        gameoverbgm.rewind();
  }
  
  if (!menubgm.isPlaying() && state != GameState.FINISHED && state != GameState.VICTORY 
      && state != GameState.PLAYING && state != GameState.TRANSITION && state != GameState.BOSS 
      && state != GameState.INTRO && state != GameState.PAUSE ){
        menubgm.loop();
  } else if (state == GameState.PLAYING){
        menubgm.pause();
        menubgm.rewind();
  }
}


int getPlayerCount() {
  if (is2Player) {
    return 2;
  } else {
    return 1;
  }
}
