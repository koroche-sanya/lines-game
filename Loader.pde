PImage logo;

PFont exceptionWindowFont;

JSONObject ExceptionWindowSettings;
JSONObject ParticleSettings;
JSONObject BackgroundGeneratorSettings;

void loadAll() {
  logo = loadImage("assets\\logo\\logo.png");

  exceptionWindowFont = createFont("assets\\fonts\\SpaceMono-Regular.otf", 12);

  ExceptionWindowSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\exceptionwindow.json");
  ParticleSettings = loadJSONObject("assets\\scripts\\particles.json");
  BackgroundGeneratorSettings = loadJSONObject("assets\\scripts\\exceptionwindow\\background.json");
}
