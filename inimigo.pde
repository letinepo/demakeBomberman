int yEnemy = 15;
int xEnemy= 15;
int tempoEnemy;
boolean Enemyvivo = true;

void Enemy() {
  if (Enemyvivo == true) {

    //morte do inimigo
    if (M[xEnemy][yEnemy] == 4) {
      Enemyvivo = false;
    }

    //salvando localizações do inimigo
    int ax = xEnemy;
    int ay = yEnemy;

    M[xEnemy][yEnemy] = 0;

    movimentacaoEnemy();

    //colisão do inimigo
    if (M[xEnemy][yEnemy] == 1 ||M[xEnemy][yEnemy] == 2||M[xEnemy][yEnemy] == 3 ||M[xEnemy][yEnemy] == 5) {
      xEnemy = ax;
      yEnemy = ay;
    }

    M[xEnemy][yEnemy] = 6;
  }
}

void movimentacaoEnemy() {
  int[] x_direcao = {0, 0, 1, -1}, y_direcao = {1, -1, 0, 0};
  int aux = int(random(0, 4));
  int ex = x_direcao[aux];
  int ey = y_direcao[aux];
  tempoEnemy++;
  if (tempoEnemy > 30) {
    tempoEnemy = 0;
  }

  if (tempoEnemy == int(random(0, 15))) {
    xEnemy+= ex;
  }
  if (tempoEnemy == int(random(15, 30))) {
    yEnemy += ey;
  }

  if (xEnemy > N-2) {
    xEnemy = N-2;
  }
  if (yEnemy > N-2) {
    yEnemy = N-2;
  }

  if (xEnemy < 1) {
    xEnemy = 1;
  }
  if (yEnemy < 1) {
    yEnemy = 1;
  }
}
