main() {
  // How to declare a variable

  var name = 'sushant';
  var age = 20;
  print("Name : $name");
  print("Age  : $age");

  // Initially values of varaibles is [null]

  String? empty;
  int? none;
  print("\nempty = $empty");
  print("none = $none");

  // Final and const

  final destination = 'MUMBAI';
  // destination = 'KOHLAPUR';
  print("\nDestination : $destination");

  final one = 1;
  var two = one + one;
  final three = one + two; //Not throw error
  print("\nThree = $three");

  const pie = 3.14;
  // pie = 3;
  // var lambda = 5;
  // const pieLamda = pie + lambda; //Throws error
  // print("\npieLamda = $pieLamda");

  //To define object without restriction to single type

  dynamic d;
  Object o = true;
  print("\n$d\n$o");
}
