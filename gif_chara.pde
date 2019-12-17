import gifAnimation.*;//Gifライブラリ
Gif     myAnimation;  //Gifインスタンス

float charaX, charaY;
float speedX, speedY;
float GRAVITY = 3.2;
void setup() {
  size(950, 640);
  charaX = 0;
  speedX = 5 ;
  charaY= height/2;
  speedY = 0;

  //インスタンス作成：GIFファイルを読み込む
  myAnimation = new Gif( this, "gif_Hula.gif");
  //無限再生開始
  myAnimation.loop();
}

void draw() {
  background(0);
  move();//キャラ移動
  update();//画面に表示
}
void move() {
  //float accselX = -0.05;//加速度
  //speedX += accselX; 
  charaX += speedX ;
  if(speedY != 0){
    speedY += GRAVITY;
    charaY += speedY;
    if(charaY > height/2){
      charaY = height/2;
      speedY = 0;
    }
  }
  if (charaX > width + myAnimation.width/2) {
    charaX = myAnimation.width/2;
  }
}
void update() {
  image(myAnimation, charaX, charaY);
  if (charaX>width-myAnimation.width/2) {//右にはみ出たら左へ
    image(myAnimation, charaX-width, charaY);
  }
  if (charaX<myAnimation.width/2) {//左にはみ出たら右へ
    image(myAnimation, charaX+width, charaY);
  }
}

void keyPressed(){
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      if (speedX > 0)speedX = -speedX;
      break;
    case RIGHT:
      if (speedX < 0)speedX = -speedX;
      break;
    }
  } else {
    if (key == 'u') {
      speedX *=1.05;
    } else if (key == 'd') {
      speedX *=0.95;
    } else if(key == ' '){
      speedY = -30;
    }
  }
}
