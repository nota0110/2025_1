int startTime = -1;
int curruntTime = -1;
boolean gameStarted = false;
boolean gameEnded = false;
String winner = "Player";
int botCount,playerCount;

int nGem = 100;
float[] xg = new float[nGem];
float[] yg = new float[nGem];
boolean[] gv = new boolean[nGem];
color[] gc = new color[nGem];

float botX, botY;
int botDirX, botDirY;

float playerX, playerY;

void setup(){
  size(600,800);
  startTime = -1;
  for(int gem = 0; gem<nGem; gem++){
    xg[gem] = random(10, width-10);
    yg[gem] = random(120, height);
    gv[gem] = true;
    gc[gem] = color(random(0,255),random(0,255),random(0,255));
  }
  
  botX = random(15, width-15);
  botY = random(115, height-15);
  botDirX = 0;
  botDirY = 0;
  playerX = random(15, width-15);
  playerY = random(115, height-15);
}

void drawMenu(){
  noStroke();
  fill(#C94DFF);
  rectMode(CORNER);
  rect(0,0,width, 100);
  
  if(gameEnded){
    if(botCount>playerCount){
      winner = "Computer(BOT)";
    }else if(playerCount==botCount){
      winner = "No one";
    }
  }
  
  fill(255);
  textSize(20);
  textAlign(LEFT,BOTTOM);
  text("Find the gem!",10, 30);
  text("S : start", width/2+10, 30);
  text("Time left : "+(10-round((curruntTime-startTime)/1000))+'s', 10, 60);
  if(gameEnded){text(winner+" wins!", width/2+10, 60);}
  text("Bot Count : "+botCount, 10,90);
  text("Player Count : "+playerCount, width/2+10, 90);
}

void drawGem(){
  for(int gem = 0; gem<nGem; gem++){
    if (dist(xg[gem], yg[gem]-10, botX, botY)<20){
      if (gv[gem]){botCount += 1;}
      gv[gem] = false;}
      
    if (dist(xg[gem], yg[gem]-10, playerX, playerY)<15){
      if (gv[gem]){playerCount += 1;}
      gv[gem] = false;}
      
    fill(gc[gem]);
    if(gv[gem] == true){triangle(xg[gem]-10,yg[gem],xg[gem]+10,yg[gem],xg[gem],yg[gem]-20);}
  }
}

void drawBot(){
  rectMode(CENTER);
  fill(0);
  rect(botX,botY, 30,30);
  botX += 4*botDirX;
  botY += 2*botDirY;
  if(botY > height+15){botY = 115;}
  if(botX < 15 || botX>width-15){botDirX *= -1;}
  if(gameEnded){botDirX = 0; botDirY = 0;}
}

void drawPlayer(){
  fill(255);
  ellipse(playerX, playerY, 30,30);
  if(gameStarted && mousePressed){
    playerX = pmouseX;
    playerY = pmouseY;
  }
}

void draw(){
  background(#C8C4FF);
  drawMenu();
  drawGem();
  drawBot();
  drawPlayer();
  if(gameStarted){curruntTime = millis();}
  if(curruntTime-startTime>10000 && startTime != -1){gameEnded = true;gameStarted = false;}
}


void keyPressed(){ 
  if(key == 's' || key == 'S'){
    if(!gameStarted){ //게임 시작 대기중일때.
      botDirX = -1;
      botDirY = +1;
      gameStarted = true;
      startTime = millis();
    }
  }
}
