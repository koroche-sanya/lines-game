PImage logo;
PImage debuglogo;

PFont SpaceMonoFont;

JSONObject GeneralSettings;
JSONObject LineControlSettings;
JSONObject ExceptionWindowSettings;
JSONObject DebugWindowSettings;
JSONObject BackgroundGeneratorSettings;
JSONObject ParticleSettings;
JSONObject LinesSettings;
JSONObject TargetSettings;
JSONObject ScoreSettings;

void loadAll() {
  boolean loadingsettings = false;
  try {
    logo = loadImage("assets\\logo\\logo.png");
    debuglogo = loadImage("assets\\logo\\debug.png");

    SpaceMonoFont = createFont("assets\\fonts\\SpaceMono-Regular.otf", 12);

    ParticleSettings = loadJSONObject("assets\\scripts\\particles.json");
    LinesSettings = loadJSONObject("assets\\scripts\\lines.json");
    TargetSettings = loadJSONObject("assets\\scripts\\target.json");
    ScoreSettings = loadJSONObject("assets\\scripts\\score.json");
    LineControlSettings = loadJSONObject("assets\\scripts\\linecontrol.json");
    GeneralSettings = loadJSONObject("assets\\scripts\\general.json");
    loadingsettings = true;
    ExceptionWindowSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\exceptionwindow.json");
    DebugWindowSettings = loadJSONObject("assets\\scripts\\debugwindow\\debugwindow.json");
    BackgroundGeneratorSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\background.json");
  }
  catch (Exception e) {
    exceptionmulti("Exception has been occured", "Class: Main.<func>loadAll\n Error: " + addlines(e.getMessage(), 30), loadingsettings);
  }
}
