class Button{
  private int x,y,len,num, row, col;
  private boolean isCovered, isBomb, isFlagged;
  Button(int x, int y, int len, boolean isBomb, int row, int col){
    this.x = x;
    this.y = y;
    this.len = len;
    this.isBomb = isBomb;
    isCovered = true;
    isFlagged = false;
    this.row = row;
    this.col = col;
  }
  
  public void show(){
    if(isCovered){
      fill(255);
      triangle(x-len/2, y-len/2,  x+len/2, y-len/2,  x-len/2, y+len/2);
      fill(100);
      triangle(x+len/2, y+len/2,  x+len/2, y-len/2,  x-len/2, y+len/2);
      fill(175);
      rect(x-len/2+6, y-len/2+6, len-12, len-12);
      if(isFlagged){
        image(flag, x-len/2+6, y-len/2+6, len-12, len-12);
      }
    }
    else{
      fill(175);
      rect(x-len/2, y-len/2, len, len);
      if(isBomb){
        image(bomb, x-len/2+6, y-len/2+6, len-12, len-12);
      }
      else{
        if(num == 1){
          fill(0, 0, 255);
          text("1", x, y+len/2-10);
        }
        if(num == 2){
          fill(0, 130, 0);
          text("2", x, y+len/2-10);
        }
        if(num == 3){
          fill(254, 0, 0);
          text("3", x, y+len/2-10);
        }
        if(num == 4){
          fill(0, 0, 132);
          text("4", x, y+len/2-10);
        }
        if(num == 5){
          fill(132, 0, 0);
          text("5", x, y+len/2-10);
        }
        if(num == 6){
          fill(0, 130, 132);
          text("6", x, y+len/2-10);
        }
        if(num == 7){
          fill(132, 0, 132);
          text("7", x, y+len/2-10);
        }
        if(num == 8){
          fill(117, 117, 117);
          text("8", x, y+len/2-10);
        }
      }
    }
  }
  
  public void onLClick(){
    if(isFlagged){
      isFlagged = false;
    }
    else{
      if(isBomb){
        lost();
      }
      else{
        if(num == 0){
          uncover0s(row, col);
        }
        else
          isCovered = false;
      }
    }
  }
  public void onRClick(){
    if(isCovered){
      isFlagged = !isFlagged;
    }
    else if(allAdjacentBombsAreFlagged(row,col)){
      uncoverAdjacent(row,col);
    }
  }
  
  public void removeAdjacentBombs(){
    removeBombs(row, col);
  }
  
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public int getNum(){
    return num;
  }
  public int getRow(){
    return row;
  }
  public int getCol(){
    return col;
  }
  public boolean isBomb(){
    return isBomb;
  }
  public boolean isFlagged(){
    return isFlagged;
  }
  public boolean isCovered(){
    return isCovered;
  }
  public void setNum(int num){
    this.num = num;
  }
  public void setIsBomb(boolean val){
    this.isBomb = val;
  }
  public void uncover(){
    isCovered = false;
  }
}
