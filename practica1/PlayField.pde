
public class Playfield {
  
  private int rightScore = 0;
  private int leftScore = 0;
  private int middleRectLength = 10;   // tamaño de los rectangulos que señalan la mitad del campo
  private char winner = 'w';
  
  void drawPlayfield() {
    
    background(0);
    for(int i = 0; i < height; i += middleRectLength * 2) {
      rect(width/2 - 2.5, i, 5, middleRectLength);
    }
    
    textSize(64);
    textAlign(CENTER);
    text(leftScore, width/2/2, height/7);
    text(rightScore, (width/4)*3, height/7);
    textAlign(LEFT);
    textSize(14);
    text("Press H to pause and see the instructions", width/10 * 5.25 , height/10 * 9.5);
  }  
  
  void drawHelp() {
    fill(225, 225);
    noStroke();
    rect(width/12, height/8, width/12 * 10, height/8 * 6);
    
    fill(255, 0, 0);
    textSize(32);
    textAlign(CENTER);
    text("PONG INSTRUCTIONS", width/2, height/5);
    textSize(14);
    textAlign(CENTER);
    text("The ball will start moving randomly towards one of the players once you close this screen.", width/2 , height/5 *1.5);
    text("If a player scores, in the next round the ball will go towards the other one.", width/2 , height/5 *1.75);
    text("The game will finish when one of the players scores 7 goals.", width/2 , height/5 *2);
    text("Move the left player using W and S", width/2 , height/5 *2.5);
    text("Move the right player using U and J", width/2 , height/5 *2.75);
    
    text("To resume the game press ENTER", width/2 , height/8 *6);
    
    stroke(255);
    fill(255);
  }
  
  void drawFinish() {
    fill(225, 225);
    noStroke();
    rect(width/12, height/8, width/12 * 10, height/8 * 6);
    
    fill(255, 0, 0);
    textSize(32);
    textAlign(CENTER);
    if(this.winner == 'l')  text("LEFT PLAYER WINS!!", width/2, height/2);
    if(this.winner == 'r')  text("RIGHT PLAYER WINS!!", width/2, height/2);
    
    textSize(14);
    text("To start a new game press ENTER", width/2 , height/8 *6);
    
    stroke(255);
    fill(255);

  }
  
  void checkWinner() {
    if(leftScore == 7) {
      gameMode = 2;
      this.winner = 'l';
    }
    if(rightScore == 7) {
      gameMode = 2;
      this.winner = 'r';
    }
  }
  
  void incrementLeftScore() {
    leftScore += 1;
  }
  
  void incrementRightScore() {
    rightScore += 1;
  }
  
  void reset() {
    leftScore = 0;
    rightScore = 0;
    winner = 'w';
  }

}
