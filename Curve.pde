class Curve {
  ArrayList<PVector> points;
  
  Curve() {
    points = new ArrayList<PVector>();
  }
  
  void addPoint(float x, float y) {
    points.add(new PVector(x,y));
  }
  
  void show() {
    stroke(255);
    strokeWeight(1);
    beginShape();
    for (PVector v : points) {
      vertex(v.x,v.y);
    }
    endShape();
  }
  
  
}
