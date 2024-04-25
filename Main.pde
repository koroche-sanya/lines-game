Main parent = this;

Level level;

boolean debug = false;

int mousex, mousey;
int pmousex = -1, pmousey = -1;

int score = 0;
boolean scoreflag = false;

float mouseStoppedTime = -1;

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

    textMode(SHAPE);
    rectMode(CENTER);

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
    pmousex = (pmousex == -1 ? mouseX : mousex);
    pmousey = mousey;
    mousex = (int)(mouseX + LineControlSettings.getJSONObject("offset").getFloat("x"));
    mousey = (int)(mouseY + LineControlSettings.getJSONObject("offset").getFloat("y"));
    if (mousePressed) {

      LinePart linepart = new LinePart(pmousex, pmousey, mousex, mousey);
      level.line.add(linepart);
      level.particle.x = mousex;
      level.particle.y = mousey;
      float accelX = mousex - pmousex;
      float accelY = mousey - pmousey;
      accelX *= LineControlSettings.getFloat("acceleration");
      accelY *= LineControlSettings.getFloat("acceleration");
      for (int i = 0; i < ParticleSettings.getInt("spawncount"); i++)
        level.particle.spawn(accelX, accelY);
    }
    level.draw();

    if (TargetSettings.getBoolean("enable")) {
      JSONArray colarr = ScoreSettings.getJSONObject("rect").getJSONArray("color");
      int[] col = new int[4];

      if (colarr.size() != 4) {
        exception("Exception has been occured", "Class: Main.<func>draw\n Error: Field \"color\" in \"rect\" in \"score.json\" doesn't match size.\n      Required: size 4 (r, g, b, a)");
      }

      for (int i = 0; i < colarr.size(); i++) {
        col[i] = colarr.getInt(i);
      }

      int yoffset = ScoreSettings.getInt("yoffset");

      textFont(SpaceMonoFont);
      textSize(ScoreSettings.getInt("fontSize"));
      textAlign(CENTER, CENTER);
      noStroke();
      fill(col[0], col[1], col[2], col[3]);
      rect(width /2, yoffset, textWidth(String.valueOf(score)) + 30, textAscent() + textDescent() + 5, 5);

      colarr = ScoreSettings.getJSONObject("text").getJSONArray("color");
      col = new int[3];

      if (colarr.size() != 3) {
        exception("Exception has been occured", "Class: Main.<func>draw\n Error: Field \"color\" in \"text\" in \"score.json\" doesn't match size.\n      Required: size 3 (r, g, b)");
      }

      for (int i = 0; i < colarr.size(); i++) {
        col[i] = colarr.getInt(i);
      }

      fill(col[0], col[1], col[2]);
      text(score, width / 2, yoffset);
    }
  }
  catch (Exception e) {
    exception("Exception has been occured", "Class: Main.<func>draw\n Error: " + addlines(e.getMessage(), 50));
  }
}

void mouseDragged() {
  drawingSound.play();
}

void mouseReleased() {
  drawingSound.pause();
}

void exit() {
  drawingSound.close();
  explosionSound.close();
  getSurface().stopThread();
  super.exit();
}
