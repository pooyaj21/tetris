Shape shape;
Shape newShape;
GamePlay gamePlay;

int spawnX=50;
int spawnY=50;
int tetrisGod;
public int squerSize =height/20;

void setup() {
  size(650, 900);
  shape = new Shape();
  shape.draw=true;
  newShape = new Shape();
  gamePlay = new GamePlay();
}

void draw() {
  //background(0);
  gamePlay.savedPieces();
  Grid();
  shape.display();
  if (gamePlay.checkOtherPieces(shape)) {
    shape.moving();
  } else shape.draw=false;
  drawSahpe();
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
    shape.move("r");
  }
  if (keyCode == LEFT || key == 'a'||key == 'A') {
    shape.move("l");
  }
  if (keyCode == DOWN || key == 's'||key == 'S') {
    shape.move("d");
  }
}

void keyReleased() {
  if (keyCode == UP || key == 'w'||key == 'W') {
    shape.rotate();
  }
}
