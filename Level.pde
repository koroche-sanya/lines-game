class Level {
  ArrayList<ParticleSystem> particles;
  ArrayList<Line> lines;
  
  Level () {
    particles = new ArrayList<>();
    lines = new ArrayList<>();
  }
  
  void draw() {
    for (ParticleSystem particlesys : particles) {
      particlesys.draw();
    }
    for (Line line : lines) {
      line.draw();
    }
  }
}
