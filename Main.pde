Main parent = this;

ParticleSystem particleSystem;

void setup() {
  size(500, 500);
  loadAll();
  
  exception("e", "a");

  surface.setSize(500, 500);
  surface.setIcon(logo);

  particleSystem = new ParticleSystem(ParticleSettings.getFloat("lifetime"), ParticleSettings.getInt("size"));
}

void draw() {
  background(0);
  if (mousePressed) {
    particleSystem.x = mouseX;
    particleSystem.y = mouseY;
    float accelX = mouseX-pmouseX;
    float accelY = mouseY-pmouseY;
    accelX /= 10;
    accelY /= 10;
    particleSystem.spawn(accelX, accelY);
  }
  noStroke();
  particleSystem.draw();
}
