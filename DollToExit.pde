PImage[] bg = new PImage[3];
PImage[] doll = new PImage[3];
PImage[] brick = new PImage[5];
PImage leg,hand,fire;



void setup(){
  size(1000,1000);
  
  // load bg
  for(int i=0; i<bg.length; i++) { bg[i] = loadImage("img/bg"+i+".jpeg"); }
  // load doll
  for(int i=0; i<doll.length; i++) { doll[i] = loadImage("img/doll"+i+".png"); }
  // load brick
  for(int i=0; i< brick.length; i++) { brick[i] = loadImage("img/brick"+i+"jpeg"); }
  // load other
  leg = loadImage("img/leg.png");
  hand = loadImage("img/hand.png");
  fire = loadImage("img/fire.png");
}

void draw(){
}
