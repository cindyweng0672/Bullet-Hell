class StarFighter extends GameObject { //<>// //<>//

  int cooldown, threshold;
  float velocity;
  int speedUpCount;
  int speedUpTimer;
  float v;

  StarFighter() {
    super(width/2, height/2, 0, 0, 60, #FF0000, 10);
    threshold=30;
    cooldown=threshold;
    velocity=5;
    speedUpCount=0;
    v=velocity;
    speedUpTimer=300;
  }

  void act() {
    super.act();

    int targetNum=10;
    int protectScore=targetNum;

    if (score%targetNum==0 && score>0 && score>=protectScore) {
      protect=true;
      object.add(new Protect());
      protectScore+=targetNum;
    }

    //managing gun
    cooldown++;

    if (space && cooldown>=threshold) {
      object.add(new Bullet(powerUp));
      cooldown=0;
    }

    //controlling the starfighter 
    if (player1.speedUp && speedUpCount==0) {
      velocity+=velocity/2;
      speedUpCount++;
    }

    if (!speedUp) {
      velocity=v;
    }

    if (up) {
      vy=-velocity;
    }
    if (down) {
      vy=velocity;
    }
    if (right) {
      vx=velocity;
    }
    if (left) {
      vx=-velocity;
    }

    if (!up||!down) {
      vy*=0.9;
    }
    if (!right||!left) {
      vx*=0.9;
    }

    //collide with
    for (int i=0; i<object.size(); i++) {
      GameObject obj=object.get(i);
      if (collidingWith(obj)) {
        if (obj instanceof AddLife) {
          object.remove(i);
          player1.lives++;
          coin.rewind();
          coin.play();
        }

        if (obj instanceof PowerUp) {
          player1.powerUp=true;
          object.remove(i);

          coin.rewind();
          coin.play();
        }

        if (obj instanceof SpeedUp) {
          obj.lives--;
          speedUp=true;
          //object.remove(i);

          coin.rewind();
          coin.play();
        }

        if (obj instanceof EnemyBullet && !protect) {
          player1.lives--;
          object.remove(i);
          bump.rewind();
          bump.play();

          if (player1.lives<=0) {
            player1.explode(red);
            mode=GAMEOVER;
          }
        }
      }
    }


    if (speedUp) {
      speedUpTimer--;

      if (speedUpTimer<=0) {
        speedUp=false;
      }
    }

    //boundary 
    if (player1.x<=player1.size/2) {
      player1.x=player1.size/2;
    }
    if (player1.x>=width-player1.size/2) {
      player1.x=width-player1.size/2;
    }
    if (player1.y<=0) {
      player1.y=0;
    }
    if (player1.y>= height-player1.size) {
      player1.y=height-player1.size;
    }
  }

  void show() {
    image(spaceship, x-size/2, y, size, size);
  }

  void explode(color c) {
    for (int i=0; i<n; i++) {
      gameover.add(new Particle(x, y, random(-2, 2), random(-2, 2), 70, c));
    }

    object.remove(this);
  }

  /*  void introShow() {
   float vxintro=-3;
   float vyintro=1;
   
   x+=vxintro;
   y+=vyintro;
   
   float a, b, d;
   a=400;
   b=400;
   d=size;
   
   a+=vxintro;
   b+=vyintro;
   
   if (a<(size/2)||a>width-(size/2)) {
   vxintro=-vxintro;
   }
   if (b<(size/2)||b>height-(size/2)) {
   vyintro=-vyintro;
   }
   
   fill(white);
   circle(a, b, d);
   }*/
}
