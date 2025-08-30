void setup(){
  size(1000,800);
  centerX = width/2;
  centerY = height/2;
}
float centerX;
float centerY;

void draw(){
  background(180,220,180);
  drawDog(centerX-200, centerY, 10);
  drawDog(centerX+300, centerY, 20);
}
