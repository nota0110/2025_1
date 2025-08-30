void drawRoad(float ry, float gr) {
  // 도로 gridRoad > gr, roadY > ry 
  float roadHeight=10*gr; 
  fill(52);
  rect(0, ry, width, roadHeight);
  // 중앙선
  fill(255, 151, 30);
  for(int x=50; x<width; x+=(20*gr)) { // 전체 반복 - 도로 크기도 자동차 크기에 비례해서 변하도록
    // 반복하면서 바뀌는 것과 바뀌지 않는 것을 구별하자
    // 바뀌는 것 - 점선의 x 위치
    // 바뀌지 않는 것 - 점선의 y위치, 너비, 높이 
    float lineX = x; // 반복문 변수 x에 따라서 같이 바뀜
    float lineY = ry+roadHeight/2; // 이 위치에 항상 고정 
    rect(lineX, lineY, 10*gr, 1*gr);
  }
}
