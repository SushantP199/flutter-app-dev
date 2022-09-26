// Maps are also known as hash or dictionary
// printdata(int key, String value) {
//   return "$key : $value";
// }

void main() {
  var student = {
    35: 'Sushant',
    46: 'Shreyas',
    12: 'Akshay',
    13: 'Tejas',
    11: 'Prathmesh'
  };

  /// Methods

  student[10] = 'sujay';
  student.addAll({09: 'Prashant', 01: 'Pranay'});

  student.remove(35);
  // print(student.remove(35));

  student[40] = "new";

  var props = """
  length = ${student.length}
  keys = ${student.keys}
  values = ${student.values}
  """;
  print("$props");

  print("\n***MAPS***");
  student.forEach((key, value) => print("$key : $value"));
}
