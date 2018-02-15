class food extends pellets
{
  food(float x, float y, float size)
  {
    super(x, y, size);
  }

  void show() {
    fill(0, 255, 0);
    ellipse(PVposition.x, PVposition.y, psize, psize);
  }

  float effect() {
    return this.getRadius();
  }
}