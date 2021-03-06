PImage[] bg = new PImage[3];
PImage[] doll = new PImage[3];
PImage[] brick = new PImage[5];
PImage leg,hand,fire;

PFont font;

Doll player;


int[][] brickHealth = new int [16][16];
boolean[][] walked = new boolean [16][16];

/*
health
1:block
2:fast
3:open
4:door
5:exit
6:fire
7:hand
8:leg
*/
int limbNum; 

final int BRICK_COL_COUNT = 16;
final int BRICK_ROW_COUNT = 16;
final int BRICK_SIZE = 50;

float dollX, dollY;
float dollSize = 4*BRICK_SIZE/5;
float xSpeed = 3;
float ySpeed = 5;
boolean leftState = false;
boolean rightState = false;
boolean downState = true;

final int GAME_START = 0;
final int GAME_PR_1 = 1, GAME_RUN_1 = 2;
final int GAME_PR_2 = 3, GAME_RUN_2 = 4;
final int GAME_PR_3 = 5, GAME_RUN_3 = 6;
final int GAME_LOSE = 7, GAME_WIN = 8;

int gameState = 1;
boolean mapDecide = false; // decide which map to choose in the very beginning of the run
int mapNum; 

float dollHealth = 200;
final float DOLLHEALTH_INIT_LENGTH = 200;

void setup(){
  size(1000,1000);
  
  // load bg
  for(int i=0; i<bg.length; i++) { bg[i] = loadImage("img/bg"+i+".jpeg"); }
  // load doll
  for(int i=0; i<doll.length; i++) { doll[i] = loadImage("img/doll"+i+".png"); }
  // load brick
  for(int i=0; i< brick.length; i++) { brick[i] = loadImage("img/brick"+i+".jpeg"); }
  // load other
  leg = loadImage("img/leg.png");
  hand = loadImage("img/hand.png");
  fire = loadImage("img/fire.png");
  
  
}
  
  




