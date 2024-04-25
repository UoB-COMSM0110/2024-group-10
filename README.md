![SPACE SWARM SHOOTERS!.png](images/SPACE%20SWARM%20SHOOTERS!.png)

## Our video

## Table of Contents

1. [Our Team](#our-team)
2. [Introduction](#introduction)
3. [Design](#design)
4. [Implementation](#implementation)
5. [Evaluation](#evaluation)
6. [Process](#process)
7. [Conclusion](#conclusion)

(add sub contents)

# 1. Our Team

## Team members

|         Name         |           Email            | Git Hub Username |
| :------------------: | :------------------------: | :--------------: |
|    Hannah Abedin     |   go20247@bristol.ac.uk    |   hannahabedin   |
|      Sudan Tang      |   yn23171@bristol.ac.uk    |    Sudan0905     |
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

## 2. Introduction:

Our game is a single or multiplayer shoot-‘em-up game inspired by Space Invader. However, we’ve added our own twists to elevate the game. We have introduced different enemies, each with their unique behaviours and attack patterns. Specifically, the stalking enemy follows the player, adding an extra challenge to gameplay. To survive, players must employ strategic manoeuvres, precision aiming and quick reflexes to destroy enemies before they unleash their attacks. Each successful takedown earns points, contributing to the player’s overall score. As the battle between the enemies and player(s) continues, the intensity escalates, with faster enemy ships. Only if you reach the end of the game will you win against the enemies.

## How to play!
**Controls**

<img src="https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/c9b96cd2-517e-46f8-b4ca-94858e991afd" width="400">


Enemies: (insert pictures)

How to win: beat the enemies to land a victory


## 3. Requirements
Requirements help to clearly define software projects and meet the expectations of the end-users and stakeholders. 

**Stakeholders**

We used the onion model to systematically identify our stakeholders across the different group layers. Our game is the core of the onion model, as the product that we are developing. Moving outwards to the system layer, we recognised ourselves as the normal operators developing the game’s core functionality. We also recognised students and university lecturers as stakeholders acting as game-testers and sources of feedback. Expanding further to the containing system, we acknowledged the users of our game, including students, friends and family and social gamers. The UI art team are also key stakeholders in this system, involved in maintaining the interface of the game. Finally, in the wider environment, we considered the influence our game could have on existing shoot ‘em games, recognising our effect as a negative stakeholder by creating a competitor-game. In contrast, we also included those who may play and enjoy the game, as well as those who could provide networking opportunities the expand the game further, for example a university gaming society. 

<img src="images/Onion%20model.png" alt="Onion Model" width="550">


**Use case diagram**

<img src="images/user%20case%20diagram.png" alt="user case diagram.png" width="400">

The use case diagram was crucial in identifying interactions between actors and system components in our game. Visualising use cases helped us understand the game's functionality and flow, clarifying requirements and prioritising features. It also facilitated planning for multiplayer functionality by illustrating player interactions.



**User Stories**
### Player roles:

#### Scenario 1: Navigate with Ease

>*As a player, I want a straightforward and easy-to-understand interface so that I can quickly get started without spending time learning complex operations. This will allow me to focus*

#### Scenario 2: Master of Modes

>*As a player, I want to be able to choose between different game modes such as campaign, endless, and speed modes. This flexibility allows me to tailor the game experience to my preferences and skill level, enhancing engagement and satisfaction.*


#### Scenario 3: Embrace the Challenge

>*As a player, I expect the game to offer a variety of challenges, including dynamic environments and unpredictable enemy behaviors, which increase the game's depth and replay value.*



### Developer Roles:


#### Scenario 1: Interface Optimisation
> *As a Frontend Developer, I aim to create a user-friendly interface, ensuring players can dive into the game without any hassle.*


#### Scenario 2: Mode Implementation
> *As a Backend Developer, my goal is to implement various game modes, providing players with diverse gameplay options tailored to their preferences.*


#### Scenario 3: Challenge Design
> *As a Game Designer, I'm focused on crafting engaging challenges, from dynamic environments to cunning enemy behaviors, enhancing the game's depth and replayability.*


**Use case reflection**

Creating several use case specifications allowed the group to break down the game into its different components, enabling us to explore key detaisl of the game. The key use case specifications for our game include: level design, optimisation, unique features and user interface. Each specification focused on specific elements of the game and helped us refine each part. For example, in the level design we decided on 2 main levels that the player can choose from - endless mode and speed mode. Furthermore, it allowed us to think about how each element of the game will integrate with each other. For example, a unique feature is enemy-spawning aliens, which needed to be adapted to fit each game mode. This process gave us a high level understanding of the game, which will aid us when planning the game.

## 3. Design

### System architecture
The system architecture of our game comprises several parts, including game state management, user interface, enemy type and game elements. Each part contributes to the overall functionality and experience of the game.

**Game State Management**

The core design of the game architecture is the Game State Management system, encapsulated within the ``GameState`` enum. 

<img src="images/GameState.png" alt="GameState" width="300">

This enum controls the gameplay flow by managing state transitions, responding to user input and coordinating interactions between various game elements. Event handler methods translate keyboard and mouse events into actions within the game. In single-player mode, players navigate using the arrow keys and utilise the spacebar for shooting actions, providing an intuitive and straightforward control scheme. For two-player mode, we opted for the ``WASD`` keys for movement and the ``F`` key for shooting, ensuring a comfortable and balanced gameplay experience for both players. By using the GameState enum and responsive event handling mechanisms, the game architecture maintains coherence, resulting in a fulfilling gaming experience.

**User Interface (UI)**

The User Interface (UI) component plays an important role in providing players with visual feedback and interactive elements for a user-friendly experience. Through start screens and menus, the UI offers players different options to either begin or resume gameplay, adjust settings, access instructions and view highscores via a leaderboard. We aimed for a clear but effective design to ensure ease of use. 

<img src="https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/69e0c7a7-3ee1-417e-a064-1cd60aa2dbdb" width="400" height="410" alt="UI">


**Enemy Diversity**

The UI also highlights the diversity among each enemy, each having unique attacking behaviours, represented visually to the player. Alongside this, each enemy has a distinctive appearance and behaviour. The corresponding enemy bullets also have various shapes to indicate different attack players, allowing players to anticipate and respond strategically. This adds a level of originality, variability and interest to the game and helps maintain user engagement. 

**Game elements**

In our game, various elements contribute to gameplay, including players, enemies, and their respective bullet types. Each element is represented by a separate class, with distinct attributes that introduce challenge and strategy. This modular class design promotes a well-structured codebase, facilitating maintenance and enabling future expansion.

To ensure optimal performance, we utilise efficient data structures for storing game entities. Additionally, we implement design patterns like object pooling to minimise memory allocation and enhance game efficiency, particularly in scenarios involving high volumes of bullets or enemies on the screen. These optimisations result in a smooth gameplay experience and contribute to an enjoyable game overall enriched by immersive sound effects. 


**Class diagram**

![new class diagram.png](images/new%20class%20diagram.png)


As our game development progressed, we refined and expanded our class diagram to reflect the evolving structure and the functionality of the game. The updated class diagram shows the inheritance hierarchy among the different game entities, such as the players and enemies, and their associated bullets. The updated class diagram brings a new level of structure to our design plan, providing a more cohesive architecture. While still aligning with our initial concept, the revised diagram has a more intuitive way for the enemies and players to interact. This helped with planning and implementing the collision-detection mechanism. 

<img src="images/class%20diagram.jpg" alt="Class Diagram" width="500"/>


**Communication Diagram**

<img src="https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/47fac732-8959-4e68-b58d-42df0a6e1226" alt="Communication Diagram" width="600"/>

We created a communication diagram for a clear visual representation of how the different classes interacted with each other. This diagram allowed us to understand the flow of communication between objects and classes in our game. This also helped to ensure that player’s interactions with enemies and the game environment were handled properly, by mapping out methods such as ``shootBullets()`` and ``isHit()``. 

The extensive planning and object–oriented design was a major factor in the smooth operation of the game, the interoperability and usability of code, and the ease with which each team member could contribute to development in an agile-way, able to implement features and classes that independently and cohesively interact with each other.

## 4. Implementation

Areas of challenge:
1. Multiplayer mode
2. Leaderboard functionality
3. Level Design

**Multiplayer mode**

**Leaderboard functionality** 

**Level design**


## 5. Evaluation
**Think Aloud Evaluation: 11/03/2024**

In our evaluation, we utilised a think aloud approach, where participants vocalised their thoughts while engaging with the game. We generated a word cloud from the think aloud data. This visual representation highlights recurring themes and key phrases, providing a quick and accessible overview of the user experience.

<img src="images/word%20cloud.png" alt="word cloud" width="400">



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

![SUS graph](https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/287847fb-2d52-423c-99b4-7512b45ee42a)

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

<img width="429" alt="Wilcoxen signed rank graph" src="https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/9c7381ca-37aa-487e-8294-e405cf749fda">

In our analysis of the System Usability Scale (SUS) scores for both the Easy Mode (EM) and Hard Mode (HM) of the game, we observed a notable difference between the two difficulty levels. Conducting a Wilcoxon signed-rank test revealed a significant distinction in participants' responses.

Specifically, when comparing the mean scores for the statement "I thought the system was easy to use," we observed a clear contrast between the Easy and Hard modes. In the Easy Mode, participants rated the system's ease of use with a mean score of 4.1, indicating a generally favourable perception of usability. However, in the Hard Mode, this score decreased to 3.5, suggesting that participants found the system comparatively less user-friendly when faced with increased complexity or difficulty.

This discrepancy showed the impact of system complexity on users' perceptions of ease of use. It indicates that as the difficulty level of the game increased, participants were more likely to perceive the system as less intuitive or straightforward to navigate.
This finding has significant implications for the design and development of the game, highlighting the importance of balancing complexity with user-friendliness to ensure optimal usability across different skill levels. By refining the gameplay and addressing areas of complexity identified in the Hard Mode, we can strive to enhance overall user experience and satisfaction.

## 4. Process

### Collaboration

Throughout this project, we applied various methods to ensure smooth teamwork. We used Teams as our main communication platform, which allowed us to maintain real-time communication in remote or hybrid setup. The features in Microsoft Teams, like video calls, team chat, and file sharing, really stepped up our teamwork. This made it easier to collaborate efficiently, ensuring that information flowed smoothly without any interruptions.

<img src="https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/9e63b1da-2bfd-43a6-8e53-44a8373c9d34" alt="Teams" width="600">

At the start of the project, we made sure that every team member was clear about their role and specific responsibilities. This measure reduced redundant work and misunderstandings, with each role being assigned clear expectations, from project managers to technical experts, each person held accountable for the project's success.

## Tools and techniques

We chose Jira as our project management tool to create a Kanban board, which supports agile development workflows, allowing us to effectively plan, track, and release software development projects. A successful Kanban board focuses on continuous improvements (referred to as kaizen) [1]. 

<img src="https://github.com/UoB-COMSM0110/2024-group-10/assets/47950124/cdf1402a-b4d3-422c-b0dd-c38745101e0e" alt="Kanban Board" width="600">

We recognised the limitations of using a Kanban board to track progress, for example the length of a task is not always estimated appropriately [2]. To overcome this, we set up regular team meetings, including weekly progress updates and strategy discussions as needed. These meetings not only allowed us to monitor project progress in real time but also provided a platform for everyone to express opinions and raise issues, ensuring transparency in decision-making and synchronisation within the team.

(add meeting images)

## 7. Conclusion

Hannah: 1.00

Jennifer: 1.00

Mengmeng: 1.00

Sudan: 1.00

Shunyi: 1.00

Antai: 1.00

Reflecting on our project journey, we’ve encountered and overcome many challenges, such as refining collision detection, implementing multiplayer functionality and coordinating remote work during the Easter holidays. These hurdles reinforced the importance of effective communication and teamwork. The technical challenges also required collaborative debugging sessions. Understanding each other’s coding styles also proved challenging at times, however this process resulted in a deeper understanding of a code and the sharing of knowledge within the team. Moving forward, this experience will serve as a founding for future coding group projects.

Looking ahead, we plan further refining gameplay mechanisms, and integrating new features such as power-ups and level generation. Optimising performance is still a priority to ensure the game remains robust. In conclusion, our project journey has not only strengthened our technical skills, but it has also provided valuable insights into the software engineering process, including agile methods, requirements planning and evaluation techniques, which will undoubtedly be beneficial in future projects. 


