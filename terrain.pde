void loadBlock(int x, int y, FBox b) {
  b.setPosition(x*gridSize, y*gridSize);
  b.setStatic(true);
  b.setGrabbable(false);
  world.add(b);
}

void loadTrunk(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(trunk);
  b.setSensor(true);
  b.setName("trunk");
  loadBlock(x, y, b);
}

 void loadHammer(int x, int y){
   FBox b = new FBox(gridSize, gridSize);
  b.attachImage(hammer);
  b.setSensor(true);
  b.setName("hammer");
  loadBlock(x, y, b);
}

void loadIce(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setStatic(true);
  b.setFriction(0.5);
  b.attachImage(ice);
  b.setName("ice");
  loadBlock(x, y, b);
}

void loadWall(int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(stone);
  b.setFriction(3);
  b.setName("wall");
  loadBlock(x, y, b);
}

void loadDirtC( int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(dirtC);
  b.setName("dirt");
  loadBlock(x, y, b);
}

void loadDirtN (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(dirtN);
  b.setName("dirt");
  loadBlock(x, y, b);
}

void loadDirtS (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(dirtS);
  b.setName("dirt");
  loadBlock( x, y, b );
}

void loadSpike (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(spike);
  b.setName("spike");
  loadBlock( x, y, b );
}

void loadBridge( int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(bridge);
  b.setName("bridge");
  loadBlock( x, y, b );
}

void loadDirtNW (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(dirtNW);
  b.setName("dirt");
  loadBlock( x, y, b);
}

void loadTreeI( int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(treeI);
  b.setFriction(3);
  loadBlock(x, y, b);
}

void loadTreeC (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(treeC);
  b.setFriction(3);
  b.setName("tree");
  loadBlock( x, y, b);
}

void loadTreeW (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(treeW);
  b.setFriction(3);
  b.setName("tree");
  loadBlock(x, y, b);
}

void loadTreeE(int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(treeE);
  b.setFriction(3);
  b.setName("tree");
  loadBlock(x, y, b);
}

void loadStone (int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(stone);
  b.setFriction(3);
  b.setName("stone");
  loadBlock(x, y, b);
}

void loadTrampoline(int x, int y) {
  FBox b = new FBox (gridSize, gridSize);
  b.setPosition (x*gridSize, y*gridSize);
  b.setStatic(true);
  b.attachImage(trampoline);
  b.setRestitution(2);
  b.setFriction(3);
  b.setName("trampoline");
  loadBlock(x, y, b);
}
