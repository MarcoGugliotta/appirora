import 'package:flutter/cupertino.dart';

import '../models/entry.dart';

class BudgetManager extends ChangeNotifier {
  double totalIncome = 0.0;
  double totalExpense = 0.0;

  List<Income> incomes = [];
  List<Expense> expenses = [];

  double calculateDailyBudget() {
    DateTime now = DateTime.now();
    DateTime nextMonth = DateTime(now.year, now.month + 1, 1);
    DateTime endOfMonth = nextMonth.subtract(Duration(days: 1));
    int remainingDays = endOfMonth.day - now.day + 1;
    // Calcola il budget giornaliero in base al totale delle entrate e uscite
    return (totalIncome - totalExpense) / remainingDays;
  }

  void addIncome(double amount) {
    // Aggiungi un'entrata
    totalIncome += amount;
    incomes.add(Income(amount));
    notifyListeners();
  }

  void addExpense(double amount) {
    // Aggiungi un'uscita
    totalExpense += amount;
    expenses.add(Expense(amount));
    notifyListeners();
  }
}
