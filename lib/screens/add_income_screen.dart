import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../budget_calculator/budget_manager.dart';

class AddIncomeScreen extends StatefulWidget {
  final BudgetManager budgetManager;

  const AddIncomeScreen({super.key, required this.budgetManager});

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final _expenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aggiungi Entrata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _expenseController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Importo Entrata'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                double income =
                    double.tryParse(_expenseController.text) ?? 0.0;
                widget.budgetManager.addIncome(income);

                // Torna alla schermata precedente e passa il nuovo budget giornaliero
                Navigator.pop(
                    context, widget.budgetManager.calculateDailyBudget());
              },
              child: Text('Aggiungi Entrata'),
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
    home: AddIncomeScreen(budgetManager: budgetManager), // Passa BudgetManager
  ));
}
