class FPortal extends FGameObject {

  FPortal(float x, float y) {
    super(); 
    setPosition(x, y);
    setName("portal");
    attachImage(portal);
    setStatic(true);
  }

  void act() {
    if (isTouching("player")) {

     
    }
  }
}
