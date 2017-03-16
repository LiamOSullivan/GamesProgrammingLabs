class Circle
{
  PVector pos;
  PVector forward;
  float speed;
  float radius;
  color c;
  int wayPointIndex = 0;

  Circle(float x, float y, float r, color c)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    speed = random(5,15);
    radius = r;
    this.c = c;
  }

  Circle()
  {
    // Constructor chaining
    this(width / 2, height / 2, 10, color(255, 255, 255));
  }

  void update()
  {
    PVector attract = new PVector(wayPoints.get(wayPointIndex).x, wayPoints.get(wayPointIndex).y);
    forward = PVector.sub(attract, pos);
    forward .normalize();
    forward.mult(speed);
    pos.add(forward);

    if (PVector.dist(pos, attract)<10) {
      if (wayPointIndex < (wayPoints.size()-1)) {
        wayPointIndex+=1;
      }
      else{
      wayPointIndex =0;
      }
    };

    /*
    a = b + c; a = PVector.add(b, c); // static method
     a += b; = a.add(b);
     
     a = b - c; a = PVector.sub(b, c);
     a -= c; a.sub(c);    
     */
  }

  void render()
  {
    noStroke();
    fill(c, 150);
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
    fill(255);
    stroke(255);
  }
}

