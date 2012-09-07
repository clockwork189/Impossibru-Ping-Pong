var pageWidth = 800;
var pageHeight = 500;
var ballX = pageWidth/2; 
var ballY = pageHeight/2; 
var speedX = -5;
var speedY = -5;
var computerPaddle = pageHeight/2;
var cpuPaddleY = 0;
var cpuPaddleX = pageWidth - 40;
var ballMoving = false;
var score = 0;
var isGameOver = false;

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
     
    //Draw Center Circle and write instructions within
    fill(0, 0, 0);
    ellipse(pageWidth/2, pageHeight/2, 150, 150);        
    
    // Control Bounce off walls
    if(ballX == 0) {
		isGameOver = true;
    } else if(ballX == pageWidth - 20) {
        speedX = -5;
		
    } else if(ballY == 0) {
        speedY = 5;
    }  else if(ballY == pageHeight -20) {
        speedY = -5;
    } 
    
    // Control Ball Bounce off Paddle
    if(ballY > mouseY && ballY < mouseY + 50 && ballX == 40) {
        speedX = 5;
		score += 1;
    }
       
    // Control Ball Bounce off Enemy Paddle
    if(ballX == cpuPaddleX) {
        speedX = -5;
    }
        
	if(ballMoving && isGameOver == false) {    
        ballX += speedX;
        ballY += speedY;

        //Draw CPU Paddle
        cpuPaddleY = ballY - 25;
        rect(cpuPaddleX, cpuPaddleY, 20, 50);

        //Draw Center Circle and write instructions within
        fill(0, 0, 0);
        ellipse(pageWidth/2, pageHeight/2, 150, 150);    

        fill(0, 255, 0); 
        PFont fontA = loadFont("courier");
        textFont(fontA, 14); 
        text("Score:" + score, pageWidth/2 - 30, pageHeight/2);

		//Draw Ball 
        ellipse(ballX, ballY, 20, 20);
    } else if(isGameOver) {
		fill(0, 255, 0); 
	    PFont fontA = loadFont("courier");
	    textFont(fontA, 14); 
	    text("Game Over!", pageWidth/2 - 40, pageHeight/2);
	    text("Score: " + score, pageWidth/2 - 30, pageHeight/2 + 15);
	} else {
		fill(0, 255, 0); 
	    PFont fontA = loadFont("courier");
	    textFont(fontA, 14); 
	    text("Press any button", pageWidth/2 - 60, pageHeight/2);
	    text("to start", pageWidth/2 - 30, pageHeight/2 + 15);
	}
}

void keyPressed() {
    ballMoving = true;
}
