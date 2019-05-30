class Block1_1 extends Wall{
  Block1_1(float x,float y, float w, float h){
    super(x,y,w,h);
  }
  
  void display(){
    super.display();
    
    for(int i=300; i<=650; i+=50) { image(brick[0],i,300); }
    for(int i=350; i<=600; i+=50) { image(brick[0],300,i); }
    for(int i=300; i<=650; i+=50) { image(brick[0],i,650); }
    image(brick[0],450,350);
    for(int i=400; i<=450; i+=50) { image(brick[0],i,450); }
    for(int i=350; i<=400; i+=50) { image(brick[0],i,500); }
    image(brick[0],400,550);
    for(int i=350; i<=400; i+=50) { image(brick[0],550,i); }
    for(int i=550; i<=600; i+=50) { image(brick[0],i,500); }
    image(brick[0],550,600);
    for(int i=400; i<=500; i+=50) { image(brick[0],650,i); }
    image(brick[0],650,600);
  }
}
