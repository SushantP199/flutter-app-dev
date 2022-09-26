class AmountDepositException implements Exception {
  String errorMessage() {
    return "Amount must be greater than 0";
  }
}

void amount(int n) {
  if (n < 0) {
    throw new AmountDepositException();
  }
}

void main() {
  try {
    amount(-1);
  } catch (e) {
    print("Error : ${e}");
  } finally {
    print("Finally .....");
  }
}
