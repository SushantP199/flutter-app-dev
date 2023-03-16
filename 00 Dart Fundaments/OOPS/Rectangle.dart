class Rectangle {
  int? length, _breadth;

  /// Setters
  set side(int? breadth) {
    _breadth = breadth;
  }

  /// Getters
  int? get side {
    return _breadth;
  }

  int area() {
    return length! * side!;
  }
}

void main() {
  var r = Rectangle();
  r.length = 5;
  print("Length  = ${r.length}");

  r.side = 3;
  print("Breadth = ${r.side} ");

  print("Area = ${r.area()}");
}
