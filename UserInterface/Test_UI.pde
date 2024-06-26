//plane cursor image is open-source free use license. 
//source link: https://www.iconarchive.com/show/fluentui-emoji-flat-icons-by-microsoft/Small-Airplane-Flat-icon.html

enum Button {
  NONE,
  GAMEB,
  EXITB,
  STARTB
}

enum Screen {
  START,
  GAME,
  PAUSE,
  VICTORY,
  GAMEOVER
}

boolean rectOver = false;
color rectColor = color(0,0,102);
color currentColor = rectColor;
color rectHighlight = color(0,0,50);
Button currentButton = Button.NONE;
Screen currentScreen = Screen.START;
PImage planecursor;

void setup(){
  size(1000, 1000);
  planecursor = loadImage("planecursor.gif");
  background(51);
  textAlign(CENTER);
  rectMode(CENTER);
}

void draw() {
  
  if (currentScreen == Screen.START){
    background(51);
    createButton(mouseX,mouseY,500,500,250,100, Button.GAMEB);
    fill(255);
    textSize(50);
    text("START", 500, 515);
   
    createButton(mouseX,mouseY,500,610,250,100, Button.EXITB);
    fill(255);
    textSize(50);
    text("EXIT", 500, 625); 
   
    text("Shooting Game Prototype Title", 500, 150);
    cursor(planecursor);
  }
  else if (currentScreen == Screen.GAME){
    currentButton = Button.NONE;
    noCursor();
    background(0);
    textSize(50);
    text("Placeholder text: Gameplay screen here", 500, 150);
    if(keyPressed) {
      if(key == ESC){
        currentScreen = Screen.PAUSE;
      }
    }
  }
  else if (currentScreen == Screen.PAUSE)
  {
    cursor(planecursor);
    background(51);
    textSize(50);
    text("GAME PAUSED", 500, 150);
    
    createButton(mouseX,mouseY,500,250,250,100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("RESUME", 500, 265);
    
    createButton(mouseX,mouseY,500,360,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", 500, 375);
  }
  else if (currentScreen == Screen.GAMEOVER)
  {
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("GAME OVER!", 500, 200);
    
    textSize(30);
    text("Oh no! \n You died. The aliens have won. \nBetter luck next time :(", 500, 300);
    
    textSize(50);
    text("FINAL SCORE:", 500, 500);
    
    createButton(mouseX,mouseY,500,700,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", 500, 715);
  }
  else if (currentScreen == Screen.VICTORY)
  {
    cursor(planecursor);
    background(51);
    
    textSize(50);
    text("CONGRATULATIONS!", 500, 200);
    
    textSize(30);
    text("A winner is you! \n The aliens have been defeated and the world is saved!", 500, 300);
    
    textSize(50);
    text("FINAL SCORE:", 500, 500);
    
    createButton(mouseX,mouseY,500,700,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", 500, 715);
  }  
  
  //println(currentButton);
  
}

// default ESC in processing will close the window. This overrides that.
void keyPressed(){
 if (key == ESC){
   key = 0;
 }
}

void mousePressed(){
  if (currentButton == Button.EXITB)
  {
    exit();
  }
  else if (currentButton == Button.GAMEB){
    currentScreen = Screen.GAME;
  }
  else if (currentButton == Button.STARTB){
    currentScreen = Screen.START;
  }
}

void createButton(int x, int y, int rectX, int rectY, int rectW, int rectH, Button b){
  update(x,y,rectX,rectY,rectW,rectH, b);
  stroke(255);
  rect(rectX,rectY,rectW,rectH);
}

void update(int x, int y, int rectX, int rectY, int rectW, int rectH, Button b) {
    if (overRect(rectX, rectY, rectW, rectH, b)) {
      fill(rectHighlight);
    }
    else{
      fill(rectColor);
    }
}

boolean overRect(int x, int y, int width, int height, Button b){
  if (mouseX >= x-0.5*width && mouseX <= x+0.5*width && 
      mouseY >= y-0.5*height && mouseY <= y+0.5*height) {
    currentButton = b;
    //println(currentButton);
    return true;
  } 
  else {
    //currentButton = Button.NONE;
    return false;
  }
}
