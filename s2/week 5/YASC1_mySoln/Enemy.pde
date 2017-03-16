class Enemy
{
  PVector pos;
  PVector forward;
  float speed;
  ArrayList<PVector> waypoints = new ArrayList<PVector>();
  int wayIndex = 0;
  
  Enemy(float x, float y)
  {
    pos = new PVector(x, y);
    forward = new PVector();
    speed = random(1, 8);
    for (int i = 0 ; i < 5 ; i ++)
    {
      waypoints.add(new PVector(random(0, width), random(0, height)));
    }
  }
  
  void render()
  {
    stroke(255);
    fill(255);
    ellipse(pos.x, pos.y, 20, 20);
  }
  
  void update()
  {
    PVector waypoint = waypoints.get(wayIndex);
    
    forward = PVector.sub(waypoint, pos);
    forward.normalize();
    pos.add(PVector.mult(forward, speed));
    
    if (PVector.dist(waypoint, pos) < 10)
    {
      wayIndex = (wayIndex + 1) % waypoints.size();
      //fire bullet at way point
      //calculate angle to ship:
      float theta = atan2(ship.pos.y - pos.y, ship.pos.x - pos.x) + (PI * 0.5f); //???
      
      Bullet b = new Bullet(pos.x, pos.y, theta, false);
      bullets.add(b);
    }
    
//    if (PVector.dist(pos, ship.pos) < 20)
//    {
//      enemies.remove(this);
//    }
  }
  
  
}
