import 'dart:io';

String student_data(String name, int no, [int age = 0]) {
  return (age != null)
      ? "Name is $name\nNumber is $no\nAge is $age"
      : "Name is $name\nNumber is $no";
}

// Shorthand or Arrow syntax for function
// int add(int a, int b) => a + b;

void main() {
  var name, no, age, result;
  print("Enter your name : ");
  name = stdin.readLineSync();
  print("Enter your no : ");
  no = int.parse(stdin.readLineSync()!);
  // print("Enter your age : ");
  // age = int.parse(stdin.readLineSync());
  result = student_data(name, no);
  print("\n$result");
}
