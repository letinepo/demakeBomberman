void derrota() {

  if (tempodejogo == 0) {
    jogo = 2;
    text("DERROTA", 340, 810);
  }
  if (M[xPlayer][yPlayer] == 4 || M[xPlayer][yPlayer] == 6) {
    jogo = 2;
    text("DERROTA", 340, 810);
  }
}

void vitoria() {
  if (Enemyvivo == false) {
    M[xEnemy][yEnemy] = 7;
  }
  if (M[xPlayer][yPlayer] == 7) {
    text("VITORIA :)", 340, 810);
    jogo = 3;
  }
}
