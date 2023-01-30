class FTurtle extends FGoomba {


  FTurtle (float _x, float _y) {
    super(_x, _y); 
    setPosition(x, y);
    setName("turtle");
    setRotatable(false);
    setAngularVelocity(0);
    frame = 0;
    d1 = R;
    d2 = L;
    img = turtle;
    n = turtle.length;
  }

  void act() {
    animate();
    collide();
    move();
    hammer();
  }

  void hammer() {
    if (frameCount % 150 == 0) {
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(getX(), getY() - 50);
      b.attachImage(hammer);
      b.setSensor(true);
      b.setVelocity(-100 *direction, -600 );
      b.setAngularVelocity(50);
      b.setName("hammer");
      world.add(b);
    }
  }
}
