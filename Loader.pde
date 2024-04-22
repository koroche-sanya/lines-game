PImage logo;

PFont SpaceMonoFont;

JSONObject GeneralSettings;
JSONObject LineControlSettings;
JSONObject ExceptionWindowSettings;
JSONObject DebugWindowSettings;
JSONObject BackgroundGeneratorSettings;
JSONObject ParticleSettings;
JSONObject LinesSettings;

void loadAll() {
  logo = loadImage("assets\\logo\\logo.png");

  SpaceMonoFont = createFont("assets\\fonts\\SpaceMono-Regular.otf", 12);

  boolean loadingsettings = false;
  try {
    ParticleSettings = loadJSONObject("assets\\scripts\\particles.json");
    LinesSettings = loadJSONObject("assets\\scripts\\lines.json");
    LineControlSettings = loadJSONObject("assets\\scripts\\linecontrol.json");
    GeneralSettings = loadJSONObject("assets\\scripts\\general.json");
    loadingsettings = true;
    ExceptionWindowSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\exceptionwindow.json");
    DebugWindowSettings = loadJSONObject("assets\\scripts\\debugwindow\\debugwindow.json");
    BackgroundGeneratorSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\background.json");
  }
  catch (Exception e) {
    exceptionmulti("Exception has been occured", "Class: Main.<func>loadAll\n Error: " + addlines(e.getMessage(), 30), !loadingsettings);
  }
}
