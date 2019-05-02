PImage[] bg = new PImage[3];
PImage[] doll = new PImage[3];
PImage[] brick = new PImage[5];
PImage leg,hand,fire;

int[][] brickHealth = new int [16][16];
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
int[][] level;
final int BRICK_COL_COUNT = 16;
final int BRICK_ROW_COUNT = 16;
final int BRICK_SIZE = 50;

float[] dollX, dollY;
int dollCol, dollRow;
boolean leftState = false;
boolean rightState = false;
boolean spaceState = false;

final int GAME_START = 0;
final int GAME_PR_1 = 1, GAME_RUN_1 = 2;
final int GAME_PR_2 = 3, GAME_RUN_2 = 4;
final int GAME_PR_3 = 5, GAME_RUN_3 = 6;
final int GAME_LOSE = 7, GAME_WIN = 8;

int gameState = 0;

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
  
  // Initialize doll
  dollX = new float[16];
  dollY = new float[16];
  for(int i=0; i<dollX.length; i++){
    dollCol = (int)(dollX[i] / BRICK_SIZE);
    dollRow = (int)(dollY[i] / BRICK_SIZE);
  }
  

  // Initialize brickHealth
   // run1:brickHealth[4][4];
    // random map
    if(gameState == GAME_RUN_1){
      int count1 = floor(random(2));
      if(count1 == 1){
        run1_1();
      }else{
        run1_2();
      }
    }
    
    
    // run2:brickHealth[2][2];
    if(gameState == GAME_RUN_2){
    int count2 = floor(random(2));
      if(count2 == 1){
        run2_1();
      }else{
        run2_2();
      }
    }

    // run3:brickHealth[0][0];

}



void draw(){
  switch(gameState){
    case GAME_START:
      if(mousePressed){
        gameState = GAME_RUN_1;
      }
    break;
    
    case GAME_PR_1:
    break;
    
    case GAME_RUN_1:
      background(0);
      
      pushMatrix();
      translate(100,100);
      image(bg[0],0,0);
     
      // draw images
      for(int i=0; i<brickHealth.length;i++){
        for(int j=0; j<brickHealth.length;j++){
          if( brickHealth [i][j] == 1 ) image(brick[0], i*BRICK_SIZE, j*BRICK_SIZE);
          //if( brickHealth [i][j] == 2 ) image(brick[1], i*BRICK_SIZE, j*BRICK_SIZE);
          //if( brickHealth [i][j] == 3 ) image(brick[2], i*BRICK_SIZE, j*BRICK_SIZE);
          //if( brickHealth [i][j] == 4 ) image(brick[3], i*BRICK_SIZE, j*BRICK_SIZE);
          if( brickHealth [i][j] == 5 ) image(brick[4], i*BRICK_SIZE, j*BRICK_SIZE);
          if( brickHealth [i][j] == 6 ) image(fire, i*BRICK_SIZE, j*BRICK_SIZE);
          if( brickHealth [i][j] == 7 ) image(hand, i*BRICK_SIZE, j*BRICK_SIZE,BRICK_SIZE,BRICK_SIZE);
        }
      }
      
      popMatrix();
      
      
    break;
    
    case GAME_PR_2:
    break;
    
    case GAME_RUN_2:
      background(0);
      
      pushMatrix();
      translate(100,100);
      image(bg[1],0,0);
      
      popMatrix();
      
    break;
    
    case GAME_PR_3:
    break;
    
    case GAME_RUN_3:
    break;
    
    case GAME_LOSE:
    break;
    
    case GAME_WIN:
    break;
  }
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = true;
      break;
      case RIGHT:
      rightState = true;
      break;
    }
  }
}

void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = false;
      break;
      case RIGHT:
      rightState = false;
      break;
    }
  }
}

void run1_1(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1
        if(i==4 || i==11){
          if(j>=4 && j<12) brickHealth[i][j] = 1;
        }
        if(j==4 || j==11){
          if(i>=4 && i<12) brickHealth[i][j] = 1;
        }
        if(i==5 && j==5) brickHealth[i][j] = 1;
        if(i==6){
          if(j==7 || j==8 || j==9) brickHealth[i][j] = 1;
        }
        if(i==7){
          if(j==5 || j==7) brickHealth[i][j] = 1;
        }
        if(i==9){
          if(j==5 || j==6 || j==8 || j==10) brickHealth[i][j] = 1;
        }
        if(i==10 && j==8) brickHealth[i][j] = 1;
 
        
        // health 5
        if(i==11 && j==5) brickHealth[i][j] = 5;
        
        // health 6
        if(i==5 && j==5) brickHealth[i][j] = 6;
        if(i==7 && j==9) brickHealth[i][j] = 6;
        if(i==11 && j==9) brickHealth[i][j] = 6;
        
        // health 7
        if(i==5 && j==7) brickHealth[i][j] = 7;
        if(i==6 && j==5) brickHealth[i][j] = 7;
        if(i==10){
          if(j==5 || j==10) brickHealth[i][j] = 7;
        }
      }
    }
}

void run1_2(){
  for(int i=0; i<brickHealth.length; i++){
      for(int j=0; j<brickHealth.length; j++){
        brickHealth[i][j] = 0;
        
        // health 1
        if(i==4 || i==11){
          if(j>=4 && j<12) brickHealth[i][j] = 1;
        }
       /* if(j==4 || j==11){
          if(i>=4 && i<12) brickHealth[i][j] = 1;
        }
        if(i==5 && j==5) brickHealth[i][j] = 1;
        if(i==6){
          if(j==7 || j==8 || j==9) brickHealth[i][j] = 1;
        }
        if(i==7){
          if(j==5 || j==7) brickHealth[i][j] = 1;
        }
        if(i==9){
          if(j==5 || j==6 || j==8 || j==10) brickHealth[i][j] = 1;
        }
        if(i==10 && j==8) brickHealth[i][j] = 1;
 
        
        // health 5
        if(i==11 && j==5) brickHealth[i][j] = 5;
        
        // health 6
        if(i==5 && j==5) brickHealth[i][j] = 6;
        if(i==7 && j==9) brickHealth[i][j] = 6;
        if(i==11 && j==9) brickHealth[i][j] = 6;
        
        // health 7
        if(i==5 && j==7) brickHealth[i][j] = 7;
        if(i==6 && j==5) brickHealth[i][j] = 7;
        if(i==10){
          if(j==5 || j==10) brickHealth[i][j] = 7;
        }*/
      }
    }
  
}

void run2_1(){
}

void run2_2(){
}
