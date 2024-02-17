# User Interface 

**Relevant user stories:**
1. As a player I want to have an easy to understand interface so that I can have a more
enjoyable time playing the game and not spend time on complicated screens.
2. As a developer, I want to have a clear graphical user interface which is simple to navigate
and contains clear instructions for the game controls for the player so that it is easy for 
the player to understand and play the game so we can get good feedback from players from the demo.

## Use Case Specification:

**Basic description:**
When first loading the game, a start menu opens allowing the player to select 1-player or 2-player mode.
The next screen allows them to select a difficulty Easy, Intermediate, Hard. Next screen allows selection 
of spaceship design. Then the game will begin. 

**Basic Flow:**
1. Load start screen with title and current highest score and name of the person with
the highest score. Buttons on start screen are:
   - "Start"
   - "How to Play"
   - "Settings"
   - "High Scores"
   - "Exit"
2. After pressing start, load new screen to select number of players
   - 2 buttons with text: "1-player" and "2-player"
   - Image above "1-player" text showing single aircraft
   - Image above "2-player" text showing 2 aircrafts
3. After selecting single or 2 player mode, load new screen to select gameplay mode
   - Split screen into thirds ie. | mode1 | mode2 | mode3 |
   - 3 Headings: "Campaign Mode", "Endless Mode", "Speed Mode"
   - Under each heading, text description of the mode plus image
   - If a mode has not been unlocked yet, it will be grayed out
   - On bottom quarter of screen, 3 buttons to select difficulty mode "Easy" "Intermediate"
   "Hard"
4. After selecting gameplay and difficulty mode, load "Choose your aircraft" screen. 
   - Image of the current aircraft in middle of the screen with arrow buttons left and right of it
   - On pressing left or right buttons, change image to a different aircraft design. 
5. Game starts
   - Top left corner shows current score
   - Top middle shows the current level
   - Top right corner shows percentage of progress on clearing the current level.
   - Bottom right corner has a health bar for the player. This can change colour as 
   the health decreases eg. above 50% is green, below 50% turn orange, below 25% turn red
   - Player aircraft starts at the bottom middle of the screen 
6. On completion of Campaign Mode, show victory screen
   - "CONGRATULATIONS!" heading
   - Show score
   - Story text for good ending eg. "All the aliens have been defeated! You have saved the world"
   - "Return to Main Menu" button


**Alternative Flow:**
1. "How to Play" Button on start screen to show player controls when pressed
   - Can use image icons to illustrate
   - Text saying "use directional keys to move the aircraft and space to shoot"
2. "Settings" Button on start screen to swap to settings screen with:
   - Music volume adjustment using rectangular slider from 0 to 100
   - SFX volume adjustment using rectangular slider from 0 to 100
   - Collision detection precision adjustment using rectangular slider from "low" to "high"
   - Player control modifiction: separate selection per movement type (eg. turn left). When
   selected, press the keys the user would like to use, and then updates.
   - Tab to swap from player 1 controls setting adjustment to player 2 controls setting adjustment
3. "High Score" Button on start screen:
   - Shows a list of names and high scores for the top 10 scores
   - Button to swap from single player high scores screen to 2-player high scores screen
4. "Exit" Button - close the game 
5. Press Esc key during the game to pause the game and open Pause Screen
   - Text heading "Game Paused"
   - "Resume" button to continue playing
   - "Save and Exit" button: if the player presses to exit the game, save what level they are currently on
   and the current score so they can continue
   - "Settings" button: Open settings screen to adjust volume etc. as detailed above
6. Game over screen if player health reaches 0
   - If player still has lives left, ask if they wish to continue the game with yes/no buttons.
   - If no lives left, end game screen with heading "GAME OVER" and show player their score.
   Story text eg. "You have failed and the aliens have taken over". 
7. If game ends (victory or game over), check game high score database and compare with current score 
   to see if new high score has been achieved
   - If a new high score, show congratulations message and open screen for user(s) to input their 
   name(s) using keyboard input. If 2 players, show player 1 input screen then player 2.
   - Store name(s) and high score in high score database.
   - Return to start screen 
