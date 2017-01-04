/*****************************************
 * Assignment 04 Revision 
 * Name:         Nanda Bhushan
 * E-mail:       nbhushan@brynmawr.edu 
 * Course:       CS 110 - Section 02
 * Submitted:    12/5/16
 * Description: This code visually displays data for birth rates ranging from 1940 to 2013 for a female age group of 44-59. 
                This data was found on data.gov. The data is displayed as a bar graph & uses interactivity to dsiplay the age group  
                when browsing over the graph. 

 *****************************************/ 

//global variables to access for zoom & border  
//float scaleFactor, translateX, translateY; 
float X1, Y1, X2, Y2;   
float minBirth; 
float maxBirth;  
float minYear; 
float maxYear;  

//declaring float array to hold values of birth rates & years
float [] birth_values;  
float [] year_values;  
  

void setup()  
{   
   
  //size of sketch  
  size(800, 500);   
  //definining global variables for rectangle & drawGraph
  X1= 50;  
  Y1= 50; 
  X2= width-50; 
  Y2= height-50; 
  float minBirth; 
  float maxBirth;
  
  //declaring string array to hold data 
  String [] lines = loadStrings("NewBirthRatesData.csv");    
 
  
  //removes column names from the array
  lines = subset(lines, 1);    
  
  //creating array of size lines.length
  birth_values = new float[lines.length] ; 
  year_values = new float[lines.length]; 

  //loop for breaking string into elements & convertring array to float
  for (int i=0; i < lines.length; i++)  
  { 
    String[] fields= split(lines[i], ",");    
    birth_values[i] = float(fields[2]);    
    //String[] fields = split(lines[i], ","); 
    year_values[i] = float(fields[0]);  
    
  }    
  
  minBirth= min(birth_values); 
  maxBirth= max(birth_values); 
  minYear= min(year_values); 
  maxYear= max(year_values); 
  
}  

void draw() 
{    
  
  background(0);   
  drawGraph();  
  drawXLabels();   
  
  //titles 
  text("NCHS Birth Rates By Age of Mother", 10, 10);  
  text("Source: US Dept of Health CDC", 10, 25); 
}  


void drawGraph() 
{  
  //values to draw rectangles of bar graph 
  float minX = width*0.02; 
  float maxX= width*0.95; 
  float minY= height*0.02;
  float maxY= height*0.95;   
  float Number= birth_values.length; 
  float barSpace =(maxX- minX)/Number ;  
  float barW = barSpace * 0.9;  
  
  float x= minX; 
   for (int i= 0; i < birth_values.length; i++)  
  {  
    //using map function to define h 
    float h= map(birth_values[i] * 10, 0, 100, 0, maxY-minY);  
    float y = maxY-h;  
    fill(255); 
    rect(x, y, barW,h);   
    //if statement that says if user browses over graph, age group 44-49 will appear 
    if((mouseX < x + barW && mouseX > x) && (mouseY < maxY && mouseY > y)) 
      {  
        fill(255); 
        textSize(15); 
        text("44-49", x, h-20); 
      }   
      
      x = x+ barSpace;   
  }
}  

void drawXLabels() 
{  
  fill(255); 
  textSize(10); 
  textAlign(BOTTOM); 
  stroke(255); 
  
  //displays x axis increments or years from data 
  for (float i= minYear; i <= maxYear; i += 5) 
  {  
    float y= map(i, maxYear, minYear, X2, X1);  
    text(floor(i), y, height-10); 
   }   
}  


void save() 
{
save("Data_Visualization_.jpg");  
}


