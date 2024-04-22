class Level {
  ParticleSystem particle;
  Line line;

  Level () {
    particle = new ParticleSystem(ParticleSettings.getFloat("lifetime"), ParticleSettings.getFloat("size"));
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
