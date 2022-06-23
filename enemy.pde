class Enemy extends GameObject {  //<>//
  float cooldown, threshold;
  color c;
  int purplives;

  Enemy(color colour, float vx, float vy, int life) {
    super(random(width), -20, vx, vy, 40, colour, life);
    c=colour;
    threshold=(random(1)+1)*500;
    cooldown=threshold;
    purplives=2;
  }

  Enemy(color colour, float x, float y) {
    super(x, y, random(-2, 2), 1, 40, colour, 1);
    c=colour;
    threshold=(random(1)+1)*100;
    cooldown=threshold;
  }

  void act() {
    super.act();

    if (c==blue) {
      if (x>=width-size/2 && vx>0) {
        vx=-vx;
      }
      if (x<=size/2 && vx<0) {
        vx=-vx;
      }
    }

    //shoot
    cooldown++;
    if (cooldown>=threshold) {
      cooldown=0;
      if (c==yellow) {
        object.add(new EnemyBullet(x, y, 0, 6, c, false));
      }

      if (c==purple) {
        object.add(new EnemyBullet(x, y, -4, 4, c, false));
      }

      if (c==green) {
        object.add(new EnemyBullet(x, y, 3, 7, c, false));
      }
      
      if (c==blue){
        object.add(new EnemyBullet(x, y, 3, 7, c, true));
      }
    }

    for (int i=0; i<object.size(); i++) {
      GameObject obj=object.get(i);
      if (obj instanceof Bullet) {
        cw=collidingWith(obj);

        if (cw) {
          explode();
          lives--;
          score++;
          obj.lives=0;

          coin.rewind();
          coin.play();

          if (c==green) {
            object.add(new AddLife(x, y));
          }

          if (c==yellow) {
            object.add(new PowerUp(x, y));
          }

          if (c==purple) {
            purplives--;
            if (purplives>0) {
              object.add(new Enemy(purple, obj.x-30, obj.y));
              object.add(new Enemy(purple, obj.x+30, obj.y));
            }
          }
          
          if(c==blue && lives<=0){
            object.add(new SpeedUp(x, y));
            println("add");
          }
        }
      }
    }

    if (offScreen(c)) {
      lives=0;
    }
  }
  
  void show(){
    if(c!=blue){
      super.show();
    }
    if(c==blue){
      fill(c);
      circle(x, y, size);
      fill(white);
      textSize(20);
      text(lives, x, y);
    }
  }

  void explode() {
    for (int i=0; i<n; i++) {
      object.add(new Particle(x, y, random(-2, 2), random(-2, 2), 70, c));
    }
    /*for (int i=0; i<n; i++) {
     float ex=random(x-range, x+range);
     float ey=random(y-range, y+range);
     float size=dist(ex, ey, x, y)/10;
     
     ex+=1;
     ey+=1;
     
     if (ex>=x+range || ex<=x-range || ey>=y+range ||ey<=y-range) {
     size=0;
     }
     
     fill(c);
     square(ex, ey, size);
     }*/
  }

  /*void show() {
   for (int i=0; i<n; i++) {
   float newx=x+movearr[i];
   float newy=x+movearr[i];
   size=dist(newx, newy, x, y)/5;
   fill(c);
   square(newx, newy, size);
   
   newx+=3;
   newy+=3;
   
   if(newx>x+range||newx<x-range||newy>y+range||newy<y-range){
   size=0;
   break;
   }
   
   }
   }
   */
  /*void explode(int range, int n) {
   //Enemy[] earr=new Enemy[n];
   
   for (int i=0; i<n; i++) {
   float ex=random(x-range, x+range);
   float ey=random(y-range, y+range);
   float size=dist(ex, ey, x, y)/10;
   
   ex+=1;
   ey+=1;
   
   if (ex>=x+range || ex<=x-range || ey>=y+range ||ey<=y-range) {
   size=0;
   }
   
   fill(c);
   square(ex, ey, size);
   }
   }*/
}
