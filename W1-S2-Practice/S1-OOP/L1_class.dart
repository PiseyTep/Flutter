void main(List<String> args) {
  Point p1 = Point(2, 1);
  print('Original X: ${p1.x} , Y: ${p1.y}');
  p1.translate(1, 2);
  p1.printPoint();
}

class Point {
  double x;
  double y;

  Point(this.x, this.y);

  void translate(double dx, double dy) {
    x += dx;
    y += dy;
  }

  void printPoint() {
    print('After Translate X: $x , Y: $y');
  }
}
