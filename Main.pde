Main parent = this;

Level level;

void setup() {
  size(500, 500);
  loadAll();

  surface.setSize(500, 500);
  surface.setIcon(logo);
}

void draw() {
  background(0);
  if (mousePressed) {
    LinePart linepart = new LinePart(pmouseX, pmouseY, mouseX, mouseY);
    
  }
  noStroke();
  particleSystem.draw();
}
