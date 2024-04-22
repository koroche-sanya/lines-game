Main parent = this;

Level level;

boolean debug = false;

void settings() {
  size(500, 500, P2D);
  PJOGL.setIcon("assets\\logo\\logo.png");
}

void setup() {
  try {
    surface.setSize(500, 500);
    surface.setLocation(displayWidth / 2 - width / 2, displayHeight / 2 - height / 2);
    surface.setResizable(true);

    loadAll();
    debug = GeneralSettings.getBoolean("debug");

    level = new Level();
  }
  catch (Exception e) {
    exception("Exception has been occured", "Class: Main.<func>setup\n Error: " + addlines(e.getMessage(), 50));
  }
}

void draw() {
  try {
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
      for (int i = 0; i < ParticleSettings.getInt("spawncount"); i++)
        level.particle.spawn(accelX, accelY);
    }
    level.draw();
  }
  catch (Exception e) {
    exception("Exception has been occured", "Class: Main.<func>draw\n Error: " + addlines(e.getMessage(), 50));
  }
}
