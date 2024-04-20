Player player;
Player player2;
Controller controller;
GameState state;
ArrayList<EnemyBullet> enemyBullets;
ArrayList<PlayerBullet> playerBullets;
ArrayList<Enemy> enemies;
ArrayList<EnemyBullet> enemyBulletsToRemove;
ArrayList<PlayerBullet> playerBulletsToRemove;
ArrayList<Enemy> enemiesToRemove;
PImage background;
PImage background_start;
String currentMode = "HARD";
boolean is2Player = false;
int playerCount;




Player playerToName;

void settings() {
  size(750, 1000);
}

void setup() {
  background_start = loadImage("PrototypeImages/background_start750.png");
  state = GameState.START;
  background = loadImage("PrototypeImages/background750.png");
  controller = new Controller();
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
  

}

void draw() {
  playerCount = getPlayerCount();
  
  if(state == GameState.START) controller.displayStartScreen();
  if(state == GameState.NAMEENTRY) controller.displayNamingScreen();
  if(state == GameState.PLAYING) controller.campaignMode();
  if(state == GameState.PAUSE) controller.displayPauseScreen();
  if(state == GameState.MODESELECT) controller.displaySettingsScreen();
  if(state == GameState.INSTRUCTIONS) controller.displayInfoScreen();
  if(state == GameState.ENEMYINFO) controller.displayEnemyScreen();
  if(state == GameState.HIGHSCORE) controller.displayScoreScreen();
  if(state == GameState.FINISHED) controller.displayGameOverScreen();
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
    //resetGame();
  }
  else if (currentButton == Button.STARTB){
    //resetGame(); 
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

int getPlayerCount(){
    if(is2Player){
      return 2;
    }
    else{
      return 1;
    }
}
