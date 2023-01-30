class FLava extends FGameObject {

  int i;
  FLava(float x, float y, int ir) {

    super(); 
    setPosition(x, y);
    setName("lava");
    attachImage(lavas[i]);
    i = ir;
    setStatic(true);
  }

  void act() {
    if (frameCount % 15 ==0) {
      i ++;
      i = i % 6;
    }
    attachImage(lavas[i]);
  }
}
