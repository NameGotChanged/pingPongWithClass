class Paddle {
  int x;
  int y;
  int rWidth;
  int rHeight;
  float speed = 7;
  float directionSpeed=0;
  
  Paddle() {
    this.rWidth = 150;
    this.rHeight = 22;
    this.x = width/2;
    this.y = height-rHeight/2;
  }

  void display() {
    move();
    stroke(120,0,20);
    strokeWeight(4);
    fill(255, 0, 0);
    rect(x, y, rWidth/2, rHeight/2);
  }
  
  void moveLeft(){
     directionSpeed = -speed*b.speed;          //damit das Paddle mithalten kann, wird es ebenfalls beschleunigt (könnte lategame probleme bereiten weil das verhältnis zum Ball nicht Passt)
  }
  
  void moveRight(){
    directionSpeed = speed*b.speed;
  }
  
  void move(){
    x = int(min(max(0, x + directionSpeed), width));
  }
}
