class Cat extends Animal
{
  
    int lives;

    Cat(float x_, float y_)
    {
      super(x_, y_);
      image = loadImage("cat.jpg");
      audio = minim.loadFile("meow.wav");
      lives = 9;
    }
    
    void die()
    {
      if (lives > 0)
      {
        lives --;
        if (lives == 0)
        {
          isAlive = false;
        }
      }      
    }
    
    void display()
    {
      image(image, x, y);
    }
    
    void speak()
    {
      audio.rewind();
      audio.play();
    }
}
