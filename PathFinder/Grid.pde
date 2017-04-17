public class Grid {
  private GridCell[][] cells;
  private int rectWidth;
  private int rectHeight;


  public Grid(int numCells) {
    cells = new GridCell[numCells][numCells];
    rectWidth = width/numCells;
    rectHeight = height/numCells;
    loadGrid();
    setStart(0, 0);
    setGoal(numCells - 1, numCells -1);
    
  }

  private void loadGrid() {
    int xCoord;
    int yCoord = 0;
    for (int r = 0; r < cells.length; r++) {
      xCoord = 0;
      for (int c = 0; c < cells[0].length; c++) {
        cells[r][c] = new GridCell(xCoord, yCoord, rectWidth, rectHeight);
        xCoord += rectWidth;
      }
      yCoord += rectHeight;
    }
  }
  
  private void clearDistances(){
   for(int r = 0; r < cells.length; r++){
    for(int c = 0; c < cells[0].length; c++){
     cells[r][c].setDistance(-1); 
    }
   }
 }
  
  private void loadDistances(){
    clearDistances();
    GridCell goal = cells[cells.length-1][cells[0].length-1];
    goal.setDistance(0);
    int currDist = 0;
    ArrayList<GridCell> cellsToCheck = new ArrayList<GridCell>();
    cellsToCheck.add(goal);
    ArrayList<GridCell> neighbors;
    while(cellsToCheck.size() > 0){
      ArrayList<GridCell> temp = new ArrayList<GridCell>();
      for(GridCell currGC : cellsToCheck){
        neighbors = currGC.getFreeNeighbors(cells);
        for(GridCell openCell : neighbors){
          if(openCell.getDistance() == -1){
           openCell.setDistance(currDist+1); 
           temp.add(openCell);
          }
       }
      }
      currDist++;
      cellsToCheck = temp;
    }
    
  }

  public void draw() {
    loadDistances();
    for (int r = 0; r < cells.length; r++) {
      for (int c = 0; c < cells[r].length; c++) {
        cells[r][c].draw();
      }
    }
  }

  public GridCell cellAt(int x, int y) {
    int cIndex = x / rectWidth;
    int rIndex = y / rectHeight;
    return cells[rIndex][cIndex];
  }

  private void setStart(int row, int col) {
    cells[row][col].setStart();
  }
  private void setGoal(int row, int col) {
    cells[row][col].setGoal();
  }
  public GridCell[][] getCells(){
    return cells;
  } 
  
  public void reset(){
    for(int r = 0; r < cells.length; r++){
     for(int c = 0; c < cells[0].length; c++){
      cells[r][c].setOpen(); 
     }
    }
    
  }
}