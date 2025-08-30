int nPlant = 100;
float[] xp = new float[nPlant];
float[] yp = new float[nPlant];
boolean [] pv = new boolean[nPlant];
int unit = 5;
int count = 0;
int recentChange = 0;
float xd, yd, yd_dir = 1;
float bg_r = 180;
float bg_g = 220;
float bg_b = 180;
boolean changeBg = false;
void setup(){
  size(600,800);
  for(int i = 0; i<xp.length; i++){
    xp[i] = random(2*unit, width-2*unit);
    yp[i] = random(2*unit, height-2*unit);
    pv[i] = true;
  }
  xd = random(10*unit, width-10*unit);
  yd = random(10*unit, height-10*unit);
}

void draw(){
  background(bg_r,bg_g,bg_b);
  if(count%10 ==0 && count != recentChange){changeBg = true;}
  if(changeBg){bg_r = random(0,255);bg_g = random(0,255);bg_b= random(0,255);changeBg=false;recentChange = count;}
  for(int i = 0; i<xp.length; i++){
    float distance = dist(xp[i], yp[i], xd-8*unit, yd-5*unit);
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
    text(count,width/2, height/2);
  }
    
  drawDog(xd, yd, unit);
  if (xd<-10*unit){xd = width+10*unit;}
  xd -= 2;
  if (yd <10*unit || yd>height-10*unit){yd_dir *= -1;}
  yd += 3*yd_dir;
}
