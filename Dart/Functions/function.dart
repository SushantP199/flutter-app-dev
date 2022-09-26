import 'dart:io';

int add(int a, int b) {
  return a + b;
}

// Shorthand or Arrow syntax for function
// int add(int a, int b) => a + b;

void main() {
  int a, b, c;
  print("Enter your two numbers : ");
  a = int.parse(stdin.readLineSync()!);
  b = int.parse(stdin.readLineSync()!);
  c = add(a, b);
  print("$a + $b = $c");
}
