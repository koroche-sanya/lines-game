class vec2 {
  float x, y;
  
  vec2 (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  vec2 (float x) {
    this(x, x);
  }
  
  vec2(vec2 xy) {
    this(xy.x, xy.y);
  }
  
  static vec2 add(vec2 a, vec2 b) {
    return new vec2(a.x + b.x, a.y + b.y);
  }
  
  static vec2 sub(vec2 a, vec2 b) {
    return new vec2(a.x - b.x, a.y - b.y);
  }
  
  static vec2 mult(vec2 a, vec2 b) {
    return new vec2(a.x * b.x, a.y * b.y);
  }
  
  static vec2 div(vec2 a, vec2 b) {
    return new vec2(a.x / b.x, a.y / b.y);
  }
  
  void add(vec2 b) {
    assign(add(this, b));
  }
  
  void sub(vec2 b) {
    assign(sub(this, b));
  }
  
  void mult(vec2 b) {
    assign(mult(this, b));
  }
  
  void div(vec2 b) {
    assign(div(this, b));
  }
  
  void assign(vec2 in) {
    this.x = in.x;
    this.y = in.y;
  }
  
  vec2 copy() {
    return new vec2(x, y);
  }
}
