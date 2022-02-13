
public class LeftPlayer extends Player {
  
  public LeftPlayer() {
    super();
    this.x = width/10;
    this.y = height/2 - (this.getPlayerHeight()/2);
  }
  
  @Override
  protected void movePlayer() {

    if(pressedKey[0] == 1) y -= this.getVelocity();  // Tecla w
    if(pressedKey[1] == 1) y += this.getVelocity();  // Tecla s
    
    this.checkOutOfBounds();
    
  }
}
