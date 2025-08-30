//################
//글로벌 변수 선언
//################

int unit = 5;
int nPlant = 100;
float[] xp = new float[nPlant];
float[] yp = new float[nPlant];
boolean [] pv = new boolean[nPlant]; //plant visibility
int count, gameStartTime, kingIndex, gameEndTime;
float ax, ay, axdir, aydir;
float bg_r = random(0,255);
float bg_g = random(0,255);
float bg_b = random(0,255);
boolean textCatch = false;
String modeCheck = "ready";
boolean gameStarted = false;
float clickedX, clickedY;
boolean clickEventOccur = false;

//######################
//셋업 및 기본 함수 설정 
//######################
void setup(){
  size(600,800);  
  //인덱스 i마다 x,y좌표 지정해주기 
  for(int i = 0; i<xp.length; i++){xp[i] = random(2*unit, width-2*unit);yp[i] = random(2*unit, height-2*unit);pv[i] = true;}
  //동물(원) 초기 위치 지정해주기 
  ax = random(10*unit, width-10*unit);
  ay = random(10*unit, width-10*unit);
  kingIndex = int(random(0,100)/1);
  gameEndTime = -1;
  axdir = -1;
  aydir = -1;
}

void drawAnimal(float animalX, float animalY, int unit){
  float x = animalX;
  float y = animalY;
  fill(255);
  ellipse(x, y, unit*10, unit*10);
}

void drawPlant(){
  int u = unit;
  for(int i = 0; i<xp.length; i++){
    float x = xp[i];
    float y = yp[i];
    
    if(clickEventOccur){
      if(dist(x,y,clickedX,clickedY)<2*u){
        if(pv[i]){kingIndex = i; clickEventOccur = false;}}}
   
    
    if(pv[i]){
      if(i == kingIndex){//왕 식물 그리기 
        fill(200);
        rectMode(CENTER);
        rect(x,y,8*u, 8*u);
        textAlign(CENTER);
        textSize(8*u);
        fill(0);
        text(i, x, y+2*u);
      }else{ //왕이 아닌 일반 식물 그리기 
        fill(200);
        rectMode(CENTER);
        rect(x,y,4*u, 4*u);
        textAlign(CENTER);
        textSize(4*u);
        fill(0);
        text(i, x, y+u);}
    }
    if(dist(x,y, ax, ay)<7*unit){
      if(i == kingIndex){
        modeCheck = "caught";
        if(gameEndTime == -1){gameEndTime = millis();}
      }else{pv[i] = false;}}
  }}

void getCaught(){
  axdir = 0;
  aydir = 0;
  fill(200,200);
  rect(width/2, height/2, unit*80, unit*120);
  fill(20);
  textSize(10*unit);
  text("King Found",width/2, height*1/4);
  fill(60);
  textSize(6*unit);
  textAlign(LEFT);
  text("clear Time : "+round((gameEndTime-gameStartTime)/1000)+"s\n\n\nA / a  => Auto Mode\nM/m => Manual Mode\nR / r  => Reset",width/5, height/2);
  
  

}

void reset(){
  //배경 색 랜덤 변경 
  bg_r = random(0,255);
  bg_g = random(0,255);
  bg_b = random(0,255);
  background(bg_r,bg_g,bg_b);
  //식물/자연물들의 위치 랜덤 변경 
  //  인덱스 i마다 x,y좌표 지정해주기 
  for(int i = 0; i<xp.length; i++){xp[i] = random(2*unit, width-2*unit);yp[i] = random(2*unit, height-2*unit);pv[i] = true;}
  //왕 인덱스 다시 선정  
  kingIndex = int(random(0,100)/1);
  if (modeCheck == "caught"){modeCheck = "ready";gameEndTime = -1;gameStartTime = -1;  
                             axdir = -1; aydir = -1;}
}


void ready(){
  //게임 시작 전 상태창을 출력하는 함수. 
  fill(200,200);
  rect(width/2, height/2, unit*80, unit*120);
  fill(20);
  textSize(10*unit);
  text("BoxHunting",width/2, height*1/4);
  fill(60);
  textSize(6*unit);
  textAlign(LEFT);
  text("Use [Arrow keys] to move \n     ( in Manual Mode )\nclick to change King Block\n\nA / a  => Auto Mode\nM/m => Manual Mode\nR / r  => Reset",width/5, height/2);
}


void autoControl(){
  //자동 수확 모드일 때의 이동을 정의 
  if (ax<-10*unit){ax = width+10*unit;} ax += 2*axdir;
  if (ay <8*unit || ay>height-8*unit){aydir *= -1;} ay += 3*aydir;
}


void manualControl(){ //수동 모드일때의 이동을 정의 
  if(keyPressed){
    if(key == CODED){
      if     (keyCode == LEFT ){ax -= unit*abs(axdir);}
      else if(keyCode == RIGHT){ax += unit*abs(axdir);}
      else if(keyCode == UP   ){ay -= unit*abs(aydir);}
      else if(keyCode == DOWN ){ay += unit*abs(aydir);}}}}


void draw(){
  background(bg_r,bg_g,bg_b);//랜덤 색으로 캔버스 생성 
  if (modeCheck == "auto" ){autoControl();
  }else if (modeCheck =="manual"){manualControl();}
  
  drawPlant();
  drawAnimal(ax, ay, unit);
  
  if(keyPressed){
    if(key == 'a' || key == 'A'){
      if(modeCheck == "ready"){gameStartTime = millis();} modeCheck =  "auto" ; 
    }else if(key == 'm' || key == 'M'){
      if(modeCheck == "ready"){gameStartTime = millis();} modeCheck = "manual"; 
    }else if(key == 'r' || key == 'R'){reset();}}
    

  if (mousePressed){clickEventOccur = true; clickedX = mouseX; clickedY = mouseY;}
  if (modeCheck == "ready"){ready();}  //게임이 시작이 되기 전이라면 상태창 출력하기 
  if (modeCheck == "caught"){getCaught();}
}
