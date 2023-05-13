public class GamePlay {

  private color[][] piecePlacedColor= new color[10][20];
  int squerSize =height/20;
  int pieceColor;
  int shapeX;
  int shapeY;

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
      stroke(255);
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

  }

  public boolean checkOtherPieces(Shape shape) {
    int wichShape = shape.tetrisGod;
    for (int i=0; i<4; i++) {
      shapeX=shape.piece[wichShape][i][0];
      shapeY=shape.piece[wichShape][i][1];
      if (shapeY<19) {
        if (piecePlacedColor[shapeX][shapeY+1]!= 0) return false;
      }
    }
    return true;
  }

  public void deletTheFullLine(int line){
    color[][] newPiecePlaceMent= new color[10][20];
    for (int i=0; i<10; i++) {
      for (int j=0; j<line; j++) {
        newPiecePlaceMent[i][j]=piecePlacedColor[i][j];
      }
    }
    for (int k=line; k>=1; k--) {
      for (int l=0; l<10; l++) {
        newPiecePlaceMent[l][k]=piecePlacedColor[l][k-1];
      }
    }
    piecePlacedColor=newPiecePlaceMent;
  }

  public boolean checkLineIsfull(int line) {
    for (int i=0; i<10; i++) {
      if (piecePlacedColor[i][line]==0)return false;
    }
    return true;
  }
 
  
}
