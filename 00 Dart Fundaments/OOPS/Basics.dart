class OnePlus {
  /// Instance variables
  var os = 'ANDROID1';
  var version = 1.2;
  var ram, rom, osupdate;

  /// Constructor
  OnePlus(int ram, int rom) {
    this.ram = ram;
    this.rom = rom;
  }

  // OnePlus(this.ram, this.rom);

  // Named constructor
  OnePlus.update(this.osupdate);

  /// Methods

  // Instance methods
  String? feature(OnePlus o) {
    print("${o.ram}GB + ${o.rom}GB");
  }
}

main() {
  /// Creating an object
  var onePlus = OnePlus(4, 64);
  var onePlusUp = OnePlus.update('Yes');

  print("OS : ${onePlus.os}");
  print("VER: ${onePlus.version}");
  print("RAM: ${onePlus.ram}");
  print("ROM: ${onePlus.rom}");
  print("updte avial. : ${onePlusUp.osupdate}");
  onePlus.feature(onePlus);
}
