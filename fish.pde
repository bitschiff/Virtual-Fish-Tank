//do not allow fish to turn on button if abought to hit wall
//center name


abstract class fish implements Tankable {

  protected  float fweight;
  protected  float fmaxWeight;
  protected  float fage;
  protected  float fmaxAge;
  protected  String fname;
  protected  boolean fDead;
  protected  float fr;
  protected  float fg;
  protected  float fb;
  protected  boolean fcanHaveBaby;
  protected  PVector PVmove = new PVector(1, 1);
  protected  PVector PVposition = new PVector(1, 1);

  void display() {
    if (fcanHaveBaby == false)
      if (random(500) == 10)
        fcanHaveBaby = true;


    fill(fr, fg, fb);
    PVector perpVect = new PVector(-1*PVmove.y, PVmove.x);
    perpVect.setMag(fweight/2);

    PVector temp = new PVector(PVmove.x, PVmove.y);
    temp.setMag(fweight);

    triangle(PVposition.x, PVposition.y, PVposition.x-temp.x+perpVect.x, PVposition.y-temp.y+perpVect.y, PVposition.x-temp.x-perpVect.x, PVposition.y-temp.y-perpVect.y);


    resetMatrix();
    fill(fr, fg, fb);
    ellipse(PVposition.x, PVposition.y, fweight, fweight); //body
    text(fname, (fweight / 2 + PVposition.x - 20), (PVposition.y - (fweight / 2) - 12));//name


    //eye
    temp.setMag(fweight/4);
    fill(255, 255, 255);
    ellipse(temp.x+PVposition.x, temp.y+PVposition.y, fweight/3, fweight/3);
  }



  abstract void move();

  void kill() {
    fDead = true;
  }


  void setWeight(float w) {
    fweight+=w;
  }

  void eat(float x, float y, float size)
  {
    //if()
  }

  float getsize()
  {
    return(fweight / 2);
  }

  void tooSkinny() {
    if (this.getRadius()<2)
      fDead=true;
  }
  float getx()
  {
    return(PVposition.x);
  }

  float getX()
  {
    return(PVposition.x);
  }
  float gety()
  {
    return(PVposition.y);
  }
  float getY()
  {
    return(PVposition.y);
  }

  boolean canHaveBaby()
  {
    return(fcanHaveBaby);
  }

  boolean isDead() {
    return fDead;
  }

  float getRadius() {
    return fweight/2;
  }


  void changeDirection() {
    if (random(floor(fmaxAge - fage)) == 0)
      fDead = true;

    if (fDead == false) {
      PVmove.mult(-1);
    }
  }

  boolean hasCollision(Tankable t) {
    return t.getRadius()+this.getRadius()>dist(this.getX(), this.getY(), t.getX(), t.getY());
  }

  void update() {
    move();
    show();
  }

  void show() {
    display();
  }

  void setVector(float x, float y) {
    PVmove.set(x, y);
  }

  PVector getVector() {
    return PVmove;
  }

  void setbabynumber()
  {

    fcanHaveBaby = false;
  }
  abstract boolean tryToEat(Tankable t);
}