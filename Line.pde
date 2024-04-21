class Line {
  ArrayList<LinePart> lines;
  
  Line () {
    lines = new ArrayList<>();
  }
  
  void draw() {
    for (int i = 0; i < lines.size(); i++) {
      LinePart line = lines.get(i);
      line.draw();
      if (line.isOut()) {
        lines.remove(i);
      }
    }
  }
  
  void add(LinePart line) {
    lines.add(line);
  }
}

class LinePart {
  float x1, y1, x2, y2, lifetime, starttime, alpha;
  
  LinePart(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.starttime = getTime();
    this.lifetime = LinesSettings.getFloat("lifetime");
    this.alpha = 255;
  }
  
  void draw() {
    alpha = map(getTime() - starttime, 0, lifetime, 255, 0);
    JSONArray colarr = LinesSettings.getJSONArray("strokecolor");
    int[] col = new int[3];
  
    if (colarr.size() != 3) {
      exception("Exception has been occured", "Class: Line.<func>draw\n Error: Field \"strokecolor\" in \"lines.json\" doesn't match size.\n      Required: size 3 (r, g, b)");
    }
  
    for (int i = 0; i < colarr.size(); i++) {
      col[i] = colarr.getInt(i);
    }
    stroke(col[0], col[1], col[2], alpha);
    line(x1, y1, x2, y2);
  }
  
  boolean isOut() {
    return alpha <= 0;
  }
}
