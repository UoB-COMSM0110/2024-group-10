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

//UI related vars
boolean rectOver = false;
color rectColor = color(0,0,102);
color currentColor = rectColor;
color rectHighlight = color(0,0,50);
Button currentButton = Button.NONE;
Screen currentScreen = Screen.START;
PImage planecursor;

//UI related functions below:
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

//checks if mouse over button
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
