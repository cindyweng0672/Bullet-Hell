void game() {

  //background(0);
  addObjects();

  noStroke();
  fill(black, 100);
  rect(width/2, height/2, width, height);

  gameEngine();
  debug();

  if (score>highScore) {
    highScore=score;
  }
}

void addObjects() {
  object.add(0, new Star()); 
  if (frameCount%100==0) {
    object.add(new Enemy(yellow, 0, 2, 1));
    object.add(new Enemy(purple, -1, 1, 1));
    object.add(new Enemy(green, 2, 1));
  }
  if (frameCount%200==0) {
    object.add(new Enemy(blue, 1, 0.5, 3));
  }
}

void gameEngine() {
  for (int i=0; i<object.size(); i++) {     
    GameObject temp=object.get(i);

    temp.act();
    temp.show();

    /*int count;
     if(temp.cw){
     count=10;
     temp.show();
     count--;
     }else{
     count=0;
     }*/
    boolean isSpeedUpObj=temp instanceof SpeedUp;
    if (isSpeedUpObj){
      println("check : SpeedUp True");
    }
    else {
      if (temp.lives<=0) {
        object.remove(i);
        i--;
      }
    }
  }

  player1.show();
  player1.act();
}

void debug() {
  textSize(10);
  fill(255);
  text(frameRate, 20, 20);
  text(object.size(), 20, 40);

  textSize(20);
  text("Lives " + player1.lives, 700, 50);
  text("Score " + score, 700, 100);
  if (player1.powerUp==false) {
    text("powerUP OFF", 650, 150);
  }
  if (player1.powerUp==true) {
    text("powerUp  ON", 650, 150);
  }

  if (player1.protect) {
    text("protected  ON", 650, 200);
  }
  if (!player1.protect) {
    text("protected OFF", 650, 200);
  }

  if (player1.speedUp) {
    text("speed x1.5 ", 650, 250);
  }
  if (!player1.speedUp) {
    text("speed x1.0 ", 650, 250);
  }
}

void gameClicks() {
  mode=PAUSE;
}
