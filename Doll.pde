class Doll{
  
  // properties
  float x;
  float y;
  float xSpeed = 2;
  float ySpeed = 5;
  float size = 3*BRICK_SIZE/5;
  
  int life = 5;
  
  PImage doll[] = new PImage[3];;

  
  // constructor
  Doll(float x, float y){ 
    this.x = x;
    this.y = y;
    xSpeed = 2;
    ySpeed = 5;
    for(int i=0; i<doll.length; i++) { doll[i] = loadImage("img/doll"+i+".png"); }
  }
 
  
  // methods
  void move(){
      moveOnBrick();
      
      int col = (int)x/BRICK_SIZE;
      int row = (int)y/BRICK_SIZE;
      
      walked[col][row] = true;
      for( int i=0; i<walked.length; i++){
        for( int j=0; j<walked.length; j++){
          if(walked[i][j] == true){
            //println(i,j);
          }
        }
      }
      
      
      if(hitFire() == true){
        life -- ;
        if(gameState == 2){
          x = 5*BRICK_SIZE;
          y = 9*BRICK_SIZE;
          
        }
        if(gameState == 4){
          x = 3*BRICK_SIZE;
          y = 12*BRICK_SIZE;
        }
        if(gameState == 6){
          x = 1*BRICK_SIZE;
          y = 14*BRICK_SIZE;
        }
        downState = true;
      }

      openExit();
    
  }
  
  void display(){
    if(gameState == 2){
      pushMatrix();
      if(downState){ 
        scale(1,1);
        image(doll[0],x,y,size,size);
      }
      if(!downState){ 
        scale(1,-1);
        image(doll[0],x,-y-size,size,size);
      }
      popMatrix();
    }
    
     if(gameState == 4){
      pushMatrix();
      if(downState){ 
        scale(1,1);
        image(doll[1],x,y,size,size); 
      }
      if(!downState){ 
        scale(1,-1);
        image(doll[1],x,-y-size,size,size);
      }
      popMatrix();
    }
    
    if(gameState == 6){
      pushMatrix();
      if(downState){ 
        scale(1,1);
        image(doll[2],x,y,size,size); 
      }
      if(!downState){ 
        scale(1,-1);
        image(doll[2],x,-y-size,size,size);
      }
      popMatrix();
    }

  }
  
  void openExit(){
    
    /*if(rightState){
      if(limbNum != 0){
        if(hitDetection(5)){
          xSpeed = 0;
        }
      }else{
        xSpeed = 5;
      }
    }
    if(leftState){
      xSpeed = 5;
    }*/
    //println(limbNum);
    
  }
  
  boolean hitFire(){
    if(hitDetection(6) == true){
      return true;
    }else{
      return false;
    }
  }
  
  boolean hitLimb(){
    if(hitDetection(7) == true || hitDetection(8) == true){
      limbNum--;
      return true;
    }else{
      return false;
    }
  }
  
  
  boolean hitDetection(int num){
    int col = (int)x/BRICK_SIZE;
    int row = (int)y/BRICK_SIZE;
    boolean isHit = false;
    
        // down
        if((brickHealth[col][row+1] == num)){
          if((row+1)*BRICK_SIZE <= y+size){
            isHit = true;
          }
        }
        
        // up
        if((brickHealth[col][row-1] == num)){
          if(row*BRICK_SIZE >= y){
            isHit = true;
          }
        }
        
        // left
        if((brickHealth[col-1][row] == num)){
          if(col*BRICK_SIZE >= x){
            isHit = true;
          }
        }
        
        // right
        if((brickHealth[col+1][row] == num)){
          if((col+1)*BRICK_SIZE <= x+size){
            isHit = true;
          }
        }
    return isHit;
  }
  
  
  
  void moveOnBrick(){

    if(downState){
        
        int col = (int)x/BRICK_SIZE;
        int row = (int)y/BRICK_SIZE;
        
        float currentySpeed = ySpeed;
        float currentxSpeed = xSpeed;
        if(brickHealth[col][row+1] == 1 || brickHealth[col][row+1] == 2){
          if((row+1)*BRICK_SIZE <= y+size){
            currentySpeed = 0;
          }
        }
        if(brickHealth[col-1][row] == 1 || brickHealth[col-1][row] == 2){
          if(col*BRICK_SIZE >= x){
            currentxSpeed = 0;
          }
        }
        if(brickHealth[col+1][row] == 1 || brickHealth[col+1][row] == 2){
          if((col+1)*BRICK_SIZE <= x+size){
            currentxSpeed = 0;
          }
        }
        
        // mid
        if( x%BRICK_SIZE + size > BRICK_SIZE){
          col += 1;
          if(brickHealth[col][row+1] == 1 || brickHealth[col][row+1] == 2){
            if((row+1)*BRICK_SIZE <= y+size){
              currentySpeed = 0;
            }
          }
          if(brickHealth[col-1][row] == 1 || brickHealth[col-1][row] == 2){
            if(col*BRICK_SIZE >= x){
              currentxSpeed = 0;
            }
          }
          if(brickHealth[col+1][row] == 1 || brickHealth[col-1][row] == 2){
            if((col+1)*BRICK_SIZE <= x+size){
              currentxSpeed = 0;
            }
          }
        }
        y+=currentySpeed;
      }
    
    
    
    if(!downState){
        int col = (int)x/BRICK_SIZE;
        int row = (int)y/BRICK_SIZE;
        
        float currentySpeed = ySpeed;
        float currentxSpeed = xSpeed;
        if(brickHealth[col][row-1] == 1 || brickHealth[col][row-1] == 2){
          if(row*BRICK_SIZE >= y){
            currentySpeed = 0;
          }
        }
        if(brickHealth[col-1][row] == 1 || brickHealth[col-1][row] == 2){
          if(col*BRICK_SIZE >= x){
            currentxSpeed = 0;
          }
        }
        if(brickHealth[col+1][row] == 1 || brickHealth[col+1][row] == 2){
          if((col+1)*BRICK_SIZE <= x+size){
            currentxSpeed = 0;
          }
        }
        
        // mid
        if( x%BRICK_SIZE + size > BRICK_SIZE){
          col += 1;
          if(brickHealth[col][row-1] == 1 || brickHealth[col][row-1] == 2){
            if(row*BRICK_SIZE >= y){
              currentySpeed = 0;
            }
          }
          if(brickHealth[col-1][row] == 1 || brickHealth[col-1][row] == 2){
            if(col*BRICK_SIZE >= x){
              currentxSpeed = 0;
            }
          }
          if(brickHealth[col+1][row] == 1 || brickHealth[col+1][row] == 2){
            if((col+1)*BRICK_SIZE <= x+size){
              currentxSpeed = 0;
            }
          }
        }
        y-=currentySpeed;
      }
      
      
      
      if(leftState){
        int col = (int)x/BRICK_SIZE;
        int row = (int)y/BRICK_SIZE;
        
        float currentySpeed = ySpeed;
        float currentxSpeed = xSpeed;
        if(brickHealth[col][row+1] == 2){currentxSpeed *= 2;}
        if(brickHealth[col-1][row] == 1 || brickHealth[col-1][row] == 2){
          if(col*BRICK_SIZE >= x){
            currentxSpeed = 0;
          }
        }
        if(brickHealth[col][row-1] == 1 || brickHealth[col][row-1] == 2){
          if(row*BRICK_SIZE >= y){
            currentySpeed = 0;
          }
        }
        if(brickHealth[col][row+1] == 1 || brickHealth[col][row+1] == 2){
          if((row+1)*BRICK_SIZE <= y+size){
            currentySpeed = 0;
          }
        }
        
        // mid
        if( y%BRICK_SIZE + size > BRICK_SIZE){
          row += 1;
          if(brickHealth[col-1][row] == 1 || brickHealth[col-1][row] == 2){
            if(col*BRICK_SIZE >= x){
              currentxSpeed = 0;
            }
          }
          if(brickHealth[col][row-1] == 1 || brickHealth[col][row-1] == 2){
            if(row*BRICK_SIZE >= y){
              currentySpeed = 0;
            }
          }
          if(brickHealth[col][row+1] == 1 || brickHealth[col][row+1] == 2){
            if((row+1)*BRICK_SIZE <= y+size){
              currentySpeed = 0;
            }
          }
        }
        x-=currentxSpeed;

      }
      
      if(rightState){
        int col = (int)x/BRICK_SIZE;
        int row = (int)y/BRICK_SIZE;
        
        float currentySpeed = ySpeed;
        float currentxSpeed = xSpeed;
        if(brickHealth[col][row+1] == 2){currentxSpeed *= 2;}
        if(brickHealth[col+1][row] == 1 || brickHealth[col+1][row] == 2){
          if((col+1)*BRICK_SIZE <= x+size){
            currentxSpeed = 0;
          }
        }
        if(brickHealth[col][row-1] == 1 || brickHealth[col][row-1] == 2){
          if(row*BRICK_SIZE >= y){
            currentySpeed = 0;
          }
        }
        if(brickHealth[col][row+1] == 1 || brickHealth[col][row+1] == 2){ 
          if((row+1)*BRICK_SIZE <= y+size){
            currentySpeed = 0;
          }
        }
        
        // mid
        if( y%BRICK_SIZE + size > BRICK_SIZE){
          row += 1;
          if(brickHealth[col+1][row] == 1 || brickHealth[col+1][row] == 2){
            if((col+1)*BRICK_SIZE <= x+size){
              currentxSpeed = 0;
            }
          }
          if(brickHealth[col][row-1] == 1 || brickHealth[col][row-1] == 2){
            if(row*BRICK_SIZE >= y){
              currentySpeed = 0;
            }
          }
          if(brickHealth[col][row+1] == 1 || brickHealth[col][row+1] == 2){ 
            if((row+1)*BRICK_SIZE <= y+size){
              currentySpeed = 0;
            }
          }
        }
        
        // fast brick
       if(downState){
          if(brickHealth[col+1][row] != 1 && brickHealth[col+1][row] != 2){
            if(brickHealth[col][row+1] == 2){
              currentxSpeed *= 2;
            }else{
              currentxSpeed = xSpeed;
            }
          }
        }
        if(!downState){
          if(brickHealth[col+1][row] != 1 && brickHealth[col+1][row] != 2){
            if(brickHealth[col][row-1] == 2){
              currentxSpeed *= 2;
            }else{
              currentxSpeed = xSpeed;
            }
          }
        }
          x+=currentxSpeed;
      }
  }
  
}
  
