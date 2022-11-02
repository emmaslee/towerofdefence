class Mob {
  float x, y, vx, vy;
  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
  }

  void show() {
    fill(purple);
    strokeWeight(3);
    circle(x, y, 40);
  }

  void act() {
    x = x + vx;
    y = y+ vy;

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
  }
}
