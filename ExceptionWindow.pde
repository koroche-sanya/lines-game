class ExceptionWindow extends PApplet {
  String title, message;
  int fontSize;
  int width_, height_;
  PImage bg;
  boolean enablebg = true;

  ExceptionWindow (String title, String message, boolean bg) {
    this.title = title;
    this.message = message;
    parent.runSketch(new String[]{""}, this);
    enablebg = bg;
  }

  void setup() {
    if (ExceptionWindowSettings != null) {
      fontSize = ExceptionWindowSettings.getJSONObject("messageText").getInt("fontSize");
    } else {
      fontSize = 16;
    }
    PFont font = SpaceMonoFont;
    textFont(font);
    textSize(fontSize);

    float textWidth = textWidth(message);
    float textHeight = textAscent() + textDescent();

    width_ = max(250, (int) (textWidth + 20));
    height_ = max(250, (int) (textHeight * message.split("\n").length + 20));

    surface.setTitle(title);
    surface.setSize(width_, height_);
    surface.setIcon(logo);
    surface.setLocation(displayWidth / 2 - width_ / 2, displayHeight / 2 - height_ / 2);

    if (enablebg) {
      bg = getBackgroundForExceptionWindow(width_, height_);
    }
  }

  void draw() {
    background(0);
    if (enablebg) {
      image(bg, 0, 0);
    }
    fill(255);
    textAlign(LEFT, TOP);

    text(message, 10, 10, width_ - 10, height_ - 10);
  }

  void exit() {
    parent.getSurface().stopThread();
    parent.exit();
    super.exit();
  }
}

void exception(String title, String message) {
  ExceptionWindow exceptionWindow = new ExceptionWindow(title, message, true);
  parent.getSurface().setVisible(false);
  stop_task();
}

void exceptionclear(String title, String message) {
  ExceptionWindow exceptionWindow = new ExceptionWindow(title, message, false);
  parent.getSurface().setVisible(false);
  stop_task();
}

void exceptionmulti(String title, String message, boolean bg) {
  ExceptionWindow exceptionWindow = new ExceptionWindow(title, message, bg);
  parent.getSurface().setVisible(false);
  stop_task();
}

void exceptioneasy(String message, boolean bg) {
  exceptionmulti("Exception has been occured", message, bg);
}

String constructMessage(String classname, String error) {
  return "Class: " + classname + "\n Error:" + error;
}
