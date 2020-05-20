//!!! Anpassungen von Michael (Schulkamerad)
class Ball {
  float x;
  float y;
  float yMovement = -5;
  float xMovement = -5;
  float yMovementModifier = 3; 
  float r;  //Radius Ball
  float speed = 1;              //!!! Anpassung (beschleunigung) in der vanishBlock() Funktion der Brick Klasse
  float speedModifier = 0.015;
  Ball() {
    this.x = 500; //50
    this.y = 600; //25
    this.r = 15;
  }
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, this.r*2, this.r*2);
  }
  void ballMovement() {                      // !!! Um die senkrechte bewegung generell etwas schneller zu machen (mehr Pingpong feeling) habe ich hier den Modifier verwendet
    this.x = x + xMovement*speed;            //                                                                   (Und es wirkt nicht so dramatisch, wenn die Bricks seitlich getroffen werden ;P)
    if(yMovement >0){
      this.y = y + (yMovement+yMovementModifier)*speed;
    }
    else
    {
      this.y = y + (yMovement-yMovementModifier)*speed;
    }
  }
  void checkWallHit() {    //Überprüft ob Spielfeldrand oder Paddle des Spielers getroffen wurde und passt Richtung des Balls oder den Spiel state an.
    if (y >= height) {         // !!! Änderung 1: >= anstatt == (verhindert das der Ball nach unten rausfliegt)
      state = 2;
    }
    if (y <= 0) {              // !!! Änderung 1: selbiges für den oberen Rand zur Sicherheit (kurz getestet durch auskomentieren von displayBricks();)
      yMovement = +5*speed;     // !!! Änderung 2: alle bewegungswerte konstant auf 5 gesetzt (um 10 herum ist für einen statischen Wert wohl besser)
    }
    if (x >= width) {          // !!! Änderung 1: safety first ;P
      xMovement = -5*speed;
    }
    if (x <= 0) {              // !!! Änderung 1: ...
      xMovement = +5*speed;
    }
    if (x == 0 && y == 0) {
      xMovement = +5*speed;
      yMovement = +5*speed;
    }
    if (x == width && y == 0) {  
      xMovement = -5*speed;
      yMovement = +5*speed;
    }
    if (y >= paddle.y-25 && x <= paddle.x +75 && x >= paddle.x - 75) {
          yMovement = -5*speed;      
  }    
 }
}