void draw(){
  switch(gameState){
    case GAME_START:
    break;
    
    case GAME_PR_1:
      if(mousePressed){
        mapDecide = false; // decide run1 map
        limbNum = 4; // initialize limb number
        // init movestate
        leftState = false;
        rightState = false;
        downState = true;
        // init walked
        for(int i=0; i<walked.length; i++){
          for(int j=0; j<walked.length; j++){
            walked[i][j] = false;
         }
        }
        gameState = GAME_RUN_1;// change state
      }
    break;
    
    case GAME_RUN_1:
    
      background(0);
      
      pushMatrix();
      translate(100,100);
      image(bg[0],0,0);
      fill(0,0,0,70);
      rect(0,0,width,height);
     
      // decide map
      if( mapDecide == false ){
        // init player
        dollX = 5*BRICK_SIZE;
        dollY = 9*BRICK_SIZE;
        player = new Doll(dollX,dollY);
        
        // choose map
        int count1 = floor(random(2));
        if(count1 == 1){
          run1_1();
          mapNum = 1;
        }else{
          run1_2();
          mapNum = 2;
        }
        mapDecide = !mapDecide;
      }
      
      
      // game run
    if( mapDecide ){  
        if( mapNum == 1 ){
            limb1_1();
            exit1();
        }

        if( mapNum == 2 ){
            limb1_2();
            exit1();
        }

        // draw brick images 
        drawImage();
        
        // player
        player.display();
        player.move();
        player.changeGamestate();

    }
    popMatrix();
      
    if(key =='b'){
      gameState =  GAME_PR_2;
    }
      
    break;
    
    case GAME_PR_2:
        // decide run1 map
        mapDecide = false;
        // initialize limb number
        limbNum = 6;
        // init movestate
        leftState = false;
        rightState = false;
        downState = true;
        // init walked
        for(int i=0; i<walked.length; i++){
          for(int j=0; j<walked.length; j++){
            walked[i][j] = false;
         }
        }
        
        // change state
        gameState = GAME_RUN_2;
    break;
    
    case GAME_RUN_2:
      background(0);
      
      pushMatrix();
      translate(100,100);
      image(bg[1],0,0);
      fill(0,0,0,70);
      rect(0,0,width,height);
     
      // decide map
      if( mapDecide == false ){
        // init player
        dollX = 3*BRICK_SIZE;
        dollY = 12*BRICK_SIZE;
        player = new Doll(dollX,dollY);
        
        // choose map
        int count1 = floor(random(2));
        if(count1 == 1){
          run2_1();
          mapNum = 1;
        }else{
          run2_2();
          mapNum = 2;
        }
        mapDecide = !mapDecide;
      }
      
      // game run
      
      if( mapDecide == true){
        
        if( mapNum == 1 ){
          limb2_1();
          exit2();
          open2_1();
          door2_1();
        }

        if( mapNum == 2 ){ 
          limb2_2();
          exit2();
          open2_2();
          door2_2();
        }

        
        // draw images
        drawImage();
        
        // draw doll
        player.display();
        player.move();
        player.changeGamestate();
      }
      
      popMatrix();
      
      
    break;
    
    case GAME_PR_3:
        // decide run1 map
        mapDecide = false;
        // initialize limb number
        limbNum = 8;
        // init movestate
        leftState = false;
        rightState = false;
        downState = true;
        // init walked
        for(int i=0; i<walked.length; i++){
          for(int j=0; j<walked.length; j++){
            walked[i][j] = false;
         }
        }
        // change state
        gameState = GAME_RUN_3;
      
    break;
    
    case GAME_RUN_3:
      background(0);
      
      pushMatrix();
      translate(100,100);
      image(bg[2],0,0);
      fill(0,0,0,100);
      rect(0,0,width,height);
     
      // decide map
      if( mapDecide == false ){
        dollX = 1*BRICK_SIZE;
        dollY = 14*BRICK_SIZE;
        player = new Doll(dollX,dollY);
        
        // choose map
        int count1 = floor(random(2));
        if(count1 == 1){
          run3_1();
          mapNum = 1;
        }else{
          run3_2();
          mapNum = 2;
        }
        mapDecide = !mapDecide;
      }
      
      // game run
      
      if( mapDecide == true){
        
        if( mapNum == 1 ){
          limb3_1();
          exit3();
          open3_1();
          door3_1();
        }

        if( mapNum == 2 ){
          limb3_2();
          exit3();
          open3_2();
          door3_2();
        }

        // draw images
        drawImage();
        
        // draw doll
        player.display();
        player.move();
        player.changeGamestate();
      }
      
      popMatrix();
  
    break;
    
    case GAME_LOSE:
    break;
    
    case GAME_WIN:
    break;
  }
}



// maps
// map1
void run1_1(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1: normal
        if(j==4 || j==11) {if(i>=4 && i<12) brickHealth[i][j] = 1;}
        if(i==4) {if(j>=4 && j<12) brickHealth[i][j] = 1;}
        if(i==11) {if(j==4 || (j>=6 &&  j<12)) brickHealth[i][j] = 1;}
        if(i==5 && j==5) brickHealth[i][j] = 1;
        if(i==6) {if(j==7 || j==8 || j==9) brickHealth[i][j] = 1;}
        if(i==7) {if(j==5 || j==7) brickHealth[i][j] = 1; }
        if(i==9) {if(j==5 || j==6 || j==8 || j==10) brickHealth[i][j] = 1;}
        if(i==10 && j==8) brickHealth[i][j] = 1;

        
        // health 6: fire
        if(i==5 && j==5) brickHealth[i][j] = 6;
        if(i==7 && j==9) brickHealth[i][j] = 6;
        if(i==11 && j==9) brickHealth[i][j] = 6;

      }
    }
}

void run1_2(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1: normal
        if(j==4 || j==11) {if(i>=4 && i<12) brickHealth[i][j] = 1;}
        if(i==4) {if(j>=4 && j<12) brickHealth[i][j] = 1;}
        if(i==11) {if(j==4 || (j>=6 &&  j<12)) brickHealth[i][j] = 1;}
        if(i==5 && j==7) brickHealth[i][j] = 1;
        if(i==6) {if(j==5 || j==7 || j==9 || j==10) brickHealth[i][j] = 1;}
        if(i==8) {if(j==8 || j==10) brickHealth[i][j] = 1;}
        if(i==9) {if(j==6 || j==7 || j==8) brickHealth[i][j] = 1;}
        if(i==10 && j==7) brickHealth[i][j] = 1;
        if(i==10 && j==10) brickHealth[i][j] = 1;

        // health 6: fire
        if(i==4 && j==6) brickHealth[i][j] = 6;
        if(i==8 && j==6) brickHealth[i][j] = 6;
        
        
      }
    }
  
}

