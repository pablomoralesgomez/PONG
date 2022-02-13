
public abstract class Player{
  
  private int velocity = 7;
  private int playerHeight= 75;
  private int playerWidth = 10;
  
  protected int x;
  protected int y;
  
  protected int getPlayerHeight() {
    return playerHeight;
  }
  
  protected int getX() {
    return x;
  }
  
  protected int getY() {
    return y;
  }
  
  protected int getVelocity() {
    return velocity;
  }
  
  // devolvemos el jugador a la posición inicial 
  protected void reset() {
    y = height/2 - (this.playerHeight/2);
  }
  
  protected void checkOutOfBounds() {
    if(y <= 0) y = 0;
    if(y + this.playerHeight >= height) y = height - this.playerHeight;
  }
  
  protected void drawPlayer() {
    rect(x, y, this.playerWidth, this.playerHeight);
  }
  
  protected abstract void movePlayer();
}
