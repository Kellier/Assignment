//Implement controlp5
import controlP5.*;

ControlP5 cp5;

//Create a button global variable
Button b;

//The controlP5 button controller 'buttonValue' will change the value when pressed

int buttonValue = 0;

//Create Array Lists to store the data sets in the classes
ArrayList<Road1> arrList1 = new ArrayList<Road1>();
ArrayList<Road2> arrList2 = new ArrayList<Road2>();

//Declare global variables
float border;

//CalminmaxR1()
float min, max;
int minIn, maxIn;

//CalminmaxR2
float low, high;
int minIndex, maxIndex;

//Switch staement variable for controlp5 buttons
String mode = "Drink-Driving";
int a = 0;

//Load data set from Road1()
void loadData1()
{
  String[] lines = loadStrings("Road2.csv");
  for(String s:lines)
  {
    Road1 dr = new Road1(s);
    arrList1.add(dr);
  }
}

//Load data set from Road2()
void loadData2()
{
  String[] line = loadStrings("Road3.csv");
  for(String r:line)
  {
    Road2 a = new Road2(r);
    arrList2.add(a);
  }
}

//Calculate min and max values for Array List 1
void calminmaxR1()
{
  min = max = arrList1.get(0).drink;
  for(int i = 0; i < arrList1.size(); i++)
  {
    if(arrList1.get(i).drink < min)
    {
      min = arrList1.get(i).drink;
      minIn = i;
    }
  }
  for(int j = 0; j < arrList1.size(); j ++)
  {
    if(arrList1.get(j).drink > high)
    {
      max = arrList1.get(j).drink;
      maxIn = j;
    }
  }
}

//Calculate min and max values for Array List 2
void calminmaxR2()
{
  low = high = arrList2.get(0).acc;
  for(int i = 0; i < arrList2.size(); i++)
  {
    if(arrList2.get(i).acc < low)
    {
      low = arrList2.get(i).acc;
      minIndex = i;
    }
  }
  for(int j = 0; j < arrList2.size(); j ++)
  {
    if(arrList2.get(j).acc > high)
    {
      high = arrList2.get(j).acc;
      maxIndex = j;
    }
  }
}


void setup() 
{
  size(500,500);
  loadData1();
  loadData2();
  border = width * 0.1f;
  calminmaxR1();
  calminmaxR2();
  smooth();
  frameRate(30);
  cp5 = new ControlP5(this);
  
  // create a new button with name 'buttonA'
  cp5.addButton("Drink-Driving",0,0,0,80,19);
  
  // and add another 2 buttons
  cp5.addButton("Road-D",0,200,0,80,19);
  cp5.addButton("Correlation",128,420,0,80,19);
}

/*Draw line and ellipse to show the user the amount of deaths in the given year
  when the mouse is moved for Array List 1
*/
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
    text("Drink Deaths: " + arrList1.get(i).drink, mouseX + 10, y + 10);
  }
}

/*Draw line and ellipse to show the user the amount of deaths in the given year
  when the mouse is moved for Array List 2
*/
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
    text("Road Deaths: " + arrList2.get(i).acc, mouseX + 10, y + 10);
  }
}


//Arrays for the Axis's
float[] deaths = {0, 128, 256, 384, 512, 640}; 
int[] years = {1961, 1972, 1983, 1994, 2005, 2007};

//Draw Axis's for the graphs being used in the draw method
void drawAxis(float[] data, int[] horizLabels, int verticalIntervals, float vertDataRange, float border)
{
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  //Draw the horizontal azis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float horizInterval =  windowRange / (data.length - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.length ; i ++)
  {   
   //Draw the ticks
   float x = border + (i * horizInterval);
   line(x, height - (border - tickSize), x, (height - border));
   float textY = height - (border * 0.5f);
   
   //Print the text 
   textAlign(CENTER, CENTER);
   text(horizLabels[i], x, textY);
   
  }
  
  //Draw the vertical axis
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
    //If statements for implementation of the controlp5 buttons
    if( mode == "Road-D");
    {
      background(0);

      fill(0, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(15);
      text("Road Deaths 1961-2007", 250, 30);
      textSize(15);
      text("Max Deaths: " + arrList2.get(maxIndex).acc, 400, 80);
      text("Least Deaths: " + arrList2.get(minIndex).acc, 400, 95);
      
      //Call the drawAxis() method
      drawAxis(deaths, years, 5, 640, border);
      
      float windowRange = (width - (border * 2.0f));
      float dataRange = 640;      
        
      float scale = windowRange / dataRange;
      float lineWidth =  windowRange / (float) (arrList2.size() - 1);
      
      //Draw the line graph for Road Deaths
      for (int i = 1 ; i < arrList1.size() ; i ++)
      {
        stroke(255, 0, 0);
        float x1 = border + ((i - 1) * lineWidth);
        float x2 = border + (i * lineWidth);
        float y1 = (height - border) - (arrList2.get(i - 1).acc) * scale;
        float y2 = (height - border) - (arrList2.get(i).acc) * scale;
        line(x1, y1, x2, y2);    
       } 
      
      //Call the drawline2() method
      drawline2();
    }
    
    if(mode == "Correlation")
    {

        background(0);

        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(15);
        text("Drink Driving Deaths compared to Road Deaths 1961-2007", 250, 30);
        
        //Call the drawAxis() method
        drawAxis(deaths, years, 5, 640, border);
        
        float border = width * 0.1f;   
            
        float windowRange = (width - (border * 2.0f));
        float dataRange = 640;      
        float lineWidth =  windowRange / (float) (arrList1.size() - 1);
          
        float scale = windowRange / dataRange;
        
        //Draw the correlation graph comparing Drink Driving deaths to general Road deaths
        for (int i = 1 ; i < arrList1.size() ; i ++)
        {
          stroke(255, 0, 0);  
          float x1 = border + ((i - 1) * lineWidth);
          float x2 = border + (i * lineWidth);
          float y1 = (height - border) - (arrList1.get(i - 1).drink) * scale;
          float y2 = (height - border) - (arrList1.get(i).drink) * scale;
          line(x1, y1, x2, y2);
         } 
        
        //Call the drawline1() method 
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
    
    if(mode == "Drink-Driving")
    {
        background(0);
        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(15);
        text("Drink Driving Deaths 1961-2007", 250, 30);
        textSize(15);
        text("Max Deaths: " + arrList1.get(maxIn).drink, 400, 80);
        text("Least Deaths: " + arrList1.get(minIn).drink, 400, 95);
        
        //Call the drawAxis() method
        drawAxis(deaths, years, 5, 640, border);
      
        float windowRange = (width - (border * 2.0f));
        float dataRange = 640;      
          
        float scale = windowRange / dataRange;
        float barWidth = (width - border * 2) / (float) (arrList1.size());
        
        //Draw the barchart for Drink Driving Deaths
        for (int i = 0 ; i < arrList1.size() ; i ++)
        {
          float x = (i * barWidth) + border;
          float y = arrList1.get(i).drink * scale;
          stroke(random(0, 255), random(0, 255), random(0, 255));
          fill(random(0, 255), random(0, 255), random(0, 255));
          rect(x, height - border, barWidth, -(arrList1.get(i).drink) * scale);
        }
    }
    

}

/*Method to ensure the functionality of the controlp5 button using the string mode to call
  the button name
*/
public void controlEvent(ControlEvent theEvent) 
{
  mode = (theEvent.getController().getName());
}

