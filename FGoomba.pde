class FGoomba extends FGameObject {

  int frame;
  int direction = L;
  int speed = 50;
  int d1, d2;
  PImage [] img;
  int n;
  float x, y;
  int cooldown, threshold;

  FGoomba (float _x, float _y) {
    super(); 
    x = _x;
    y = _y;
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    frame = 0;
    d1 = R;
    d2 = L;
    img = goomba;
    n = goomba.length;
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame>=n) frame = 0;
    if (frameCount % 8 == 0) {
      if (direction== d1) attachImage(img[frame]);
      if (direction == d2) attachImage(reverseImage(img[frame]));
      frame++;
    }
  }

  void collide () {
    if (isTouching ("wall")) {
      direction *= -1;
      setPosition(getX() +direction, getY() - gridSize/2);
    }
    if (isTouching("player")) {
      if (player.getY() <getY()) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        lives --;
        player.setPosition(8, 500);
      }
    }
  }

  void move () {
    float vy = getVelocityY();
    setVelocity (speed*direction, vy);
  }
}
