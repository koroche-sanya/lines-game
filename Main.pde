Main parent = this;

Level level;

void setup() {
  size(500, 500);
  loadAll();

  surface.setSize(500, 500);
  surface.setIcon(logo);
  
  level = new Level();
}

void draw() {
  background(255);
  if (mousePressed) {
    LinePart linepart = new LinePart(pmouseX, pmouseY, mouseX, mouseY);
    level.line.add(linepart);
    level.particle.x = mouseX;
    level.particle.y = mouseY;
    float accelX = mouseX - pmouseX;
    float accelY = mouseY - pmouseY;
    accelX /= 10;
    accelY /= 10;
    level.particle.spawn(accelX, accelY);
  }
  level.draw();
}
