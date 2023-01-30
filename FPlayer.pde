class FPlayer extends FGameObject {

  int idx;
  PImage [] img;
  int playerIndex;
  int frame;
  int direction;


  FPlayer() {
    super ();
    frame = 0;
    setPosition(99, 900 );
    setFillColor (red);
    setName("player");
    setRotatable(false);
    playerIndex =1;
    direction = R;
  } 

  void act() {
    handleInput();
    collisions();
    animate();
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (vy == 0) action = idle;
    if (akey) {
      setVelocity (-200, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity (200, vy);
      action = run;
      direction = R;
    }
    if (wkey && isTouching("stone")) {
      setVelocity (vx, -300);
    }
    if (abs(vy) > 0.1) {
      action = jump;
    }
    if (skey) {
      setVelocity (vx, 200);
    }
  }

  void collisions () {
    if (isTouching("spike")) {
      setPosition(99, 900 );
      lives --;
    }
    if (isTouching("lava")) {
      setPosition(99, 900 );
      lives --;
    }

    if (isTouching("thwomp" )) {
      setPosition(99, 900);
      lives --;
    }

    if (isTouching("hammer")) {
      setPosition(99, 900);
      lives --;
    }
  }


  void animate() {
    if (frame>=action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction== R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
}
