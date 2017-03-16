float dist = 40, radius = dist/2, alpha = 0, speed = 1000;
float px, py, x, y, k;

void setup() {
  size(640, 640);
  background(0);
  stroke(255);
  smooth();
  frameRate(120);
  px = radius;
  py = 0;
}

void draw() {
  k = speed/radius;
  alpha += k;
  radius += dist/(360/k);
  x = radius*cos(radians(alpha));
  y = -radius*sin(radians(alpha));
  translate(width/2, height/2);
  strokeWeight(k);
  line(px, py, x, y);
  px = x;
  py = y;
}
