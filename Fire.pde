class Fire extends Wall{
  Fire(float x,float y, float w, float h){
    super(x,y,w,h);
  }
  
  void fire_display(){
    fill(255,0);
    noStroke();
    rectMode(CORNERS);
    rect(x,y,w,h); // boundary
   
    image(fire,350,350);
    image(fire,450,550);
    image(fire,650,550);
    
    
    
    
    }
    
    void chooseMap(int i){
      switch(i){
      case 0:   break;
      case 1:   break;
    }
    }
}
