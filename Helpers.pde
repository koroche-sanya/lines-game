// Time
float getTime() {
  return millis()/1000.;
}

// Colors
int getRandomColor() {
  return color(random(255), random(255), random(255));
}

int getMonoRandomColor() {
  return color(random(255));
}

int getSmartRandomColor(int min, int max) {
  color c = getRandomColor();

  while (!(grayscale(c) > min && grayscale(c) < max)) {
    c = getRandomColor();
  }

  return c;
}

int addAlpha(int col, int alpha) {
  return color(red(col), green(col), blue(col), alpha);
}

int grayscale(color in) {
  return (int)(red(in) + green(in) + blue(in)) / 3;
}

// Random

float randomNegative(float a) {
  return random(-a, a);
}

// GLWindow

GLWindow getGLWindow(PSurface surface) {
  return (GLWindow)surface.getNative();
}

// JFrame

JFrame getJFrame(PSurface surface) {
  PSurfaceAWT.SmoothCanvas canvas = (PSurfaceAWT.SmoothCanvas)surface.getNative();
  JFrame frame = (JFrame)canvas.getFrame();
  return frame;
}

// String

String addlines(String input, int charsperline) {
  StringBuilder out = new StringBuilder();
  int counter = 0;
  
  for (int i = 0; i < input.length(); i++) {
    out = out.append(input.charAt(i));
    counter++;
    if (counter > charsperline && input.charAt(i)==' ') {
      counter = 0;
      out = out.append("\n");
    }
  }
  
  return out.toString();
}

////

boolean charEquals(char a, char b) {
  return String.valueOf(a).equalsIgnoreCase(String.valueOf(b));
}

void stop_task() {
  for (;; ) {
    delay(100000);
  }
}
