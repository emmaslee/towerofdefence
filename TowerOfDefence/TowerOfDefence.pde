//Tower Defense Game
//YOUR NAME GOES HERE
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO     = 0;
final int PLAY      = 1;
final int BUILD     = 2;
final int GAMEOVER  = 3;
final int MAPSELECT = 4;
int mode;

//Tower types
final int GUN = 0;
final int AOE = 1;
final int SNIPER = 2;

//Pallette
color white  = #ffffff;
color black  = #000000;
color pink   = #ff595e;
color orange = #ffca3a;
color green  = #8ac926;
color blue   = #1982c4;
color purple = #6a4c93;


//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, nextWave, buildMode, playMode, buyGunTower;

//Collections of objects
Node[] nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

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
  nodes = new Node[8];
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  

  
  //test towers
  //towers.add(new Tower(300, 400, 0, 60));
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);

  //PLAY - Next Wave, To Build Mode
nextWave = new  Button(playButton, 900, 100, 150, 100, green, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
buyGunTower = new Button("BUILD", 900, 300, 150, 100, green, white);
  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[8];
  
  nodes[0] = new Node(200, 400, 0, -1);
  nodes[1] = new Node(200, 200, 1, 0);
  nodes[2] = new Node(400, 200, 0, 1);
  nodes[3] = new Node(400, 600, -1, 0);
  nodes[4] = new Node(300, 600, 0, -1);
  nodes[5] = new Node(300, 500, 1, 0);
  nodes[6] = new Node(500, 500, 0, -1);
  nodes[7] = new Node(500, 400, 1, 0);
  
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
