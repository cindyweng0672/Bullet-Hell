class EnemyBullet extends GameObject {
  boolean isBossMode;
  color c;
  EnemyBullet(float x, float y, float vx, float vy, color colour, boolean bossMode) {
    super(x, y, vx, vy, 10, colour, 1);
    if (bossMode) {
    }
    isBossMode=bossMode;
    c=colour;
  }

  void show() {
    if (!isBossMode) {
      super.show();
    }
    if (isBossMode) {
      noStroke();
      fill(c);
      square(x-30, y, size);
      square(x+30, y, size);
    }
  }
}
