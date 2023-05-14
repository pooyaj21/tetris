public class Screen {
  
  int squerSize =height/20;
  int j=0;
  
  int lineColor=255;
  int insideColor=0;
  
  public void display() {
    for (int i = 0; i < 200; i++) {
      int k;
      if (i == 0) {
        k=0;
      } else {
        k=i-j*10;
      }

      noFill();
      stroke(lineColor);
      rect(squerSize * k, squerSize * j, height/20, height/20);

      if ((i+1) % 10==0) {
        j++;
      }
    }

    noStroke();
    fill(insideColor);
    rect(squerSize*10+1, 0, squerSize*10, height);
  }
  public void showNextPiece(Shape nextShape ,int shapenumber) {
    for (int i=0; i<4; i++) {
      stroke(lineColor);
      fill(nextShape.pieceColor[shapenumber]);
      rect(nextShape.piece[shapenumber][i][0]*squerSize+(squerSize*9)-(squerSize/2), nextShape.piece[shapenumber][i][1]*squerSize+(height/20), squerSize, squerSize);
    }
    textAlign(CENTER, CENTER);
    textSize((height/20)); 
    text("Next Shape",(squerSize*13),(height/20)*4);
  }
  
  public void showPoint(GamePlay gamePlay){
    textAlign(CENTER, CENTER);
    textSize((height/20)); 
    text("Point:",(squerSize*13),(height/20)*7);
    text((gamePlay.point)*100,(squerSize*13),(height/20)*8);
  }
}
