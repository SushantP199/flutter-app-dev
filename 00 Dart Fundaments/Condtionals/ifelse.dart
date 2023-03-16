// If else in dart
import 'dart:io';

void main() {
  print("Enter your talktime balance : ");
  var balance = double.parse(stdin.readLineSync()!);

  if (balance < 1) {
    print("Your balance is below \$1, you can't connect call");
  } else {
    print("Your call connected successfully");
  }
}
