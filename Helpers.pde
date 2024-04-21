float getTime() {
  return millis()/1000.;
}

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

int grayscale(color in) {
  return (int)(red(in) + green(in) + blue(in)) / 3;
}

float randomNegative(float a) {
  return random(-a, a);
}

void stop_task() {
  for(;;) {
    delay(100000);
  }
}
