Player player;
Controller controller;
GameState state;
ArrayList<EnemyBullet> enemyBullets;
ArrayList<PlayerBullet> playerBullets;
ArrayList<Enemy> enemies;
ArrayList<EnemyBullet> enemyBulletsToRemove;
ArrayList<PlayerBullet> playerBulletsToRemove;
ArrayList<Enemy> enemiesToRemove;

void settings() {
  size(750, 1000);
}

void setup() {
  state = GameState.PLAYING;
  controller = new Controller();
  player = new Player();
  enemyBullets = new ArrayList<EnemyBullet>();
  playerBullets = new ArrayList<PlayerBullet>();
  enemies = new ArrayList<Enemy>();
  enemyBulletsToRemove = new ArrayList<EnemyBullet>();
  playerBulletsToRemove = new ArrayList<PlayerBullet>();
  enemiesToRemove = new ArrayList<Enemy>();
}

void draw() {
  if(state == GameState.PLAYING) controller.campaignMode();
  
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}

void test(){
}
