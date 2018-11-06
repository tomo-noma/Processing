int frames = 3; // キャラのアニメーションに必要な画像の枚数
int playerImages = 12; // プレイヤーキャラの画像の枚数
PImage[] playerImage = new PImage[playerImages]; // プレイヤーキャラ
PImage grassImage;
int x,y; // プレイヤーキャラの座標
int spd; // プレイヤーの移動速度
boolean up,down,left,right; // キー入力の有無
int lastDirection = 0;//最後に離したキー　下:0 右:1 左:2 上:3
BG fieldMap = new BG(16, 50, 50);
int windowWidth = 750;
int windowHeight = 750;
int fieldWidth = fieldMap.windowWidth();
int fieldHeight = fieldMap.windowHeight();

int[][] mapData = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
//fieldMap = new BG(16, 50, 50);
//fieldWidth = fieldMap.windowWidth();
//fieldHeight = fieldMap.windowHeight();

void setup() {
  size(750, 750, FX2D); // ウィンドウのサイズ
  background(255); //背景はとりあえず白
  println(fieldWidth);
  println(fieldHeight);
  frameRate(30); // 秒間フレーム
  // 初期位置
  x = 100;
  y = 100;
  spd = 5;
  
  // 画像を読み込む
  for(int i=0; i<playerImages; i++){
    playerImage[i] = loadImage("hero"+i+".png");
  }
  grassImage = loadImage("grass.png");
  fieldMap.setMap(mapData);
}

void draw() {
  //background(255);
  for(int i=0; i<50; i++){
    for(int j=0; j<50; j++){
      image(grassImage, i*16,j*16);
    }
  }
  int charaFrame = frameCount % frames;
  image(playerImage[1], x, y);
  charaStandImage();
  charaMoveImage(charaFrame);
  charaMove();
}

// キーが押されたとき
void keyPressed(){
  switch(keyCode){
    case UP:
      up = true;
      break;
    case DOWN:
      down = true;
      break;
    case LEFT:
      left = true;
      break;
    case RIGHT:
      right = true;
      break;
  }
}

// キーを離したとき
void keyReleased(){
  switch(keyCode){
    case UP:
      up = false;
      lastDirection = 3;
      break;
    case DOWN:
      down = false;
      lastDirection = 0;
      break;
    case LEFT:
      left = false;
      lastDirection = 2;
      break;
    case RIGHT:
      right = false;
      lastDirection = 1;
      break;
  }
}


// キャラを動かす
void charaMove(){
  if(up && !down && !right && !left){
    if(y > 0){
      y -= spd;
    }
  }
  if(down && !up && !right && !left){
    if(y < windowHeight - 29){
      y += spd;
    }
  }
  if(left && !right && !up&& !down){
    if(x > 0){
      x -= spd;
    }
  }
  if(right && !left && !up&& !down){
    if(x < windowWidth - 19){
      x += spd;
    }
  }
}

void charaMoveImage(int frame){
  if(down && !up && !right && !left){
    image(playerImage[frame], x, y);
  }else if(right && !left && !up && !down){
    image(playerImage[frame + 3], x, y);
  }else if(left && !right && !up && !down){
    image(playerImage[frame + 9], x, y);
  }else if(up && !down && !right && !left){
    image(playerImage[frame + 6], x, y);
  }
}

void charaStandImage(){
    if(lastDirection == 0){
    image(playerImage[1], x, y);
  }else if(lastDirection == 1){
    image(playerImage[4], x, y);
  }else if(lastDirection == 2){
    image(playerImage[10], x, y);
  }else if(lastDirection == 3){
    image(playerImage[7], x, y);
  }
}
