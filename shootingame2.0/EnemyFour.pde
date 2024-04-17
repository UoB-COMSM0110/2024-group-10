class EnemyFour extends Enemy {
  boolean left;
  
  EnemyFour(float x, float y, boolean left) {
    super(x, y);
    this.left =left;
  }
  
  void display() {
    fill(10, 175, 211);
    ellipse (x, y, 50);
  }
}
