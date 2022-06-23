class PowerUp extends GameObject{
  int counter;
  int counterdown;
  
  PowerUp(float x, float y){
    super(x, y, 0, 0, 20, blue, 1);
    counter=300;
    counterdown=100;
  }
  
  void act(){
    super.act();
    counter--;
    counterdown--;
    if(counter<=0){
      object.remove(this);
    }

    if(counterdown<=0){
      player1.powerUp=false;
    }
  }
  
  void show(){
    circle(x, y, size);
  }
}
