class Animal
{
  boolean isAlive;
  float x, y;
  PImage image;
  AudioPlayer audio;
  
  Animal()
  {
    
    isAlive = true;
  }
  
  Animal(float x_, float y_)
  {
    this.x=x_;
    this.y=y_;
    isAlive = true;
  }
 
  
  void display()
  {
  }
  
  void speak()
  {
    println("I can't speak");
  }
  
}
