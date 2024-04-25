class Level {
  ParticleSystem particle;
  Line line;
  Target target;

  Level () {
    particle = new ParticleSystem(ParticleSettings.getFloat("lifetime"), ParticleSettings.getFloat("size"));
    line = new Line();
    target = new Target();
  }

  void draw() {
    boolean toplayerline = LinesSettings.getBoolean("toplayer");
    if (!toplayerline) {
      line.draw();
    }
    strokeWeight(0);
    if (TargetSettings.getBoolean("enable")) {
      if (target != null) {
        target.draw();
        if (target.isOut()) {
          target.killed = true;
          if (!scoreflag) {
            score++;
            scoreflag = true;
            explosionSound.rewind();
            explosionSound.play();
          }
        }
        if (target.isFullyOut()) {
          target = new Target();
          if (scoreflag) {
            scoreflag = false;
          }
        }
      }
    }
    noStroke();
    particle.draw();
    if (toplayerline) {
      line.draw();
    }
  }
}
