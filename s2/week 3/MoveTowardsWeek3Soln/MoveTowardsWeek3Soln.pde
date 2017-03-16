void setup()
{
  size(500, 500);
  stroke(255);
  strokeWeight(2);
  println("Waypoints array: ");
  for (int i = 0; i < wayPoints.length; i ++)
  {

    wayPoints[i] = new PVector(random(0, width), random(0, height));
    println(wayPoints[i].x+" , "+wayPoints[i].y);
  } 

  drawPaths();
  for (int i = 0; i < circles.length; i ++)
  {
    circles[i] = new Circle();
    //lines[i] = new Line();
  }
}

Circle[] circles = new Circle[10];
//Line[] lines = new Line[10];
PVector [] wayPoints = new PVector[5];


void draw()
{
  background(0);
  drawPaths();
  for (int i = 0; i < circles.length; i ++)
  {
    circles[i].update();
    circles[i].render();
    //lines[i].update();
    //lines[i].render();
  }
}

void drawPaths() {
  stroke(255,150);
  strokeWeight(5);
  for (int i = 0; i < wayPoints.length; i ++)
  {
    fill(255, 150);
    ellipse(wayPoints[i].x, wayPoints[i].y, 5, 5);
    if (i<wayPoints.length-1) {
      line(wayPoints[i].x, wayPoints[i].y, wayPoints[i+1].x, wayPoints[i+1].y );
    }
    else{
      line(wayPoints[wayPoints.length-1].x, wayPoints[wayPoints.length-1].y, 
      wayPoints[0].x, wayPoints[0].y );
    }
  }
}

