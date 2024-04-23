Main parent = this;

Level level;

boolean debug = false;

vec2 mouse;
vec2 pmouse;

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
    vec2 tmouse = new vec2(mouseX, mouseY);
    if (pmouse == null) {
      pmouse = tmouse;
    } else {
      pmouse = mouse;
    }
    mouse = tmouse;
    mouse.x = int(mouseX + LineControlSettings.getJSONObject("offset").getFloat("x"));
    mouse.y = int(mouseY + LineControlSettings.getJSONObject("offset").getFloat("y"));
    if (mousePressed) {

      LinePart linepart = new LinePart(pmouse, mouse);
      level.line.add(linepart);
      level.particle.pos = mouse.copy();
      vec2 accel = vec2.sub(mouse, pmouse);
      accel.mult(new vec2(LineControlSettings.getFloat("acceleration")));
      for (int i = 0; i < ParticleSettings.getInt("spawncount"); i++)
        level.particle.spawn(accel.x, accel.y);
    }
    level.draw();
  }
  catch (Exception e) {
    exception("Exception has been occured", "Class: Main.<func>draw\n Error: " + addlines(e.getMessage(), 50));
  }
}
