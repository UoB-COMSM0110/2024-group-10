**Use Case: Gravitional shifts and Spawning aliens**

1. Use Case Name: Gravitional shifts and spawning aliens
2. Brief Description: The player starts at the bottom of the screen. During the game, the alien's bullets change direction within 180 degrees due to shift in gravity. This will occur during random intervals. The intensity of the gravity changes each level of the game:
- **Alien Projectile Direction**: The direction of the projectiles change at random intervals during the game
- **Projectile Speed**: Each level of the game, the gravitional pull will increase, therefore the projectiles will move faster towards the player
- **Spawning aliens**: At random intervals during the game, an alien will spawn and follow the player until it is defeated. As the gravitional pull increases, the speed of which the spawning alien follows the player increases.
3. Precondition: The game has started, and the player has selected 1/multiplayer, selected the game mode and the type of spaceship.
    **Endless Mode**
  1. As time goes on, the direction of the projectiles changes more frequently. 
  2. As the time goes on, the number of spawning aliens increases gradually, with a warning with the number about to spawn.
     **Speed Mode**
  1. The projectile speed will be firing at a high speed, and will gradually get faster.
  2. The number of spawning aliens stays consistent in speed mode, and spawn at regular intervals

**Basic Flow:**
1. The player starts the game at level 1.
2. The aliens fire projections towards the player straight down at the start of the game and the gravitational pull is at the initial level.
3. The player defeats some of the aliens by firing bullets upwards and progresses to level 2.
4. During level 2, the direction of projectiles fired by aliens changes in range 0-180 degrees.
5. Player continues to shoot the aliens.
6. The gravitional pull increases and the projectiles now move towards the player faster.
7. The game continues until the player kills all the aliens and wins the game.

**Alternative Flows:**
1. Player doesn't complete the game (aliens win)
    1. The player starts the game at level 1.
    2. Level 1 is completed and player progresses to level 2.
    3. During level 2, the speed of projectiles increase towards the player.
    4. A alien spawns in this level and begins to follow the player at a low speed.
    5. The player attempts to shoot the alien but the alien dodge the bullet.
    6. Player kills all default aliens and progresses to level 3 with spawning alien still following.
    7. The gravitional pull increases and now the spawning alien follows the player faster.
    8. Spawning alien kills the player and aliens win.
2. 2 Multiplayer game
    1. Both players start at level 1.
    2. It is easier to progress to a further level so progress to level 2 and level 3
    3. During level 3, player 1 dies and player 2 revives player 1 and sacrifices a life.
    4. Player 2 dies and cannot be revived. Player 1 continues the game.
    5. Player 1 defeats all the aliens and wins the game.
