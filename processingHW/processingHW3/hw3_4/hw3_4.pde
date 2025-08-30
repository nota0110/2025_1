int nPlant = 100;
float[] xp = new float[nPlant];
float[] yp = new float[nPlant];
boolean [] pv = new boolean[nPlant];
int unit;
int count;
float xd, yd, xd_dir, yd_dir;
float bg_r = 180;
float bg_g = 220;
float bg_b = 180;
int kingIndex;
boolean textCatch;
int catchStartTime;

void setup(){
  unit = 5;
  count = 0;
  xd_dir = -1;
  yd_dir = 1;
  size(600,800);
  for(int i = 0; i<xp.length; i++){
    xp[i] = random(2*unit, width-2*unit);
    yp[i] = random(2*unit, height-2*unit);
    pv[i] = true;
  }
  xd = random(10*unit, width-10*unit);
  yd = random(10*unit, height-10*unit);
  kingIndex = int(random(0,100)/1);
  textCatch = false;
  catchStartTime = -1;
}
void resetGame(){
  count = 0;
  xd_dir = -1;
  yd_dir = 1;
  for(int i = 0; i<xp.length; i++){
    xp[i] = random(2*unit, width-2*unit);
    yp[i] = random(2*unit, height-2*unit);
    pv[i] = true;
  }
  xd = random(10*unit, width-10*unit);
  yd = random(10*unit, height-10*unit);
  kingIndex = int(random(0,100)/1);
  textCatch = false;
  catchStartTime = -1;
}
void draw(){
  background(bg_r,bg_g,bg_b);
  //if(count%10 ==0 && count != recentChange){changeBg = true;}
  for(int i = 0; i<xp.length; i++){
    float distance = dist(xp[i], yp[i], xd-8*unit, yd-5*unit);
    if(i==kingIndex){
      drawGrass(xp[i], yp[i], unit*2);
      fill(0);
      textSize(40);
      text(i, xp[i], yp[i]);
      
      
        //잡혀있는 프레임에서 시간 계산하고, 3초 지났으면 풀어주고 초기화 
      if (textCatch && millis()-catchStartTime > 3000){
        textCatch = false;
        resetGame();
        return;
    }
    
    
      //잡혀있으면 멈추고 텍스트 출력 
      if(textCatch){
        fill(150, 150, 150);
        text("Catch!", xd+5*unit, yd-3*unit);
        xd_dir = 0;
        yd_dir = 0;
      }
        
        
        //처음 충돌했을 때 잡힘을 참으로, 이벤트 발생 시각 기록 
      if (distance<7*unit && !textCatch){
        textCatch = true;
        catchStartTime = millis();
      }
    }else{
      
      if(distance<3*unit){
        if(pv[i]){count+=1;}
        pv[i] = false;
      }
      if(pv[i]){
        drawGrass(xp[i], yp[i], unit);
        textSize(20);
        fill(0);
        text(i, xp[i], yp[i]);
      }
      fill(255, 150, 150);
      textSize(30);
      //text(count,width/2, height/2);
    }
  }
    
  drawDog(xd, yd, unit);
  if (xd<-10*unit){xd = width+10*unit;}
  xd += 2*xd_dir;
  if (yd <8*unit || yd>height-8*unit){yd_dir *= -1;}
  yd += 3*yd_dir;
}
