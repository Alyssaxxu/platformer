class FThwomp extends FGameObject {
  FThwomp(int x, int y) {
    super(64, 64);
    setPosition(x+gridSize /2, y+gridSize/2);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    attachImage(thwompSleepy);
  }

  void act() {
    drop();
  }

  void drop() {
    if (player.getX() >= this.getX() -10 && player.getX() <= this.getX() + 10) {
      setStatic(false);
      attachImage(thwompAwake);
    }
  }
}