void exit1(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++) {
      if(limbNum <=0) {
        brickHealth[11][5] = 0;
        continue;
      }else{
      if(i==11 && j==5) brickHealth[i][j] = 5;
      }
      
    }
  }
}


void limb1_1(){
  for(int i=0; i<brickHealth.length; i++){
              for(int j=0; j<brickHealth.length; j++){
                
                if(walked[i][j]){
                  brickHealth[i][j] = 0;
                  
                  continue;
                }
                if(i==5 && j==7) brickHealth[i][j] = 7;
                if(i==6 && j==5) brickHealth[i][j] = 7;
                if(i==10){if(j==5 || j==10) brickHealth[i][j] = 7;}
              }
              
  }
}

void limb1_2(){
  for(int i=0; i<brickHealth.length; i++){
              for(int j=0; j<brickHealth.length; j++){
                
                if(walked[i][j]){
                  brickHealth[i][j] = 0;      
                  
                  continue;
                }
                if(i==5 && j==5) brickHealth[i][j] = 7;
                if(i==9 && j==10) brickHealth[i][j] = 7;
                if(i==10){if(j==6 || j==8) brickHealth[i][j] = 7;}
              }
              
            }
}




// map2
void run2_1(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1: normal
        if(i==2 || i==13) {if(j>=2 && j<14) brickHealth[i][j] = 1;}
        if(j==2 || j==13) {if(i>=2 && i<14) brickHealth[i][j] = 1;}
        if(i==3) {if(j==7 || j==11) brickHealth[i][j] = 1;}
        if(i==4) {if(j==3 || j==4 || j==6 || j==7) brickHealth[i][j] = 1;}
        if(i==5) {if(j==10 || j==11 || j==12) brickHealth[i][j] = 1;}
        if(i==6) {if(j==5 || j==7 || j==11) brickHealth[i][j] = 1;}
        if(i==7) {if(j==4 || j==5 || j==7 || j==8 || j==10) brickHealth[i][j] = 1;} 
        if(i==8) {if(j==9 || j==10) brickHealth[i][j] = 1;}
        if(i==9) {if(j==4 || j==5 || j==6) brickHealth[i][j] = 1;}
        if(i==10) {if(j==4 || j==9 || j==10 || j==11 || j==12) brickHealth[i][j] = 1;}
        if(i==11) {if(j==4 || j==9 || j==10) brickHealth[i][j] = 1;}
        if(i==12) {if(j==4 || j==7) brickHealth[i][j] = 1;}
 
        // health 2: fast
        if(j==2) {if(i==8 || i==9) brickHealth[i][j] = 2;}
        if(j==7) {if(i==9 || i==10) brickHealth[i][j] = 2;}
        if(j==9) {if(i==4 || i==5) brickHealth[i][j] = 2;}
        
        // health 6: fire
        if(i==8 && j==13) brickHealth[i][j] = 6;
        if(j==2) {if(i==10 || i==12) brickHealth[i][j] = 6;}
        
      }
    }
}

