//Tower Defense Game
//Emma Lee
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO     = 0;
final int PLAY      = 1;
final int BUILD     = 2;
final int GAMEOVER  = 3;
final int MAPSELECT = 4;
int mode;
int map;

//Tower types
final int GUN = 0;
final int AOE = 1;
final int SNIPER = 2;

final int[] price = {5, 25, 50};

//Pallette
color white  = #ffffff;
color black  = #000000;
color pink   = #ff595e;
color orange = #ffca3a;
color green  = #8ac926;
color blue   = #1982c4;
color purple = #6a4c93;
color red    = #FF0000;


//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, nextWave, buildMode, playMode, buildButton, buyGunTower, buyAoeTower, buySniperTower, map1Button, map2Button;

//Collections of objects
Node[] nodes;
Node[] map1nodes;
Node[] map2nodes;
Node begin;

ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> rings;

//Images and Gifs
Gif introAnimation;
PImage nextWaveIcon;
PImage playButton;
PImage galaxy;

//variable image
PImage selectedImage;

//Fonts
PFont revamped;
float a;
int count; //for flashing text

//intitialize variables
int waveNumber;
int lives = 3;
int money = 10;
// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  introAnimation = new Gif("frame_", "_delay-0.05s.gif", 10, 2, 500, 400, width, height);
  size(1000, 800);
  initializeModes();
  initializeVariables();

  //image
  playButton = loadImage("playButton.png");

  makeButtons();
  makeNodes();
  waveNumber = 1;


  selectedImage = playButton;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  //introAnimation = new Gif();
  //Load Fonts

  //Create Collections of Objects

  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();



  //test towers
  //towers.add(new Tower(300, 400, 0, 60));
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
//PLAy button
playMode = new  Button("PLAY", 900, 100, 150, 100, green, white);
  //PLAY - Next Wave, To Build Mode
  nextWave = new  Button(playButton, 900, 100, 150, 100, green, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  buildButton = new Button("BUILD", 900, 225, 150, 100, green, white);
  buyGunTower = new Button("GUN", 900, 225, 150, 100, blue, white);
  buyAoeTower  = new Button("AOE\n$"+price[AOE], 900, 350, 140, 100, blue, white);
  buySniperTower = new Button("SNIPER\n$"+price[SNIPER], 900, 480, 140, 100, blue, white);
 
 //MAPS
  map1Button = new Button(" ", 300, 400, 280, 280, black, red);
  map2Button = new Button(" ", 690, 400, 280, 280, black, red);
  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  map1nodes = new Node[8];

  map1nodes[0] = new Node(200, 400, 0, -1);
  map1nodes[1] = new Node(200, 200, 1, 0);
  map1nodes[2] = new Node(400, 200, 0, 1);
  map1nodes[3] = new Node(400, 600, -1, 0);
  map1nodes[4] = new Node(300, 600, 0, -1);
  map1nodes[5] = new Node(300, 500, 1, 0);
  map1nodes[6] = new Node(500, 500, 0, -1);
  map1nodes[7] = new Node(500, 400, 1, 0);
  
  nodes = map1nodes;
  
  //map2nodes = new Node [4];
  
  //map2nodes[0] = new Node(400, 450, 0, -1);
  //map2nodes[1] = new Node(400, 200, 1, 0);
  //map2nodes[2] = new Node(600, 200, 0, 1);
  //map2nodes[3] = new Node(600, 350, 1, 0);
  
}


// ===================== DRAW ===========================

void draw() {
  introAnimation.show();
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }

  textSize(20);
  text(mouseX + "'" + mouseY, mouseX, mouseY-20);
}
