class Particle {
  float x, y, s;
  float maxSize;
  float lifetime;
  float startTime;
  float speedX, speedY;
  int   particleColor;
  Shape shape;

  Particle (float x, float y, float maxSize, float lifetime, float accelerationX, float accelerationY, int col, Shape shape) {
    this.x = x;
    this.y = y;
    this.maxSize = maxSize;
    this.speedX = accelerationX;
    this.speedY = accelerationY;

    this.lifetime = lifetime;
    this.startTime = getTime();

    this.particleColor = col;
    this.shape = shape;

    if (shape == null) {
      exception("Exception has been occured", "Class: Particle\n Error: No shape founded in Particle class");
    }
  }

  void update() {
    x += speedX;
    y += speedY;
    s = map(getTime() - startTime, lifetime, 0, 0, maxSize);
  }

  void draw() {
    shape.draw(x, y, s, particleColor);
  }

  boolean isOut() {
    return s < 0;
  }
}
