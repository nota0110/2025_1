// 파라메터 변수는 함수를 호출하는 쪽에서 최종적으로 함수를 어떻게 사용할 것인가 결정해서 정해주는 값
// 예를 들어 자동차 그리기 함수에서는 자동차의 위치 (cx, cy)와 크기 (gr)는 
// 여기서 함수 정의할 때는 일단 어떤 값이 있다고 가정하고 만들고, 
// 실제로 이 함수를 사용하여 자동차 그릴 때 구체적인 값을 넣어줄 것이라는 뜻
// ***중요*** 파라메터 변수의 이름은 원래 변수의 이름과 완전히 달라야함. 꼭 주의!!! 
void drawCar(float cx, float cy, float gc) {
  // 자동차 그리기 carX > cx, carY > cy, gridCar > gr
  fill(20, 140, 200);
  rectMode(CENTER); // 도형의 중심을 변수로 설정하기 때문에, 기준이 되는 중심 사각형은 CENTER
  rect(cx, cy, 10*gc, 4*gc);
  rectMode(CORNER); // 자동차 머리 그릴 때는 사각형 그리는 기본이 CORNER
  // 자동차 머리의 시작점 (왼쪽위)는 몸통 중심에서 왼쪽(-)으로 10, 위(-)로 40 
  rect(cx-1*gc, cy-4*gc, 6*gc, 2*gc);
  fill(0);
  ellipse(cx-2.5*gc, cy+2*gc, 3*gc, 3*gc); // 왼쪽 바퀴, 자동차 바닥면이 타이어 중심 
  ellipse(cx+2.5*gc, cy+2*gc, 3*gc, 3*gc); // 오른쪽 
}
