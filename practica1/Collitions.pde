
public class Collitions {
  
  private Ball ball;
  private Player leftPlayer;
  private Player rightPlayer;
  private Playfield playfield;
  
  public Collitions(Ball ball, Player left, Player right, Playfield playfield) {
    this.ball = ball;
    this.leftPlayer = left;
    this.rightPlayer = right;
    this.playfield = playfield;
  }
  
  private void checkBorderBounce() {
    if(ball.y - ball.getRadius() <= 0 || ball.y + ball.getRadius() >= height) {
      ball.vy *= -1;
      thread("soundBorder");
    } 
    
    //if (ball.x - ball.getRadius() <= 0 || ball.x + ball.getRadius() >= width) ball.vx *= -1;
  }
  
  // Dividimos la pala en 5 partes para imprimir una velocidad diferente a la bola según con que parte la golpeas
  private void checkCollitionLeft() {  
    if(ball.x - ball.getRadius() <= leftPlayer.x && ball.x - ball.getRadius() >= leftPlayer.x - abs(ball.vx)) {
    
      int playerWidthFifth = leftPlayer.playerHeight  / 5;
      
      if(ball.y >= leftPlayer.y - ball.ballDiameter && ball.y  <=  leftPlayer.y + playerWidthFifth) {
        ball.vx = 5;
        leftChangeYVelocity(7);
        thread("soundPlayer");
        
      } else if(ball.y  > leftPlayer.y + playerWidthFifth && ball.y  <= leftPlayer.y + playerWidthFifth*2) {
        ball.vx = 7;
        leftChangeYVelocity(5);
        thread("soundPlayer");
        
      } else if(ball.y  > leftPlayer.y + playerWidthFifth*2 && ball.y  <= leftPlayer.y + playerWidthFifth*3) {
        ball.vx = 10;
        leftChangeYVelocity(3);
        thread("soundPlayer");
        
      } else if(ball.y  > leftPlayer.y + playerWidthFifth*3 && ball.y  <= leftPlayer.y + playerWidthFifth*4) {
        ball.vx = 7;
        leftChangeYVelocity(5);
        thread("soundPlayer");

      } else if(ball.y > leftPlayer.y + playerWidthFifth*4 && ball.y  <= leftPlayer.y + leftPlayer.playerHeight + ball.ballDiameter) {
        ball.vx = 5;
        leftChangeYVelocity(7);
        thread("soundPlayer");

      }
    }
  }
  
  // Modificamos la velocidad vertical de la bola si la pala está en movimiento (añadimos así más inercia)
  private void leftChangeYVelocity(int newVelocity) {
    if(keyPressed) {
      if(pressedKey[0] == 1) ball.vy = -newVelocity;
      if(pressedKey[1] == 1) ball.vy = newVelocity;
        
    } else if(ball.getYVelocity() != 0){
      if(ball.vy > 0)  ball.vy = ball.getYVelocity() - 1;
      if(ball.vy < 0)  ball.vy = ball.getYVelocity() + 1;
      
    }
  }
  
  // Dividimos la pala en 5 partes para imprimir una velocidad diferente a la bola según con que parte la golpeas
  private void checkCollitionRight() {
    if(ball.x + ball.getRadius() >= rightPlayer.x && ball.x + ball.getRadius() <= rightPlayer.x  + abs(ball.vx)) {
      
      int playerWidthFifth = rightPlayer.getPlayerHeight()/5;
      
      if(ball.y >= rightPlayer.y - ball.ballDiameter && ball.y <=  rightPlayer.y + playerWidthFifth) {
        ball.setXVelocity(- 5);
        rightChangeYVelocity(7);
        thread("soundPlayer");
       
      } else if(ball.y > rightPlayer.y + playerWidthFifth && ball.y <= rightPlayer.y + playerWidthFifth*2) {
        ball.setXVelocity(- 7);
        rightChangeYVelocity(5);
        thread("soundPlayer");
        
      } else if(ball.y > rightPlayer.y + playerWidthFifth*2 && ball.y <= rightPlayer.y + playerWidthFifth*3) {
        ball.setXVelocity(- 10);
        rightChangeYVelocity(3);
        thread("soundPlayer");
        
      } else if(ball.y > rightPlayer.y + playerWidthFifth*3 && ball.y <= rightPlayer.y + playerWidthFifth*4) {
        ball.setXVelocity(- 7);
        rightChangeYVelocity(5);
        thread("soundPlayer");
        
      } else if(ball.y > rightPlayer.y + playerWidthFifth*4 && ball.y <= rightPlayer.y + rightPlayer.playerHeight + ball.ballDiameter) {
        ball.setXVelocity(- 5);
        rightChangeYVelocity(7);
        thread("soundPlayer");
        
      }
    }
  }
  
  // Modificamos la velocidad vertical de la bola si la pala está en movimiento (añadimos así más inercia)
  private void rightChangeYVelocity(int newVelocity) {
    if(keyPressed) {
      if(pressedKey[3] == 1) ball.setYVelocity(newVelocity);
      if(pressedKey[2] == 1) ball.setYVelocity(-newVelocity);
      
    } else if(ball.getYVelocity()  != 0){
      if(ball.getYVelocity() > 0)  ball.setYVelocity(ball.getYVelocity() - 1);
      if(ball.getYVelocity() < 0)  ball.setYVelocity(ball.getYVelocity() + 1);
      
    }
  }
  
   private void checkGoal() {
    
    if (ball.x <=  0) {
      playfield.incrementRightScore();
      ball.reset('r');
      rightPlayer.reset();
      leftPlayer.reset();
      thread("soundGoal");
      
    } else if(ball.x >= width) {
      
      playfield.incrementLeftScore();
      ball.reset('l');
      leftPlayer.reset();
      rightPlayer.reset();
      thread("soundGoal");

    }
   }
   
   private void resetGame() {
     
     leftPlayer.reset();
     rightPlayer.reset();
     ball.reset('n');
     playfield.reset();
   }
  
}
