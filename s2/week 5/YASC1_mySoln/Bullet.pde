class Bullet
{
  PVector pos;
  PVector forward;
  float theta;
  boolean isPlayerBullet;

  Bullet(float x, float y, float theta, boolean pb)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;
    isPlayerBullet = pb;
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);

    pos.add(PVector.mult(forward, 10));

    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height)
    {
      bullets.remove(this);
    }

    if (isPlayerBullet)
    {
      for (int i = 0; i < enemies.size (); i ++)
      {
        Enemy e = enemies.get(i);
        if (PVector.dist(pos, e.pos) < 10)
        {
          enemies.remove(e);
          bullets.remove(this);
        }
      }
    } else
    {
      if (PVector.dist(pos, ship.pos) < 10)
      {
        ship.lives --;

        bullets.remove(this);
      }
    }
  }

  void render()
  {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(theta);
    if (isPlayerBullet) {
      stroke(255, 0, 0); 
   }
   else{
    stroke(255); 
   }
    line(0, -10, 0, 10);
    popMatrix();
  }
}

