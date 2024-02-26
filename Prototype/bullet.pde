class Bullet {
  float x, y;
  float speed = 3;
  boolean isPlayer;
  float angle = random(0, TWO_PI);
  
  Bullet(float x, float y, boolean isPlayer) {
    this.x = x;
    this.y = y;
    this.isPlayer = isPlayer;
  }
  
  void update() {
    if (isPlayer) y -= speed;
    else{
      y += cos(angle) * speed;
      x += sin(angle) * speed;
    }
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
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
  
  Laser (float x, float y, boolean isPlayer) {
    super(x, y, isPlayer);
  }
  
  void display() {
    fill(150, 180, 100);
    rect(x, y, 10, 100);
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
