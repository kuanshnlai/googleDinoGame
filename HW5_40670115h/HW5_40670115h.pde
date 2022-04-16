Background bg;
ArrayList<Catus> catuses = new ArrayList<Catus>();
Player p;
int start = 0;
boolean flag = false;
int freq = 200;
PFont font;
boolean addDifficulty = false;
void setup(){
  size(1280,800);
  background(#ffffff);
  bg = new Background();
  p = new Player();
  font = createFont("DotMatrix-TwoExtended.ttf",24);
}
void draw(){
  
  bg.update();
  p.update();
  if(frameCount%freq == 0){
      catuses.add(new Catus(((int)random(100)%3 + 1)));
  }
  for(int i=0;i<catuses.size();++i){
    catuses.get(i).update();
    if(catuses.get(i).hit(p)){
      p.Die();
    }
    if(p.die){
      catuses.get(i).pause();  
    }
    if(catuses.get(i).x <= -catuses.get(i)._width){
      catuses.remove(i);  
      //println("remove",i,"catuses");
    }
  }
  if(p.die && !bg.restart){
    bg.show();  
  }
  if(p.die&&bg.restart){
      bg.restart = false;
      p.resurrection();
      catuses.clear();
      BGSpeed.speed = 5;
  }
  if(bg.score>0 && bg.score%100 == 0&&!addDifficulty){
    freq-=25;
    freq = max(freq,50);
    BGSpeed.addSpeed();
    addDifficulty = true;
  }
  else if(bg.score%100!=0){
    addDifficulty = false;  
  }
}
void keyPressed(){
  if(key == ' ' && !flag){
    flag = true;
    start = frameCount;
  }
}
void keyReleased(){
  if(key ==' ' || keyCode == UP){
    p.keyEvent(key,frameCount-start);
    flag = false;
  }
}
void mousePressed(){
  bg.mouseEvent();
}
