
public class GamePlay {

  private color[][] piecePlacedColor= new color[10][20];


  int squerSize =height/20;
  int pieceColor;
  int shapeX;
  int shapeY;
  int point;

  int lineColor;
  int insideColor;
  int time;


  public GamePlay() {
    for (int i=0; i<10; i++) {
      for (int j=0; j<20; j++) {
        piecePlacedColor[i][j]=insideColor;
      }
    }
  }

  public void changeColor(boolean isDarkMood) {
    for (int i=0; i<10; i++) {
      for (int j=0; j<20; j++) {
        if (!isDarkMood) {
          if (piecePlacedColor[i][j]==0)piecePlacedColor[i][j]=255;
        } else if (piecePlacedColor[i][j]==255)piecePlacedColor[i][j]=0;
      }
    }
  }

  public boolean canRotate(Shape shape) {
    shape.rotate();
    int wichShape = shape.tetrisGod;
    for (int i=0; i<4; i++) {
      shapeX=shape.piece[wichShape][i][0];
      shapeY=shape.piece[wichShape][i][1];
      if (piecePlacedColor[shapeX][shapeY] != insideColor) {
        shape.rotate();
        shape.rotate();
        return false;
      }
    }
    shape.rotate();
    return true;
  }

  public void savedPieces() {
    int j=0;
    for (int i = 0; i < 200; i++) {
      int k;
      if (i == 0) {
        k=0;
      } else {
        k=i-j*10;
      }

      fill(piecePlacedColor[k][j]);
      stroke(lineColor);
      rect(squerSize * k, squerSize * j, height/20, height/20);

      if ((i+1) % 10==0) {
        j++;
      }
    }
  }


  public void makeShape(Shape shape) {
    int wichShape = shape.tetrisGod;
    for (int i=0; i<4; i++) {
      shapeX=shape.piece[wichShape][i][0];
      shapeY=shape.piece[wichShape][i][1];
      piecePlacedColor[shapeX][shapeY] = shape.pieceColor[wichShape];
    }

    for (int l = 0; l < 20; l++) {
      if (gamePlay.checkLineIsfull(l))gamePlay.deletTheFullLine(l);
    }
  }

  public boolean checkOtherPieces(Shape shape) {
    int wichShape = shape.tetrisGod;
    for (int i=0; i<4; i++) {
      shapeX=shape.piece[wichShape][i][0];
      shapeY=shape.piece[wichShape][i][1];
      if (shapeY<19) {
        if (piecePlacedColor[shapeX][shapeY+1]!= insideColor) return false;
      }
    }
    return true;
  }



  public void deletTheFullLine(int line) {
    color[][] newPiecePlaceMent= new color[10][20];
    for (int i=0; i<10; i++) {
      for (int j=0; j<20; j++) {
        newPiecePlaceMent[i][j]=insideColor;
      }
    }
    for (int i=0; i<10; i++) {
      for (int j=0; j<20; j++) {
        newPiecePlaceMent[i][j]=piecePlacedColor[i][j];
      }
    }
    for (int k=line; k>19; k++) {
      for (int l=0; l<10; l++) {
        newPiecePlaceMent[l][k]=piecePlacedColor[l][k];
      }
    }
    for (int k=line; k>0; k--) {
      for (int l=0; l<10; l++) {
        newPiecePlaceMent[l][k]=piecePlacedColor[l][k-1];
      }
    }
    piecePlacedColor=newPiecePlaceMent;
    point++;
  }

  public boolean checkLineIsfull(int line) {
    for (int i=0; i<10; i++) {
      if (piecePlacedColor[i][line]==insideColor)return false;
    }
    return true;
  }

  public void level(Shape shape) {
    for (int j=0; j<gamePlay.point; j++) {
      shape.moving();
    }
  }
  public void lose() {
    for (int l=0; l<10; l++) {
      if (piecePlacedColor[l][0]!=insideColor) {
        rectMode(CENTER);
        fill(insideColor);
        rect(width/2, height/2, 300, 100);
        textAlign(CENTER, CENTER);
        fill(lineColor);
        text("You Lost!!", width/2, height/2);
        start=true;
        noLoop();
      }
    }
  }

  public boolean canMove(Shape shape, String direction) {
    int wichShape = shape.tetrisGod;
    for (int k=0; k<4; k++) {
      shapeX=shape.piece[wichShape][k][0];
      shapeY=shape.piece[wichShape][k][1];
      if (direction.equals("l") && shapeX>0 && piecePlacedColor[shapeX-1][shapeY]!=insideColor)return false;
      if (direction.equals("r") && shapeX<9 && piecePlacedColor[shapeX+1][shapeY]!=insideColor)return false;
    }
    return true;
  }
}
