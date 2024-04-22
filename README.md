# Our Team

## Team members

|         Name         |           Email            | Git Hub Username |
| :------------------: | :------------------------: | :--------------: |
|    Hannah Abedin     |   go20247@bristol.ac.uk    |   hannahabedin   |
| Sudan TangSudan0905  |   yn23171@bristol.ac.uk    |    Sudan0905     |
|      Shunyi Huo      |   fv23962@bristol.ac.uk    | TheWalkingNerd1  |
|   Ouyang Mengmeng    |   ii23098@bristol.ac.uk    |   mimiko134340   |
|      Antai Sun       |   mo23147@bristol.ac.uk    |    sat2357817    |
| Bou Man Jennifer Lau | bmj.lau.2023@bristol.ac.uk |     codeblau     |

## Team Photo

![team photo](images/team%20photo.jpg)

### Team Roles

| Name    | Role                                                                                                                                                                    |
|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Hannah  | Developer: Tasked with the strategic planning and coding of the game's special features. Implemented spawning mechanism for enemies, distinguishing between simple and complex modes. Enabled multiplayer functionality. |
| Jennifer| UI/UX Designer: Focused on designing the user interface and experience. Responsible for the layout and implementation of the main menu. Wrote help documentation for new players. |
| Mengmeng and Sudan | Artists: Responsible for artistic rendering of characters, enemies, and game backgrounds. Managed integration of background music and sound effects. |
| Shunyi  | Lead Developer: Led the development of the game's main logic and wrote core code for gameplay. Conducted code reviews to maintain quality and consistency. |
| Antai   | Developer: Implemented the leaderboard feature, allowing players to track scores and compete against others. |



# Final game idea: Vertical-Scrolling Shooter Game

Name: TBC


Paper prototype video:

https://github.com/UoB-COMSM0110/2024-group-10/assets/148199198/728b9f47-211e-4607-9fb6-e255dce2f6ae

## 1.Description:

A 2D game where the user will pilot a spaceship on the screen controlled using 
the keyboard. Enemies will appear dynamically along with others set up statically 
on the map. The goal is to earn points by defeating enemies and to evade attacks
from the enemies to survive. As points increase, the difficulty level increases
and the map landscape and enemies may change and become more difficult.

## 2.Controls:

W = Up
A = Left
S = Down
D = Right
Space = Shoot

## 3.Features discussed:

- Fire system upgrading
- Bonus points earned by coins from destroyed enemies
- Ability to select between different spaceship designs

## 4.Potential challenges:

- Accurate collision detection range for objects; distinguishing different
  interactions for different game object types (eg. bullets, coins, enemies)
- 2-player mode implementation
- Resurrection / Extra lives system; carrying on with previous fire system

## Requirements
Requirements help to clearly define software projects and meet the expectations of the end-users and stakeholders. 

**Stakeholders**
We used the onion model to systematically identify our stakeholders across the different group layers. Our game is the core of the onion model, as the product that we are developing. Moving outwards to the system layer, we recognised ourselves as the normal operators developing the game’s core functionality. We also recognised students and university lecturers as stakeholders acting as game-testers and sources of feedback. Expanding further to the containing system, we acknowledged the users of our game, including students, friends and family and social gamers. The UI art team are also key stakeholders in this system, involved in maintaining the interface of the game. Finally, in the wider environment, we considered the influence our game could have on existing shoot ‘em games, recognising our effect as a negative stakeholder by creating a competitor-game. In contrast, we also included those who may play and enjoy the game, as well as those who could provide networking opportunities the expand the game further, for example a university gaming society. 

![Onion Model](images/Onion%20model.png)


**Use case diagram**
![user case diagram.png](images/user%20case%20diagram.png)

