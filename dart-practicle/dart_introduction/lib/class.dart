const double xOrigin = 0;
const double yOrigin = 0;

({double x, double y}) getOrigin() {
  return (x: 0, y: 0);
}

class Point {
  double x = 0;
  double y = 0;

  // Generative constructor with initializing formal parameters:
  Point(this.x, this.y) {
    print('init Point');
  }

  factory Point.def() {
    return Point(10, 10);
  }

  Point.origin()
      : x = xOrigin,
        y = yOrigin;

  Point.originT()
      : x = getOrigin().x,
        y = getOrigin().y;
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

funcClass() {
  var p1 = Point(20, 20);
  print('p1: ${p1.x} ${p1.y}');
  var p2 = Point.originT();
  print('p2: ${p2.x} ${p2.y}');
  var p3 = ImmutablePoint.origin;
  print('p3: ${p3.x} ${p3.y}');
  var p4 = Point.def();
  print('p4: ${p4.x} ${p4.y}');

  Map<String, int> cache = <String, int>{};
  print('cache: ${cache.putIfAbsent('key', () => 1)}');
  print('cache1: ${cache.putIfAbsent('key_1', () => 2)}');
  print('cache2: ${cache.putIfAbsent('key', () => 1)}');
}
