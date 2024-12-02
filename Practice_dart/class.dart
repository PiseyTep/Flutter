class Point {
  double x;
  double y;
  // Constructor to initialize the point
  Point(this.x, this.y);
  // Method to translate the point by (dx, dy)
  void translate(double dx, double dy) {
    x += dx;
    y += dy;
  }

  // Method to display the point's position
  @override
  String toString() {
    return 'Point(x: $x, y: $y)';
  }
}

void main() {
  // Test cases
  // Creating a Point at (3, 4)
  Point p1 = Point(3, 2);
  print('Original: $p1'); // Output: Point(x: 3.0, y: 2.0)

  // Translating the point by (1, 2)
  p1.translate(1, 2);
  print('After translating by (1, 2): $p1'); // Output: Point(x: 4.0, y: 4.0)
}