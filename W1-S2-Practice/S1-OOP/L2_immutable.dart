class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  @override
  String toString() {
    return "x= $x - y= $y";
  }

  Point translate(double dx, double dy) {
    return Point(x+dx, y+dy);
  }
}

void main() {
  Point p1 = Point(1, 2);
  print(p1);
  print(p1.translate(2, 1));
}
