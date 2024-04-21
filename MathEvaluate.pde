public static float eval(final String str) {
  return new Object() {
    int pos = -1, ch;

    void nextChar() {
      ch = (++pos < str.length()) ? str.charAt(pos) : -1;
    }

    boolean eat(int charToEat) {
      while (ch == ' ') nextChar();
      if (ch == charToEat) {
        nextChar();
        return true;
      }
      return false;
    }

    float parse() {
      nextChar();
      float x = parseExpression();
      if (pos < str.length()) throw new RuntimeException("Unexpected: " + (char)ch);
      return x;
    }

    float parseExpression() {
      float x = parseTerm();
      for (;; ) {
        if      (eat('+')) x += parseTerm();
        else if (eat('-')) x -= parseTerm();
        else return x;
      }
    }

    float parseTerm() {
      float x = parseFactor();
      for (;; ) {
        if      (eat('*')) x *= parseFactor();
        else if (eat('/')) x /= parseFactor();
        else return x;
      }
    }

    float parseFactor() {
      if (eat('+')) return +parseFactor();
      if (eat('-')) return -parseFactor();

      float x;
      int startPos = this.pos;
      if (eat('(')) {
        x = parseExpression();
        if (!eat(')')) throw new RuntimeException("Missing ')'");
      } else if ((ch >= '0' && ch <= '9') || ch == '.') {
        while ((ch >= '0' && ch <= '9') || ch == '.') nextChar();
        x = Float.parseFloat(str.substring(startPos, this.pos));
      } else if (ch >= 'a' && ch <= 'z') {
        while (ch >= 'a' && ch <= 'z') nextChar();
        String func = str.substring(startPos, this.pos);
        if (eat('(')) {
          x = parseExpression();
          if (!eat(')')) throw new RuntimeException("Missing ')' after argument to " + func);
        } else {
          x = parseFactor();
        }
        if (func.equals("sqrt")) x = sqrt(x);
        else if (func.equals("sin")) x = sin(x);
        else if (func.equals("cos")) x = cos(x);
        else if (func.equals("tan")) x = tan(x);
        else if (func.equals("lerp")) x = lerp(x, parseFactor(), parseFactor());
        else throw new RuntimeException("Unknown function: " + func);
      } else {
        throw new RuntimeException("Unexpected: " + (char)ch);
      }

      if (eat('^')) x = pow(x, parseFactor());

      return x;
    }
  }
  .parse();
}
