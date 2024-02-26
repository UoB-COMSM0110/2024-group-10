Player player;
ArrayList<Bullet> playerBullets;
ArrayList<Bullet> targetBullets;
ArrayList<Target> targets;
ArrayList<TargetTwo> targetsTwo;
ArrayList<Laser> lasers;
boolean gameOver = false;

void setup() {
  size(1000, 500);
  player = new Player(width / 2, height - 20);
  playerBullets = new ArrayList<Bullet>();
  targetBullets = new ArrayList<Bullet>();
  targets = new ArrayList<Target>();
  targetsTwo = new ArrayList<TargetTwo>();
  lasers = new ArrayList<Laser>();
}

void draw() {
  background(255);
  
  if (!gameOver) {
    // Update and display player
    player.update();
    player.display(); 
    
    // Update and display player bullets
    updateAndDisplayBullets(playerBullets);
    
    // Update and display target bullets
    updateAndDisplayBullets(targetBullets);
    
    // Update and display lasers
    updateAndDisplayLasers(lasers);
    
    // Update and display targets
    for (int i = targets.size() - 1; i >= 0; i--) {
      Target target = targets.get(i);
      target.update();
      target.display();
      if (target.offscreen()) {
        targets.remove(i);
      }
    }
    
    for (int i = targetsTwo.size() - 1; i >= 0; i--) {
      TargetTwo targetTwo = targetsTwo.get(i);
      targetTwo.update();
      targetTwo.display();
      if (targetTwo.offscreen()) {
        targetsTwo.remove(i);
      }
    }
    
    // Add new targets randomly
    if (frameCount % 60 == 0) {
      targets.add(new Target(random(width), random(height) / 2));
    }
    
    // Add big target randomly
    if (frameCount % 300 == 0) {
      targetsTwo.add(new TargetTwo(50, 50));
    }
    
    // Check for collisions between bullets and targets
    checkCollisions(playerBullets, targets);
    checkCollisions(targetBullets, player);
    checkCollisionsLaser(lasers, player);
    checkCollisionsLaser(playerBullets, targetsTwo);
    
    // Game over condition
    if (player.hit) {
      gameOver = true;
    }
  } else {
    // Display game over message
    textAlign(CENTER);
    textSize(30);
    fill(255, 0, 0);
    text("Game Over!", width / 2, height / 2);
  }
}

void keyPressed() {
  if (!gameOver) {
    if (key == ' ') {
      playerBullets.add(new Bullet(player.x, player.y - 15, true));
    }
  }
}

void updateAndDisplayBullets(ArrayList<Bullet> bullets) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    bullet.update();
    bullet.display();
    if (bullet.offscreen()) {
      bullets.remove(i);
    }
  }
}

void updateAndDisplayLasers(ArrayList<Laser> lasers) {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    laser.update();
    laser.display();
    if (laser.offscreen()) {
      lasers.remove(i);
    }
  }
}

void checkCollisions(ArrayList<Bullet> bullets, ArrayList<Target> targets) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    for (int j = targets.size() - 1; j >= 0; j--) {
      Target target = targets.get(j);
      if (bullet.hits(target)) {
        bullets.remove(i);
        targets.remove(j);
      }
    }
  }
}

void checkCollisionsLaser(ArrayList<Bullet> bullets, ArrayList<TargetTwo> targetsTwo) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    for (int j = targetsTwo.size() - 1; j >= 0; j--) {
      TargetTwo targetTwo = targetsTwo.get(j);
      if (bullet.hits(targetTwo)) {
        bullets.remove(i);
        targetsTwo.remove(j);
      }
    }
  }
}

void checkCollisions(ArrayList<Bullet> bullets, Player player) {
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    if (bullet.hits(player)) {
      player.hit = true;
      bullets.remove(i);
    }
  }
}

void checkCollisionsLaser(ArrayList<Laser> lasers, Player player) {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    if (laser.hits(player)) {
      player.hit = true;
      lasers.remove(i);
    }
  }
}
