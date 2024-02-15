User Interface 

Relevant user stories:
1. As a player I want to have an easy to understand interface so that I can have a more
enjoyable time playing the game and not spend time on complicated screens.
2. As a developer, I want to have a clear graphical user interface which is simple to navigate
and contains clear instructions for the game controls for the player so that it is easy for 
the player to understand and play the game so we can get good feedback from players from the demo.

Use Case Specification:

Basic description:
When first loading the game, a start menu opens allowing the player to select 1-player or 2-player mode.
The next screen allows them to select a difficulty Easy, Intermediate, Hard. Next screen allows selection 
of spaceship design. Then the game will begin. 

Basic Flow:
1. Load start screen with 2 buttons: 1-player and 2-player. Start screen will also show 
highest score below the buttons
2. After selecting single or 2 player mode, load screen to select difficulty mode 
(Easy, Intermediate, Hard)
3. After selecting difficulty mode, load "Choose your aircraft" screen. This consists of 
an image of the current aircraft with arrow buttons left and right of it. On pressing left 
or right, change image to a different aircraft design. 
4. Game starts
   -Top left corner shows current score
   -Top middle shows the current level
   -Top right corner shows percentage of progress on clearing the current level.
   -Bottom right corner has a health bar for the player
   -Player aircraft starts at the bottom middle of the screen 

Alternative Flow:
1. Button on start screen to show player controls when pressed (WASD movement, space to shoot)
2. Button on start screen to allow changing of game settings/options
3. Press Esc key during the game to pause the game
  - if the player exits the game, save what level they are currently on and the current score
   so they can continue
4. Game over screen if player health reaches 0. Ask player if they wish to continue the game with 
   yes/no buttons.
