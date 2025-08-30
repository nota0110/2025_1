size(1200,400); //캔버스 사이즈 지정
background(180,220,180); //배경색 연두색 지정
float U = 10;//자연물 크기 배율. 가로 길이는 4U이고, 세로 길이는 3U이다.

for (int i = 0; i <= width; i += 4*U+10){ // 가로 길이+10px 여유를 두고 가로 반복
  for (int j = 0; j <= height; j += 3*U+10){//세로 길이 + 10px 여유를 두고 세로 반복 
    fill(140, 200, 140);//잎 색깔 지정 
    stroke(140, 200, 140);//줄기 색도 지정
    ellipse(i-U, j, 2*U, U); //왼쪽 잎 그리기
    ellipse(i+U, j, 2*U, U); //오른쪽 잎 그리기 
    strokeWeight(2); //줄기 두께 지정 
    line(i, j, i, j+2*U); // 줄기 그리기 
  };
};