**Use case reflection**
Creating several use case specifications allowed the group to break down the game into its different components, enabling us to explore key detaisl of the game. The key use case specifications for our game include: level design, optimisation, unique features and user interface. Each specification focused on specific elements of the game and helped us refine each part. For example, in the level design we decided on 2 main levels that the player can choose from - endless mode and speed mode. Furthermore, it allowed us to think about how each element of the game will integrate with each other. For example, a unique feature is enemy-spawning aliens, which needed to be adapted to fit each game mode. This process gave us a high level understanding of the game, which will aid us when planning the game.
(Finish by adding a reflection about the use case diagram)

**Class diagram**
![class diagram.jpg](images/class%20diagram.jpg)

## Evaluation
**Think Aloud Evaluation: 11/03/2024**

### Feedback 1
#### Positives:
1. The game design is engaging.
2. Background music adds suspense.

#### Improvements:
1. Can’t shoot and move the player at the same time.
2. The controls for the player and shooting are unclear.
3. The default game mode was too challenging with too many enemies appearing at once.

### Feedback 2:
#### Positives:
1. The objective of the game is clear.
2. The different types of enemies make the game more interesting to play, especially the enemy that follows you.

#### Improvements:
1. Multiplayer would make the game more enjoyable.
2. You don’t always lose a life when the enemy hits the player.

**Heuristic Evaluation: 11/03/24**

| Interface               | Issue                                                                                                                                     | Heuristic             | Frequency | Impact | Persistence | Severity |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|-----------|--------|-------------|----------|
| Player-Enemy Interaction | Inconsistent consequence of player-enemy contact. This meant that even though the player hit an enemy, the player would not always lose a life. This meant that the player was unsure if the enemy itself was deadly or just the bullets. | Error Prevention     | 4         | 4      | 3           | 3.7      |
| Movement Controls       | Lack of labels for shooting, which meant players would often die quickly when they first played the game as they were unsure which key controlled shooting to kill the enemies.                           | Help and Documentation | 3         | 4      | 2           | 3.0        |
| Visual Feedback         | Absence of visual cues to indicate successful hits on enemies. This meant that players were unsure if they successfully hit the enemies and impacted playing morale.                                   | Visibility of system status | 4         | 1      | 3           | 2.7     |
| Game Progression        | Unclear progression indicators, such as levels completed or any score milestones.                                                        | Visibility of System Status | 2         | 2      | 3           | 2.3      |
| Level Design            | Lack of environmental variety, making the game feel repetitive over time.                                                                | Consistency and Standards | 3         | 2      | 3           | 2.7     |

**Quantitative Evaluation: System Usability Scale (SUS) Analysis: 16/4/24**
We conducted a focus group test with 10 participants to assess the System Usability Scale (SUS) of the game. Our findings from this numerical test demonstrated that users found the game easy to play, with minimal need for prior knowledge or technical support. A majority strongly agreed that they would use the product frequently and felt confident to use it effectively. The scores from all participants were generally consistent, indicating a cohesive response across the group. While there were no outliers, participants expressed slightly less confidence in the game’s consistency. This feedback informed our decision to refactor the code and refine gameplay to enhance consistency. Despite this point of improvement, the overall positive feedback encouraged our approach.


### Easy Mode

| Question                                                                   | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | P9 | P10 | Mean |
|----------------------------------------------------------------------------|----|----|----|----|----|----|----|----|----|-----|------|
| I think that I would like to use this system frequently                  | 5  | 4  | 5  | 3  | 5  | 4  | 4  | 3  | 4  | 4    | 4.2  |
| I found the system unnecessarily complex                                  | 1  | 2  | 2  | 4  | 1  | 1  | 2  | 2  | 1  | 1    | 1.7  |
| I thought the system was easy to use                                       | 5  | 4  | 4  | 4  | 5  | 4  | 4  | 5  | 3  | 3    | 4.1  |
| I think that I would need the support of a technical person to be able to use this system | 1            | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1.0  |
| I found the various functions in this system were well-integrated         | 4  | 4  | 3  | 2  | 4  | 4  | 3  | 5  | 4  | 4    | 3.7  |
| I thought there was too much inconsistency in this system                  | 1  | 3  | 2  | 3  | 1  | 2  | 1  | 2  | 1  | 2    | 1.8  |
| I would imagine that most people would learn to use this system very quickly | 5  | 5  | 5  | 5  | 1  | 5  | 5  | 4  | 3  | 5    | 4.3  |
| I found the system very cumbersome to use                                  | 1  | 1  | 2  | 1  | 1  | 2  | 2  | 2  | 3  | 1    | 1.6  |
| I felt very confident using the system.                                    | 5  | 3  | 3  | 2  | 5  | 5  | 3  | 5  | 3  | 4    | 3.8  |
| I needed to learn things before I could get going with this system.        | 1  | 1  | 1  | 2  | 1  | 1  | 1  | 1  | 2  | 2    | 1.3  |


