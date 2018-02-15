public interface Tankable {
  void update();
  boolean hasCollision(Tankable t);
  float getX();
  float getY();
  float getRadius();
  void changeDirection();
  boolean isDead();
}