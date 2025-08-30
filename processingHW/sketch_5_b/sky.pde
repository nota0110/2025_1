void drawSky(float ry, float gr) {
  // 하늘 그라데이션 roadY > ry, gridRoad > gr
  // 반복문 연습 - (1)일단 1개를 그린다, (2)그 다음에 반복 조건을 쓴다 (3) 반복하면서 변하는 것을 찾아내서 변수로 만든다
  // (4) 변수의 값이 어떻게 변하는지 수식으로 표현한다
  noStroke();
  int grads = ceil(ry/gr); // 나누어 떨어지지 않고 소수점이 남으면 무조건 올림 (하늘과 땅 사이 공백 안 생기게 마지막줄 그려줌)
  for(int i=0; i<grads; i++) {
    // 변하는 것 - 사각형의 y위치, 사각형의 색깔
    float sy = gr*i; // 세로로 위에서부터 몇 번째(i) 그라데이션인지, 이 위치의 그라데이션에 대한 색깔 아래에서 계산 
    float sr = 190 + float(220-190)/grads*i;
    float sg = 247 + float(110-247)/grads*i;
    float sb = 255 + float(1-255)/grads*i;
    fill(sr, sg, sb); // (190, 247, 255) ~ (220, 110, 1) 
    rect(0, sy, width, gr);
  }
}
