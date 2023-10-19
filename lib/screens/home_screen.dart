import 'package:appirora/components/ElevatedButtonCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../budget_calculator/budget_calculator.dart';
import '../budget_calculator/budget_manager.dart';
import 'add_expense_screen.dart';
import 'add_income_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BudgetManager budgetManager = BudgetManager();
  double dailyBudget = 0.0;

  void addExpense() async {
    double newDailyBudget = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddExpenseScreen(
          budgetManager: budgetManager,
        ),
      ),
    );
    if (newDailyBudget != null) {
      setState(() {
        dailyBudget = newDailyBudget;
      });
    }
  }

  void addIncome() async {
    double newDailyBudget = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddIncomeScreen(
          budgetManager: budgetManager,
        ),
      ),
    );
    if (newDailyBudget != null) {
      setState(() {
        dailyBudget = newDailyBudget;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Appirora',
            style: TextStyle(
                fontFamily: 'TiltNeon',
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Quota giornaliera: ',
                    style: TextStyle(
                        fontFamily: 'TiltNeon',
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '\€${dailyBudget.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontFamily: 'TiltNeon',
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButtonCustom(
                    onPressed: () async {
                      addIncome();
                    },
                    title: 'Aggiungi Entrata',
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButtonCustom(
                    onPressed: () async {
                      addExpense();
                    },
                    title: 'Aggiungi Uscita',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
