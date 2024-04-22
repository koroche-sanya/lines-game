class Button extends Component {
  String title;

  Button (float x, float y, float sizex, float sizey, String title) {
    super(x, y, sizex, sizey);
    this.title = title;
  }

  Button (float x, float y, String title) {
    this(x, y, 50, 50, title);
    float textHeight = textAscent() + textDescent() + 10;
    float textWidth = textWidth(title) + 30;
    sizex = textWidth;
    sizey = textHeight;
  }

  @Override
    void draw() {
      
  }
}

abstract class Component {
  float x, y, sizex, sizey;

  Component (float x, float y, float sizex, float sizey) {
    this.x = x;
    this.y = y;
    this.sizex = sizex;
    this.sizey = sizey;
  }

  Component (float x, float y) {
    this(x, y, 50, 50);
  }

  abstract void draw();

  boolean hovered() {
    return (collision(x, y, sizex, sizey, mouseX, mouseY));
  }

  boolean pressed() {
    return hovered() && mousePressed;
  }
}

boolean collision(float x, float y, float w, float h, float px, float py) {
  return x > px && y > py && px < x + w && py < y + h;
}
