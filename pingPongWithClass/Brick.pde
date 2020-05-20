class Brick {
  float rWidth;
  float rHeight;
  float xRect;
  float yRect;
  float x;
  float y;
  boolean visibility;     //rechteck sichtbarkeit (ob es angezeigt wird oder nicht)
  int bricksHealth;
  

  Brick(int bricksHealth) {
    this.rWidth = 100;
    this.rHeight = 25;
    this.xRect = +100;
    this.yRect = +25;
    this.x = 0;
    this.y = 0;
    this.visibility = true;
    this.bricksHealth = bricksHealth;
  }
  void display() {
    rectMode(RADIUS);
    stroke(0);
    strokeWeight(3);
    switch(this.bricksHealth){
      case 4:
        fill(40,100,40);
      break;
      case 3:
        fill(60,140,40);
      break;
      case 2:
        fill(40,255,150);
      break;
      case 1:
        fill(100,255,0);
      break;
    }
    rect(x + rWidth/2, y + rHeight/2, rWidth/2, rHeight/2);
  }
  void vanishBlock() {
      if (b.y - this.y <= rHeight && b.x - this.x <= rWidth/2 + rWidth/2 && b.x - this.x >= rWidth/2 - rWidth/2){ 
      bricksHealth --;
      if (this.visibility != false) {
        if(bricksHealth == 0){
        this.visibility = false;
        }
        b.speed += b.speedModifier;                  //!!! Ballbeschleunigung
        score = score + 100;
        b.yMovement = +5*b.speed;
        }
    }
    }
        
      }  //<>// //<>//
