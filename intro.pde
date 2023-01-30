void intro () {

  introGif.show();

  start.show();
  if (start.clicked) {
    mode = PLAY;
  }

  textAlign (CENTER, CENTER);
  textFont (font);
  fill(pink);
  text ( "Platformer", width/2, height/2- 100);
  text ( "Game", width/2, height/2 );
}
