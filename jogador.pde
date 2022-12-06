int yPlayer = 1;
int xPlayer= 1;


boolean bota = false;
int tempo1;
int aux, aux1;
int posX, posY;
boolean teste;

void keyPressed() {

  if (jogo == 1) {

    M[xPlayer][yPlayer] = 0;

    int bx = xPlayer;
    int by = yPlayer;
    movimentaçãoPersona();

    //acheimuro???
    if (M[xPlayer][yPlayer] == 1 ||M[xPlayer][yPlayer] == 2||M[xPlayer][yPlayer] == 3||M[xPlayer][yPlayer] == 5) {
      xPlayer = bx;
      yPlayer = by;
    }

    if (xPlayer > N-2) {
      xPlayer = N-2;
    }
    if (xPlayer < 1) {
      xPlayer = 1;
    }
    if (yPlayer < 1) {
      yPlayer = 1;
    }
    if (yPlayer > N-2) {
      yPlayer = N-2;
    }

    M[xPlayer][yPlayer] = 2;
  }
}

void movimentaçãoPersona() {

  if (keyCode == RIGHT) {
    xPlayer++;
  }
  if (keyCode == LEFT) {

    xPlayer--;
  }
  if (keyCode == UP) {

    yPlayer--;
  }
  if (keyCode == DOWN) {

    yPlayer++;
  }
}

void bomba() {
  if (keyPressed == true) {
    if (!teste) {
      if (key == ' ') {
        bota = true;
        posX=xPlayer;
        posY=yPlayer;
        if (M[posX+1][posY] == 3 || M[posX-1][posY] == 3 || M[posX][posY+1] == 3 || M[posX][posY-1] == 3 || M[posX][posY] == 3) {
          point+= random(1, 50);
        }
      }
    }
  }


  if (bota == true) {
    teste=true;
    tempo1++;
    //println("Boolean ativado"+ tempo1);
    fill(255, 0, 0);
    M[posX][posY] = 5;
    if (tempo1 >120) {
      M[posX][posY] = 4;
      M[posX+1][posY] = 4;
      M[posX-1][posY] = 4;
      M[posX][posY+1] = 4;
      M[posX][posY-1] = 4;
    }
    if (tempo1 >180) {
      M[posX+1][posY] = 0;
      M[posX-1][posY] = 0;
      M[posX][posY+1] = 0;
      M[posX][posY-1] = 0;
      M[posX][posY] = 0;
      bota = false;
      teste=false;
      tempo1 = 0;
    }
  }
}
