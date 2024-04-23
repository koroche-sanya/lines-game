class Target {
  float x, y, px, py, s, maxsize;
  float speedx, speedy;
  float alpha, alphasize;
  boolean killed;
  ParticleSystem particles;
  
  final JSONObject particless = TargetSettings.getJSONObject("particles");
  final JSONObject point = TargetSettings.getJSONObject("point");
  final JSONObject interpolate = TargetSettings.getJSONObject("interpolate");

  Target() {
    this.x = random(width);
    this.y = random(height);
    this.maxsize = point.getInt("sizenormal");
    this.alpha = interpolate.getFloat("speed");
    this.alphasize = interpolate.getFloat("size");
    particles = new ParticleSystem(particless.getFloat("lifetime"), particless.getFloat("size"));
  }

  void draw() {
    px = x;
    py = y;
    
    s = lerp(s, maxsize, alphasize);

    float randomx = randomNegative(particless.getInt("random"));
    float randomy = randomNegative(particless.getInt("random"));
    speedx = lerp(speedx, randomx, alpha);
    speedy = lerp(speedy, randomy, alpha);

    particles.x = x;
    particles.y = y;
    if (!killed)
      particles.spawn(new TargetShape(), x - px, y - py);
    particles.draw();

    if (!killed) {
      x += speedx;
      y += speedy;

      x = (x) % (width + s/2);
      y = (y) % (height + s/2);

      if (x < -s/2) {
        x = width + s/2;
      }
      if (y < -s/2) {
        y = height + s/2;
      }

      noStroke();
      fill(0, map(s, 0, maxsize, 0, 255));
      ellipse(x, y, s, s);
    } else {
      maxsize = point.getInt("sizekillset");
      noStroke();
      fill(0, map(s, point.getInt("sizenormal"), point.getInt("sizekillrequired"), 255, 0));
      ellipse(x, y, s*=1.1, s);
    }
  }

  boolean isOut() {
    return mousePressed && dist(parent.mousex, parent.mousey, x, y) < s/2;
  }

  boolean isFullyOut() {
    return particles.particles.size() <= 0 && s > 500;
  }
}
