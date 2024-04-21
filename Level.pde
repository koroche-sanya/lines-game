class Level {
  ParticleSystem particle;
  Line line;
  
  Level () {
    particle = new ParticleSystem(2, 50);
    line = new Line();
  }
  
  void draw() {
    strokeWeight(0);
    particle.draw();
    strokeWeight(LinesSettings.getFloat("strokeweight"));
    line.draw();
  }
}
