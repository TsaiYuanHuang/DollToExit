class Doll{
  float x;
  float y;
  boolean downState = true;
  float speed ;
  
  Doll(float x, float y){
    this.x = x;
    this.y = y;
    
  }
  
  void display(){
    fill(255);
    ellipse(x,y,10,10);
  }
  
  void move(Wall[] wall){
    
    float currentSpeed = speed;
    
    boolean isCollide = false;
    
    if( isCollide == false ){
      currentSpeed = speed;
    }
    
    for(int i = 0; i < wall.length; i++){
      if(x+5 > wall[i].x && x-5 < (wall[i].x + wall[i].w) 
      && y+5 > wall[i].y && y-5 < wall[i].y + wall[i].h){
        isCollide = true;  
      }
    }
    if(isCollide){
      currentSpeed = 0;
    }
 
 
    if(downState){ y += currentSpeed; }
    else{ y -= currentSpeed; }

      if (leftState) { 
        x -= currentSpeed;
      }
      if (rightState) { 
        x += currentSpeed;
      } 


    
 
    
    
  }
}
