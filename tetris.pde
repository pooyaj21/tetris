import processing.sound.*;

Shape shape;
Shape newShape;
GamePlay gamePlay;
Screen baseScreen;

SoundFile themMusic;
SoundFile o;
SoundFile i;
SoundFile t;
SoundFile j;
SoundFile l;
SoundFile s;
SoundFile z;


PImage resetBottemW;
PImage resetBottemB;
PImage moon;
PImage sun;

boolean meme;
boolean soundPlayed;
boolean themPlayed;
boolean start;
boolean darkMood = true;
int squerSize =height/20;
float amplitude =0.2;

void setup() {
  size(750, 900);
  shape = new Shape();
  shape.draw=true;
  newShape = new Shape();
  gamePlay = new GamePlay();
  baseScreen = new Screen();
  themMusic= new SoundFile (this, "assets/tetrisTheme.mp3");
  o= new SoundFile (this, "assets/O.mp3");
  i= new SoundFile (this, "assets/I.mp3");
  t= new SoundFile (this, "assets/T.mp3");
  j= new SoundFile (this, "assets/J.mp3");
  l= new SoundFile (this, "assets/L.mp3");
  s= new SoundFile (this, "assets/S.mp3");
  z= new SoundFile (this, "assets/Z.mp3");
  themMusic.loop();
}

void draw() {
  darkMood();
  if (!start) {
    gamePlay.savedPieces();
    baseScreen.display();
    shape.display();
    baseScreen.showNextPiece(newShape, newShape.tetrisGod);
    baseScreen.showPoint(gamePlay);
    if (gamePlay.checkOtherPieces(shape)) {
      shape.moving();
      if (!soundPlayed && meme) music(shape);
    } else shape.draw=false;
    drawSahpe();
    gamePlay.lose();
    darkModeVisula();
    gamePlay.level(shape);
  }
}

void drawSahpe() {
  if (!(shape.draw)) {
    gamePlay.makeShape(shape);
    shape= newShape;
    shape.draw=true;
    newShape = new Shape();
    soundPlayed = false;
  }
}

void keyPressed() {
  if (keyCode == RIGHT || key == 'd'||key == 'D') {
    if (gamePlay.canMove(shape, "r")) shape.move("r");
  }
  if (keyCode == LEFT || key == 'a'||key == 'A') {
    if (gamePlay.canMove(shape, "l")) shape.move("l");
  }
}

void keyReleased() {
  if (keyCode == UP || key == 'w'||key == 'W') {
    if (gamePlay.canRotate(shape))shape.rotate();
    else shape.rotate();
  }
  if (keyCode == DOWN || key == 's'||key == 'S') {
    shape.move("d");
  }
    if (key == 'm'||key == 'M') {
    meme=!meme;
  }
}

void mousePressed() {
  if (mouseX > 7*(squerSize*13) && mouseX < (7*(squerSize*13))+squerSize*12 && mouseY < squerSize*12)darkMood = !darkMood;
  if (mouseX > width-(squerSize*12) && mouseY < squerSize*12)reset();
}

void darkModeVisula() {
  if (darkMood) {
    sun = loadImage("assets/sun.png");
    sun.resize(squerSize*12, squerSize*12);
    image(sun, 7*(squerSize*13), 0);
    resetBottemW = loadImage("assets/resetW.png");
    resetBottemW.resize(squerSize*13, squerSize*13);
    image(resetBottemW, width-(squerSize*12), -5);
  } else {
    moon = loadImage("assets/moon.png");
    moon.resize(squerSize*12, squerSize*12);
    image(moon, 7*(squerSize*13), 0);
    resetBottemB = loadImage("assets/resetB.png");
    resetBottemB.resize(squerSize*13, squerSize*11);
    image(resetBottemB, width-(squerSize*12), 0);
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

void reset() {
  shape = new Shape();
  shape.draw=true;
  newShape = new Shape();
  gamePlay = new GamePlay();
  baseScreen = new Screen();
  soundPlayed = false;
  start=false;
}

void music(Shape shape) {
  if (shape.tetrisGod==0) o.play();
  if (shape.tetrisGod==1) i.play();
  if (shape.tetrisGod==2) t.play();
  if (shape.tetrisGod==3) j.play();
  if (shape.tetrisGod==4) l.play();
  if (shape.tetrisGod==5) s.play();
  if (shape.tetrisGod==6) z.play();
  soundPlayed=true;
}
