void setup(){//정지 모드에서 
  size(1000, 800);//사이즈 지정하고 
  background(180,220,180);}//배경을 갱신하지 않도록 셋업에서 백그라운드를 지정 
float x,y=0;//x,y를 0으로 초기화 
float unit = 5;//기준 눈금 5픽셀 

void draw(){//액티브 모드에서 
  for(;y<height;y+=unit*4){//4눈금 너비의 한 줄마다 
    for(;x<width; x+=unit*5){//5눈금 간격으로 
      drawGrass(x,y,unit);//풀을 그린다
    }
    x=0; //한 줄이 끝나면 다시 왼쪽 끝으로 위치를 지정하고 
    unit +=1;//눈금 자체의 크기를 1픽셀 키
  }
}
