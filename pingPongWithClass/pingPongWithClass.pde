 //<>//
Ball b; //<>// //<>//
Paddle paddle;
Brick[] bricks; 
int state = 0;
int i=0;
int score = 0;
int[] brickColumn;
int brickCount = 120;
int brickRow = (brickCount/10)-(brickCount/10%10);


  
void setup() {
  size(1000, 800);
  frameRate(60); //Framerate bestimmt auch gewissermassen die Geschwindigkeit des Spiels.
  b = new Ball();
  paddle = new Paddle();
  bricks = new Brick[brickCount];
  brickColumn = new int[brickCount/10+1];
  for(int i = 0; i < 10; i++){
    brickColumn[i] = brickCount-10 +i;
  }
  setupBricks();
}
void displayScore(){
  fill(255,255,255);
  textSize(40);
  text("Score: "+score, width/2-width/5, height/2);
  }

void displayBricks(){
  for(int i = 0; i < 10; i++){  //Checkt ob der unterste Brick der Reihe getroffen wurde.
    if(bricks[brickColumn[i]].visibility == true){
      bricks[brickColumn[i]].vanishBlock();
      bricks[brickColumn[i]].display();
    }
    else if(brickColumn[i] >= 10 && bricks[brickColumn[i]].visibility != true){
      brickColumn[i] = brickColumn[i] -10;
    }
  }
    for(int i = 0; i < bricks.length; i++){
      if(bricks[i].visibility == true){
      bricks[i].display();
      }
    }
}
void displayStartScreen(){
  textSize(80);
  fill(212, 175, 55);
  for(int x = -1; x < 2; x++){ 
    text("Press S to start the game", 15+x, height/2);
    text("Press S to start the game", 15, height/2+x);
  }
  fill(255,0,0);
  text("Press S to start the game", 15, height/2);
  
  textSize(30);
  fill(50,205,50);
  for(int x = -1; x <2; x++){
    text("Press I to see information about the game", 25+x, height/2+100);
    text("Press I to see information about the game", 25, height/2+100+x);
  }
  fill(0,100,0);
  text("Press I to see information about the game", 25, height/2+100);
}
void displayEndScreen(){
  fill(255,0,0);
  textSize(100);
  text("Nice try", width/2-200, height/2-100);
  fill(255,255,255);
  text("Score: "+score, width/2-200, height/2+50);
  fill(56,120,56);
  textSize(40);
  text("Press S to Try Again",width/2-180, height/2+300);
}
void resetGame(){
  for(i = 0; i < bricks.length; i++){
      bricks[i].visibility = true;
    }
  paddle.x = width/2;
  b.x = 500;
  b.y = 600;
  b.yMovement = -5;
  b.xMovement = -5;
  b.speed = 1;
  paddle.directionSpeed = 0;
  setupBricks();
}

void setupBricks(){
    int spalte = 0;
    int zeile = 0;
    int bricksHealth = 4;
    for (int i = 0; i < bricks.length; i++) {
      if(bricksHealth > 1 && i % (brickRow*3) == 0 && i != 0){
          bricksHealth--;
        }
     
      bricks[i] = new Brick(bricksHealth);                //Ebricktellt neues Objekt von Klasse RechteckSpiel
      
      if (spalte % 10 == 0 && spalte != 0) {      //Falls 10 Blöcke in einer Spalte sind soll es eine Zeile darunter wieder anfangen Blöcke zu machen
        
        spalte = 0;
        zeile ++;
      }
      if (spalte % 10 != 0 || spalte == 0) {        //Falls die Spalte nicht 10 oder 0 Blöcke in sich hat sollen weiterhin Blöcke gemacht werden und jedesmal durch die erhöhung von der Spalte vebricketzt werden (Siehe Klasse RechteckSpiel)
        bricks[i].y = bricks[i].rHeight * zeile;
        bricks[i].x = bricks[i].rWidth * spalte;
        spalte ++;
  }
 }
}

void displayInformationAboutTheGame(){
    fill(255);
    text("Your Goal is to achieve as many points as possible, ",100,59);
    text("meanwhile both the ball and the paddle are speeding up.",100,99);
  fill(212, 175, 55);
  for(int x = -1; x < 2; x++){ 
    text("Press S to start the game", 15+x, height-20);
    text("Press S to start the game", 15, height-20+x);
  }
  fill(255,0,0);
  text("Press S to start the game", 15, height-20);
}
void draw() {
  background(0);
  switch(state) {
  case 0:             //Spielstate 0 soll der Text Press S to start angezeigt werden. (State wechsel passiert sobald s oder S geschrieben wird (siehe keyPressed unten))
    displayStartScreen();
    break;
  case 1:               //(zum Beispiel damit sich der Ball ebrickt bewegt wenn das Spielfeld schon ganz da ist)
    paddle.display();
    b.ballMovement();                      //Gibt dem Ball an wie er sich bewegen soll.
    b.checkWallHit();                      //Passt die oben genannte Bewegung des Balles je nach aufprall an.
    b.display();                           //zeigt den Ball an.
    displayBricks();
    displayScore();
    break;
  case 2:
    displayEndScreen();
    resetGame();
    break;
  case 3:
   displayInformationAboutTheGame();
   break;
 }
}
void keyPressed() {
  switch(keyCode) {
  case LEFT:
    paddle.moveLeft();
    break;
  case RIGHT:
    paddle.moveRight();
    break;
  case 'S':
    if(state != 1 && state != 4){
      score = 0;
      for(int i = 0; i < 10; i++){
      brickColumn[i] = brickCount -10 +i;
    }
    state = 1;      //State wechsel für Aufbau des Spiels.
    }
    
      
   break;
    
  case 'I':
    if(state == 0 || state == 2){
      state = 3;
    }
    break;
 }
}
