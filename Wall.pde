class Wall{
  float x;
  float y;
  float w;
  float h;
  
  
  
  
  Wall(float x,float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    
  }
  
  void display(){
    fill(255);
    noStroke();
    rectMode(CORNERS);
    rect(x,y,w,h); // boundary
    
  }
}
