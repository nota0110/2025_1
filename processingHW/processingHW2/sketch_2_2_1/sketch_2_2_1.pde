void setup(){//정지 모드에서 
  size(1000, 800);//사이즈 지정하고 
  background(180,220,180);}//배경을 갱신하지 않도록 셋업에서 백그라운드를 지정 
float x,y=0;//x,y를 0으로 초기화 
float unit = 5;//기준 눈금 5픽셀 
void draw(){
  x += 5*unit;//오른쪽으로 5눈금 움직이고 
  if(x>width){y+=5*unit;x=0;}//아래로 5눈금 움직이고 다시 왼쪽 끝으로 돌아온다 
  drawGrass(x,y,unit);//새싹을 그린다! 
}
