class Player{
  int x = 50;
  int y = 400;
  float target;
  int _width = 50;
  int _height = 100;
  PImage pleft;
  PImage pjump;
  PImage pright;
  PImage pdie;
  boolean fly = false;
  boolean fall = false;
  boolean die = false;
  int initY;
  int stepCnt = 0;
  boolean left = false;
  float jumpTime;
  float fallSpeed = 70;
  float veloc = 50;
  Player(){
    pleft = loadImage("./dinoLeft.png");
    pright = loadImage("./dinoRight.png");
    pjump = loadImage("./dinoJump_V2.png");
    pdie = loadImage("./dinoDie_V2.png");
    _height = pleft.height;
    _width = pleft.width;
    y = 500-_height;
    initY = y;
  }
  void update(){
    if(die){
      push();
      image(pdie,x,y);
      pop();
      return;  
    }
    jump();
    push();
    if(!fly&&!fall){
      if(stepCnt%5==0){
        left = !left;
      }
      if(!left){
        image(pright,x,y);   
      }
      else{
        image(pleft,x,y);  
      }
      stepCnt++;
    }
    else{
      image(pjump,x,y);  
    }
    pop();
  }
  void jump(){
    float time = millis();
    //println(y,initY);
    if(fly && y == initY){
        jumpTime = time-0.1;
    }
    if(fly){
      //println("jumpT = ",jumpTime);
      //println("time = ",time);
      //println("fallSpeed = ",fallSpeed);
      
      y = (int)(initY - veloc*(time-jumpTime)/fallSpeed + 0.5*9.8*pow((time-jumpTime)/fallSpeed,2));
    }
    if(y>initY){
      y = initY;
      fly = false;
    }
  }
  void keyEvent(int key,int time){
    if(time<10){
      time = 1;  
    }
    else{
      time = 2;  
    }
    if(!fly && (key == ' '||keyCode == UP)){
      fly = true;
    }
  }
  void Die(){
    die = true;
  }
  void resurrection(){
    x = 50;
    y = initY;
    fly = false;
    fall = false;
    die = false;
    stepCnt = 0;
  }
}
