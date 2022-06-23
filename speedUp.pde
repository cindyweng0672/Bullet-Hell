class SpeedUp extends GameObject { //<>//
  int count;

  SpeedUp(float x, float y) {
    super(x, y, 0, 0, 30, blue, 1);
    count=200;
  }

  void act() {
    count--;
    if (count<=0 || player1.speedUp) {
      /*println("countdown=0");
      //player1.speedUp=true;
      println("speedUpclass "+player1.speedUp);
      if (player1.speedUp==true){
        countdown=200;
        println("coundown=200");
      }
    }
    if (countdown>0) {
      countdown--;
      if (countdown==0) {
        player1.speedUp=false;
        println("p.speedup=false");
      }
    }

    if (count<=0 && countdown<=0) {*/
      object.remove(this);
      println("remove");
    }
  }

  void show() {
    if (lives>0) {
      noFill();
      strokeWeight(5);
      stroke(c);
      circle(x, y, size);

      noStroke();
      fill(black);
      rect(x-size/2, y+size/4, size/2, size/2);

      fill(c);
      triangle(x-size, y, x, y, x-size/2, y+size/4);
    }
  }
}
