ArrayList<Float> arrList = new ArrayList<Float>();
float[] deaths = {0, 128, 256, 384, 512, 640};
int[] years = {1961, 1972, 1983, 1994, 2005, 2007}
float border = width * 0.1f;

PImage img, img1, img2;

void setup()
{
  size(500, 500);
  
  img = loadImage("Back.jpg");
  img1 = loadImage("keys.jpg");
  img2 = loadImage("drink.jpg");
}

void load()
{
  String[] lines = loadStrings("Road2.csv");
  for(String s: lines)
  {
    float fVal = parseFloat(s);
    arrList.add(fVal);
  }
}

void load2()
{
  String[] lines = loadStrings("Road.csv");
  for(String s: lines)
  {
    float fVal = parseFloat(s);
    arrList.add(fVal);
  }
}
  

int minIndex(float[] arr)
{
  load();

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
  
  return minIndex;
}

int minInd(float[] arr)
{
  load2();

  float min = arrList.get(0);
  int minInd = 0;
  
   for(int i =0; i < arrList.size(); i++)
  {
    if(arrList.get(i) < min)
    {
      min = arrList.get(i);
      minInd = i;
    }
  }
  
  return minInd;
}

int maxIndex(float[] arr)
{
  load();
  
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
  
  return maxIndex;
}

int maxInd(float[] arr)
{
  load2();
  
  float high = arrList.get(0);
  int maxInd = 0;
  
  for(int j = 0; j < arrList.size(); j++)
  {
    if(arrList.get(j) > high)
    {
      high = arrList.get(j);
      maxInd = j;
    }
  }
  
  return maxInd;
}

float average(float[] r)
{
  load();
  
  float average = 0;
  float sum = 0;
  
  for(int k = 0; k < arrList.size(); k++)
  {
    sum += arrList.get(k);
  }
  
  average = sum;
  
  return average;
}

float aver(float[] r)
{
  load2();
  
  float aver = 0;
  float sum = 0;
  
  for(int k = 0; k < arrList.size(); k++)
  {
    sum += arrList.get(k);
  }
  
  aver = sum;
  
  return aver;
}

int mode = 0;

void draw()
{
  background(img);
  float barwidth = width / (float years.length;
  switch (mode)
  {
    case 0:
    {
          image(img1, 0, 70);
          image(img2, 385, 70);
    
           fill(255);
           textAlign(CENTER, CENTER);
           textSize(40);
           text("ONE 0R THE OTHER", 250, 30);
           break;
    }
    case 1:
    {
           drawAxis(deaths, years, 5, 640, border);
           stroke(255, 0, 0);
                
                
           float windowRange = (width - (border * 2.0f));
           float dataRange = 640;      
           float lineWidth =  windowRange / (float) (arrList.size() - 1);
             
           float scale = windowRange / dataRange;
           for (int i = 1 ; i < arrList.size() ; i ++)
           {
                
             float x1 = border + ((i - 1) * lineWidth);
             float x2 = border + (i * lineWidth);
             float y1 = (height - border) - (arrList.get(i - 1)) * scale;
             float y2 = (height - border) - (arrList.get(i)) * scale;              line(x1, y1, x2, y2);
           } 
           break;
    }
    case 2:
    {
            drawAxis(deaths, years, 5, 640, border);
            stroke(0, 255, 255);
                
                
            float windowRange = (width - (border * 2.0f));
            float dataRange = 640;      
            float lineWidth =  windowRange / (float) (arrList.size() - 1);
              
            float scale = windowRange / dataRange;
            for (int i = 1 ; i < arrList.size() ; i ++)
            {
                
              float x1 = border + ((i - 1) * lineWidth);
              float x2 = border + (i * lineWidth);
              float y1 = (height - border) - (arrList.get(i - 1)) * scale;
              float y2 = (height - border) - (arrList.get(i)) * scale;
              line(x1, y1, x2, y2);
             } 
             break;
    }
  }
}

void drawAxis(float[] data, int[] horizLabels, int verticalIntervals, float vertDataRange, float border)
{
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float horizInterval =  windowRange / (data.length - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.length ; i ++)
  {   
   // Draw the ticks
   float x = border + (i * horizInterval);
   line(x, height - (border - tickSize), x, (height - border));
   float textY = height - (border * 0.5f);
   
   // Print the text 
   textAlign(CENTER, CENTER);
   text(horizLabels[i], x, textY);
   
  }
  
  // Draw the vertical axis
  line(border, border , border, height - border);
  
  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals; 
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}
 
void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  println(mode);
}    
    
  


