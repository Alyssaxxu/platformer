//Loading world checkpoint
// Alyssa Xu

import fisica.*;
FWorld world; 

// mode variables
final int INTRO    = 0;
final int PLAY     = 1;
final int GAMEOVER = 2;
int mode = 0;

// map variables
PImage level1;
//final PImage level2;
PImage level2;
PImage p;

// mouse and keyboard variables
boolean mouseReleased;
boolean wasPressed;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey;

// colour variables
color white = #FFFFFF;
color black = #000000;
color red = #ed1c24;
color blue = #4d6df3;
color cyan = #00ffff;
color lgrey = #b4b4b4;
color green = #22b14c;
color lgreen = #d3f9bc;
color brown = #9c5a3c;
color purple = #6f3198;
color pink = #ffa3b1;
color orange = #ff7e00;
color yellow = #fff200;
color lpink = #FCE5F9;

// global variables
int gridSize = 32;
float zoom = 1.5;
int lavaIndex = 0;
int lives = 3;
PFont font;

// Array stuff
FPlayer player;
Button start, end;
Gif introGif;
ArrayList <FGameObject> terrain; 
ArrayList <FGameObject> enemies;

// Image variables
PImage map, ice, dirtN, dirtS, dirtC, stone, treeC, treeI, treeE, treeW, trunk, dirtNW, spike, bridge, trampoline, hammer, thwompSleepy, thwompAwake, portal ;
PImage heart;

// Image arrays
PImage [] lavas;
PImage [] idle;
PImage [] jump;
PImage [] run;
PImage [] action;
PImage [] goomba;
PImage [] thwomp;
PImage [] turtle;

void setup() {
  rectMode(CENTER);
  size(600, 600, FX2D);
  Fisica.init(this);
  p = level1;
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList <FGameObject>();
  font = createFont("font/KGRedHands.ttf", 80);
  introGif = new Gif("introGif/frame_", "_delay-0.1s.gif", 15, 3, 0, 0, width, height);
  loadButtons();
  loadImages();
  loadWorld(level1);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld (-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < img.height; y ++) {
    for ( int x = 0; x < img.width; x++) {
      color c = img.get (x, y);
      color s = img.get(x, y+1); 
      color w = img.get( x-1, y);
      color e = img.get(x+1, y);
      color n = img.get(x, y-1);
      if (c == black) {
        loadStone(x, y);
      } else if (c == brown) { 
        loadTrunk(x, y);
      } else if (c == green && s == brown ) {
        loadTreeI(x, y);
      } else if ( c == green && w == green & e == green) {
        loadTreeC(x, y );
      } else  if (c== green && w != green) {
        loadTreeW(x, y);
      } else if (c == cyan) {
        loadIce(x, y);
      } else  if (c == green && e != green) {
        loadTreeE(x, y);
      } else if (c == lgrey ) {
        loadWall(x, y);
      } else if (c == purple) {
        FBridge br = new FBridge( x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      } else if ( c == lgreen) {
        FPortal pr = new FPortal( x*gridSize, y*gridSize);
        terrain.add(pr);
        world.add(pr);
      } else if (c == pink) {
        loadTrampoline(x, y);
      } else if (c == orange) {
        FLava la = new FLava( x*gridSize, y*gridSize, lavaIndex);
        lavaIndex ++;
        lavaIndex = lavaIndex % 6;
        terrain.add(la);
        world.add(la);
      } else if (c == yellow) {
        FGoomba gmb = new FGoomba (x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      } else if ( c == blue) {
        FTurtle trt = new FTurtle (x*gridSize, y*gridSize);
        enemies.add(trt);
        world.add(trt);
      } else if (c == red) {
        FThwomp t = new FThwomp(x*gridSize, y*gridSize);
        enemies.add(t);
        world.add(t);
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add (player);
}

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}

void loadButtons() {
  start =  new Button ("Play", width/2, 3*height/4, 200, 100, white, pink);
  end = new Button( "Play Again", width/2, 3*height/4, 200, 100, white, black);
}


void loadImages() {
  //idle images
  map = loadImage("map.png");
  ice = loadImage("blueBlock.png");
  ice.resize(gridSize, gridSize);
  level1 = loadImage( "level1.png");
  level2 = loadImage("level2.png");
  dirtN = loadImage( "dirt_n.png");
  dirtS= loadImage( "dirt_s.png");
  dirtC = loadImage("dirt_center.png");
  dirtNW = loadImage( "dirt_nw.png");
  stone = loadImage( "stone.png");
  stone.resize(gridSize, gridSize);
  treeC = loadImage( "treetop_center.png");
  treeI = loadImage( "tree_intersect.png");
  treeE = loadImage( "treetop_e.png");
  treeW = loadImage( "treetop_w.png");
  trunk = loadImage( "tree_trunk.png");
  spike = loadImage("spike.png");
  bridge = loadImage("bridge_centre.png");
  trampoline = loadImage ( "trampoline.png");
  heart = loadImage ("heart.png");
  heart.resize(gridSize/2, gridSize/2);
  hammer = loadImage("hammer.png");
  portal = loadImage("portal.png");
  portal.resize(gridSize, gridSize);

  // animated images
  lavas =  new PImage [6];
  lavas[0] = loadImage("lava" + 0 + ".png");
  lavas[1] = loadImage("lava" + 1 + ".png");
  lavas[2] = loadImage("lava" + 2 + ".png");
  lavas[3] = loadImage("lava" + 3 + ".png");
  lavas[4] = loadImage("lava" + 4 + ".png");
  lavas[5] = loadImage("lava" + 5 + ".png");

  goomba = new PImage [2];
  goomba[0] = loadImage("goomba0.png");
  goomba [1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);
  goomba[0].resize(gridSize, gridSize);

  thwompSleepy = loadImage("thwomp0.png");
  thwompAwake = loadImage("thwomp1.png");

  turtle = new PImage [2];
  turtle[0] = loadImage ("hammerbro0.png");
  turtle[1] = loadImage ("hammerbro1.png");
  turtle[0].resize(gridSize, gridSize);
  turtle[1].resize (gridSize, gridSize);

  // load player actions
  idle = new PImage [2] ;
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");

  run = new PImage [3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");

  action = idle;
}
