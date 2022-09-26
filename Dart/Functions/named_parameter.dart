import 'dart:io';

String student_data({String? name, int no = 0, int? age}) {
  return (age != null)
      ? "Name is $name\nNumber is $no\nAge is $age"
      : "Name is $name\nNumber is $no";
}

// Shorthand or Arrow syntax for function
// int add(int a, int b) => a + b;

void main() {
  var _name, _no, _age, result;
  print("Enter your name : ");
  _name = stdin.readLineSync();
  // print("Enter your no : ");
  // _no = int.parse(stdin.readLineSync());
  // print("Enter your age : ");
  // _age = int.parse(stdin.readLineSync());
  result = student_data(name: _name);
  print("\n$result");
}
