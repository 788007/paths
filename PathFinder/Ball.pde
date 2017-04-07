public class Ball {
  private int radius;
  private int xCoord;
  private int yCoord;
  
  public Ball(int r){
   radius = r; 
   xCoord = 25;
   yCoord = 25;
  }
  
  public int getXCoord(){
    return xCoord;
  }
  public int getYCoord(){
   return yCoord; 
  }
  public void moveForward(){
    int newX = xCoord + screenSize/numCells;
    while(xCoord < newX){
      xCoord++;
    }
     
  }
  public void moveBackward(){
    xCoord -= screenSize/numCells;
  }
  public void moveDown(){
   yCoord += screenSize/numCells; 
  }
  public void moveUp(){
   yCoord -= screenSize/numCells; 
  }
  
  public void draw(){
   fill(0, 100, 255);
   noStroke(); 
   ellipse(xCoord, yCoord, radius, radius);
  }
  
  
}
