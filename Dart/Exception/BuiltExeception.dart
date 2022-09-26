void main() {
  int n;

  /// CASE 1 : When we know exception use [on] clause
  try {
    n = 10 ~/ 0;
  } on IntegerDivisionByZeroException {
    print("\nCan't Divide By Zero XXX");
  }

  /// CASE 2 : When we don't know exception
  try {
    n = 0 ~/ 0;
  } catch (e) {
    print("\nError occured : $e");
  }

  /// CASE 3 : StackTrace - sequence of events occured during error
  try {
    n = 10 ~/ 0;
  } catch (e, st) {
    print("\nError occured : $e ");
    print("\nStacktrace : \n$st ");
  }

  /// CASE 4 : Finally
  try {
    n = 10 ~/ 0;
  } catch (e, st) {
    print("\nError occured : $e ");
  } finally {
    print("\nApplication is running.....");
  }
}
