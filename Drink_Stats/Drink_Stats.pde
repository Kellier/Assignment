PImage img;
boolean drawtext = true;
boolean drawtext1 = true;
boolean drawtext2 = true;
boolean lastPressed = false;

void setup()
{
  size(500, 500);
  
  img = loadImage("Road.jpg");
  
}

float x = 0;
float y = 100;
float y1 = 250;
float y2 = 400;
float speed = 1;

void draw()
{
  background(img);
   
  ArrayList<Float> arrList = new ArrayList<Float>();
  String[] lines = loadStrings("Road2.csv");
  for(String s:lines)
  {
    float fVal = parseFloat(s);
    arrList.add(fVal);
  }
  
  float min = arrList.get(0);
  int minIndex = 0;
  
  for(int i =0; i < arrList.size(); i++)
  {
    if(arrList.get(i) < min)
    {
      min = arrList.get(i);
      minIndex = i;
    }
  }
  
  float high = arrList.get(0);
  int maxIndex = 0;
  
  for(int j = 0; j < arrList.size(); j++)
  {
    if(arrList.get(j) > high)
    {
      high = arrList.get(j);
      maxIndex = j;
    }
  }
  
  float average = 0;
  float sum = 0;
  
  for(int k = 0; k < arrList.size(); k++)
  {
    sum += arrList.get(k);
  }
  
  average = sum;
  
  move();
  
  fill(255, 255, 0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("L = How many people died of Drink driving in 1961", 250, 10);
  text("H = How many people died of Drink driving in 1972", 250, 30);
  text("A = Average Death rate between 1961 - 2007", 250, 50);
  
  if(drawtext)
  {
    fill(0, 255, 255);
    textSize(20);
    text(arrList.get(minIndex), x, y);
  }
  
  if(drawtext1)
  {
     fill(255, 0, 255);
     textSize(20);
     text(arrList.get(maxIndex), x, y1);
  }
  
  if(drawtext2)
  {
    fill(255, 255, 0);
    textSize(20);
    text(average, x, y2);
  }
    
  if(keyPressed)
  {
    if(key == 'l' && ! lastPressed)
    {
      drawtext =! drawtext;
      lastPressed = true;
    }
    
    if(key == 'h' && ! lastPressed)
    {
      drawtext1 =! drawtext1;
      lastPressed = true;
    }
    
    if(key == 'a' && ! lastPressed)
    {
      drawtext2 =! drawtext2;
      lastPressed = true;
    }
    
  }
  else
  {
    lastPressed = false;
  }
}

void move()
{
  x = x + speed;
  if(x > width / 2)
  {
    x = 0;
  }
}
