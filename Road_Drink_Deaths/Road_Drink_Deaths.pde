ArrayList<Road1> arrList1 = new ArrayList<Road1>();
ArrayList<Road2> arrList2 = new ArrayList<Road2>();
float border;
float min, minIn, max, maxIn;

void loadData1()
{
  String[] lines = loadStrings("Road2.csv");
  for(String s:lines)
  {
    Road1 dr = new Road1(s);
    arrList1.add(dr);
  }
}

void loadData2()
{
  String[] line = loadStrings("Road3.csv");
  for(String r:line)
  {
    Road2 a = new Road2(r);
    arrList2.add(a);
  }
}

void calminmaxR1()
{
  min = max = arrList1.get(0).drink;
  for(Road1 dr:arrList1)
  {
    if(dr.drink < min)
    {
      min = dr.drink;
    }
    if(dr.drink > max)
    {
      max = dr.drink;
    }
  }
}

void calminmaxR2()
{
  minIn = maxIn = arrList2.get(0).acc;
  for(Road2 a:arrList2)
  {
    if(a.acc < minIn)
    {
      minIn = a.acc;
    }
    if(a.acc > maxIn)
    {
      maxIn = a.acc;
    }
  }
}
  
  

void setup()
{
  size(500, 500);
  loadData1();
  loadData2();
  border = width * 0.1f;
  calminmaxR1();
  calminmaxR2();
   
}

void drawline1()
{
  float windowRange = (width - (border * 2.0f));
  float dataRange = 640;      
    
  float scale = windowRange / dataRange;
  if (mouseX >= border && mouseX <= width - border)
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    line(mouseX, border, mouseX, height - border);
    int i = (int)map(mouseX, border, width - border, 0, arrList1.size() - 1);
    float y = (height - border) - (arrList1.get(i).drink) * scale;
    fill(random(0 ,255), random(0, 255), random(0, 255));
    stroke(random(0 ,255), random(0, 255), random(0, 255));
    ellipse(mouseX, y, 10, 10);
    fill(255);
    text("Deaths: " + arrList1.get(i).drink, mouseX + 10, y + 10);
  }
}

void drawline2()
{
  float windowRange = (width - (border * 2.0f));
  float dataRange = 640;      
    
  float scale = windowRange / dataRange;
  if (mouseX >= border && mouseX <= width - border)
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    line(mouseX, border, mouseX, height - border);
    int i = (int)map(mouseX, border, width - border, 0, arrList2.size() - 1);
    float y = (height - border) - (arrList2.get(i).acc) * scale;
    fill(random(0 ,255), random(0, 255), random(0, 255));
    stroke(random(0 ,255), random(0, 255), random(0, 255));
    ellipse(mouseX, y, 10, 10);
    fill(255);
    text("Deaths: " + arrList2.get(i).acc, mouseX + 10, y + 10);
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
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(15);
  text("Drink Driving Deaths compared to Road Deaths 1961-2007", 250, 30);
  
  drawAxis(deaths, years, 5, 640, border);
  
  float border = width * 0.1f;   
      
  float windowRange = (width - (border * 2.0f));
  float dataRange = 640;      
  float lineWidth =  windowRange / (float) (arrList1.size() - 1);
    
  float scale = windowRange / dataRange;
  for (int i = 1 ; i < arrList1.size() ; i ++)
  {
    stroke(255, 0, 0);  
    float x1 = border + ((i - 1) * lineWidth);
    float x2 = border + (i * lineWidth);
    float y1 = (height - border) - (arrList1.get(i - 1).drink) * scale;
    float y2 = (height - border) - (arrList1.get(i).drink) * scale;
    line(x1, y1, x2, y2);
   } 
   
  drawline1();
        
  float windowRange1 = (width - (border * 2.0f));
  float dataRange1 = 640;      
  float lineWidth1 =  windowRange1 / (float) (arrList2.size() - 1);
    
  float scale1 = windowRange1 / dataRange1;
  for (int j = 1 ; j < arrList2.size() ; j ++)
  {
    stroke(0,255, 0);  
    float a1 = border + ((j - 1) * lineWidth1);
    float a2 = border + (j * lineWidth1);
    float b1 = (height - border) - (arrList2.get(j - 1).acc) * scale1;
    float b2 = (height - border) - (arrList2.get(j).acc) * scale1;
    line(a1, b1, a2, b2);
   } 
   
   drawline2();
}
