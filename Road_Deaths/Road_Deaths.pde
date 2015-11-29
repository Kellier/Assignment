ArrayList<Float> arrList = new ArrayList<Float>();
float border = width * 0.1f;
float minIndex, maxIndex;

void setup()
{
  size(500, 500);
  background(0);
  
  String[] lines = loadStrings("Road.csv");
  for(String s:lines)
  {
    float fVal = parseFloat(s);
    Road death = new Road(s);
    arrList.add(death);
  }
      
  drawAxis(deaths, years, 5, 640, border);
  calminmax();
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
}

void calminmax()
{
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
}

float[] deaths = {0, 128, 256, 384, 512, 640}; 
int[] years = {1961, 1972, 1983, 1994, 2005, 2007};

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

void drawYear()
{
  if (mouseX >= border && mouseX <= width - border)
  {
    stroke(0, 255, 355);
    fill(255, 0, 0);
    line(mouseX, border, mouseX, height - border);
    int i = (int) map(mouseX, border, width - border, 0, arrList.size() - 1);
    float y = map(arrList.get(i).deaths, minIndex, maxIndex, height - border, border);
    ellipse(mouseX, y, 5, 5);
    fill(255);
    text("Year: " + arrList.get(i).deaths, mouseX + 10, y);
  }
}


void draw()
{
  fill(0, 255, 255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Road Deaths 1961-2007", 250, 30);
}
