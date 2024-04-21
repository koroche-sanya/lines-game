PImage logo;

PFont exceptionWindowFont;

JSONObject ExceptionWindowSettings;
JSONObject BackgroundGeneratorSettings;
JSONObject ParticleSettings;
JSONObject LinesSettings;

void loadAll() {
  logo = loadImage("assets\\logo\\logo.png");

  exceptionWindowFont = createFont("assets\\fonts\\SpaceMono-Regular.otf", 12);
  
  boolean loadingsettings = false;
  try {
    ParticleSettings = loadJSONObject("assets\\scripts\\particles.json");
    LinesSettings = loadJSONObject("assets\\scripts\\lines.json");
    loadingsettings = true;
    ExceptionWindowSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\exceptionwindow.json");
    BackgroundGeneratorSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\background.json");
  } catch (Exception e) {
    exceptionmulti("Exception has been occured", "Class: Main.<func>loadAll\n Info: Loading JSON Objects\n Error: Parsing JSON Exception\n Error message: " + e.getMessage(), !loadingsettings);
  }
}
