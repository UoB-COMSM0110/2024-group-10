Player p1;
ArrayList<Bullet> bulletList;
boolean spacePressed = false;

void setup() {
  size(1200, 800);
  
  p1 = new Player(width/2, height-45, 40, 40); 
  
  bulletList = new ArrayList<Bullet>();
}

void draw(){
  background(0);
  
  stroke(255);
  strokeWeight(2);
  
  int numStars = 10;
  for (int i = 0; i < numStars; i++) {
    float x = random(width);
    float y = random(height);
    point(x, y);
  }
  
  p1.render();
  p1.move();
  
  // bullets
  for (int i = bulletList.size() -1; i >= 0; i--) {
    Bullet oneBullet = bulletList.get(i);
    oneBullet.render();
    oneBullet.move();
    oneBullet.checkBullet();
    // delete bullets after exit screen
    if (oneBullet.deleteBullet == true) {
      bulletList.remove(i);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p1.moveLeft = true;
    }  
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      p1.moveRight = true;
    }
  }
  
  if (key == ' ') {
    bulletList.add(new Bullet(p1.x + p1.w / 2, p1.y));
    spacePressed = true;
  }
  
  if (!spacePressed) {
    p1.stopShooting();
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p1.moveLeft = false;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      p1.moveRight = false;   
    }
  }
}
