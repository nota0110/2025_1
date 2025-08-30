int nPlant = 100;
float[] xp = new float[nPlant];
float[] yp = new float[nPlant];
int unit = 5;
float xd, yd;
void setup(){
  size(600,800);
  for(int i = 0; i<xp.length; i++){
    xp[i] = random(2*unit, width-2*unit);
    yp[i] = random(2*unit, height-2*unit);
  }
  xd = random(10*unit, width-10*unit);
  yd = random(10*unit, height-10*unit);
}

void draw(){
  background(180,220,180);
  for(int i = 0; i<xp.length; i++){
    drawGrass(xp[i], yp[i], unit);
    textSize(20);
    fill(0);
    text(i, xp[i], yp[i]);}
    
  drawDog(xd, yd, unit);
}
