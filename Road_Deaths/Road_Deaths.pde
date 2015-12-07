ArrayList<Road> arrList = new ArrayList<Road>();
float border;
float min, max;

void loadData()
{
  String[] lines = loadStrings("Road3.csv");
  for(String s:lines)
  {
    Road d = new Road(s);
    arrList.add(d);
  } 
}

void setup()
{
  size(500, 500);
  loadData();
  border = width * 0.1f;
  calminmax();
}

void drawLine()
{
  float windowRange = (width - (border * 2.0f));
  float dataRange = 640;      
    
  float scale = windowRange / dataRange;
  if (mouseX >= border && mouseX <= width - border)
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    line(mouseX, border, mouseX, height - border);
    int i = (int)map(mouseX, border, width - border, 0, arrList.size() - 1);
    float y = (height - border) - (arrList.get(i).deaths) * scale;
    fill(random(0 ,255), random(0, 255), random(0, 255));
    stroke(random(0 ,255), random(0, 255), random(0, 255));
    ellipse(mouseX, y, 10, 10);
    fill(255);
    text("Deaths: " + arrList.get(i).deaths, mouseX + 10, y + 10);
  }
}

void calminmax()
{
  min = max = arrList.get(0).deaths;
  for(Road d:arrList)
  {
    if(d.deaths < min)
    {
      min = d.deaths;
    }
    if(d.deaths > max)
    {
      max = d.deaths;
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


void draw()
{
  background(0);
  fill(0, 255, 255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Road Deaths 1961-2007", 250, 30);
  text("Lowest Deaths: " + arrList.get(min).deaths, 300, 200);
  text("Highest Deaths: " + arrList.get(max).deaths, 300, 250);
  
  drawAxis(deaths, years, 5, 640, border);
  
  float windowRange = (width - (border * 2.0f));
  float dataRange = 640;      
    
  float scale = windowRange / dataRange;
  float lineWidth =  windowRange / (float) (arrList.size() - 1);
  for (int i = 1 ; i < arrList.size() ; i ++)
  {
    stroke(255, 0, 0);
    float x1 = border + ((i - 1) * lineWidth);
    float x2 = border + (i * lineWidth);
    float y1 = (height - border) - (arrList.get(i - 1).deaths) * scale;
    float y2 = (height - border) - (arrList.get(i).deaths) * scale;
    line(x1, y1, x2, y2);    
   } 
  
  drawLine();
}