void run2_2(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;  
        
        // health 1: normal
        if(i==2 || i==13) {if(j>=2 && j<14) brickHealth[i][j] = 1;}
        if(j==2) {if(i>=2 && i<7) brickHealth[i][j] = 1;}
        if(j==2) {if(i>=8 && i<14) brickHealth[i][j] = 1;}
        if(j==13) {if(i>=2 && i<14) brickHealth[i][j] = 1;}
        if(i==3) {if(j==8 || j==11) brickHealth[i][j] = 1;}
        if(i==4) {if(j==5 || j==6 || j==11) brickHealth[i][j] = 1;}
        if(i==5) {if(j==3 || j==4 || j==5 || j==6) brickHealth[i][j] = 1;}
        if(i==6) {if(j==9 || j==10) brickHealth[i][j] = 1;}
        if(i==7) {if(j==5 || j==6) brickHealth[i][j] = 1;} 
        if(i==8) {if(j==5 || j==7 || j==8 || j==10 || j==11) brickHealth[i][j] = 1;}
        if(i==9) {if(j==4 || j==8 || j==10) brickHealth[i][j] = 1;}
        if(i==10) {if(j==4 || j==5 || j==12) brickHealth[i][j] = 1;}
        if(i==11) {if(j==8 || j==9 || j==11 || j==12) brickHealth[i][j] = 1;}
        if(i==12 && j==4) brickHealth[i][j] = 1;
 
        // health 2: fast
        if(j==6) {if(i==10 || i==11) brickHealth[i][j] = 2;}
        if(j==8) {if(i==5 || i==6) brickHealth[i][j] = 2;}
        if(j==13) {if(i==6 || i==7) brickHealth[i][j] = 2;}
        

        // health 6: fire
        
        if(i==7 && j==2) brickHealth[i][j] = 6;
        if(i==10 && j==3) brickHealth[i][j] = 6;
        if(i==12 && j==8) brickHealth[i][j] = 6;
        if(j==11) {if(i==5 || i==6) brickHealth[i][j] = 6;}
        
      }
    }
}

void exit2(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++) {
      if(limbNum <=0) {
        brickHealth[13][3] = 0;
        continue;
      }else{
      if(i==13 && j==3) brickHealth[i][j] = 5;
      }
    }
  }
}

void open2_1(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(walked[i][j]){
        brickHealth[i][j] = 0;
        continue;
      }
      if(i==3 && j==3) brickHealth[i][j] = 3;
    }
  }
}

void door2_1(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(brickHealth[3][3] == 0){
        brickHealth[11][7] = 0;
      }
      if(i==11 && j==7) brickHealth[i][j] = 4;
    }
  }
}

void open2_2(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(walked[i][j]){
        brickHealth[i][j] = 0;
        continue;
      }
      if(i==12 && j==12) brickHealth[i][j] = 3;
    }
  }
}

void door2_2(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(brickHealth[12][12] == 0){
        brickHealth[4][8] = 0;
      }
      if(i==4 && j==8) brickHealth[i][j] = 4;
    }
  }
}

void limb2_1(){
  for(int i=0; i<brickHealth.length; i++){
              for(int j=0; j<brickHealth.length; j++){
                if(walked[i][j]){
                  brickHealth[i][j] = 0;
                  
                  continue;
                }
                if(i==3 && j==10) brickHealth[i][j] = 8;
                if(i==6) {if(j==4 || j==12) brickHealth[i][j] = 8;}
                if(i==7 && j==9) brickHealth[i][j] = 8;
                if(i==11) {if(j==5 || j==11) brickHealth[i][j] = 8;}
              }
            }
}

void limb2_2(){
  for(int i=0; i<brickHealth.length; i++){
              for(int j=0; j<brickHealth.length; j++){
                if(walked[i][j]){
                  brickHealth[i][j] = 0;
                  
                  continue;
                }
                if(i==4) {if(j==4 || j==10) brickHealth[i][j] = 8;}
                if(i==8 && j==6) brickHealth[i][j] = 8;
                if(i==9) {if(j==3 || j==11) brickHealth[i][j] = 8;}
                if(i==12 && j==5) brickHealth[i][j] = 8;
              }
            }
}



