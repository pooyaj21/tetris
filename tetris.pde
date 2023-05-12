Shape shape;

int spawnX=50;
int spawnY=50;
int tetrisGod;

void setup() {
  size(650, 900);
  shape = new Shape();
}

void draw() {

  background(0);
  Grid();
  shape.display();
  //shape.moving();
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

void keyReleased(){
    if (keyCode == UP || key == 'w'||key == 'W') {
    shape.rotate();
  }
}
