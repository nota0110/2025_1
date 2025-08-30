void setup(){//정지 모드에서 
  size(1000, 800);//화면 크기 결정하고 
  xd = width*7/8;//동물 가로 초기 위치 지정 
  yd = height/8;//동물 세로 초기 위치 지정 
}
float xd,yd; //동물위치 선언 
float x,y=0;//자연물 위치 기준점 초기화 

void draw(){
  float unit = 5;//기준 눈금 설정 
  background(180,220,180);//배경 덮어씌우고 
  for(y=0; y<yd; y+=unit*3.5){//3.5눈금 가로줄마다 (동물 위치보다 위쪽의 경우)
    for(x=0;x<width; x+=unit*5){//5눈금 간격으로
      drawGrass(x,y,unit);}//새싹을 그린다
    unit+=1;}//줄이 바뀌면 눈금을 1픽셀 키운다 
  drawDog(xd,yd,10);//동물을 그린다 
  if (xd>-80){xd -= 4;//이때 왼쪽 끝이 아닐 때 왼쪽으로 4픽셀씩 움직이고 
  }else{//아니라면(왼쪽 끝까지 나갔다면) 
    xd = width+80;//오른쪽 화면 밖으로 당겨오고 
    yd += 3.5*unit;}//한 줄 아래로 내린다, 이때 한 줄의 너비는 자연물의 한 줄과 항상 같다 
  if(yd>height){yd = height/8;}//아래쪽 밖으로 나갔다면 다시 위쪽으로 끌어올린다 
  for(; y<height; y+=unit*3.5){//동물보다 아래쪽인 y에서 가로줄마다 
    for(x=0;x<width; x+=unit*5){//5눈금 간격으로 
      drawGrass(x,y,unit);}//새싹을 그린다 
    unit+=1;//줄이 바뀌면 눈금을 1픽셀 키운다 
  }
  
}
