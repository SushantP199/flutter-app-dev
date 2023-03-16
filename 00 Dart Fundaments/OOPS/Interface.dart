class SmartPhone {
  int ram() {
    return 16;
  }

  int rom() {
    return 64;
  }

  double price() {
    return 83000.00;
  }

  double? size;
}

class OnePlus implements SmartPhone {
  var random_acc_mem, cost;

  OnePlus(this.random_acc_mem, this.cost);

  @override
  int ram() {
    return this.random_acc_mem;
  }

  @override
  int rom() {
    return 128;
  }

  @override
  double price() {
    return this.cost;
  }

  @override
  double? size = 3.0;
}

void main() {
  var o = OnePlus(8, 45000.00);

  print("RAM : ${o.ram()}GB");
  print("ROM : ${o.rom()}GB");
  print("Cost: ${o.price()}\$");
}
