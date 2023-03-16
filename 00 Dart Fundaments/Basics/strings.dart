/// Strings built-in data type

void main() {
  // Declaration

  String name = 'Sushant';
  var studying = "Computer Enginnering";
  print("Name : $name");
  print("Studying : $studying");

  // Concatenation

  var data = name + ' is studying ' + studying;
  print("\n$data");

  // Multi-line string using triple quotes [""" """] | [''' ''']
  String address = """
10 Goden House,
Market Road,
Kanjurmarg E,
MUM 40042.
  """;
  print("\nAddress:\n$address");

  // Raw string
  String raw = r'I \n am \t a raw string';
  print("$raw");
}
