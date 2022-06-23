import ddf.minim.*; //<>//
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//color 
color black=#171717;
color white=#FFFFFF;
color blue=#127EFF;
color yellow=#FFE812;
color brown=#986300;
color purple=#C252FF;
color green=#59F562;
color red=#FF6355;

//constants
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;
final int OPTION=4;

int timer;

//keyboard 
boolean up, down, right, left, space; 
boolean scircle, sstraight;

//image
PImage spaceship;

//font
PFont font1;

int score, highScore;

ArrayList<GameObject> object;
ArrayList<GameObject> gameover;
StarFighter player1;

Minim minim;
AudioPlayer coin, bump, dead, theme;

void setup() {
  size(800, 800);

  score=0;
  highScore=0;

  mode=INTRO;
  rectMode(CENTER);

  spaceship=loadImage("spaceship.png");
  font1=createFont("1up.ttf", 20);

  object=new ArrayList<GameObject> ();
  gameover=new ArrayList<GameObject>();
  player1=new StarFighter();

  background(0);

  star=new ArrayList<Star>();

  for (int i=0; i<n; i++) {
    star.add(new Star());
  }

  minim = new Minim(this);
  coin = minim.loadFile("coin copy.wav");
  bump = minim.loadFile("bump copy.wav");
  dead = minim.loadFile("gameover copy.wav");
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==GAMEOVER) {
    gameOver();
  } else if (mode==OPTION) {
    option();
  }
}
