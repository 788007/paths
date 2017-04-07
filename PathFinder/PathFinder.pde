int screenSize = 500;
int numCells = 10;
Grid grid;
Ball ball = new Ball(10);

void setup(){
 size(screenSize, screenSize);
 background(255);
 noStroke();
 grid = new Grid(numCells, screenSize, screenSize);
 
}

void draw(){
  grid.draw();
  ball.draw();
  //ball.moveForward();
}

void mouseClicked(){
  GridCell g = grid.cellAt(mouseX, mouseY);
  if(!g.isBlocked())
    g.setObstacle();
   else
     g.setOpen();
}


