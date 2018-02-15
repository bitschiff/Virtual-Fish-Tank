class poison extends pellets
{
  poison(float x, float y, float size)
  {
    super(x, y, size);
  }

  poison() {
    super(random(600) + 1, random(600) + 1, random(10) + 2);
  }

  void show() {
    fill(255, 0, 0);
    ellipse(PVposition.x, PVposition.y, psize, psize);
  }

  float effect() {
    return (this.getRadius()*(-1));
  }
}