class Star extends GameObject{
  //constructor 
  Star(){
    super(random(width), 0, 0, 0, random(1, 5), white, 1);
    vy=size;
  }
  
  void act(){
    super.act();
        
    if(y>height){
      lives=0;
    }
  }
  
  void show() {
    fill(c);
    square(x, y, size);
  }
}
