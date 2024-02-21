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
  PAUSE
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
}

void draw() {
  
  if (currentScreen == Screen.START){
    background(51);
    createButton(mouseX,mouseY,350,500,250,100, Button.GAMEB);
    fill(255);
    textSize(50);
    text("START", 405, 565);
   
    createButton(mouseX,mouseY,350,610,250,100, Button.EXITB);
    fill(255);
    textSize(50);
    text("EXIT", 425, 675); 
   
    text("Shooting Game Prototype Title", 180, 150);
    cursor(planecursor);
  }
  else if (currentScreen == Screen.GAME){
    currentButton = Button.NONE;
    noCursor();
    background(0);
    textSize(50);
    text("Placeholder text: Gameplay screen here", 100, 150);
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
    text("GAME PAUSED", 330, 150);
    
    createButton(mouseX,mouseY,350,250,250,100, Button.GAMEB);
    fill(255);
    textSize(40);
    text("RESUME", 400, 315);
    
    createButton(mouseX,mouseY,350,360,250,100, Button.STARTB);
    fill(255);
    textSize(40);
    text("MAIN MENU", 380, 420);
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
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    currentButton = b;
    //println(currentButton);
    return true;
  } 
  else {
    //currentButton = Button.NONE;
    return false;
  }
}
