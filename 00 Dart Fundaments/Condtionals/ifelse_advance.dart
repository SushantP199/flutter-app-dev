import 'dart:io';

void main() {
  print("Enter you marks ->");
  var marks = int.parse(stdin.readLineSync()!);

  if (marks >= 80) {
    print("You got a O grade");
  } else if (marks >= 60) {
    print("You got a A grade");
  } else if (marks >= 50) {
    print("You got a B grade");
  } else if (marks >= 40) {
    print("You got a P grade");
  } else {
    print("You got a F grade");
  }
}
