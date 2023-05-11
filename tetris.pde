PShape s;
int squerSize =50;
int spawnX=50;
int spawnY=50;
void setup() {
  size(600, 900);
  background(0);
  drawSquer();
}

void draw() {
  straight();
}

void drawSquer() {
  s = createShape();
  s.beginShape();
  s.stroke(255);
  s.fill(0, 0, 255);
  s.vertex(0, 0);
  s.vertex(0, squerSize);
  s.vertex(squerSize, squerSize);
  s.vertex(squerSize, 0);
  s.endShape(CLOSE);
}

void straight(){
 shape(s, spawnX, spawnY);
 shape(s, spawnX,spawnY+squerSize);
 shape(s, spawnX,spawnY+2*(squerSize));
 shape(s, spawnX,spawnY+3*(squerSize));
}
