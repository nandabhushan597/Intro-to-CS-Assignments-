size (500, 500);
background (0, 0, 102);  

// blue border  
noStroke();
rect (50, 50, 400, 400);  

// center of flower    
stroke(153); 
fill (51, 51, 0); 
ellipse (250, 230, 95, 85);   

// outline of the stem of flower   
line(270, 275, 270, 415); 
line(230, 275, 230, 415);  

// green fill of stem   
fill (0, 102, 0);
rect(230, 275, 40, 140);  


//flower petals     
stroke(153); 
fill (255, 204, 0);  
ellipse (250, 160, 80, 80); 
ellipse (195, 195, 85, 80);  
ellipse (315, 195, 85, 80); 
ellipse (195, 260, 85, 80); 
ellipse (315, 260, 85, 80); 
ellipse (250, 300, 80, 80);   

//brown pot    
beginShape(); 
noStroke();
fill (102, 51, 0); 
quad (175, 375, 340, 375, 315, 440, 200, 440); 
endShape();  

//stem leaves 
fill (0, 102, 0);  
curve(280, 340, 230, 350, 230, 370, 280, 360);
curve(220, 325, 271, 335, 271, 355, 220, 355);   

//final border of orange arcs   
fill (255, 153, 102); 
arc(55, 55, 50, 50, 0, PI/2);  
arc(445, 55, 50, 50, PI/2, PI); 
arc(55, 445, 50, 50, 3*PI/2, 2*PI);  
arc(445, 445, 50, 50, PI, 3*PI/2);   

//text    
fill(255, 255, 255); 
text ("Nanda Bhushan", 400, 470); 
fill(255, 255, 255); 
text("CS110 Fall 2016", 400, 490);
