class SpeedyMob extends Mob {
  
  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
      d = 40;
      maxhp = 5 + waveNumber;
      hp = maxhp;
      value = 5;
      //fillColor = orange;
      //strokeColor = pink;
      speed = 2;
  }
}
   
