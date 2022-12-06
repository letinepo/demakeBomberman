PFont atari;
int N = 17;
int M [][];
int point;
int jogo = 1;
int tempodejogo = 89;
int count = 0;

void setup() {

  atari = createFont("atari.ttf", 100);
  textFont(atari);
  textSize(50);
  noStroke();
  size(840, 840);

  criaBlocos();

  //inicia personagem
  M[xPlayer][yPlayer] = 2;
}

void draw() {
  println(jogo);
  if (jogo == 1) {
    background(255);

    desenhaCenario();

    //pontuação
    fill(1);
    text("SCORE:"+point, 80, 60);

    count++;
    if (count % 60 == 0) {
      tempodejogo--;
    }
    text(tempodejogo, 700, 60);

    Enemy();
    bomba();
    vitoria();
    derrota();
  }
}

void criaBlocos() {

  M = new int[N][N];

  int b=0;
  while (b<100) {
    int l = int(random(17));
    int c = int(random(17));
    if (M[l][c]==0) {
      M[l][c]=3;
      b++;
    }
  }
}

void desenhaCenario() {

  //parede
  for (int i = 0; i<N; i++) {
    for (int j = 0; j<N; j++) {
      if (i%2==0 && j%2==0) {
        M[i][j] = 1;
      }
    }
  }

  //rects
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      switch (M[i][j]) {

      case 0:
        fill(130, 130, 130);
        break;

      case 1:
        fill(255, 0, 255);
        break;
      case 2:
        fill(255, 255, 255);
        break;
      case 3:
        fill(0,100,110);
        break;
      case 4:
        fill(255, 0, 0);
        break;
      case 5:
        fill(1);
        break;
      case 6:
        fill(0, 255, 0);
        break;
      case 7:
        fill(0, 0, 255);
        break;
      default:
        print("erro no sistema!!");
      }
      rect(i*width/21+80, j*height/21+80, width/21, height/21);
    }
  }

  //bordas
  fill(255, 255, 0);
  fill(255, 0, 255);
  rect(80, 80, 680, 40);
  rect(80, 720, 680, 40);
  rect(80, 80, 40, 680);
  rect(720, 80, 40, 680);
}
