void setup() {
  size(1200, 800);
}

void draw() {
  background(99, 56, 5);

  float roadY = 500;// 도로 기준 변수
  float gridRoad=10;// 모든 물체에 대한 크기 변수
  float carX=width/2, carY=roadY;// 자동차 중심 변수
  float gridCar=gridRoad*1;// 자동차에 대한 크기 변수

  drawRoad(500, 20); // 도로 함수 사용 (호출)하여 도로를 그림, 하늘과 가로수도 함수로 제공되니 사용하여 그려보자

  drawCar(400, 500, 10); // (400, 500) 위치에 크기가 10인 자동차
  drawCar(1000, 500, 20); // (1000, 500) 위치에 크기가 20인 자동차 
}