### Hard Mode
| Question                                                                   | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | P9 | P10 | Mean |
|----------------------------------------------------------------------------|----|----|----|----|----|----|----|----|----|-----|------|
| I think that I would like to use this system frequently                    | 4  | 4  | 4  | 4  | 4  | 5  | 4  | 5  | 3  | 4   | 4.1  |
| I found the system unnecessarily complex                                  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1   | 1.0  |
| I thought the system was easy to use                                      | 2  | 3  | 3  | 3  | 4  | 4  | 4  | 3  | 5  | 4   | 3.5  |
| I think that I would need the support of a technical person to be able to use this system | 2            | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1  | 1.1  |
| I found the various functions in this system were well-integrated         | 4  | 3  | 4  | 2  | 5  | 4  | 4  | 4  | 5  | 5   | 4.0  |
| I thought there was too much inconsistency in this system                 | 1  | 2  | 3  | 3  | 1  | 1  | 2  | 1  | 2  | 1   | 1.7  |
| I would imagine that most people would learn to use this system very quickly | 3  | 4  | 3  | 4  | 4  | 5  | 5  | 5  | 4  | 4   | 4.1  |
| I found the system very cumbersome to use                                 | 3  | 2  | 3  | 2  | 2  | 2  | 2  | 2  | 2  | 2   | 2.2  |
| I felt very confident using the system.                                   | 3  | 4  | 5  | 5  | 5  | 5  | 5  | 5  | 5  | 4   | 4.6  |
| I needed to learn things before I could get going with this system.        | 2  | 2  | 3  | 2  | 2  | 2  | 1  | 2  | 1  | 1   | 1.8  |

### Wilcoxen Signed Rank Test
1. Replace the data pairs with their difference

| Participant | Easy Mode (EM) | Hard Mode (HM) | Difference (EM - HM) |
|-------------|----------------|----------------|----------------------|
| P1          | 4.2            | 4.1            | 0.1                  |
| P2          | 1.7            | 1.0            | 0.7                  |
| P3          | 4.1            | 3.5            | 0.6                  |
| P4          | 1.0            | 1.1            | -0.1                 |
| P5          | 3.7            | 4.0            | -0.3                 |
| P6          | 1.8            | 1.7            | 0.1                  |
| P7          | 4.3            | 4.1            | 0.2                  |
| P8          | 1.6            | 2.2            | -0.6                 |
| P9          | 3.8            | 4.6            | -0.8                 |
| P10         | 1.3            | 1.8            | -0.5                 |


2. Rank the differences

| Difference | Rank | Signed Rank |
|------------|------|-------------|
| 0.1        | 1    | 1           |
| 0.1        | 2    | 2           |
| -0.1       | 3    | -3          |
| 0.2        | 4    | 4           |
| -0.3       | 5    | -5          |
| -0.5       | 6    | -6          |
| -0.6       | 7    | -7          |
| 0.6        | 8    | 8           |
| -0.7       | 9    | -9          |
| -0.8       | 10   | -10         |

Positive rank sum = 25

Negative rank sum = 30

W test Statistic = 25
- 25 is greater than 8 
- This means there is a statistical significance when using a p value of 0.05
- This shows that the rise in difficulty between the ‘hard’ mode and the ‘easy’ mode in our game is statistically significant



