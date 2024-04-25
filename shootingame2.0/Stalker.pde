class Stalker extends Enemy {
  
  Stalker(float x, float y) {
    super(x, y);
  }
  
  void update() {
    // Calculate direction towards the target
    float dx = player.x - x;
    float dy = player.y - y;
    
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
      x = player.x;
      y = player.y;
    } 
  }
}
