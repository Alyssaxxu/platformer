void gameOver () {

  background(black);
  end.show();
  if (end.clicked) {
    lives = 3;
    mode = INTRO;
  }
  textAlign (CENTER, CENTER);
  textFont (font);
  fill(pink);
  text ( "You lost..", width/2, height/2- 100);
}
