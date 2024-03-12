class Life {
  float x;
  float y;
  float speed;
  
  Life(float startX, float startY, float speed) {
    this.x = startX;
    this.y = startY;
    this.speed = speed;
  }

  void update() {
    this.y += this.speed;
  }

  void display() {
    image(lives, x, y);
  }
  
  boolean offscreen() {
    return (this.y > height);
  }

  






}
