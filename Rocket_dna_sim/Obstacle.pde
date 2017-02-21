class Obstacle {
  
  PVector location;
  float w, h;
  
  Obstacle(PVector loc, float givew, float giveh) {
    location = loc;
    w = givew;
    h = giveh;
  }
  
  boolean contains(PVector v) {
    if (v.x > location.x && v.x < location.x + w && v.y > location.y && v.y < location.y + h) {
      return true;
    } else {
      return false;
    }
  }
  
  void render() {
    fill(0);
    rect(location.x, location.y, w, h);
  }
}