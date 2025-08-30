void setup(){//정지 모드에서
  size(1000,800);//화면 크기 결정하고
  centerX = width/2;//가로 절반 좌표와
  centerY = height/2;//세로 절반 좌표를 미리 결정해준다
}
float centerX;//가로 절반 좌표를 변수로 선언해준다
float centerY;//세로 절반 좌표를 변수로 선언해준다

void draw(){//액티브 모드에서
  background(180,220,180);//배경을 채워준다
  drawDog(centerX-200, centerY, 10);//왼쪽(작은)동물 그리기
  drawDog(centerX+300, centerY, 20);//오른쪽(큰)동물 그리기 
}