// map3
void run3_1(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1: normal
        if(i==0 || i==15) {if(j>=0 && j<16) brickHealth[i][j] = 1;}
        if(j==0 || j==15) {if(i>=0 && i<16) brickHealth[i][j] = 1;}
        if(i==1) {if(j==7 || j==11) brickHealth[i][j] = 1;}
        if(i==2) {if(j==2 || j==5 || j==9 || j==11 || j==13) brickHealth[i][j] = 1;}
        if(i==3) {if(j==2 || j==3 || j==7 || j==8 || j==9 || j==10 || j==11 || j==13) brickHealth[i][j] = 1;}
        if(i==4) {if(j==2 || j==6 || j==7 || j==11 || j==13) brickHealth[i][j] = 1;}
        if(i==5) {if(j==4 || j==9 || j==10 || j==11) brickHealth[i][j] = 1;} 
        if(i==6) {if(j==1 || j==3 || j==6 || j==7 || j==8 || j==10) brickHealth[i][j] = 1;}
        if(i==7) {if(j==1 || j==2 || j==3 || j==5 || j==6 || j==8 || j==10 || j==12 || j==14 ) brickHealth[i][j] = 1;}
        if(i==8) {if(j==5 || j==6 || j==7 || j==8 || j==10 || j==12) brickHealth[i][j] = 1;}
        if(i==9) {if(j==3 || j==5 || j==6 || j==10 || j==12 || j==13) brickHealth[i][j] = 1;}
        if(i==10) {if(j==6 || j==7 || j==8) brickHealth[i][j] = 1;}
        if(i==11) {if(j==1 || j==4 || j==8 || j==9 || j==11 || j==12 || j==13) brickHealth[i][j] = 1;}
        if(i==12) {if(j==2 || j==3 || j==5 || j==6 || j==9 || j==10 || j==11) brickHealth[i][j] = 1;}
        if(i==13) {if(j==2 || j==4 || j==6 || j==8 || j==9) brickHealth[i][j] = 1;}
        if(i==14) {if(j==4 || j==11) brickHealth[i][j] = 1;}
 
        // health 2: fast
        if(j==2) {if(i==9 || i==10) brickHealth[i][j] = 2;}
        if(j==4) {if(i==2 || i==3) brickHealth[i][j] = 2;}
        if(j==13) {if(i==13 || i==14) brickHealth[i][j] = 2;}
        if(j==15) {if(i==12 || i==13) brickHealth[i][j] = 2;}
        
        // health 6: fire
        if(i==5) {if(j==1 || j==13) brickHealth[i][j] = 6;}
        if(i==6) {if(j==9 || j==13) brickHealth[i][j] = 6;}
        if(i==11) {if(j==2 || j==15) brickHealth[i][j] = 6;}
        if(i==12 && j==8) brickHealth[i][j] = 6;
      }
    }
}

void run3_2(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1: normal
        if(i==0 || i==15) {if(j>=0 && j<16) brickHealth[i][j] = 1;}
        if(j==0 || j==15) {if(i>=0 && i<16) brickHealth[i][j] = 1;}
        if(i==1) {if(j==4 || j==11) brickHealth[i][j] = 1;}
        if(i==2) {if(j==6 || j==7 || j==9 || j==11 || j==13) brickHealth[i][j] = 1;}
        if(i==3) {if(j==4 || j==5 || j==6 || j==9 || j==10 || j==11 || j==13) brickHealth[i][j] = 1;}
        if(i==4) {if(j==4 || j==6 || j==7 || j==11 || j==14) brickHealth[i][j] = 1;}
        if(i==5) {if(j==7 || j==8 || j==9 || j==13) brickHealth[i][j] = 1;} 
        if(i==6) {if(j==2 || j==3 || j==5 || j==9 || j==10 || j==12 || j==13) brickHealth[i][j] = 1;}
        if(i==7) {if(j==3 || j==5 || j==7 || j==8 || j==9 || j==10) brickHealth[i][j] = 1;}
        if(i==8) {if(j==1 || j==3 || j==5 || j==7 || j==9 || j==12 || j==13 || j==14) brickHealth[i][j] = 1;}
        if(i==9) {if(j==2 || j==5 || j==7 || j==8 || j==9 || j==11 || j==12 || j==14) brickHealth[i][j] = 1;}
        if(i==10) {if(j==2 || j==4 || j==5 || j==6 || j==11) brickHealth[i][j] = 1;}
        if(i==11) {if(j==2 || j==4 || j==8 || j==9 || j==13) brickHealth[i][j] = 1;}
        if(i==12) {if(j==4 || j==5 || j==6 || j==7 || j==8 || j==11 || j==12|| j==13) brickHealth[i][j] = 1;}
        if(i==13) {if(j==6 || j==10 || j==11 || j==13) brickHealth[i][j] = 1;}
        if(i==14) {if(j==4 || j==8) brickHealth[i][j] = 1;}
 
        // health 2: fast
        if(j==0) {if(i==2 || i==3) brickHealth[i][j] = 2;}
        if(j==2) {if(i==1 || i==2 || i==12 || i==13) brickHealth[i][j] = 2;}
        
        // health 6: fire
        if(i==3 && j==7) brickHealth[i][j] = 6;
        if(i==4) {if(j==1 || j==13) brickHealth[i][j] = 6;}
        if(i==9 && j==6) brickHealth[i][j] = 6;
        if(i==10 && j==14) brickHealth[i][j] = 6;
      }
    }
}

