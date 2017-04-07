public class Grid {
  private GridCell[][] cells;
  private int rectWidth;
  private int rectHeight;
 // private GridCell start;
  //private GridCell goal;


  public Grid(int numCells, int screenWidth, int screenHeight) {
    cells = new GridCell[numCells][numCells];
    rectWidth = screenWidth/numCells;
    rectHeight = screenHeight/numCells;
    loadGrid();
    setStart(0, 0);
    setGoal(numCells - 1, numCells -1);
    loadDistances(cells[numCells - 1][numCells - 1], 0);
  }

  public void loadGrid() {
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
  
  public void loadDistances(GridCell gc, int currDist){
    if(!gc.isStart()){
      ArrayList<GridCell> neighbors = gc.getFreeNeighbors(cells);
      for(int i = 0; i < neighbors.size(); i++){
        neighbors.get(i).setDistance(currDist + 1);
        loadDistances(neighbors.get(i), currDist + 1);    
      }
    }
    
  }

  public void draw() {
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

   public void setStart(int row, int col) {
    cells[row][col].setStart();
    //start = cells[row][col];
  }
  public void setGoal(int row, int col) {
    cells[row][col].setGoal();
    //goal = cells[row][col];
  }
 
}

