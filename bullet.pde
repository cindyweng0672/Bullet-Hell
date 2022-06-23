class Bullet extends GameObject {

  Bullet(boolean powerUp) {
    super(player1.x, player1.y, 0, -10, 5, #FF0000, 1);
    this.powerUp=powerUp;
  }

  void act() {
    super.act();
    int theta=frameCount%360;
    
    if(scircle){
      vx=20*sin(radians(theta));
      
      //while(
    }
    if (offScreen()) {
      lives=0;
    }
  }

  void show() {
    if (!powerUp) {
      super.show();
    } 
    if (powerUp) {     
      fill(c);
      square(x-10, y, size);
      square(x+10, y, size);
    }
  }
}
