import processing.video.*;
Player player;
Player player2;
Controller controller;
Leaderboard leaderboard;
GameState state;
Movie introVideo;
ArrayList<EnemyBullet> enemyBullets;
ArrayList<PlayerBullet> playerBullets;
ArrayList<Enemy> enemies;
ArrayList<EnemyBullet> enemyBulletsToRemove;
ArrayList<PlayerBullet> playerBulletsToRemove;
ArrayList<Enemy> enemiesToRemove;
PImage background;
PImage background_start;
String currentMode = "HARD";
GameState lastState = GameState.START;
boolean scoreAdded = false;
boolean is2Player = false;
int playerCount;
PImage enemy1_bullet;




Player playerToName;

void settings() {
  size(1000, 1000, P2D);
}

void setup() {
  introVideo = new Movie(this, "intro1.mp4");
  introVideo.loop();
  background_start = loadImage("PrototypeImages/background_start.png");
  state = GameState.INTRO;
  background = loadImage("PrototypeImages/background1.png");
  controller = new Controller();
  leaderboard = new Leaderboard(); 
  player = new Player(1);
  player2 = new Player(2);
  enemyBullets = new ArrayList<EnemyBullet>();
  playerBullets = new ArrayList<PlayerBullet>();
  enemies = new ArrayList<Enemy>();
  enemyBulletsToRemove = new ArrayList<EnemyBullet>();
  playerBulletsToRemove = new ArrayList<PlayerBullet>();
  enemiesToRemove = new ArrayList<Enemy>();
  
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
  

}

void draw() {
  playerCount = getPlayerCount();
  if(state == GameState.INTRO) controller.dispalyIntroduction();
  if(state == GameState.START) controller.displayStartScreen();
  if(state == GameState.NAMEENTRY) controller.displayNamingScreen();
  if(state == GameState.PLAYING) controller.campaignMode();
  if(state == GameState.PAUSE) controller.displayPauseScreen();
  if(state == GameState.MODESELECT) controller.displaySettingsScreen();
  if(state == GameState.INSTRUCTIONS) controller.displayInfoScreen();
  if(state == GameState.ENEMYINFO) controller.displayEnemyScreen();
  if(state == GameState.HIGHSCORE) controller.displayScoreScreen();
  
  if (state != lastState && state == GameState.FINISHED) {
      scoreAdded = false;  // 状态变为FINISHED时重置
  }
  lastState = state;  // 更新上一个状态

  if(state == GameState.FINISHED) {
    if (!scoreAdded) {  // 假设scoreAdded是一个防止多次添加的标志
        if (leaderboard.isHighScore(player.score)) { // 检查是否为高分
          leaderboard.addScore(player.name, player.score);
          scoreAdded = true; // 设置标志
        }
    }
    controller.displayGameOverScreen();
  }
}

void keyPressed() {
  if(state == GameState.PLAYING){
    //if (key == ESC) {key = 0; state = GameState.PAUSE;}
    player.keyPressed();
  }
  
  if (state == GameState.NAMEENTRY){
  //use TAB to swap which player name is changed
     if(key== TAB && is2Player){
       if (playerToName == player){
         playerToName = player2;
       }
       else if (playerToName == player2){
         playerToName = player;
       }
     }
     //defaults to player 1 name input if not 2 player mode
     if(!is2Player){
       playerToName = player;
     }
     
     //add or delete char depending on input key
     playerToName.alterName();
  }
}

void keyReleased() {
  if(state == GameState.PLAYING) player.keyReleased();
}

void mousePressed(){
  // menu navigation button clicks:
  if (currentButton == Button.EXITB)
  {
    exit();
  }
  else if (currentButton == Button.GAMEB){
    state = GameState.PLAYING;
  }
  else if (currentButton == Button.STARTB){
    controller.resetGame(); 
    state = GameState.START;
  }
  else if (currentButton == Button.INSTRUCTIONB){
    state = GameState.INSTRUCTIONS;
  }
  else if (currentButton == Button.ENEMYB){
    state = GameState.ENEMYINFO;
  }
  else if (currentButton == Button.MODEB){
    state = GameState.MODESELECT;
  }
  else if (currentButton == Button.NAMEB) { 
    controller.resetGame();
    state = GameState.NAMEENTRY;
  }
  else if (currentButton == Button.HIGHSCOREB) {
    state = GameState.HIGHSCORE;
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

void movieEvent(Movie m) {
  m.read();
}

int getPlayerCount(){
    if(is2Player){
      return 2;
    }
    else{
      return 1;
    }
}
