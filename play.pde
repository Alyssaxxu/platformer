void play() {
  introGif.show();
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  drawWorld();

  actWorld();
  popMatrix();

  if (lives == 0) {
    mode = GAMEOVER;
  }

  fill(black);
  textSize(20);
  text("Lives: ", 70, 40);
  for (int i = 0; i < lives; i++) {
    image(heart, 100 + i*25, 40);
  }
}


void drawWorld() {
  world.step();
  world.draw();
}

void actWorld() {
  player.act();
  for (int i = 0; i< terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}
