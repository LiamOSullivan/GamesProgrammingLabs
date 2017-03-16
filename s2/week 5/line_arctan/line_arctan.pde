Line e1;
void setup() {
  size(640, 360);
  stroke(255);
  e1 = new Line( int(random(width)),  int(random(height)), 120);
  
}

void draw() {
  background(102);
  e1.update(mouseX, mouseY);
  e1.display();
  
}

class Line {
  int x, y;
  int size;
  float angle = 0.0;
  
  Line(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x) - PI*0.25;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    fill(255);
    line(0, 0, size, size);
    
    //fill(153, 204, 0);
    //ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}

