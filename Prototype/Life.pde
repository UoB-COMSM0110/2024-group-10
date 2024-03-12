class Life {
  float x;
  float y;
  float fallSpeed;
  PImage img;  

  Life(float startX, float startY, float fallSpeed) {
    this.x = startX;
    this.y = startY;
    this.fallSpeed = fallSpeed;
    this.img = lives;  // use the same image used for player lives
  }

  void update() {
    this.y += this.fallSpeed;
  }

  void display() {
    imageMode(CENTER);
    image(this.img, this.x, this.y);
  }

  boolean offscreen() {
    return (this.y > height);
  }

  boolean hits(Player p) {
    float d = dist(this.x, this.y, p.x, p.y);
    if (d < img.width/2) {
      return true;
    } else {
      return false;
    }
  }
}
