class Level {
  ParticleSystem particle;
  Line line;

  Level () {
    particle = new ParticleSystem(2, 50);
    line = new Line();
  }

  void draw() {
    boolean toplayerline = LinesSettings.getBoolean("toplayer");
    if (!toplayerline) {
      line.draw();
    }
    strokeWeight(0);
    particle.draw();
    if (toplayerline) {
      line.draw();
    }
  }
}
