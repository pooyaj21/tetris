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
  //int tetrisGod =6; //debug
  int tetrisGod =(int)random(7);
  int time=1;
  
  boolean draw;

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
    if (tetrisGod!=0) {
      if (checkCollision("")){
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
      collisionForRotate(rotateCount);
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

  void collisionForRotate(int rotateCount) {
    // rotation i piece
    if (tetrisGod==1 && rotateCount%4==0 && piece[tetrisGod][1][1]==0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][1]=piece[tetrisGod][i][1]+2;
      }
    }
    if (tetrisGod==1 && rotateCount%4==0 && piece[tetrisGod][1][1]==1) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][1]++;
      }
    }
    if (tetrisGod==1 && rotateCount%4==1 && piece[tetrisGod][3][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]=piece[tetrisGod][i][0]+2;
      }
    }

    if (tetrisGod==1 && rotateCount%4==3 && piece[tetrisGod][0][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==1 && rotateCount%4==1 && piece[tetrisGod][0][0]==10) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }
    if (tetrisGod==1 && rotateCount%4==3 && piece[tetrisGod][3][0]>9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]=piece[tetrisGod][i][0]-2;
      }
    }

    //rotation t piece
    if (tetrisGod==2 && rotateCount%4==3 && piece[tetrisGod][1][0]==0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==2 && rotateCount%4==1 && piece[tetrisGod][1][0]==9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }

    //rotation j piece
    if (tetrisGod==3 && rotateCount%4==0 && piece[tetrisGod][0][1]==1) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][1]++;
      }
    }
    if (tetrisGod==3 && rotateCount%4==0 && piece[tetrisGod][0][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==3 && rotateCount%4==1 && piece[tetrisGod][3][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==3 && rotateCount%4==2 && piece[tetrisGod][0][0]>9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }
    if (tetrisGod==3 && rotateCount%4==3 && piece[tetrisGod][3][0]>9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }
    //rotation l piece
    if (tetrisGod==4 && rotateCount%4==3 && piece[tetrisGod][0][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==4 && rotateCount%4==1 && piece[tetrisGod][0][0]>9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }
    //rotation s piece
    if (tetrisGod==5 && rotateCount%4==0 && piece[tetrisGod][3][1]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][1]++;
      }
    }
    if (tetrisGod==5 && rotateCount%4==1 && piece[tetrisGod][3][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==5 && rotateCount%4==3 && piece[tetrisGod][3][0]>9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }
    //rotation z piece
    if (tetrisGod==6 && rotateCount%4==0 && piece[tetrisGod][3][1]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][1]++;
      }
    }
    if (tetrisGod==6 && rotateCount%4==1 && piece[tetrisGod][3][0]<0) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]++;
      }
    }
    if (tetrisGod==6 && rotateCount%4==3 && piece[tetrisGod][3][0]>9) {
      for (int i=0; i<4; i++) {
        piece[tetrisGod][i][0]--;
      }
    }
  }

  void moving () {
    if (time%60 == 0) {
      move("d");
    }
    for (int i=0; i<4; i++) {
    if (piece[tetrisGod][i][1]==19) {
        draw = false;
      }
    }
    time++;
  }
}
