abstract class pellets implements Tankable
{
  protected float psize;
  protected PVector vector=new PVector(0, 0);
  protected  PVector PVposition = new PVector(0, 0);

  pellets(float x, float y, float size)
  {
    PVposition.x = x;
    PVposition.y = y;
    psize = size;
    vector.set(0, random(.5, 2));
  }

  void display()
  {
    update();
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

  boolean isDead() {
    if (PVposition.y>height)
      return true;
    return false;
  }

  float getsize()
  {
    return(psize / 2);
  }
  float getRadius()
  {
    return(psize / 2);
  }



  void changeDirection() {
  }

  boolean hasCollision(Tankable t) {
    return t.getRadius()+this.getRadius()>dist(this.getX(), this.getY(), t.getX(), t.getY());
  }

  void move() {
    PVposition.y+= vector.y;
  }

  void update() {
    resetMatrix();
    this.move();
    this.show();
  }

  abstract float effect();

  abstract void show();
}