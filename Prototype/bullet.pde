class Bullet {
  float x, y;
  float speed = 3;
  boolean isPlayer;
  float angle = random(0, TWO_PI);
  PImage imgEnemyBullet;
  PImage imgMeBullet;
  
  Bullet(float x, float y, boolean isPlayer) {
    this.x = x;
    this.y = y;
    this.isPlayer = isPlayer;
    imgEnemyBullet = loadImage("PrototypeImages/enemy_bullet.png");
    imgMeBullet = loadImage("PrototypeImages/me_bullet.png");
  }
  
  void update() {
    if (isPlayer) y -= speed;
    else{
      y += cos(angle) * speed;
      x += sin(angle) * speed;
    }
  }
  
  void display() {
    if (isPlayer) {
      image(imgMeBullet, x, y); // 如果是玩家，绘制 me_bullet
    } else {
      image(imgEnemyBullet, x, y); // 如果是敌人，绘制 enemy_bullet
    }
  }
  
  boolean offscreen() {
    return y < 0 || x < 0 || y > height || x > width;
  }
  
  boolean hits(Target target) {
    float d = dist(x, y, target.x, target.y);
    return d < 15; 
  }
  
  boolean hits(TargetTwo targetTwo) {
    float d = dist(x, y, targetTwo.x, targetTwo.y);
    return d < 51; 
  }
  
  boolean hits(Player player) {
    float d = dist(x, y, player.x, player.y);
    return d < 15; 
  }
}

class Laser extends Bullet {
  PImage imgLaser;
  
  Laser (float x, float y, boolean isPlayer) {
    super(x, y, isPlayer);
     imgLaser = loadImage("PrototypeImages/laser.png");
  }
  
  void display() {
    image(imgLaser, x, y);
  }
  
  void update() {
    y += speed;
  }
  
  boolean hits(Player player) {
      return x < player.x + 5 &&
      x + 5 > player.x &&
      y < player.y + 50 &&
      y + 50 > player.y;
  }
}
