void drawGrass(float gx, float gy, float gd){
  
  float U = gd;//자연물 크기 배율. 가로 길이는 4U이고, 세로 길이는 3U이다.
  float X = gx; //새싹 가로 위치 
  float Y = gy; //새싹 세로 위치 
  
  fill(140, 200, 140);//잎 색깔 지정 
  ellipse(X-U, Y, 2*U, U); //왼쪽 잎 그리기 
  ellipse(X+U, Y, 2*U, U); //오른쪽 잎 그리기 
  stroke(140, 200, 140);//줄기 색 지정 
  strokeWeight(2); //줄기 두께 지정 
  line(X, Y, X, Y+2*U); // 줄기 그리기 
}
