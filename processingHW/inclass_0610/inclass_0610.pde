boolean gettingBigger;
float headX,headY,heartX,heartY,heartSize;
int delayCounter = -1;

void setup(){
  size(600,300);
  gettingBigger = true;
  heartX = width*2/3;
  heartY = height*2/3;
  headX = heartX-25;
  headY = heartY-100;
  heartSize = 100;
}

void draw_shadow(){
  noStroke();
  fill(100,100,200);
  ellipse(headX,headY,50,50);
  rectMode(CENTER);
  rect(headX, (height+headY+25)/2, 150, 175,20,20,0,0);
}

void draw_heart(float sizeValue){
  float size = sizeValue/100;
  noStroke();
  fill(200,100,100);
  arc(heartX-15*size,heartY,30*size,30*size,PI,PI*2);
  arc(heartX+15*size, heartY, 30*size, 30*size, PI, PI*2);
  triangle(heartX-30*size,heartY,heartX+30*size,heartY,heartX,heartY+30*size);
}

void draw(){
  background(250,250,100);
  draw_shadow();
  draw_heart(heartSize);
  if (gettingBigger){
      heartSize += 2;
    }else{
      heartSize -= 2;}
  if (delayCounter > 30 || delayCounter == -1){
    gettingBigger = !gettingBigger;
    delayCounter = 0;
  }else{
    delayCounter += 1;}
    println(delayCounter);
    
}

//translate + scale. 굉장히 신기한 기능이구만... 
