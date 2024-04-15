class Stalker extends Target {
    PImage imgStalker;
    Player player1, player2;

    // Pass both players to the constructor
    Stalker(float x, float y, Player player1, Player player2) {
        super(x, y); 
        this.player1 = player1;
        this.player2 = player2;
        imgStalker = loadImage("PrototypeImages/stalker.png");
    }

    @Override
    void update() {
        Player target = null;
        
        if (player1.lives <= 0) {
          target = player2;
        } else if (player2.lives <= 0) {
          target = player1;
        } else {
          // Calculate distances to both players
          float distanceToPlayer1 = dist(x, y, player1.x, player1.y);
          float distanceToPlayer2 = dist(x, y, player2.x, player2.y);

          // Choose the player that's closer
          if (distanceToPlayer1 < distanceToPlayer2) {
              target = player1;
          } else {
              target = player2;
          }
        }

        // If target is not null and is alive proceed with moving and firing
        if (target != null && target.lives > 0) {
          PVector direction = PVector.sub(new PVector(target.x, target.y), new PVector(x, y));
      
          direction.normalize();
          direction.mult(speed);
      
          PVector velocity = PVector.add(new PVector(0, 0), direction);
          x += velocity.x;
          y += velocity.y;
      
          // Shoot bullet
          if (frameCount % 60 == 0) {
              targetBullets.add(new Bullet(x, y, true, target));
          }
        }  
    }
    
    @Override
    void display() {
        imageMode(CENTER);
        image(imgStalker, x, y);
    }
}
