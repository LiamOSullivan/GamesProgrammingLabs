
size(400,400);
background(0);

translate(width/2, height/2);
strokeWeight(2);
stroke(255);
smooth();
noFill();
int n = 500;
int k=4;
float step=TWO_PI/n;
beginShape();
for(float i=0;i<TWO_PI;i+=step){
float r = 100*cos(k*i);
float x = r*sin(i);
float y = r*cos(i);
vertex(x,y);

}
endShape();


