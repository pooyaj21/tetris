import java.util.Arrays;

class Shape {
  int squerSize =height/20;
  Shape newShape;
  private int [][] o = {{4, 0}, {5, 0}, {4, 1}, {5, 1}};
  private int [][] i = {{3, 0}, {4, 0}, {5, 0}, {6, 0}};
  private int [][] t = {{3, 1}, {4, 1}, {5, 1}, {4, 0}};
  private int [][] j = {{3, 0}, {3, 1}, {4, 1}, {5, 1}};
  private int [][] l = {{3, 1}, {4, 1}, {5, 1}, {5, 0}};
  private int [][] s = {{3, 1}, {4, 0}, {4, 1}, {5, 0}};
  private int [][] z = {{3, 0}, {4, 0}, {4, 1}, {5, 1}};
  private int [][][] piece = { o, i, t, j, l, s, z};
  private int [][][] pieceRotate = { o, i, t, j, l, s, z};
  private color [] pieceColor = {#cdcd00, #00cdcd, #9a00cd, #0000cd, #cd6600, #00cd00, #cd0000};
  private int rotateCount=0;
  //int tetrisGod =0; //debug
  int tetrisGod =(int)random(7);
  int time=1;

  void display() {

    for (int i=0; i<4; i++) {
      fill(pieceColor[tetrisGod]);
      rect(piece[tetrisGod][i][0]*squerSize, piece[tetrisGod][i][1]*squerSize, squerSize, squerSize);
    }
  }

  void move(String direction) {

    if ( checkCollision(direction) ) {

      if ( direction == "r") {
        for (int i=0; i<4; i++) {
          piece[tetrisGod][i][0]++;
        }
      }
      if ( direction == "l") {
        for (int i=0; i<4; i++) {
          piece[tetrisGod][i][0]--;
        }
      }
      if ( direction == "d") {
        for (int i=0; i<4; i++) {
          piece[tetrisGod][i][1]++;
        }
      }
    }
  }


  void rotate() {
    if ( checkCollision("r")&&checkCollision("l")&&checkCollision("d") ) {
      if (tetrisGod!=0) {
        for (int j=0; j<2; j++) {
          int [][][] rotated = new int[7][4][2];
          if (rotateCount%4==0) {
            for (int i=0; i<4; i++) {
              rotated[tetrisGod][i][0] = pieceRotate[tetrisGod][i][1]-piece[tetrisGod][1][0];
              rotated[tetrisGod][i][1] = -pieceRotate[tetrisGod][i][0]-piece[tetrisGod][1][1];
            }
          }
          if (rotateCount%4==1) {
            for (int i=0; i<4; i++) {
              rotated[tetrisGod][i][0] = -pieceRotate[tetrisGod][i][0]-piece[tetrisGod][1][0];
              rotated[tetrisGod][i][1] = -pieceRotate[tetrisGod][i][1]-piece[tetrisGod][1][1];
            }
          }
          if (rotateCount%4==2) {
            for (int i=0; i<4; i++) {
              rotated[tetrisGod][i][0] = -pieceRotate[tetrisGod][i][1]-piece[tetrisGod][1][0];
              rotated[tetrisGod][i][1] = pieceRotate[tetrisGod][i][0]-piece[tetrisGod][1][1];
            }
          }
          if (rotateCount%4==3) {
            for (int i=0; i<4; i++) {
              rotated[tetrisGod][i][0] = pieceRotate[tetrisGod][i][0]-piece[tetrisGod][1][0];
              rotated[tetrisGod][i][1] = pieceRotate[tetrisGod][i][1]-piece[tetrisGod][1][1];
            }
          }
          piece = rotated ;
        }
        rotateCount++;
      }
    }
  }


  boolean checkCollision(String direction) {
    for (int i=0; i<4; i++) {
      if ( direction == "r" && piece[tetrisGod][i][0]>=9) {
        return false;
      }
      if ( direction == "l" && piece[tetrisGod][i][0]<=0) {
        return false;
      }
      if ( direction == "d" && piece[tetrisGod][i][1]>19) {
        return false;
      }
      if (piece[tetrisGod][i][1]==19) {
        return false;
      }
    }
    return true;
  }

  void collisionForRotate(int piece) {
    if (piece==1) {
      //TODO: rotation
    }
  }

  void moving () {
    if (time%60 == 0) {
      move("d");
    }
    time++;
  }
}
