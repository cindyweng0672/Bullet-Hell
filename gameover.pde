void gameOver() {
  //background(red);
  fill(black, 100);
  rect(width/2, height/2, width, height);
  noStroke();

  for (int i=0; i<n; i++) {
    star.add(new Star());
  }

  for (int i=0; i<star.size(); i++) {
    star.get(i).show();
    star.get(i).act();
  }

  //text
  textAlign(CENTER);
  textSize(50);
  text("YOU ARE DEAD!", width/2, height/2);
  text("High Score "+highScore, width/2, height/2+100);

  fill(white);
  rect(300, 600, 150, 100);
  rect(500, 600, 150, 100);

  fill(black);
  textSize(20);
  text("RESTART", 300, 600);
  text("EXIT", 500, 600);

  //starfighter explode 
  for (int i=0; i<gameover.size(); i++) {     
    GameObject temp=gameover.get(i);

    temp.act();
    temp.show();
  }

  for (int i=0; i<object.size(); i++) {
    object.remove(i);
  }

  player1.powerUp=false;
  player1.speedUp=false;
  
  /*for (int i=0; i<object.size(); i++) {
   GameObject temp=object.get(i);
   
   if (temp instanceof PowerUp || temp instanceof AddLife) {
   object.remove(i);
   }
   }*/
   dead.play();
}

void gameOverClicks() {
  if (mouseX>225&&mouseX<375&&mouseY>550&&mouseY<660) {
    player1.x=width/2;
    player1.y=height/2;
    mode=GAME;
    player1.lives=10;
    score=0;
  }

  if (mouseX>425&&mouseX<575&&mouseY>550&&mouseY<660) {
    exit();
  }
}
