class Protect extends GameObject {
  int count;

  Protect() {
    super(player1.x, player1.y, 0, 0, player1.size, white, 1);
    count=100;
  }

  void act() {
    x=player1.x;
    y=player1.y;

    count--;
    //println(count);
    if (count<=0) {
      player1.protect=false;
      object.remove(this);
    }
  }

  void show() {
    fill(c);
    circle(x, y, size);
  }
}
