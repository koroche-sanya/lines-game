class ParticleSystem {
  vec2 pos;
  float lifetime = 5;
  float size = 50;
  ArrayList<Particle> particles;

  ParticleSystem(float lifetime, float size) {
    this.lifetime = lifetime;
    this.size = size;
    particles = new ArrayList<>();

    if (lifetime < 0) {
      exception("Exception has been occured", "Class: ParticleSystem\n Error: Lifetime cannot be less than 0");
    }
  }

  void spawn(float accelerationX, float accelerationY) {
    Shape shape = new Ellipse();
    switch (ParticleSettings.getString("shape")) {
    case "rect":
      shape = new Rect();
      break;
    case "ellipse":
      shape = new Ellipse();
      break;
    default:
      exception("Exception has been occured", "Class: ParticleSystem\n Error: Unknown shape founded in the \"particles.json\"");
    }
    particles.add(new Particle(pos, size, lifetime, new vec2(accelerationX + randomNegative(2), accelerationY + randomNegative(2)), addAlpha(getRandomColor(), ParticleSettings.getInt("alpha")), shape));
  }

  void draw() {
    for (int i = 0; i < particles.size(); i++) {
      Particle particle = particles.get(i);
      particle.update();
      particle.draw();

      if (particle.isOut()) {
        particles.remove(i);
      }
    }
  }
}
