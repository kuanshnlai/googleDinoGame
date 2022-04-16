class Background{
  int base = 500;
  PImage ground;
  PImage restartImg;
  PImage cloud;
  boolean show = false;
  PFont font;
  boolean restart = false;
  int score = 0;
  int highScore = 0;
  int x = 0;
  float y1,y2,y3,y4;
  Background(){
     restartImg = loadImage("die.png");
     cloud = loadImage("cloud.png");
     font = createFont("DotMatrix-TwoExtended.ttf",24);
  }
  void update(){
    push();
    fill(#000000);
    background(#ffffff);
    if(x>=width+900){
      x=x%(width+900);
      y1 = random(50,250);
      y2 = random(50,250);
      y3 = random(50,250);
      y4 = random(50,250);
    }
    x+=BGSpeed.speed;
    image(cloud,width-x,y1);
    image(cloud,width+200-x,y2);
    image(cloud,width+600-x,y3);
    image(cloud,width+900-x,y4);
    
    
    line(0,base,width,base);
    if(!show){
      if(frameCount%6== 0){
        score++;  
        highScore = max(score,highScore);
      }
    }
    if(show){
      textAlign(CENTER);
      textFont(font,40);
      text("G A M E O V E R",width/2,500/2 + restartImg.height+20);
      imageMode(CENTER);
      image(restartImg,width/2,500/2);  
    }
    textAlign(TOP,LEFT);
    textFont(font,20);
    text("Score : "+score,1000,50);
    text("High Score : "+highScore,1000,100);
    text("Speed : "+BGSpeed.speed(),1000,150);
    pop();
  }
  void mouseEvent(){
    if(show){
      if(width/2-restartImg.width/2<= mouseX && 
      mouseX <= width/2+restartImg.width/2 && 
      mouseY<= 250 + restartImg.height/2 && 
      250 - restartImg.height/2 <= mouseY)
      {
        show = false; 
        restart = true;
        highScore = max(score,highScore);
        score = 0;
        update();
        x = 0;
      }
    }
  }
  void show(){
    if(!show){
      show = true;  
    }
  }
}
static class BGSpeed{
  static int speed = 5;
  static int speed(){
    return speed;
  }
  static void addSpeed(){
    speed++;  
  }
}
class Catus{
  PImage catus;
  int _width;
  int _height;
  int x;
  int y;
  int speed;
  Catus(){
    catus = loadImage("./Tree1.png");
    x = width+50;
    y = 500 - catus.height;
    _width = catus.width;
    _height = catus.height;
    speed = BGSpeed.speed();
  }
  Catus(int type){
    switch(type){
      case 1:
        catus = loadImage("./Tree1.png");
        break;
      case 2:
        catus = loadImage("./Tree2.png");
        break;
      case 3:
        catus = loadImage("./Tree3.png");
        break;
      default:
        println("type must be 1~3 but type = ",type);
        break;
    }
    x = width+50;
    y = 500 - catus.height;
    _width = catus.width;
    _height = catus.height;
    speed = BGSpeed.speed();
  }
  void update(){
    speed = BGSpeed.speed();
    x-=speed;
    push();
    image(catus,x,y);
    pop();
  }
  boolean hit(Player p){
    if(((x<=p.x && p.x<=x+_width)||(x<=p.x+p._width && p.x+p._width <= x+_width))&&((p.y >= y && p.y<=y+_height)||(p.y+p._height>=y&&p.y+p._height<=y+_height))){
      //println("hit");
      return true;  
    }
    return false;  
  }
  void pause(){
    BGSpeed.speed = 0;
  }
}
