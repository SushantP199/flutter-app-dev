// List built-in data type

void main() {
  // Declaration

  var superheros = ['superman', 'batman', 'spiderman'];
  print("Superheros : $superheros");

  var numbers = [1, 2, 3];
  print("Numbers : $numbers");

  var list = [1, 'two', 2.1];
  print("List : $list");

  // Spread operator [...]

  var heros = ['hulk', 'doctor strange', ...superheros];
  print("\nHeros : $heros");

  // Null aware spread oprator [...?]

  var emptyList;
  // List newList = [1, 2, 3, ...emptyList]; //Gives error
  List newList = [1, 2, 3, ...?emptyList];
  print("\nnewList : $newList");
}
