float x, y, cx, cy ,theta, r;

void setup() {
  size(500,500);
  //noSmooth();
  smooth();
  x=0.0;
  y=0.0;
  theta = 0.0f;
  cx=width/2.0f;
  cy=height/2.0f;
  r= width/2.0f-10.0f;
  strokeWeight(4);
}

void draw() {

  x = sin(theta)*r;
  y = cos(theta)*r;
  //ellipse(cx+x, cy+y, 10, 10);
  point(cx+x, cy+y);
  ellipse(cx, cy, r, r);
  theta+=0.001f;
}

