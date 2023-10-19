class BudgetCalculator {
  double income = 3000.0; // Esempio di entrate fisse
  double expenses = 1500.0; // Esempio di uscite fisse

  double calculateDailyBudget() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    double dailyBudget = (income - expenses) / daysInMonth;
    return dailyBudget;
  }
}