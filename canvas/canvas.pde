var pageWidth = 800;
var pageHeight = 500;
var ballX = pageWidth/2; 
var ballY = pageHeight/2; 
var speedX = -5;
var speedY = -5;
var computerPaddle = pageHeight/2;
void setup() {
    size(pageWidth,pageHeight);
}

void draw() {
    background(0,0,0);
    
    //Draw stage
    stroke(0, 255, 0);
    fill(0, 255, 0); 
    rect(0, 0, pageWidth, 10); 
    rect(0, pageHeight-10, pageWidth, 10); 
    rect(pageWidth/2, 0, 10, pageHeight/3); 
    rect(pageWidth/2, pageHeight-pageHeight/3, 10, pageHeight/3); 
    ellipse(pageWidth/2, pageHeight/2, 170, 170);    
    
    //Draw Paddle
    rect(20, mouseY, 20, 50); 
     
    //Draw Center Circle
    fill(0, 0, 0);
    ellipse(pageWidth/2, pageHeight/2, 150, 150);    
   
    //Draw Ball 
    fill(0, 255, 0); 
    ellipse(ballX, ballY, 20, 20);
    
    // Control Bounce off walls
    if(ballX == 0) {
        speedX = 5;
    } else if(ballX == pageWidth - 20) {
        speedX = -5;
    } else if(ballY == 0) {
        speedY = 5;
    }  else if(ballY == pageHeight -20) {
        speedY = -5;
    } 
    
    if(ballY > mouseY && ballY < mouseY + 50 && ballX == 40) {
        speedX = 5;
    }
       
    if(ballY > mouseY && ballY < mouseY + 50 && ballX == 40) {
        speedX = 5;
    }
        
    ballX += speedX;
    ballY += speedY;

    //Draw CPU Paddle
    rect(pageWidth - 40, ballY, 20, 50); 
}

