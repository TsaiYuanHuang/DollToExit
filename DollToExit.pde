Doll doll;
Wall[] wall;

PImage[] brick = new PImage[5];
PImage fire;

boolean leftState = false;
boolean rightState = false;
boolean downState = true;

final int BRICK_SIZE = 50;

void setup(){
  size(1000,1000);
  
  for(int i=0; i< brick.length; i++) { brick[i] = loadImage("img/brick"+i+".jpeg"); }
  fire = loadImage("img/fire.png");
  block_map1_1();
  fire_map1_1();
  doll_map1();
}

void draw(){
  background(0);
  
  for(int i=0; i<12; i++){wall[i].display();}
  
  doll.display();
  doll.move(wall);

}

void keyPressed(){
    if(keyCode == LEFT) {leftState = true;}  
    if(keyCode == RIGHT) {rightState = true;}
    if(key == ' ') {downState = !downState;}
}

void keyReleased(){
    if(keyCode == LEFT) {leftState = false;} 
    if(keyCode == RIGHT) {rightState = false;}
}
 
 
        
//map1_1        
void block_map1_1(){
  wall = new Block1_1[12];
  wall[0] = new Block1_1(300,300,700,350);
  wall[1] = new Block1_1(300,350,350,650);
  wall[2] = new Block1_1(300,650,700,700);
  wall[3] = new Block1_1(450,350,500,400);
  wall[4] = new Block1_1(400,450,500,500);
  wall[5] = new Block1_1(350,500,450,550);
  wall[6] = new Block1_1(400,550,450,600);
  wall[7] = new Block1_1(550,350,600,450);
  wall[8] = new Block1_1(550,500,650,550);
  wall[9] = new Block1_1(550,600,600,650);
  wall[10] = new Block1_1(650,400,700,550);
  wall[11] = new Block1_1(650,600,700,650);
}

void fire_map1_1(){
  wall = new Fire[3];
  wall[0] = new Fire(350,350,400,400);
  wall[1] = new Fire(450,550,500,600);
  wall[2] = new Fire(650,550,700,600);
}

void doll_map1(){
  doll = new Doll(370,600);
}

//map1_2


//map2_1

//map2_2

//map3_1

//map3_2
