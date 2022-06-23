abstract class GameObject {
  float x, y, vx, vy, size;
  color c;
  int lives;
  boolean cw;
  boolean powerUp;
  boolean speedUp;
  boolean protect;
  int n=8;

  GameObject(float x, float y, float vx, float vy, float size, color c, int lives) {
    this.x=x;
    this.y=y;
    this.vx=vx;
    this.vy=vy;
    this.size=size;
    this.c=c;
    this.lives=lives;
    powerUp=false;
    speedUp=false;
    protect=false;
  }

  void act() {
    x+=vx;
    y+=vy;
  }

  void show() {
    /*if (cw) {
     for (int i=0; i<n; i++) {
     size=0;
     posarrx[i]=x+movearrx[i];
     posarry[i]=x+movearry[i];
     s=dist(posarrx[i], posarry[i], x, y)/10;
     fill(c);
     square(posarrx[i], posarry[i], s);
     
     if (s!=0) {
     posarrx[i]+=3;
     posarry[i]+=3;
     }
     
     if (posarrx[i]>x+range||posarrx[i]<x-range||posarry[i]>y+range||posarry[i]<y-range) {
     s=0;
     }
     }
     } else {*/
    noStroke();
    fill(c);
    square(x, y, size);
    //}
  }

  boolean collidingWith(GameObject obj) {
    /*if (cw) {
     return true;
     } else*/
    if (dist(obj.x, obj.y, x, y)<=(obj.size/2+size/2)) {
      return true;
    }
    return false;
  }

  boolean offScreen() {
    if (x<0||x>width||y<-50||y>height) {
      return true;
    }
    return false;
  }

  boolean offScreen(color c) {
    if (c==blue) {
      if (y>height) {
        return true;
      } else {
        return false;
      }
    } else {
      if (x<0||x>width||y<-50||y>height) {
        return true;
      }
      return false;
    }
  }
}
