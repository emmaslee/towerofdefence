//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d;
  float hp, maxhp;
  int value;
  float speed;
  float fillColour;
  
  
  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
   maxhp = 3 + waveNumber/2;
    value = 1;
    hp = 3;
  }

  void show() {
    fill(purple);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }
void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-10, y-(d+10)-2, 40, 24);//background  //x-27
    fill(purple);
    rectMode(CENTER);
}

  void act() {
    x = x + vx; //vy*speed
    y = y+ vy;

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
    
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if ( dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp -1;
        myBullet.hp = myBullet.hp - 1;
      }
      i++;
    }
  }
  


}
