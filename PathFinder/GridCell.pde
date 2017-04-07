public class GridCell {
  private boolean isBlocked = false;
  private boolean isStart = false;
  private boolean isGoal = false;
  private boolean hasDistance = false;
  private int xCoord;
  private int yCoord;
  private int wide;
  private int high;
  private int distanceFromGoal;
  
  public GridCell(int x, int y, int w, int h){
   xCoord = x;
   yCoord = y;
   wide = w;
   high = h;
  }
 
  public ArrayList<GridCell> getFreeNeighbors(GridCell[][] cells){
    ArrayList<GridCell> neighbors = new ArrayList<GridCell>();
    int c = xCoord / wide;
    int r = yCoord / high;
//    if(r - 1 >= 0){
//      GridCell up = cells[r - 1][c];
//      if(!up.isBlocked && !up.hasDistance)
//        neighbors.add(up);
//    }
//    if(r + 1 < cells.length){
//      GridCell down = cells[r + 1][c];
//       if(!down.isBlocked && !down.hasDistance)
//        neighbors.add(down);
//    }
//    if(c - 1 >= 0){
//      GridCell left = cells[r][c - 1];
//       if(!left.isBlocked && !left.hasDistance)
//        neighbors.add(left);
//    }
//    if(c + 1 < cells[0].length){
//      GridCell right = cells[r][c + 1];
//      if(!right.isBlocked && !right.hasDistance)
//        neighbors.add(right);
//    }
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
  public void setObstacle(){
   isBlocked = true; 
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
  public int getDistance(){
    return distanceFromGoal;
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
  }
}
