Circle[] circles_row;
Circle[] circles_col;
Curve[][] curves;
int circleR = 30;
int speed = 2;
int rows, cols;
void setup() {
  size(1000, 1000); 
  rows = height / (circleR *2) -1;
  cols = width / (circleR * 2) -1;
  circles_row = new Circle[rows];
  circles_col = new Circle[cols];
  curves = new Curve[rows][cols];
  for (int i=0; i<cols; i++) {
    circles_col[i] = new Circle((circleR*3) + (i*circleR*2), circleR, i+speed, circleR-5, 1);
    for (int j=0; j<rows; j++) {
      curves[i][j] = new Curve();
    }
  }
  for (int i=0; i<rows; i++) {
    circles_row[i] = new Circle(circleR, (circleR*3) + (i*circleR*2), i+speed, circleR-5, 0);
  }
}

void draw() {
  background(0);
  for (int i=0; i<circles_row.length; i++) {
    circles_row[i].show();
    circles_row[i].update();
    circles_col[i].show();
    circles_col[i].update();
    if (circles_col[0].angle > TWO_PI && circles_row[0].angle > TWO_PI) {
      circles_col[0].setRunning();
      circles_row[0].setRunning();
    }
    for (int j=0; j<circles_col.length; j++) {
      if (circles_col[0].running || circles_row[0].running) {
        curves[i][j].addPoint((circles_col[j].pos.x+circles_col[j].dot.x), (circles_row[i].pos.y+circles_row[i].dot.y));        
      }
      curves[i][j].show();
    }
  }
}
