/*****************************************
 * Assignment 05
 * Name:         Nanda Bhushan
 * E-mail:       nbhushan@brynmawr.edu 
 * Course:       CS 110 - Section 02
 * Submitted:    11/21/16 
 * This animation displays rain continiously falling and if you click on the screen you can add your own drops or flakes
 * and the rain can turn in to white drops or snowflakes. 

 *****************************************/
boolean clicked = false; 

//array for blue rain 
Rain[]g_raindrop;  

//array for white rain or snow when mouse pressed
Snow[]g_snowflake;   

//array to start with one ball 
Ball[] balls = new Ball[1];  


//creating  initial set of raindrops, snowflakes, and balls 
final int NUM_INITIAL_RAINDROPS = 50;  
final int NUM_INITIAL_SNOWFLAKES = 50;  
final int NUM_INITIAL_BALL= 1; 

void setup()
{
  size(1000, 1000);
  background(255, 255, 255);  
  
  //new ball user can make with width of 25 
   balls[0] = new Ball(1000, 0, 25);
  
  g_raindrop = new Rain[NUM_INITIAL_RAINDROPS];   
    for (int i=0; i<g_raindrop.length; i++) 
    { 
      g_raindrop[i] = new Rain();  
    }   
  
  g_snowflake = new Snow[NUM_INITIAL_SNOWFLAKES]; 
    for (int i=0; i<g_snowflake.length; i++) 
    { 
      g_snowflake[i] = new Snow(); 
    } 
  balls = new Ball[NUM_INITIAL_BALL]; 
   for(int i=0; i<balls.length; i++) 
    {  
     balls[i]= new Ball(); 
    }
}  



void draw()
{   
   background(0);    
   
   for(float i=0; i < 1000; i += 20)  
   { 
     //draws gray clouds at top of display screen 
     noStroke(); 
     fill(139, 150, 168); 
     ellipse(10 + i, 50, 50, 150); 
   }
   
   for(Rain b : g_raindrop) 
   {
     //draw or display each raindrop
     b.draw();  
   }   
   
   //only turn white if mouse is clicked
   if (mousePressed)  
   {
     for(Snow c : g_snowflake) 
     {  
       //draw or displa each snowflakes
       c.draw(); 
     }  
   }  
   for (int i=0; i<balls.length; i++ ) 
   {  
    //despite how many balls are created update, move, and draw them 
    balls[i].update();
    balls[i].move();
    balls[i].draw();
  } 
} 

void mousePressed() 
{
  // create a new ball where the mouse is clicked 
  Ball b = new Ball(mouseX, mouseY, 25); // make a new ball  at the clicked location location
  balls = (Ball[]) append(balls, b); // append function to add new ball elements to the ball array
}

class Rain
{ 
  float x, y;  
  
  //how far the drops can go down 
  final int limit = 1000;   
  //the width and height of the drops 
  final int xradius = 10;
  final color COLOR = color(50, 100, 150);    
 
  void draw()   
  { 
    for (int i=0; i<g_raindrop.length; i++) 
    {  
      if(y > 290) //to run loop continiously, once y passes 290 it will start again
      {   
        y=0; 
      } 
      int x = 10 + i * 100;  //so that rows of drops are equally spred out 
      y += random(150, limit); //randomize the speed of the drops 
      fill(COLOR); 
      ellipse(x,y, xradius*2, xradius*2); 
     }  
  } 
}
  
class Snow 
{    
  float x, y; 
  
  final color COLOR = color(255);  
  final int xradius = 10; //width and height of flake ellipse 
  final int limit= 1000; //how far flakes can go down  
 
  void draw() 
  { 
    for(int i=0; i < g_snowflake.length; i++) 
    {  
      if(y > 290) //to run loop continiously, once y passes 299 it will start again
      {   
        y=0; 
      }  
      int x = 10 + i * 100; //so that rows of flakes are equally spread out 
      y += random(150, limit); //randomize the speed of the flakes 
      pushMatrix(); 
      fill(COLOR); 
      ellipse(x, y, xradius*2, xradius*2);  
      popMatrix(); 
      }  
  }
}  

class Ball {
  float x;
  float y;
  float speed;
  float w;  
  //gravity variable for ball
  float gravity = 0.25; 
  
  //constructor 
  Ball() 
  { 
  } 
  
  Ball(float g_x, float g_y, float g_w)  
  {
    //variables needed to be defined pass in to draw and update
    x = g_x;
    y = g_y;
    w = g_w;
    speed = 0;
  }
  
  
  void update()  
  {
    // adding gravity to speed 
    speed = speed + gravity;
  }
  
  void move() {
    // to increase spped
    y = y + speed;
    // to reverse speed if it reaches the bottom 
    if (y > height) {
      speed = speed * -1.0;
      y = height;
    }
  }
  

  void draw() {
    // draw the circle 
    stroke(0);
    fill(160,192,255);
    ellipse(x,y,w,w);
  } 
  
  //void clicked() 
 // {  
   // boolean clicked(float m_x, float m_y) 
   // { 
      //if(m_x>= g_x && mx 
    //}
  } 

void save() 
{
save("animation_.jpg");  
}