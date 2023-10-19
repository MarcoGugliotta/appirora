import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../budget_calculator/budget_manager.dart';

class AddExpenseScreen extends StatefulWidget {
  final BudgetManager budgetManager;

  const AddExpenseScreen({super.key, required this.budgetManager});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _expenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aggiungi Uscita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _expenseController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Importo Uscita'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                double expense =
                    double.tryParse(_expenseController.text) ?? 0.0;
                widget.budgetManager.addExpense(expense);

                // Torna alla schermata precedente e passa il nuovo budget giornaliero
                Navigator.pop(
                    context, widget.budgetManager.calculateDailyBudget());
              },
              child: Text('Aggiungi Uscita'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _expenseController.dispose();
    super.dispose();
  }
}

void main() {
  BudgetManager budgetManager =
      BudgetManager(); // Crea un'istanza di BudgetManager
  runApp(MaterialApp(
    home: AddExpenseScreen(budgetManager: budgetManager), // Passa BudgetManager
  ));
}
