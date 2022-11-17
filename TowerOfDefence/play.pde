void play() {
  // background(blue);
  drawMap();
  animateThings();
  drawPlayInterface();
  handleButtonClicks();
  nextWave.show();
}

void drawMap() {
  //green grass
  fill(green);
  rect(width/2, height/2, width, height);

  //path
  stroke(orange);
  strokeWeight(30);
  line(0, 400, 200, 400);
  line(200, 400, 200, 200);
  line(200, 200, 400, 200);
  line(400, 200, 400, 600);
  line(400, 600, 300, 600);
  line(300, 600, 300, 500);
  line(300, 500, 500, 500);
  line(500, 500, 500, 400);
  line(500, 400, 800, 400);
  strokeWeight(1);

  //temp nodes'
  int i = 0;
  while (i < 8) {
    nodes[i].show();
    i++;

    //side button catalog
    fill(0);
    rect(900, 300, 100, 1000);
  }
}

void drawPlayInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);

  fill(white);
  textSize(20);
  nextWave.show();
 
}

void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while ( i < towers.size()) {
    Tower myTower = towers.get(i);
    println(myTower.cooldown);
    if (mobs.size() > 0) myTower.act();
    myTower.show();
    i++;
  }

  i = 0;
  while ( i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {

      i++;
    }
  }
}

void handleButtonClicks() {
  if (nextWave.clicked) {
    mobs.add(new Mob(0, 400, 3, 0));
    mobs.add(new Mob(-40, 400, 3, 0));
    mobs.add(new Mob(-80, 400, 3, 0));
    mobs.add(new Mob(-120, 400, 3, 0));
  }
}

void addWave() {
  int i = 0;
  int x = 0;
  while (i < waveNumber) {
    mobs.add(new Mob(0, 400, 3, 0));
    x = x - 50;
    i++;
  }

  if (waveNumber % 3 == 0) {
    i = 0;
    x = 50;
    while (i < waveNumber/3) {
      mobs.add(new ChonkyMob(0, 400, 3, 0));
      x = x- 100;
      i++;
    }
  }

  if (waveNumber % 2 == 0) {
    i = 0;
    x = 50;
    while (i < waveNumber/3) {
      mobs.add(new SpeedyMob(0, 400, 3, 0));
      x = x - 200;
      i++;
    }
  }
}
