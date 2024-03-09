class Player {
  float x, y;
  float speed = 5;
  boolean hit = false;
  int lives = 3;
  //render player
  PImage imgNormal;
  PImage imgHit;
  int hitTime = -2000; // 记录被击中的时间，初始化为一个足够小的值
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
    imgNormal = loadImage("PrototypeImages/me.png");
    imgHit = loadImage("PrototypeImages/me_hit.png");
  }
  
    void update() {
    if (keyPressed) {
       if (keyCode == LEFT) x -= speed;
      else if (keyCode == RIGHT) x += speed;
      else if (keyCode == UP) y -= speed;
      else if (keyCode == DOWN) y += speed;
    }
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
    void display() {
      imageMode(CENTER);
       if(millis() - hitTime <= 500) {
         image(imgHit, x, y);
       }else {
         image(imgNormal, x, y);
       }
     }
       // 新增一个方法来处理被击中的状态
   void gotHit() {
     hit = true; // 标记为被击中
     hitTime = millis(); // 更新被击中的时间戳
    }
     
}
