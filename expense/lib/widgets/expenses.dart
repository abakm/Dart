import 'package:expense/models/expense.dart';
import 'package:expense/widgets/cart/chart.dart';
import 'package:expense/widgets/expenses_list/expenses_list.dart';
import 'package:expense/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registered_expenses = [
    Expense(
        title: "Flutter",
        amount: 150,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Python",
        amount: 200,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _onPressedIconButton() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(addExpense: addExpenses));
  }

  void addExpenses(Expense expense) {
    setState(() {
      _registered_expenses.add(expense);
    });
  }

  void removeExpenses(Expense expense) {
    final expenseIndex = _registered_expenses.indexOf(expense);
    setState(() {
      _registered_expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Item deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registered_expenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    Widget mainContent = const Center(child: Text("No expensese found"));

    if (_registered_expenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registered_expenses, removeExpense: removeExpenses);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Expense Tracker"),
          actions: [
            IconButton(onPressed: _onPressedIconButton, icon: Icon(Icons.add))
          ],
        ),
        body: Center(
          child: SafeArea(
            child: width < 600
                ? Column(children: [
                    const SizedBox(),
                    Chart(expenses: _registered_expenses),
                    Expanded(child: mainContent)
                  ])
                : Row(children: [
                    const SizedBox(),
                    Expanded(child: Chart(expenses: _registered_expenses)),
                    Expanded(child: mainContent)
                  ]),
          ),
        ));
  }
}
