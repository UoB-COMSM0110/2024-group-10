class EnemyTest {
    PApplet parent; // Processing的主程序引用

 EnemyTest(PApplet parent) {
        this.parent = parent;
    }

void testIsHit() {
        // 创建测试用的Enemy和PlayerBullet
        Enemy testEnemy = new Enemy( 100, 100); // 假定Enemy构造函数不需要特殊改动
        PlayerBullet bulletHit = new PlayerBullet(100, 100, 0, 0);
        PlayerBullet bulletMiss = new PlayerBullet(200, 200, 0, 0);

        // 进行测试
        boolean hitResult = testEnemy.isHit(bulletHit);
        if (!hitResult) {
            println("Error: Bullet should hit the enemy.");
        } else {
            println("Success: Bullet hit the enemy as expected.");
        }

        boolean missResult = testEnemy.isHit(bulletMiss);
        if (missResult) {
            println("Error: Bullet should not hit the enemy.");
        } else {
            println("Success: Bullet did not hit the enemy as expected.");
        }
    }
 void testHitPlayer() {
        Enemy testEnemy = new Enemy(100, 100);
        Player playerHit = new Player(1);  // 使用正确的构造函数
        Player playerMiss = new Player(2);  // 假设2号玩家足够远，不会碰撞

        // 测试碰撞
        boolean hitResult = testEnemy.hitPlayer(playerHit);
        if (!hitResult) {
            println("Success:Enemy should hit the player.");
        } else {
            println("Error: Enemy hit the player as expected.");
        }

        // 测试未碰撞
        boolean missResult = testEnemy.hitPlayer(playerMiss);
        if (missResult) {
            println("Error: Enemy should not hit the player.");
        } else {
            println("Success: Enemy did not hit the player as expected.");
        }
    }
}
