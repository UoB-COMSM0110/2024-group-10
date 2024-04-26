class Stalker extends Enemy {
  Player target;
  PImage stalker;
  Stalker(float x, float y) {
    super(x, y);
    chooseTarget();
    stalker = loadImage("PrototypeImages/stalker.png");
  }
  
  void display(){
    imageMode(CENTER);
    image(stalker, x, y, 50, 50);
  }
  
  void update() {
    // Calculate direction towards the target
    float dx = target.x - x;
    float dy = target.y - y;
    
    // Calculate distance to target
    float distance = sqrt(dx * dx + dy * dy);
    
    // Normalize direction vector
    if (distance > 0) {
      dx /= distance;
      dy /= distance;
    }

    // Move circle towards target
    if (distance > 2) {  // Only update if circle is not too close to the target
      x += dx * 2;
      y += dy * 2;
    } else {
      x = target.x;
      y = target.y;
    } 
  }

    void chooseTarget() {
    if (player2 != null && isPlayer2) {  // 如果存在第二玩家且双人模式启用
      // 随机选择追踪player1或player2
      target = (random(0, 1) > 0.5) ? player : player2;
    } else {
      target = player; // 单人模式或者player2不存在时，默认追踪player
    }
  }
}
