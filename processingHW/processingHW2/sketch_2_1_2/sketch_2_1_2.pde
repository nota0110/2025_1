void setup(){//정지 모드에서
  size(1000,800);//화면 크기 결정하고
  centerX = width/2;//가로 절반 좌표와
  centerY = height/2;//세로 절반 좌표를 미리 결정해준다
  x1 = centerX-200; //작은 동물 x좌표 초기값 설정 
  x2 = centerX+300; //큰 동물 x좌표 초기값 설정
  y1 = centerY; //작은 동물 세로 좌표 -중앙 
  y2 = centerY; //큰 동물 세로 좌표 -중앙 
}
float centerX;//가로 절반 좌표를 변수로 선언해준다
float centerY;//세로 절반 좌표를 변수로 선언해준다
float unit = 10;//기준 눈금 설정해두기 
int dir_A = -1;//왼쪽 동물의 이동 방향 초기 선언(좌측)
int dir_B = -1;//오른쪽 동물의 이동 방향 초기 선언(좌측)
float x1,x2,y1,y2;//쓸 변수 이름 미리 설정해두기 

void draw(){//액티브 모드에서
  background(180,220,180);//배경을 채워준다
  //작은 동물의 이동 먼저(x1, y1, dir_A)
  if (x1>-8*unit){ x1 -= 4; //화면 왼쪽 밖으로 나가기 전까지 왼쪽으로 4픽셀씩 움직이고 
  }else{x1 = width+8*unit;}// 왼쪽 밖으로 나갔다면 다시 오른쪽 화면 밖으로 위치 지정해서
  drawDog(x1,y1,unit);//기준 눈금 10인 강아지를 그려준다 
  
  if(x2<16*unit){dir_B = 1;}//왼쪽 가장자리에서 방향을 오른쪽으로 
  if(x2>width-10*unit){dir_B=-1;}//오른쪽 밖에서는 다시 왼쪽으로
  x2 += + dir_B*2;  //방향에 따라서 2픽셀씩 이동하도록 
  drawDog(x2, y2, 2*unit);//기준 눈금 20인 강아지를 그려준다 
}
