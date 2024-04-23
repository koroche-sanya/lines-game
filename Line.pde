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
  float lifetime, starttime, weight;
  vec2 start, end;

  LinePart(vec2 start, vec2 end) {
    this.start = start;
    this.end = end;
    this.starttime = getTime();
    this.lifetime = LinesSettings.getFloat("lifetime");
    this.weight = LinesSettings.getFloat("strokeweight");
  }

  void draw() {
    weight = map(getTime() - starttime, 0, lifetime, LinesSettings.getFloat("strokeweight"), 0);
    JSONArray colarr = LinesSettings.getJSONArray("strokecolor");
    int[] col = new int[3];

    if (colarr.size() != 3) {
      exception("Exception has been occured", "Class: Line.<func>draw\n Error: Field \"strokecolor\" in \"lines.json\" doesn't match size.\n      Required: size 3 (r, g, b)");
    }

    for (int i = 0; i < colarr.size(); i++) {
      col[i] = colarr.getInt(i);
    }
    strokeWeight(max(0, weight));
    stroke(col[0], col[1], col[2]);
    line(start.x, start.y, end.x, end.y);
  }

  boolean isOut() {
    return weight <= 0;
  }
}
