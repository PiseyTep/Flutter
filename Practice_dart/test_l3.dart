class Point {
  final int x;
  final int y;

  Point(this.x, this.y);
}

class Shape extends Point {
  double width;
  double height;
  String? backgroundColor;
  Point rightTop;
  Point leftBottom;

  Shape(this.width, this.height, this.rightTop, this.leftBottom,
      {this.backgroundColor})
      : super(rightTop.x, rightTop.y);

  double get area => width * height;
}

void main() {
  Shape shape = Shape(2, 3, Point(4, 6), Point(2, 3));
  // Shape shape = Shape(2, 3, Point(4, 6), Point(2, 3),backgroundColor: "red");
  print(shape.area);
}
