Main parent = this;

Level level;

boolean debug = false;

int mx, my;
int pmx = -1, pmy = -1;

void settings() {
  size(500, 500, P2D);
  PJOGL.setIcon("assets\\logo\\logo.png");
}

void setup() {
  try {
    surface.setSize(500, 500);
    surface.setLocation(displayWidth / 2 - width / 2, displayHeight / 2 - height / 2);
    surface.setResizable(true);
    surface.setTitle("Lines");

    loadAll();
    debug = GeneralSettings.getBoolean("debug");

    level = new Level();
    
    if (debug) {
      DebugWindow debugwin = new DebugWindow();
      parent.runSketch(new String[]{""}, debugwin);
    }
  }
  catch (Exception e) {
    exception("Exception has been occured", "Class: Main.<func>setup\n Error: " + addlines(e.getMessage(), 50));
  }
}

void draw() {
  try {
    background(255);
    if (mousePressed) {
      pmx = (pmx == -1 ? mouseX : mx);
      pmy = my;
      mx = mouseX + LineControlSettings.getJSONObject("offset").getFloat("x");
      my = mouseY + LineControlSettings.getJSONObject("offset").getFloat("y");
      
      LinePart linepart = new LinePart(pmx, pmy, mx, my);
      level.line.add(linepart);
      level.particle.x = mx;
      level.particle.y = my;
      float accelX = mx - pmx;
      float accelY = my - pmy;
      accelX *= LineControlSettings.getFloat("acceleration");
      accelY *= LineControlSettings.getFloat("acceleration");
      for (int i = 0; i < ParticleSettings.getInt("spawncount"); i++)
        level.particle.spawn(accelX, accelY);
    }
    level.draw();
  }
  catch (Exception e) {
    exception("Exception has been occured", "Class: Main.<func>draw\n Error: " + addlines(e.getMessage(), 50));
  }
}
