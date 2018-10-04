class Circle {
  PVector pos;
  PVector dot;
  float speed;
  float angle = 0;
  float r;
  int dir;
  boolean running = true;

  Circle(float x, float y, float speed, int r, int dir) {
    float nextX = r * sin(angle);
    float nextY = r * cos(angle);
    pos = new PVector(x, y);
    dot = new PVector(nextX, nextY);
    this.speed = speed;
    this.r = r;
    this.dir = dir;
  }

  void show() {
    if (running) {
      noFill();
      strokeWeight(1);
      stroke(255);
      ellipse(pos.x, pos.y, r*2, r*2); 
      if (dir == 1) {
        //line(pos.x+dot.x,pos.y+dot.y,pos.x+dot.x,height);
      } else {
        // line(pos.x+dot.x,pos.y+dot.y,width,pos.y+dot.y);
      }
      stroke(255, 0, 0);
      strokeWeight(3);
      point(pos.x+dot.x, pos.y+dot.y);
    }
  }

  void update() {
    angle += 0.01 * speed;
    float nextX = r * sin(angle);
    float nextY = r * cos(angle);
    dot.set(nextX, nextY);
  }
  
  void setRunning(){
    running = false;
  }
}
