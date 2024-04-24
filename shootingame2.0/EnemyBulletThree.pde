class EnemyBulletThree extends EnemyBullet {
  float targetX, targetY, angle;

  EnemyBulletThree(float x, float y) {
    super(x, y, 0);

    if (is2Player) {
      if ((!player.isDied)&&(!player2.isDied)) {
        if (random(1)>0.5) {
          targetX = player.x;
          targetY = player.y;
          angle = atan2(targetY - y, targetX - x);
        } else {
          targetX = player2.x;
          targetY = player2.y;
          angle = atan2(targetY - y, targetX - x);
        }
        return;
      }

      if ((!player.isDied)) {

          targetX = player.x;
          targetY = player.y;
          angle = atan2(targetY - y, targetX - x);

        return;
      }

      if ((!player2.isDied)) {

          targetX = player2.x;
          targetY = player2.y;
          angle = atan2(targetY - y, targetX - x);

        return;
      }
    
    } else {
      targetX = player.x;
      targetY = player.y;
      angle = atan2(targetY - y, targetX - x);
    }
  }

  @Override
    void update() {
    super.blink();
    x += cos(angle) * 10;
    y += sin(angle) * 10;
  }
}
