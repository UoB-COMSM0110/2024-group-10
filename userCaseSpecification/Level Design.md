**Use Case: Player Selects Mode/Level**

1. Use Case Name: Player Selects Mode/Level
2. Brief Description: The player selects the mode or level they want to play from the game’s main menu or mode/level selection screen. The modes include:
   - **Campaign Mode**: The player needs to complete a series of three levels, each with different enemies and tasks. The last level is a Boss battle.
   - **Endless Mode**: The game continues until the player’s fighter is shot down. Endless mode is unlocked after the player passes the first level.
   - **Speed Mode**: The player’s fighter will fly at high speed and needs to dodge various obstacles. Speed mode is unlocked after the player passes the second level.
3. Precondition: The game has started, and the player has entered the mode/level selection screen.

**Basic Flow:**

1. The player browses the available mode/level list.
2. The player selects a mode or level.
3. The system confirms the player’s selection.
4. The system loads and starts the selected mode or level.
5. The player has entered the selected mode or level and can start the game.
6. If the player selects the campaign mode, they need to complete three levels in order. After each level is completed, the system automatically loads the next level and unlocks the corresponding mode.

**Alternative Flows:**

1. Player Changes Mode/Level:
   1. The player wants to change the mode or level during the game.
   2. The player chooses to return to the mode/level selection screen.
   3. The system confirms the player’s choice and returns to the mode/level selection screen.
   4. The player can select a new mode or level.
2. Player Selects Unlocked Mode/Level:
   1. The player selects a mode or level that is not unlocked.
   2. The system detects that the selected mode or level is not unlocked.
   3. The system prompts the player that they need to complete specific tasks to unlock it.
   4. The player can select other unlocked modes or levels, or complete tasks to unlock new modes or levels.