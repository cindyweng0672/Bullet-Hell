class Particle extends GameObject {
  int range;
  int n;
  int min;
  float sizespark;

  /*float[] movearrx=new float[n];
   float[] movearry=new float[n];
   float[] posarrx=new float[n];
   float[] posarry=new float[n];*/

  Particle(float myx, float myy, float vx, float vy, float s, color c) {
    super(myx, myy, vx, vy, s, c, 1);
    range=20;
    n=7;
    min=1;
    sizespark=s;

    int last=object.size()-1;

    if (mode==GAME) {
      if (dist(object.get(last).x, object.get(last).y, x, y)>10) {
        c=black;
      }
    } else if (mode==GAMEOVER) {
      if (dist(player1.x, player1.y, x, y)>10) {
        c=black;
      }
    }
    /*s=dist(myx, myy, x, y);
     size=s;*/

    /*for (int i=0; i<n; i++) {
     movearrx[i]=random(-range, range);
     movearry[i]=random(-range, range);
     }*/
  }

  void act() {
    super.act();
    if (sizespark>min) {
      size*=0.95;
    }
    if (sizespark<=min) {
      lives=0;
    }
  }

  void show() {
    super.show();
  }
}
