public class GridCell {
  private boolean isBlocked = false;
  private boolean isStart = false;
  private boolean isGoal = false;
  private int distanceFromGoal;
  private int xCoord;
  private int yCoord;
  private int wide;
  private int high;

  
  public GridCell(int x, int y, int w, int h){
   xCoord = x;
   yCoord = y;
   wide = w;
   high = h;
   distanceFromGoal = -1;
  }
 
  public ArrayList<GridCell> getFreeNeighbors(GridCell[][] cells){
    ArrayList<GridCell> neighbors = new ArrayList<GridCell>();
    int c = getCol();
    int r = getRow();
    if(r - 1 >= 0){
      GridCell up = cells[r - 1][c];
      if(!up.isBlocked)
        neighbors.add(up);
    }
    if(r + 1 < cells.length){
      GridCell down = cells[r + 1][c];
       if(!down.isBlocked)
        neighbors.add(down);
    }
    if(c - 1 >= 0){
      GridCell left = cells[r][c - 1];
       if(!left.isBlocked)
        neighbors.add(left);
    }
    if(c + 1 < cells[0].length){
      GridCell right = cells[r][c + 1];
      if(!right.isBlocked)
        neighbors.add(right);
    }
     return neighbors;
  }
 
  public boolean isBlocked(){
    return isBlocked;
  }
  public boolean isStart(){
    return isStart;
  }
  public boolean isGoal(){
    return isGoal;
  }
  public int getDistance(){
    return distanceFromGoal;
  }
  
  public int getRow(){
    return yCoord / high;
  }
  public int getCol(){
   return xCoord/ wide; 
  }
  
  public void setObstacle(){
   if(!isGoal && !isStart){
     isBlocked = true;
     distanceFromGoal = -1;
   }
  }
  
  public void setOpen(){
    isBlocked = false;
  }
  
  public void setStart(){
   isStart = true; 
  }
  public void setGoal(){
   isGoal = true; 
  }
  public void setDistance(int d){
   distanceFromGoal = d; 
   
  }
  

  
   public void draw(){
     if(isGoal){
      fill(0, 255, 0);
      stroke(0); 
      rect(xCoord, yCoord, wide, high); 
     }else if(isStart){
      fill(255, 0, 0);
      stroke(0); 
      rect(xCoord, yCoord, wide, high); 
     }else if(isBlocked){
      fill(0);
      stroke(0); 
      rect(xCoord, yCoord, wide, high); 
     }else {
      noFill();
      stroke(0); 
      rect(xCoord, yCoord, wide, high); 
     }
     fill(0, 0, 255);
     text(distanceFromGoal + "", xCoord+15, yCoord+15);
  }
}