/*Read the processing documentation for the following Classes, PVectors, Constructors, ArrayLists!
 Download the ArrayList code we wrote in the class yesterday and modify it in the follow way:
 Add a speed field to the Circle class to control how fast it moves
 Modify the Circle class to get the Circle to follow the path instead of moving towards the mouse. 
 The path is stored in an ArrayList of Pvector objects called wayPoints.
 Make an ArrayList of Circles objects
 Every second, add a new Circle object to the ArrayList, so that over time you should see lots of circles following the path
 
 */


void setup()
{
  size(500, 500);
  frameRate(25);

  l = new Line(0, 100);
  circles.add(new Circle(random(width, height), random(width, height), random(5, 50), getColor()));

  for (int i = 0; i < 5; i ++)
  {
    wayPoints.add(new PVector(random(0, width), 
    random(0, height)));
  }
  for (int i = 0; i < 5; i ++)
  {
    PVector p = wayPoints.get(i);
    //PVector p = wp[i];
    println(p.x);
  }

  /* Allocate like this
   ArrayList<PVector> wayPoints 
   = new ArrayList<PVector>();
   
   Add elements
   wayPoints.add(new PVector(random(0, width), 
   random(0, height)));
   // Return an element
   .get
   */
}


Line l;

PVector[] wp = new PVector[5];
ArrayList<PVector> wayPoints 
= new ArrayList<PVector>();

ArrayList<Circle> circles 
= new ArrayList<Circle>();

void draw()
{
  background(0);
  for (int i=0; i<circles.size (); i+=1) {
    circles.get(i).update();
    circles.get(i).render();
  }
  //  c2.update();
  //  c2.render();
  if (frameCount%25==0) {
    if (circles.size()<20) {
      println("add circle no "+circles.size());
      circles.add(new Circle(random(0, width), random(0, height), random(5, 50), getColor()));
    }
   else {
    println("Max circles added");
  }
  }

  //l.update();
  //l.render();

  for (int i = 0; i < wayPoints.size (); i ++)
  {
    PVector c = wayPoints.get(i);
    int next = (i + 1) % wayPoints.size();
    PVector n = wayPoints.get(next);
    ellipse(c.x, c.y, 10, 10);
    line(c.x, c.y, n.x, n.y);
  }
}

color getColor() {
  float r = random(255); 
  float g = random(255); 
  float b = random(255); 
  return color(r, g, b);
}

