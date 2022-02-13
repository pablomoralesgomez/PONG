import processing.sound.*;

Playfield playfield;
Player left, right;
Ball ball;
Collitions collition;

// Sonidos que reproduce la plicación durante su ejecución
SoundFile soundBorder;
SoundFile soundPlayer;
SoundFile soundGoal;

// Array para chequear si se pulsa una tecla: w, s, u, j
int[] pressedKey = {0, 0, 0, 0};

// Variable para distinguir los distintos estados del juego
int gameMode = 0;

void setup() {
  size(750, 500); 
  
  playfield = new Playfield();
  left = new LeftPlayer();
  right = new RightPlayer();
  ball = new Ball(30);
  collition = new Collitions(ball, left, right, playfield);
  
  soundBorder = new SoundFile(this, "border.wav");
  soundPlayer = new SoundFile(this, "player.wav");
  soundGoal = new SoundFile(this, "goal.wav");
  
  stroke(255);
  strokeWeight(2);
}

void draw() {

  if(gameMode == 0) {
    playfield.drawPlayfield();
    left.drawPlayer();
    right.drawPlayer();
    ball.drawBall();
    
    playfield.drawHelp();
  } else if(gameMode == 1) {
    
    // Dibujamos los diferentes elementos
    playfield.drawPlayfield();
    left.drawPlayer();
    right.drawPlayer();
    ball.drawBall();
    
    // Movemos los diferentes elementos
    left.movePlayer();
    right.movePlayer();
    ball.moveBall();
    
    // Comprobamos las colisiones
    collition.checkCollitionLeft();
    collition.checkCollitionRight();
    collition.checkBorderBounce();
    collition.checkGoal();
    
    // Comprobamos si ha terminado la partida
    playfield.checkWinner();
  } else if(gameMode == 2) {
    
    playfield.drawPlayfield();
    left.drawPlayer();
    right.drawPlayer();
    ball.drawBall();
    
    playfield.drawFinish();
  }
}

void keyPressed() {
  if(key == 'w' || key == 'W') pressedKey[0] = 1;
  if(key == 's' || key == 'S') pressedKey[1] = 1;
  if(key == 'u' || key == 'U') pressedKey[2] = 1;
  if(key == 'j' || key == 'J') pressedKey[3] = 1;
  if(key == 'h' || key == 'H') gameMode = 0;
  if(key == ENTER) {
    if(gameMode == 2) {
      collition.resetGame();
    }
    gameMode = 1;
  }
}

void keyReleased() {
  if(key == 'w' || key == 'W') pressedKey[0] = 0;
  if(key == 's' || key == 'S') pressedKey[1] = 0;
  if(key == 'u' || key == 'U') pressedKey[2] = 0;
  if(key == 'j' || key == 'J') pressedKey[3] = 0;
}

// Funciones que se van a reproducir mientras se juega
public void soundGoal() {
  soundGoal.play();
}

public void soundPlayer() {
  soundPlayer.play();
}

public void soundBorder() {
  soundBorder.play();
}
