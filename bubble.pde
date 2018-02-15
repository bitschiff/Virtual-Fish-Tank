class bubble implements Tankable
{
  protected  PVector PVposition = new PVector(0, 0);
  protected  PVector PVmove = new PVector(0, 0);
  protected float Bsize;

  bubble(float x, float y)
  {
    PVposition.x = x;
    PVposition.y = y;

    PVmove.y = (randomGaussian() * (.25*3))+3;
    Bsize = (randomGaussian() * (.25*10))+10;
  }

  void displayBubbles()
  {
    if (this.isDead()==false) {
      resetMatrix();
      noFill();
      stroke(150, 150, 255);
      ellipse(PVposition.x, PVposition.y, Bsize, Bsize);
      PVposition.y -= PVmove.y;

      if (floor(random(2)) == 1)
        PVposition.x--;
      else
        PVposition.x++;


      stroke(0, 0, 0);
    }
  }

  float getX() {
    return PVposition.x;
  }

  float getY() {
    return PVposition.y;
  }

  boolean isDead() {
    if (PVposition.y<0||PVposition.y>height)
      return true;
    if (PVposition.y < 1 || PVposition.x < 1 || PVposition.x > 600)
      return true;
    return false;
  }


  float getRadius() {
    return Bsize/2;
  }

  boolean hasCollision(Tankable t) {
    return t.getRadius()+this.getRadius()<dist(this.getX(), this.getY(), t.getX(), t.getY());
  }

  void changeDirection() {
  }

  void update() {
    displayBubbles();
  }
}