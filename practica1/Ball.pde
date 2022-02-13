
public class Ball {
  
  private int x;            // Centro de la pelota
  private int y;
  
  private int vx;    // Velocidad a la que se desplaza
  private int vy;
  
  private int ballDiameter;
  
  // Iniciamos aleatoriamente la velocidad horizontal del balón para que 
  // en primera ronda sea aleatorio el jugador que comience la posesión
  public Ball(int ballDiameter) {
    this.x = width/2;
    this.y = height/2;
    this.ballDiameter = ballDiameter;
    this.vy = 0;
    
    if (random(-1, 1) > 0) {
      this.vx = 5;
    } else {
      this.vx = -5;
    }
  }
  
  private int getRadius() {
    return ballDiameter / 2;
  }
  
  private int getYVelocity() {
    return vy;
  }
  
  private void setXVelocity(int newVelocity) {
    this.vx = newVelocity;
  }
  
  private void setYVelocity(int newVelocity) {
    this.vy = newVelocity;
  }
  
  private void reset(char scorer) {
     x = width/2;
     y = height/2;
  
    ball.vy = 0;
    if(scorer == 'l') setXVelocity(5);
    if(scorer == 'r') setXVelocity(-5);
    
    // new game
    if(scorer == 'n') {  
      if (random(-1, 1) > 0) {
        this.vx = 5;
      } else {
        this.vx = -5;
      }
    }
  }
  
  private void drawBall() {
    noFill();
    ellipse(x, y, ballDiameter, ballDiameter);
    fill(255);
  }
  
  private void moveBall() {
    x += vx;
    y += vy;
  }
}
