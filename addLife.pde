class AddLife extends GameObject {
  int counter;
  
  AddLife(float x, float y) {
    super(x, y, 0, 0, 10, red, 1);
    counter=300;
  }

  void act() {
    super.act();
    counter--;
    if (counter<=0){
      object.remove(this);
    }
  }

  void show() {
      triangle(x, y, x+2*size, y, x+size, y+size);
      circle(x+size/2, y, size);
      circle(x+size/2*3, y, size);
  }
}
