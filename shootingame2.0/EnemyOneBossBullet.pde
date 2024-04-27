class EnemyOneBossBullet extends EnemyBullet {
    float horizontalDecay = 1.0; // 新增水平衰减系数
    int lifeTime = 0; // 生命周期计数
  
  EnemyOneBossBullet (float x, float y,  float angle) {
    super(x, y, angle);
    this.speed = 4;
    this.rotationSpeed = 4; // 初始旋转速度
  }
  
    @Override
  void update() {
    lifeTime++; // 增加生命时间
    horizontalDecay = max(0, 1 - lifeTime * 0.005); // 控制衰减速率

    // 计算旋转速度衰减
    rotationSpeed *= 0.95; // 每帧旋转速度减少1%
    angle += rotationSpeed;

    float horizontalSpeed = speed * horizontalDecay * cos(radians(angle));
    float verticalSpeed = speed * sin(radians(angle));

    x += horizontalSpeed;
    y += verticalSpeed;

    checkBoundary();
    super.blink();
  }
}
