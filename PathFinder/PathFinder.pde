int numCells = 10;
Grid grid;
Ball ball;

void setup(){
 size(500, 500);
 background(255);
 noStroke();
 //frameRate(5);
 grid = new Grid(numCells);
 ball = new Ball(10);
 
}

void draw(){
  background(255);
  grid.draw();
  ball.draw();
}

void mouseClicked(){
  GridCell g = grid.cellAt(mouseX, mouseY);
  if(g.isGoal()){
    ball.run(grid.getCells());
  }else if (g.isStart()){
    ball.reset();
    grid.reset();
  }else
     g.setObstacle();
}