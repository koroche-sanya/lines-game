class DebugWindow extends PApplet {
  void setup() {
    surface.setSize(300, 200);
    surface.setTitle("Debug");
    surface.setIcon(debuglogo);
  }

  void draw() {
    GLWindow glw = getGLWindow(parent.getSurface());
    int tarx = glw.getLocationOnScreen(new Point(0, 0)).getX() + parent.width;
    int tary = glw.getLocationOnScreen(new Point(0, 0)).getY();
    surface.setLocation(tarx, tary);
    background(0);
    grid_romb(g, width, height);
    PFont font = SpaceMonoFont;
    float fontSize = DebugWindowSettings.getFloat("fontsize");
    textFont(font);
    textSize(fontSize);
    fill(255);
    textAlign(LEFT, TOP);

    Runtime runtime = Runtime.getRuntime();
    long totalmemory = runtime.totalMemory();
    long availablememory = runtime.freeMemory();
    long usedmemory = totalmemory - availablememory;
    float usedmemmb = usedmemory / 1000000.;

    Level level = parent.level;
    int particlescount = level.particle.particles.size();
    int linescount = level.line.lines.size();

    String text = (DebugWindowSettings.getJSONObject("show").getBoolean("memory") ? "Memory: " + (int)usedmemmb + " MB\n" : "") +
      (DebugWindowSettings.getJSONObject("show").getBoolean("particlescount") ? "Particles count: " + particlescount + "\n" : "") +
      (DebugWindowSettings.getJSONObject("show").getBoolean("linescount") ? "Lines count: " + linescount + "\n" : "");
    
    float textHeight = textAscent() + textDescent();
    float textWidth = max(300, textWidth(text) + 80);
    textHeight = max(200, textHeight * text.split("\n").length * 2);
    
    surface.setSize((int)textWidth, (int)textHeight);
    
    text(text, 5, textAscent() + textDescent());
    surface.setTitle("Debug   [FPS: " + (int)parent.frameRate + "]");
  }

  void exit() {
    getJFrame(getSurface()).dispose();
  }
}
