void keyPressed() {
  int key = keyCode;
  if (key == F11) {
    SwingUtilities.invokeLater(() -> {
      GLWindow glw = getGLWindow(getSurface());
      glw.setFullscreen(!glw.isFullscreen());
    }
    );
  } else if (charEquals((char)key, 'r')) {
    level = new Level();
  } else if (charEquals((char)key, 'j') && debug) {
    loadAll();
  }
}
