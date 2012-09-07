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
var promptedName = false;
var paddleWidth = 20;
var paddleHeight = 50;
PFont fontA = loadFont("Courier New");    
		
void setup() {
    size(pageWidth,pageHeight);
	textFont(fontA, 14);
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
    ellipse(pageWidth/2 +5, pageHeight/2, 170, 170);    
    
    //Draw Paddle
    rect(20, mouseY, paddleWidth, paddleHeight); 
     
    //Draw Center Circle and write instructions within
    fill(0, 0, 0);
    ellipse(pageWidth/2 + 5, pageHeight/2, 150, 150);        
    
    // Control Bounce off walls
    if(ballX == 0) {
		isGameOver = true;
		ballMoving = false;
		ballX = pageWidth/2;
		ballY = pageHeight/2;
    } else if(ballX == pageWidth - 20) {
        speedX = -speedX;
		
    } else if(ballY == 0) {
        speedY = 5;
    }  else if(ballY == pageHeight -20) {
        speedY = -speedY;
    } 
    
    // Control Ball Bounce off Paddle
    if(ballY > mouseY && ballY < mouseY + paddleHeight && ballX == 40) {
        speedX = -speedX;
		score += 1;
    }
       
    // Control Ball Bounce off Enemy Paddle
    if(ballX == cpuPaddleX) {
        speedX = -speedX;
    }
    
	if(isGameOver == true) {
		fill(0, 255, 0); 
	    text("GAME OVER!", pageWidth/2 - 35, pageHeight/2 -30);
	    text("SCORE: " + score, pageWidth/2 - 20, pageHeight/2 - 15);
		text("PRESS SPACE TO", pageWidth/2 - 45, pageHeight/2 + 10);
		text("RESTART", pageWidth/2 - 20, pageHeight/2 + 25);
	} else {
		if(ballMoving) {    
	        ballX += speedX;
	        ballY += speedY;

	        //Draw CPU Paddle
	        cpuPaddleY = ballY - 25;
	        rect(cpuPaddleX, cpuPaddleY, paddleWidth, paddleHeight);

	        //Draw Center Circle and write instructions within
	        fill(0, 0, 0);
	        ellipse(pageWidth/2 + 5, pageHeight/2, 150, 150);    

	        fill(0, 255, 0); 
	        textFont(fontA, 14); 
	        text("SCORE:" + score, pageWidth/2 - 20, pageHeight/2);

			//Draw Ball 
	        ellipse(ballX, ballY, 20, 20);
			
		} else {
			fill(0, 255, 0);  
		    text("PRESS SPACE TO", pageWidth/2 - 50, pageHeight/2);
		    text("START", pageWidth/2 - 15, pageHeight/2 + 15);
		}
	}
}

void keyTyped() {
	if(int(key) == 32) {
		if(ballMoving == false) {
			ballMoving = true;
		}
		if(isGameOver == true) {
			isGameOver = false;
		}
	}
}
