void option() {
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
  
  circle (100, 100, 100);
  circle (250, 100, 100);
  
  stroke(red);
  strokeWeight(3);
  
  fill(white);
  if(scircle&&!sstraight){
    circle(250, 100, 100);
  }else if(!scircle && sstraight){
    circle(100, 100, 100);
  }
  
  fill(black);
  textSize(15);
  text("straight", 100, 100);
  text("curved", 250, 100);
  
  for (int i=0; i<object.size(); i++) {
    GameObject temp=object.get(i);
    temp.act();
    temp.show();
  }

  player1.y=height/2+200;
  player1.show();
  player1.act();

  noFill();
  stroke(white);
  rect(width-250, height-100, 250, 75);
  fill(white);
  text("continue...", width-250, height-100);
}

void optionClicks() {
  if (mouseX>width-375 && mouseX<width-125 && mouseY<height-60&& mouseY>height-140) {
    mode=GAME;
  }
  
  if (dist(mouseX, mouseY, 100, 100)<50){
    sstraight=true;
    scircle=false;
  }
  
  if (dist(mouseX, mouseY, 250, 100)<50){
    scircle=true;
    sstraight=false;
  }
}
