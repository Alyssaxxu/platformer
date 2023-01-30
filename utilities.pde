boolean touchGround(FPlayer player, FBox world) {
  ArrayList<FContact> contactList = player.getContacts();
  for (int i = 0; i < contactList.size(); i++) {
    FContact c = contactList.get(i);
    if (c.contains(world)) return true;
  }
  return false;
}

PImage reverseImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );
  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}

PImage rotateImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );
  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      yPixel =  i;
      xPixel = image.width - 1 - j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

void keyPressed () {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ') spacekey = true;
  if (keyCode == UP ) upkey = true;
  if (keyCode == DOWN ) downkey = true;
  if (keyCode == LEFT ) leftkey = true;
  if (keyCode == RIGHT ) rightkey = true;
}
void keyReleased () {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ' ') spacekey = false;
  if (keyCode == UP ) upkey = false;
  if (keyCode == DOWN ) downkey = false;
  if (keyCode == LEFT ) leftkey = false;
  if (keyCode == RIGHT ) rightkey = false;
}
