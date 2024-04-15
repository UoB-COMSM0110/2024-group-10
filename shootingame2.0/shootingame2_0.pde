Player player;

void settings() {
  size(750, 1000);
}

void setup() {
  player = new Player();
}

void draw() {
  background(255);
  player.update();
  player.display();
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}
