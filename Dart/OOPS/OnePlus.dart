abstract class SmartPhone {
  int ram();
  int rom() {
    return 64;
  }

  double price();
  double? size;
}

class OnePlus extends SmartPhone {
  var random_acc_mem, cost;

  OnePlus(this.random_acc_mem, this.cost);

  @override
  int ram() {
    return this.random_acc_mem;
  }

  @override
  double price() {
    return this.cost;
  }
}

void main() {
  var o = OnePlus(8, 45000.00);

  print("RAM : ${o.ram()}GB");
  print("ROM : ${o.rom()}GB");
  print("Cost: ${o.price()}\$");
}
