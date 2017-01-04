
/*****************************************
 * Assignment 06
 * Name:         Nanda Bhushan
 * E-mail:       nbhushan@brynmawr.edu 
 * Course:       CS 110 - Section 02
 * Submitted:    11/30/16 
 * This animation displays a penguin whose eyes shrink and expand across the screen 
 
 
 *****************************************/

//declaring the class
NBhushanThingy penguin;  


interface Creature 
{ 
}

void setup() //setup sketch  
{  
  size(500,500);  
  background(255);  
  penguin = new NBhushanThingy(1); 
}    

void draw() //draws the object 
{  
  background(255);  
  //calls methods of the class 
  penguin.display();  
  penguin.move();  
  penguin.pulse(); 
}

class NBhushanThingy implements Creature 
{    
  int deltaX = 3;  //speed variable 
  float SIZE; 
  int d = 1; //initial diameter for eyes 
  boolean option= false; //default for pulse 
  float g_x = random(0,500);  //random postion of object
  float g_y = random(0,500); //random position of object 
  
    
  NBhushanThingy(float SIZE) 
  {    
   //the size variable is equal to the parameter 
   this.SIZE = SIZE; 
  } 
 
  
  void display() 
  {   
    int n = 2; 
    
    pushMatrix();    
    
        
    pushMatrix();  
    fill(0); 
    ellipse(g_x, g_y, 150, 150);   
    fill(255); 
    ellipse(g_x - (30*SIZE), g_y - (40*SIZE), (30*SIZE), (30*SIZE));  
    ellipse(g_x + (30*SIZE), g_y -(40*SIZE), (30*SIZE),(30*SIZE));   
    popMatrix(); 
    
    //penguin nose 
    pushMatrix(); 
    fill(255, 0, 0); 
    triangle(g_x-(10*SIZE), g_y-(30*SIZE), g_x, g_y, g_x+(10*SIZE), g_y-(30*SIZE));    
    popMatrix(); 
    
    //penguin belly 
    pushMatrix(); 
    fill(255);  
    strokeWeight(15); 
    ellipse(g_x, g_y+(150*SIZE), (100*SIZE),(200*SIZE));   
    popMatrix(); 
    
    //right arm 
    bezier(g_x+(50*SIZE), g_y+(150*SIZE), g_x+(150*SIZE),  
    g_y-(100*SIZE), g_x+(150*SIZE), g_y+(150*SIZE),  
    g_x+(50*SIZE), g_y+(200*SIZE));  
    
    //left arm 
    bezier(g_x-(50*SIZE), g_y+(150*SIZE), g_x-(150*SIZE),  
    g_y-(100*SIZE), g_x-(150*SIZE), g_y+(150*SIZE), g_x-(50*SIZE),  
    g_y+(200*SIZE)); 
    
    popMatrix();  
    
    //eyes
    for (int i=0; i<n; i++) 
    { 
      pushMatrix(); 
      pulse();  
      fill(255);  
      ellipse(g_x - (30*SIZE), g_y - (40*SIZE), d, d); 
      //ellipse(2+scale*cos(angle*i), -15+scale*sin(angle*i), d, d);   
      fill(0);  
      ellipse(g_x + (30*SIZE), g_y - (40*SIZE), d, d);
      //ellipse(2+scale/1.1*cos(angle*i), -15+scale/1.1*sin(angle*i), d/12, d/12); 
      popMatrix(); 
    } 
  }  
 
 //advances object across the screen 
  void move () 
  {  
    g_x += deltaX;
    g_y += deltaX; 
    if (g_x > width)  
    { 
      g_x = 0; 
      if (g_y > height)//resets penguin at upper lefthand corner 
        g_y = 0; 
    }
  }  
  
  void pulse() 
  {  
    //allows penguins eyes to shrink & expand 
    //d is the diameter of the eyes 
    if (d < width/100) 
    {  
      option = false; 
    } 
     if(d> width/10) 
    {  
      option = true;
    }   
    //check if circle needs to grow or shrink 
    if (option == false) 
    {  
      d++; 
    } 
    if (option == true) 
    {  
      d--; 
    } 
    }
  } 

void save() 
{
save("sketch_06.jpg");  
}