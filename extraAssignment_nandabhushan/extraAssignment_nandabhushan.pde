
void setup(){  
  background(242, 242, 242); 
  size(displayWidth, displayHeight); 
  noFill(); 
  ellipse(width/2, height/2, 50, 50);  
  ellipse(width/2, height/2, 200, 200);    
  translate(width/2, height/2); 
  drawSquares(); 
  drawCircles();  
  drawTriangles();  
  drawLayer(); 
}

void drawSquares(){ 
//translate(width/2, height/2);
for (float angle=0; angle < 4 * PI; angle += PI/6){ 
  fill(random(200, 120), random(200, 300), random(200, 350)); 
  rect(70, 70, 50, 50);  
  rotate(PI/6);   
  } 
}
 
void drawCircles(){ 
  for (float angle=0; angle < 4 * PI; angle += PI/5){ 
    fill(255, 153, 153);  
    ellipse(80, 80, 40, 40); 
    rotate(PI/6); 
  }  
}  

void drawTriangles(){ 
  for (float angle= 0; angle < 4 * PI; angle += PI/6){ 
    fill(255,191,0); 
    triangle(20, 50, 30, 70, 40, 50); 
    rotate(PI/5); 
  } 
} 


void drawLayer(){   
  for (float angle = 0; angle < 4 * PI; angle += PI/6) {  
    fill(255, 102, 153);
    triangle(200, 80, 250, 100, 300, 80);  
    rotate(PI/6); 
  } 
} 
