int x,y;
int r;
int cnt;

void settings(){
  fullScreen();
  size(displayWidth, displayHeight);
}

void setup(){
  frameRate(60);
  background(0);
  r = 10;
  cnt = 0;
}

void draw(){
  if(cnt > 1000){
    background(0);
    cnt = 0;
  }
  fill(random(255), random(255), random(255));
  x = (int)random(displayWidth);
  y = (int)random(displayHeight);
  ellipse(x, y, r, r);
  cnt++;
}
