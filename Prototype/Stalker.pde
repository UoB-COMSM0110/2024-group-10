class Stalker extends Target {
    Player player;
    PImage imgStalker;

    Stalker(float x, float y, Player player) {
        super(x, y); 
        this.player = player;
        imgStalker = loadImage("PrototypeImages/stalker.png");
    }

    @Override
    void update() {
      PVector direction = PVector.sub(new PVector(player.x, player.y), new PVector(x, y));
      
      direction.normalize();
      direction.mult(speed);
      
      PVector velocity = PVector.add(new PVector(0, 0), direction);
      x += velocity.x;
      y += velocity.y;
      
     // Shoot bullet
      if (frameCount % 60 == 0) {
        targetBullets.add(new Bullet(x, y, false));
      }
    }
    
    @Override
    void display() {
      imageMode(CENTER);
     
      image(imgStalker, x, y);
   
     }
}
