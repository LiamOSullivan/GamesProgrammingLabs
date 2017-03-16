class Circle
{
  PVector pos;
  PVector forward;
  float speed;
  color c;
  int cw = 0;
  
  Circle()
  {
    respawn();
  }
  
  void respawn()
  {
    pos = new PVector(-50, random(0, height));
    c = color(random(200, 255), random(200, 255), random(200, 255));
    speed = random(1, 5);
  }
  
  void update()
  {
    PVector target = new PVector(wayPoints[cw].x, wayPoints[cw].y);
    forward = PVector.sub(target, pos);
    //print("Forward sub: "+forward);
    forward.normalize();
    //println("Forward norm: "+forward);
    pos.add(PVector.mult(forward, speed));
    if (dist(target.x, target.y, pos.x, pos.y) < 10)
    {
      //respawn();
      if(cw<wayPoints.length-1){
      cw+=1;
      }
      else{
       cw=0; 
      }
    }
  }
  
  void render()
  {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, 20, 20);
  }  
}
