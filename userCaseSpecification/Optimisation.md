{\rtf1\ansi\ansicpg936\cocoartf2757
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;\f2\froman\fcharset0 TimesNewRomanPSMT;
}
{\colortbl;\red255\green255\blue255;\red24\green26\blue30;\red255\green255\blue255;\red0\green0\blue0;
}
{\*\expandedcolortbl;;\cssrgb\c12157\c13725\c15686;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;
}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}.}{\leveltext\leveltemplateid1\'02\'00.;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{circle\}}{\leveltext\leveltemplateid2\'01\uc0\u9702 ;}{\levelnumbers;}\fi-360\li1440\lin1440 }{\listname ;}\listid1}
{\list\listtemplateid2\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}.}{\leveltext\leveltemplateid101\'02\'00.;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listlevel\levelnfc2\levelnfcn2\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{lower-roman\}.}{\leveltext\leveltemplateid102\'02\'01.;}{\levelnumbers\'01;}\fi-360\li1440\lin1440 }{\listname ;}\listid2}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}{\listoverride\listid2\listoverridecount0\ls2}}
\paperw11900\paperh16840\margl1440\margr1440\vieww23900\viewh13380\viewkind0
\deftab720
\pard\pardeftab720\sa320\partightenfactor0

\f0\b\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
Use Case: Aircraft Control and Collision Detection Optimization
\f1\b0 \cf4 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls1\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	1.	}\expnd0\expndtw0\kerning0
Use Case Name: Aircraft Control and Collision Detection Optimization\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls1\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	2.	}\expnd0\expndtw0\kerning0
Brief Description: Two key optimizations\'97refined aircraft turning control and continuous high-precision collision detection\'97to significantly enhance the player's control experience and the accuracy of interactions.\
\pard\tx940\tx1440\pardeftab720\li1440\fi-1440\partightenfactor0
\ls1\ilvl1
\f0\b \cf2 \kerning1\expnd0\expndtw0 {\listtext	\uc0\u9702 	}\expnd0\expndtw0\kerning0
Refined Turning Control
\f1\b0 : Turning is no longer just a simple change in angle but can smoothly transition from slow to fast turning based on the duration of the player's inputs, making the control feel more natural and nuanced.\
\ls1\ilvl1
\f0\b \kerning1\expnd0\expndtw0 {\listtext	\uc0\u9702 	}\expnd0\expndtw0\kerning0
Continuous High-Precision Collision Detection
\f1\b0 : Collision detection in the game goes beyond simple rectangular or circular bounding boxes, enabling precise matching based on the actual contours of the aircraft and bullets.\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls1\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	3.	}\expnd0\expndtw0\kerning0
Precondition: The player has started the game and is in control of the aircraft.\
\pard\pardeftab720\sa320\partightenfactor0

\f0\b \cf2 Basic Flow:
\f1\b0 \cf4 \
\pard\pardeftab720\li480\fi-480\sa320\partightenfactor0
\cf2 1.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 Players control the aircraft's direction using the keyboard to dodge attacks.\cf4 \
\cf2 2.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 When the player simultaneously presses the "W+A" keys on the keyboard, it results in turning left, and pressing "W+D" results in turning right. The game engine dynamically adjusts the turning speed and angle of the aircraft based on the duration of the simultaneous pressing of the "W" key (forward) and either the "A" or "D" key (left or right).\cf4 \
\cf2 3.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 The game system generates bullet patterns based on the current level design and updates the aircraft's position in response to the player's actions.\cf4 \
\cf2 4.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 Accurate collision detection is performed in real-time, based on the actual contours of the aircraft and bullets, to determine if the aircraft has come into contact with bullets or enemies.\cf4 \
\cf2 5.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 If a collision is detected, the game executes corresponding outcomes based on the nature of the collision, such as reducing life points or displaying explosion effects, and provides immediate feedback to the player.\cf4 \
\cf2 6.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 The game interface is updated to display the player's current life points and score.\cf4 \
\cf2 7.
\f2\fs18\fsmilli9333 \'a0\'a0\'a0\'a0 
\f1\fs32 The player continues to challenge the level by dodging bullets and enemy attacks until the objective is achieved or the game ends.\cf4 \
\pard\pardeftab720\sa320\partightenfactor0

\f0\b \cf2 Alternative Flows:
\f1\b0 \cf4 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls2\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	1.	}\expnd0\expndtw0\kerning0
Player Customizes Direction Key Settings\
\pard\tx940\tx1440\pardeftab720\li1440\fi-1440\partightenfactor0
\ls2\ilvl1\cf2 \kerning1\expnd0\expndtw0 {\listtext	i.	}\expnd0\expndtw0\kerning0
The player goes to settings, modifies control options, and changes direction keys (e.g., from \'93W+A\'94, \'93W+D\'94 to other combinations).\
\ls2\ilvl1\kerning1\expnd0\expndtw0 {\listtext	ii.	}\expnd0\expndtw0\kerning0
The game confirms the changes and updates controls to match the new key settings.\
\ls2\ilvl1\kerning1\expnd0\expndtw0 {\listtext	iii.	}\expnd0\expndtw0\kerning0
The player navigates the aircraft with the new keys. The game adjusts its interface and feedback accordingly, ensuring smooth and intuitive control.\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls2\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	2.	}\expnd0\expndtw0\kerning0
Player Customizes Collision Detection Precision:\
\pard\tx940\tx1440\pardeftab720\li1440\fi-1440\partightenfactor0
\ls2\ilvl1\cf2 \kerning1\expnd0\expndtw0 {\listtext	i.	}\expnd0\expndtw0\kerning0
The player opens the game's settings menu and selects collision detection precision options.\
\ls2\ilvl1\kerning1\expnd0\expndtw0 {\listtext	ii.	}\expnd0\expndtw0\kerning0
The player chooses a desired precision level for collision detection, ranging from low to high.\
\ls2\ilvl1\kerning1\expnd0\expndtw0 {\listtext	iii.	}\expnd0\expndtw0\kerning0
Upon confirmation, the game updates its collision detection system to match the chosen precision level.\
}