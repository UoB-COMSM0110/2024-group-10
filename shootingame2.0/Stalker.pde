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
    if (!player.isDied) {
        if (player2 != null && isPlayer2) {
            if (!player2.isDied) {
                target = (random(0, 1) > 0.5) ? player : player2;
            } else {
                target = player;
            }
        } else {
            target = player;
        }
    } else {
        if (player2 != null && isPlayer2 && !player2.isDied) {
            target = player2;
        } else {

        }
    }
  }
}
