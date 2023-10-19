class Entry {
  final double amount;
  Entry(this.amount);
}

class Income extends Entry {
  Income(double amount) : super(amount);
}

class Expense extends Entry {
  Expense(double amount) : super(amount);
}