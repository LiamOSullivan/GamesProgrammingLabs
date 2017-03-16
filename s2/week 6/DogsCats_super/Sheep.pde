class Sheep extends Animal
{
  
  
  Sheep()
  {
    image = loadImage("sheep.jpg");
    audio = minim.loadFile("bleet.wav");
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