void exit3(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++) {
      if(limbNum <= 0){
        brickHealth[15][1] = 0;
        continue;
      }
      if(i==15 && j==1) {
        brickHealth[i][j] = 5;
      }
    }
  }
}

void open3_1(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(walked[i][j]){
        brickHealth[i][j] = 0;
        continue;
      }
      if(i==2 && j==10) brickHealth[i][j] = 3;
    }
  }
}

void door3_1(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(brickHealth[2][10] == 0){
        brickHealth[11][3] = 0;
      }
      if(i==11 && j==3) brickHealth[i][j] = 4;
    }
  }
}

void open3_2(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(walked[i][j]){
        brickHealth[i][j] = 0;
        continue;
      }
      if(i==9 && j==3) brickHealth[i][j] = 3;
    }
  }
}

void door3_2(){
  for(int i=0; i<brickHealth.length; i++){
    for(int j=0; j<brickHealth.length; j++){
      if(brickHealth[9][3] == 0){
        brickHealth[13][4] = 0;
      }
      if(i==13 && j==4) brickHealth[i][j] = 4;
    }
  }
}

void limb3_1(){
  for(int i=0; i<brickHealth.length; i++){
              for(int j=0; j<brickHealth.length; j++){
                  if(walked[i][j]){
                    brickHealth[i][j] = 0;
                    
                    continue;
                  }
                
                
                if(i==4) {if(j==1 || j==10) brickHealth[i][j] = 8;}
                if(i==6) {if(j==2 || j==12 || j==14) brickHealth[i][j] = 7;}
                if(i==7 && j==9) brickHealth[i][j] = 7;
                if(i==9 && j==1) brickHealth[i][j] = 8;
                if(i==14 && j==14) brickHealth[i][j] = 8;
              }
            }
}

void limb3_2(){
  for(int i=0; i<brickHealth.length; i++){
              for(int j=0; j<brickHealth.length; j++){
                  if(walked[i][j]){
                    brickHealth[i][j] = 0;
                    
                    continue;
                  
                }
                
                if(i==1 && j==1) brickHealth[i][j] = 8;
                if(i==6 && j==14) brickHealth[i][j] = 7;
                if(i==8 && j==6) brickHealth[i][j] = 7;
                if(i==9) {if(j==1 || j==13) brickHealth[i][j] = 8;}
                if(i==10 && j==3) brickHealth[i][j] = 8;
                if(i==11) {if(j==5 || j==14) brickHealth[i][j] = 7;}
              }
            }
}



void drawImage(){
  for(int i=0; i<brickHealth.length;i++){
          for(int j=0; j<brickHealth.length;j++){
            if( brickHealth [i][j] == 1 ) image(brick[0], i*BRICK_SIZE, j*BRICK_SIZE);
            if( brickHealth [i][j] == 2 ) image(brick[1], i*BRICK_SIZE, j*BRICK_SIZE);
            if( brickHealth [i][j] == 3 ) image(brick[2], i*BRICK_SIZE, j*BRICK_SIZE);
            if( brickHealth [i][j] == 4 ) image(brick[3], i*BRICK_SIZE, j*BRICK_SIZE);
            if( brickHealth [i][j] == 5 ) image(brick[4], i*BRICK_SIZE, j*BRICK_SIZE);
            if( brickHealth [i][j] == 6 ) image(fire, i*BRICK_SIZE, j*BRICK_SIZE);
            if( brickHealth [i][j] == 7 ) image(hand, i*BRICK_SIZE, j*BRICK_SIZE,BRICK_SIZE,BRICK_SIZE);
            if( brickHealth [i][j] == 8 ) image(leg, i*BRICK_SIZE, j*BRICK_SIZE,BRICK_SIZE,BRICK_SIZE);
          }
        }
}


// move keycode
void keyPressed(){
    if(keyCode == LEFT) {leftState = true;}  
    if(keyCode == RIGHT) {rightState = true;}
    if(key == ' ') {downState = !downState;}
}

void keyReleased(){
    if(keyCode == LEFT) {leftState = false;} 
    if(keyCode == RIGHT) {rightState = false;}
}
