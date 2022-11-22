//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  
  //tower modes
  final int PLACING = 0;
  final int PLACED = 1;
  
  //tower data
  float x, y;
  int cooldown, threshold;
  int towerMode;
  int towerType;
  
    Tower(int type) {
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold = 30;
    if (towerType == AOE) threshold = 30;
    if (towerType == SNIPER) threshold = 90;
  }
  //Tower(float _x, float _y, int c, int th) {
  //  x = _x;
  //  y = _y;
  //  cooldown = c;
  //  threshold = th;
  //  towerMode = PLACING;
  //}
  
  void show() {

    if (towerMode == PLACED) {
        x = mouseX;
        y = mouseY;
        if (mousePressed && mouseX < 790) {
        towerMode = PLACED;
        building = false;
      }
    }
    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAoETower();
    if (towerType == SNIPER) showSniperTower();
}
    //stroke(black);
    //strokeWeight(4);
    //fill(blue);
  //  if (towerMode == PLACED) {
  //    square(x, y, 40);
  //  } else if (towerMode == PLACING) {
  //   square(mouseX, mouseY, 40);
  //   if(mousePressed) {
  //     mode = PLACED;
  //     x = mouseX;
  //     y = mouseY;
  //   }
  //  }
  //}
  
void  showGunTower() {
  stroke(black);
  strokeWeight(4);
  fill(blue);
  square(x, y, 40);
}

void showAoETower() {
  stroke(black);
  strokeWeight(4);
  fill(pink);
  circle(x, y, 40);
}

void showSniperTower() {
  stroke(black);
  strokeWeight(4);
  fill(purple);
  triangle(0, 100, 100, 200, 300, 200);
}

void act() {
 cooldown++;
 if (cooldown >= threshold) {
   cooldown = 0;
   bullets.add(new Bullet(x, y, 0, -10)); //UP
   bullets.add(new Bullet(x, y, 0, 10)); //DOWN
   bullets.add(new Bullet(x, y, -10, 0)); //LEFT
   bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
 }
}
}
