
public class RightPlayer extends Player {
  
  public RightPlayer() {
    super();
    this.x = width/10 * 9;
    this.y = height/2 - (this.getPlayerHeight()/2);
  }
  
  @Override
  protected void movePlayer() {

    if(pressedKey[2] == 1) y -= this.getVelocity();  // Tecla u
    if(pressedKey[3] == 1) y += this.getVelocity();  // Tecla j
    
    this.checkOutOfBounds();
    
  }
}
