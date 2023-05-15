Shape shape;
Shape newShape;
GamePlay gamePlay;
Screen baseScreen;

int spawnX=50;
int spawnY=50;
int tetrisGod;

boolean darkMood = true;
public int squerSize =height/20;

void setup() {
  size(750, 900);
  shape = new Shape();
  shape.draw=true;
  newShape = new Shape();
  gamePlay = new GamePlay();
  baseScreen = new Screen();
}

void draw() {
  darkMood();
  gamePlay.savedPieces();
  baseScreen.display();
  shape.display();
  baseScreen.showNextPiece(newShape, newShape.tetrisGod);
  baseScreen.showPoint(gamePlay);
  if (gamePlay.checkOtherPieces(shape)) {
    shape.moving();
    gamePlay.level(shape);
  } else shape.draw=false;
  drawSahpe();
  gamePlay.lose();
}

void drawSahpe() {
  if (!(shape.draw)) {
    gamePlay.makeShape(shape);
    shape= newShape;
    shape.draw=true;
    newShape = new Shape();
  }
}

void keyPressed() {
  if (keyCode == RIGHT || key == 'd'||key == 'D') {
    if (gamePlay.canMove(shape, "r")) shape.move("r");
  }
  if (keyCode == LEFT || key == 'a'||key == 'A') {
    if (gamePlay.canMove(shape, "l")) shape.move("l");
  }
  if (keyCode == DOWN || key == 's'||key == 'S') {
    shape.move("d");
  }
}

void keyReleased() {
  if (keyCode == UP || key == 'w'||key == 'W') {
    if (gamePlay.canRotate(shape))shape.rotate();
    else shape.rotate();
  }
  if (key == 'P'|| key == 'p') {
    darkMood = !darkMood;
  }
}

void darkMood() {
  gamePlay.changeColor(darkMood);
  if (darkMood) {
    shape.lineColor=255;
    baseScreen.lineColor=255;
    baseScreen.insideColor=0;
    gamePlay.lineColor=255;
    gamePlay.insideColor=0;
  } else {
    shape.lineColor=0;
    baseScreen.lineColor=0;
    baseScreen.insideColor=255;
    gamePlay.lineColor=0;
    gamePlay.insideColor=255;
  }
}
