PImage background, system;
float charaX, charaY;
float speedX, speedY;
float GRAVITY = 3.2;
int number;
boolean right = false;
final int Chip_w = 64;//チップサイズwidth
final int Chip_h = 64;//チップサイズheight
MapChip chara1;

void setup() {
  size(950, 640);
  charaX = 100;
  speedX = 0;
  charaY= 400;
  speedY = 0;

  background = loadImage("school.jpg");
  system = loadImage("system.png");
  //インスタンス作成：GIFファイルを読み込む
  chara1 = new MapChip("1.png");
}

void draw() {
  image(background, 0, 0, 950, 640);
  image(system, 0, 0, 950, 640);
  move();//キャラ移動
  update();//画面に表示
}
void move() {
  //float accselX = -0.05;//加速度
  //speedX += accselX; 
  charaX += speedX ;
  if (speedY != 0) {
    speedY += GRAVITY;
    charaY += speedY;
    if (charaY >400) {
      charaY = 400;
      speedY = 0;
    }
  }
  if (charaX > width + Chip_w) {
    charaX = Chip_w;
  }
}
void update() {
  PImage mapChip = chara1.getMapChip(number);
  if (right == true) {
    scale(-1, 1);//x座標が反転した場合、右に移動したければx座標はマイナス方向になる
    image(mapChip, -charaX, charaY, 64*3, 64*3);
  } else if (right == false) {
    scale(1, 1);
    image(mapChip, charaX, charaY, 64*3, 64*3);
  }
}
void keyReleased() {
  PImage mapChip = chara1.getMapChip(number);
  number = 0;
  image(mapChip, charaX, charaY, 64*3, 64*3);
}

void keyPressed() {
  PImage mapChip = chara1.getMapChip(number);
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == UP) {
    } else if (keyCode == DOWN) {
      number = 21;
      image(mapChip, charaX, charaY, 64*3, 64*3);
    } else if (keyCode == RIGHT) {
      if (right == false) {
        charaX += 64*3/2;
      }
      right = true;
      if (charaX<width) {
        charaX +=15;
      }
    } else if (keyCode == LEFT) {
      if (right == true) {
        charaX -= 64*3/2;
      }
      right = false;
      if (charaX>0) {
        charaX -=15;
      }
    }
  }

  if (key == 'z') {
    number=10;
    image(mapChip, charaX, charaY, 64*3, 64*3);
  }
  if (charaY == 400 && key == ' ') {
    speedY = -30;
  }
}

void mouseClicked(){
  number++;
  
}
