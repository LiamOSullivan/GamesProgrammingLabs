import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;
//AudioSample audioInput;
AudioPlayer aP;
int fileLength;
float progress;
FFT fft;

int lineH;
float circleRadius = 0.0;


static final int FRAME_SIZE = 2048;
static final int SAMPLE_RATE = 44100;

public void setup()
{
  size(512, 512);
  lineH = height/2;
  minim = new Minim(this);
  //audioInput = minim.getLineIn(Minim.MONO, FRAME_SIZE, SAMPLE_RATE, 16); // Use this for microphone input
  //audioInput = minim.loadSample("Cowboy.wav", FRAME_SIZE); // Use this for input from a file
  aP = minim.loadFile("Cowboy.wav");
  fileLength = aP.length();
  
  fft = new FFT(FRAME_SIZE, SAMPLE_RATE);  
  
}

boolean lastPressed = false;

public void draw()
{
  
  background(0);
  
  if(frameCount%25==0){
  progress = float(aP.position()) / fileLength;
  //println(progress);
  }
  //progress bar
  stroke(255);
  noFill();
  rect(0,0,width-1,50);
  noStroke();
  fill(255,150);
  rect(0,0, progress*width, 50);
  
  float theta = 0;
  int x =0;
  float mid = height / 2.0f;
  float average = 0;
  int count = 0;
  float circleMin = 100;
  translate(width/2,height/2);
   
  
  noFill();
  stroke(255);  
    
  //wrapped waveform
  beginShape();
  for(int i = 0; i < aP.bufferSize() - 1; i+=1)
  {
    //line(i, lineH  + aP.left.get(i)*50,  i+1, lineH  + aP.left.get(i+1)*50);
    //line(x, 0 , x, aP.left.get(i) * lineH);
    //x++;
    theta += TWO_PI/aP.bufferSize();
    float xPos = sin(theta);
    float yPos = -cos(theta);
    vertex(xPos*aP.left.get(i)*width/2, yPos*aP.left.get(i)*width/2);
    average += Math.abs(aP.left.get(i)); 
        
  //float target = min + average * mid;
  //circleRadius = lerp(circleRadius, target, 0.5f);
  //ellipse(width / 2, height / 2, circleRadius, circleRadius);
    //line(i, 150 + aP.right.get(i)*50, i+1, 150 + aP.right.get(i+1)*50);
  }
  endShape(CLOSE);
  //for(int i = 1 ; i < audioInput.bufferSize() ; i ++)
  //{
  //  line(i, mid , i, mid + audioInput.left.get(i) * mid);
  //  average += Math.abs(audioInput.left.get(i));    
  //}
  
  //circle
  average /= aP.bufferSize()/2;
  float target = circleMin + average * mid;
  circleRadius = lerp(circleRadius, target, 0.5f);
  
  ellipse(0, 0, circleRadius, circleRadius);
  //fill(255);
   
  //fft.window(FFT.HAMMING);
  //fft.forward(audioInput.left);
  //stroke(0, 255, 255);
  //for(int i = 0 ; i < fft.specSize(); i ++)
  //{
  //  float energy = fft.getBand(i);
  //  line(i, height, i, height - (energy * 50));    
  //}
  
}

void keyPressed(){
  if (key == ' ' && !lastPressed)
  {
    //audioInput.trigger();
    aP.play();
    lastPressed = true;
  }
  else
  {
    lastPressed = false;
    aP.pause();
    aP.rewind();
  }
  
}