class Enemy extends Target {
    Player player;

    Enemy(float x, float y, Player player) {
        super(x, y); 
        this.player = player;
    }

    @Override
    void update() {
      PVector direction = PVector.sub(new PVector(player.x, player.y), new PVector(x, y));
      
      direction.normalize();
      direction.mult(speed);
      
      PVector velocity = PVector.add(new PVector(0, 0), direction);
      x += velocity.x;
      y += velocity.y;
        
      // Shoot laser
      if (!isExploding && frameCount % 60 == 0) {
        lasers.add(new Laser(x, y, false));
      }
    }
}
