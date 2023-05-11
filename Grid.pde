void Grid() {

int squerSize =height/20;
  int j=0;
  for (int i = 0; i < 200; i++) {
    int k;
    if (i == 0) {
      k=0;
    } else {
      k=i-j*10;
    }
    
    fill(0);
    stroke(255);
    rect(squerSize * k, squerSize * j, height/20, height/20);
    
    if ((i+1) % 10==0) {
      j++;
    }
  }
}
