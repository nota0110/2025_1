int nb = 48;
boolean[] isColored = new boolean[nb];
boolean[] isPopped = new boolean[nb];
boolean[] isClicked = new boolean[nb];

float[] xb = new float[nb];
float[] yb = new float[nb];

color colors[] = {color(255,10,10),color(250,120,5),color(230,230,0),color(20,250,0),color(10,30,240),color(0,0,100),color(100,20,100),color(140),color(10),color(130),color(100,40,10),color(0,120,150)};
int[] bcolor = new int[nb];

int tempClicked = -1;

void setup(){
  size(800,800);
  float xbox = width *0.9/8;
  float ybox = height*0.9/6;
  for(int i = 0; i<nb; i++){
    isColored[i] = false;
    isPopped[i]  = false;
    isClicked[i] = false;
    float row = i%8;
    int column = i/8;
    xb[i] = width *0.1 + row  * xbox;
    yb[i] = height*0.1 + column* ybox;
    bcolor[i] = int(random(0,12));
  }
}

void mouseMoved(){
  for(int i = 0; i<nb; i++){
    if(dist(mouseX, mouseY, xb[i], yb[i])<25){
      isColored[i] = true;
      break;
    }
    for(int j = 0; j<nb; j++){
      if(!isClicked[j]){if(j != i){isColored[j] = false;}}
      }
  }
}

void compareBalloon(int first, int second){
  if(bcolor[first] == bcolor[second]){
    isPopped[first] = true;
    isPopped[second]= true;
  }
  for(int i = 0; i<nb; i++){isClicked[i] = false;}
  
}

void mouseClicked(){
  for(int i = 0; i<nb; i++){
    if(dist(mouseX, mouseY, xb[i], yb[i])<25){
      isClicked[i] = true;
      if(tempClicked == -1){tempClicked = i;
      }else{compareBalloon(tempClicked, i);tempClicked = -1;}
    }
  }
}

void keyPressed(){
  if(key == 'r'){
    for(int i = 0; i<nb; i++){
    isColored[i] = false;
    isPopped[i]  = false;
    isClicked[i] = false;
    bcolor[i] = int(random(0,12));
    }
  }
}

void draw(){
  background(255);
  for(int i = 0; i<nb; i++){
    fill(250);
    if(isColored[i]){fill(colors[bcolor[i]]);}
    if(!isPopped[i]){
      ellipse(xb[i],yb[i],50,50);
      textSize(20);
      textAlign(CENTER,CENTER);
      fill(0);
      text(i+1, xb[i], yb[i]);
    }
  }
}
