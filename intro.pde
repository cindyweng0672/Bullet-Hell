ArrayList<Star> star;
int n=5;

void intro() {
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
  textFont(font1);
  textSize(50);
  text("Bullet Hell", width/2, height/2);

  //buttons
  noFill();
  stroke(white);
  strokeWeight(5);
  rect(width/2, height/2+200, 250, 100);
  fill(white);
  textSize(30);
  text("Start", width/2, height/2+220);
  
  noFill();
  rect(width/2, height/2+300, 250, 100);
  fill(white);
  textSize(30);
  text("Option", width/2, height/2+320);
  
  
  player1.act();
  player1.show();
}

void introClicks() {
  if (mouseX>width/2-250/2&&mouseX<width/2+250/2&&mouseY>height/2+150&&mouseY<height/2+250) {
    mode=GAME;
  }
  if (mouseX>width/2-250/2&&mouseX<width/2+250/2&&mouseY>height/2+250&&mouseY<height/2+350) {
    mode=OPTION;
  }
}
