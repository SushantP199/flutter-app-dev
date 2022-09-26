import 'dart:io';

var anonymous = (int n) {
    return n * n;
};

void main() {

  print("Enter your number : ");
  var n = int.parse(stdin.readLineSync()!);
  print("$n * $n = ${anonymous(n)}");
}