public class Ball {
  private int radius;
  private int xCoord;
  private int yCoord;
  
  public Ball(int r){
   radius = r; 
   xCoord = 25;
   yCoord = 25;
  }
 
  public void run(GridCell[][] cells){
    GridCell gc = cells[getRow()][getCol()];
    ArrayList<GridCell> neighbors;
    while(!gc.isGoal()){
      neighbors = gc.getFreeNeighbors(cells);
      int index = 0;
      for(int i = 0; i < neighbors.size(); i++){
        if(neighbors.get(i).getDistance() < neighbors.get(index).getDistance())
          index = i;
      }
      moveTo(neighbors.get(index));
      gc = neighbors.get(index);
    }
  }
  
  private void moveTo(GridCell gc){
    if(gc.getRow() == this.getRow() && gc.getCol() > this.getCol())
      moveForward();
    else if (gc.getRow() == this.getRow() && gc.getCol() < this.getCol())
      moveBackward();
    else if (gc.getRow() > this.getRow() && gc.getCol() == this.getCol())
      moveDown();
    else if (gc.getRow() < this.getRow() && gc.getCol() == this.getCol())
      moveUp();
    draw();
  }
  
  private void moveForward(){
   int newX = xCoord + width/numCells;
   while(xCoord < newX){
      xCoord++;
   }
  }
  private void moveBackward(){
    int newX = xCoord - width/numCells;
    while(xCoord > newX){
      xCoord--;
   }
  }
  private void moveDown(){
   int newY = yCoord + height/numCells;
   while(yCoord < newY){
      yCoord++;
   } 
  }
  private void moveUp(){
    int newY = yCoord - height/numCells;
    while(yCoord > newY){
      yCoord--;
   } 
  }
  
  private int getRow(){
   int cellHeight = height/numCells;
   return(yCoord - cellHeight/2) / cellHeight;
  }
  
  public void reset(){
     xCoord = 25; 
     yCoord = 25;
  }
  
  private int getCol(){
   int cellWidth = width/numCells;
   return (xCoord - cellWidth/2) / cellWidth;
  }
  
  public void draw(){
   fill(0, 100, 255);
   noStroke(); 
   ellipse(xCoord, yCoord, radius, radius);
  }
  
  
}