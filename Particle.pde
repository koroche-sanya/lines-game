class Particle {
  vec2 pos;
  float s;
  float maxSize;
  float lifetime;
  float startTime;
  vec2 speed;
  int   particleColor;
  Shape shape;

  Particle (vec2 pos, float maxSize, float lifetime, vec2 acceleration, int col, Shape shape) {
    this.pos = pos;
    this.maxSize = maxSize;
    this.speed = acceleration;

    this.lifetime = lifetime;
    this.startTime = getTime();

    this.particleColor = col;
    this.shape = shape;

    if (shape == null) {
      exception("Exception has been occured", "Class: Particle\n Error: No shape founded in Particle class");
    }
  }

  void update() {
    pos.add(speed);
    s = map(getTime() - startTime, lifetime, 0, 0, maxSize);
  }

  void draw() {
    shape.draw(pos.x, pos.y, s, particleColor);
  }

  boolean isOut() {
    return s < 0;
  }
}
