//################
//글로벌 변수 선언
//################

int unit = 5;
int nPlant = 100;
float[] xp = new float[nPlant];
float[] yp = new float[nPlant];
boolean [] pv = new boolean[nPlant]; //plant visibility
int count, catchStartTime, kingIndex;
float ax, ay, axdir, aydir;
float bg_r = random(0,255);
float bg_g = random(0,255);
float bg_b = random(0,255);
boolean textCatch = false;
String recentInput = "";
String modeCheck = "ready";

//######################
//셋업 및 기본 함수 설정 
//######################
void setup(){
  size(600,800);  
  //인덱스 i마다 x,y좌표 지정해주기 
  for(int i = 0; i<xp.length; i++){xp[i] = random(2*unit, width-2*unit);yp[i] = random(2*unit, height-2*unit);pv[i] = true;}
  //동물(원) 초기 위치 지정해주기, 초기 방향은 왼쪽 
  ax = random(10*unit, width-10*unit);
  ay = random(10*unit, width-10*unit);
}

void drawAnimal(float animalX, float animalY, int unit){
  float x = animalX;
  float y = animalY;
  fill(255);
  ellipse(x, y, unit*10, unit*10);
}

void drawPlant(int index, float plantX, float plantY, int unit){
  int i = index;
  float x = plantX;
  float y = plantY;
  float u = unit;
  fill(200);
  rect(x-2*u,y-2*u,4*u, 4*u);
  textSize(4*u);
  fill(0);
  text(i, x-u, y+u);
}

void getCaught(){
}

void reset(){
  //
}

//####################
//draw function below
//####################
void ready(){
  //게임 시작 전 상태창을 출력하는 함수. 
}

void autoControl(){
  //자동 수확 모드일 때의 이동을 정의 
}

void manualControl(){
//수동 모드일때의 이동을 정의 
}

void draw(){
  background(bg_r,bg_g,bg_b);//1.랜덤 색으로 캔버스 생성 
  drawPlant(1, width/2, height/2, unit);
  drawAnimal(width*3/4, height*3/4, unit);
  
  if(keyPressed){
    if(key==CODED){}
  }
  
  if (recentInput == ""){ready();
  }else if(key == 'a' || key == 'A'){modeCheck = "auto";
  }else if(key == 'm' || key == 'M'){modeCheck = "manual";}
  
  if (modeCheck == "auto" ){autoControl();}
  else if (modeCheck =="manual"){manualControl();}
  
  
  
  //게임이 시작이 되기 전이라면 상태창 출력하기 
  //상태창 출력이 끝났다면(a/m 입력이 있었다면) 게임 시작됨 + 시간 기록하기 
  //자동 모드라면 -> 자동으로 움직임 x -2, y +- 3. 키보드 무시 
  //수동 모드라면 -> 키보드 인풋 방향으로 움직임. 떼면 멈춤! 
  //어쨌든 왕식물을 찾으면 이동 전부 멈추고 상태창 출력, 시간 출력 
}
